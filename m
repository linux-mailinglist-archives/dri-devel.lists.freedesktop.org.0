Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05490A3A6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B47110E1A4;
	Mon, 17 Jun 2024 06:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzCYIs8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BAE10E112;
 Mon, 17 Jun 2024 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718604240; x=1750140240;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=hMaBG2+UlcZUZTztnByWCd1Zr2GoTZisJWaj3dzdfNc=;
 b=JzCYIs8PHz8hPGsYrAsB1VMfHqirbUpD//PjNzDopPelt5IEpBCRnP+X
 VLG4MmNRTncr1N28HTC9x07EG5oDFYML1ILzF/Gx5UYgJAaFZA2JnmbCC
 Q915iE/+ZzSW8CWKrgXy5sgqM+fLJnyB1gJCeHVsaNd9RoB220TWjWgOP
 bFD5JnmbA9zcMIHlgz5J5ccHVmnw/GMx7IFn3NWiIrBGFYmBmJoa4sPHl
 rzw05YSCtZ8fFF2oJjfdNE9bsIhliGvWERjkzZBrsaCYHOYk280RZqLwL
 hfeGmiWvine5bdwk3t06HKysZ/HJKs6EnwGZxd9Z7SmxW37mayWr5bGdm Q==;
X-CSE-ConnectionGUID: 2sSlLHcBSfqWx3/u6MqoLw==
X-CSE-MsgGUID: EKmpPkRASZC7f2U9iYx+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12103514"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12103514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 23:03:59 -0700
X-CSE-ConnectionGUID: lAjZ5ulWThqyj83DlunquQ==
X-CSE-MsgGUID: ESpXd40KRv+fjX7SGmH3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41805146"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 16 Jun 2024 23:03:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sJ5T9-0003s9-0b;
 Mon, 17 Jun 2024 06:03:55 +0000
Date: Mon, 17 Jun 2024 14:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-intel:for-linux-next-gt 3/5]
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c:942:5: error: format specifies
 type 'long long' but the argument has type 'resource_size_t' (aka 'unsigned
 int')
Message-ID: <202406171328.vXSQfddX-lkp@intel.com>
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
head:   ae45f07cade1a5853ff6fd745bbd86a64cc82643
commit: 05da7d9f717bcb03c457379fa8a61c1689dab86c [3/5] drm/i915/gem: Downgrade stolen lmem setup warning
config: i386-randconfig-053-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171328.vXSQfddX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171328.vXSQfddX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171328.vXSQfddX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:942:5: error: format specifies type 'long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Werror,-Wformat]
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                                                                                    ~~~~
         |                                                                                                    %u
     942 |                                 lmem_size, dsm_base);
         |                                 ^~~~~~~~~
   include/drm/drm_print.h:522:59: note: expanded from macro 'drm_dbg'
     522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:504:63: note: expanded from macro 'drm_dbg_driver'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                                               ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:422:39: note: expanded from macro 'drm_dev_dbg'
     422 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_stolen.c:942:16: error: format specifies type 'long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Werror,-Wformat]
     941 |                                 "Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
         |                                                                                                                       ~~~~
         |                                                                                                                       %u
     942 |                                 lmem_size, dsm_base);
         |                                            ^~~~~~~~
   include/drm/drm_print.h:522:59: note: expanded from macro 'drm_dbg'
     522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:504:63: note: expanded from macro 'drm_dbg_driver'
     504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                                               ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:422:39: note: expanded from macro 'drm_dev_dbg'
     422 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   2 errors generated.


vim +942 drivers/gpu/drm/i915/gem/i915_gem_stolen.c

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
   941					"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
 > 942					lmem_size, dsm_base);
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
