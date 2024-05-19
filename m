Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786728C935B
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 05:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BA610E072;
	Sun, 19 May 2024 03:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwgC3vvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6953110E072
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 03:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716089880; x=1747625880;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QhL+PTYA64xuE9Wh/B3sut8MHzJ4yCUNt2ix0mfY/Z4=;
 b=LwgC3vvnKdxyJEdIQxTVFguY6FBQHbLPaUIp7RTxWYwYpbUH5iIBSr6q
 E3ZBn8SauJxz/rNgF6bMD4+82GdGVlraH0fvTTcEA03Ydu9da04PQD0st
 kGGUQ84vxRxSdPoVUWlHQlT3I0d52pMCEZT6K/Hk09gjtgd2OTvEGa0CW
 UvFATVqzKAoU+wR6+WR42bKV871RYKdtMcp9EqYvoS9FZO17Ee1mfIv71
 PHR6YgQcQ4Gf2tMNMnIjx4ALE5CsXqs+OxbItUPWTCPdm2QHa2zJWsccl
 X/DGADx4d1bZxIXmJrlVpWQ2QLKoyqTc2NjTF/4gKaqKI4X5RtZ+hOCP9 Q==;
X-CSE-ConnectionGUID: Mg6tuqTNRdWCftARE1QWIQ==
X-CSE-MsgGUID: JXVoxKdeQ0SuCo0555qXfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="15183984"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; d="scan'208";a="15183984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2024 20:37:59 -0700
X-CSE-ConnectionGUID: K2LXhISGQTa0kv/QqNzhIw==
X-CSE-MsgGUID: 4cEfOdYfSwu2IGC+DsZc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; d="scan'208";a="32032445"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 18 May 2024 20:37:56 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s8XMn-0002uG-2U;
 Sun, 19 May 2024 03:37:47 +0000
Date: Sun, 19 May 2024 11:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:drm-misc-next 7/10] arch/powerpc/include/asm/page.h:25:33:
 error: conversion from 'long unsigned int' to 'u16' {aka 'short
 unsigned int'} changes value from '65536' to '0'
Message-ID: <202405191159.VZqjxILr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   85cb9d603953d77de5cb311d229a79c439ff6bfb
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [7/10] drm/omap: Allow build with COMPILE_TEST=y
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191159.VZqjxILr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191159.VZqjxILr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191159.VZqjxILr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/mmu.h:144,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/omapdrm/omap_gem.c:7:
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
>> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:757:42: note: in expansion of macro 'PAGE_SIZE'
     757 |                                          PAGE_SIZE);
         |                                          ^~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
>> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:1503:65: note: in expansion of macro 'PAGE_SIZE'
    1503 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
         |                                                                 ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +25 arch/powerpc/include/asm/page.h

5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  17  
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  18  /*
e12401222f749c arch/powerpc/include/asm/page.h Yuri Tikhonov    2009-01-29  19   * On regular PPC32 page size is 4K (but we support 4K/16K/64K/256K pages
555f4fdb93e70d arch/powerpc/include/asm/page.h Christophe Leroy 2019-02-21  20   * on PPC44x and 4K/16K on 8xx). For PPC64 we support either 4K or 64K software
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  21   * page size. When using 64K pages however, whether we are really supporting
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  22   * 64K pages in HW or not is irrelevant to those definitions.
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  23   */
d3e5bab923d35f arch/powerpc/include/asm/page.h Arnd Bergmann    2024-02-26  24  #define PAGE_SHIFT		CONFIG_PAGE_SHIFT
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11 @25  #define PAGE_SIZE		(ASM_CONST(1) << PAGE_SHIFT)
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  26  

:::::: The code at line 25 was first introduced by commit
:::::: 5cd16ee934eafca74a6bb790328950cec68a8b78 [PATCH] powerpc: Merge page.h

:::::: TO: Michael Ellerman <michael@ellerman.id.au>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
