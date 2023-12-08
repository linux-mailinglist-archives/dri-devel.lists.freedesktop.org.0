Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053A80A477
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118D110E233;
	Fri,  8 Dec 2023 13:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012DE10E008;
 Fri,  8 Dec 2023 13:32:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50d176eb382so458271e87.2; 
 Fri, 08 Dec 2023 05:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702042327; x=1702647127; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=84MuxbsVRpGxKItdu9LFqP8sIWbXLi45AO9b7C+3V9A=;
 b=hsorraa7vRwF5o21y3t1EMPC8bzxxL7b1zXSxN0thmHhKbQ4sp5y6yAqMwtOfrtxUC
 VAm9swj9kJro7/vcyeOa1WMO3+1gpkgCU5nT4gfU0vRxImVh3jDsc4STFlZFc9I/H0pp
 Ezmmk50y2Ny5sv0rdaYTHH3gxQID7MPj5oZnUNOHXAed/FmDqVdrdj19zjPJzEXR2ovP
 XrdkRw6MLKuRhZC02eXlAxjspzrIPGZS/WUEn55qLVY5yPlOoWv0utXLyKgc9K6yv45E
 caPOSI0C6rUUlS44aQxxVPMx45O/LWZk8Gi9TICGK1pJsyAmRC+DYrhR/9lr9tMe5Qq9
 ZyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702042327; x=1702647127;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84MuxbsVRpGxKItdu9LFqP8sIWbXLi45AO9b7C+3V9A=;
 b=B46a9gJrIAcsa0Dw2NbVUZkADbkCCa03EfAGmVeBynKBj85d6lnbp99C0flq+mTVUO
 Kty7XfXlVvemGJM3Z8hyaTPH9Mh91p6gILxPTXkFuSp7OM5XWnRlxKX+IbPz+0R35FOz
 O+UNsyQwYZK9/P1nyzbE1rjw2nwO7h858iW9jH88TTARA1qK3BKQtrM8UTlXshPfcnxi
 CL+FMqV1XojqV432PHknjEJWA7KKYhrA4TwAK113C99sP3zzKDZKvRJp/hdZzjFIU1lU
 XN6W1IVcJyNTTaP/3tQTU2MbToWIBCDHe+5rmjchml5wwAx4luVdRJjRpE2qZYEN0pby
 7RGw==
X-Gm-Message-State: AOJu0YwFW85ZNURiZ3rN3+yYGpC873oAd5UKNdDV89e5k9pv4nEgfrx9
 ufha4aa+SpltRLF1Z/g27A0=
X-Google-Smtp-Source: AGHT+IGaI7J6O13Kpn1CI73ztW8E3pXnRLLmzMb0mPOELe5dyjABUozDl+4H4c+7ljfkIc00N2zKaA==
X-Received: by 2002:a05:6512:1252:b0:50b:f1d9:4976 with SMTP id
 fb18-20020a056512125200b0050bf1d94976mr3201525lfb.14.1702042326924; 
 Fri, 08 Dec 2023 05:32:06 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y1-20020ac24e61000000b0050bff86c497sm219533lfs.23.2023.12.08.05.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:32:06 -0800 (PST)
Date: Fri, 8 Dec 2023 15:32:03 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 23/23] drm/vkms: Add tests for CTM handling
Message-ID: <20231208153203.0b6bdc8f@eldfell>
In-Reply-To: <20231108163647.106853-24-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-24-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0lfclp.HU6dOXX5JGBz6UYN";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/0lfclp.HU6dOXX5JGBz6UYN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:42 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> A whole slew of tests for CTM handling that greatly helped in
> debugging the CTM code. The extent of tests might seem a bit
> silly but they're fast and might someday help save someone
> else's day when debugging this.

To be honest, this looks pretty limited testing. I guess the more
exhaustive tests are in IGT though, would be nice to mention that in
the commit message.

There is not a single case for out of [0.0, 1.0] input nor output.

The offset part is always zero.

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 258 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |   2 +-
>  2 files changed, 259 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/=
drm/vkms/tests/vkms_color_tests.c
> index ad4c2f72fd1e..3eaa2233afbb 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -3,6 +3,7 @@
>  #include <kunit/test.h>
> =20
>  #include <drm/drm_fixed.h>
> +#include <drm/drm_mode.h>
> =20
>  #define TEST_LUT_SIZE 16
> =20
> @@ -80,11 +81,268 @@ static void vkms_color_srgb_inv_srgb(struct kunit *t=
est)
>  	}
>  }
> =20
> +#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
> +#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
> +
> +const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat =3D { {
> +	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
> +} };
> +
> +static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
> +{
> +	struct pixel_argb_s32 ref, out;
> +
> +	/* full white */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0xffff;
> +	ref.g =3D 0xffff;
> +	ref.b =3D 0xffff;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full black */
> +	ref.a =3D 0x0;

This is transparent, btw.

> +	ref.r =3D 0x0;
> +	ref.g =3D 0x0;
> +	ref.b =3D 0x0;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* 50% grey */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0x8000;
> +	ref.g =3D 0x8000;
> +	ref.b =3D 0x8000;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full red to 50% desat */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0x7fff;
> +	ref.g =3D 0x3fff;
> +	ref.b =3D 0x3fff;
> +
> +	out.a =3D 0x0;
> +	out.r =3D 0xffff;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +}
> +
> +const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc =3D { {
> +	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
> +	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
> +	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
> +} };

Would be nice to have a comment explaining where these values came
from, like a snippet of Python printing these. The conversion from real
numbers to this representation is the interesting part.

> +
> +static void vkms_color_ctm_3x4_bt709(struct kunit *test)
> +{
> +	struct pixel_argb_s32 ref, out;
> +
> +	/* full white to bt709 */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0xfffe; /* off by one in 16bpc not a big deal */
> +	ref.g =3D 0x0;
> +	ref.b =3D 0x0;
> +
> +	out.a =3D 0x0;
> +	out.r =3D 0xffff;
> +	out.g =3D 0xffff;
> +	out.b =3D 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 255 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xfe00);

This allows result grossly greater than 1.0.

> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);

This allows grossly negative results.

> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* full black to bt709 */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0x0; /* off by one in 16bpc not a big deal */
> +	ref.g =3D 0x0;
> +	ref.b =3D 0x0;
> +
> +	out.a =3D 0x0;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 0 */
> +	KUNIT_EXPECT_LT(test, out.r, 0x100);
> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* gray to bt709 */
> +	ref.a =3D 0x0;
> +	ref.r =3D 0x7fff; /* off by one in 16bpc not a big deal */
> +	ref.g =3D 0x0;
> +	ref.b =3D 0x0;

This ref does not seem to be used?

> +
> +	out.a =3D 0x0;
> +	out.r =3D 0x7fff;
> +	out.g =3D 0x7fff;
> +	out.b =3D 0x7fff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 127 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x8000);

Maybe a new macro for "expect in between", or "expect with +/-
tolerance"?


Thanks,
pq

> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D red 255 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0xffff;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 54 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x3500);
> +	KUNIT_EXPECT_LT(test, out.r, 0x3700);
> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* blue 157 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
> +	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
> +
> +
> +	/* =3D=3D green 255 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0x0;
> +	out.g =3D 0xffff;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 182 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xB500);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D blue 255 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 18 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1100);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1300);
> +
> +	/* green 111 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x7000);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D red 140 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0x8c8c;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* blue 87 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x5600);
> +	KUNIT_EXPECT_LT(test, out.b, 0x5800);
> +
> +	/* =3D=3D green 140 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0x0;
> +	out.g =3D 0x8c8c;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x6400);
> +	KUNIT_EXPECT_LT(test, out.r, 0x6600);
> +
> +	/* green 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +
> +	/* =3D=3D blue 140 - bt709 enc =3D=3D */
> +	out.a =3D 0x0;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0x8c8c;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* red 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x900);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB00);
> +
> +	/* green 61 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
> +
> +	/* blue 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +}
> +
>  static struct kunit_case vkms_color_test_cases[] =3D {
>  	KUNIT_CASE(vkms_color_test_get_lut_index),
>  	KUNIT_CASE(vkms_color_test_lerp),
>  	KUNIT_CASE(vkms_color_test_linear),
>  	KUNIT_CASE(vkms_color_srgb_inv_srgb),
> +	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
> +	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
>  	{}
>  };
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index c278fb223188..4ead5346007a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *c=
rtc_state, struct line_buff
>  	}
>  }
> =20
> -static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct =
drm_color_ctm_3x4 *matrix)
> +void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_col=
or_ctm_3x4 *matrix)
>  {
>  	s64 rf, gf, bf;
> =20


--Sig_/0lfclp.HU6dOXX5JGBz6UYN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzGtMACgkQI1/ltBGq
qqfesA/9GVsGxccUxB5atkfiis5be5teIppylYclxVZsnG9nGLDeqXJgr8Mq/T7a
+noX8SHpqvoSKDCi7h8KxWXL4Uh3H4GPDvEAoQbuS1BNjrt9ijMp2/5juEfQocxZ
1PKV3ju27Cw8CTJS1ghyiXaav0kMXGCzVp65dUF6IXT0mUETHH3yH6TdCxepWnG8
z7QVdt91P98rYz1E1sIIj1bUZu4ITuTJI795jErMdN5NfbxSkFcUksZbNDiDtSb8
ZEAMFIXj0JgKF+j/nqHuxKGYuDl1dBY9iMd2ttenATQrwPw6QVw8irW6f2LjBwqL
FTBM5j9D4wv/HtGZplfeS2kk02B1GyAHoxw24Ca5QT8pylNkmgVCROIxBDxJ+lj2
3mDs5d1V0Hj3CW0NTwx/nsS1V/YamcnsMYXLqhpw6j5ZOvsfnE5BETzpxX6yJBAN
cWstMpAaHsmTUZgzREmRNRjV1p6efyAgBj7vhesmGyt4qKD2T2rQP4A8H1L0ehDm
Ua/FiT5vXZlTF5294rQwKehvNMvLjjxiaeOyjgMpRxnMQ9ALYhKBcuoJ9s0mHw2a
tbk/NjeZauTgZHkI/iFV1bfXsnM4OMycsKVECF+Aom/5KA+3uwDDIoYGVa7Y7z7L
/CLN4HBLu2lhqNncUexFFaZwokPViQqki1GR9nnqscvrBnncb5Q=
=G3Ue
-----END PGP SIGNATURE-----

--Sig_/0lfclp.HU6dOXX5JGBz6UYN--
