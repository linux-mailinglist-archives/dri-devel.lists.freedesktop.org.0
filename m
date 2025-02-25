Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBFA43A49
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EDA10E5E4;
	Tue, 25 Feb 2025 09:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DucSEBiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CDF10E5E1;
 Tue, 25 Feb 2025 09:51:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D473C433E9;
 Tue, 25 Feb 2025 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740477099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=daz6XIwQt+4+EyXCRI/UZAxdQaTrgBamQkele6r+r3U=;
 b=DucSEBiXJ1ZfEYobtiYF4x4SwIuiXcEfnfUjWJO9BL8Zx+41ZZoks1tc/BRbOcQZsNtEaK
 FCFWEvIBc3CwnV0PXKGkqxW37Go5X3K1Jt8HS5v90PA6sNiapUoUwJhXn6IXYeLxfTS9m0
 9RuX7BI3pyf6Y2RKCNJZdse1uHXgogpbicphokQaWfE2IwpRRfYCDR6DrTSEDPqLXgkb2X
 +M7jKqj0owIfmTXwC7JDBQ6epHouvngyp2U7zA3ZXP7ubYMNdF2DvqGLXcGRmenzToylf2
 bJEGJffSyVKDkro+2HORYB26EdPuz/DfCPPpy188RuK7+G1RfrU6l4c6+fct0Q==
Message-ID: <e8651c30-e602-4dd4-bb2c-0e6bca61e53b@bootlin.com>
Date: Tue, 25 Feb 2025 10:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 03/45] drm/vkms: Add kunit tests for VKMS LUT handling
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-4-alex.hung@amd.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20241220043410.416867-4-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprghlvgigrdhhuhhnghesrghmugdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeifrgihlhgrnhguqdguvghvvghlsehlihhst
 hhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhgrrhhrhidrfigvnhhtlhgrnhgusegrmhgurdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvth
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 20/12/2024 à 05:33, Alex Hung a écrit :
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

Hi,

I would like to take this patch too. Can I take it with the 
modifications below:

> ---
> v7:
>   - Fix checkpatch warnings and errors (Louis Chauvet)
>    - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
>    - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
>    - Add static to const struct vkms_color_lut test_linear_lut
>   - Add "MODULE_DESCRIPTION" (Jeff Johnson)
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
>   drivers/gpu/drm/vkms/Kconfig                 |  15 ++
>   drivers/gpu/drm/vkms/Makefile                |   1 +
>   drivers/gpu/drm/vkms/tests/.kunitconfig      |   4 +
>   drivers/gpu/drm/vkms/tests/Makefile          |   3 +
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
>   drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
>   7 files changed, 214 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>   create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..59c4a32adb9d 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,18 @@ config DRM_VKMS
>   	  a VKMS.
>   
>   	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS

Can I change to:

	config DRM_VKMS_KUNIT_TEST

> +	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS

Can I change to:

	tristate "KUnit tests for VKMS" if !KUNIT_ALL_TESTS

> +	depends on DRM_VKMS=y && KUNIT

Can I change to:

	depends on DRM_VKMS && KUNIT

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
> @@ -9,3 +9,4 @@ vkms-y := \
>   	vkms_writeback.o
>   
>   obj-$(CONFIG_DRM_VKMS) += vkms.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VKMS=y
> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> new file mode 100644
> index 000000000000..7876ca7a3c42
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_color_test.o
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> new file mode 100644
> index 000000000000..b53beaac2703
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -0,0 +1,172 @@
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
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);

Needs to be changed to: (Can I do it?)

	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Thanks,
Louis Chauvet

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
> +	/*** half-way round down ***/
> +	s64 t = 0x80000000 - 1;
> +
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** half-way round up ***/
> +	t = 0x80000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t = 0.0 ***/
> +	t = 0x0;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 ***/
> +	t = 0x100000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t = 0.0 + 1 ***/
> +	t = 0x0 + 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 - 1 ***/
> +	t = 0x100000000 - 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
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
> index 3d6785d081f2..d15ceac6c56f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,8 @@
>   #include <linux/minmax.h>
>   
>   #include "vkms_drv.h"
> +#include <kunit/visibility.h>
> +#include "vkms_composer.h"
>   
>   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>   {
> @@ -91,7 +93,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>   }
>   
>   // lerp(a, b, t) = a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
>   {
>   	s64 a_fp = drm_int2fixp(a);
>   	s64 b_fp = drm_int2fixp(b);
> @@ -100,13 +102,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
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
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

