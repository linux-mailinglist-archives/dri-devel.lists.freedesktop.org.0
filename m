Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693AA9B14D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED1810E82D;
	Thu, 24 Apr 2025 14:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCRAu4h3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656B710E82D;
 Thu, 24 Apr 2025 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505742; x=1777041742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WNZXAVGRpKtkMxYzh9aRCai8pjucoVn4WLI5oJyvhHE=;
 b=gCRAu4h3CDCMWE9T1UJTCNQEMWnNa4HuR+2QBgbe6EcPItq8qqFgQuNG
 sF5eR2Z44xnrRiZ22Sj06+9oynui98gMcXKFkLodLjlXE8eVUyqzqkM//
 f1cKlKCjjMLoKekumhWhwWREUg2oF/vwH+KGOXyrdyp72AcEsTjYeQb2q
 GcSUi3l2lUgyL3BfoqnYmUWXO1Oy6IYdNpO/YQ6yb3BrkmJR61z7wDHlL
 nuWZMjmPPmA2imKDXuAJgaQ2n5Z7C+VcigowFSUpc1eMY8n7yQclTOSYc
 B7wD9Do2QNz37rWi7fy1NdWINd42WaQKCz9HAnhblMeEKzlbE9zdGsGmH g==;
X-CSE-ConnectionGUID: AjgLx2zuT/WSxBK8e1nahw==
X-CSE-MsgGUID: //gJc70OSTOHlOlKfqnjKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50807841"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50807841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:42:21 -0700
X-CSE-ConnectionGUID: GU3Ry/SlSgaTpvjlgnUfgw==
X-CSE-MsgGUID: /koDReTQRS6HBCizDAP0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137636295"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 24 Apr 2025 07:42:19 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7xmK-0004EX-0r;
 Thu, 24 Apr 2025 14:42:16 +0000
Date: Thu, 24 Apr 2025 22:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <202504242203.MfhcD5LA-lkp@intel.com>
References: <20250424121827.862729-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424121827.862729-15-matthew.auld@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250424]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-gpusvm-fix-hmm_pfn_to_map_order-usage/20250424-202128
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250424121827.862729-15-matthew.auld%40intel.com
patch subject: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
config: loongarch-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250424/202504242203.MfhcD5LA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504242203.MfhcD5LA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504242203.MfhcD5LA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2213,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/xe/xe_assert.h:11,
                    from drivers/gpu/drm/xe/xe_vm.h:9,
                    from drivers/gpu/drm/xe/xe_vm.c:6:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/gpu/drm/xe/xe_vm.c: In function 'xe_vma_userptr_force_invalidate':
>> drivers/gpu/drm/xe/xe_vm.c:699:52: error: 'struct xe_userptr' has no member named 'notifier_seq'; did you mean 'notifier'?
     699 |                                      uvma->userptr.notifier_seq))
         |                                                    ^~~~~~~~~~~~
         |                                                    notifier
   drivers/gpu/drm/xe/xe_vm.c:700:31: error: 'struct xe_userptr' has no member named 'notifier_seq'; did you mean 'notifier'?
     700 |                 uvma->userptr.notifier_seq -= 2;
         |                               ^~~~~~~~~~~~
         |                               notifier

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GPUSVM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DEVICE_PRIVATE [=n]
   Selected by [m]:
   - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=n]=y [=y])


vim +699 drivers/gpu/drm/xe/xe_vm.c

dd08ebf6c3525a Matthew Brost    2023-03-30  676  
100a5b8dadfca5 Thomas Hellström 2025-02-28  677  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
100a5b8dadfca5 Thomas Hellström 2025-02-28  678  /**
100a5b8dadfca5 Thomas Hellström 2025-02-28  679   * xe_vma_userptr_force_invalidate() - force invalidate a userptr
100a5b8dadfca5 Thomas Hellström 2025-02-28  680   * @uvma: The userptr vma to invalidate
100a5b8dadfca5 Thomas Hellström 2025-02-28  681   *
100a5b8dadfca5 Thomas Hellström 2025-02-28  682   * Perform a forced userptr invalidation for testing purposes.
100a5b8dadfca5 Thomas Hellström 2025-02-28  683   */
100a5b8dadfca5 Thomas Hellström 2025-02-28  684  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
100a5b8dadfca5 Thomas Hellström 2025-02-28  685  {
100a5b8dadfca5 Thomas Hellström 2025-02-28  686  	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
100a5b8dadfca5 Thomas Hellström 2025-02-28  687  
100a5b8dadfca5 Thomas Hellström 2025-02-28  688  	/* Protect against concurrent userptr pinning */
100a5b8dadfca5 Thomas Hellström 2025-02-28  689  	lockdep_assert_held(&vm->lock);
100a5b8dadfca5 Thomas Hellström 2025-02-28  690  	/* Protect against concurrent notifiers */
a2cfe1a4a9e967 Matthew Auld     2025-04-24  691  	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
100a5b8dadfca5 Thomas Hellström 2025-02-28  692  	/*
100a5b8dadfca5 Thomas Hellström 2025-02-28  693  	 * Protect against concurrent instances of this function and
100a5b8dadfca5 Thomas Hellström 2025-02-28  694  	 * the critical exec sections
100a5b8dadfca5 Thomas Hellström 2025-02-28  695  	 */
100a5b8dadfca5 Thomas Hellström 2025-02-28  696  	xe_vm_assert_held(vm);
100a5b8dadfca5 Thomas Hellström 2025-02-28  697  
100a5b8dadfca5 Thomas Hellström 2025-02-28  698  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
100a5b8dadfca5 Thomas Hellström 2025-02-28 @699  				     uvma->userptr.notifier_seq))
100a5b8dadfca5 Thomas Hellström 2025-02-28  700  		uvma->userptr.notifier_seq -= 2;
100a5b8dadfca5 Thomas Hellström 2025-02-28  701  	__vma_userptr_invalidate(vm, uvma);
100a5b8dadfca5 Thomas Hellström 2025-02-28  702  }
100a5b8dadfca5 Thomas Hellström 2025-02-28  703  #endif
100a5b8dadfca5 Thomas Hellström 2025-02-28  704  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
