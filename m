Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF38AE82E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4263810FC52;
	Tue, 23 Apr 2024 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A9N/00xH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675CE10FC52
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713879007;
 bh=ruMTP2I/pC5dW35z/5uCVwpk0VQNtJqujZBT/QxGijY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A9N/00xHOW33Li8AX1oCVOo1ha1wX31oXg71vYwzCYSZtcMWpaq6Kr4UEcrKWDXWK
 Gea0iiwDw+Km951jibghUdJzoufp5Hyp6HDl2i5xCjKG7Mf8eL0uo7Uu0cRjNewJdI
 OQkruLlnJZJnCyTUoAqjnMdlbM0PpvypSP9JDKlBflVv7jZFPy34X8JQm3Om6+3w2C
 UDSXLIF/HaH/a1jTWZcsOjXZA9LokQCR2ylvheenVJwuTsb4xC9jo0+YqQ3M9gIs7b
 id0qDtelop77UJB/41hVBLhZcgoWymU8NLltKYnEodtFOMncVh6etErrdyc/TRK+XS
 lnLAT031dI46Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B4F323782136;
 Tue, 23 Apr 2024 13:30:06 +0000 (UTC)
Date: Tue, 23 Apr 2024 16:29:57 +0300
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
Subject: Re: [PATCH v6 15/17] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20240423162957.071b8f54.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-15-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-15-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W.z6f=.NMUolWFGBtJaoEiF";
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

--Sig_/W.z6f=.NMUolWFGBtJaoEiF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:33 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Create KUnit tests to test the conversion between YUV and RGB. Test each
> conversion and range combination with some common colors.
>=20
> The code used to compute the expected result can be found in comment.
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - fix minor formating issues (whitespace, double line)
> - change expected alpha from 0x0000 to 0xffff
> - adapt to the new get_conversion_matrix usage
> - apply the changes from Arthur
> - move struct pixel_yuv_u8 to the test itself]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |  15 ++
>  drivers/gpu/drm/vkms/Makefile                 |   1 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 ++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
>  drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
>  7 files changed, 263 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..5b6efabdbb17 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,18 @@ config DRM_VKMS
>  	  a VKMS.
> =20
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for VKMS. This option is not useful for
> +	  distributions or general kernels, but only for kernel
> +	  developers working on VKMS.
> +
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..8d3e46dde635 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -9,3 +9,4 @@ vkms-y :=3D \
>  	vkms_writeback.o
> =20
>  obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) +=3D tests/
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
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/t=
ests/Makefile
> new file mode 100644
> index 000000000000..2d1df668569e
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) +=3D vkms_format_test.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/=
drm/vkms/tests/vkms_format_test.c
> new file mode 100644
> index 000000000000..c7c556b4fd98
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0+

Hi,

what's the kernel licensing convention here, can it really be GPL 2.0
*or later*?

Anyway, while I don't have the knowledge to review the code, the test
cases look good to me, and I love the python snippets.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
> +
> +#include "../../drm_crtc_internal.h"
> +
> +#include "../vkms_drv.h"
> +#include "../vkms_formats.h"
> +
> +#define TEST_BUFF_SIZE 50
> +
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};
> +
> +struct yuv_u8_to_argb_u16_case {
> +	enum drm_color_encoding encoding;
> +	enum drm_color_range range;
> +	size_t n_colors;
> +	struct format_pair {
> +		char *name;
> +		struct pixel_yuv_u8 yuv;
> +		struct pixel_argb_u16 argb;
> +	} colors[TEST_BUFF_SIZE];
> +};
> +
> +/*
> + * The YUV color representation were acquired via the colour python fram=
ework.
> + * Below are the function calls used for generating each case.
> + *
> + * For more information got to the docs:
> + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr=
.html
> + */
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] =3D {
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits =3D 16,
> +	 *                     in_legal =3D False,
> +	 *                     in_int =3D True,
> +	 *                     out_bits =3D 8,
> +	 *                     out_legal =3D False,
> +	 *                     out_int =3D True)
> +	 */
> +	{
> +		.encoding =3D DRM_COLOR_YCBCR_BT601,
> +		.range =3D DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors =3D 6,
> +		.colors =3D {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits =3D 16,
> +	 *                     in_legal =3D False,
> +	 *                     in_int =3D True,
> +	 *                     out_bits =3D 8,
> +	 *                     out_legal =3D True,
> +	 *                     out_int =3D True)
> +	 */
> +	{
> +		.encoding =3D DRM_COLOR_YCBCR_BT601,
> +		.range =3D DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors =3D 6,
> +		.colors =3D {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},

...

--Sig_/W.z6f=.NMUolWFGBtJaoEiF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYnt9UACgkQI1/ltBGq
qqd16RAApID9YLzOvw5NieiDg02b7dN6cDRKs5grp0ht6IoKS8UWs5TB207wZZW8
2D0renS5f265mGES3k42tGyg5Mb8gV5UUafQO4v9UFhrpnxF5Ycd9jbg+EeSDJyA
tm3ijBeAW0wC6FGD37a00Np+MMAyhh3SE6ikZObk+vP4rgK8npv1KKIvhJ+GNvLB
vxroiGtFLU5NjcFbtGJ1VKcCRhPH7gdUF1/7olBI5eFhzRRZ6LOXueXFOuav8FNX
e5d+CUsVnJ9Dp/JsB+4YWFjZhx/8/4pSZS8ouRv1dzdUx90IbibITmDbGwZQgoGZ
0ZDxD8RbIVTLH8z+Gmm7XMzqDmbY9z0I9AEu8eLj/IcBHFLEmx5eZLiLRuIYzBtN
kyoPnhROPuWqlbFLhTICKX0qtVkx/oxRE8gN3niilEmcR/IxWceQ6ANYH3Gv6sKI
ED5SDeAYMDcL3AlJDNWR1BJfGGh4UI/dSFgjGhsDu/be0wWNoioAGSefjw2mU9jb
PtGho4hpov6wE2cEs41njuI881HnoMv2dejrIbcOfS7BLC0tBi9G5Kwil+erY0r5
H3TX9BXrw5+D00wIQ1H1fQsvSAS9HISXCPgHfS+N6dYxVWQj5/VOmIPM6dsc2c2X
n9Us8QrFYmluWNZHbuOoC02YhSSWQhBLokPgzeWUXKH4/BdkMpI=
=XRne
-----END PGP SIGNATURE-----

--Sig_/W.z6f=.NMUolWFGBtJaoEiF--
