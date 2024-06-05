Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE948FC11E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 03:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACDB10E65D;
	Wed,  5 Jun 2024 01:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8grtWJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635D510E65D;
 Wed,  5 Jun 2024 01:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717550001; x=1749086001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T3ZDGwdqdDGp+1ZnxuOf0BPc6Dwctzf0S9oxqd2XOq8=;
 b=e8grtWJ6hx+Za7QNA/PDKkabAL1aXAKzcoP9/Ut1EmU6YoW/6Uf2qoMy
 //Vo0hDVpKiIhZTjPC+wmN7BL6Ge4ed8U5kqa2mKbcOYvMUud/mif8CTb
 TqNopBFi6jtl36hL3WnlHpUUFjIMP1bRpSJ9UQaRz7YhpiD58+JuvyawF
 qe3oIrnngaYzm9j8qgtvkes0XGAxbHZTXuhT2AlEHVx6PAfxaYTqJKM9W
 P+87NSDi3vFYCR1kh3FR2ugJQqfiAHvMfvGtU/KQlT7eSALV+jQU/njg9
 PkFGmqHJfRTsVHhyoj24VFIDn08UIf24MKSCZ5dkILYtx0jwBS09RlHE5 g==;
X-CSE-ConnectionGUID: 7dwgpkAoRJ24hcMR/YiZHQ==
X-CSE-MsgGUID: dvchM8MvSEaAcDnjDaEJcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13972683"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="13972683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 18:13:20 -0700
X-CSE-ConnectionGUID: Mv8tXKlzSiCJcQkwBBb6IA==
X-CSE-MsgGUID: 7Rw3lQwPTsOCLUk0+KwTlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="42363944"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 04 Jun 2024 18:13:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sEfDH-0000jy-0b;
 Wed, 05 Jun 2024 01:13:15 +0000
Date: Wed, 5 Jun 2024 09:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tursulin@ursulin.net, friedrich.vock@gmx.de
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/ttm: add TTM_PL_FLAG_TRESHOLD
Message-ID: <202406050819.et54U72l-lkp@intel.com>
References: <20240604160503.43359-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604160503.43359-3-christian.koenig@amd.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-add-TTM_PL_FLAG_TRESHOLD/20240605-040913
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240604160503.43359-3-christian.koenig%40amd.com
patch subject: [PATCH 2/6] drm/ttm: add TTM_PL_FLAG_TRESHOLD
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240605/202406050819.et54U72l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050819.et54U72l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050819.et54U72l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_resource.c:339: warning: Function parameter or struct member 'ctx' not described in 'ttm_resource_compatible'


vim +339 drivers/gpu/drm/ttm/ttm_resource.c

46299051794a9c Christian König          2024-06-04  325  
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  326  /**
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  327   * ttm_resource_compatible - check if resource is compatible with placement
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  328   *
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  329   * @res: the resource to check
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  330   * @placement: the placement to check against
cc941c70df3927 Christian König          2023-12-06  331   * @evicting: true if the caller is doing evictions
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  332   *
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  333   * Returns true if the placement is compatible.
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  334   */
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  335  bool ttm_resource_compatible(struct ttm_resource *res,
cc941c70df3927 Christian König          2023-12-06  336  			     struct ttm_placement *placement,
46299051794a9c Christian König          2024-06-04  337  			     struct ttm_operation_ctx *ctx,
cc941c70df3927 Christian König          2023-12-06  338  			     bool evicting)
98cca519df6da6 Christian König          2021-08-30 @339  {
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  340  	struct ttm_buffer_object *bo = res->bo;
544432703b2fe7 Arunpravin Paneer Selvam 2022-08-20  341  	struct ttm_device *bdev = bo->bdev;
98cca519df6da6 Christian König          2021-08-30  342  	unsigned i;
98cca519df6da6 Christian König          2021-08-30  343  
98cca519df6da6 Christian König          2021-08-30  344  	if (res->placement & TTM_PL_FLAG_TEMPORARY)
98cca519df6da6 Christian König          2021-08-30  345  		return false;
98cca519df6da6 Christian König          2021-08-30  346  
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  347  	for (i = 0; i < placement->num_placement; i++) {
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  348  		const struct ttm_place *place = &placement->placement[i];
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  349  		struct ttm_resource_manager *man;
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  350  
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  351  		if (res->mem_type != place->mem_type)
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  352  			continue;
98cca519df6da6 Christian König          2021-08-30  353  
46299051794a9c Christian König          2024-06-04  354  		if (!ttm_place_applicable(place, ctx, evicting))
cc941c70df3927 Christian König          2023-12-06  355  			continue;
cc941c70df3927 Christian König          2023-12-06  356  
cc941c70df3927 Christian König          2023-12-06  357  		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
cc941c70df3927 Christian König          2023-12-06  358  		    !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
cc941c70df3927 Christian König          2023-12-06  359  			continue;
cc941c70df3927 Christian König          2023-12-06  360  
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  361  		man = ttm_manager_type(bdev, res->mem_type);
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  362  		if (man->func->compatible &&
a78a8da51b36c7 Somalapuram Amaranath    2023-11-13  363  		    !man->func->compatible(man, res, place, bo->base.size))
98cca519df6da6 Christian König          2021-08-30  364  			continue;
98cca519df6da6 Christian König          2021-08-30  365  
98cca519df6da6 Christian König          2021-08-30  366  		return true;
98cca519df6da6 Christian König          2021-08-30  367  	}
98cca519df6da6 Christian König          2021-08-30  368  	return false;
98cca519df6da6 Christian König          2021-08-30  369  }
98cca519df6da6 Christian König          2021-08-30  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
