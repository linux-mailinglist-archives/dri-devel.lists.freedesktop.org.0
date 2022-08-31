Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08F5A88DC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 00:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D969D10E4F5;
	Wed, 31 Aug 2022 22:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1738E10E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 22:15:18 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MHz513cSjzDs1Z;
 Wed, 31 Aug 2022 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661984117; bh=BCP+7raKdlaKpGMvntK5ySVtDszgtPBDjBpeJnJN514=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OgkcPJ+LKnprOMT82ZfIZ9etzZWVHPUViR41H1WzEGQxaKgiHZXn7WhKFuaBAWpCR
 wuN5Bbnt7m5/1iibBtemPVkpSNS8R8wsK6rEgDjCtxX2P1G+ffhjP62MloV5S66vrI
 o4/IpAKYAp917l1qpJnKlXlv1r8wYc/c5+Lu8Ja4=
X-Riseup-User-ID: 823A3E7979DFCE69BA24660538A70A080A40A5F874DB9E6DD36FE53F60229F82
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHz4z0M5tz1yPj;
 Wed, 31 Aug 2022 22:15:14 +0000 (UTC)
Message-ID: <a314c255-03cc-da7b-b595-77402ec6dda4@riseup.net>
Date: Wed, 31 Aug 2022 19:15:11 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/format: Split into more granular test cases
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220831215608.349269-1-michal.winiarski@intel.com>
 <20220831215608.349269-2-michal.winiarski@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220831215608.349269-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michał

Some very minor nits inline, but either way:

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

On 8/31/22 18:56, Michał Winiarski wrote:
> While we have multiple test cases, most of them check multiple
> conditions, calling the function that is tested multiple times with
> different arguments (with comments that indicate test case boundary).
> This usually means that it can be easily converted into multiple test
> cases.
> 
> Passing output:
> ============================================================
> ================= drm_format (18 subtests) =================
> [PASSED] drm_format_block_width_invalid
> [PASSED] drm_format_block_width_one_plane
> [PASSED] drm_format_block_width_two_plane
> [PASSED] drm_format_block_width_three_plane
> [PASSED] drm_format_block_width_tiled
> [PASSED] drm_format_block_height_invalid
> [PASSED] drm_format_block_height_one_plane
> [PASSED] drm_format_block_height_two_plane
> [PASSED] drm_format_block_height_three_plane
> [PASSED] drm_format_block_height_tiled
> [PASSED] drm_format_min_pitch_invalid
> [PASSED] drm_format_min_pitch_one_plane_8bpp
> [PASSED] drm_format_min_pitch_one_plane_16bpp
> [PASSED] drm_format_min_pitch_one_plane_24bpp
> [PASSED] drm_format_min_pitch_one_plane_32bpp
> [PASSED] drm_format_min_pitch_two_plane
> [PASSED] drm_format_min_pitch_three_plane_8bpp
> [PASSED] drm_format_min_pitch_tiled

As Jani pointed out in [1], "drm_" prefix can be a bit confusing. I will 
send a patch tomorrow using the prefix "test_drm_" on all tests to make 
the naming more consistent. It would be nice if this patch already hold 
the new naming, but anyway I can send a patch changing it later with the 
new prefix gets approved.

[1] 
https://lore.kernel.org/dri-devel/20220831104941.doc75juindcm5mcl@nostramo.hardline.pl/T/#m82b4e710063b47029a8bd4716d137e575640da9a

> =================== [PASSED] drm_format ====================
> ============================================================
> Testing complete. Ran 18 tests: passed: 18
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_format_test.c | 156 ++++++++++++++++--------
>   1 file changed, 108 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/tests/drm_format_test.c
> index 0efa88bf56a9..1936d2d59908 100644
> --- a/drivers/gpu/drm/tests/drm_format_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_test.c
> @@ -9,100 +9,133 @@
>   
>   #include <drm/drm_fourcc.h>
>   
> -static void igt_check_drm_format_block_width(struct kunit *test)
> +static void drm_format_block_width_invalid(struct kunit *test)
>   {
>   	const struct drm_format_info *info = NULL;
>   
> -	/* Test invalid arguments */
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
> +}
> +
> +static void drm_format_block_width_one_plane(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
>   
> -	/* Test 1 plane format */
> -	info = drm_format_info(DRM_FORMAT_XRGB4444);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> +}
> +
> +static void drm_format_block_width_two_plane(struct kunit *test)

s/plane/planes

Best Regards,
- Maíra Canal

> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
>   
> -	/* Test 2 planes format */
> -	info = drm_format_info(DRM_FORMAT_NV12);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> +}
> +
> +static void drm_format_block_width_three_plane(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
>   
> -	/* Test 3 planes format */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 3), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> +}
> +
> +static void drm_format_block_width_tiled(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
>   
> -	/* Test a tiled format */
> -	info = drm_format_info(DRM_FORMAT_X0L0);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 2);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
>   }
>   
> -static void igt_check_drm_format_block_height(struct kunit *test)
> +static void drm_format_block_height_invalid(struct kunit *test)
>   {
>   	const struct drm_format_info *info = NULL;
>   
> -	/* Test invalid arguments */
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
> +}
> +
> +static void drm_format_block_height_one_plane(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
>   
> -	/* Test 1 plane format */
> -	info = drm_format_info(DRM_FORMAT_XRGB4444);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
> +}
> +
> +static void drm_format_block_height_two_plane(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
>   
> -	/* Test 2 planes format */
> -	info = drm_format_info(DRM_FORMAT_NV12);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> +}
> +
> +static void drm_format_block_height_three_plane(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
>   
> -	/* Test 3 planes format */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 1);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 3), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> +}
> +
> +static void drm_format_block_height_tiled(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
>   
> -	/* Test a tiled format */
> -	info = drm_format_info(DRM_FORMAT_X0L0);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 2);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
>   }
>   
> -static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> +static void drm_format_min_pitch_invalid(struct kunit *test)
>   {
>   	const struct drm_format_info *info = NULL;
>   
> -	/* Test invalid arguments */
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> +}
> +
> +static void drm_format_min_pitch_one_plane_8bpp(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB332);
>   
> -	/* Test 1 plane 8 bits per pixel format */
> -	info = drm_format_info(DRM_FORMAT_RGB332);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> @@ -118,10 +151,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
>   			(uint64_t)UINT_MAX);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
>   			(uint64_t)(UINT_MAX - 1));
> +}
> +
> +static void drm_format_min_pitch_one_plane_16bpp(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
>   
> -	/* Test 1 plane 16 bits per pixel format */
> -	info = drm_format_info(DRM_FORMAT_XRGB4444);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> @@ -137,10 +174,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
>   			(uint64_t)UINT_MAX * 2);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
>   			(uint64_t)(UINT_MAX - 1) * 2);
> +}
> +
> +static void drm_format_min_pitch_one_plane_24bpp(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB888);
>   
> -	/* Test 1 plane 24 bits per pixel format */
> -	info = drm_format_info(DRM_FORMAT_RGB888);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> @@ -154,12 +195,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
>   			(uint64_t)UINT_MAX * 3);
> -	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> +	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
>   			(uint64_t)(UINT_MAX - 1) * 3);
> +}
> +
> +static void drm_format_min_pitch_one_plane_32bpp(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_ABGR8888);
>   
> -	/* Test 1 plane 32 bits per pixel format */
> -	info = drm_format_info(DRM_FORMAT_ABGR8888);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> @@ -173,17 +218,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
>   			(uint64_t)UINT_MAX * 4);
> -	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> +	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
>   			(uint64_t)(UINT_MAX - 1) * 4);
>   }
>   
> -static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
> +static void drm_format_min_pitch_two_plane(struct kunit *test)
>   {
> -	const struct drm_format_info *info = NULL;
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
>   
> -	/* Test 2 planes format */
> -	info = drm_format_info(DRM_FORMAT_NV12);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> @@ -211,10 +255,14 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
>   			(uint64_t)(UINT_MAX - 1));
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
>   			(uint64_t)(UINT_MAX - 1));
> +}
> +
> +static void drm_format_min_pitch_three_plane_8bpp(struct kunit *test)
> +{
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
>   
> -	/* Test 3 planes 8 bits per pixel format */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 0), 0);
> @@ -256,13 +304,12 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
>   			(uint64_t)(UINT_MAX - 1) / 2);
>   }
>   
> -static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
> +static void drm_format_min_pitch_tiled(struct kunit *test)
>   {
> -	const struct drm_format_info *info = NULL;
> +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L2);
>   
> -	/* Test tiled format */
> -	info = drm_format_info(DRM_FORMAT_X0L2);
>   	KUNIT_ASSERT_NOT_NULL(test, info);
> +
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
>   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> @@ -281,12 +328,25 @@ static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
>   }
>   
>   static struct kunit_case drm_format_tests[] = {
> -	KUNIT_CASE(igt_check_drm_format_block_width),
> -	KUNIT_CASE(igt_check_drm_format_block_height),
> -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_single_plane),
> -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_multi_planar),
> -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_tiled_format),
> -	{ }
> +	KUNIT_CASE(drm_format_block_width_invalid),
> +	KUNIT_CASE(drm_format_block_width_one_plane),
> +	KUNIT_CASE(drm_format_block_width_two_plane),
> +	KUNIT_CASE(drm_format_block_width_three_plane),
> +	KUNIT_CASE(drm_format_block_width_tiled),
> +	KUNIT_CASE(drm_format_block_height_invalid),
> +	KUNIT_CASE(drm_format_block_height_one_plane),
> +	KUNIT_CASE(drm_format_block_height_two_plane),
> +	KUNIT_CASE(drm_format_block_height_three_plane),
> +	KUNIT_CASE(drm_format_block_height_tiled),
> +	KUNIT_CASE(drm_format_min_pitch_invalid),
> +	KUNIT_CASE(drm_format_min_pitch_one_plane_8bpp),
> +	KUNIT_CASE(drm_format_min_pitch_one_plane_16bpp),
> +	KUNIT_CASE(drm_format_min_pitch_one_plane_24bpp),
> +	KUNIT_CASE(drm_format_min_pitch_one_plane_32bpp),
> +	KUNIT_CASE(drm_format_min_pitch_two_plane),
> +	KUNIT_CASE(drm_format_min_pitch_three_plane_8bpp),
> +	KUNIT_CASE(drm_format_min_pitch_tiled),
> +	{}
>   };
>   
>   static struct kunit_suite drm_format_test_suite = {
