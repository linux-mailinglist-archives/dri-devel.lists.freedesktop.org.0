Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5EB856ED3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 21:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBEF10EA39;
	Thu, 15 Feb 2024 20:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOVBy3EN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58C10EA05;
 Thu, 15 Feb 2024 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708030084; x=1739566084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2HCXSQsU9UnX7lXFl7AHSAP6YihKzbTu9UWh/36f/Bc=;
 b=ZOVBy3ENetPy59hA9KI6/3H3OQeKFjSAmzBs/lO9WqfDJD9mV0jmk/yE
 XYZlWJS2+L14bk39xVrZRNvk/WOt7VUhTgL3blxbHo+lmxwZaVsZ7BSKd
 UGSJeXkoVT5P7jddlwdFPdKYdcOwC0qQUXs+gQA0kHBx52fu3EkZVxZQO
 a9Zg/KVzeRP4eBMmN/hEeVd0HMDTX0KBet4tef2PZ+C03VjgHzr08aeAs
 eUn5D4WiejB2kPOLvVF+0ngCjSwVka2CAn0Po5rKNMja2oTq3T5VSDFsl
 huEQmYwZyXjy8mqlXOZrm9npcZjeLGg555BI/650RRZ7hii0gVRxtVaG4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2278661"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2278661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 12:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3810566"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2024 12:47:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1raieB-0000lE-28;
 Thu, 15 Feb 2024 20:47:55 +0000
Date: Fri, 16 Feb 2024 04:47:21 +0800
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
Message-ID: <202402160446.YAlmYBPI-lkp@intel.com>
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
config: openrisc-randconfig-r064-20240215 (https://download.01.org/0day-ci/archive/20240216/202402160446.YAlmYBPI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160446.YAlmYBPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160446.YAlmYBPI-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/video/fbdev/nvidia/nv_backlight.o: in function `nvidia_bl_init':
>> nv_backlight.c:(.text+0x26c): undefined reference to `backlight_device_register'
>> nv_backlight.c:(.text+0x26c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `backlight_device_register'
   or1k-linux-ld: drivers/video/fbdev/nvidia/nv_backlight.o: in function `nvidia_bl_exit':
>> nv_backlight.c:(.text+0x32c): undefined reference to `backlight_device_unregister'
>> nv_backlight.c:(.text+0x32c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `backlight_device_unregister'
   or1k-linux-ld: drivers/video/fbdev/aty/aty128fb.o: in function `aty128_remove':
>> aty128fb.c:(.text+0x14c): undefined reference to `backlight_device_unregister'
>> aty128fb.c:(.text+0x14c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `backlight_device_unregister'
   or1k-linux-ld: drivers/video/fbdev/aty/aty128fb.o: in function `aty128_init':
>> aty128fb.c:(.text.unlikely+0x5bc): undefined reference to `backlight_device_register'
>> aty128fb.c:(.text.unlikely+0x5bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `backlight_device_register'
   or1k-linux-ld: drivers/auxdisplay/ht16k33.o: in function `ht16k33_fbdev_probe':
>> ht16k33.c:(.text+0x17f4): undefined reference to `devm_backlight_device_register'
>> ht16k33.c:(.text+0x17f4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `devm_backlight_device_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_BACKLIGHT
   Depends on [n]: HAS_IOMEM [=y] && FB [=y] && BACKLIGHT_CLASS_DEVICE [=n]
   Selected by [y]:
   - HT16K33 [=y] && AUXDISPLAY [=y] && FB [=y] && I2C [=y] && INPUT [=y]
   - FB_ATMEL [=y] && FB [=y] && OF [=y] && HAVE_CLK [=y] && HAS_IOMEM [=y] && (HAVE_FB_ATMEL [=n] || COMPILE_TEST [=y])
   - FB_NVIDIA [=y] && HAS_IOMEM [=y] && FB [=y] && PCI [=y] && FB_NVIDIA_BACKLIGHT [=y]
   - FB_ATY128 [=y] && HAS_IOMEM [=y] && FB [=y] && PCI [=y] && FB_ATY128_BACKLIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
