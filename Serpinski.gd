extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var limit = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func serpinski(a, b, c, lim=0):
	if lim == 0:
		draw_line(a, b, Color(255, 255, 255), 2)
		draw_line(b, c, Color(255, 255, 255), 2)
		draw_line(c, a, Color(255, 255, 255), 2)	
	else:
		var d = (c - a) / 2 + a
		var e = (c - b) / 2 + b
		var f = (b - a) / 2 + a
		serpinski(a, f, d, lim - 1)
		serpinski(f, b, e, lim - 1)
		serpinski(d, e, c, lim - 1)
	

func _input(ev):
	if ev is InputEventMouseButton:
		if ev.is_pressed() and ev.button_index == BUTTON_WHEEL_UP:
			limit = clamp(limit + 1, 0, 6)
		if ev.is_pressed() and ev.button_index == BUTTON_WHEEL_DOWN:
			limit = clamp(limit - 1, 0, 3.402823e+38)
	if ev.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _draw():
	serpinski(Vector2(0.1, 0.9) * rect_size, Vector2(0.9, 0.9) * rect_size, Vector2(0.5, 0.1) * rect_size, limit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
