Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CE86734A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDCF10F0C3;
	Mon, 26 Feb 2024 11:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fYGHyvrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008B10F0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708947428;
 bh=tCeBGHBdbXoNj/CmKNUfNK+dgAfncJYw1O69XVoazSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fYGHyvrmI93OAgWrfD7yqNCGG54yuP/FYpfIjEtpZ1qVcdtLpBY4uaPrx0NMgmMsL
 zu1DBZn/4tYfVDC6tgt5l85jPkXI4nxtiwDlvIk8lFVLns2lG9jMa6vECUCJ1aEc3u
 l0JQ8oVvoGDAl8FEJfPQZtoyp62/4pl/6rk5B+GXWc07O3UBn019VY3QPgIXo+ReCx
 yljRouAmjSD6ioccCzzw4/2bTQv8mZOJi6FrkpjBXJjWorygk8qMjv8GZFi2guEYXC
 olcjYVO6+iC8cvKvu0zQ3MQN8pnDMvIMg7WvszGSH/b9QmoTN5gfgLJiV21EDVvq7U
 KyKxzVHhCXJBg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DFB437814B0;
 Mon, 26 Feb 2024 11:37:07 +0000 (UTC)
Date: Mon, 26 Feb 2024 13:37:06 +0200
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
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 5/9] drm/vkms: Re-introduce line-per-line composition
 algorithm
Message-ID: <20240226133706.281deb59.pekka.paalanen@collabora.com>
In-Reply-To: <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/boaz5c2MeD7wVb.CYwPeamq";
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

--Sig_/boaz5c2MeD7wVb.CYwPeamq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Feb 2024 12:37:25 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Re-introduce a line-by-line composition algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> read. This patch is focussed on readability of the code.
>=20
> Line-by-line composition was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
>=20
> This patch is almost a revert of [2], but in addition efforts have been
> made to increase readability and maintenability of the rotation handling.
> The blend function is now divided in two parts:
> - Transformation of coordinates from the output referential to the source
> referential
> - Line conversion and blending
>=20
> Most of the complexity of the rotation management is avoided by using
> drm_rect_* helpers. The remaning complexity is around the clipping, to
> avoid reading/writing oudside source/destination buffers.
>=20
> The pixel conversion is now done line-by-line, so the read_pixel_t was
> replaced with read_pixel_line_t callback. This way the indirection is only
> required once per line and per plane, instead of once per pixel and per
> plane.
>=20
> The read_line_t callbacks are very similar for most pixel format, but it
> is required to avoid performance impact. Some helpers were created to
> avoid code repetition:
> - get_step_1x1: get the step in byte to reach next pixel block in a
>   certain direction
> - *_to_argb_u16: helpers to perform colors conversion. They should be
>   inlined by the compiler, and they are used to avoid repetition between
>   multiple variants of the same format (argb/xrgb and maybe in the
>   future for formats like bgr formats).
>=20
> This new algorithm was tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations of planes)
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
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 219 +++++++++++++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  25 +++-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 253 ++++++++++++++++++++++-------=
------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |   8 +-
>  5 files changed, 350 insertions(+), 157 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 5b341222d239..e555bf9c1aee 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -24,9 +24,10 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16=
 alpha)
> =20
>  /**
>   * pre_mul_alpha_blend - alpha blending equation
> - * @frame_info: Source framebuffer's metadata
>   * @stage_buffer: The line with the pixels from src_plane
>   * @output_buffer: A line buffer that receives all the blends output
> + * @x_start: The start offset to avoid useless copy
> + * @count: The number of byte to copy
>   *
>   * Using the information from the `frame_info`, this blends only the
>   * necessary pixels from the `stage_buffer` to the `output_buffer`
> @@ -37,51 +38,23 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u1=
6 alpha)
>   * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>   * completely opaque background.
>   */
> -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> -				struct line_buffer *stage_buffer,
> -				struct line_buffer *output_buffer)
> +static void pre_mul_alpha_blend(
> +	struct line_buffer *stage_buffer,
> +	struct line_buffer *output_buffer,
> +	int x_start,
> +	int pixel_count)
>  {
> -	int x_dst =3D frame_info->dst.x1;
> -	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> -	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (int x =3D 0; x < x_limit; x++) {
> -		out[x].a =3D (u16)0xffff;
> -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> +	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> +	struct pixel_argb_u16 *in =3D &stage_buffer->pixels[x_start];

Input buffers and pointers should be const.

> +
> +	for (int i =3D 0; i < pixel_count; i++) {
> +		out[i].a =3D (u16)0xffff;
> +		out[i].r =3D pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> +		out[i].g =3D pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> +		out[i].b =3D pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
>  	}
>  }

Somehow the hunk above does not feel like it is part of "re-introduce
line-per-line composition algorithm". This function was already running
line-by-line. Would it be easy enough to collect this and directly
related changes into a separate patch?

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
> @@ -163,6 +136,37 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +/**
> + * direction_for_rotation() - Helper to get the correct reading directio=
n for a specific rotation
> + *
> + * @rotation: rotation to analyze

This is KMS plane rotation property, right?

So the KMS plane has been rotated by this, and what we want to find is
the read direction on the attached FB so that reading returns pixels in
the CRTC line/scanout order, right?

Maybe extend the doc to explain that.

> + */
> +enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> +{
> +	if (rotation & DRM_MODE_ROTATE_0) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_LEFT;
> +		else
> +			return READ_RIGHT;
> +	} else if (rotation & DRM_MODE_ROTATE_90) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_UP;
> +		else
> +			return READ_DOWN;
> +	} else if (rotation & DRM_MODE_ROTATE_180) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_RIGHT;
> +		else
> +			return READ_LEFT;
> +	} else if (rotation & DRM_MODE_ROTATE_270) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_DOWN;
> +		else
> +			return READ_UP;
> +	}
> +	return READ_RIGHT;
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> @@ -183,11 +187,11 @@ static void blend(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> -	int y_pos;
> =20
>  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> =20
>  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> +	size_t crtc_x_limit =3D crtc_state->base.crtc->mode.hdisplay;

Wonder why these were size_t, causing needs to cast below...

> =20
>  	/*
>  	 * The planes are composed line-by-line. It is a necessary complexity t=
o avoid poor
> @@ -198,22 +202,133 @@ static void blend(struct vkms_writeback_job *wb,
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> -			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> +			struct vkms_plane_state *current_plane =3D plane[i];
> =20
> -			if (!check_limit(plane[i]->frame_info, y_pos))
> +			/* Avoid rendering useless lines */
> +			if (y < current_plane->frame_info->dst.y1 ||
> +			    y >=3D current_plane->frame_info->dst.y2) {
>  				continue;
> -
> -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> -					    output_buffer);
> +			}
> +
> +			/*
> +			 * src_px is the line to copy. The initial coordinates are inside the
> +			 * destination framebuffer, and then drm_rect_* helpers are used to
> +			 * compute the correct position into the source framebuffer.
> +			 */
> +			struct drm_rect src_px =3D DRM_RECT_INIT(
> +				current_plane->frame_info->dst.x1, y,
> +				drm_rect_width(&current_plane->frame_info->dst), 1);
> +			struct drm_rect tmp_src;
> +
> +			drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
> +
> +			/*
> +			 * [1]: Clamping src_px to the crtc_x_limit to avoid writing outside =
of the
> +			 * destination buffer
> +			 */
> +			src_px.x2 =3D min_t(int, src_px.x2, (int)crtc_x_limit);

Up to and including this point, it would be better if src_px was called
dst_px, because only the below computation converts it into actual
src_px.

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
> +			drm_rect_translate(&src_px, -current_plane->frame_info->dst.x1,
> +					   -current_plane->frame_info->dst.y1);
> +			drm_rect_rotate_inv(&src_px,
> +					    drm_rect_width(&tmp_src),
> +					    drm_rect_height(&tmp_src),
> +					    current_plane->frame_info->rotation);
> +			drm_rect_translate(&src_px, tmp_src.x1, tmp_src.y1);
> +
> +			/* Get the correct reading direction in the source buffer. */
> +
> +			enum pixel_read_direction direction =3D
> +				direction_for_rotation(current_plane->frame_info->rotation);
> +
> +			int x_start =3D src_px.x1;
> +			int y_start =3D src_px.y1;
> +			int pixel_count;
> +			/* [2]: Compute and clamp the number of pixel to read */
> +			if (direction =3D=3D READ_RIGHT || direction =3D=3D READ_LEFT) {
> +				/*
> +				 * In horizontal reading, the src_px width is the number of pixel to
> +				 * read
> +				 */
> +				pixel_count =3D drm_rect_width(&src_px);
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
> +				 * In vertical reading, the src_px height is the number of pixel to
> +				 * read
> +				 */
> +				pixel_count =3D drm_rect_height(&src_px);
> +				if (y_start < 0) {
> +					pixel_count +=3D y_start;
> +					y_start =3D 0;
> +				}
> +				if (y_start + pixel_count > current_plane->frame_info->fb->height) {
> +					pixel_count =3D
> +						(int)current_plane->frame_info->fb->width - y_start;
> +				}
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
> +			 * src_px is the top-left corner, so when reading READ_LEFT or READ_T=
OP, it
> +			 * must be changed to the top-right/bottom-left corner.
> +			 */
> +			if (direction =3D=3D READ_LEFT) {
> +				// x_start is now the right point
> +				x_start +=3D pixel_count - 1;
> +			} else if (direction =3D=3D READ_UP) {
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
> +				current_plane->frame_info,
> +				x_start,
> +				y_start,
> +				direction,
> +				pixel_count,
> +				&stage_buffer->pixels[current_plane->frame_info->dst.x1]);
> +
> +			pre_mul_alpha_blend(stage_buffer, output_buffer,
> +					    current_plane->frame_info->dst.x1,
> +					    pixel_count);
>  		}

I stared at the above algorithm for a while, and I couldn't find
anything obviously wrong, so good work.

> =20
>  		apply_lut(crtc_state, output_buffer);
> =20
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> -
>  		if (wb)
> -			vkms_writeback_row(wb, output_buffer, y_pos);
> +			vkms_writeback_row(wb, output_buffer, y);
>  	}
>  }
> =20
> @@ -224,7 +339,7 @@ static int check_format_funcs(struct vkms_crtc_state =
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
> index 886c885c8cf5..ccc5be009f15 100644
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
> @@ -69,14 +68,27 @@ struct vkms_writeback_job {
>  	pixel_write_t pixel_write;
>  };
> =20
> +enum pixel_read_direction {
> +	READ_UP,
> +	READ_DOWN,
> +	READ_LEFT,
> +	READ_RIGHT

When I saw these in code, I got a little confused. Does READ_LEFT mean
read towards left, or read starting from left? It's very common to
express reading directions as left-to-right and right-to-left rather
than "left arrow".

There are many choices how to improve this, e.g. upward, leftward,
right-to-left, positive-x, negative-y.

> +};
> +
>  /**
> - * typedef pixel_read_t - These functions are used to read a pixel in th=
e source frame,
> +<<<<<<< HEAD
> + * typedef pixel_read_line_t - These functions are used to read a pixel =
line in the source frame,
>   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
>   *
> - * @src_pixels: Pointer to the pixel to read
> - * @out_pixel: Pointer to write the converted pixel
> + * @frame_info: Frame used as source for the pixel value
> + * @y: Y (height) coordinate in the source buffer
> + * @x_start: X (width) coordinate of the first pixel to copy
> + * @x_end: X (width) coordinate of the last pixel to copy
> + * @out_pixel: Pointer where to write the pixel value. Pixels will be wr=
itten between x_start and
> + *  x_end.
>   */
> -typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_=
pixel);
> +typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, in=
t x_start, int y_start, enum

const frame_info I presume.


> +	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pi=
xel[]);
> =20
>  /**
>   * vkms_plane_state - Driver specific plane state
> @@ -88,7 +100,7 @@ typedef void (*pixel_read_t)(u8 *src_pixels, struct pi=
xel_argb_u16 *out_pixel);
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	pixel_read_t pixel_read;
> +	pixel_read_line_t pixel_read_line;
>  };
> =20
>  struct vkms_plane {
> @@ -193,7 +205,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, con=
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
> index 1f5aeba57ad6..46daea6d3ee9 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,21 +11,29 @@
> =20
>  /**
>   * packed_pixels_offset() - Get the offset of the block containing the p=
ixel at coordinates x/y
> - * in the first plane
>   *
>   * @frame_info: Buffer metadata
>   * @x: The x coordinate of the wanted pixel in the buffer
>   * @y: The y coordinate of the wanted pixel in the buffer
> + * @plane_index: The index of the plane to use
>   *
>   * The caller must be aware that this offset is not always a pointer to =
a pixel. If individual
>   * pixel values are needed, they have to be extracted from the resulting=
 block.
>   */
> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y)
> +static size_t packed_pixels_offset(const struct vkms_frame_info *frame_i=
nfo, int x, int y,
> +				   size_t plane_index)
>  {
>  	struct drm_framebuffer *fb =3D frame_info->fb;
> -
> -	return fb->offsets[0] + (y * fb->pitches[0])
> -			      + (x * fb->format->cpp[0]);
> +	const struct drm_format_info *format =3D frame_info->fb->format;
> +	/* Directly using x and y to multiply pitches and format->ccp is not su=
fficient because
> +	 * in some formats a block can represent multiple pixels.
> +	 *
> +	 * Dividing x and y by the block size allows to extract the correct off=
set of the block
> +	 * containing the pixel.
> +	 */
> +	return fb->offsets[plane_index] +
> +	       (y / drm_format_info_block_width(format, plane_index)) * fb->pit=
ches[plane_index] +
> +	       (x / drm_format_info_block_height(format, plane_index)) * format=
->char_per_block[plane_index];

These changes do not seem like they belong with "re-introduce
line-per-line composition algorithm" but some other patch.


>  }
> =20
>  /**
> @@ -35,44 +43,56 @@ static size_t pixel_offset(const struct vkms_frame_in=
fo *frame_info, int x, int
>   * @frame_info: Buffer metadata
>   * @x: The x(width) coordinate inside the plane
>   * @y: The y(height) coordinate inside the plane
> + * @plane_index: The index of the plane
>   *
> - * Takes the information stored in the frame_info, a pair of coordinates=
, and
> - * returns the address of the first color channel.
> - * This function assumes the channels are packed together, i.e. a color =
channel
> - * comes immediately after another in the memory. And therefore, this fu=
nction
> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + * Takes the information stored in the frame_info, a pair of coordinates=
, and returns the address
> + * of the block containing this pixel.
> + * The caller must be aware that this pointer is sometimes not directly =
a pixel, it needs some
> + * additional work to extract pixel color from this block.
>   */
>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> -				int x, int y)
> +				int x, int y, size_t plane_index)
>  {
> -	size_t offset =3D pixel_offset(frame_info, x, y);
> -
> -	return (u8 *)frame_info->map[0].vaddr + offset;
> +	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info=
, x, y, plane_index);

This too.


>  }
> =20
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y)
> +/**
> + * get_step_1x1() - Common helper to compute the correct step value betw=
een each pixel to read in a
> + * certain direction.
> + * This must be used only with format where blockh =3D=3D blockw =3D=3D =
1.
> + * In the case when direction is not a valid pixel_read_direction, the r=
eturned step is 0, so you
> + * must not rely on this result to create a loop variant.
> + *
> + * @fb Framebuffer to iter on
> + * @direction Direction of the reading
> + */
> +static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_dire=
ction direction,
> +			int plane_index)
>  {
> -	int x_src =3D frame_info->src.x1 >> 16;
> -	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> -
> -	return packed_pixels_addr(frame_info, x_src, y_src);
> +	switch (direction) {
> +	default:
> +		DRM_ERROR("Invalid direction for pixel reading: %d\n", direction);
> +		return 0;

What I'd do here is move the default: section outside of the switch
completely. Then the compiler can warn if any enum value is not handled
here. Since every case in the switch is a return statement, falling out
of the switch block is the default case.

Maybe the enum variable containing an illegal value could be handled
more harshly so that callers could rely on this function always
returning a good value?

Just like passing in fb=3DNULL is handled by the kernel as an OOPS.

> +	case READ_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_DOWN:
> +		return (int)fb->pitches[plane_index];
> +	case READ_UP:
> +		return -(int)fb->pitches[plane_index];
> +	}
>  }
> =20
> -static int get_x_position(const struct vkms_frame_info *frame_info, int =
limit, int x)
> -{
> -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> -		return limit - x - 1;
> -	return x;
> -}
> =20
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
> -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
> +static void ARGB8888_to_argb_u16(struct pixel_argb_u16 *out_pixel, int a=
, int r, int g, int b)

The function name ARGB8888_to_argb_u16() is confusing. It's not taking
in ARGB8888 pixels but separate a,r,g,b ints. The only assumption it
needs from the pixel format is the 8888 part.

>  {
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -80,48 +100,26 @@ static void ARGB8888_to_argb_u16(u8 *src_pixels, str=
uct pixel_argb_u16 *out_pixe
>  	 * the best color value in a pixel format with more possibilities.
>  	 * A similar idea applies to others RGB color conversions.
>  	 */
> -	out_pixel->a =3D (u16)src_pixels[3] * 257;
> -	out_pixel->r =3D (u16)src_pixels[2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0] * 257;
> -}
> -
> -static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
> -{
> -	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D (u16)src_pixels[2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0] * 257;
> +	out_pixel->a =3D (u16)a * 257;
> +	out_pixel->r =3D (u16)r * 257;
> +	out_pixel->g =3D (u16)g * 257;
> +	out_pixel->b =3D (u16)b * 257;
>  }
> =20
> -static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u=
16 *out_pixel)
> +static void ARGB16161616_to_argb_u16(struct pixel_argb_u16 *out_pixel, i=
nt a, int r, int g, int b)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels;
> -
> -	out_pixel->a =3D le16_to_cpu(pixels[3]);
> -	out_pixel->r =3D le16_to_cpu(pixels[2]);
> -	out_pixel->g =3D le16_to_cpu(pixels[1]);
> -	out_pixel->b =3D le16_to_cpu(pixels[0]);
> -}
> -
> -static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u=
16 *out_pixel)
> -{
> -	u16 *pixels =3D (u16 *)src_pixels;
> -
> -	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D le16_to_cpu(pixels[2]);
> -	out_pixel->g =3D le16_to_cpu(pixels[1]);
> -	out_pixel->b =3D le16_to_cpu(pixels[0]);
> +	out_pixel->a =3D le16_to_cpu(a);
> +	out_pixel->r =3D le16_to_cpu(r);
> +	out_pixel->g =3D le16_to_cpu(g);
> +	out_pixel->b =3D le16_to_cpu(b);
>  }
> =20
> -static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *ou=
t_pixel)
> +static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u=
16 *pixel)

This function OTOH is taking in literally DRM_FORMAT_RGB565, so its
name is good.

>  {
> -	u16 *pixels =3D (u16 *)src_pixels;
> -
>  	s64 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> =20
> -	u16 rgb_565 =3D le16_to_cpu(*pixels);
> +	u16 rgb_565 =3D le16_to_cpu(*pixel);
>  	s64 fp_r =3D drm_int2fixp((rgb_565 >> 11) & 0x1f);
>  	s64 fp_g =3D drm_int2fixp((rgb_565 >> 5) & 0x3f);
>  	s64 fp_b =3D drm_int2fixp(rgb_565 & 0x1f);
> @@ -132,34 +130,105 @@ static void RGB565_to_argb_u16(u8 *src_pixels, str=
uct pixel_argb_u16 *out_pixel)
>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
> =20
> -/**
> - * vkms_compose_row - compose a single row of a plane
> - * @stage_buffer: output line with the composed pixels
> - * @plane: state of the plane that is being composed
> - * @y: y coordinate of the row
> +/*
> + * The following functions are read_line function for each pixel format =
supported by VKMS.
>   *
> - * This function composes a single row of a plane. It gets the source pi=
xels
> - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> - * through the source pixel, reading the pixels and converting it to
> - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotat=
e-270,
> - * the source pixels are not traversed linearly. The source pixels are q=
ueried
> - * on each iteration in order to traverse the pixels vertically.
> + * They read a line starting at the point @x_start,@y_start following th=
e @direction. The result
> + * is stored in @out_pixel and in the format ARGB16161616.
> + *
> + * Those function are very similar, but it is required for performance r=
eason. In the past, some
> + * experiment were done, and with a generic loop the performance are ver=
y reduced [1].
> + *
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f=
33b3a3@riseup.net/
>   */
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plan=
e_state *plane, int y)
> +
> +static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x=
_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u8 *px =3D (u8 *)src_pixels;
> +
> +		ARGB8888_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +		count--;

btw. you could eliminate decrementing 'count' if you computed end
address and used while (out_pixel < end).

Thanks,
pq


> +	}
> +}
> +
> +static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x=
_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u8 *px =3D (u8 *)src_pixels;
> +
> +		ARGB8888_to_argb_u16(out_pixel, 255, px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +		count--;
> +	}
> +}
> +
> +static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, i=
nt x_start, int y_start,
> +				   enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u16 *px =3D (u16 *)src_pixels;
> +
> +		ARGB16161616_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +		count--;
> +	}
> +}
> +
> +static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, i=
nt x_start, int y_start,
> +				   enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u16 *px =3D (u16 *)src_pixels;
> +
> +		ARGB16161616_to_argb_u16(out_pixel, 0xFFFF, px[2], px[1], px[0]);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +		count--;
> +	}
> +}
> +
> +static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_s=
tart, int y_start,
> +			     enum pixel_read_direction direction, int count,
> +			     struct pixel_argb_u16 out_pixel[])
>  {
> -	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> -	struct vkms_frame_info *frame_info =3D plane->frame_info;
> -	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> -	int limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), stage_buf=
fer->n_pixels);
> +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> =20
> -	for (size_t x =3D 0; x < limit; x++, src_pixels +=3D frame_info->fb->fo=
rmat->cpp[0]) {
> -		int x_pos =3D get_x_position(frame_info, limit, x);
> +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> =20
> -		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels =3D get_packed_src_addr(frame_info, x + frame_info->rotate=
d.y1)
> -				+ frame_info->fb->format->cpp[0] * y;
> +	while (count) {
> +		u16 *px =3D (u16 *)src_pixels;
> =20
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +		RGB565_to_argb_u16(out_pixel, px);
> +		out_pixel +=3D 1;
> +		src_pixels +=3D step;
> +		count--;
>  	}
>  }
> =20
> @@ -247,7 +316,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_frame_info *frame_info =3D &wb->wb_frame_info;
>  	int x_dst =3D frame_info->dst.x1;
> -	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y, 0);
>  	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
>  	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), src_buf=
fer->n_pixels);
> =20
> @@ -256,27 +325,27 @@ void vkms_writeback_row(struct vkms_writeback_job *=
wb,
>  }
> =20
>  /**
> - * Retrieve the correct read_pixel function for a specific format.
> + * Retrieve the correct read_line function for a specific format.
>   * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
>   * pointer is valid before using it in a vkms_plane_state.
>   *
>   * @format: 4cc of the format
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
> -		return (pixel_read_t)NULL;
> +		return (pixel_read_line_t)NULL;
>  	}
>  }
> =20
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
> index f68b1b03d632..58c1c74742b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -106,9 +106,9 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  		return;
> =20
>  	fmt =3D fb->format->format;
> -	pixel_read_t pixel_read =3D get_pixel_read_function(fmt);
> +	pixel_read_line_t pixel_read_line =3D get_pixel_read_line_function(fmt);
> =20
> -	if (!pixel_read) {
> +	if (!pixel_read_line) {
>  		DRM_WARN("Pixel format is not supported by VKMS planes. State is incha=
nged\n");
>  		return;
>  	}
> @@ -128,10 +128,8 @@ static void vkms_plane_atomic_update(struct drm_plan=
e *plane,
>  									  DRM_MODE_REFLECT_X |
>  									  DRM_MODE_REFLECT_Y);
> =20
> -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
> -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	vkms_plane_state->pixel_read =3D pixel_read;
> +	vkms_plane_state->pixel_read_line =3D pixel_read_line;
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20


--Sig_/boaz5c2MeD7wVb.CYwPeamq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcd+IACgkQI1/ltBGq
qqckwRAAlr8tH9XcJnW56AOoHUvBsGo9Xux3W3NZNL3bTmB8ec1ibtxgWVspnNko
VHb19ykjckbNTz9ivup7gpnvP2FNUej4Kt5I0cHdnD0oIA/MnKmWa4o6JxDLLyCu
tJzu7EIU9qozxBQaVa3pg45vircYmlAsV2gsVAGQi2gGaAe46o3KKo/LCJBKrXhI
j8L04xdv4XNRObENJsa/tOXCdIJ/zjnPPdIdxlZujbL/Qu6McOzATGaiuTX951bE
4YdO4N6DwRFpXHjZA0hPZCmevMCBkYGV1f7j0XUooAyaVXIyUtd0ICDlBplmwcHJ
SQMqiDXkhBf5XRnBvYnl5U2GDftObxepwEnTIhnLMx5/PpVDicz5fS9IpQK1Ayg7
WV/T0g1FqRaaBMffV1FWZtyixJ8nX9XBo3ZMXJp+HXq1x+nFLSBS3JnpshH+LxaR
wVgP0dQd+MSnAxMA5ebv5qgwy2euiylddSyS+Ct6f696Jay96tgP5cqTr+AAw7XQ
nxIbWnB1sT5JruOePvmlIjYNGRIWHEwz9YjPmPy0dSy7sDRMw3qIArXFceI6/8UK
dVAa8Oaameo+Dhe+7LpHt2VVtoJZei3va5Qsah9tHBzGsjPcA4RFkbeuliEae5Q0
Kbmh9PsliQLlwy/5xL+CCwF+LiDxDAHh1G2yEINsT17vrm2xLvk=
=wmfE
-----END PGP SIGNATURE-----

--Sig_/boaz5c2MeD7wVb.CYwPeamq--
