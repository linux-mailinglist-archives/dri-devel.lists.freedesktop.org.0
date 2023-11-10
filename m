Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F787E7D5C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 16:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B768610E0F6;
	Fri, 10 Nov 2023 15:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25B310E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699629624; x=1731165624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GX6MScbclSL7v4ZHGw/Tj65osMWZVY0XguEmA+oV0Yk=;
 b=WFlFbHOla81d9xaJKwFMjyLcGfdwMOiLtKQZiacEjNWtkN7xeUbWh/zv
 I7nYnFx/24JSQjiH/JM+SM+Rr5QG1OYXobVwhQoUvkqDz3t2fsBORggNs
 0QwhEYMLthu9ql1fpFB5QjHlYxsOdedibZOhwquX0MV4z/tnlfNKNYjAn
 UKUt9O/eSSymIHEqaLq+O93+JBubVJ01MJo9ZE4DUnLs88KphsGF5EXwc
 J+hBymcFoCwY24cuUE0D4MJZp5b4X3LRQs56SaMwYEo+gTCVDt0aARihC
 i2dDsqPTWp6XchKH5wtYGnXK3m2CX9wcNVOXh0cu+m9N0ehMCJFCLz8K7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421288479"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="421288479"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1095209943"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="1095209943"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2023 07:20:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1TIy-0009gL-1c;
 Fri, 10 Nov 2023 15:20:20 +0000
Date: Fri, 10 Nov 2023 23:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 6/8] drm/ttm/tests: Test simple BO creation and
 validation
Message-ID: <202311102325.M7tl1XrM-lkp@intel.com>
References: <79e071dcf440263059445b485833f4988a138b32.1699445194.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e071dcf440263059445b485833f4988a138b32.1699445194.git.karolina.stolarek@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20231108-225515
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/79e071dcf440263059445b485833f4988a138b32.1699445194.git.karolina.stolarek%40intel.com
patch subject: [PATCH v6 6/8] drm/ttm/tests: Test simple BO creation and validation
config: x86_64-randconfig-122-20231110 (https://download.01.org/0day-ci/archive/20231110/202311102325.M7tl1XrM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102325.M7tl1XrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102325.M7tl1XrM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9: sparse:    struct dma_resv_list [noderef] __rcu *
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9: sparse:    void *

vim +98 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

    59	
    60	KUNIT_ARRAY_PARAM(ttm_bo_types, ttm_bo_type_cases,
    61			  ttm_bo_validate_case_desc);
    62	
    63	static void ttm_bo_init_reserved_sys_man(struct kunit *test)
    64	{
    65		const struct ttm_bo_validate_test_case *params = test->param_value;
    66		struct ttm_test_devices *priv = test->priv;
    67		struct ttm_buffer_object *bo;
    68		struct ttm_place *place;
    69		struct ttm_placement *placement;
    70		enum ttm_bo_type bo_type = params->bo_type;
    71		struct ttm_operation_ctx ctx = { };
    72		uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
    73		int err;
    74	
    75		bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
    76		KUNIT_ASSERT_NOT_NULL(test, bo);
    77	
    78		place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0, size);
    79		placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
    80	
    81		drm_gem_private_object_init(priv->drm, &bo->base, size);
    82	
    83		err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
    84					   PAGE_SIZE, &ctx, NULL, NULL,
    85					   &dummy_ttm_bo_destroy);
    86		dma_resv_unlock(bo->base.resv);
    87	
    88		KUNIT_EXPECT_EQ(test, err, 0);
    89		KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
    90		KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
    91		KUNIT_EXPECT_EQ(test, bo->type, bo_type);
    92		KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
    93		KUNIT_EXPECT_PTR_EQ(test, bo->destroy, &dummy_ttm_bo_destroy);
    94		KUNIT_EXPECT_EQ(test, bo->pin_count, 0);
    95		KUNIT_EXPECT_NULL(test, bo->bulk_move);
    96		KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
    97		KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm));
  > 98		KUNIT_EXPECT_NOT_NULL(test, bo->base.resv->fences);
    99		KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
   100	
   101		if (bo_type != ttm_bo_type_kernel)
   102			KUNIT_EXPECT_TRUE(test,
   103					  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
   104	
   105		ttm_resource_free(bo, &bo->resource);
   106		ttm_bo_put(bo);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
