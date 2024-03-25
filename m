Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C8889E3A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998B210E486;
	Mon, 25 Mar 2024 12:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Jig/ym/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C310E486
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711368269;
 bh=M1tIMIklcw8Y1+O3MRjoDm4Q/fPm3TmZCT69I/oHrGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jig/ym/r1I3mHjSQPxhgNiFytl484lizwGnsHvXQPSfw4BxX74eko0Gx9qSKpHC72
 0wsED0AbMuVb6grDdmp+lgaSpDlWGwQno9Osh1BdO4eFVibI4Chdc2bq8nMla949fw
 f90wuNq9O08BlgGIofJQSvwJCt6dKHjqHDFpaAcdE4zCIcSWPVSld54NK7E14rdjyc
 byHZeT0OQ7JBVTbSDgpP0Wyyi9180hEsFHGljwnNKmuIZ75q3DK2Dloon4PGR9WRt2
 LztuoJeFnCnBRjb8zTn/xoOdaXT2FtIStofnLbvIdgefzV8dM7OmjRFRuPeILv6dK+
 wo9eZ+z4wdLCg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C2D23780626;
 Mon, 25 Mar 2024 12:04:28 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:04:26 +0200
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
Subject: Re: [PATCH v5 04/16] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <20240325140426.3841ac70.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-4-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-4-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q4uKLlxExbOU5QGpWXOqRc1";
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

--Sig_/Q4uKLlxExbOU5QGpWXOqRc1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:44:58 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> compiler to check if the passed functions take the correct arguments.
> Such typedefs will help ensuring consistency across the code base in
> case of update of these prototypes.
>=20
> Rename input/output variable in a consistent way between read_line and
> write_line.
>=20
> A warn has been added in get_pixel_*_function to alert when an unsupported
> pixel format is requested. As those formats are checked before
> atomic_update callbacks, it should never append.

s/append/happen/


Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks,
pq

>=20
> Document for those typedefs.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  23 ++++++-
>  drivers/gpu/drm/vkms/vkms_formats.c | 124 +++++++++++++++++++++---------=
------
>  drivers/gpu/drm/vkms/vkms_formats.h |   4 +-
>  drivers/gpu/drm/vkms/vkms_plane.c   |   2 +-
>  4 files changed, 95 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 18086423a3a7..4bfc62d26f08 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -53,12 +53,31 @@ struct line_buffer {
>  	struct pixel_argb_u16 *pixels;
>  };
> =20
> +/**
> + * typedef pixel_write_t - These functions are used to read a pixel from=
 a
> + * `struct pixel_argb_u16*`, convert it in a specific format and write i=
t in the @dst_pixels
> + * buffer.
> + *
> + * @out_pixel: destination address to write the pixel
> + * @in_pixel: pixel to write
> + */
> +typedef void (*pixel_write_t)(u8 *out_pixel, struct pixel_argb_u16 *in_p=
ixel);
> +
>  struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>  	struct vkms_frame_info wb_frame_info;
> -	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> +	pixel_write_t pixel_write;
>  };
> =20
> +/**
> + * typedef pixel_read_t - These functions are used to read a pixel in th=
e source frame,
> + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> + *
> + * @in_pixel: Pointer to the pixel to read
> + * @out_pixel: Pointer to write the converted pixel
> + */
> +typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pi=
xel);
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -69,7 +88,7 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
> +	pixel_read_t pixel_read;
>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 6e3dc8682ff9..55a4365d21a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -76,7 +76,7 @@ static int get_x_position(const struct vkms_frame_info =
*frame_info, int limit, i
>   * They are used in the `vkms_compose_row` function to handle multiple f=
ormats.
>   */
> =20
> -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
> +static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *ou=
t_pixel)
>  {
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -84,48 +84,48 @@ static void ARGB8888_to_argb_u16(u8 *src_pixels, stru=
ct pixel_argb_u16 *out_pixe
>  	 * the best color value in a pixel format with more possibilities.
>  	 * A similar idea applies to others RGB color conversions.
>  	 */
> -	out_pixel->a =3D (u16)src_pixels[3] * 257;
> -	out_pixel->r =3D (u16)src_pixels[2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0] * 257;
> +	out_pixel->a =3D (u16)in_pixel[3] * 257;
> +	out_pixel->r =3D (u16)in_pixel[2] * 257;
> +	out_pixel->g =3D (u16)in_pixel[1] * 257;
> +	out_pixel->b =3D (u16)in_pixel[0] * 257;
>  }
> =20
> -static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
> +static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *ou=
t_pixel)
>  {
>  	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D (u16)src_pixels[2] * 257;
> -	out_pixel->g =3D (u16)src_pixels[1] * 257;
> -	out_pixel->b =3D (u16)src_pixels[0] * 257;
> +	out_pixel->r =3D (u16)in_pixel[2] * 257;
> +	out_pixel->g =3D (u16)in_pixel[1] * 257;
> +	out_pixel->b =3D (u16)in_pixel[0] * 257;
>  }
> =20
> -static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u=
16 *out_pixel)
> +static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels;
> +	u16 *pixel =3D (u16 *)in_pixel;
> =20
> -	out_pixel->a =3D le16_to_cpu(pixels[3]);
> -	out_pixel->r =3D le16_to_cpu(pixels[2]);
> -	out_pixel->g =3D le16_to_cpu(pixels[1]);
> -	out_pixel->b =3D le16_to_cpu(pixels[0]);
> +	out_pixel->a =3D le16_to_cpu(pixel[3]);
> +	out_pixel->r =3D le16_to_cpu(pixel[2]);
> +	out_pixel->g =3D le16_to_cpu(pixel[1]);
> +	out_pixel->b =3D le16_to_cpu(pixel[0]);
>  }
> =20
> -static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u=
16 *out_pixel)
> +static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels;
> +	u16 *pixel =3D (u16 *)in_pixel;
> =20
>  	out_pixel->a =3D (u16)0xffff;
> -	out_pixel->r =3D le16_to_cpu(pixels[2]);
> -	out_pixel->g =3D le16_to_cpu(pixels[1]);
> -	out_pixel->b =3D le16_to_cpu(pixels[0]);
> +	out_pixel->r =3D le16_to_cpu(pixel[2]);
> +	out_pixel->g =3D le16_to_cpu(pixel[1]);
> +	out_pixel->b =3D le16_to_cpu(pixel[0]);
>  }
> =20
> -static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *ou=
t_pixel)
> +static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_=
pixel)
>  {
> -	u16 *pixels =3D (u16 *)src_pixels;
> +	u16 *pixel =3D (u16 *)in_pixel;
> =20
>  	s64 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> =20
> -	u16 rgb_565 =3D le16_to_cpu(*pixels);
> +	u16 rgb_565 =3D le16_to_cpu(*pixel);
>  	s64 fp_r =3D drm_int2fixp((rgb_565 >> 11) & 0x1f);
>  	s64 fp_g =3D drm_int2fixp((rgb_565 >> 5) & 0x3f);
>  	s64 fp_b =3D drm_int2fixp(rgb_565 & 0x1f);
> @@ -169,12 +169,12 @@ void vkms_compose_row(struct line_buffer *stage_buf=
fer, struct vkms_plane_state
> =20
>  /*
>   * The following functions take one argb_u16 pixel and convert it to a s=
pecific format. The
> - * result is stored in @dst_pixels.
> + * result is stored in @out_pixel.
>   *
>   * They are used in the `vkms_writeback_row` to convert and store a pixe=
l from the src_buffer to
>   * the writeback buffer.
>   */
> -static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *=
in_pixel)
> +static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *i=
n_pixel)
>  {
>  	/*
>  	 * This sequence below is important because the format's byte order is
> @@ -186,43 +186,43 @@ static void argb_u16_to_ARGB8888(u8 *dst_pixels, st=
ruct pixel_argb_u16 *in_pixel
>  	 * | Addr + 2 | =3D Red channel
>  	 * | Addr + 3 | =3D Alpha channel
>  	 */
> -	dst_pixels[3] =3D DIV_ROUND_CLOSEST(in_pixel->a, 257);
> -	dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixel->r, 257);
> -	dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixel->g, 257);
> -	dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
> +	out_pixel[3] =3D DIV_ROUND_CLOSEST(in_pixel->a, 257);
> +	out_pixel[2] =3D DIV_ROUND_CLOSEST(in_pixel->r, 257);
> +	out_pixel[1] =3D DIV_ROUND_CLOSEST(in_pixel->g, 257);
> +	out_pixel[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
>  }
> =20
> -static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *=
in_pixel)
> +static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *i=
n_pixel)
>  {
> -	dst_pixels[3] =3D 0xff;
> -	dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixel->r, 257);
> -	dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixel->g, 257);
> -	dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
> +	out_pixel[3] =3D 0xff;
> +	out_pixel[2] =3D DIV_ROUND_CLOSEST(in_pixel->r, 257);
> +	out_pixel[1] =3D DIV_ROUND_CLOSEST(in_pixel->g, 257);
> +	out_pixel[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
>  }
> =20
> -static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u=
16 *in_pixel)
> +static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u1=
6 *in_pixel)
>  {
> -	u16 *pixels =3D (u16 *)dst_pixels;
> +	u16 *pixel =3D (u16 *)out_pixel;
> =20
> -	pixels[3] =3D cpu_to_le16(in_pixel->a);
> -	pixels[2] =3D cpu_to_le16(in_pixel->r);
> -	pixels[1] =3D cpu_to_le16(in_pixel->g);
> -	pixels[0] =3D cpu_to_le16(in_pixel->b);
> +	pixel[3] =3D cpu_to_le16(in_pixel->a);
> +	pixel[2] =3D cpu_to_le16(in_pixel->r);
> +	pixel[1] =3D cpu_to_le16(in_pixel->g);
> +	pixel[0] =3D cpu_to_le16(in_pixel->b);
>  }
> =20
> -static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u=
16 *in_pixel)
> +static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u1=
6 *in_pixel)
>  {
> -	u16 *pixels =3D (u16 *)dst_pixels;
> +	u16 *pixel =3D (u16 *)out_pixel;
> =20
> -	pixels[3] =3D 0xffff;
> -	pixels[2] =3D cpu_to_le16(in_pixel->r);
> -	pixels[1] =3D cpu_to_le16(in_pixel->g);
> -	pixels[0] =3D cpu_to_le16(in_pixel->b);
> +	pixel[3] =3D 0xffff;
> +	pixel[2] =3D cpu_to_le16(in_pixel->r);
> +	pixel[1] =3D cpu_to_le16(in_pixel->g);
> +	pixel[0] =3D cpu_to_le16(in_pixel->b);
>  }
> =20
> -static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in=
_pixel)
> +static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_=
pixel)
>  {
> -	u16 *pixels =3D (u16 *)dst_pixels;
> +	u16 *pixel =3D (u16 *)out_pixel;
> =20
>  	s64 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -235,7 +235,7 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct=
 pixel_argb_u16 *in_pixel)
>  	u16 g =3D drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
>  	u16 b =3D drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> =20
> -	*pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
> +	*pixel =3D cpu_to_le16(r << 11 | g << 5 | b);
>  }
> =20
>  /**
> @@ -266,7 +266,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
>   */
> -void *get_pixel_conversion_function(u32 format)
> +pixel_read_t get_pixel_read_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -280,7 +280,16 @@ void *get_pixel_conversion_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &RGB565_to_argb_u16;
>  	default:
> -		return NULL;
> +		/*
> +		 * This is a bug in vkms_plane_atomic_check. All the supported
> +		 * format must:
> +		 * - Be listed in vkms_formats in vkms_plane.c
> +		 * - Have a pixel_read callback defined here
> +		 */
> +		WARN(true,
> +		     "Pixel format %p4cc is not supported by VKMS planes. This is a ke=
rnel bug, atomic check must forbid this configuration.\n",
> +		     &format);
> +		return (pixel_read_t)NULL;
>  	}
>  }
> =20
> @@ -291,7 +300,7 @@ void *get_pixel_conversion_function(u32 format)
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
>   */
> -void *get_pixel_write_function(u32 format)
> +pixel_write_t get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -305,6 +314,15 @@ void *get_pixel_write_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &argb_u16_to_RGB565;
>  	default:
> -		return NULL;
> +		/*
> +		 * This is a bug in vkms_writeback_atomic_check. All the supported
> +		 * format must:
> +		 * - Be listed in vkms_wb_formats in vkms_writeback.c
> +		 * - Have a pixel_write callback defined here
> +		 */
> +		WARN(true,
> +		     "Pixel format %p4cc is not supported by VKMS writeback. This is a=
 kernel bug, atomic check must forbid this configuration.\n",
> +		     &format);
> +		return (pixel_write_t)NULL;
>  	}
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index cf59c2ed8e9a..3ecea4563254 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,8 +5,8 @@
> =20
>  #include "vkms_drv.h"
> =20
> -void *get_pixel_conversion_function(u32 format);
> +pixel_read_t get_pixel_read_function(u32 format);
> =20
> -void *get_pixel_write_function(u32 format);
> +pixel_write_t get_pixel_write_function(u32 format);
> =20
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 21b5adfb44aa..10e9b23dab28 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -125,7 +125,7 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
>  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	vkms_plane_state->pixel_read =3D get_pixel_conversion_function(fmt);
> +	vkms_plane_state->pixel_read =3D get_pixel_read_function(fmt);
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20


--Sig_/Q4uKLlxExbOU5QGpWXOqRc1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBaEoACgkQI1/ltBGq
qqeOLQ/+JrsUGqKPn2Yl7Hd/t0yZ6yi3Q9I5R5LAe0t3cK1rH7ZdM2mcDBo2Lk3V
SCtiYrb0Yqx0VQHKXje0EfkfP9jb7bJr/uf4lDEobwZrXP/V9OW6v1o2aNX2oBNA
KMoHJzVgLIlztOKQZ0/5SiG1CtHUGknnarzQjwn6P3PIOA4zftJtEwEK4M8JpQAx
A5u5eXSSMbNHPWjJD1+CPkLM3ztV+Tx7TVj/fJu3LE0xdt8UTpLkZxIlkNZgDeZV
nF3snzuH0yZnP2QW7ntAWkFjb0Qc7ZT+O+qhf4Azsy/URLCzLEvw9D1nFCcDemlB
VK/nEvGG85CN1g+XyuWIuwawp9+rLRqrckIA6vRnX7gPUTEzM5eG8q96pFvk2eWQ
Qcgo46CiDLP5FAa5LqV3nFzacZNj81RW4NIE6dwdTLRPxBLVI/5BUYkKrPT5BM0h
Q0iooWh+QOt5FjyB+D8jtbpeuX5UtsVURBAkXWjRl50JXZky/uJPDkmmemTLwfN8
lOkuzuNcNwfkRgTuQlJzTcdhhd0Bw0qJHnYPPPGc7N/4EZfEzIskODXe1b4Qbf4/
a6K+rAbWWyz1vz54b/BW40zl4Nj0HNh3ItTmVVKjZ7IKlBlWEMmTRy+tpmld4QUj
ciaWCqJI9h4Lmb2/0aa2rNwjbvuDxj3y8I+JvAFyrBCBEvlq+uY=
=lsU4
-----END PGP SIGNATURE-----

--Sig_/Q4uKLlxExbOU5QGpWXOqRc1--
