Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572AB8982B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD23410E9A4;
	Fri, 19 Sep 2025 12:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eyVkw8DO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419210E9A4;
 Fri, 19 Sep 2025 12:44:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9CB34E40D5E;
 Fri, 19 Sep 2025 12:44:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBBAC606A8;
 Fri, 19 Sep 2025 12:44:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF322102F1935; 
 Fri, 19 Sep 2025 14:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758285848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=1SmIorx94Q9uI/7x0rRtWSlHVjfF+lmoGkUrqcFAiIM=;
 b=eyVkw8DOCgHX8BC2F4LrhrEZeYUXVH/Ae3jULQlE9zx375fkzVcThTnLLezk2QhrI4ihFY
 grHt5sXqhslrXQ2BAPxHQw8uu1Kl2ooUuaMY075v2LyVstT5ILOr55/bTX5LaSbrumdUqC
 /O+pTlN6wTW6O1K+Pwr5HzDmlz2o2eoUfcZelDaXLjMrxBSJcyQV8m/fyx9NVFvTaYO3w9
 9rwLGnaqJFcicqWdS9OGeFzD75Frx5cAr6+M1In6vBxhaIcwzqfu4pndTjI5XDy2fmdpl4
 +7fEX3iwMaDVIADoWC224yTZPXWG0E5zzPnN8vsz8UHfm4jFPaUoa5wLCaINBQ==
Message-ID: <e978ee1e-33a9-42f5-b1bd-528d47a23c03@bootlin.com>
Date: Fri, 19 Sep 2025 14:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Arthur Grillo <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-3-alex.hung@amd.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250815035047.3319284-3-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

With this modification it builds:

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c 
b/drivers/gpu/drm/vkms/vkms_composer.c
index a375f4a65acf..a0ca28a253d2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -13,7 +13,6 @@
   #include <kunit/visibility.h>

   #include "vkms_composer.h"
-#include "vkms_drv.h"

   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
   {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h 
b/drivers/gpu/drm/vkms/vkms_composer.h
index 9316a053e7d7..ebc6a7034c20 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -5,6 +5,8 @@

   #include <kunit/visibility.h>

+#include "vkms_drv.h"
+
   #if IS_ENABLED(CONFIG_KUNIT)
   u16 lerp_u16(u16 a, u16 b, s64 t);
   s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);


Le 15/08/2025 à 05:49, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>   - get_lut_index
>   - lerp_u16
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v11:
>   - Refactor vkms_color_test_lerp() to parametized tests (Maíra Canal)
>   - Sort include file alphabetically (Maíra Canal)

I think you forgot to re-order vkms_color_test.c includes (drv > composer)

> v8:
>   - Update config names (Louis Chauvet)
> 
> v7:
>   - Fix checkpatch warnings and errors (Louis Chauvet)
>    - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
>    - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
>    - Add static to const struct vkms_color_lut test_linear_lut
>   - Add "MODULE_DESCRIPTION" (Jeff Johnson)
> 
> 
> v6:
>   - Eliminate need to include test as .c file (Louis Chauvet)
> 
> v5:
>   - Bring back static for lerp_u16 and get_lut_index (Arthur)
> 
> v4:
>   - Test the critical points of the lerp function (Pekka)
> 
> v3:
>   - Use include way of testing static functions (Arthur)
> 
>   drivers/gpu/drm/vkms/tests/Makefile          |   2 +-
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 130 +++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
>   drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
>   4 files changed, 150 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
> 
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index 5750f0bd9d40..a834d182b022 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -4,4 +4,4 @@ vkms-kunit-tests-y := \
>   	vkms_config_test.o \
>   	vkms_format_test.o
>   
> -obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o vkms_config_test.o vkms_color_test.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> new file mode 100644
> index 000000000000..ee4dc7c62d73
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_mode.h>
> +#include "../vkms_drv.h"
> +#include "../vkms_composer.h"
> +
> +#define TEST_LUT_SIZE 16
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
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
> +/* lerp test parameters */
> +struct vkms_color_test_lerp_params {
> +	s64 t;
> +	__u16 a;
> +	__u16 b;
> +	__u16 expected;
> +};
> +
> +/* lerp test cases */
> +static const struct vkms_color_test_lerp_params color_test_lerp_cases[] = {
> +	/* Half-way round down */
> +	{ 0x80000000 - 1, 0x0, 0x10, 0x8 },
> +	{ 0x80000000 - 1, 0x1, 0x10, 0x8 },	/* Odd a */
> +	{ 0x80000000 - 1, 0x1, 0xf, 0x8 },	/* Odd b */
> +	{ 0x80000000 - 1, 0x10, 0x10, 0x10 },	/* b = a */
> +	{ 0x80000000 - 1, 0x10, 0x11, 0x10 },	/* b = a + 1*/
> +	/* Half-way round up */
> +	{ 0x80000000, 0x0, 0x10, 0x8 },
> +	{ 0x80000000, 0x1, 0x10, 0x9 },		/* Odd a */
> +	{ 0x80000000, 0x1, 0xf, 0x8 },		/* Odd b */
> +	{ 0x80000000, 0x10, 0x10, 0x10 },	/* b = a */
> +	{ 0x80000000, 0x10, 0x11, 0x11 },	/* b = a + 1*/
> +	/*  t = 0.0 */
> +	{ 0x0, 0x0, 0x10, 0x0 },
> +	{ 0x0, 0x1, 0x10, 0x1 },		/* Odd a */
> +	{ 0x0, 0x1, 0xf, 0x1 },			/* Odd b */
> +	{ 0x0, 0x10, 0x10, 0x10 },		/* b = a */
> +	{ 0x0, 0x10, 0x11, 0x10 },		/* b = a + 1*/
> +	/*  t = 1.0 */
> +	{ 0x100000000, 0x0, 0x10, 0x10 },
> +	{ 0x100000000, 0x1, 0x10, 0x10 },	/* Odd a */
> +	{ 0x100000000, 0x1, 0xf, 0xf },		/* Odd b */
> +	{ 0x100000000, 0x10, 0x10, 0x10 },	/* b = a */
> +	{ 0x100000000, 0x10, 0x11, 0x11 },	/* b = a + 1*/
> +	/*  t = 0.0 + 1 */
> +	{ 0x0 + 1, 0x0, 0x10, 0x0 },
> +	{ 0x0 + 1, 0x1, 0x10, 0x1 },		/* Odd a */
> +	{ 0x0 + 1, 0x1, 0xf, 0x1 },		/* Odd b */
> +	{ 0x0 + 1, 0x10, 0x10, 0x10 },		/* b = a */
> +	{ 0x0 + 1, 0x10, 0x11, 0x10 },		/* b = a + 1*/
> +	/*  t = 1.0 - 1 */
> +	{ 0x100000000 - 1, 0x0, 0x10, 0x10 },
> +	{ 0x100000000 - 1, 0x1, 0x10, 0x10 },	/* Odd a */
> +	{ 0x100000000 - 1, 0x1, 0xf, 0xf },	/* Odd b */
> +	{ 0x100000000 - 1, 0x10, 0x10, 0x10 },	/* b = a */
> +	{ 0x100000000 - 1, 0x10, 0x11, 0x11 },	/* b = a + 1*/
> +	/*  t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) */
> +	{ 0x80000000 - 1, 0x0, 0x1, 0x0 },
> +	{ 0x80000000, 0x0, 0x1, 0x1 },
> +};
> +
> +static const struct vkms_color_lut test_linear_lut = {
> +	.base = test_linear_array,
> +	.lut_length = TEST_LUT_SIZE,
> +	.channel_value2index_ratio = 0xf000fll
> +};
> +
> +
> +static void vkms_color_test_get_lut_index(struct kunit *test)
> +{
> +	s64 lut_index;
> +	int i;
> +
> +	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
> +
> +	for (i = 0; i < TEST_LUT_SIZE; i++) {
> +		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
> +	}
> +}
> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(color_test_lerp_cases); i++) {
> +		const struct vkms_color_test_lerp_params *params = &color_test_lerp_cases[i];
> +
> +		KUNIT_EXPECT_EQ(test, lerp_u16(params->a, params->b, params->t), params->expected);
> +	}
> +}
> +
> +static struct kunit_case vkms_color_test_cases[] = {
> +	KUNIT_CASE(vkms_color_test_get_lut_index),
> +	KUNIT_CASE(vkms_color_test_lerp),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_color_test_suite = {
> +	.name = "vkms-color",
> +	.test_cases = vkms_color_test_cases,
> +};
> +
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index fa269d279e25..a375f4a65acf 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -10,7 +10,9 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_vblank.h>
>   #include <linux/minmax.h>
> +#include <kunit/visibility.h>
>   
> +#include "vkms_composer.h"
>   #include "vkms_drv.h"
>   
>   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> @@ -60,7 +62,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>   }
>   
>   // lerp(a, b, t) = a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
>   {
>   	s64 a_fp = drm_int2fixp(a);
>   	s64 b_fp = drm_int2fixp(b);
> @@ -69,13 +71,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>   
>   	return drm_fixp2int_round(a_fp + delta);
>   }
> +EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
>   
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> +VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>   {
>   	s64 color_channel_fp = drm_int2fixp(channel_value);
>   
>   	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
>   }
> +EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
>   
>   /*
>    * This enum is related to the positions of the variables inside
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> new file mode 100644
> index 000000000000..9316a053e7d7
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_COMPOSER_H_
> +#define _VKMS_COMPOSER_H_
> +
> +#include <kunit/visibility.h>
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +u16 lerp_u16(u16 a, u16 b, s64 t);
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
> +#endif
> +
> +#endif /* _VKMS_COMPOSER_H_ */

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


