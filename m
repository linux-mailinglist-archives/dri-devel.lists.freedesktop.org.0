Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4D9A9FBD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 12:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221C110E64C;
	Tue, 22 Oct 2024 10:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgBOPCG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C0510E206;
 Tue, 22 Oct 2024 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729592013; x=1761128013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oqGQYtWr8vWI99/SR6Frl6Jm5kQAOQev+uKlIbV/XhA=;
 b=PgBOPCG5mtxBaO8xECRDZP5XbYZV2xeYbIQi4OZWzbQfWatTTXovGWyo
 O2OxGjNnfbUkE+kvVT6u7lJ2/WFpWs0+CzN/LI+XgGylDbFH5Ms4TTjzS
 KT9G1X9s8G6TGwu9YxOQ+sEp6abTqV6YzMEH9Q+juRwKG34JkUYvqHTBi
 D61p/KpCaPJ/kcN9rJP8SRR+wFGqqRCkFrRa65iClzO028nhz3j36aeHp
 KnCysWtr5zrsmrz6mVwcSazUT30QeqoHgfr2NvtO0VsChBdNDE5HyCl/A
 FhWc+DSrHrZ5GUFYrZuwyGtZW9+OvoDoU6+ywzgvKn710iQiGEzxFqMX5 A==;
X-CSE-ConnectionGUID: RB/pRQHSQa+CV3B86x9uQg==
X-CSE-MsgGUID: FUS82XWVRhykI3LT9dLwSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29218394"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="29218394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:13:33 -0700
X-CSE-ConnectionGUID: GYI3IYrsRMarQ2fdIUunqQ==
X-CSE-MsgGUID: 3PXNpFNDQQWjgQ7fpBomCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80228365"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 03:13:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t3BtI-000TQU-2c;
 Tue, 22 Oct 2024 10:13:28 +0000
Date: Tue, 22 Oct 2024 18:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
Message-ID: <202410221702.FLgKnDgM-lkp@intel.com>
References: <20241021052236.1820329-5-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021052236.1820329-5-vivek.kasireddy@intel.com>
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

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/PCI-P2PDMA-Don-t-enforce-ACS-check-for-functions-of-same-device/20241021-134804
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241021052236.1820329-5-vivek.kasireddy%40intel.com
patch subject: [PATCH v2 4/5] drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
config: i386-buildonly-randconfig-003-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221702.FLgKnDgM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221702.FLgKnDgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221702.FLgKnDgM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_translate_iova_to_dpa':
>> drivers/gpu/drm/xe/xe_bo.c:591:29: error: invalid use of undefined type 'struct drm_pagemap_dma_addr'
     591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
         |                             ^
>> drivers/gpu/drm/xe/xe_bo.c:591:35: error: implicit declaration of function 'drm_pagemap_dma_addr_encode' [-Werror=implicit-function-declaration]
     591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_bo.c:592:49: error: 'DRM_INTERCONNECT_DRIVER' undeclared (first use in this function)
     592 |                                                 DRM_INTERCONNECT_DRIVER,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:592:49: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/xe/xe_bo.c:591:33: error: invalid use of undefined type 'struct drm_pagemap_dma_addr'
     591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
         |                                 ^
   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_sg_to_dma_addr_array':
>> drivers/gpu/drm/xe/xe_bo.c:626:55: error: invalid application of 'sizeof' to incomplete type 'struct drm_pagemap_dma_addr'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                                                       ^
   include/linux/alloc_tag.h:202:16: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:626:24: note: in expansion of macro 'kmalloc_array'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                        ^~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_bo.c:626:55: error: invalid application of 'sizeof' to incomplete type 'struct drm_pagemap_dma_addr'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                                                       ^
   include/linux/alloc_tag.h:202:34: note: in definition of macro 'alloc_hooks_tag'
     202 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:925:49: note: in expansion of macro 'alloc_hooks'
     925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:626:24: note: in expansion of macro 'kmalloc_array'
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                        ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:626:22: warning: assignment to 'struct drm_pagemap_dma_addr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
         |                      ^
   cc1: some warnings being treated as errors


vim +591 drivers/gpu/drm/xe/xe_bo.c

   570	
   571	
   572	static void xe_bo_translate_iova_to_dpa(struct iommu_domain *domain,
   573						struct xe_bo *bo, struct sg_table *sg,
   574						resource_size_t io_start, int vfid)
   575	{
   576		struct xe_device *xe = xe_bo_device(bo);
   577		struct xe_gt *gt = xe_root_mmio_gt(xe);
   578		struct scatterlist *sgl;
   579		struct xe_bo *lmem_bo;
   580		phys_addr_t phys;
   581		dma_addr_t addr;
   582		u64 offset, i;
   583	
   584		lmem_bo = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
   585	
   586		for_each_sgtable_dma_sg(sg, sgl, i) {
   587			phys = iommu_iova_to_phys(domain, sg_dma_address(sgl));
   588			offset = phys - io_start;
   589			addr = xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));
   590	
 > 591			bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
 > 592							DRM_INTERCONNECT_DRIVER,
   593							get_order(sg_dma_len(sgl)),
   594							DMA_BIDIRECTIONAL);
   595		}
   596	}
   597	
   598	static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
   599	{
   600		struct xe_device *xe = xe_bo_device(bo);
   601		struct iommu_domain *domain;
   602		resource_size_t io_start;
   603		struct pci_dev *pdev;
   604		phys_addr_t phys;
   605		int vfid;
   606	
   607		if (!IS_SRIOV_PF(xe))
   608			return 0;
   609	
   610		domain = iommu_get_domain_for_dev(xe->drm.dev);
   611		if (!domain)
   612			return 0;
   613	
   614		phys = iommu_iova_to_phys(domain, sg_dma_address(sg->sgl));
   615		if (page_is_ram(PFN_DOWN(phys)))
   616			return 0;
   617	
   618		pdev = xe_find_vf_dev(xe, phys);
   619		if (!pdev)
   620			return 0;
   621	
   622		vfid = pci_iov_vf_id(pdev);
   623		if (vfid < 0)
   624			return 0;
   625	
 > 626		bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
   627					     GFP_KERNEL);
   628		if (!bo->dma_addr)
   629			return -ENOMEM;
   630	
   631		bo->is_devmem_external = true;
   632		io_start = pci_resource_start(pdev, LMEM_BAR);
   633		xe_bo_translate_iova_to_dpa(domain, bo, sg, io_start, vfid);
   634	
   635		return 0;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
