Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D4A579FD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 12:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE8110E048;
	Sat,  8 Mar 2025 11:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBekcoLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C610E048
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 11:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741433537; x=1772969537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mGyzuQSYI7lxTaG2jXM1kKKIwq/K5pIrgPk+wo5OWgs=;
 b=IBekcoLNJC4CD/dWjW8+kTbMex0vw49C4L2ge37dfNeYZ99Q+OF2o6pH
 Z6wQfUumkq/FbXQZCu0D/V8qgM6gHSysrx39s0Fzk5LafVw9rWsUZYxCh
 0WLRVKSxncuEyAzm0/4DzgjV9vPBN2IfQGfQ8jRIZiuykI/zWQFu13gO3
 AUZJK43sUesIbRbaGJDMeIrK9K2bHYN9A4grSQFm8c7jiL/CbAGbOWlVR
 ZmfcWcOooxz6/MSmUYWEwsZglRNMIRUQtbPtlAinQ8f+jDnjIkQsYhqdo
 gustSIujflOZ7NXYU9R8sBrIZNjWsKnVNH/49DXfpfIGV6fWvmrv0GV1I g==;
X-CSE-ConnectionGUID: iLN0jFv5SwiEpkiKjJ62ow==
X-CSE-MsgGUID: s/XvSn+yQIWFUIf4CDb8Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46259554"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="46259554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 03:32:16 -0800
X-CSE-ConnectionGUID: IMg6izIxRlW2TFhEeyHY2g==
X-CSE-MsgGUID: wh3GvtK/TuespLgCOnphSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="119724206"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2025 03:32:13 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqsPb-0001qk-2a;
 Sat, 08 Mar 2025 11:32:11 +0000
Date: Sat, 8 Mar 2025 19:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202503081907.HxPC1bKV-lkp@intel.com>
References: <20250306140947.580324-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-7-tzimmermann@suse.de>
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
[also build test ERROR on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250306-221554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250306140947.580324-7-tzimmermann%40suse.de
patch subject: [PATCH v3 06/11] backlight: Replace fb events with a dedicated function call
config: i386-randconfig-005-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081907.HxPC1bKV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081907.HxPC1bKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081907.HxPC1bKV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/core/fb_backlight.o: in function `fb_bl_notify_blank':
>> drivers/video/fbdev/core/fb_backlight.c:47: undefined reference to `backlight_notify_blank'
>> ld: drivers/video/fbdev/core/fb_backlight.c:49: undefined reference to `backlight_notify_blank_all'


vim +47 drivers/video/fbdev/core/fb_backlight.c

    40	
    41	void fb_bl_notify_blank(struct fb_info *info, int old_blank)
    42	{
    43		bool on = info->blank == FB_BLANK_UNBLANK;
    44		bool prev_on = old_blank == FB_BLANK_UNBLANK;
    45	
    46		if (info->bl_dev)
  > 47			backlight_notify_blank(info->bl_dev, info->device, on, prev_on);
    48		else
  > 49			backlight_notify_blank_all(info->device, on, prev_on);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
