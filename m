Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3C808A95
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BC110E8C8;
	Thu,  7 Dec 2023 14:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6E10E8AA;
 Thu,  7 Dec 2023 14:30:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2ca03103155so10121821fa.0; 
 Thu, 07 Dec 2023 06:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701959430; x=1702564230; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=S1k56TY8fmzKBgYQfDOWqpifEDVsaWf3M3j0XMBtels=;
 b=Igh0JOjAbKTxBnKzcbCBYezFr8dmbfSl/FG1jIC9qD86s31Ru5GIaDZJk0FiQ6iN+G
 31pzM2bOHQeo7iJrT+uoeSwu+H94b3JjG8s23iGPETj1b1DN0NXg/cNNXtaknkQ/5zFb
 okmmiDy7UKpYN5FulJKUneFrfqLSvZRhrFQY0olc47YaynQKxbCbqsHTR0030nApaHvv
 Nl7eX6nlaGCruNRqz0jGh8H/SUUBEGFYtuXQl1iTJsYwrqR8vf5m/P0spP14zgj06Oyb
 LFAHiIgh9NogVQvwypITnPjgw1Wg26oen/E/KfzUeSXn9Tbsb6DEopMr12VrGz7Vgr/k
 GL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701959430; x=1702564230;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S1k56TY8fmzKBgYQfDOWqpifEDVsaWf3M3j0XMBtels=;
 b=NBYDe87MDDtoy0YqhjydOMYo1ZMUYznkPokySIt3hFhtncdUgBcthOoUe6wRcRR8x+
 8iiM/8LiQiWRPqd8i9e23EG75E8ErTEpdM78NiiLsIWqNomrhm0KbpFL9CpajLKxfb7t
 VqPqkEhhGp/+EgcBz/XR97LYnQDyXbkkmh5TsXkuNykxBA8/zvFFL52RwwmOTze3yHrY
 my+cX0rN9JqwsRzaXMlT0osiROyADptUpE7tiqe5imwGpfeSm9d6hH5ZdcvlIerMNCrk
 6rcBeCTHRkw1+B1D9cwINTbrOJ+mxjeSutXpe4PBBXvITXnatPhKRgOrYR6ERcV1GmRu
 r6oA==
X-Gm-Message-State: AOJu0YymwNQps+HaXzOEZuSuLaWhS9wop/p41sj7lLOl+i+NVi3eLHZm
 6JAWIh0QiCx3mCyQ7XneN5k=
X-Google-Smtp-Source: AGHT+IHz1TjtLfprSccq658vDnFnLgEJVzppWJss7N2jYiM8z9lSWTEndToMObbNbvQ6a/Mda2t19Q==
X-Received: by 2002:a05:6512:3b85:b0:50b:f798:1ea2 with SMTP id
 g5-20020a0565123b8500b0050bf7981ea2mr1457638lfv.184.1701959429726; 
 Thu, 07 Dec 2023 06:30:29 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac25e2b000000b0050bc9bfae88sm184519lfg.284.2023.12.07.06.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:30:29 -0800 (PST)
Date: Thu, 7 Dec 2023 16:30:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT
 handling
Message-ID: <20231207163017.3fdf0e73@eldfell>
In-Reply-To: <20231108163647.106853-5-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-5-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0nZxWa.psB6q5Sk2vTvK0YH";
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/0nZxWa.psB6q5Sk2vTvK0YH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:23 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
>=20
> v3:
>  - Use include way of testing static functions (Arthur)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |  5 ++
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 62 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |  8 ++-
>  4 files changed, 77 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>=20
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..c1f8b343ff0e 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,8 @@ config DRM_VKMS
>  	  a VKMS.
> =20
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vk=
ms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_VKMS=3Dy
> +CONFIG_DRM_VKMS_KUNIT_TESTS=3Dy
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/=
drm/vkms/tests/vkms_color_tests.c
> new file mode 100644
> index 000000000000..b995114cf6b8
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +
> +#define TEST_LUT_SIZE 16
> +
> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] =3D {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x1111, 0x1111, 0x1111, 0 },
> +	{ 0x2222, 0x2222, 0x2222, 0 },
> +	{ 0x3333, 0x3333, 0x3333, 0 },
> +	{ 0x4444, 0x4444, 0x4444, 0 },
> +	{ 0x5555, 0x5555, 0x5555, 0 },
> +	{ 0x6666, 0x6666, 0x6666, 0 },
> +	{ 0x7777, 0x7777, 0x7777, 0 },
> +	{ 0x8888, 0x8888, 0x8888, 0 },
> +	{ 0x9999, 0x9999, 0x9999, 0 },
> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut test_linear_lut =3D {
> +	.base =3D test_linear_array,
> +	.lut_length =3D TEST_LUT_SIZE,
> +	.channel_value2index_ratio =3D 0xf000fll
> +};
> +
> +
> +static void vkms_color_test_get_lut_index(struct kunit *test)
> +{
> +	int i;
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test=
_linear_array[0].red)), 0);
> +
> +	for (i =3D 0; i < TEST_LUT_SIZE; i++)
> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut=
, test_linear_array[i].red)), i);

Hi,

what about testing with values not directly hitting a LUT element?

> +}
> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);

It would raise much more confidence in lerp_u16() if there were more cases:
- odd a
- odd b
- odd b-a
- b =3D a
- b =3D a + 1

For each of the above:
- t =3D 0.0
- t =3D 1.0
- t =3D 0.0 + 1
- t =3D 1.0 - 1
- t chosen so that result must round/truncate
- t chosen to verify the flipping point of result a (or b) to a+1 (or b-1)

I think those are the fragile points in a lerp implementation.


Thanks,
pq

> +}
> +
> +static struct kunit_case vkms_color_test_cases[] =3D {
> +	KUNIT_CASE(vkms_color_test_get_lut_index),
> +	KUNIT_CASE(vkms_color_test_lerp),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_color_test_suite =3D {
> +	.name =3D "vkms-color",
> +	.test_cases =3D vkms_color_test_cases,
> +};
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 3c99fb8b54e2..6f942896036e 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16=
 *background_color,
>  }
> =20
>  // lerp(a, b, t) =3D a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +u16 lerp_u16(u16 a, u16 b, s64 t)
>  {
>  	s64 a_fp =3D drm_int2fixp(a);
>  	s64 b_fp =3D drm_int2fixp(b);
> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>  	return drm_fixp2int(a_fp + delta);
>  }
> =20
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_v=
alue)
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>  {
>  	s64 color_channel_fp =3D drm_int2fixp(channel_value);
> =20
> @@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const =
char *src_name)
> =20
>  	return ret;
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_color_tests.c"
> +#endif


--Sig_/0nZxWa.psB6q5Sk2vTvK0YH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVx1vkACgkQI1/ltBGq
qqfmDBAAk+HrX7fkvKa4O6QhX9hkB8GRuB5oyqdLGwq1EiHQ43lRoW07AydLrgDx
A0cQqcyQKL3pIdzIrMXXCE3IxheExxuNlQtX5/ehl/ej/nPw0Gp7icNdx/rv4FA8
1uvWKU40icQGaZh4dG58MjrB/vAfzjLbvS14m3A/gWGPQ0LynHkN/4pVxZtafB6Z
swS73eBwkHvCWPIquBVYzmKL3H/mgL5eASmUhAkH0YYXE7NtJlV03WojXBwRrGp/
kvU0EamAsaYAKqRRkDkV4InnherMGqoGRURIBc8cFE/XAYQ5qAnbjlWMdwFGtdOS
vOnZvu+EeYwxObEZk01OqKiFuQ2ke6vmABB2r6CMUoBMkl/x36VCV+3K7GZG+6mR
OEFMRsCQUma3UVRJF7fwq0pTPdWCI/5fmjT8Cz5d9lRxIbuA3LVtRCyt5b7QqeYM
qdJqIS9YiD709xcroIlS4iventQU83esgBXs4Lys5Plv9HvP215/HARj+coXqi7e
oiw7zF4M1Vb7FoH6NESMpHcMCOqtIPzLcRIcmmgLH8pyaYErrN1bqp9vAgE8kw6t
tVpJ7aGFSffVFglunTgDdfi/tgkoAMFEVw9mSj7dRA62rPI4+6K7kkcRRXEeDMl9
jX01ODyHIPIjM8zzs4qb3lialM4DVC20yeleMPY/6UBIjeM8pIg=
=4hHO
-----END PGP SIGNATURE-----

--Sig_/0nZxWa.psB6q5Sk2vTvK0YH--
