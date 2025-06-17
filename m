Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE82ADC902
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 13:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833E10E4D6;
	Tue, 17 Jun 2025 11:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MVAcs4tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097710E144;
 Tue, 17 Jun 2025 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yooUum23d4Xs+zPJPb7zQ9ouAmTI9/a+ibmXXVbyQ4I=; b=MVAcs4tnTWSkV2tgtDB/Ggjzlm
 NQLkSpAQ6wxTmWSBFt2+t3DmzaTNOevziarRxWUK/tCMaKOvXlQmIvFO17mVWVMcSaG/DQ5LgLrJ/
 q+0VW/yDFTrf5pNwJmG4wgGvIUdy0sHbPl0WRX03uhBgWhAlW8zg82H0GCpo1xN8BrJWlqJD/vD+d
 R5ubnso/5T4Bv8g6bHWTh9uQr99T94hNSdKO5FZ5KDtZrjLGW+4/F3vOrMCCgXsoMEb3Umiq0oZOY
 Qc02Mf02iwHbretvG4h5HA2K6tdJCMZ1autZHgqMZTI3xOIripxuvWjYqYAkSJxZv51b+eP/GrXGM
 4tCfq13A==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRU7J-004Ycd-TX; Tue, 17 Jun 2025 13:04:38 +0200
Message-ID: <6bc0883c-beeb-4460-8919-77dbce00ac12@igalia.com>
Date: Tue, 17 Jun 2025 08:04:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 19/46] drm/tests: Add a few tests around drm_fixed.h
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
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-20-alex.hung@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250617041746.2884343-20-alex.hung@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 17/06/25 01:17, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> While working on the CTM implementation of VKMS I had to ascertain
> myself of a few assumptions. One of those is whether drm_fixed.h
> treats its numbers using signed-magnitude or twos-complement. It is
> twos-complement.
> 
> In order to make someone else's day easier I am adding the
> drm_test_int2fixp test that validates the above assumption.
> 
> I am also adding a test for the new sm2fixp function that converts
> from a signed-magnitude fixed point to the twos-complement fixed
> point.
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v7:
>   - Fix checkpatch warnings (Louis Chauvet)
> 
> v6:
>   - add missing MODULE_DESCRIPTION (Jeff Johnson)
>   - fix buffer overflow
> 
> 
>   drivers/gpu/drm/tests/Makefile        |  3 +-
>   drivers/gpu/drm/tests/drm_fixp_test.c | 71 +++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 3afd6587df08..91437cf34d92 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_modes_test.o \
>   	drm_plane_helper_test.o \
>   	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o	\
> +	drm_fixp_test.o
>   
>   CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
> new file mode 100644
> index 000000000000..de91177af213
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_fixp_test.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#include <kunit/test.h>
> +#include <drm/drm_fixed.h>
> +
> +static void drm_test_sm2fixp(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1ull << 63) - 1));
> +
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1),
> +			drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
> +
> +	/* 0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2),
> +			drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2),
> +			drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
> +}
> +
> +static void drm_test_int2fixp(struct kunit *test)
> +{
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
> +
> +	/* 1 + (-1) = 0 */
> +	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
> +
> +	/* 1 / 2 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
> +
> +	/* (1 / 2) + (-1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
> +
> +	/* (1 / 2) - 1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
> +
> +	/* (1 / 2) - 1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
> +}
> +
> +static struct kunit_case drm_fixp_tests[] = {
> +	KUNIT_CASE(drm_test_int2fixp),
> +	KUNIT_CASE(drm_test_sm2fixp),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_rect_test_suite = {

Instead of `drm_rect_test_suite`, how about `drm_fixp_test_suite`?

> +	.name = "drm_fixp",
> +	.test_cases = drm_fixp_tests,
> +};
> +
> +kunit_test_suite(drm_rect_test_suite);
> +
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");

 From the kernel docs, "GPL and additional rights" shouldn't be used in
new code [1].

[1] https://docs.kernel.org/process/license-rules.html#id1

Best Regards,
- Maíra

> +MODULE_DESCRIPTION("Unit tests for drm_fixed.h");

