Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B1BF8385
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209B610E0E8;
	Tue, 21 Oct 2025 19:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu8Xqo+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF1810E310;
 Tue, 21 Oct 2025 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761074250; x=1792610250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6J0Rp6zDs9R4wdRi4HXSth2whWbq//t42zo4hL+y6oM=;
 b=Eu8Xqo+Pt12uRuoilLwk8iBbKDl29FiCsQQ9jQVh5QuHYs1B+AV5Sqo3
 g7ugV3U4c78sU52PedHPpRmG8OpWFIhu+8Nnm4PefEBgkISXsWHVS7P9a
 cfjmeLc+rBt5x8+LnfYJXgDFM8wkhvTtbeJgyjZbSpjjwf6nI0UZHWibx
 wRokCrL/gBp4RygpxTETh6w6Znt2daUNDMGtHq1gGDp8FokVW9luEFziF
 hiAlztRnhGAWHkXFDER8yyVWMUzDFl81pmtAM+Lx9HHa0vx8jR4LXQBvU
 7E6bkSNbvlfCU5beACtAKQTB/xnDMIzoYmZJQIGXShqPkB+iBgHgCvYNw w==;
X-CSE-ConnectionGUID: m5XUBoGpRcaHvUrUL8MSVw==
X-CSE-MsgGUID: ULJ14ZyXSs+2QqjQ/+Ia4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73817806"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="73817806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:17:29 -0700
X-CSE-ConnectionGUID: nHlFY9ebTv+pDk/IGSWgtg==
X-CSE-MsgGUID: UdgPopg8SCm8LBMOXLoSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188955099"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2025 12:17:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBHrE-000BFd-2r;
 Tue, 21 Oct 2025 19:17:21 +0000
Date: Wed, 22 Oct 2025 03:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, simona.vetter@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/mm: replace drm_print.h include with a forward
 declaration
Message-ID: <202510220227.QAJxjxfr-lkp@intel.com>
References: <05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[also build test ERROR on v6.18-rc2]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.18-rc2 v6.18-rc1 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-mm-replace-drm_print-h-include-with-a-forward-declaration/20251022-003212
base:   next-20251021
patch link:    https://lore.kernel.org/r/05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula%40intel.com
patch subject: [PATCH 1/3] drm/mm: replace drm_print.h include with a forward declaration
config: x86_64-buildonly-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220227.QAJxjxfr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220227.QAJxjxfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220227.QAJxjxfr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/gma500/oaktrail_hdmi.c:174:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     174 |         DRM_DEBUG_KMS("new crtc htotal 0x%4x\n", new_crtc_htotal);
         |         ^
   drivers/gpu/drm/gma500/oaktrail_hdmi.c:201:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     201 |         DRM_DEBUG_KMS("np, nr, nf %d %d %d\n", np, nr, nf);
         |         ^
   drivers/gpu/drm/gma500/oaktrail_hdmi.c:224:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     224 |                         DRM_DEBUG_KMS("SCU IPC timed out");
         |                         ^
>> drivers/gpu/drm/gma500/oaktrail_hdmi.c:244:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |                 DRM_ERROR("failed to map scu mmio\n");
         |                 ^
   drivers/gpu/drm/gma500/oaktrail_hdmi.c:388:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         DRM_DEBUG_KMS("%s %d\n", __func__, mode);
         |         ^
   drivers/gpu/drm/gma500/oaktrail_hdmi.c:540:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     540 |         DRM_DEBUG_KMS("HDMI_HSR %x\n", temp);
         |         ^
   drivers/gpu/drm/gma500/oaktrail_hdmi.c:577:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |                 DRM_ERROR("No ddc adapter available!\n");
         |                 ^
   7 errors generated.
--
>> drivers/gpu/drm/gma500/intel_gmbus.c:349:2: error: call to undeclared function 'DRM_INFO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     349 |         DRM_INFO("GMBUS timed out, falling back to bit banging on pin %d [%s]\n",
         |         ^
   1 error generated.
--
>> drivers/gpu/drm/gma500/intel_bios.c:58:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |                         DRM_DEBUG_KMS("No eDP BDB found but eDP panel supported, assume %dbpp panel color depth.\n",
         |                         ^
   drivers/gpu/drm/gma500/intel_bios.c:83:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         DRM_DEBUG_KMS("EDP timing in vbt t1_t3 %d t8 %d t9 %d t10 %d t11_t12 %d\n",
         |         ^
   drivers/gpu/drm/gma500/intel_bios.c:335:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     335 |                 DRM_DEBUG_KMS("No general definition block is found, unable to construct sdvo mapping.\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:345:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     345 |                 DRM_DEBUG_KMS("different child size is found. Invalid.\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:371:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     371 |                         DRM_DEBUG_KMS("Incorrect SDVO port. Skip it\n");
         |                         ^
   drivers/gpu/drm/gma500/intel_bios.c:374:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     374 |                 DRM_DEBUG_KMS("the SDVO device with target addr %2x is found on"
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:408:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |                 DRM_DEBUG_KMS("No SDVO device info is found in VBT\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:428:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     428 |         DRM_DEBUG_KMS("LVDS VBT config bits: 0x%x\n", driver->lvds_config);
         |         ^
   drivers/gpu/drm/gma500/intel_bios.c:448:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     448 |                 DRM_DEBUG_KMS("No general definition block is found, no devices defined.\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:458:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     458 |                 DRM_DEBUG_KMS("different child size is found. Invalid.\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:477:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |                 DRM_DEBUG_KMS("no child dev is parsed from VBT\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:482:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     482 |                 DRM_DEBUG_KMS("No memory space for child devices\n");
         |                 ^
   drivers/gpu/drm/gma500/intel_bios.c:534:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     534 |                         DRM_DEBUG_KMS("Using VBT from OpRegion: %20s\n",
         |                         ^
   13 errors generated.
--
>> drivers/gpu/drm/gma500/cdv_device.c:79:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 DRM_DEBUG_KMS("LVDS Panel PWM value is 0!\n");
         |                 ^
   1 error generated.
--
>> drivers/gpu/drm/gma500/cdv_intel_lvds.c:499:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     499 |                 DRM_DEBUG_KMS("LVDS is not present in VBT\n");
         |                 ^
>> drivers/gpu/drm/gma500/cdv_intel_lvds.c:630:3: error: call to undeclared function 'DRM_DEBUG'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     630 |                 DRM_DEBUG
         |                 ^
   2 errors generated.
--
>> drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c:259:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |                 DRM_ERROR("gpio ioremap fail\n");
         |                 ^
>> drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c:264:2: error: call to undeclared function 'DRM_DEBUG_DRIVER'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |         DRM_DEBUG_DRIVER("old gpio val %x\n", temp);
         |         ^
   drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c:298:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     298 |                 DRM_ERROR("Failed to request IRQ for I2C controller\n");
         |                 ^
   drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c:305:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     305 |                 DRM_ERROR("Failed to add I2C adapter\n");
         |                 ^
   4 errors generated.
--
>> drivers/gpu/drm/gma500/psb_intel_display.c:151:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 DRM_ERROR("Couldn't find PLL settings for mode! target: %d, actual: %d",
         |                 ^
   1 error generated.
--
>> drivers/gpu/drm/gma500/psb_intel_sdvo.c:279:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     279 |         DRM_DEBUG_KMS("i2c transfer returned %d\n", ret);
         |         ^
>> drivers/gpu/drm/gma500/psb_intel_sdvo.c:433:2: error: call to undeclared function 'drm_WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     433 |         drm_WARN_ON(dev, pos >= sizeof(buffer) - 1);
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:436:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     436 |         DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(psb_intel_sdvo), cmd, buffer);
         |         ^
>> drivers/gpu/drm/gma500/psb_intel_sdvo.c:459:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     459 |                 DRM_ERROR("Need to increase arg length\n");
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:494:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |                 DRM_DEBUG_KMS("I2c transfer returned %d\n", ret);
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:499:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     499 |                 DRM_DEBUG_KMS("I2c transfer returned %d/%d\n", ret, i+3);
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:557:2: error: call to undeclared function 'drm_WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     557 |         drm_WARN_ON(dev, pos >= sizeof(buffer) - 1);
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:560:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     560 |         DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(psb_intel_sdvo), buffer);
         |         ^
>> drivers/gpu/drm/gma500/psb_intel_sdvo.c:888:2: error: call to undeclared function 'DRM_INFO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     888 |         DRM_INFO("HDMI is not supported yet");
         |         ^
>> drivers/gpu/drm/gma500/psb_intel_sdvo.c:1105:3: error: call to undeclared function 'DRM_DEBUG'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1105 |                 DRM_DEBUG("DPMS_ON");
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:1150:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1150 |                         DRM_DEBUG_KMS("First %s output reported failure to "
         |                         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:1194:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1194 |         DRM_DEBUG_KMS("SDVO capabilities:\n"
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:1328:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1328 |         DRM_DEBUG_KMS("SDVO response %d %d [%x]\n",
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2170:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2170 |                 DRM_DEBUG_KMS("%s: Unknown SDVO output type (0x%02x%02x)\n",
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2285:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2285 |                 DRM_DEBUG_KMS("h_overscan: max %d, "
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2321:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2321 |                 DRM_DEBUG_KMS("v_overscan: max %d, "
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2326:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2326 |         ENHANCEMENT(hpos, HPOS);
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2239:3: note: expanded from macro 'ENHANCEMENT'
    2239 |                 DRM_DEBUG_KMS(#name ": max %d, default %d, current %d\n", \
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2327:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2327 |         ENHANCEMENT(vpos, VPOS);
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2239:3: note: expanded from macro 'ENHANCEMENT'
    2239 |                 DRM_DEBUG_KMS(#name ": max %d, default %d, current %d\n", \
         |                 ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2328:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2328 |         ENHANCEMENT(saturation, SATURATION);
         |         ^
   drivers/gpu/drm/gma500/psb_intel_sdvo.c:2239:3: note: expanded from macro 'ENHANCEMENT'
    2239 |                 DRM_DEBUG_KMS(#name ": max %d, default %d, current %d\n", \
         |                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/gpu/drm/gma500/cdv_intel_display.c:136:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 |                 DRM_ERROR("timeout waiting for SB to idle before read\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:148:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |                 DRM_ERROR("timeout waiting for SB to idle after read\n");
         |                 ^
>> drivers/gpu/drm/gma500/cdv_intel_display.c:165:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     165 |                         DRM_DEBUG_KMS("0x%08x: 0x%08x (before)\n", reg, temp);
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:171:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |                 DRM_ERROR("timeout waiting for SB to idle before write\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:184:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |                 DRM_ERROR("timeout waiting for SB to idle after write\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:190:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |                         DRM_DEBUG_KMS("0x%08x: 0x%08x (after)\n", reg, temp);
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:258:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |                 DRM_DEBUG_KMS("use DPLLA for pipe B\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:261:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |                 DRM_DEBUG_KMS("use their DPLL for pipe A/B\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:327:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |                 DRM_ERROR("Bad P2 clock: %d\n", clock->p2);
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:619:4: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     619 |                         DRM_ERROR("invalid output type.\n");
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:650:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     650 |                 DRM_DEBUG_KMS("Use SSC reference clock %d Mhz\n", dev_priv->lvds_ssc_freq);
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:660:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |                 DRM_ERROR("Couldn't find PLL settings for mode! target: %d, actual: %d",
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:764:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     764 |         DRM_DEBUG_KMS("Mode for pipe %c:\n", pipe == 0 ? 'A' : 'B');
         |         ^
   13 errors generated.
--
>> drivers/gpu/drm/gma500/cdv_intel_dp.c:183:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         DRM_DEBUG_KMS("dp_aux_xfer return %d\n", ret);
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:383:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     383 |                 DRM_DEBUG_KMS("Skip VDD on because of panel on\n");
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:386:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         DRM_DEBUG_KMS("\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:401:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     401 |         DRM_DEBUG_KMS("\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:420:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     420 |         DRM_DEBUG_KMS("\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:444:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     444 |         DRM_DEBUG_KMS("\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:475:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     475 |         DRM_DEBUG_KMS("\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:496:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         DRM_DEBUG_KMS("\n");
         |         ^
>> drivers/gpu/drm/gma500/cdv_intel_dp.c:594:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     594 |                 DRM_ERROR("dp_aux_ch not started status 0x%08x\n",
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:634:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     634 |                 DRM_ERROR("dp_aux_ch not done status 0x%08x\n", status);
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:642:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     642 |                 DRM_ERROR("dp_aux_ch receive error status 0x%08x\n", status);
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:649:3: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     649 |                 DRM_DEBUG_KMS("dp_aux_ch timeout status 0x%08x\n", status);
         |                 ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:798:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     798 |                         DRM_DEBUG_KMS("aux_ch failed %d\n", ret);
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:809:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     809 |                         DRM_DEBUG_KMS("aux_ch native nack\n");
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:815:4: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     815 |                         DRM_ERROR("aux_ch invalid native reply 0x%02x\n",
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:827:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     827 |                         DRM_DEBUG_KMS("aux_i2c nack\n");
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:834:4: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     834 |                         DRM_ERROR("aux_i2c invalid reply 0x%02x\n", reply[0]);
         |                         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:839:2: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     839 |         DRM_ERROR("too many retries, giving up\n");
         |         ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:850:2: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     850 |         DRM_DEBUG_KMS("i2c_init %s\n", name);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/gpu/drm/gma500/psb_drv.c:283:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     283 |                         DRM_DEBUG_KMS("Found aux vdc");
         |                         ^
   drivers/gpu/drm/gma500/psb_drv.c:287:4: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |                         DRM_DEBUG_KMS("Couldn't find aux pci device");
         |                         ^
   drivers/gpu/drm/gma500/psb_drv.c:303:5: error: call to undeclared function 'DRM_DEBUG_KMS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |                                 DRM_DEBUG_KMS("Found LPC GPIO at 0x%04x\n",
         |                                 ^
   3 errors generated.
..


vim +/DRM_DEBUG_KMS +174 drivers/gpu/drm/gma500/oaktrail_hdmi.c

1b082ccf5901108 Alan Cox 2011-11-03  163  
39ec748f7174602 Alan Cox 2012-11-06  164  static unsigned int htotal_calculate(struct drm_display_mode *mode)
39ec748f7174602 Alan Cox 2012-11-06  165  {
dfa703b6f91818f zhengbin 2019-11-15  166  	u32 new_crtc_htotal;
39ec748f7174602 Alan Cox 2012-11-06  167  
39ec748f7174602 Alan Cox 2012-11-06  168  	/*
39ec748f7174602 Alan Cox 2012-11-06  169  	 * 1024 x 768  new_crtc_htotal = 0x1024;
39ec748f7174602 Alan Cox 2012-11-06  170  	 * 1280 x 1024 new_crtc_htotal = 0x0c34;
39ec748f7174602 Alan Cox 2012-11-06  171  	 */
39ec748f7174602 Alan Cox 2012-11-06  172  	new_crtc_htotal = (mode->crtc_htotal - 1) * 200 * 1000 / mode->clock;
39ec748f7174602 Alan Cox 2012-11-06  173  
39ec748f7174602 Alan Cox 2012-11-06 @174  	DRM_DEBUG_KMS("new crtc htotal 0x%4x\n", new_crtc_htotal);
39ec748f7174602 Alan Cox 2012-11-06  175  	return (mode->crtc_hdisplay - 1) | (new_crtc_htotal << 16);
39ec748f7174602 Alan Cox 2012-11-06  176  }
39ec748f7174602 Alan Cox 2012-11-06  177  
39ec748f7174602 Alan Cox 2012-11-06  178  static void oaktrail_hdmi_find_dpll(struct drm_crtc *crtc, int target,
39ec748f7174602 Alan Cox 2012-11-06  179  				int refclk, struct oaktrail_hdmi_clock *best_clock)
39ec748f7174602 Alan Cox 2012-11-06  180  {
39ec748f7174602 Alan Cox 2012-11-06  181  	int np_min, np_max, nr_min, nr_max;
39ec748f7174602 Alan Cox 2012-11-06  182  	int np, nr, nf;
39ec748f7174602 Alan Cox 2012-11-06  183  
39ec748f7174602 Alan Cox 2012-11-06  184  	np_min = DIV_ROUND_UP(oaktrail_hdmi_limit.vco.min, target * 10);
39ec748f7174602 Alan Cox 2012-11-06  185  	np_max = oaktrail_hdmi_limit.vco.max / (target * 10);
39ec748f7174602 Alan Cox 2012-11-06  186  	if (np_min < oaktrail_hdmi_limit.np.min)
39ec748f7174602 Alan Cox 2012-11-06  187  		np_min = oaktrail_hdmi_limit.np.min;
39ec748f7174602 Alan Cox 2012-11-06  188  	if (np_max > oaktrail_hdmi_limit.np.max)
39ec748f7174602 Alan Cox 2012-11-06  189  		np_max = oaktrail_hdmi_limit.np.max;
39ec748f7174602 Alan Cox 2012-11-06  190  
39ec748f7174602 Alan Cox 2012-11-06  191  	nr_min = DIV_ROUND_UP((refclk * 1000), (target * 10 * np_max));
39ec748f7174602 Alan Cox 2012-11-06  192  	nr_max = DIV_ROUND_UP((refclk * 1000), (target * 10 * np_min));
39ec748f7174602 Alan Cox 2012-11-06  193  	if (nr_min < oaktrail_hdmi_limit.nr.min)
39ec748f7174602 Alan Cox 2012-11-06  194  		nr_min = oaktrail_hdmi_limit.nr.min;
39ec748f7174602 Alan Cox 2012-11-06  195  	if (nr_max > oaktrail_hdmi_limit.nr.max)
39ec748f7174602 Alan Cox 2012-11-06  196  		nr_max = oaktrail_hdmi_limit.nr.max;
39ec748f7174602 Alan Cox 2012-11-06  197  
39ec748f7174602 Alan Cox 2012-11-06  198  	np = DIV_ROUND_UP((refclk * 1000), (target * 10 * nr_max));
39ec748f7174602 Alan Cox 2012-11-06  199  	nr = DIV_ROUND_UP((refclk * 1000), (target * 10 * np));
39ec748f7174602 Alan Cox 2012-11-06  200  	nf = DIV_ROUND_CLOSEST((target * 10 * np * nr), refclk);
39ec748f7174602 Alan Cox 2012-11-06  201  	DRM_DEBUG_KMS("np, nr, nf %d %d %d\n", np, nr, nf);
39ec748f7174602 Alan Cox 2012-11-06  202  
39ec748f7174602 Alan Cox 2012-11-06  203  	/*
39ec748f7174602 Alan Cox 2012-11-06  204  	 * 1024 x 768  np = 1; nr = 0x26; nf = 0x0fd8000;
39ec748f7174602 Alan Cox 2012-11-06  205  	 * 1280 x 1024 np = 1; nr = 0x17; nf = 0x1034000;
39ec748f7174602 Alan Cox 2012-11-06  206  	 */
39ec748f7174602 Alan Cox 2012-11-06  207  	best_clock->np = np;
39ec748f7174602 Alan Cox 2012-11-06  208  	best_clock->nr = nr - 1;
39ec748f7174602 Alan Cox 2012-11-06  209  	best_clock->nf = (nf << 14);
39ec748f7174602 Alan Cox 2012-11-06  210  }
39ec748f7174602 Alan Cox 2012-11-06  211  
39ec748f7174602 Alan Cox 2012-11-06  212  static void scu_busy_loop(void __iomem *scu_base)
39ec748f7174602 Alan Cox 2012-11-06  213  {
39ec748f7174602 Alan Cox 2012-11-06  214  	u32 status = 0;
39ec748f7174602 Alan Cox 2012-11-06  215  	u32 loop_count = 0;
39ec748f7174602 Alan Cox 2012-11-06  216  
39ec748f7174602 Alan Cox 2012-11-06  217  	status = readl(scu_base + 0x04);
39ec748f7174602 Alan Cox 2012-11-06  218  	while (status & 1) {
39ec748f7174602 Alan Cox 2012-11-06  219  		udelay(1); /* scu processing time is in few u secods */
39ec748f7174602 Alan Cox 2012-11-06  220  		status = readl(scu_base + 0x04);
39ec748f7174602 Alan Cox 2012-11-06  221  		loop_count++;
39ec748f7174602 Alan Cox 2012-11-06  222  		/* break if scu doesn't reset busy bit after huge retry */
39ec748f7174602 Alan Cox 2012-11-06  223  		if (loop_count > 1000) {
39ec748f7174602 Alan Cox 2012-11-06  224  			DRM_DEBUG_KMS("SCU IPC timed out");
39ec748f7174602 Alan Cox 2012-11-06  225  			return;
39ec748f7174602 Alan Cox 2012-11-06  226  		}
39ec748f7174602 Alan Cox 2012-11-06  227  	}
39ec748f7174602 Alan Cox 2012-11-06  228  }
39ec748f7174602 Alan Cox 2012-11-06  229  
39ec748f7174602 Alan Cox 2012-11-06  230  /*
39ec748f7174602 Alan Cox 2012-11-06  231   *	You don't want to know, you really really don't want to know....
39ec748f7174602 Alan Cox 2012-11-06  232   *
39ec748f7174602 Alan Cox 2012-11-06  233   *	This is magic. However it's safe magic because of the way the platform
39ec748f7174602 Alan Cox 2012-11-06  234   *	works and it is necessary magic.
39ec748f7174602 Alan Cox 2012-11-06  235   */
39ec748f7174602 Alan Cox 2012-11-06  236  static void oaktrail_hdmi_reset(struct drm_device *dev)
39ec748f7174602 Alan Cox 2012-11-06  237  {
39ec748f7174602 Alan Cox 2012-11-06  238  	void __iomem *base;
39ec748f7174602 Alan Cox 2012-11-06  239  	unsigned long scu_ipc_mmio = 0xff11c000UL;
39ec748f7174602 Alan Cox 2012-11-06  240  	int scu_len = 1024;
39ec748f7174602 Alan Cox 2012-11-06  241  
39ec748f7174602 Alan Cox 2012-11-06  242  	base = ioremap((resource_size_t)scu_ipc_mmio, scu_len);
39ec748f7174602 Alan Cox 2012-11-06  243  	if (base == NULL) {
39ec748f7174602 Alan Cox 2012-11-06 @244  		DRM_ERROR("failed to map scu mmio\n");
39ec748f7174602 Alan Cox 2012-11-06  245  		return;
39ec748f7174602 Alan Cox 2012-11-06  246  	}
39ec748f7174602 Alan Cox 2012-11-06  247  
39ec748f7174602 Alan Cox 2012-11-06  248  	/* scu ipc: assert hdmi controller reset */
39ec748f7174602 Alan Cox 2012-11-06  249  	writel(0xff11d118, base + 0x0c);
39ec748f7174602 Alan Cox 2012-11-06  250  	writel(0x7fffffdf, base + 0x80);
39ec748f7174602 Alan Cox 2012-11-06  251  	writel(0x42005, base + 0x0);
39ec748f7174602 Alan Cox 2012-11-06  252  	scu_busy_loop(base);
39ec748f7174602 Alan Cox 2012-11-06  253  
39ec748f7174602 Alan Cox 2012-11-06  254  	/* scu ipc: de-assert hdmi controller reset */
39ec748f7174602 Alan Cox 2012-11-06  255  	writel(0xff11d118, base + 0x0c);
39ec748f7174602 Alan Cox 2012-11-06  256  	writel(0x7fffffff, base + 0x80);
39ec748f7174602 Alan Cox 2012-11-06  257  	writel(0x42005, base + 0x0);
39ec748f7174602 Alan Cox 2012-11-06  258  	scu_busy_loop(base);
39ec748f7174602 Alan Cox 2012-11-06  259  
39ec748f7174602 Alan Cox 2012-11-06  260  	iounmap(base);
39ec748f7174602 Alan Cox 2012-11-06  261  }
39ec748f7174602 Alan Cox 2012-11-06  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
