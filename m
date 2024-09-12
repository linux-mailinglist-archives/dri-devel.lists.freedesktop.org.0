Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B090A97701A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 20:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6AB10EC03;
	Thu, 12 Sep 2024 18:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCa9xe9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BC110EC03
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726164497; x=1757700497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Sk/qoDmW0VfyaSu2qOZfuZuosCJXcI1/acp4e1YASM=;
 b=SCa9xe9Nw194KnEBQcqyslTRePrpeEnlNeHIWadONftMhR2GIzDe9CQb
 myykZZpLA1pYl84gUjJPIFZoiSqMez7hL5ufDeEj+OgOuoF9ajMoykqEp
 x4NSNUYS7qm6K3B3YqKwafEJepUd5AXQgkNZVKa3+IOlrI3UhnJJz+i3m
 xos8CHd7ghsmlDevJe18wVzFeZMvjbmogs1Vshg0acm1htJewCWSlXDeV
 XMZPthBYLxbZV8KQi22L+1dNebqhwyoMeU9L45buRnRmcw3fG4JNkLuS2
 jK9FA8XCnOTeS/vfegIXYTMoO+n3f2gJcTA58V2Fq/U9Ib9CjFJNJfnUJ A==;
X-CSE-ConnectionGUID: KL3ConcNQNajOhe1trAQkw==
X-CSE-MsgGUID: A8wENU3mSrCcRNFnHuKIOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24977121"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24977121"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:08:17 -0700
X-CSE-ConnectionGUID: 2eYzWbarRF2JKH1ZmFOrwg==
X-CSE-MsgGUID: NQhZjoKTQvSe0sfleF6BGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67725108"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 12 Sep 2024 11:08:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sooEm-0005ZG-2x;
 Thu, 12 Sep 2024 18:08:12 +0000
Date: Fri, 13 Sep 2024 02:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] dma-buf: rework the enable_signaling handling
Message-ID: <202409130132.ScyyyHQm-lkp@intel.com>
References: <20240911085903.1496-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911085903.1496-8-christian.koenig@amd.com>
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
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next drm-tip/drm-tip next-20240912]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-sw_sync-remove-pointless-enable_signaling-implementation/20240911-175943
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240911085903.1496-8-christian.koenig%40amd.com
patch subject: [PATCH 7/7] dma-buf: rework the enable_signaling handling
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240913/202409130132.ScyyyHQm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130132.ScyyyHQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130132.ScyyyHQm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'dma_resv_kunit_active_fence_init':
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:72:9: error: implicit declaration of function 'dma_fence_enable_sw_signaling'; did you mean 'dma_fence_enable_signaling'? [-Wimplicit-function-declaration]
      72 |         dma_fence_enable_sw_signaling(fence);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         dma_fence_enable_signaling


vim +72 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  64  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  65  static void dma_resv_kunit_active_fence_init(struct kunit *test,
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  66  					     struct dma_resv *resv,
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  67  					     enum dma_resv_usage usage)
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  68  {
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  69  	struct dma_fence *fence;
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  70  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  71  	fence = alloc_mock_fence(test);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12 @72  	dma_fence_enable_sw_signaling(fence);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  73  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  74  	dma_resv_lock(resv, NULL);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  75  	dma_resv_reserve_fences(resv, 1);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  76  	dma_resv_add_fence(resv, fence, usage);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  77  	dma_resv_unlock(resv);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  78  }
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
