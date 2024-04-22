Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D88ACCD8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 14:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9B510F5BE;
	Mon, 22 Apr 2024 12:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kSU+FA4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E709110F5BE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713789530;
 bh=nhNAIh9ppOux+wOGZO4AEWFlQdmQdGsbZ0mpp6/gr2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kSU+FA4YjRIEQQrfC8dUpaIvncD3lPoWUnNCB8tFjlsbAt3BsNkFA+WelK5DSAQiM
 SMgy6vbV6t4cToyb9cVKxu4CBTs7+1yxtsGgAD55rDOidSlRbiG/GHQA6D3/WZBJbj
 6jrSmgqCm6K+7XwtQZZsmYotw4CM/5XqJvSXkMMfEL09X+AgA03nwk/HTO6GHIT+Ld
 ie9qBiNWNnL1k61/6PUBQV66qJsPQMW/KcGseftPEivdYdwUnt8o9ku+KLnVCwcsY3
 Ho19aQLcQUK7icsJzPEti+/qafG+UFU1BrIhrAHkNq8FSK48d3Z5Txm+ctUd+cE3Gs
 0mQ3PHL/Nfuqg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 37D3E37820C2;
 Mon, 22 Apr 2024 12:38:49 +0000 (UTC)
Date: Mon, 22 Apr 2024 15:38:47 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 10/17] drm/vkms: Re-introduce line-per-line
 composition algorithm
Message-ID: <20240422153847.45e530f2.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-10-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-10-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ENTKy7xO7F0.94NxWTCKk+m";
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

--Sig_/ENTKy7xO7F0.94NxWTCKk+m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:28 +0200
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

Hi Louis,

the performance numbers you got should be mentioned here in the commit
message, the before and after this patch. It would also be good to
mention the git sha1 of the kms_fb_stress test version, since the test
probably changes over time.


> [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to acce=
pt
>      new formats")
>      https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gma=
il.com/
> [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
>      functionality")
>      https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.co=
m/
> [3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5ca=
e59@bootlin.com/
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 230 ++++++++++++++++++++++++++---=
----
>  drivers/gpu/drm/vkms/vkms_drv.h      |  27 ++--
>  drivers/gpu/drm/vkms/vkms_formats.c  | 240 +++++++++++++++++++++--------=
------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
>  5 files changed, 347 insertions(+), 157 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 7c2e328c9510..8c8a3c629485 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -29,8 +29,8 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 =
alpha)
>   * @x_start: The start offset
>   * @pixel_count: The number of pixels to blend
>   *
> - * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@=
x_start+@pixel_count in
> - * output_buffer.
> + * The pixels @x_start..@x_start+@pixel_count in stage_buffer are blende=
d at
> + * @x_start..@x_start+@pixel_count in output_buffer.
>   *
>   * The current DRM assumption is that pixel color values have been alrea=
dy
>   * pre-multiplied with the alpha channel values. See more
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
> @@ -201,6 +174,180 @@ static enum pixel_read_direction direction_for_rota=
tion(unsigned int rotation)
>  	return READ_LEFT_TO_RIGHT;
>  }
> =20
> +/**
> + * clamp_line_coordinates() - Compute and clamp the coordinate to read a=
nd write during the blend
> + * process.
> + *
> + * @direction: direction of the reading
> + * @current_plane: current plane blended
> + * @src_line: source line of the reading

It looks to me like the src_line rectangle must have been constructed
with 'direction' already accounted for. Am I correct in assuming that
even then, the width and height are always positive, meaning that the
rect x1,y1,x2,y2 have been adjusted to keep width,height positive
regardless of direction?

This would be good to document.

> + * @dst: destination rectangle

There is no 'dst'.

> + * @src_x_start: final x start coordinate for the line reading
> + * @src_y_start: final y start coordinate for the line reading
> + * @dst_x_start: final x coordinate to blend the read line

What does "final" mean? Usually the final one is the last one, but
these are start coordinates, so...?

Maybe just drop "final"?

> + * @pixel_count: number of pixel to blend

pixels

> + *
> + * This function is mainly a safety net to avoid reading outside the sou=
rce buffer. As the
> + * userspace should never ask to read outside the source plane, all the =
cases covered here should
> + * be dead code.
> + */
> +static void clamp_line_coordinates(enum pixel_read_direction direction,
> +				   const struct vkms_plane_state *current_plane,
> +				   const struct drm_rect *src_line, int *src_x_start,
> +				   int *src_y_start, int *dst_x_start, int *pixel_count)
> +{
> +	/* By default the start points are correct */
> +	*src_x_start =3D src_line->x1;
> +	*src_y_start =3D src_line->y1;
> +	*dst_x_start =3D current_plane->frame_info->dst.x1;
> +
> +	/* Get the correct number of pixel to blend, it depends of the directio=
n */
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +	case READ_RIGHT_TO_LEFT:
> +		*pixel_count =3D drm_rect_width(src_line);
> +		break;
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		*pixel_count =3D drm_rect_height(src_line);
> +		break;
> +	}
> +
> +	/*
> +	 * Clamp the coordinates to avoid reading outside the buffer
> +	 *
> +	 * This is mainly a security to avoid reading outside the buffer, the u=
serspace should
> +	 * never request to read outside the source buffer.
> +	 */
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +	case READ_RIGHT_TO_LEFT:
> +		if (*src_x_start < 0) {
> +			*pixel_count +=3D *src_x_start;
> +			*dst_x_start -=3D *src_x_start;
> +			*src_x_start =3D 0;
> +		}
> +		if (*src_x_start + *pixel_count > current_plane->frame_info->fb->width)
> +			*pixel_count =3D (int)current_plane->frame_info->fb->width - *src_x_s=
tart;

What if *src_x_start >=3D fb->width?

> +		break;
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		if (*src_y_start < 0) {
> +			*pixel_count +=3D *src_y_start;
> +			*dst_x_start -=3D *src_y_start;
> +			*src_y_start =3D 0;
> +		}
> +		if (*src_y_start + *pixel_count > current_plane->frame_info->fb->heigh=
t)
> +			*pixel_count =3D (int)current_plane->frame_info->fb->height - *src_y_=
start;

What if *src_y_start >=3D fb->height?

> +		break;
> +	}
> +}
> +
> +/**
> + * blend_line() - Blend a line from a plane to the output buffer
> + *
> + * @current_plane: current plane to work on
> + * @y: line to write in the output buffer
> + * @crtc_x_limit: width of the output buffer
> + * @stage_buffer: temporary buffer to convert the pixel line from the so=
urce buffer
> + * @output_buffer: buffer to blend the read line.

*buffer to blend the read line into.

> + */
> +static void blend_line(struct vkms_plane_state *current_plane, int y,
> +		       int crtc_x_limit, struct line_buffer *stage_buffer,
> +		       struct line_buffer *output_buffer)
> +{
> +	int src_x_start, src_y_start, dst_x_start, pixel_count;
> +	struct drm_rect dst_line, tmp_src, src_line;
> +
> +	/* Avoid rendering useless lines */
> +	if (y < current_plane->frame_info->dst.y1 ||
> +	    y >=3D current_plane->frame_info->dst.y2)
> +		return;
> +
> +	/*
> +	 * dst_line is the line to copy. The initial coordinates are inside the
> +	 * destination framebuffer, and then drm_rect_* helpers are used to
> +	 * compute the correct position into the source framebuffer.
> +	 */
> +	dst_line =3D DRM_RECT_INIT(current_plane->frame_info->dst.x1, y,
> +						 drm_rect_width(&current_plane->frame_info->dst),
> +						 1);

Odd looking indentation here.

> +
> +	drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
> +
> +	/*
> +	 * [1]: Clamping src_line to the crtc_x_limit to avoid writing outside =
of
> +	 * the destination buffer
> +	 */
> +	dst_line.x1 =3D max_t(int, dst_line.x1, 0);
> +	dst_line.x2 =3D min_t(int, dst_line.x2, crtc_x_limit);
> +	/* The destination is completely outside of the crtc. */
> +	if (dst_line.x2 <=3D dst_line.x1)
> +		return;
> +
> +	src_line =3D dst_line;
> +
> +	/*
> +	 * Transform the coordinate x/y from the crtc to coordinates into
> +	 * coordinates for the src buffer.
> +	 *
> +	 * - Cancel the offset of the dst buffer.
> +	 * - Invert the rotation. This assumes that
> +	 *   dst =3D drm_rect_rotate(src, rotation) (dst and src have the
> +	 *   same size, but can be rotated).
> +	 * - Apply the offset of the source rectangle to the coordinate.
> +	 */
> +	drm_rect_translate(&src_line, -current_plane->frame_info->dst.x1,
> +			   -current_plane->frame_info->dst.y1);
> +	drm_rect_rotate_inv(&src_line, drm_rect_width(&tmp_src),
> +			    drm_rect_height(&tmp_src),
> +			    current_plane->frame_info->rotation);
> +	drm_rect_translate(&src_line, tmp_src.x1, tmp_src.y1);
> +
> +	/* Get the correct reading direction in the source buffer. */
> +
> +	enum pixel_read_direction direction =3D
> +		direction_for_rotation(current_plane->frame_info->rotation);
> +
> +	/* [2]: Compute and clamp the number of pixel to read */
> +	clamp_line_coordinates(direction, current_plane, &src_line, &src_x_star=
t, &src_y_start,
> +			       &dst_x_start, &pixel_count);
> +
> +	if (pixel_count <=3D 0) {
> +		/* Nothing to read, so avoid multiple function calls */
> +		return;
> +	}
> +
> +	/*
> +	 * Modify the starting point to take in account the rotation
> +	 *
> +	 * src_line is the top-left corner, so when reading READ_RIGHT_TO_LEFT =
or
> +	 * READ_BOTTOM_TO_TOP, it must be changed to the top-right/bottom-left
> +	 * corner.
> +	 */
> +	if (direction =3D=3D READ_RIGHT_TO_LEFT) {
> +		// src_x_start is now the right point
> +		src_x_start +=3D pixel_count - 1;
> +	} else if (direction =3D=3D READ_BOTTOM_TO_TOP) {
> +		// src_y_start is now the bottom point
> +		src_y_start +=3D pixel_count - 1;
> +	}
> +
> +	/*
> +	 * Perform the conversion and the blending
> +	 *
> +	 * Here we know that the read line (x_start, y_start, pixel_count) is
> +	 * inside the source buffer [2] and we don't write outside the stage
> +	 * buffer [1].
> +	 */
> +	current_plane->pixel_read_line(
> +		current_plane, src_x_start, src_y_start, direction, pixel_count,
> +		&stage_buffer->pixels[dst_x_start]);
> +
> +	pre_mul_alpha_blend(stage_buffer, output_buffer,
> +			    dst_x_start, pixel_count);
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> @@ -221,34 +368,25 @@ static void blend(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> -	int y_pos, x_dst, pixel_count;
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

Is there no warning about signed vs. unsigned comparison?

I expected y to be int.

>  		fill_background(&background_color, output_buffer);
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> -			x_dst =3D plane[i]->frame_info->dst.x1;
> -			pixel_count =3D min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
> -					    (int)stage_buffer->n_pixels);
> -			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> -
> -			if (!check_limit(plane[i]->frame_info, y_pos))
> -				continue;
> -
> -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
> +			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
>  		}
> =20
>  		apply_lut(crtc_state, output_buffer);
> @@ -256,7 +394,7 @@ static void blend(struct vkms_writeback_job *wb,
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
>  		if (wb)
> -			vkms_writeback_row(wb, output_buffer, y_pos);
> +			vkms_writeback_row(wb, output_buffer, y);
>  	}
>  }
> =20
> @@ -267,7 +405,7 @@ static int check_format_funcs(struct vkms_crtc_state =
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
> index 16317b063c20..a62a11e67ab1 100644
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
> - * @in_pixel: pointer to the pixel to read
> - * @out_pixel: pointer to write the converted pixel
> + * @plane: plane used as source for the pixel value
> + * @x_start: X (width) coordinate of the first pixel to copy. The caller=
 must ensure that x_start
> + * is non-negative and smaller than @plane->frame_info->fb->width.
> + * @y_start: Y (width) coordinate of the first pixel to copy. The caller=
 must ensure that y_start

I suppose "width" should be "height"?

> + * is non-negative and smaller than @plane->frame_info->fb->height.
> + * @direction: direction to use for the copy, starting at @x_start/@y_st=
art
> + * @count: number of pixels to copy
> + * @out_pixel: pointer where to write the pixel values. They will be wri=
tten from @out_pixel[0]
> + * to @out_pixel[@count]. The caller must ensure that out_pixel have a l=
ength of at least @count.

For some reason I intuitively read @out_pixel[@count] as inclusive
while it must be exclusive. Should it be @out_pixel[@count - 1], or how
to avoid the misunderstanding? Is it just me?

>   */
> -typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *=
out_pixel);
> +typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, =
int x_start,
> +				  int y_start, enum pixel_read_direction direction, int count,
> +				  struct pixel_argb_u16 out_pixel[]);
> =20
>  /**
>   * struct vkms_plane_state - Driver specific plane state
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
> index f76944874fe7..302c7f3ea54c 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -134,83 +134,45 @@ static void packed_pixels_addr_1x1(const struct vkm=
s_frame_info *frame_info,
>  	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
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
> -	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format, plane_ind=
ex) !=3D 1,
> -		  "%s() only support formats with block_w =3D=3D 1", __func__);
> -	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format, plane_in=
dex) !=3D 1,
> -		  "%s() only support formats with block_h =3D=3D 1", __func__);
> -
> -	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x=
, &rem_y);
> -
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
> - * The following functions take pixel data from the buffer and convert t=
hem to the format
> - * ARGB16161616 in out_pixel.
> + * The following functions take pixel data (a, r, g, b, pixel, ...) and =
convert them to
> + * &struct pixel_argb_u16
>   *
> - * They are used in the vkms_compose_row() function to handle multiple f=
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
> -
> -	out_pixel->a =3D le16_to_cpu(pixel[3]);
> -	out_pixel->r =3D le16_to_cpu(pixel[2]);
> -	out_pixel->g =3D le16_to_cpu(pixel[1]);
> -	out_pixel->b =3D le16_to_cpu(pixel[0]);
> -}
> +	struct pixel_argb_u16 out_pixel;
> =20
> -static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_ar=
gb_u16 *out_pixel)
> -{
> -	u16 *pixel =3D (u16 *)in_pixel;
> +	out_pixel.a =3D le16_to_cpu(a);
> +	out_pixel.r =3D le16_to_cpu(r);
> +	out_pixel.g =3D le16_to_cpu(g);
> +	out_pixel.b =3D le16_to_cpu(b);
> =20
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
> @@ -220,12 +182,27 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, =
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

Btw. it just occurred to me that DRM_FORMAT_* are always little-endian.
ARGB16161616 could be mistaken as little-endian too, when
pixel_argb_u16 is actually CPU-endian.

This patch looks good otherwise.


Thanks,
pq

> + *
> + * These functions are very repetitive, but the innermost pixel loops mu=
st be kept inside these
> + * functions for performance reasons. Some benchmarking was done in [1] =
where having the innermost
> + * loop factored out of these functions showed a slowdown by a factor of=
 three.
> + *
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f=
33b3a3@riseup.net/
> + */
> +
>  /**
>   * magenta_to_argb_u16() - pixel_read callback which always read magenta
>   *
> @@ -233,42 +210,111 @@ static void RGB565_to_argb_u16(const u8 *in_pixel,=
 struct pixel_argb_u16 *out_pi
>   * It is used to avoid null pointer to be used as a function. In theory,=
 this function should
>   * never be called, except if you found a bug in the driver/DRM core.
>   */
> -static void magenta_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u1=
6 *out_pixel)
> +static void magenta_to_argb_u16(const struct vkms_plane_state *plane, in=
t x_start,
> +			      int y_start, enum pixel_read_direction direction, int count,
> +			      struct pixel_argb_u16 out_pixel[])
>  {
> -	out_pixel->a =3D (u16)0xFFFF;
> -	out_pixel->r =3D (u16)0xFFFF;
> -	out_pixel->g =3D 0;
> -	out_pixel->b =3D (u16)0xFFFF;
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +
> +	while (out_pixel < end) {
> +		*out_pixel =3D argb_u16_from_u8888(255, 255, 0, 255);
> +		out_pixel +=3D 1;
> +	}
>  }
> =20
> -/**
> - * vkms_compose_row - compose a single row of a plane
> - * @stage_buffer: output line with the composed pixels
> - * @plane: state of the plane that is being composed
> - * @y: y coordinate of the row
> - *
> - * This function composes a single row of a plane. It gets the source pi=
xels
> - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> - * through the source pixel, reading the pixels and converting it to
> - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotat=
e-270,
> - * the source pixels are not traversed linearly. The source pixels are q=
ueried
> - * on each iteration in order to traverse the pixels vertically.
> - */
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plan=
e_state *plane, int y)
> +static void ARGB8888_read_line(const struct vkms_plane_state *plane, int=
 x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pix=
els);
> +
> +	int step =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
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
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pix=
els);
> +
> +	int step =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
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
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pix=
els);
> +
> +	int step =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
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
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pix=
els);
> +
> +	int step =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
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
>  {
> -	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> -	struct vkms_frame_info *frame_info =3D plane->frame_info;
> -	u8 *src_pixels =3D get_packed_src_addr(frame_info, y, 0);
> -	int limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), stage_buf=
fer->n_pixels);
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pix=
els);
> =20
> -	for (size_t x =3D 0; x < limit; x++, src_pixels +=3D frame_info->fb->fo=
rmat->cpp[0]) {
> -		int x_pos =3D get_x_position(frame_info, limit, x);
> +	int step =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
> =20
> -		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels =3D get_packed_src_addr(frame_info, x + frame_info->rotate=
d.y1, 0)
> -				+ frame_info->fb->format->cpp[0] * y;
> +	while (out_pixel < end) {
> +		u16 *px =3D (u16 *)src_pixels;
> =20
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +		*out_pixel =3D argb_u16_from_RGB565(px);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
>  	}
>  }
> =20
> @@ -378,7 +424,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  }
> =20
>  /**
> - * get_pixel_conversion_function() - Retrieve the correct read_pixel fun=
ction for a specific
> + * get_pixel_read_function() - Retrieve the correct read_line function f=
or a specific
>   * format.
>   *
>   * If the format is not supported by VKMS a warning is emitted and a dum=
my "always read magenta"
> @@ -386,19 +432,19 @@ void vkms_writeback_row(struct vkms_writeback_job *=
wb,
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
>  		 * This is a bug in vkms_plane_atomic_check(). All the supported
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


--Sig_/ENTKy7xO7F0.94NxWTCKk+m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmWlcACgkQI1/ltBGq
qqdz/w/9E2iv2puEOLuPVwjB1pPm2953DseVupn4Xvtew7iIP1lML/uH6aYX2KxU
Nnn2mEx5VvtJbxuDv8i4aw0HsUkxEpINPH/VQHQwXdIUX1gdnqc44p4iXDeZjZyX
h/7wEswSY3TTsafdhgcJQZlQRiZNdpZYyyQqhBtgklvSlre3odiMGs+A6BcvViNi
28NEczoihEj5LtLXoJeJpKm6L4a46Sq0j3elNPekoj+FLZXWuPZKOquN1MIhn5HH
gVu1zNdhjhEsEPvpOoAb7enOTZOmoFgE41eDVXB+hnhs/AJedgfnnMlIiyPbeoT0
Cm/yrOp+49P6lpv1DlCg3oTSiomwbLFbziYCTCwaaxVekdfICl3QkPvJupEKEEWw
p5WWJc5IRdB/l4uL2uu/hVceKKu5mHJWZGEkpg9L8xBCddcP2IQFdWg1iGfAhu8e
I2CeM8qjInnB/yUp+yxKy6ihISIIt50o3s3fxESRLuPr8/IqZzpH37kEKnmUo3nC
12Sk85jQgA11qrSyOUYso1HS2x252fnS92m0MOOE75PdsyThplCFA0qkDul6Th7a
8gSkFbDxQDQJGuzGm64bNxm9CpDoJqk7moPv+6IfpYLgfyiUXjW0jxs08TvYluoe
j4hn4snNrN9unLPPIi3PFT4GYaGU46kkr0uqP62BhYK3/dlcjcQ=
=UNNn
-----END PGP SIGNATURE-----

--Sig_/ENTKy7xO7F0.94NxWTCKk+m--
