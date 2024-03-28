Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D560F890100
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213010FAE5;
	Thu, 28 Mar 2024 14:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="rjNbN4Uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C521910FAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711634460;
 bh=4eyuktlj3zT+S0v4lDjOGGPXuz5uyxEP9zOsIuqV3IU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rjNbN4UvU30FBUsy6OLV1q02Y4AR8Sd4StjrsgDfdkbqqEeuT/4bchJz0gddXxLao
 qKtA/XmCUKifgYKiVHgGLHKCqlaIiX81cnL9d1hCslPv62yrh5KswPVYe94B3qxeZN
 ptrzmGrPZUF/W4c3IKTwgObjRVhD+bKmngET2b0gu6S92jOwx9hQ4KBVYfYC9P1nl5
 MW/CxvJHniM/6ia9vRcE7LKvVV4VHJQ7TPVkxmp8A2kgUIa0ehfPPfEtlrZ7uu+L0e
 b4CAXXEGnvZ8RNug8Wq5VxToeyMOBlFxyV3tPA0ekP1c3+Wq1NgIFWkK2fseN3Kus0
 WldEfaMgvh19A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D3A73780629;
 Thu, 28 Mar 2024 14:00:59 +0000 (UTC)
Date: Thu, 28 Mar 2024 16:00:57 +0200
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
Subject: Re: [PATCH v5 16/16] drm/vkms: Add support for DRM_FORMAT_R*
Message-ID: <20240328160057.124b32c4.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-16-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-16-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P3OiAf8YwdepAoHMsEV.zAB";
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

--Sig_/P3OiAf8YwdepAoHMsEV.zAB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:10 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> This add the support for:
> - R1/R2/R4/R8
>=20
> R1 format was tested with [1] and [2].
>=20
> [1]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bo=
otlin.com
> [2]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd=
2ac@bootlin.com/
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 100 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_plane.c   |   6 ++-
>  2 files changed, 105 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 863fc91d6d48..cbb2ec09564a 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -201,6 +201,11 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(co=
nst u16 *pixel)
>  	return out_pixel;
>  }
> =20
> +static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
> +{
> +	return argb_u16_from_u8888(255, gray, gray, gray);
> +}
> +
>  VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb,=
 u8 cr,
>  							    struct conversion_matrix *matrix)
>  {
> @@ -269,6 +274,89 @@ static void black_to_argb_u16(const struct vkms_plan=
e_state *plane, int x_start,
>  	}
>  }
> =20
> +static void Rx_read_line(const struct vkms_plane_state *plane, int x_sta=
rt,
> +			 int y_start, enum pixel_read_direction direction, int count,
> +			 struct pixel_argb_u16 out_pixel[], u8 bit_per_pixel, u8 lum_per_leve=
l)
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);

Maybe assert that rem_y =3D 0? Or block_h =3D 1.

> +	int bit_offset =3D (int)rem_x * bit_per_pixel;

Why cast rem_x to int when it was defined to be int?

> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +	int mask =3D (0x1 << bit_per_pixel) - 1;

Since mask will interact with u8, it should be unsigned too.

> +
> +	if (direction =3D=3D READ_LEFT_TO_RIGHT || direction =3D=3D READ_RIGHT_=
TO_LEFT) {
> +		int restart_bit_offset =3D 0;
> +		int step_bit_offset =3D bit_per_pixel;
> +
> +		if (direction =3D=3D READ_RIGHT_TO_LEFT) {
> +			restart_bit_offset =3D 8 - bit_per_pixel;
> +			step_bit_offset =3D -bit_per_pixel;
> +		}
> +
> +		while (out_pixel < end) {
> +			u8 val =3D (*src_pixels & (mask << bit_offset)) >> bit_offset;

or shorter: (*src_pixels >> bit_offset) & mask

However, shouldn't the first pixel be on the high bits?

That how I would understand the comments in drm_fourcc.h.

Again a reason to avoid a solid color fill in IGT.

> +
> +			*out_pixel =3D argb_u16_from_gray8(val * lum_per_level);
> +
> +			bit_offset +=3D step_bit_offset;
> +			if (bit_offset < 0 || 8 <=3D bit_offset) {
> +				bit_offset =3D restart_bit_offset;
> +				src_pixels +=3D step;
> +			}
> +			out_pixel +=3D 1;
> +		}
> +	} else if (direction =3D=3D READ_TOP_TO_BOTTOM || direction =3D=3D READ=
_BOTTOM_TO_TOP) {
> +		while (out_pixel < end) {
> +			u8 val =3D (*src_pixels & (mask << bit_offset)) >> bit_offset;
> +			*out_pixel =3D argb_u16_from_gray8(val * lum_per_level);
> +			src_pixels +=3D step;
> +			out_pixel +=3D 1;
> +		}
> +	}
> +}
> +
> +static void R1_read_line(const struct vkms_plane_state *plane, int x_sta=
rt,
> +			 int y_start, enum pixel_read_direction direction, int count,
> +			 struct pixel_argb_u16 out_pixel[])
> +{
> +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 1, 0=
xFF);
> +}
> +
> +static void R2_read_line(const struct vkms_plane_state *plane, int x_sta=
rt,
> +			 int y_start, enum pixel_read_direction direction, int count,
> +			 struct pixel_argb_u16 out_pixel[])
> +{
> +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 2, 0=
x55);
> +}
> +
> +static void R4_read_line(const struct vkms_plane_state *plane, int x_sta=
rt,
> +			 int y_start, enum pixel_read_direction direction, int count,
> +			 struct pixel_argb_u16 out_pixel[])
> +{
> +	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 4, 0=
x11);
> +}
> +
> +static void R8_read_line(const struct vkms_plane_state *plane, int x_sta=
rt,
> +			 int y_start, enum pixel_read_direction direction, int count,
> +			 struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end =3D out_pixel + count;
> +	u8 *src_pixels;
> +	int rem_x, rem_y;
> +	int step =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels,=
 &rem_x, &rem_y);

Assert on block size?


> +
> +	while (out_pixel < end) {
> +		*out_pixel =3D argb_u16_from_gray8(*src_pixels);
> +		src_pixels +=3D step;
> +		out_pixel +=3D 1;
> +	}
> +}
> +
>  static void ARGB8888_read_line(const struct vkms_plane_state *plane, int=
 x_start, int y_start,
>  			       enum pixel_read_direction direction, int count,
>  			       struct pixel_argb_u16 out_pixel[])
> @@ -582,6 +670,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 f=
ormat)
>  	case DRM_FORMAT_YVU422:
>  	case DRM_FORMAT_YVU444:
>  		return &planar_yuv_read_line;
> +	case DRM_FORMAT_R1:
> +		return &R1_read_line;
> +	case DRM_FORMAT_R2:
> +		return &R2_read_line;
> +	case DRM_FORMAT_R4:
> +		return &R4_read_line;
> +	case DRM_FORMAT_R8:
> +		return &R8_read_line;
>  	default:
>  		/*
>  		 * This is a bug in vkms_plane_atomic_check. All the supported
> @@ -855,6 +951,10 @@ get_conversion_matrix_to_argb_u16(u32 format, enum d=
rm_color_encoding encoding,
>  	case DRM_FORMAT_ARGB16161616:
>  	case DRM_FORMAT_XRGB16161616:
>  	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_R1:
> +	case DRM_FORMAT_R2:
> +	case DRM_FORMAT_R4:
> +	case DRM_FORMAT_R8:
>  		/*
>  		 * Those formats are supported, but they don't need a conversion matri=
x. Return

It is strange that you need to list irrelevant formats here.


>  		 * a valid pointer to avoid kernel panic in case this matrix is used/c=
hecked
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index e21cc92cf497..dc9d62acf350 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -29,7 +29,11 @@ static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_YUV444,
>  	DRM_FORMAT_YVU420,
>  	DRM_FORMAT_YVU422,
> -	DRM_FORMAT_YVU444
> +	DRM_FORMAT_YVU444,
> +	DRM_FORMAT_R1,
> +	DRM_FORMAT_R2,
> +	DRM_FORMAT_R4,
> +	DRM_FORMAT_R8
>  };
> =20
>  static struct drm_plane_state *
>=20

Thanks,
pq

--Sig_/P3OiAf8YwdepAoHMsEV.zAB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFeBkACgkQI1/ltBGq
qqeHVhAAoWHtPFfcwQBZAL8Q2nrXxgfDguVWiSRZBMVFBhBnGc2t1v3U+BSBNy6u
lENqEU1LrzRR3aN9LCJVKvz6/7Iq/qvSZXjsqwbs9WRNSytcOxWAXlss+7yn1TS0
k0DxI1JhJWGCX2D9LyGVc0EzaWKx/GiPqZfAu2F0Tft16IOSUVZ1CT3//XakQGPS
6mNuyC42XPEWkJVyfXz6tNkLrOS8HIYvLPtsNFzJIv/Z5oDGE72N5ZwWma9UfrEa
/3c/szbVru6gYzHn7Yhvm0W/H1zOTMqQFRNuRap4EbjKv4XYd9ZwRexn5r23mGpA
TPZegTlUotCoPUD95ZqQ5oCobP0+K+5CyFy6atBjX0tXkEIdYU1cht4XPeZ2GfsX
4Pwcpzv3ptCgOZXdjZrz9OkwSzpNsMzdUEVsnGTSqpoxGemJpqNUslQ951HvQvri
SIC4ZBQ3WQI7BpjekupY9z/BXnR8VOkGQXdaX8+bkEBVW3zD60A3WQXrUAl71RRP
f1moRzIrRJZYjndttF++GLsBMsTVuUcO6Kce7+n93w8Gzo9tXQzCIRS20uAFJJ0b
C8H/+mBgboXBfq3oZINHsv/F3T2ttxdh7E8cVNsiLChAJzuskdO2kSddPI+vZVqG
GWTBF6l0KNI6qKzoS0r/RqbEQQapSFMm/tPnSk7JV4EAkScMxG4=
=jP0O
-----END PGP SIGNATURE-----

--Sig_/P3OiAf8YwdepAoHMsEV.zAB--
