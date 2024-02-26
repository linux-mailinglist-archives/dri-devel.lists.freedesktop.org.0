Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22886749A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EF210E6DF;
	Mon, 26 Feb 2024 12:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3f/weH/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393910E71B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708949958;
 bh=I7cMaxkR7UvDx5TgEi2G9CoTGM/SkvQwgbB0/PjzDNE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=3f/weH/HEGBy+o9QO+0Q+ul31fJd7iqCeE64eXSbgjQr5e/fgDdeMmoCJPw9E59O6
 wV2toPcSsyRLay8EhJUBglkUFf9SPekiUqiTnLQe3Xj5XM/jv++phWyLKuKZBpbYPY
 hKUb9DDVObp4E78oI9CwOgHjxurvgQyLJr12HdESlVWv6ZJ0Dyvt5VHYP+UPk3jlhM
 RI+e6I7xIPwhFxanbYXHQaAw7sq7FCXQm24C6zqfEIrCGV6SHGjfZkHZ7DHk+vuc5q
 1lDcm4yxg3zH1/yrdhYicRGaUnYKj+n+F3oCRanbJL3lZZIKZvumC3PUVpTGl8SS+Q
 hLpgrH4xjSXsA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8DF6837803EE;
 Mon, 26 Feb 2024 12:19:17 +0000 (UTC)
Date: Mon, 26 Feb 2024 14:19:16 +0200
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
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Message-ID: <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
In-Reply-To: <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wrAdhBnH.I+6NARRtdDHMCg";
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

--Sig_/wrAdhBnH.I+6NARRtdDHMCg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Feb 2024 12:37:26 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Add support to the YUV formats bellow:
>=20
> - NV12
> - NV16
> - NV24
> - NV21
> - NV61
> - NV42
> - YUV420
> - YUV422
> - YUV444
> - YVU420
> - YVU422
> - YVU444
>=20
> The conversion matrices of each encoding and range were obtained by
> rounding the values of the original conversion matrices multiplied by
> 2^8. This is done to avoid the use of fixed point operations.
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
> callbacks for yuv formats]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++=
++++--
>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
>  5 files changed, 295 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index e555bf9c1aee..54fc5161d565 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
>  			 * buffer [1]
>  			 */
>  			current_plane->pixel_read_line(
> -				current_plane->frame_info,
> +				current_plane,
>  				x_start,
>  				y_start,
>  				direction,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index ccc5be009f15..a4f6456cb971 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -75,6 +75,8 @@ enum pixel_read_direction {
>  	READ_RIGHT
>  };
> =20
> +struct vkms_plane_state;
> +
>  /**
>  <<<<<<< HEAD
>   * typedef pixel_read_line_t - These functions are used to read a pixel =
line in the source frame,
> @@ -87,8 +89,8 @@ enum pixel_read_direction {
>   * @out_pixel: Pointer where to write the pixel value. Pixels will be wr=
itten between x_start and
>   *  x_end.
>   */
> -typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, in=
t x_start, int y_start, enum
> -	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pi=
xel[]);
> +typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_info, i=
nt x_start, int y_start,
> +	enum pixel_read_direction direction, int count, struct pixel_argb_u16 o=
ut_pixel[]);

This is the second or third time in this one series changing this type.
Could you not do the change once, in its own patch if possible?

> =20
>  /**
>   * vkms_plane_state - Driver specific plane state
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 46daea6d3ee9..515c80866a58 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vkms_fr=
ame_info *frame_info, int
>  	 */
>  	return fb->offsets[plane_index] +
>  	       (y / drm_format_info_block_width(format, plane_index)) * fb->pit=
ches[plane_index] +
> -	       (x / drm_format_info_block_height(format, plane_index)) * format=
->char_per_block[plane_index];
> +	       (x / drm_format_info_block_height(format, plane_index)) *
> +	       format->char_per_block[plane_index];

Shouldn't this be in the patch that added this code in the first place?

>  }
> =20
>  /**
> @@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *fb, en=
um pixel_read_direction di
>  	}
>  }
> =20
> +/**
> + * get_subsampling() - Get the subsampling value on a specific direction

subsampling divisor

> + */
> +static int get_subsampling(const struct drm_format_info *format,
> +			   enum pixel_read_direction direction)
> +{
> +	if (direction =3D=3D READ_LEFT || direction =3D=3D READ_RIGHT)
> +		return format->hsub;
> +	else if (direction =3D=3D READ_DOWN || direction =3D=3D READ_UP)
> +		return format->vsub;
> +	return 1;

In this and the below function, personally I'd prefer switch-case, with
a cannot-happen-scream after the switch, so the compiler can warn about
unhandled enum values.

> +}
> +
> +/**
> + * get_subsampling_offset() - Get the subsampling offset to use when inc=
rementing the pixel counter
> + */
> +static int get_subsampling_offset(const struct drm_format_info *format,
> +				  enum pixel_read_direction direction, int x_start, int y_start)

'start' values as "increments" for a pixel counter? Is something
misnamed here?

Is it an increment or an offset?

> +{
> +	if (direction =3D=3D READ_RIGHT || direction =3D=3D READ_LEFT)
> +		return x_start;
> +	else if (direction =3D=3D READ_DOWN || direction =3D=3D READ_UP)
> +		return y_start;
> +	return 0;
> +}
> +
> =20
>  /*
>   * The following  functions take pixel data (a, r, g, b, pixel, ...), co=
nvert them to the format
> @@ -130,6 +157,87 @@ static void RGB565_to_argb_u16(struct pixel_argb_u16=
 *out_pixel, const u16 *pixe
>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
> =20
> +static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset=
, u8 *r, u8 *g, u8 *b)
> +{
> +	s32 y_16, cb_16, cr_16;
> +	s32 r_16, g_16, b_16;
> +
> +	y_16 =3D y - y_offset;
> +	cb_16 =3D cb - 128;
> +	cr_16 =3D cr - 128;
> +
> +	r_16 =3D m[0][0] * y_16 + m[0][1] * cb_16 + m[0][2] * cr_16;
> +	g_16 =3D m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
> +	b_16 =3D m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
> +
> +	*r =3D clamp(r_16, 0, 0xffff) >> 8;
> +	*g =3D clamp(g_16, 0, 0xffff) >> 8;
> +	*b =3D clamp(b_16, 0, 0xffff) >> 8;
> +}
> +
> +static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const st=
ruct pixel_yuv_u8 *yuv_u8,
> +			       enum drm_color_encoding encoding, enum drm_color_range range)
> +{
> +	static const s16 bt601_full[3][3] =3D {
> +		{ 256, 0,   359 },
> +		{ 256, -88, -183 },
> +		{ 256, 454, 0 },
> +	};
> +	static const s16 bt601[3][3] =3D {
> +		{ 298, 0,    409 },
> +		{ 298, -100, -208 },
> +		{ 298, 516,  0 },
> +	};
> +	static const s16 rec709_full[3][3] =3D {
> +		{ 256, 0,   408 },
> +		{ 256, -48, -120 },
> +		{ 256, 476, 0 },
> +	};
> +	static const s16 rec709[3][3] =3D {
> +		{ 298, 0,   459 },
> +		{ 298, -55, -136 },
> +		{ 298, 541, 0 },
> +	};
> +	static const s16 bt2020_full[3][3] =3D {
> +		{ 256, 0,   377 },
> +		{ 256, -42, -146 },
> +		{ 256, 482, 0 },
> +	};
> +	static const s16 bt2020[3][3] =3D {
> +		{ 298, 0,   430 },
> +		{ 298, -48, -167 },
> +		{ 298, 548, 0 },
> +	};
> +
> +	u8 r =3D 0;
> +	u8 g =3D 0;
> +	u8 b =3D 0;
> +	bool full =3D range =3D=3D DRM_COLOR_YCBCR_FULL_RANGE;
> +	unsigned int y_offset =3D full ? 0 : 16;
> +
> +	switch (encoding) {
> +	case DRM_COLOR_YCBCR_BT601:
> +		ycbcr2rgb(full ? bt601_full : bt601,

Doing all these conditional again pixel by pixel is probably
inefficient. Just like with the line reading functions, you could pick
the matrix in advance.

> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	case DRM_COLOR_YCBCR_BT709:
> +		ycbcr2rgb(full ? rec709_full : rec709,
> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	case DRM_COLOR_YCBCR_BT2020:
> +		ycbcr2rgb(full ? bt2020_full : bt2020,
> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	default:
> +		pr_warn_once("Not supported color encoding\n");
> +		break;
> +	}
> +
> +	argb_u16->r =3D r * 257;
> +	argb_u16->g =3D g * 257;
> +	argb_u16->b =3D b * 257;

I wonder. Using 8-bit fixed point precision seems quite coarse for
8-bit pixel formats, and it's going to be insufficient for higher bit
depths. Was supporting e.g. 10-bit YUV considered? There is even
deeper, too, like DRM_FORMAT_P016.

> +}
> +
>  /*
>   * The following functions are read_line function for each pixel format =
supported by VKMS.
>   *
> @@ -142,13 +250,13 @@ static void RGB565_to_argb_u16(struct pixel_argb_u1=
6 *out_pixel, const u16 *pixe
>   * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f=
33b3a3@riseup.net/
>   */
> =20
> -static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x=
_start, int y_start,
> +static void ARGB8888_read_line(struct vkms_plane_state *plane, int x_sta=
rt, int y_start,
>  			       enum pixel_read_direction direction, int count,
>  			       struct pixel_argb_u16 out_pixel[])
>  {
> -	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels =3D packed_pixels_addr(plane->frame_info, x_start, y_sta=
rt, 0);
> =20
> -	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +	int step =3D get_step_1x1(plane->frame_info->fb, direction, 0);

These are the kind of changes I would not expect to see in a patch
adding YUV support. There are a lot of them, too.

> =20
>  	while (count) {
>  		u8 *px =3D (u8 *)src_pixels;
> @@ -160,13 +268,13 @@ static void ARGB8888_read_line(struct vkms_frame_in=
fo *frame_info, int x_start,
>  	}
>  }
> =20
> -static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x=
_start, int y_start,
> +static void XRGB8888_read_line(struct vkms_plane_state *plane, int x_sta=
rt, int y_start,
>  			       enum pixel_read_direction direction, int count,
>  			       struct pixel_argb_u16 out_pixel[])
>  {
> -	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels =3D packed_pixels_addr(plane->frame_info, x_start, y_sta=
rt, 0);
> =20
> -	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +	int step =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> =20
>  	while (count) {
>  		u8 *px =3D (u8 *)src_pixels;
> @@ -178,13 +286,13 @@ static void XRGB8888_read_line(struct vkms_frame_in=
fo *frame_info, int x_start,
>  	}
>  }
> =20
> -static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, i=
nt x_start, int y_start,
> +static void ARGB16161616_read_line(struct vkms_plane_state *plane, int x=
_start, int y_start,
>  				   enum pixel_read_direction direction, int count,
>  				   struct pixel_argb_u16 out_pixel[])
>  {
> -	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels =3D packed_pixels_addr(plane->frame_info, x_start, y_sta=
rt, 0);
> =20
> -	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +	int step =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> =20
>  	while (count) {
>  		u16 *px =3D (u16 *)src_pixels;
> @@ -196,13 +304,13 @@ static void ARGB16161616_read_line(struct vkms_fram=
e_info *frame_info, int x_sta
>  	}
>  }
> =20
> -static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, i=
nt x_start, int y_start,
> +static void XRGB16161616_read_line(struct vkms_plane_state *plane, int x=
_start, int y_start,
>  				   enum pixel_read_direction direction, int count,
>  				   struct pixel_argb_u16 out_pixel[])
>  {
> -	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels =3D packed_pixels_addr(plane->frame_info, x_start, y_sta=
rt, 0);
> =20
> -	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +	int step =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> =20
>  	while (count) {
>  		u16 *px =3D (u16 *)src_pixels;
> @@ -214,13 +322,13 @@ static void XRGB16161616_read_line(struct vkms_fram=
e_info *frame_info, int x_sta
>  	}
>  }
> =20
> -static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_s=
tart, int y_start,
> +static void RGB565_read_line(struct vkms_plane_state *plane, int x_start=
, int y_start,
>  			     enum pixel_read_direction direction, int count,
>  			     struct pixel_argb_u16 out_pixel[])
>  {
> -	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels =3D packed_pixels_addr(plane->frame_info, x_start, y_sta=
rt, 0);
> =20
> -	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> +	int step =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> =20
>  	while (count) {
>  		u16 *px =3D (u16 *)src_pixels;
> @@ -232,6 +340,139 @@ static void RGB565_read_line(struct vkms_frame_info=
 *frame_info, int x_start, in
>  	}
>  }
> =20
> +static void semi_planar_yuv_read_line(struct vkms_plane_state *plane, in=
t x_start, int y_start,
> +				      enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane =3D packed_pixels_addr(plane->frame_info, x_start, y_start,=
 0);
> +	u8 *uv_plane =3D packed_pixels_addr(plane->frame_info,
> +					  x_start / plane->frame_info->fb->format->hsub,
> +					  y_start / plane->frame_info->fb->format->vsub,
> +					  1);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_uv =3D get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(plane->frame_info->fb=
->format, direction,
> +							x_start, y_start); // 0
> +
> +	for (int i =3D 0; i < count; i++) {
> +		yuv_u8.y =3D y_plane[0];
> +		yuv_u8.u =3D uv_plane[0];
> +		yuv_u8.v =3D uv_plane[1];
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);

Oh, so this was the reason to change the read-line function signature.
Maybe just stash a pointer to the right matrix and the right y_offset
in frame_info instead?

> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0)
> +			uv_plane +=3D step_uv;
> +	}
> +}
> +
> +static void semi_planar_yvu_read_line(struct vkms_plane_state *plane, in=
t x_start, int y_start,
> +				      enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane =3D packed_pixels_addr(plane->frame_info, x_start, y_start,=
 0);
> +	u8 *vu_plane =3D packed_pixels_addr(plane->frame_info,
> +					  x_start / plane->frame_info->fb->format->hsub,
> +					  y_start / plane->frame_info->fb->format->vsub,
> +					  1);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_vu =3D get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(plane->frame_info->fb=
->format, direction,
> +							x_start, y_start);
> +	for (int i =3D 0; i < count; i++) {
> +		yuv_u8.y =3D y_plane[0];
> +		yuv_u8.u =3D vu_plane[1];
> +		yuv_u8.v =3D vu_plane[0];

You could swap matrix columns instead of writing this whole new
function for UV vs. VU. Just an idea.


Thanks,
pq

> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0)
> +			vu_plane +=3D step_vu;
> +	}
> +}
> +
> +static void planar_yuv_read_line(struct vkms_plane_state *plane, int x_s=
tart, int y_start,
> +				 enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane =3D packed_pixels_addr(plane->frame_info, x_start, y_start,=
 0);
> +	u8 *u_plane =3D packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 1);
> +	u8 *v_plane =3D packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 2);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_u =3D get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int step_v =3D get_step_1x1(plane->frame_info->fb, direction, 2);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(plane->frame_info->fb=
->format, direction,
> +							x_start, y_start);
> +
> +	for (int i =3D 0; i < count; i++) {
> +		yuv_u8.y =3D *y_plane;
> +		yuv_u8.u =3D *u_plane;
> +		yuv_u8.v =3D *v_plane;
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0) {
> +			u_plane +=3D step_u;
> +			v_plane +=3D step_v;
> +		}
> +	}
> +}
> +
> +static void planar_yvu_read_line(struct vkms_plane_state *plane, int x_s=
tart, int y_start,
> +				 enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane =3D packed_pixels_addr(plane->frame_info, x_start, y_start,=
 0);
> +	u8 *v_plane =3D packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 1);
> +	u8 *u_plane =3D packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 2);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y =3D get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_u =3D get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int step_v =3D get_step_1x1(plane->frame_info->fb, direction, 2);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(plane->frame_info->fb=
->format, direction,
> +							x_start, y_start);
> +
> +	for (int i =3D 0; i < count; i++) {
> +		yuv_u8.y =3D *y_plane;
> +		yuv_u8.u =3D *u_plane;
> +		yuv_u8.v =3D *v_plane;
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0) {
> +			u_plane +=3D step_u;
> +			v_plane +=3D step_v;
> +		}
> +	}
> +}
> +
>  /*
>   * The following functions take one argb_u16 pixel and convert it to a s=
pecific format. The
>   * result is stored in @dst_pixels.
> @@ -344,6 +585,22 @@ pixel_read_line_t get_pixel_read_line_function(u32 f=
ormat)
>  		return &XRGB16161616_read_line;
>  	case DRM_FORMAT_RGB565:
>  		return &RGB565_read_line;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +		return &semi_planar_yuv_read_line;
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		return &semi_planar_yvu_read_line;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +		return &planar_yuv_read_line;
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +		return &planar_yvu_read_line;
>  	default:
>  		return (pixel_read_line_t)NULL;
>  	}
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index 8d2bef95ff79..5a3a9e1328d8 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format=
);
> =20
>  pixel_write_t get_pixel_write_function(u32 format);
> =20
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};
> +
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 58c1c74742b5..427ca67c60ce 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -17,7 +17,19 @@ static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
>  	DRM_FORMAT_ARGB16161616,
> -	DRM_FORMAT_RGB565
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV42,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YVU444
>  };
> =20
>  static struct drm_plane_state *
>=20


--Sig_/wrAdhBnH.I+6NARRtdDHMCg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcgcQACgkQI1/ltBGq
qqcW2hAAgmYg6sU5QTIb51gZzE56PaIsvxZHOMoKCMsEvZsAx/yI8JhYyxpP14YX
O/LJsIOCOtt0YEusMOzTzjm9l91hlQIk+Vi7pYRB3iFO0jaAaITSiejBiJvuvn+v
hRd3MwfiptAGAWZaKEw2kmA8iQvBF+qRCsGQYcohGGGAhdTD++nAdzTTFYg264yi
K1K6UpacsMu14kS3RSCbqu2YFvG3fEJWZ2LVnHjYD9Ck7dB9+KRNn0TGl4Rd+L9W
uD4kiNZCfe7ST8Z3UrteryjyJmbRgkhrRUvL6QQUYucwEDQ/VR5z9anptWEWF/vR
tg2W4y7ETAdLcFlLFNrWxofJwQ2FgL7uw7k/7R9NvvGmNyCBDNgVKim4ITda1o2N
A/S2NmRea0iT85hbBITgat0z9a5jXJWOZ9hKdSKuwc/sOsUMMJjxVpKFe5XFcbdo
wOfiBqWb6teuxDOiRSM3NNakJ4abSQ8rF0A9ucpfQzZSRqc1FHlpIQnHl/nGVTqj
6knI4UmGXoL+16wPFjfIcr7R80p7POuDwXsZkU6K8E7V6glm9ppRu4OAgOSiZDr3
D6pGq1XMgexxKfk9m+EECAKCex2H0XN4WK2+J51rE+M+WjmwrYw/XQ4/yPXC9OqF
0Xkz0ng0KX7KIx4fu4rXSFSdZoIxDQCc4wAziIhM/c4cQt1v4ZY=
=l2+r
-----END PGP SIGNATURE-----

--Sig_/wrAdhBnH.I+6NARRtdDHMCg--
