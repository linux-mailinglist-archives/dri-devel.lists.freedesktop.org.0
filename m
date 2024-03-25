Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466D889E50
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C66B10E7FD;
	Mon, 25 Mar 2024 12:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WX4pJWAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609910E7FD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711368358;
 bh=urUlskVF1KnfQlDtknAbEr8kdfcG/5U1NP+BNXGZhT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WX4pJWAzAjjUpde6HrCJleURhY8ByDAKJWz7ravpdkKt5Cn+kNxQEaZQoBfq+lRt7
 B9SETv04Obnx1o38ilVeNHExkwVL19sXUBzoAPIKpOWQBMO3uTlW+MwUkiJP8PzSHA
 7pPoVwV4g0BbBhNAbkRweCKLoasFXMlzL0s80UdwQ3yGOZ9rtFX7SpoXjhLEcQmuZr
 u0GqqNddLoH0gR72zkWhnf3SVqUydtnTTRkSMU6UWp7Zfmkcb+AGh+5DPOwGyWIDFw
 2++U/TV6gaUmtH5+qJBJySM0hkV3SA6Bk6ZmvjdOwYZh/7Rfk1X1LCpdm3K9Gi+GlT
 ULMVif5qgp8og==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA91F3780626;
 Mon, 25 Mar 2024 12:05:57 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:05:56 +0200
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
Subject: Re: [PATCH v5 06/16] drm/vkms: Use const for input pointers in
 pixel_read an pixel_write functions
Message-ID: <20240325140556.53554dba.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-6-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-6-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z4/SWWArwoqn2CwAMXM4tq_";
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

--Sig_/z4/SWWArwoqn2CwAMXM4tq_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:00 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As the pixel_read and pixel_write function should never modify the input
> buffer, mark those pointers const.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  4 ++--
>  drivers/gpu/drm/vkms/vkms_formats.c | 24 ++++++++++++------------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 4bfc62d26f08..3ead8b39af4a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -61,7 +61,7 @@ struct line_buffer {
>   * @out_pixel: destination address to write the pixel
>   * @in_pixel: pixel to write
>   */
> -typedef void (*pixel_write_t)(u8 *out_pixel, struct pixel_argb_u16 *in_p=
ixel);
> +typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16=
 *in_pixel);
> =20
>  struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> @@ -76,7 +76,7 @@ struct vkms_writeback_job {
>   * @in_pixel: Pointer to the pixel to read
>   * @out_pixel: Pointer to write the converted pixel
>   */
> -typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pi=
xel);
> +typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *=
out_pixel);
> =20
>  /**
>   * vkms_plane_state - Driver specific plane state
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index b57d85b8b935..b2f8dfc26c35 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -76,7 +76,7 @@ static int get_x_position(const struct vkms_frame_info =
*frame_info, int limit, i
>   * They are used in the `vkms_compose_row` function to handle multiple f=
ormats.
>   */
> =20
> -static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *ou=
t_pixel)
> +static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u=
16 *out_pixel)
>  {
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -90,7 +90,7 @@ static void ARGB8888_to_argb_u16(u8 *in_pixel, struct p=
ixel_argb_u16 *out_pixel)
>  	out_pixel->b =3D (u16)in_pixel[0] * 257;
>  }
> =20
> -static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *ou=
t_pixel)
> +static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u=
16 *out_pixel)
>  {
>  	out_pixel->a =3D (u16)0xffff;
>  	out_pixel->r =3D (u16)in_pixel[2] * 257;
> @@ -98,7 +98,7 @@ static void XRGB8888_to_argb_u16(u8 *in_pixel, struct p=
ixel_argb_u16 *out_pixel)
>  	out_pixel->b =3D (u16)in_pixel[0] * 257;
>  }
> =20
> -static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
> +static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_ar=
gb_u16 *out_pixel)
>  {
>  	u16 *pixel =3D (u16 *)in_pixel;
> =20
> @@ -108,7 +108,7 @@ static void ARGB16161616_to_argb_u16(u8 *in_pixel, st=
ruct pixel_argb_u16 *out_pi
>  	out_pixel->b =3D le16_to_cpu(pixel[0]);
>  }
> =20
> -static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
> +static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_ar=
gb_u16 *out_pixel)
>  {
>  	u16 *pixel =3D (u16 *)in_pixel;
> =20
> @@ -118,7 +118,7 @@ static void XRGB16161616_to_argb_u16(u8 *in_pixel, st=
ruct pixel_argb_u16 *out_pi
>  	out_pixel->b =3D le16_to_cpu(pixel[0]);
>  }
> =20
> -static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_=
pixel)
> +static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16=
 *out_pixel)
>  {
>  	u16 *pixel =3D (u16 *)in_pixel;
> =20
> @@ -143,7 +143,7 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct p=
ixel_argb_u16 *out_pixel)
>   * It is used to avoid null pointer to be used as a function. In theory,=
 this function should
>   * never be called, except if you found a bug in the driver/DRM core.
>   */
> -static void black_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_p=
ixel)
> +static void black_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 =
*out_pixel)
>  {
>  	out_pixel->a =3D (u16)0xFFFF;
>  	out_pixel->r =3D 0;
> @@ -189,7 +189,7 @@ void vkms_compose_row(struct line_buffer *stage_buffe=
r, struct vkms_plane_state
>   * They are used in the `vkms_writeback_row` to convert and store a pixe=
l from the src_buffer to
>   * the writeback buffer.
>   */
> -static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *i=
n_pixel)
> +static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_=
u16 *in_pixel)
>  {
>  	/*
>  	 * This sequence below is important because the format's byte order is
> @@ -207,7 +207,7 @@ static void argb_u16_to_ARGB8888(u8 *out_pixel, struc=
t pixel_argb_u16 *in_pixel)
>  	out_pixel[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
>  }
> =20
> -static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *i=
n_pixel)
> +static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_=
u16 *in_pixel)
>  {
>  	out_pixel[3] =3D 0xff;
>  	out_pixel[2] =3D DIV_ROUND_CLOSEST(in_pixel->r, 257);
> @@ -215,7 +215,7 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, struc=
t pixel_argb_u16 *in_pixel)
>  	out_pixel[0] =3D DIV_ROUND_CLOSEST(in_pixel->b, 257);
>  }
> =20
> -static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u1=
6 *in_pixel)
> +static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_a=
rgb_u16 *in_pixel)
>  {
>  	u16 *pixel =3D (u16 *)out_pixel;
> =20
> @@ -225,7 +225,7 @@ static void argb_u16_to_ARGB16161616(u8 *out_pixel, s=
truct pixel_argb_u16 *in_pi
>  	pixel[0] =3D cpu_to_le16(in_pixel->b);
>  }
> =20
> -static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u1=
6 *in_pixel)
> +static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_a=
rgb_u16 *in_pixel)
>  {
>  	u16 *pixel =3D (u16 *)out_pixel;
> =20
> @@ -235,7 +235,7 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, s=
truct pixel_argb_u16 *in_pi
>  	pixel[0] =3D cpu_to_le16(in_pixel->b);
>  }
> =20
> -static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_=
pixel)
> +static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u1=
6 *in_pixel)
>  {
>  	u16 *pixel =3D (u16 *)out_pixel;
> =20
> @@ -260,7 +260,7 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct =
pixel_argb_u16 *in_pixel)
>   * It is used to avoid null pointer to be used as a function. In theory,=
 this should never
>   * happen, except if there is a bug in the driver
>   */
> -static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in=
_pixel)
> +static void argb_u16_to_nothing(u8 *out_pixel, const struct pixel_argb_u=
16 *in_pixel)
>  {}
> =20
>  /**
>=20


--Sig_/z4/SWWArwoqn2CwAMXM4tq_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBaKQACgkQI1/ltBGq
qqdfpg/9HXHg6r5pNWdePlii0w6utfRWtOurTeVm0S4Z6F2ravutG3A9QCMSqDtN
sS1scLB6Yqfwv+L7zh6gZ+8ldWjhVOhq1w8jc6kaTy+pcmgUrXa9FU/3DT3hsf9I
ikIISFNQOurDCfecYUOPM+LWp4K9TbTiCX/g+iT2zy3m0ertSMD6l9PoaAnD/Dy2
SzZ1HhFNjDUjDoounmJRbdTRv+V64qyFZzhchnJNXXQKe5OrugTrD24w3CzjiANC
4jFIcnyGy0S9jO7ZqgJp9NzTgOODtqssCBpOrABZ3eZ1UQrAJ9zgO8ZO3W9hVb76
dAunV009mMOzvud7oJ8oGlPDNzlz+OIlfFw1ic7Zjr7pnIrOiAJez+4WhVRdoZDe
jehZzVwO533fwEaOjaR9M0iRzcclUkfNeczokx3HElmg5LWCCBruvq4w/ZCIpWjN
Zxpl3hP4ouLm/l5YbHWr+45DVfmfEg83ypwRwyCu61cQMjorZi8q1VeSzOlsVoye
Zmz/V0pqI59GFwsb3RwkP/AmDEE/KBBD/T124jA/9bAW7WmSiziAfC6FyrhvWC3B
TBThpZF5DpI2yXhxLk+D7K3vNI5ldx1RRTjpSXqwVcsylosFsz29wHBSDk++SMvD
5JZmmRxeioab+nononDw/tSkLxlaXER5E5SOqHAHapFBMWOPFy4=
=lgfT
-----END PGP SIGNATURE-----

--Sig_/z4/SWWArwoqn2CwAMXM4tq_--
