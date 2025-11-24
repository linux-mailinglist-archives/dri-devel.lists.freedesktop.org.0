Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD5C802A1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049410E20A;
	Mon, 24 Nov 2025 11:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/T2obyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0510E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763983090; x=1795519090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g2k0HIWVBCP/Z5Z+Ar3iArnKsREQveJAkzo9sQ13H0w=;
 b=Z/T2obyv3lEjNSNvtnnI9kuzRdHNH9387H+Y85ejOO5uItnWx3yKTBsU
 boiegGW0CWjelnUBanrai608WlV3xlaiLlTZvGYRq3SS0njpLVEYIM5bx
 CSIME0vToGooDL5O/ku/EwAsOgW1iO09bHL3U8HLtj+cC792ienKTRjpp
 YGxwsuSmGG+nB8vxkD+o1Ue8z+wMenwoBQvtPttMtcdXwNySUhKwVgWSd
 7mmgu24G+l7G9t3xazjAtRza17Do76gPO+BRXoJMtLen03ZhYWv0vRdDT
 PFkO0ddvuHYjUuXGNxm0S189lL4pqkjFFvyCg1kklbSmXhg9U6d5rg7N0 Q==;
X-CSE-ConnectionGUID: BuArt324SH2tegOGrppUAQ==
X-CSE-MsgGUID: wVN7h3KeQRiMXUHrTQPtug==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76304708"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="76304708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 03:18:09 -0800
X-CSE-ConnectionGUID: FGIlfosDS4OWW9ZPYajbUA==
X-CSE-MsgGUID: 8b2BkIz4Sm+dndLr+i0vlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192548015"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 03:18:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vNUa0-000000000dl-1FMD;
 Mon, 24 Nov 2025 11:18:00 +0000
Date: Mon, 24 Nov 2025 19:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Eslam Khafagy <eslam.medhat1993@gmail.com>, linus.walleij@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eslam Khafagy <eslam.medhat1993@gmail.com>
Subject: Re: [PATCH RESEND] drm: pl111: replace dev_* print functions with
 drm_* variants
Message-ID: <202511241828.LSkH7pqE-lkp@intel.com>
References: <20251122004951.567753-1-eslam.medhat1993@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122004951.567753-1-eslam.medhat1993@gmail.com>
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

Hi Eslam,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.18-rc7 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eslam-Khafagy/drm-pl111-replace-dev_-print-functions-with-drm_-variants/20251122-085225
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251122004951.567753-1-eslam.medhat1993%40gmail.com
patch subject: [PATCH RESEND] drm: pl111: replace dev_* print functions with drm_* variants
config: arm-nhk8815_defconfig (https://download.01.org/0day-ci/archive/20251124/202511241828.LSkH7pqE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241828.LSkH7pqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241828.LSkH7pqE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/pl111/pl111_nomadik.c:7:
   drivers/gpu/drm/pl111/pl111_nomadik.h:11:32: warning: declaration of 'struct drm_device' will not be visible outside of this function [-Wvisibility]
      11 | void pl111_nomadik_init(struct drm_device *dev);
         |                                ^
   drivers/gpu/drm/pl111/pl111_nomadik.c:12:32: warning: declaration of 'struct drm_device' will not be visible outside of this function [-Wvisibility]
      12 | void pl111_nomadik_init(struct drm_device *dev)
         |                                ^
>> drivers/gpu/drm/pl111/pl111_nomadik.c:12:6: error: conflicting types for 'pl111_nomadik_init'
      12 | void pl111_nomadik_init(struct drm_device *dev)
         |      ^
   drivers/gpu/drm/pl111/pl111_nomadik.h:11:6: note: previous declaration is here
      11 | void pl111_nomadik_init(struct drm_device *dev);
         |      ^
>> drivers/gpu/drm/pl111/pl111_nomadik.c:34:2: error: call to undeclared function 'drm_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      34 |         drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
         |         ^
   2 warnings and 2 errors generated.


vim +/pl111_nomadik_init +12 drivers/gpu/drm/pl111/pl111_nomadik.c

   > 7	#include "pl111_nomadik.h"
     8	
     9	#define PMU_CTRL_OFFSET 0x0000
    10	#define PMU_CTRL_LCDNDIF BIT(26)
    11	
  > 12	void pl111_nomadik_init(struct drm_device *dev)
    13	{
    14		struct regmap *pmu_regmap;
    15	
    16		/*
    17		 * Just bail out of this is not found, we could be running
    18		 * multiplatform on something else than Nomadik.
    19		 */
    20		pmu_regmap =
    21			syscon_regmap_lookup_by_compatible("stericsson,nomadik-pmu");
    22		if (IS_ERR(pmu_regmap))
    23			return;
    24	
    25		/*
    26		 * This bit in the PMU controller multiplexes the two graphics
    27		 * blocks found in the Nomadik STn8815. The other one is called
    28		 * MDIF (Master Display Interface) and gets muxed out here.
    29		 */
    30		regmap_update_bits(pmu_regmap,
    31				   PMU_CTRL_OFFSET,
    32				   PMU_CTRL_LCDNDIF,
    33				   0);
  > 34		drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
