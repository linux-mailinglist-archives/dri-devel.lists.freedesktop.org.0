Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01278572D0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 01:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2106610EA79;
	Fri, 16 Feb 2024 00:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZAAPuDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457C610EA77;
 Fri, 16 Feb 2024 00:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708044627; x=1739580627;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XP0hdLNo06bsjvOGz8495Ni7Q+jI7N7uvHuRX7sdhVU=;
 b=hZAAPuDefuKXH3aPPqksgEQ4DdAkINZMCcwVq1UoNXHsXTe6wnM5tb/t
 YiwHh3tiMSS4BaLIsL3R3/ZtI7NOTHJA73KvmsG8wmSnmh8LHsNu0U3GC
 39lphjvZuds1ggRzLdvVefL5QrRVP4eG9k1n0RezGVf4Z1ffcHnTs1I/3
 hRGaRoVwl0kVs5X6R1yy/PGg1vmRs+nKDGATaCSbE7dj9haqIzxFuvypb
 R6mlzCo2suYSxu0YMlwu0pLA1iFzyWwcJPyjM7Fgy9HfeCOCykSjOPCb7
 Ca3yxI4891vrmuNZWDlU8g6XoRtNuplByPWqBmKmoX6HB4vUGt5aM2vdK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5948569"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="5948569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 16:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8303317"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 15 Feb 2024 16:50:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ramQm-0000sq-20;
 Fri, 16 Feb 2024 00:50:20 +0000
Date: Fri, 16 Feb 2024 08:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
Message-ID: <202402160847.FdGsKGjp-lkp@intel.com>
References: <20240214215756.6530-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214215756.6530-2-mario.limonciello@amd.com>
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

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-Stop-using-select-ACPI_VIDEO-in-all-drivers/20240215-055936
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240214215756.6530-2-mario.limonciello%40amd.com
patch subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
config: nios2-randconfig-r061-20240215 (https://download.01.org/0day-ci/archive/20240216/202402160847.FdGsKGjp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160847.FdGsKGjp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160847.FdGsKGjp-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/video/fbdev/ssd1307fb.o: in function `ssd1307fb_remove':
   ssd1307fb.c:(.text+0x40c): undefined reference to `backlight_device_unregister'
>> ssd1307fb.c:(.text+0x40c): relocation truncated to fit: R_NIOS2_CALL26 against `backlight_device_unregister'
   nios2-linux-ld: drivers/video/fbdev/ssd1307fb.o: in function `ssd1307fb_probe':
   ssd1307fb.c:(.text+0x1d98): undefined reference to `backlight_device_register'
>> ssd1307fb.c:(.text+0x1d98): relocation truncated to fit: R_NIOS2_CALL26 against `backlight_device_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_BACKLIGHT
   Depends on [n]: HAS_IOMEM [=y] && FB [=y] && BACKLIGHT_CLASS_DEVICE [=n]
   Selected by [y]:
   - FB_SSD1307 [=y] && HAS_IOMEM [=y] && FB [=y] && I2C [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
