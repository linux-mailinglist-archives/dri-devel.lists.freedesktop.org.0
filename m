Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517786E0BA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEC510ECBE;
	Fri,  1 Mar 2024 11:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0GjbimLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF26310ECBE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709294016;
 bh=YGZRh0bKcxFHGTj3E5dUozhFR4re8DBslvJLFXS2cWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0GjbimLTrUE6ObJ9MaK+mkDWwoSFdVETlM6hmgNoLczGp7+GUKyALKc3Bs95ExN2K
 T1wOmpL9m1rcRX7GoEb4FWbsZ25I0K2180jJc2RtOTgOTTaNnLeQdoFPn2kMoHgk14
 wPvRJmIVgWKCU9rIb8UZyEY2B9jjEhxVXaw/pgNSDOSwrb2xy36TjY25sXLV9wAHbC
 DDHZLQZEYAZ2A4GTzzz34nOy///N375hYBv6xAfdpoCCUWUTocc9KfUzGoI4b2K1HC
 1Zj2JlY3sJJ5jY5xOBwg1nYatB1qy74xZ5EfJawoJP55LEznRm3wFypwOXZyF8YdwO
 Mkcjjpgx6vL8w==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E90B43780EC6;
 Fri,  1 Mar 2024 11:53:35 +0000 (UTC)
Date: Fri, 1 Mar 2024 13:53:27 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Message-ID: <20240301135327.22efe0dd.pekka.paalanen@collabora.com>
In-Reply-To: <5a45e133-d554-4252-a223-dadced383443@riseup.net>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <5a45e133-d554-4252-a223-dadced383443@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TYmDnefL1VGq17Xl+XSGL7s";
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

--Sig_/TYmDnefL1VGq17Xl+XSGL7s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Feb 2024 14:57:06 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 29/02/24 09:12, Pekka Paalanen wrote:
> > On Wed, 28 Feb 2024 22:52:09 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> On 27/02/24 17:01, Arthur Grillo wrote: =20
> >>>
> >>>
> >>> On 27/02/24 12:02, Louis Chauvet wrote:   =20
> >>>> Hi Pekka,
> >>>>
> >>>> For all the comment related to the conversion part, maybe Arthur hav=
e an=20
> >>>> opinion on it, I took his patch as a "black box" (I did not want to=
=20
> >>>> break (and debug) it).
> >>>>
> >>>> Le 26/02/24 - 14:19, Pekka Paalanen a =C3=A9crit :   =20
> >>>>> On Fri, 23 Feb 2024 12:37:26 +0100
> >>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >>>>>   =20
> >>>>>> From: Arthur Grillo <arthurgrillo@riseup.net>
> >>>>>>
> >>>>>> Add support to the YUV formats bellow:
> >>>>>>
> >>>>>> - NV12
> >>>>>> - NV16
> >>>>>> - NV24
> >>>>>> - NV21
> >>>>>> - NV61
> >>>>>> - NV42
> >>>>>> - YUV420
> >>>>>> - YUV422
> >>>>>> - YUV444
> >>>>>> - YVU420
> >>>>>> - YVU422
> >>>>>> - YVU444
> >>>>>>
> >>>>>> The conversion matrices of each encoding and range were obtained by
> >>>>>> rounding the values of the original conversion matrices multiplied=
 by
> >>>>>> 2^8. This is done to avoid the use of fixed point operations.
> >>>>>>
> >>>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >>>>>> [Louis Chauvet: Adapted Arthur's work and implemented the read_lin=
e_t
> >>>>>> callbacks for yuv formats]
> >>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
> >>>>>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
> >>>>>>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 ++++++++++++++++++++++=
+++++++++++--
> >>>>>>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
> >>>>>>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
> >>>>>>  5 files changed, 295 insertions(+), 20 deletions(-)

...

> >> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/g=
pu/drm/vkms/tests/vkms_format_test.c
> >> index f66584549827..4cee3c2d8d84 100644
> >> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> >> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> >> @@ -59,7 +59,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb=
_u16_cases[] =3D {
> >>  			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> >>  			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> >>  			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> >> -			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> >> +			{"red",   {0x36, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> >>  			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
> >>  			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
> >>  		},
> >> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkm=
s/vkms_formats.c
> >> index e06bbd7c0a67..043f23dbf80d 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >> @@ -121,10 +121,12 @@ static void RGB565_to_argb_u16(u8 **src_pixels, =
struct pixel_argb_u16 *out_pixel
> >>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> >>  }
> >> =20
> >> -static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_off=
set, u8 *r, u8 *g, u8 *b)
> >> +#define BIT_DEPTH 32
> >> +
> >> +static void ycbcr2rgb(const s64 m[3][3], u8 y, u8 cb, u8 cr, u8 y_off=
set, u8 *r, u8 *g, u8 *b)
> >>  {
> >> -	s32 y_16, cb_16, cr_16;
> >> -	s32 r_16, g_16, b_16;
> >> +	s64 y_16, cb_16, cr_16;
> >> +	s64 r_16, g_16, b_16;
> >> =20
> >>  	y_16 =3D  y - y_offset;
> >>  	cb_16 =3D cb - 128;
> >> @@ -134,9 +136,18 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8=
 cb, u8 cr, u8 y_offset, u8 *r,
> >>  	g_16 =3D m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
> >>  	b_16 =3D m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
> >> =20
> >> -	*r =3D clamp(r_16, 0, 0xffff) >> 8;
> >> -	*g =3D clamp(g_16, 0, 0xffff) >> 8;
> >> -	*b =3D clamp(b_16, 0, 0xffff) >> 8;
> >> +	// rounding the values
> >> +	r_16 =3D r_16 + (1LL << (BIT_DEPTH - 4));
> >> +	g_16 =3D g_16 + (1LL << (BIT_DEPTH - 4));
> >> +	b_16 =3D b_16 + (1LL << (BIT_DEPTH - 4));
> >> +
> >> +	r_16 =3D clamp(r_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
> >> +	g_16 =3D clamp(g_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
> >> +	b_16 =3D clamp(b_16, 0, (1LL << (BIT_DEPTH + 8)) - 1); =20
> >=20
> > Where do the BIT_DEPTH - 4 and BIT_DEPTH + 8 come from? =20
>=20
> Basically, the numbers are in this form in hex:
>=20
> 0xsspppppppp
>=20
> In the end, we only want the 's' bits.
>=20
> The matrix multiplication is not giving us perfect results, making some
> of KUnit test not pass, This is because the values end up a little bit
> off. KUnit expects 0xfe, but this functions is returning 0xfd.
>=20
> I noticed that before shifting the values to get the 's' bytes the
> values were a lot close to what is expected, something like:
>=20
> 0xfdfe287312
>     ^
> So the rounding part adds 1 to this marked 'f' to round a bit the values
> (drm_fixed.h does something similar on drm_fixp2int_round).
> Like that:
>=20
>    0xfdfe287312
> +  0x0010000000
>    ------------
>    0xfe0e287312
>=20
> That's why the BIT_DEPTH - 4.

I have a hard time deciphering this. There is some sort of strange
combination of UNORM and fixed-point going on here, where you process
the range 0.0 - 255.0 including 32-bit fraction. All variables being
named "_16" does not help, I've no idea what that refers to.

Usually when you have unsigned pixel format type, it's UNORM, that is
an unsigned integer representation that maps to [0.0, 1.0]. When
converting UNORM properly to e.g. fixed-point, you don't have to
consider the UNORM bit depth when computing in fixed-point.

There is a catch: since 0xff maps to 1.0, the divisor is 0xff, and not
a bit shift by 8. This must be taken into account when converting
between different depths of UNORM, or between UNORM and fixed-point.
Converting between different depths of fixed-point does not have this
problem.

If you want to proper rounding, meaning that 0.5 rounds up to 1.0 and
0.4999 rounds down to 0.0 when rounding to integers, you have to add
0.5 before truncating.

So in this case you need to add 0x0100_0000 / 2 =3D 0x0080_0000, not
0x0010_0000.

I don't understand what drm_fixp2int_round() is even doing. The offset
is not 0.5, it's 0.0000076.

> After that, the values need to be clamped to not get wrong results when
> shifting this s64 and casting it to u8. We clamp it to the minimum
> allowed value: 0, and to the maximum allowed value, which in this case
> is all the (BIT_DEPTH + 8) bits set to 1, The '+ 8' is to account for
> the size of the 's' bits.

Ok. You could also shift with >> BIT_DEPTH first, and then clamp to 0,
255.


Thanks,
pq

> After writing this, I think that maybe it would be good to add this
> explanation as a comment on the code.
>=20
> >  =20
> >> +
> >> +	*r =3D r_16 >> BIT_DEPTH;
> >> +	*g =3D g_16 >> BIT_DEPTH;
> >> +	*b =3D b_16 >> BIT_DEPTH;
> >>  } =20

--Sig_/TYmDnefL1VGq17Xl+XSGL7s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXhwbcACgkQI1/ltBGq
qqfZ7g/7BHqsw5Opqc38QlT5EIkXLQwAE4Eb8Qz/IrYYudbXNrRC56YbNnybka8F
lZ/LGog21Q94WL4RUL1bqn4w8LAKmBdt0fz1GCisIXkxaZWs3FYIsL6HTw6jnbBA
0rySHBx5rx531jd22slJ4QuclfAK1+FDAaRENEtalrzzgby2tzoaCBT9gQA0n0UQ
q1pmNIHCLchiXuBjXKdGtaCQBoKZAL/htH82T4Df8hqn2gHCZdmQROz7NIOdibyx
04XsG2dv4E6ZlPohlmFxE9yVistWFgvwGx0+92JNTwPb1XA5hix74GhTgHKP6nae
OztE3kzJ6NNiVvIfLY7OpMVEatDOHPPu0F+jeLf4TZ0Peo0qV1HXLb2y2AOfXqWf
SwgKF9hu9//Pflx7kKO48kzZUAur8GrnvKKOuUIhG64kMFh9k1dSVwVo7wzLzSzT
02FS6sgB2Kfg4TIoFQY9U4FogR5KQKclCp4e3Tz0ISv6mkcAAmSjEc/d3lo1QuPm
7C3TLRBz6LRaznSVM8tEuIUf6IVOv/Qrxrxe3eA+TN+WT9TFe9Yl+1WWVweG7pbp
j1uWyZXMOrEl8OHxghgTWO283h2d6fW4Aapw7Z65R7oP7MkafkLmq09H+JjGLEpF
DYZhsRett0X4elOxDxHip6c3fa6z1K7Bk2HDop9FMDaRvpmwm18=
=QcSD
-----END PGP SIGNATURE-----

--Sig_/TYmDnefL1VGq17Xl+XSGL7s--
