Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D1C427F2
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 07:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54CC10E0C0;
	Sat,  8 Nov 2025 06:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fyprrcxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A010E0C0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762581980; x=1794117980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TRpoUUsVZmme6u5QhPW7y29sfrAWHxI97Fy1In+RQB4=;
 b=FyprrcxoqCoQ8/JEGgQ7Xqr9eZK4geMfJeEeCKe4YBKuPrtzigK/hYRb
 akhuQEvSkL3qo+UiZV1VDWzoQE0xq9uoEK7XBsj4HlJCOl1mnsnm40fcW
 pL+uTlihDeUnBCZ9GWOkewVSy0YaHDn9bWXarsZIFTwma1WoH5eMKXntt
 5yKwDQod+ASeRlOIb1nkbkRh6OMruDaDULr4Z6En5ClBjICzCWN6z2eAA
 RK5vKfWgdrUqryHxErN40any1Vq6oxD7npnURs+WPrpC9a5I1c90OJ1Yv
 eMMkHGM11kZHIRJ0QFq/8OLuS1X/T+Hh5ORQLecrpsKgA6hsbdpfknlOo g==;
X-CSE-ConnectionGUID: ZeHvlqcyQ16GRWoD1s2ozw==
X-CSE-MsgGUID: ACkfRVpZRBKIQjnQp8vWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64424123"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="64424123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 22:06:20 -0800
X-CSE-ConnectionGUID: KfyO6pvMTWibF3ajQdMNTA==
X-CSE-MsgGUID: TjpO9g3LQBesWvTtXhxEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; d="scan'208";a="192487870"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2025 22:06:17 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vHc5X-0000nD-0X;
 Sat, 08 Nov 2025 06:06:15 +0000
Date: Sat, 8 Nov 2025 14:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, oded.gabbay@gmail.com,
 jeff.hugo@oss.qualcomm.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: Re: [PATCH 1/2] accel/ivpu: Add fdinfo support for memory statistics
Message-ID: <202511081303.INWfFdzI-lkp@intel.com>
References: <20251106101052.1050348-2-karol.wachowski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106101052.1050348-2-karol.wachowski@linux.intel.com>
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

Hi Karol,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251106]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Wachowski/accel-ivpu-Add-fdinfo-support-for-memory-statistics/20251106-181300
base:   next-20251106
patch link:    https://lore.kernel.org/r/20251106101052.1050348-2-karol.wachowski%40linux.intel.com
patch subject: [PATCH 1/2] accel/ivpu: Add fdinfo support for memory statistics
config: x86_64-buildonly-randconfig-005-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081303.INWfFdzI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081303.INWfFdzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081303.INWfFdzI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/ivpu/ivpu_drv.c:458:5: warning: "CONFIG_PROC_FS" is not defined, evaluates to 0 [-Wundef]
     458 | #if CONFIG_PROC_FS
         |     ^~~~~~~~~~~~~~
   drivers/accel/ivpu/ivpu_drv.c:475:5: warning: "CONFIG_PROC_FS" is not defined, evaluates to 0 [-Wundef]
     475 | #if CONFIG_PROC_FS
         |     ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/CONFIG_PROC_FS +458 drivers/accel/ivpu/ivpu_drv.c

   454	
   455	static const struct file_operations ivpu_fops = {
   456		.owner		= THIS_MODULE,
   457		DRM_ACCEL_FOPS,
 > 458	#if CONFIG_PROC_FS
   459		.show_fdinfo = drm_show_fdinfo,
   460	#endif
   461	};
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
