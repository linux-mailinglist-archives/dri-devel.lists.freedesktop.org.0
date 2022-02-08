Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECF4AD588
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1E210E487;
	Tue,  8 Feb 2022 10:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBA810E20C;
 Tue,  8 Feb 2022 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644316524; x=1675852524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x/Uv1dUJ3xcDqp0s0vto9hCh6YR2R94g1RngWFCibK8=;
 b=Eu5PBEjCptyYr7I7G3JI5bi58Os4cfCnRrKpH8zS5hZkT036V1SDV7jr
 wIFYJ74Mt8rus+mqSmfe+NGr7ScGwBn/oLmmluHDDVLdHML1BSIpLWQ+t
 lAyaH9qgOeN9chXhbdLElb+AarWYKXp+DYzd8WeSlpIdH/jUqD36VZUVR
 XHOQq9CErsvu0D3e6wrh+Kstt++OJ4S8hO/4eX41E8N2oERsWf77zFa3L
 Fx6ByPoCbstj9vaOdAZXe4Z56ix26R3a3I6qn77oBg4sILhqlGbY7TO6o
 EVieX9RLkyJpPhqyWYfet6g50oJyshCKjHOHsb7jfl56ZcgnEf1GYirbP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248869617"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248869617"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:35:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="585148692"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO [10.252.10.21])
 ([10.252.10.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:35:11 -0800
Message-ID: <4af33e93-12c1-a6e8-4ae6-cc6122117373@intel.com>
Date: Tue, 8 Feb 2022 10:35:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/7] drm/selftests: Move i915 buddy selftests into drm
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 13:32, Arunpravin wrote:
> - move i915 buddy selftests into drm selftests folder
> - add Makefile and Kconfig support
> - add sanitycheck testcase
> 
> Prerequisites
> - These series of selftests patches are created on top of
>    drm buddy series
> - Enable kselftests for DRM as a module in .config
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

At some point I guess we also want some IGT that picks this up? Like we 
do in tests/drm_mm.c? That way this can get picked up by CI?

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/Kconfig                       |  1 +
>   drivers/gpu/drm/selftests/Makefile            |  3 +-
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |  9 ++++
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 49 +++++++++++++++++++
>   4 files changed, 61 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
>   create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index eb5a57ae3c5c..ff856df3f97f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -71,6 +71,7 @@ config DRM_DEBUG_SELFTEST
>   	select DRM_DP_HELPER
>   	select DRM_LIB_RANDOM
>   	select DRM_KMS_HELPER
> +	select DRM_BUDDY
>   	select DRM_EXPORT_FOR_TESTS if m
>   	default n
>   	help
> diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
> index 0856e4b12f70..5ba5f9138c95 100644
> --- a/drivers/gpu/drm/selftests/Makefile
> +++ b/drivers/gpu/drm/selftests/Makefile
> @@ -4,4 +4,5 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
>   		      test-drm_damage_helper.o test-drm_dp_mst_helper.o \
>   		      test-drm_rect.o
>   
> -obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o
> +obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
> +				    test-drm_buddy.o
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> new file mode 100644
> index 000000000000..a4bcf3a6dfe3
> --- /dev/null
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* List each unit test as selftest(name, function)
> + *
> + * The name is used as both an enum and expanded as igt__name to create
> + * a module parameter. It must be unique and legal for a C identifier.
> + *
> + * Tests are executed in order by igt/drm_buddy
> + */
> +selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> new file mode 100644
> index 000000000000..51e4d393d22c
> --- /dev/null
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#define pr_fmt(fmt) "drm_buddy: " fmt
> +
> +#include <linux/module.h>
> +
> +#include <drm/drm_buddy.h>
> +
> +#include "../lib/drm_random.h"
> +
> +#define TESTS "drm_buddy_selftests.h"
> +#include "drm_selftest.h"
> +
> +static unsigned int random_seed;
> +
> +static int igt_sanitycheck(void *ignored)
> +{
> +	pr_info("%s - ok!\n", __func__);
> +	return 0;
> +}
> +
> +#include "drm_selftest.c"
> +
> +static int __init test_drm_buddy_init(void)
> +{
> +	int err;
> +
> +	while (!random_seed)
> +		random_seed = get_random_int();
> +
> +	pr_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",
> +		random_seed);
> +	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
> +
> +	return err > 0 ? 0 : err;
> +}
> +
> +static void __exit test_drm_buddy_exit(void)
> +{
> +}
> +
> +module_init(test_drm_buddy_init);
> +module_exit(test_drm_buddy_exit);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
