Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6799867348
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EE210F0C1;
	Mon, 26 Feb 2024 11:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DzaTweQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E9F10F0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708947422;
 bh=DTfKitXUtuk+LBFMdzXSYA/8rIWS8LK70EDRsx7jh6Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DzaTweQUunXVDNwdKbGRGdqg7v3ZiXXAGDQqQtx171fteqQ7a7Ecjb3k9GJ2fC8GF
 c3poHH0FJ6z/tMXOu0dAhEyZowTuaTo0y9tjyA7Na5Ku5kqBx9ofFIkl59qeeZfm/u
 5g9e8ek8gpTRoKNKlEgbNSVoNcFd/fS8A+8IxD89Viba9rhHXOWISRXZdGDcg2FqSm
 naTevqBW7ZSjTFjjKaPnMRmLeH5ZSPgQtchNDPc42CXtfPxFc4O6cxzGaDV3E8yoDI
 vnuX6oLPbYne6yti9qfkvXKkpd1jLTWhp1nuCHxuFdM7DFU8mpZ25yImL/Ibn9GA08
 WEzd7Hz4+v2zw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AAA3137820C3;
 Mon, 26 Feb 2024 11:37:01 +0000 (UTC)
Date: Mon, 26 Feb 2024 13:37:00 +0200
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
Subject: Re: [PATCH v2 3/9] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <20240226133700.3fef91d9.pekka.paalanen@collabora.com>
In-Reply-To: <20240223-yuv-v2-3-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-3-aa6be2827bb7@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TDVw7W.a4YM+_F+Ua67KY_L";
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

--Sig_/TDVw7W.a4YM+_F+Ua67KY_L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Feb 2024 12:37:23 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  4 +++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 58 ++++++++++++++++++++++++++++++=
------
>  3 files changed, 66 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index c6d9b4a65809..5b341222d239 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -189,6 +189,10 @@ static void blend(struct vkms_writeback_job *wb,
> =20
>  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> =20
> +	/*
> +	 * The planes are composed line-by-line. It is a necessary complexity t=
o avoid poor
> +	 * blending performance.
> +	 */
>  	for (size_t y =3D 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index b4b357447292..18086423a3a7 100644
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
> + * @map: see drm_shadow_plane_state@data
> + * @rotation: rotation applied to the source.
> + *
> + * @src and @dst should have the same size modulo the rotation.
> + */
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -52,6 +63,8 @@ struct vkms_writeback_job {
>   * vkms_plane_state - Driver specific plane state
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
> index 172830a3936a..cb7a49b7c8e7 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -9,6 +9,17 @@
> =20
>  #include "vkms_formats.h"
> =20
> +/**
> + * packed_pixels_offset() - Get the offset of the block containing the p=
ixel at coordinates x/y
> + * in the first plane
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + *
> + * The caller must be aware that this offset is not always a pointer to =
a pixel. If individual
> + * pixel values are needed, they have to be extracted from the resulting=
 block.

Just wondering how the caller will be able to extract the right pixel
from the block without re-using the knowledge already used in this
function. I'd also expect the function to round down x,y to be
divisible by block dimensions, but that's not visible in this email.
Then the caller needs the remainder from the round-down, too?

> + */
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y)
>  {
>  	struct drm_framebuffer *fb =3D frame_info->fb;
> @@ -17,12 +28,13 @@ static size_t pixel_offset(const struct vkms_frame_in=
fo *frame_info, int x, int
>  			      + (x * fb->format->cpp[0]);
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
> + * @x: The x(width) coordinate inside the plane
> + * @y: The y(height) coordinate inside the plane
>   *
>   * Takes the information stored in the frame_info, a pair of coordinates=
, and
>   * returns the address of the first color channel.
> @@ -53,6 +65,13 @@ static int get_x_position(const struct vkms_frame_info=
 *frame_info, int limit, i
>  	return x;
>  }
> =20
> +/*
> + * The following  functions take pixel data from the buffer and convert =
them to the format
> + * ARGB16161616 in out_pixel.
> + *
> + * They are used in the `vkms_compose_row` function to handle multiple f=
ormats.
> + */
> +
>  static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *=
out_pixel)
>  {
>  	/*
> @@ -145,12 +164,11 @@ void vkms_compose_row(struct line_buffer *stage_buf=
fer, struct vkms_plane_state
>  }
> =20
>  /*
> - * The following  functions take an line of argb_u16 pixels from the
> - * src_buffer, convert them to a specific format, and store them in the
> - * destination.
> + * The following functions take one argb_u16 pixel and convert it to a s=
pecific format. The
> + * result is stored in @dst_pixels.
>   *
> - * They are used in the `compose_active_planes` to convert and store a l=
ine
> - * from the src_buffer to the writeback buffer.
> + * They are used in the `vkms_writeback_row` to convert and store a pixe=
l from the src_buffer to
> + * the writeback buffer.
>   */
>  static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *=
in_pixel)
>  {
> @@ -216,6 +234,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struc=
t pixel_argb_u16 *in_pixel)
>  	*pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
>  }
> =20
> +/**
> + * Generic loop for all supported writeback format. It is executed just =
after the blending to
> + * write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>  void vkms_writeback_row(struct vkms_writeback_job *wb,
>  			const struct line_buffer *src_buffer, int y)
>  {
> @@ -229,6 +255,13 @@ void vkms_writeback_row(struct vkms_writeback_job *w=
b,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
> =20
> +/**
> + * Retrieve the correct read_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
> + * pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: 4cc of the format

Since there are many different 4cc style pixel format definition tables
in existence with conflicting definitions, it would not hurt to be more
specific that this is about DRM_FORMAT_* or drm_fourcc.h.

> + */
>  void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
> @@ -247,6 +280,13 @@ void *get_pixel_conversion_function(u32 format)
>  	}
>  }
> =20
> +/**
> + * Retrieve the correct write_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: 4cc of the format

This too.

> + */
>  void *get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
>=20

I couldn't check if the docs are correct since the patch context is not
wide enough, but they all sound plausible to me.


Thanks,
pq

--Sig_/TDVw7W.a4YM+_F+Ua67KY_L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcd9wACgkQI1/ltBGq
qqfwAQ//TZ+q5sIjLpJU6yScnQu9evuU0tlCTV/OpAKRPWgiZanEaVB3apHmgwIT
Rx4SYiG5IwqAuXKdWz3Ga4qYEr08RpPbA868NzwUUGJKF9NFURZirv/daogBdUIG
xu2h7KYEdmuVylrSgpRyZtDoaVmMffwbW7T2CJq4/MHLqotbjyx/aAPgT9vwV3D8
z/mVpmTng8nRP668ErTfjC06qr83VF9N+TSINKMrLJmcJWiUR+dU5Rd5WjvRmoNm
qQQhxjj7TR8xS9gbFHPxYnCsx+hu1zEzDCFfWbOPdPV4ojFwo7d2y4uSpPLXDo6n
2H8me9NkNGpd/ubySrs9UCa7vgDkfriOIlYKKc7CXOEr98WO9YzK2KzCOwHW8LXT
aVq3OxLHWwPOfzNdeRQNGcJJrsJ+YQOLySNgnk9VKxx/vxMyd/dcmgmzlbR7FSBy
D1DZuaQUsRyNNOYzJxKyWab5DeYpSFh/Mhcy4b9Ob7ECQF972loA0vt2aW3VPiPD
luxaCqvns9c5FxlD1UZh2QPycGCN6WpqRIARIY6H7u43C+clfS5Czft4uLsujnxp
jrXnMjWadbo7fIzd3TvoqF/3WIlraRFetQbiQEIORYkMUMtrGFPqZ1D4V0gbv31f
hTLJcQg3pZDLC4KWOtvJtotVhL74yslfdr8XYmbHERc5VDRQS0w=
=qSvg
-----END PGP SIGNATURE-----

--Sig_/TDVw7W.a4YM+_F+Ua67KY_L--
