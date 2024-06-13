Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5869064EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81D10E973;
	Thu, 13 Jun 2024 07:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qt90bUlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9703710E97D;
 Thu, 13 Jun 2024 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718263487; x=1749799487;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=WawnQHUI3D/zvqnzK8FLn+OMvN21Q6ANJQWdyuEVhcQ=;
 b=Qt90bUlxK2USqv9MY88T6VJWPeb4fSPI41M6NWfgZaKeTWnNhFqFX8i5
 W1G9kux2r2E/VSXnqVuYcMjBuo2uyxnNELqIYptzwOQMdmdRnQkz+jATT
 WAJvxA+cVUT+vbiPmdf4LfyeRhEWPgUCuUfc/E9V7M7CoDWXbxhNC8ABI
 JIKDILwQydgpSJV3pqp6zpgg1td5pkKXfQaBxLn745MLjV1xoiCJpJgPP
 g1auq0r/3UJgvknUMu2g2WnZVCkPSs7na8KZZ3fXUkx2ibPw7KQgyXdiI
 JDM8PP6DV/18zquqn73i8w0qIJZ7WxGonmrPXN77keAbJZMMIAqfuwnwf A==;
X-CSE-ConnectionGUID: ZWUa22yWRfWJM6dfwsaiAQ==
X-CSE-MsgGUID: 8LN6TQeKR2eeVA67+nOb0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14939731"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14939731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:24:42 -0700
X-CSE-ConnectionGUID: ug4XLreuSgq91cHxAqKuHw==
X-CSE-MsgGUID: kD6K+rTXQfe8nnh/+2Hn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44434576"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2024 00:24:41 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHep4-0002Ja-3B;
 Thu, 13 Jun 2024 07:24:39 +0000
Date: Thu, 13 Jun 2024 15:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-intel:for-linux-next-gt 3/3]
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:33: warning: format '%lli'
 expects argument of type 'long long int', but argument 5 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202406131532.NcUQjItx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   05da7d9f717bcb03c457379fa8a61c1689dab86c
commit: 05da7d9f717bcb03c457379fa8a61c1689dab86c [3/3] drm/i915/gem: Downgrade stolen lmem setup warning
config: i386-randconfig-002-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131532.NcUQjItx-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131532.NcUQjItx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131532.NcUQjItx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from drivers/gpu/drm/i915/gem/i915_gem_stolen.c:10:
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c: In function 'i915_gem_stolen_lmem_setup':
>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:33: warning: format '%lli' expects argument of type 'long long int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     942 |                                 lmem_size, dsm_base);
         |                                 ~~~~~~~~~
         |                                 |
         |                                 resource_size_t {aka unsigned int}
   include/drm/drm_print.h:422:39: note: in definition of macro 'drm_dev_dbg'
     422 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ^~~
   include/drm/drm_print.h:522:33: note: in expansion of macro 'drm_dbg_driver'
     522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:940:25: note: in expansion of macro 'drm_dbg'
     940 |                         drm_dbg(&i915->drm,
         |                         ^~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:103: note: format string is defined here
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                                                                                    ~~~^
         |                                                                                                       |
         |                                                                                                       long long int
         |                                                                                                    %i
   In file included from include/drm/drm_mm.h:51,
                    from drivers/gpu/drm/i915/gem/i915_gem_stolen.c:10:
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:33: warning: format '%lli' expects argument of type 'long long int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     942 |                                 lmem_size, dsm_base);
         |                                            ~~~~~~~~
         |                                            |
         |                                            resource_size_t {aka unsigned int}
   include/drm/drm_print.h:422:39: note: in definition of macro 'drm_dev_dbg'
     422 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ^~~
   include/drm/drm_print.h:522:33: note: in expansion of macro 'drm_dbg_driver'
     522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:940:25: note: in expansion of macro 'drm_dbg'
     940 |                         drm_dbg(&i915->drm,
         |                         ^~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:122: note: format string is defined here
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                                                                                                       ~~~^
         |                                                                                                                          |
         |                                                                                                                          long long int
         |                                                                                                                       %i


vim +941 drivers/gpu/drm/i915/gem/i915_gem_stolen.c

   889	
   890	struct intel_memory_region *
   891	i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
   892				   u16 instance)
   893	{
   894		struct intel_uncore *uncore = &i915->uncore;
   895		struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
   896		resource_size_t dsm_size, dsm_base, lmem_size;
   897		struct intel_memory_region *mem;
   898		resource_size_t io_start, io_size;
   899		resource_size_t min_page_size;
   900		int ret;
   901	
   902		if (WARN_ON_ONCE(instance))
   903			return ERR_PTR(-ENODEV);
   904	
   905		if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
   906			return ERR_PTR(-ENXIO);
   907	
   908		if (HAS_LMEMBAR_SMEM_STOLEN(i915) || IS_DG1(i915)) {
   909			lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
   910		} else {
   911			resource_size_t lmem_range;
   912	
   913			lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
   914			lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
   915			lmem_size *= SZ_1G;
   916		}
   917	
   918		if (HAS_LMEMBAR_SMEM_STOLEN(i915)) {
   919			/*
   920			 * MTL dsm size is in GGC register.
   921			 * Also MTL uses offset to GSMBASE in ptes, so i915
   922			 * uses dsm_base = 8MBs to setup stolen region, since
   923			 * DSMBASE = GSMBASE + 8MB.
   924			 */
   925			ret = mtl_get_gms_size(uncore);
   926			if (ret < 0) {
   927				drm_err(&i915->drm, "invalid MTL GGC register setting\n");
   928				return ERR_PTR(ret);
   929			}
   930	
   931			dsm_base = SZ_8M;
   932			dsm_size = (resource_size_t)(ret * SZ_1M);
   933	
   934			GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != SZ_256M);
   935			GEM_BUG_ON((dsm_base + dsm_size) > lmem_size);
   936		} else {
   937			/* Use DSM base address instead for stolen memory */
   938			dsm_base = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
   939			if (lmem_size < dsm_base) {
   940				drm_dbg(&i915->drm,
 > 941					"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
   942					lmem_size, dsm_base);
   943				return 0;
   944			}
   945			dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
   946		}
   947	
   948		if (i915_direct_stolen_access(i915)) {
   949			drm_dbg(&i915->drm, "Using direct DSM access\n");
   950			io_start = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
   951			io_size = dsm_size;
   952		} else if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
   953			io_start = 0;
   954			io_size = 0;
   955		} else {
   956			io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
   957			io_size = dsm_size;
   958		}
   959	
   960		min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
   961							I915_GTT_PAGE_SIZE_4K;
   962	
   963		mem = intel_memory_region_create(i915, dsm_base, dsm_size,
   964						 min_page_size,
   965						 io_start, io_size,
   966						 type, instance,
   967						 &i915_region_stolen_lmem_ops);
   968		if (IS_ERR(mem))
   969			return mem;
   970	
   971		intel_memory_region_set_name(mem, "stolen-local");
   972	
   973		mem->private = true;
   974	
   975		return mem;
   976	}
   977	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
