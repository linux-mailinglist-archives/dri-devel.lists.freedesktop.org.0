Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC3CAE51F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 23:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136DE10E3BA;
	Mon,  8 Dec 2025 22:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkDhBEtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BE910E3BA;
 Mon,  8 Dec 2025 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765232534; x=1796768534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tgB3OkFFdIJH5A8yzS/OltbvKtxrV2y0WS0Cg1d/LAY=;
 b=hkDhBEtpviz6gz+ER+iUhi8PhS5zNXIBAHtM+GPAUPfqqqtuqdrnKtd/
 iFN0ej/Y53d51bv6n1JZ6Khmw2SGAjPeV+j/rDtyoI6nWFaux6zYCptL7
 YI7D5Y5/qdVE5B0+Xq/Ye7JyYUcvzdvIyjr+qxqO+dTuv2pNG7GzlRFsh
 z9IiugXGgzucCEKRGXBYjlxQHzmU24QIwm/Uc9OOQQdU5TuDISbDLtMFT
 pcpcHYaef6qDUM+2YdYVFSLr8/aQvwMjDxBLHcqtycyt3m2GavcZkuof/
 hEChfeBbZqzZwZ4k5SueaNkhpmD+Dpf/qHuLJdDWGAmsskyMvKec67PT5 Q==;
X-CSE-ConnectionGUID: vxBQE5G0SY+/rJmjcLJNDg==
X-CSE-MsgGUID: CMIR8s/xTJa59u5fRfO3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77801747"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77801747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 14:22:14 -0800
X-CSE-ConnectionGUID: tbbK7wfCSrGs3ili++mRSA==
X-CSE-MsgGUID: R0oyUwV4QcKYUk1PQiqdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196516542"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2025 14:22:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vSjcP-000000000v3-3miQ;
 Mon, 08 Dec 2025 22:22:09 +0000
Date: Tue, 9 Dec 2025 06:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512090603.ycfxEuHJ-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-030730
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: i386-randconfig-141-20251209 (https://download.01.org/0day-ci/archive/20251209/202512090603.ycfxEuHJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090603.ycfxEuHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090603.ycfxEuHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/bochs.c:29:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
     489 | ?
         | ^
   In file included from include/linux/module.h:23,
                    from drivers/gpu/drm/tiny/bochs.c:5:
   drivers/gpu/drm/tiny/bochs.c: In function '__check_modeset':
   drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared (first use in this function)
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:75: note: in definition of macro '__param_check'
     430 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:155:9: note: in expansion of macro 'param_check_int'
     155 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:29: note: each undeclared identifier is reported only once for each function it appears in
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:75: note: in definition of macro '__param_check'
     430 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                                                           ^
   include/linux/moduleparam.h:155:9: note: in expansion of macro 'param_check_int'
     155 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c: At top level:
   drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared here (not in a function)
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         |                             ^~~~~~~~~~~~~
   include/linux/moduleparam.h:298:61: note: in definition of macro '__module_param_call'
     298 |             VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
         |                                                             ^~~
   include/linux/moduleparam.h:156:9: note: in expansion of macro 'module_param_cb'
     156 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
      66 | module_param_named(modeset, bochs_modeset, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/gpu/drm/tiny/bochs.c:6:
   drivers/gpu/drm/tiny/bochs.c: In function 'bochs_pci_driver_init':
>> include/linux/device/driver.h:261:1: warning: control reaches end of non-void function [-Wreturn-type]
     261 | } \
         | ^
   include/drm/drm_module.h:93:9: note: in expansion of macro 'module_driver'
      93 |         module_driver(__pci_drv, drm_pci_register_driver_if_modeset, \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:835:1: note: in expansion of macro 'drm_module_pci_driver_if_modeset'
     835 | drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +261 include/linux/device/driver.h

4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  242  
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  243  /**
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  244   * module_driver() - Helper macro for drivers that don't do anything
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  245   * special in module init/exit. This eliminates a lot of boilerplate.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  246   * Each module may only use this macro once, and calling it replaces
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  247   * module_init() and module_exit().
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  248   *
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  249   * @__driver: driver name
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  250   * @__register: register function for this driver type
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  251   * @__unregister: unregister function for this driver type
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  252   * @...: Additional arguments to be passed to __register and __unregister.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  253   *
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  254   * Use this macro to construct bus specific macros for registering
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  255   * drivers, and do not use it on its own.
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  256   */
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  257  #define module_driver(__driver, __register, __unregister, ...) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  258  static int __init __driver##_init(void) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  259  { \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  260  	return __register(&(__driver) , ##__VA_ARGS__); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09 @261  } \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  262  module_init(__driver##_init); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  263  static void __exit __driver##_exit(void) \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  264  { \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  265  	__unregister(&(__driver) , ##__VA_ARGS__); \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  266  } \
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  267  module_exit(__driver##_exit);
4c002c978b7f2f Greg Kroah-Hartman 2019-12-09  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
