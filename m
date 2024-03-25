Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D088A730
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 16:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ED810E381;
	Mon, 25 Mar 2024 15:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KMA9DT6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8710E046
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711381392;
 bh=+Tsfo4/9TvFXXlJL5COf/dpyFQ4PuDuOvexpOM1noj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KMA9DT6CHNqoAix8iDawgkFTOwYk1kF8SBC8yOckOuxgdxdviB7aD3R7ZGYVDKvDS
 MnCwpVQ3JsQWbZzgSChntTsySq9mcYuXhzTg8OasJTVOlKCNLx0J8tshP1yGZ3IX7m
 7TrRYL5oSudLy2v/23tkIA3n0REq7raXnVV9Uqg55/+6fJN66N2Q0TVwn3SMBkSYXl
 cSvuLiYPH5h85+ZmN0SNBRqDQkA8YeO61KkVNsbKhdZUySemXV8NdrcA6WW/pIxdyY
 5L2hfF8pl/sbLl/3tFpwIe3ricGlgeW5phDUNb4RfHsLsDitiKXkkNtV+ytUHMxmPg
 fdkzTn0NPdVNw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 50A8237813B7;
 Mon, 25 Mar 2024 15:43:11 +0000 (UTC)
Date: Mon, 25 Mar 2024 17:43:09 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 10/16] drm/vkms: Re-introduce line-per-line
 composition algorithm
Message-ID: <20240325174309.28f91bec.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-10-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-10-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UCJemmrxJ8CUfZJi0js6NRP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UCJemmrxJ8CUfZJi0js6NRP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:04 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Re-introduce a line-by-line composition algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> read. This patch is focused on readability of the code.
>=20
> Line-by-line composition was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
>=20
> This patch is almost a revert of [2], but in addition efforts have been
> made to increase readability and maintainability of the rotation handling.
> The blend function is now divided in two parts:
> - Transformation of coordinates from the output referential to the source
> referential
> - Line conversion and blending
>=20
> Most of the complexity of the rotation management is avoided by using
> drm_rect_* helpers. The remaining complexity is around the clipping, to
> avoid reading/writing outside source/destination buffers.
>=20
> The pixel conversion is now done line-by-line, so the read_pixel_t was
> replaced with read_pixel_line_t callback. This way the indirection is only
> required once per line and per plane, instead of once per pixel and per
> plane.
>=20
> The read_line_t callbacks are very similar for most pixel format, but it
> is required to avoid performance impact. Some helpers for color
> conversion were introduced to avoid code repetition:
> - *_to_argb_u16: perform colors conversion. They should be inlined by the
>   compiler, and they are used to avoid repetition between multiple varian=
ts
>   of the same format (argb/xrgb and maybe in the future for formats like
>   bgr formats).
>=20
> This new algorithm was tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations of planes)
> - kms_rotation (for all rotations and formats combinations) [3]
> The performance gain was mesured with:
> - kms_fb_stress
>=20
> [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to acce=
pt
>      new formats")
>      https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gma=
il.com/
> [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
>      functionality")
>      https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.co=
m/
> [3]:
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 167 +++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  27 ++--
>  drivers/gpu/drm/vkms/vkms_formats.c  | 236 ++++++++++++++++++++++-------=
------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
>  5 files changed, 292 insertions(+), 145 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 989bcf59f375..5d78c33dbf41 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -41,7 +41,7 @@ static void pre_mul_alpha_blend(const struct line_buffe=
r *stage_buffer,
>  				struct line_buffer *output_buffer, int x_start, int pixel_count)
>  {
>  	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> -	const struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> +	const struct pixel_argb_u16 *in =3D &stage_buffer->pixels[x_start];
> =20
>  	for (int i =3D 0; i < pixel_count; i++) {
>  		out[i].a =3D (u16)0xffff;
> @@ -51,33 +51,6 @@ static void pre_mul_alpha_blend(const struct line_buff=
er *stage_buffer,
>  	}
>  }
> =20
> -static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> -{
> -	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> -		return drm_rect_height(&frame_info->rotated) - y - 1;
> -
> -	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
> -	case DRM_MODE_ROTATE_90:
> -		return frame_info->rotated.x2 - y - 1;
> -	case DRM_MODE_ROTATE_270:
> -		return y + frame_info->rotated.x1;
> -	default:
> -		return y;
> -	}
> -}
> -
> -static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> -{
> -	if (drm_rotation_90_or_270(frame_info->rotation)) {
> -		if (pos >=3D 0 && pos < drm_rect_width(&frame_info->rotated))
> -			return true;
> -	} else {
> -		if (pos >=3D frame_info->rotated.y1 && pos < frame_info->rotated.y2)
> -			return true;
> -	}
> -
> -	return false;
> -}
> =20
>  static void fill_background(const struct pixel_argb_u16 *background_colo=
r,
>  			    struct line_buffer *output_buffer)
> @@ -215,34 +188,146 @@ static void blend(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> -	int y_pos, x_dst, x_limit;
> =20
>  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> =20
> -	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> +	int crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> +	int crtc_x_limit =3D crtc_state->base.crtc->mode.hdisplay;
> =20
>  	/*
>  	 * The planes are composed line-by-line to avoid heavy memory usage. It=
 is a necessary
>  	 * complexity to avoid poor blending performance.
>  	 *
> -	 * The function vkms_compose_row is used to read a line, pixel-by-pixel=
, into the staging
> -	 * buffer.
> +	 * The function pixel_read_line callback is used to read a line, using =
an efficient
> +	 * algorithm for a specific format, into the staging buffer.
>  	 */
>  	for (size_t y =3D 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> -			x_dst =3D plane[i]->frame_info->dst.x1;
> -			x_limit =3D min_t(size_t, drm_rect_width(&plane[i]->frame_info->dst),
> -					stage_buffer->n_pixels);
> -			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> +			struct vkms_plane_state *current_plane =3D plane[i];
> =20
> -			if (!check_limit(plane[i]->frame_info, y_pos))
> +			/* Avoid rendering useless lines */
> +			if (y < current_plane->frame_info->dst.y1 ||
> +			    y >=3D current_plane->frame_info->dst.y2)
>  				continue;
> =20
> -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, x_limit);
> +			/*
> +			 * dst_line is the line to copy. The initial coordinates are inside t=
he
> +			 * destination framebuffer, and then drm_rect_* helpers are used to
> +			 * compute the correct position into the source framebuffer.
> +			 */
> +			struct drm_rect dst_line =3D DRM_RECT_INIT(
> +				current_plane->frame_info->dst.x1, y,
> +				drm_rect_width(&current_plane->frame_info->dst), 1);
> +			struct drm_rect tmp_src;
> +
> +			drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
> +
> +			/*
> +			 * [1]: Clamping src_line to the crtc_x_limit to avoid writing outsid=
e of
> +			 * the destination buffer
> +			 */
> +			dst_line.x1 =3D max_t(int, dst_line.x1, 0);
> +			dst_line.x2 =3D min_t(int, dst_line.x2, crtc_x_limit);
> +			/* The destination is completely outside of the crtc. */
> +			if (dst_line.x2 <=3D dst_line.x1)
> +				continue;
> +
> +			struct drm_rect src_line =3D dst_line;
> +
> +			/*
> +			 * Transform the coordinate x/y from the crtc to coordinates into
> +			 * coordinates for the src buffer.
> +			 *
> +			 * - Cancel the offset of the dst buffer.
> +			 * - Invert the rotation. This assumes that
> +			 *   dst =3D drm_rect_rotate(src, rotation) (dst and src have the
> +			 *   same size, but can be rotated).
> +			 * - Apply the offset of the source rectangle to the coordinate.
> +			 */
> +			drm_rect_translate(&src_line, -current_plane->frame_info->dst.x1,
> +					   -current_plane->frame_info->dst.y1);
> +			drm_rect_rotate_inv(&src_line,
> +					    drm_rect_width(&tmp_src),
> +					    drm_rect_height(&tmp_src),
> +					    current_plane->frame_info->rotation);
> +			drm_rect_translate(&src_line, tmp_src.x1, tmp_src.y1);
> +
> +			/* Get the correct reading direction in the source buffer. */
> +
> +			enum pixel_read_direction direction =3D
> +				direction_for_rotation(current_plane->frame_info->rotation);
> +
> +			int x_start =3D src_line.x1;
> +			int y_start =3D src_line.y1;
> +			int pixel_count;
> +			/* [2]: Compute and clamp the number of pixel to read */
> +			if (direction =3D=3D READ_LEFT_TO_RIGHT || direction =3D=3D READ_RIGH=
T_TO_LEFT) {
> +				/*
> +				 * In horizontal reading, the src_line width is the number of pixel
> +				 * to read
> +				 */
> +				pixel_count =3D drm_rect_width(&src_line);
> +				if (x_start < 0) {
> +					pixel_count +=3D x_start;
> +					x_start =3D 0;
> +				}
> +				if (x_start + pixel_count > current_plane->frame_info->fb->width) {
> +					pixel_count =3D
> +						(int)current_plane->frame_info->fb->width - x_start;
> +				}
> +			} else {
> +				/*
> +				 * In vertical reading, the src_line height is the number of pixel
> +				 * to read
> +				 */
> +				pixel_count =3D drm_rect_height(&src_line);
> +				if (y_start < 0) {
> +					pixel_count +=3D y_start;
> +					y_start =3D 0;
> +				}
> +				if (y_start + pixel_count > current_plane->frame_info->fb->height) {
> +					pixel_count =3D
> +						(int)current_plane->frame_info->fb->width - y_start;
> +				}

When you are clamping x_start or y_start or pixel_count to be inside
the source FB, should you not equally adjust the destination
coordinates as well?

If we take a step back and look at the UAPI, I believe the answer is
"no", but it's in no way obvious. It results from the combination of
several facts:

- UAPI checks reject any source rectangle that extends outside of the
  source FB.

- The source rectangle stretches to fill the destination rectangle
  exactly.

- VKMS does not support stretching (scaling), so its UAPI checks reject
  any commit with source and destination rectangles of different sizes
  after accounting for rotation. (Right?)

I think this results in the clamping code being actually dead code.
However, I would not delete the clamping code, because it is a cheap
safety net in case something goes wrong.

If you agree that it's just a safety net, then maybe explain that in a
comment? If the safety net catches anything, the composition result
will be wrong anyway, so it doesn't matter to adjust the destination
rectangle to match.

When the last point is relaxed and VKMS gains scaling support, I think
it won't change the fact that the clamping remains as a safety net. It
just increases the risk of bugs that would be caught by the net.

Going outside of FB boundaries is a serious bug and deserves to be
checked. Going outside of the source rectangle would be a bug too,
assuming that partially included pixels are considered fully included,
but it's not serious enough to warrant explicit checks. Ideally IGT
would catch it.

> +			}
> +
> +			if (pixel_count <=3D 0) {
> +				/* Nothing to read, so avoid multiple function calls for nothing */
> +				continue;
> +			}
> +
> +			/*
> +			 * Modify the starting point to take in account the rotation
> +			 *
> +			 * src_line is the top-left corner, so when reading READ_RIGHT_TO_LEF=
T or
> +			 * READ_BOTTOM_TO_TOP, it must be changed to the top-right/bottom-left
> +			 * corner.
> +			 */
> +			if (direction =3D=3D READ_RIGHT_TO_LEFT) {
> +				// x_start is now the right point
> +				x_start +=3D pixel_count - 1;
> +			} else if (direction =3D=3D READ_BOTTOM_TO_TOP) {
> +				// y_start is now the bottom point
> +				y_start +=3D pixel_count - 1;
> +			}
> +
> +			/*
> +			 * Perform the conversion and the blending
> +			 *
> +			 * Here we know that the read line (x_start, y_start, pixel_count) is
> +			 * inside the source buffer [2] and we don't write outside the stage
> +			 * buffer [1]
> +			 */
> +			current_plane->pixel_read_line(
> +				current_plane, x_start, y_start, direction, pixel_count,
> +				&stage_buffer->pixels[current_plane->frame_info->dst.x1]);
> +
> +			pre_mul_alpha_blend(stage_buffer, output_buffer,
> +					    current_plane->frame_info->dst.x1,
> +					    pixel_count);
>  		}
> =20
>  		apply_lut(crtc_state, output_buffer);
> @@ -250,7 +335,7 @@ static void blend(struct vkms_writeback_job *wb,
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
>  		if (wb)
> -			vkms_writeback_row(wb, output_buffer, y_pos);
> +			vkms_writeback_row(wb, output_buffer, y);
>  	}
>  }
> =20
> @@ -261,7 +346,7 @@ static int check_format_funcs(struct vkms_crtc_state =
*crtc_state,
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> =20
>  	for (size_t i =3D 0; i < n_active_planes; i++)
> -		if (!planes[i]->pixel_read)
> +		if (!planes[i]->pixel_read_line)
>  			return -1;
> =20
>  	if (active_wb && !active_wb->pixel_write)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 985e7a92b7bc..23e1d247468d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -39,7 +39,6 @@
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> -	struct drm_rect rotated;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	unsigned int rotation;
>  };
> @@ -80,26 +79,37 @@ enum pixel_read_direction {
>  	READ_LEFT_TO_RIGHT
>  };
> =20
> +struct vkms_plane_state;
> +
>  /**
> - * typedef pixel_read_t - These functions are used to read a pixel in th=
e source frame,
> + * typedef pixel_read_line_t - These functions are used to read a pixel =
line in the source frame,
>   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
>   *
> - * @in_pixel: Pointer to the pixel to read
> - * @out_pixel: Pointer to write the converted pixel
> + * @plane: Plane used as source for the pixel value
> + * @x_start: X (width) coordinate of the first pixel to copy. The caller=
 must ensure that x_start
> + * is positive and smaller than @plane->frame_info->fb->width.
> + * @y_start: Y (width) coordinate of the first pixel to copy. The caller=
 must ensure that y_start
> + * is positive and smaller than @plane->frame_info->fb->height.

s/positive/non-negative/ because zero is valid too. At least, there is
debate whether zero is positive or not, but non-negative is clear.

> + * @direction: Direction to use for the copy, starting at @x_start/@y_st=
art
> + * @count: Number of pixels to copy
> + * @out_pixel: Pointer where to write the pixel values. They will be wri=
tten from @out_pixel[0]
> + * to @out_pixel[@count]. The caller must ensure that out_pixel have a l=
ength of at least @count.
>   */
> -typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *=
out_pixel);
> +typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, =
int x_start,
> +				  int y_start, enum pixel_read_direction direction, int count,
> +				  struct pixel_argb_u16 out_pixel[]);
> =20
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
> - * @pixel_read: function to read a pixel in this plane. The creator of a=
 vkms_plane_state must
> - * ensure that this pointer is valid
> + * @pixel_read_line: function to read a pixel line in this plane. The cr=
eator of a vkms_plane_state
> + * must ensure that this pointer is valid
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	pixel_read_t pixel_read;
> +	pixel_read_line_t pixel_read_line;
>  };
> =20
>  struct vkms_plane {
> @@ -204,7 +214,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, con=
st char *source_name,
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plan=
e_state *plane, int y);
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line=
_buffer *src_buffer, int y);
> =20
>  /* Writeback */
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 743b6fd06db5..1449a0e6c706 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -105,77 +105,45 @@ static int get_step_next_block(struct drm_framebuff=
er *fb, enum pixel_read_direc
>  	return 0;
>  }
> =20
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y,
> -				 int plane_index)
> -{
> -	int x_src =3D frame_info->src.x1 >> 16;
> -	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> -	u8 *addr;
> -	int rem_x, rem_y;
> -
> -	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x=
, &rem_y);
> -	return addr;
> -}
> -
> -static int get_x_position(const struct vkms_frame_info *frame_info, int =
limit, int x)
> -{
> -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> -		return limit - x - 1;
> -	return x;
> -}
> -
>  /*
> - * The following  functions take pixel data from the buffer and convert =
them to the format
> + * The following  functions take pixel data (a, r, g, b, pixel, ...), co=
nvert them to the format
>   * ARGB16161616 in out_pixel.
>   *
> - * They are used in the `vkms_compose_row` function to handle multiple f=
ormats.
> + * They are used in the `read_line`s functions to avoid duplicate work f=
or some pixel formats.
>   */
> =20
> -static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u=
16 *out_pixel)
> +static struct pixel_argb_u16 argb_u16_from_u8888(int a, int r, int g, in=
t b)
>  {
> +	struct pixel_argb_u16 out_pixel;
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
>  	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
>  	 * the best color value in a pixel format with more possibilities.
>  	 * A similar idea applies to others RGB color conversions.
>  	 */
> -	out_pixel->a =3D (u16)in_pixel[3] * 257;
> -	out_pixel->r =3D (u16)in_pixel[2] * 257;
> -	out_pixel->g =3D (u16)in_pixel[1] * 257;
> -	out_pixel->b =3D (u16)in_pixel[0] * 257;
> -}
> +	out_pixel.a =3D (u16)a * 257;
> +	out_pixel.r =3D (u16)r * 257;
> +	out_pixel.g =3D (u16)g * 257;
> +	out_pixel.b =3D (u16)b * 257;
> =20
> -static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u=
16 *out_pixel)
> -{
> -	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D (u16)in_pixel[2] * 257;
> -	out_pixel->g =3D (u16)in_pixel[1] * 257;
> -	out_pixel->b =3D (u16)in_pixel[0] * 257;
> +	return out_pixel;
>  }
> =20
> -static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_ar=
gb_u16 *out_pixel)
> +static struct pixel_argb_u16 argb_u16_from_u16161616(int a, int r, int g=
, int b)
>  {
> -	u16 *pixel =3D (u16 *)in_pixel;
> +	struct pixel_argb_u16 out_pixel;
> =20
> -	out_pixel->a =3D le16_to_cpu(pixel[3]);
> -	out_pixel->r =3D le16_to_cpu(pixel[2]);
> -	out_pixel->g =3D le16_to_cpu(pixel[1]);
> -	out_pixel->b =3D le16_to_cpu(pixel[0]);
> -}
> +	out_pixel.a =3D le16_to_cpu(a);
> +	out_pixel.r =3D le16_to_cpu(r);
> +	out_pixel.g =3D le16_to_cpu(g);
> +	out_pixel.b =3D le16_to_cpu(b);
> =20
> -static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_ar=
gb_u16 *out_pixel)
> -{
> -	u16 *pixel =3D (u16 *)in_pixel;
> -
> -	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D le16_to_cpu(pixel[2]);
> -	out_pixel->g =3D le16_to_cpu(pixel[1]);
> -	out_pixel->b =3D le16_to_cpu(pixel[0]);
> +	return out_pixel;
>  }
> =20
> -static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
> +static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
>  {
> -	u16 *pixel =3D (u16 *)in_pixel;
> +	struct pixel_argb_u16 out_pixel;
> =20
>  	s64 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -185,12 +153,26 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, =
struct pixel_argb_u16 *out_pi
>  	s64 fp_g =3D drm_int2fixp((rgb_565 >> 5) & 0x3f);
>  	s64 fp_b =3D drm_int2fixp(rgb_565 & 0x1f);
> =20
> -	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> -	out_pixel->g =3D drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> -	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel.a =3D (u16)0xffff;
> +	out_pixel.r =3D drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel.g =3D drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel.b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +
> +	return out_pixel;
>  }
> =20
> +/*
> + * The following functions are read_line function for each pixel format =
supported by VKMS.
> + *
> + * They read a line starting at the point @x_start,@y_start following th=
e @direction. The result
> + * is stored in @out_pixel and in the format ARGB16161616.
> + *
> + * Those function are very similar, but it is required for performance r=
eason. In the past, some
> + * experiment were done, and with a generic loop the performance are ver=
y reduced [1].

The English here feels a bit awkward. How about:

These functions are very repetitive, but the innermost pixel loops must
be kept inside these functions for performance reasons. Some
benchmarking was done in [1] where having the innermost loop factored
out of these functions showed a slowdown by a factor of three.

> + *
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f=
33b3a3@riseup.net/
> + */
> +
>  /**
>   * black_to_argb_u16() - pixel_read callback which always read black
>   *
> @@ -198,42 +180,116 @@ static void RGB565_to_argb_u16(const u8 *in_pixel,=
 struct pixel_argb_u16 *out_pi
>   * It is used to avoid null pointer to be used as a function. In theory,=
 this function should
>   * never be called, except if you found a bug in the driver/DRM core.
>   */
> +static void black_to_argb_u16(const struct vkms_plane_state *plane, int =
x_start,
> +			      int y_start, enum pixel_read_direction direction, int count,
> +			      struct pixel_argb_u16 out_pixel[])
>  {
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +
> +	while (out_pixel < end) {
> +		*out_pixel =3D argb_u16_from_u8888(255, 0, 0, 0);
> +		out_pixel +=3D 1;
> +	}
>  }
> =20
> +static void ARGB8888_read_line(const struct vkms_plane_state *plane, int=
 x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
>  {
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);
> +
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u8 *px =3D (u8 *)src_pixels;
> +		*out_pixel =3D argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +	}
> +}
> +
> +static void XRGB8888_read_line(const struct vkms_plane_state *plane, int=
 x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);
> +
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u8 *px =3D (u8 *)src_pixels;
> +		*out_pixel =3D argb_u16_from_u8888(255, px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +	}
> +}
> +
> +static void ARGB16161616_read_line(const struct vkms_plane_state *plane,=
 int x_start,
> +				   int y_start, enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);
> +
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u16 *px =3D (u16 *)src_pixels;
> +		*out_pixel =3D argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +	}
> +}
> +
> +static void XRGB16161616_read_line(const struct vkms_plane_state *plane,=
 int x_start,
> +				   int y_start, enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);
> +
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u16 *px =3D (u16 *)src_pixels;
> +		*out_pixel =3D argb_u16_from_u16161616(0xFFFF, px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +	}
> +}
> +
> +static void RGB565_read_line(const struct vkms_plane_state *plane, int x=
_start,
> +			     int y_start, enum pixel_read_direction direction, int count,
> +			     struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);
> =20
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> =20
> +	while (out_pixel < end) {
> +		u16 *px =3D (u16 *)src_pixels;
> =20
> +		*out_pixel =3D argb_u16_from_RGB565(px);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
>  	}
>  }
> =20
> @@ -343,25 +399,25 @@ void vkms_writeback_row(struct vkms_writeback_job *=
wb,
>  }
> =20
>  /**
> - * Retrieve the correct read_pixel function for a specific format.
> + * Retrieve the correct read_line function for a specific format.
>   * If the format is not supported by VKMS a warn is emitted and a dummy =
"always read black"
>   * function is returned.
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
>   */
> -pixel_read_t get_pixel_read_function(u32 format)
> +pixel_read_line_t get_pixel_read_line_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> -		return &ARGB8888_to_argb_u16;
> +		return &ARGB8888_read_line;
>  	case DRM_FORMAT_XRGB8888:
> -		return &XRGB8888_to_argb_u16;
> +		return &XRGB8888_read_line;
>  	case DRM_FORMAT_ARGB16161616:
> -		return &ARGB16161616_to_argb_u16;
> +		return &ARGB16161616_read_line;
>  	case DRM_FORMAT_XRGB16161616:
> -		return &XRGB16161616_to_argb_u16;
> +		return &XRGB16161616_read_line;
>  	case DRM_FORMAT_RGB565:
> -		return &RGB565_to_argb_u16;
> +		return &RGB565_read_line;
>  	default:
>  		/*
>  		 * This is a bug in vkms_plane_atomic_check. All the supported
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index 3ecea4563254..8d2bef95ff79 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,7 +5,7 @@
> =20
>  #include "vkms_drv.h"
> =20
> -pixel_read_t get_pixel_read_function(u32 format);
> +pixel_read_line_t get_pixel_read_line_function(u32 format);
> =20
>  pixel_write_t get_pixel_write_function(u32 format);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 10e9b23dab28..8875bed76410 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	frame_info =3D vkms_plane_state->frame_info;
>  	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>  	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> -	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
>  	frame_info->fb =3D fb;
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
>  	drm_framebuffer_get(frame_info->fb);
> @@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plan=
e *plane,
>  									  DRM_MODE_REFLECT_X |
>  									  DRM_MODE_REFLECT_Y);
> =20
> -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
> -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	vkms_plane_state->pixel_read =3D get_pixel_read_function(fmt);
> +	vkms_plane_state->pixel_read_line =3D get_pixel_read_line_function(fmt);
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20

This is looking good enough that I can give an

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/UCJemmrxJ8CUfZJi0js6NRP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBm40ACgkQI1/ltBGq
qqfhhBAAqkQ7K0dvGpPFq0Tv8Q/o9aeBlyiTkintW9hu3V2lXlLzlySrgp5G2GT6
5YkziZO80WteuszilTRbLYUk3yl8KEtKSaMj284lSEtwEQhGU8eQMXPRETnEzgCH
8d9GljgyMdRW+VPs1R1nh8VBfW0+S2JJkZii4o3FgoVLhvnNrLxwtMO6+amy0HFk
BkVgMK80UNt1ES7e/Z/URH8twh5NlYQoakh+KUv3Go3u+PS3yOyC/Ka1LmTcMwx4
qDwvH5wJ/VJBtCF4v/4gDO7DYC9U/M/MWtpYUikhgwsjnUw4iL3/ZYlNMXOMuogw
bWZ6/M6bd0R0UAEt3g/cVJ7YP+cua8S/iQOQkZufjEBTMkLA8V/2NOKJH++e+4no
mU98W199600YRzaos89vEiA9kBwcNzQgQbaaI5n7HVxPo3NeNvr/oACHmFk55h/5
pC15p+gKPFNeqafD7QqNaxQ06IZsj66BYvrSMM21SMZ/vdPZWH3dimASjeMCMpZc
jgybSQd1Y9740ageI4lg0uBgAQhDhCCpPkrvFC6128L71UNhoASUhmPZiYGdR0jQ
76rB63nALZHRsodmJ5G/qYcGn8ElvDK0rRI0AjJbEufUGSooIm0GHsPNpJ9AqZUt
UlyPiftJKfgDbvIm8mdkUTnfWx+cqVt3deAZH5EBZO6wFJmg9ac=
=qwV/
-----END PGP SIGNATURE-----

--Sig_/UCJemmrxJ8CUfZJi0js6NRP--
