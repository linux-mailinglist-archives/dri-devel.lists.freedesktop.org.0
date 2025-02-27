Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466CA47E2D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 13:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003710EAD4;
	Thu, 27 Feb 2025 12:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmwDrTnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7A510EAE6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740660438; x=1772196438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3C6LfeONdJOFLj+p0EbKVvPdF23zDoQ10QCYeO/qWGk=;
 b=bmwDrTnQ8ZPoBFsHXWW2UFV25p+KokfKlQiOI/nCZV9Cc6nkakVsnZCj
 5g5nteUCPhWLwJxyErJ4DoQgIc6QvKmK5sbnmwk+VZXG7jvgwHTNgiaON
 ym2/7izWAlXJzs0YmcO44IftXJxKy4li7tapshCXpySrHWXthJZovwL+h
 pW7unE6VjCFhBW4WN28PKrNsPElLzMAVZZjnDkpyxxmy0WK28ebqu316N
 druRKp2/aVGhQc8RRG4JXxz6Kv/NgJQQbBixhNWmZwKcV3dZmkOQ5Sffo
 EsaQw86lhvpWMnlH02oUEtZE/Uy8U9N9VGVmOdrvcQbsqLEjcP6xwPyud w==;
X-CSE-ConnectionGUID: Z79qI6PfTvOazRovqP3Kjw==
X-CSE-MsgGUID: PeFRjkGAT+CrZLNMicPWjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52942653"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52942653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:47:18 -0800
X-CSE-ConnectionGUID: o+KrKfJATMimeNe7Axwrgw==
X-CSE-MsgGUID: bDUITUR/R++TizCvmZutgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121616508"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2025 04:47:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tndIF-000DMg-00;
 Thu, 27 Feb 2025 12:47:11 +0000
Date: Thu, 27 Feb 2025 20:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202502272049.iWEcMOrk-lkp@intel.com>
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
[also build test ERROR on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250226-174013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250226093456.147402-7-tzimmermann%40suse.de
patch subject: [PATCH v2 06/11] backlight: Replace fb events with a dedicated function call
config: arm-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272049.iWEcMOrk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272049.iWEcMOrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272049.iWEcMOrk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/mach-omap2/fb.c:16:
   In file included from include/linux/omapfb.h:13:
   In file included from include/uapi/linux/omapfb.h:28:
>> include/linux/fb.h:767:6: warning: no previous prototype for function 'fb_bl_notify_blank' [-Wmissing-prototypes]
     767 | void fb_bl_notify_blank(struct fb_info *info, int old_blank)
         |      ^
   include/linux/fb.h:767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     767 | void fb_bl_notify_blank(struct fb_info *info, int old_blank)
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-vdi.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-smfc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-cpmem.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-image-convert.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-ic-csc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-ic.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dmfc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dp.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-di.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dc.o:(.text+0x0)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
