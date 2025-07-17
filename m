Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F4B0849C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A8310E6AE;
	Thu, 17 Jul 2025 06:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuGN8061";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83610E398;
 Thu, 17 Jul 2025 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752732576; x=1784268576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3TUR3H329JRcagl5EEkKBWyJx/oh9VPFqvTmrMOADPA=;
 b=JuGN8061BuH4xl4FUKv+vX7BHDhI2ljmmsfZSIhbALu4YQAjwk8yxYwj
 Wki3qjXarTDjew1FQa4gLUzTQNLI7WZyxVNZBsouyw2qzF35CMSUq+qUZ
 qMX63IjxOFeWmBYFJtGKHyMbEy0b1KzxVKA77fuRo98r/tVL+Wy69qRJp
 JMdUn0sCkxaGffRgpaQcYKDdrAN1N92+W9sCvKllRhtiPBPjv6Oc1+loX
 c0b6I4OFNH7wAVIMGzJ5H8j95EjbTlf7SmWy8+h2sc3xJSs06zu0v0UOK
 LX69Li7QHK9gPQjTUJELR9cjCOImkqPEn1Td2UjCboQD3BwBsoNO8+fES w==;
X-CSE-ConnectionGUID: eYVn+NgRSW+i8SFOWQEfEw==
X-CSE-MsgGUID: NFqRwwh4Qim22ZIbw/Cfmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54711580"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54711580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 23:09:36 -0700
X-CSE-ConnectionGUID: Q0QX8y0yR6Cw4IiqUGdthQ==
X-CSE-MsgGUID: nGP4UJ8YSgSwH5wqHg1Ihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="163340839"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 23:09:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ucHoB-000DCp-21;
 Thu, 17 Jul 2025 06:09:31 +0000
Date: Thu, 17 Jul 2025 14:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/ttm: rename ttm_bo_put to _fini v2
Message-ID: <202507171307.fakdJF1K-lkp@intel.com>
References: <20250716121522.3340-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716121522.3340-1-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-exynos/exynos-drm-next next-20250716]
[cannot apply to linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-rename-ttm_bo_put-to-_fini-v2/20250716-201605
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250716121522.3340-1-christian.koenig%40amd.com
patch subject: [PATCH] drm/ttm: rename ttm_bo_put to _fini v2
config: i386-buildonly-randconfig-002-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171307.fakdJF1K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171307.fakdJF1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171307.fakdJF1K-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'ttm_bo_validate_swapout':
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:804:9: error: implicit declaration of function 'ttm_bo_put'; did you mean 'ttm_bo_pin'? [-Werror=implicit-function-declaration]
     804 |         ttm_bo_put(bo_big);
         |         ^~~~~~~~~~
         |         ttm_bo_pin
   cc1: some warnings being treated as errors


vim +804 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

8eda41dfc9b2f04 Karolina Stolarek 2024-06-12  759  
5fe3943385c987f Karolina Stolarek 2024-06-12  760  static void ttm_bo_validate_swapout(struct kunit *test)
5fe3943385c987f Karolina Stolarek 2024-06-12  761  {
5fe3943385c987f Karolina Stolarek 2024-06-12  762  	unsigned long size_big, size = ALIGN(BO_SIZE, PAGE_SIZE);
5fe3943385c987f Karolina Stolarek 2024-06-12  763  	enum ttm_bo_type bo_type = ttm_bo_type_device;
5fe3943385c987f Karolina Stolarek 2024-06-12  764  	struct ttm_buffer_object *bo_small, *bo_big;
5fe3943385c987f Karolina Stolarek 2024-06-12  765  	struct ttm_test_devices *priv = test->priv;
5fe3943385c987f Karolina Stolarek 2024-06-12  766  	struct ttm_operation_ctx ctx = { };
5fe3943385c987f Karolina Stolarek 2024-06-12  767  	struct ttm_placement *placement;
5fe3943385c987f Karolina Stolarek 2024-06-12  768  	u32 mem_type = TTM_PL_TT;
5fe3943385c987f Karolina Stolarek 2024-06-12  769  	struct ttm_place *place;
5fe3943385c987f Karolina Stolarek 2024-06-12  770  	struct sysinfo si;
5fe3943385c987f Karolina Stolarek 2024-06-12  771  	int err;
5fe3943385c987f Karolina Stolarek 2024-06-12  772  
5fe3943385c987f Karolina Stolarek 2024-06-12  773  	si_meminfo(&si);
5fe3943385c987f Karolina Stolarek 2024-06-12  774  	size_big = ALIGN(((u64)si.totalram * si.mem_unit / 2), PAGE_SIZE);
5fe3943385c987f Karolina Stolarek 2024-06-12  775  
5fe3943385c987f Karolina Stolarek 2024-06-12  776  	ttm_mock_manager_init(priv->ttm_dev, mem_type, size_big + size);
5fe3943385c987f Karolina Stolarek 2024-06-12  777  
5fe3943385c987f Karolina Stolarek 2024-06-12  778  	place = ttm_place_kunit_init(test, mem_type, 0);
5fe3943385c987f Karolina Stolarek 2024-06-12  779  	placement = ttm_placement_kunit_init(test, place, 1);
5fe3943385c987f Karolina Stolarek 2024-06-12  780  
5fe3943385c987f Karolina Stolarek 2024-06-12  781  	bo_small = kunit_kzalloc(test, sizeof(*bo_small), GFP_KERNEL);
5fe3943385c987f Karolina Stolarek 2024-06-12  782  	KUNIT_ASSERT_NOT_NULL(test, bo_small);
5fe3943385c987f Karolina Stolarek 2024-06-12  783  
5fe3943385c987f Karolina Stolarek 2024-06-12  784  	drm_gem_private_object_init(priv->drm, &bo_small->base, size);
5fe3943385c987f Karolina Stolarek 2024-06-12  785  
5fe3943385c987f Karolina Stolarek 2024-06-12  786  	err = ttm_bo_init_reserved(priv->ttm_dev, bo_small, bo_type, placement,
5fe3943385c987f Karolina Stolarek 2024-06-12  787  				   PAGE_SIZE, &ctx, NULL, NULL,
5fe3943385c987f Karolina Stolarek 2024-06-12  788  				   &dummy_ttm_bo_destroy);
5fe3943385c987f Karolina Stolarek 2024-06-12  789  	KUNIT_EXPECT_EQ(test, err, 0);
5fe3943385c987f Karolina Stolarek 2024-06-12  790  	dma_resv_unlock(bo_small->base.resv);
5fe3943385c987f Karolina Stolarek 2024-06-12  791  
5fe3943385c987f Karolina Stolarek 2024-06-12  792  	bo_big = ttm_bo_kunit_init(test, priv, size_big, NULL);
5fe3943385c987f Karolina Stolarek 2024-06-12  793  
5fe3943385c987f Karolina Stolarek 2024-06-12  794  	dma_resv_lock(bo_big->base.resv, NULL);
5fe3943385c987f Karolina Stolarek 2024-06-12  795  	err = ttm_bo_validate(bo_big, placement, &ctx);
5fe3943385c987f Karolina Stolarek 2024-06-12  796  	dma_resv_unlock(bo_big->base.resv);
5fe3943385c987f Karolina Stolarek 2024-06-12  797  
5fe3943385c987f Karolina Stolarek 2024-06-12  798  	KUNIT_EXPECT_EQ(test, err, 0);
5fe3943385c987f Karolina Stolarek 2024-06-12  799  	KUNIT_EXPECT_NOT_NULL(test, bo_big->resource);
5fe3943385c987f Karolina Stolarek 2024-06-12  800  	KUNIT_EXPECT_EQ(test, bo_big->resource->mem_type, mem_type);
5fe3943385c987f Karolina Stolarek 2024-06-12  801  	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
5fe3943385c987f Karolina Stolarek 2024-06-12  802  	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
5fe3943385c987f Karolina Stolarek 2024-06-12  803  
5fe3943385c987f Karolina Stolarek 2024-06-12 @804  	ttm_bo_put(bo_big);
5fe3943385c987f Karolina Stolarek 2024-06-12  805  	ttm_bo_put(bo_small);
5fe3943385c987f Karolina Stolarek 2024-06-12  806  
5fe3943385c987f Karolina Stolarek 2024-06-12  807  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
5fe3943385c987f Karolina Stolarek 2024-06-12  808  }
5fe3943385c987f Karolina Stolarek 2024-06-12  809  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
