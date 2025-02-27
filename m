Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C452FA47C6F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA210EA95;
	Thu, 27 Feb 2025 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+Os+iWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F8710EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740656610; x=1772192610;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jfD1xzbIAseHmcXVa7MNKzSlnr4yWjTir2dWuJpqANk=;
 b=n+Os+iWEm8wBkjKrU+MH02qJ3HY7WUwnrvELuqrwvTsSeoDJXVauFSYd
 CUkjtC+3Qjr4Q8aT/5nMZFS971KnzqhvbIDUfsHPWgTe/i37n36FycgHU
 uARSgEAc9s62fXvAyrwpjRMHe4s4NPh+CZ+Xv0MdkmIbEvX/mPouy5VTu
 ebLmewdyAZ6rNYEZF34kZivaEFHDlZJDi5ID2V30QFqv+gQYBKQDv9eUi
 yleDmgm4XKntOrOzeII2o9uWyzdSr7pVe8k7Kpgfq2AFKpmRLsNtNhuSZ
 q+jxaNJRr0neLzxb4qmu2oP3BFBHJliLQtF9GAZ2RsJr1xBf8c0Ct2ch1 g==;
X-CSE-ConnectionGUID: cMscaQWfQn+f1BfvxDkSCw==
X-CSE-MsgGUID: O+1lJWMzQrKQBSj0UioPgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41671693"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41671693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:43:23 -0800
X-CSE-ConnectionGUID: Z1OI2PlpQk+QlNvSMzuJYw==
X-CSE-MsgGUID: oVzuM2KTQSeVmxwP1ZFcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121940371"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 03:43:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tncIQ-000DIs-09;
 Thu, 27 Feb 2025 11:43:18 +0000
Date: Thu, 27 Feb 2025 19:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202502271951.iaH6W6q1-lkp@intel.com>
References: <20250226093456.147402-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226093456.147402-7-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250226-174013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250226093456.147402-7-tzimmermann%40suse.de
patch subject: [PATCH v2 06/11] backlight: Replace fb events with a dedicated function call
config: arc-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271951.iaH6W6q1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271951.iaH6W6q1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271951.iaH6W6q1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/video/cmdline.c:19:
>> include/linux/fb.h:767:6: warning: no previous prototype for 'fb_bl_notify_blank' [-Wmissing-prototypes]
     767 | void fb_bl_notify_blank(struct fb_info *info, int old_blank)
         |      ^~~~~~~~~~~~~~~~~~
--
   arc-elf-ld: drivers/video/cmdline.o: in function `fb_bl_notify_blank':
>> cmdline.c:(.text+0x9c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/adp8860_bl.o: in function `fb_bl_notify_blank':
   adp8860_bl.c:(.text+0xefc): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/as3711_bl.o: in function `fb_bl_notify_blank':
   as3711_bl.c:(.text+0x85c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/backlight.o: in function `fb_bl_notify_blank':
   backlight.c:(.text+0xa34): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/da9052_bl.o: in function `fb_bl_notify_blank':
   da9052_bl.c:(.text+0x20c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/ktd253-backlight.o: in function `fb_bl_notify_blank':
   ktd253-backlight.c:(.text+0x36c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/lv5207lp.o: in function `fb_bl_notify_blank':
   lv5207lp.c:(.text+0x224): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/max8925_bl.o: in function `fb_bl_notify_blank':
   max8925_bl.c:(.text+0x3c8): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/mp3309c.o: in function `fb_bl_notify_blank':
   mp3309c.c:(.text+0x730): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/pandora_bl.o: in function `fb_bl_notify_blank':
   pandora_bl.c:(.text+0x294): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/pwm_bl.o: in function `fb_bl_notify_blank':
   pwm_bl.c:(.text+0xd08): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/video/backlight/qcom-wled.o: in function `fb_bl_notify_blank':
   qcom-wled.c:(.text+0x1f34): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/regulator/rpi-panel-attiny-regulator.o: in function `fb_bl_notify_blank':
   rpi-panel-attiny-regulator.c:(.text+0x5f4): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/drm_edid.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/drm_file.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/drm_modes.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/drm_panel.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/display/drm_dp_helper.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.o: in function `fb_bl_notify_blank':
   panel-asus-z00t-tm5p5-n35596.c:(.text+0x654): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-jdi-lpm102a188a.o: in function `fb_bl_notify_blank':
   panel-jdi-lpm102a188a.c:(.text+0x9c4): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-lg-sw43408.o: in function `fb_bl_notify_blank':
   panel-lg-sw43408.c:(.text+0x4ec): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-novatek-nt35560.o: in function `fb_bl_notify_blank':
   panel-novatek-nt35560.c:(.text+0x784): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-raydium-rm69380.o: in function `fb_bl_notify_blank':
   panel-raydium-rm69380.c:(.text+0x59c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-samsung-s6d7aa0.o: in function `fb_bl_notify_blank':
   panel-samsung-s6d7aa0.c:(.text+0x92c): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-samsung-sofef00.o: in function `fb_bl_notify_blank':
   panel-samsung-sofef00.c:(.text+0x4f8): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.o: in function `fb_bl_notify_blank':
   panel-sony-tulip-truly-nt35521.c:(.text+0xf38): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-truly-nt35597.o: in function `fb_bl_notify_blank':
   panel-truly-nt35597.c:(.text+0x7c8): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/panel/panel-visionox-r66451.o: in function `fb_bl_notify_blank':
   panel-visionox-r66451.c:(.text+0x704): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/gpu/drm/bridge/parade-ps8622.o: in function `fb_bl_notify_blank':
   parade-ps8622.c:(.text+0x7e0): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/hid/hid-picolcd_core.o: in function `fb_bl_notify_blank':
   hid-picolcd_core.c:(.text+0xca4): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/hid/hid-picolcd_backlight.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/hid/hid-picolcd_debugfs.o: in function `fb_bl_notify_blank':
   include/linux/fb.h:768: multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here
   arc-elf-ld: drivers/of/platform.o: in function `fb_bl_notify_blank':
   platform.c:(.text+0xb10): multiple definition of `fb_bl_notify_blank'; drivers/video/aperture.o:include/linux/fb.h:768: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
