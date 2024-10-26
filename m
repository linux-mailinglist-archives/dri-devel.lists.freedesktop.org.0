Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B889B1549
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 08:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF1210E0A2;
	Sat, 26 Oct 2024 06:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImrgpjeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289EE10E002;
 Sat, 26 Oct 2024 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729923355; x=1761459355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oEaBYNcJrk/ITQT0R91Vz/7IFUW+pyPrKBWu5iHenPk=;
 b=ImrgpjeSMuRnXfnNbFaYtRjcFVMAQx6lSmuA07bs43IYc7Nn4q8464mA
 fHcEzq5A/YTzxu6pa8+M0qpuG4S5uyQ4ubr7iJigNfWReVOiLH9YmrcBU
 LFCN9kxu3dyPRQxxEBx1hs2ke6T9WpLjv7EmgN5Sx1NcXE8Hfu1BlM1pZ
 m3YRKfBToyUDSO4sUsPb7KbxIDI4RsnUSrITEX+tY40hgpKuZQvnbQ62M
 NgfLk/RiUVJlqk4bbKnVYEm6Viz/wsauqau5UK1vef2scJdmNBZeYdMhK
 97pS1m/5F12/oV/BpZJQnV9ru36kOEdZxrUucOPcI/ENDmAndLag4ETZy g==;
X-CSE-ConnectionGUID: Xkl0AU1wSjupMwERAL/w/g==
X-CSE-MsgGUID: 5BQP5J24RziDhtkprHRLWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40970222"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; d="scan'208";a="40970222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 23:15:54 -0700
X-CSE-ConnectionGUID: 1iyNi4DHRkuIYByTriMy4A==
X-CSE-MsgGUID: XsfrFz6cQ5udSfg/LkgG3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; d="scan'208";a="85084846"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 23:15:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4a5T-000ZLI-28;
 Sat, 26 Oct 2024 06:15:47 +0000
Date: Sat, 26 Oct 2024 14:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
Message-ID: <202410261411.F8079SY8-lkp@intel.com>
References: <20241025084817.144621-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025084817.144621-2-raag.jadav@intel.com>
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

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/drm-Introduce-device-wedged-event/20241025-165119
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241025084817.144621-2-raag.jadav%40intel.com
patch subject: [PATCH v8 1/4] drm: Introduce device wedged event
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241026/202410261411.F8079SY8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261411.F8079SY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261411.F8079SY8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_drv.c:81:10: error: nonconstant array index in initializer
      81 |         [ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]    = "rebind",
         |          ^~~
   drivers/gpu/drm/drm_drv.c:81:10: note: (near initialization for 'drm_wedge_recovery_opts')
   drivers/gpu/drm/drm_drv.c:82:10: error: nonconstant array index in initializer
      82 |         [ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1] = "bus-reset",
         |          ^~~
   drivers/gpu/drm/drm_drv.c:82:10: note: (near initialization for 'drm_wedge_recovery_opts')
   In file included from drivers/gpu/drm/drm_drv.c:30:
>> drivers/gpu/drm/drm_drv.c:84:51: error: expression in static assertion is not constant
      84 | static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/gpu/drm/drm_drv.c:84:1: note: in expansion of macro 'static_assert'
      84 | static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
         | ^~~~~~~~~~~~~


vim +81 drivers/gpu/drm/drm_drv.c

    75	
    76	/*
    77	 * Available recovery methods for wedged device. To be sent along with device
    78	 * wedged uevent.
    79	 */
    80	static const char *const drm_wedge_recovery_opts[] = {
  > 81		[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
    82		[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
    83	};
  > 84	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
