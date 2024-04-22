Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E578ACAC3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D3E10F8C1;
	Mon, 22 Apr 2024 10:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ErOpX/ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22D010F8C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713782048;
 bh=MG9YQbs1kO+rb1+HfkydhLTVRcZ+uJduytT4/2s2HTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ErOpX/aidrIQqDtcw67rtMayccqP4EcoyBlJSMLQ4dHadUxCqy95mi5g9NNUtx++k
 8n/A0az3yfeIEnTPgO8evVuR5pYi5DMhuvMfiHNgjgyy0wbuMTjv7acJcQ77/VO3Tr
 +g4N3xz01pv4n1KzBJV+0nSDA8edO7bfSymofVu7W4mNsjKUdoCdIKLLoQ3PwJr5sr
 Wf11S5P0qdf38gk9Wn9pKGVBzZT5Pp9sma1kgsSMlDu9YQpKvX5FsUiTbPck41sr/P
 T4M70tYzGcbG83pyyDo2OshC5QV/VyJOwPNJ264isDXTNCkLmRm30ms/pWKefOw4jC
 kYs4g3gYUlFYg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F1BB33780C22;
 Mon, 22 Apr 2024 10:34:06 +0000 (UTC)
Date: Mon, 22 Apr 2024 13:33:58 +0300
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
Subject: Re: [PATCH v6 03/17] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <20240422133358.59fb6221.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-3-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-3-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EIm6IB..eFYrq.HVSRXLgeq";
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

--Sig_/EIm6IB..eFYrq.HVSRXLgeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:21 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 15 ++++++++-
>  drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++=
------
>  3 files changed, 74 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index c6d9b4a65809..da0651a94c9b 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
> =20
>  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> =20
> +	/*
> +	 * The planes are composed line-by-line to avoid heavy memory usage. It=
 is a necessary
> +	 * complexity to avoid poor blending performance.
> +	 *
> +	 * The function vkms_compose_row is used to read a line, pixel-by-pixel=
, into the staging
> +	 * buffer.
> +	 */
>  	for (size_t y =3D 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index b4b357447292..a86cb537d6aa 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,6 +25,17 @@
> =20
>  #define VKMS_LUT_SIZE 256
> =20
> +/**
> + * struct vkms_frame_info - structure to store the state of a frame
> + *
> + * @fb: backing drm framebuffer
> + * @src: source rectangle of this frame in the source framebuffer
> + * @dst: destination rectangle in the crtc buffer

Are both src and dst using whole pixel units, or is src using 1/65536th
pixel units?

Asking because UAPI has src rect in 16.16 fixed-point, IIRC.

With that clarified:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> + * @map: see drm_shadow_plane_state@data
> + * @rotation: rotation applied to the source.
> + *
> + * @src and @dst should have the same size modulo the rotation.
> + */
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -49,9 +60,11 @@ struct vkms_writeback_job {
>  };
> =20
>  /**
> - * vkms_plane_state - Driver specific plane state
> + * struct vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
> + * @pixel_read: function to read a pixel in this plane. The creator of a=
 vkms_plane_state must
> + * ensure that this pointer is valid
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index d597c48452ac..f157c43da4d6 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -9,6 +9,18 @@
> =20
>  #include "vkms_formats.h"
> =20
> +/**
> + * pixel_offset() - Get the offset of the pixel at coordinates x/y in th=
e first plane
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + *
> + * The caller must ensure that the framebuffer associated with this requ=
est uses a pixel format
> + * where block_h =3D=3D block_w =3D=3D 1.
> + * If this requirement is not fulfilled, the resulting offset can point =
to an other pixel or
> + * outside of the buffer.
> + */
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y)
>  {
>  	struct drm_framebuffer *fb =3D frame_info->fb;
> @@ -16,18 +28,22 @@ static size_t pixel_offset(const struct vkms_frame_in=
fo *frame_info, int x, int
>  	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
>  }
> =20
> -/*
> - * packed_pixels_addr - Get the pointer to pixel of a given pair of coor=
dinates
> +/**
> + * packed_pixels_addr() - Get the pointer to the block containing the pi=
xel at the given
> + * coordinates
>   *
>   * @frame_info: Buffer metadata
> - * @x: The x(width) coordinate of the 2D buffer
> - * @y: The y(Heigth) coordinate of the 2D buffer
> + * @x: The x (width) coordinate inside the plane
> + * @y: The y (height) coordinate inside the plane
>   *
>   * Takes the information stored in the frame_info, a pair of coordinates=
, and
>   * returns the address of the first color channel.
>   * This function assumes the channels are packed together, i.e. a color =
channel
>   * comes immediately after another in the memory. And therefore, this fu=
nction
>   * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + *
> + * The caller must ensure that the framebuffer associated with this requ=
est uses a pixel format
> + * where block_h =3D=3D block_w =3D=3D 1, otherwise the returned pointer=
 can be outside the buffer.
>   */
>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>  				int x, int y)
> @@ -52,6 +68,13 @@ static int get_x_position(const struct vkms_frame_info=
 *frame_info, int limit, i
>  	return x;
>  }
> =20
> +/*
> + * The following functions take pixel data from the buffer and convert t=
hem to the format
> + * ARGB16161616 in out_pixel.
> + *
> + * They are used in the vkms_compose_row() function to handle multiple f=
ormats.
> + */
> +
>  static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
>  {
>  	/*
> @@ -144,12 +167,11 @@ void vkms_compose_row(struct line_buffer *stage_buf=
fer, struct vkms_plane_state
>  }
> =20
>  /*
> - * The following  functions take an line of argb_u16 pixels from the
> - * src_buffer, convert them to a specific format, and store them in the
> - * destination.
> + * The following functions take one &struct pixel_argb_u16 and convert i=
t to a specific format.
> + * The result is stored in @dst_pixels.
>   *
> - * They are used in the `compose_active_planes` to convert and store a l=
ine
> - * from the src_buffer to the writeback buffer.
> + * They are used in vkms_writeback_row() to convert and store a pixel fr=
om the src_buffer to
> + * the writeback buffer.
>   */
>  static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *=
in_pixel)
>  {
> @@ -215,6 +237,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struc=
t pixel_argb_u16 *in_pixel)
>  	*pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
>  }
> =20
> +/**
> + * vkms_writeback_row() - Generic loop for all supported writeback forma=
t. It is executed just
> + * after the blending to write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>  void vkms_writeback_row(struct vkms_writeback_job *wb,
>  			const struct line_buffer *src_buffer, int y)
>  {
> @@ -228,6 +258,13 @@ void vkms_writeback_row(struct vkms_writeback_job *w=
b,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
> =20
> +/**
> + * get_pixel_conversion_function() - Retrieve the correct read_pixel fun=
ction for a specific
> + * format. The returned pointer is NULL for unsupported pixel formats. T=
he caller must ensure that
> + * the pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
> + */
>  void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
> @@ -246,6 +283,13 @@ void *get_pixel_conversion_function(u32 format)
>  	}
>  }
> =20
> +/**
> + * get_pixel_write_function() - Retrieve the correct write_pixel functio=
n for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
> + */
>  void *get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
>=20


--Sig_/EIm6IB..eFYrq.HVSRXLgeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmPRYACgkQI1/ltBGq
qqewxhAAsYnpt/DIidHlYBwpB+wldfXfwL7esJ18ZaI3oUlBqJM4ys8w9dRH/8cZ
VoBam+/xCUUwVB1E5AsW7840IAEiCHAVZGWbSN16Q/cDNgn289aD5taR+A43DyW2
ahsOVkNvMsOvvvPlgcX5VIaegFZ+N/5W55nzDFpJKAMIBioWVwYOG6JNCPr5Bber
6cnwt6dFSn4VkXWDZfVVQUecI1Vj6x85dJIdDDaKLpV571sUsgwGsiATWMwBP8CE
+EFrM89303ZMLzMkcVtBuv5yRYjVV8xGI1tLVqeIWpUtXM8sr+RbjWJaqmG66kiX
/lLam7juC4PeZzI4/djd/B7H/6rkBmMLt+sbifU1S2DGtoT8Wa4zYMPr3/KJ83U7
ANdtarYO+ck65F/eCJlXgBI+OblFuIL0Hchw0HLlpY+8CRbCY4wmyXBkLJCdxly/
R4hhOp0dBTWg7Y56oCmFUuX33R7Ycru0ochzrzGi1P22mWxrLkLFLZNVdHCjDqK7
MSmIaz5b39QjGInyAsBjfJ1X0TkoCX6yc3bfyte2wu8SDTiNi5PDlKCjqSSoHLnT
h9v99dgfeE9QbD3W9JdvULjr0mQhlYR0vZ88rk+ulW8aQCftOHdW+5tJTRWMd7Io
8Ap6pRkMSHFChi5zs3IUYj4WRMOs1aa0uwvk9bptOcz1joxTt8A=
=dlf9
-----END PGP SIGNATURE-----

--Sig_/EIm6IB..eFYrq.HVSRXLgeq--
