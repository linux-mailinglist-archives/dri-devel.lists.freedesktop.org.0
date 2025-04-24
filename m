Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404EA9B096
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87E310E11F;
	Thu, 24 Apr 2025 14:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdzeK9WR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D710E11F;
 Thu, 24 Apr 2025 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745504538; x=1777040538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oJ+54CydlEs4SLRn2cctIWpNV9ZWwDuKGYHuVQn90v8=;
 b=MdzeK9WRNziw7tdAEZVFWo0Sls3934qby0mhGzcNathlkddUAbpwRGu/
 9j9ryuPEEjz2xool2C3Hxs70B2bLWDyQGHorIMGMIgAMFURWb0lSlLBuN
 YsfGLZRlVVXgn1U+AOzOK9oYXqxJkwqez3DLHp5oyd8Q6wth/9DUngGo3
 qZENrmHndeH3JGGy3yjjvqkK/QvTvD/Z6IU5Gr8SQcF0cMOJkJ749A8Nb
 TPDMKHtkSXyzmCWXpgNu75Y/pyD8tO5niM5EKXnsN5/Q5suiNJx/d/Niz
 EHnmrvNPcAOy+YlEL/+pB3tEl34eL6RcIpuSjlUNaf+3xaqAFqGjbxJsN Q==;
X-CSE-ConnectionGUID: MREffbLoSSqqV+rqTGeN8g==
X-CSE-MsgGUID: +YAp/VkWTPqcm6MFTK8Y0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58504134"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="58504134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:22:18 -0700
X-CSE-ConnectionGUID: Nh7UOb4JQp+7zndXXsjiKA==
X-CSE-MsgGUID: gyTZv5RUS1GvM0eozPEhAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="163681331"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2025 07:22:16 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7xSw-0004DB-12;
 Thu, 24 Apr 2025 14:22:14 +0000
Date: Thu, 24 Apr 2025 22:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <202504242229.drmSYxrH-lkp@intel.com>
References: <20250424121827.862729-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
config: csky-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504242229.drmSYxrH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504242229.drmSYxrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504242229.drmSYxrH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_get_devmem_page':
>> drivers/gpu/drm/drm_gpusvm.c:1709:9: error: implicit declaration of function 'zone_device_page_init' [-Werror=implicit-function-declaration]
    1709 |         zone_device_page_init(page);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/xe/xe_tile.c:16:
   drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_init':
>> drivers/gpu/drm/xe/xe_svm.h:137:16: error: implicit declaration of function 'drm_gpusvm_init'; did you mean 'drm_mm_init'? [-Werror=implicit-function-declaration]
     137 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                ^~~~~~~~~~~~~~~
         |                drm_mm_init
>> drivers/gpu/drm/xe/xe_svm.h:137:35: error: invalid use of undefined type 'struct xe_vm'
     137 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                                   ^~
   drivers/gpu/drm/xe/xe_svm.h:137:71: error: invalid use of undefined type 'struct xe_vm'
     137 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                                                                       ^~
   In file included from drivers/gpu/drm/xe/xe_sriov.h:9,
                    from drivers/gpu/drm/xe/xe_device.h:13,
                    from drivers/gpu/drm/xe/xe_tile.c:10:
   drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_fini':
   drivers/gpu/drm/xe/xe_svm.h:144:21: error: invalid use of undefined type 'struct xe_vm'
     144 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |                     ^~
   drivers/gpu/drm/xe/xe_assert.h:110:41: note: in definition of macro 'xe_assert_msg'
     110 |         const struct xe_device *__xe = (xe);                                                    \
         |                                         ^~
   drivers/gpu/drm/xe/xe_svm.h:144:9: note: in expansion of macro 'xe_assert'
     144 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |         ^~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/drm/drm_managed.h:6,
                    from drivers/gpu/drm/xe/xe_tile.c:8:
>> drivers/gpu/drm/xe/xe_svm.h:144:27: error: implicit declaration of function 'xe_vm_is_closed' [-Werror=implicit-function-declaration]
     144 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |                           ^~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/xe/xe_assert.h:111:9: note: in expansion of macro '__xe_assert_msg'
     111 |         __xe_assert_msg(__xe, condition,                                                        \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:108:34: note: in expansion of macro 'xe_assert_msg'
     108 | #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
         |                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_svm.h:144:9: note: in expansion of macro 'xe_assert'
     144 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |         ^~~~~~~~~
>> drivers/gpu/drm/xe/xe_svm.h:146:9: error: implicit declaration of function 'drm_gpusvm_fini'; did you mean 'drm_buddy_fini'? [-Werror=implicit-function-declaration]
     146 |         drm_gpusvm_fini(&vm->svm.gpusvm);
         |         ^~~~~~~~~~~~~~~
         |         drm_buddy_fini
   drivers/gpu/drm/xe/xe_svm.h:146:28: error: invalid use of undefined type 'struct xe_vm'
     146 |         drm_gpusvm_fini(&vm->svm.gpusvm);
         |                            ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GPUSVM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DEVICE_PRIVATE [=n]
   Selected by [m]:
   - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=n]=y [=y])


vim +137 drivers/gpu/drm/xe/xe_svm.h

   133	
   134	static inline
   135	int xe_svm_init(struct xe_vm *vm)
   136	{
 > 137		return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
   138				       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
   139	}
   140	
   141	static inline
   142	void xe_svm_fini(struct xe_vm *vm)
   143	{
 > 144		xe_assert(vm->xe, xe_vm_is_closed(vm));
   145	
 > 146		drm_gpusvm_fini(&vm->svm.gpusvm);
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
