local _M, crequire, brequire = require("newmodule")(...)

local Input = brequire("input")

local input = Input()

local function update(dt)
	-- input call must come after everything
	-- or pressed/released on update won't work
	input:update(dt)
end

local function keypressed(key)			input:keypressed(key)			end
local function keyreleased(key)			input:keyreleased(key)			end
local function mousepressed(x, y, button)	input:mousepressed(button)		end
local function mousereleased(x, y, button)	input:mousereleased(button)		end
local function gamepadpressed(jstick, button)	input:gamepadpressed(jstick, button)	end
local function gamepadreleased(jstick, button)	input:gamepadreleased(jstick, button)	end
local function gamepadaxis(jstick, axis, value)	input:gamepadaxis(jstick, axis, value)	end

local _M = {}

_M.__love = {
	default = {
		load = load,
		keypressed = keypressed,
		keyreleased = keyreleased,
		mousepressed = mousepressed,
		mousereleased = mousereleased,
		gamepadpressed = gamepadpressed,
		gamepadreleased = gamepadreleased,
		gamepadaxis = gamepadaxis,
	},
	post = {
		update = update,
	},
}

_M.input = input

return setmetatable(_M, {__call = function(_, ...) return input end})
