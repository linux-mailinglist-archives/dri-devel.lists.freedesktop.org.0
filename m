Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DCC8CDF0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 06:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4B10E752;
	Thu, 27 Nov 2025 05:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VI5f66Ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C310E74C;
 Thu, 27 Nov 2025 05:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764221329; x=1795757329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=atXJCj6/py3h7ZAKpMvIUMy5JxUpLWKJU+BPTsKDbIs=;
 b=VI5f66Jatxv8OIZlcm2fepaC9gJ981XCx4fKHML1GYH3F0Q5/pd87oKU
 k19Jkd3+PlpItH04/bbmLdKHddEl2njYyEwjb4h0ILNHOJ5LktGV2uvMz
 vcBYnHbreeVjTEhMPRJEhFTlr0wCI5MiT6Km0n3cObpk+6Ll6wC0grJ8H
 pD7Df9S4EGwrPwAae7LoRU6WD3iK00ZrYRV4q+a5JUpzTv8ZODl87rku6
 3+WlJ+gFXmZ3oZcspELF8ze01N/M4IRHZaks/SlSkPhtDLdlgadUeruqS
 aQboyB4fOhBWhHJyjtnhXISL4M2iSSX3uluK+g0gXvFKpC/gT2HFFB8zs Q==;
X-CSE-ConnectionGUID: L7Om9gWDSMezNrQEdKqTxA==
X-CSE-MsgGUID: Ktdv5IxXTZmhphaQns9waw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77628326"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="77628326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 21:28:49 -0800
X-CSE-ConnectionGUID: dasVMTU/RiWOTolc8XWOIQ==
X-CSE-MsgGUID: jIyTH9k4QcO4/SgDIaMa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="198088018"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 21:28:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vOUYd-000000003kd-1CSn;
 Thu, 27 Nov 2025 05:28:43 +0000
Date: Thu, 27 Nov 2025 13:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, lucas.demarchi@intel.com,
 Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <202511271357.7pA8zqx0-lkp@intel.com>
References: <20251126143652.2843242-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126143652.2843242-9-riana.tauro@intel.com>
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

Hi Riana,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master drm-exynos/exynos-drm-next v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20251126-220942
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126143652.2843242-9-riana.tauro%40intel.com
patch subject: [PATCH v2 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
config: riscv-randconfig-r061-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271357.7pA8zqx0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271357.7pA8zqx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271357.7pA8zqx0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/bitops.h:19,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/configfs.h:25,
                    from include/linux/fault-inject.h:14,
                    from drivers/gpu/drm/xe/xe_hw_error.c:6:
>> include/asm-generic/bitops/__ffs.h:45:21: error: nonconstant array index in initializer
      45 | #define __ffs(word) generic___ffs(word)
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:31:10: note: in expansion of macro '__ffs'
      31 |         [__ffs(_bit)] = index
         |          ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:34:9: note: in expansion of macro 'ERR_INDEX'
      34 |         ERR_INDEX(XE_GT_ERROR, DRM_XE_GENL_CORE_COMPUTE),
         |         ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:45:21: note: (near initialization for 'xe_hw_error_map')
      45 | #define __ffs(word) generic___ffs(word)
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:31:10: note: in expansion of macro '__ffs'
      31 |         [__ffs(_bit)] = index
         |          ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:34:9: note: in expansion of macro 'ERR_INDEX'
      34 |         ERR_INDEX(XE_GT_ERROR, DRM_XE_GENL_CORE_COMPUTE),
         |         ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +45 include/asm-generic/bitops/__ffs.h

c1226a005ec400 Akinobu Mita 2006-03-26  43  
cb4ede926134a6 Xiao Wang    2023-11-12  44  #ifndef __HAVE_ARCH___FFS
cb4ede926134a6 Xiao Wang    2023-11-12 @45  #define __ffs(word) generic___ffs(word)
cb4ede926134a6 Xiao Wang    2023-11-12  46  #endif
cb4ede926134a6 Xiao Wang    2023-11-12  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
