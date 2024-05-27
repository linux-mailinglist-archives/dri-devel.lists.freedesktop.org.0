Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952598D108A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 01:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F90910FCC6;
	Mon, 27 May 2024 23:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ6N+jjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFBA10FCC6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 23:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716852440; x=1748388440;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UPQZLfgN2PJwYFcvhxNxXsFlEUE261DKoAL5m9V08lI=;
 b=hJ6N+jjw9wsaO7r5M07i6/HoCV7HbrYnadcZV8gyf2Gzt4zkBopJYpv3
 tMUlY+EJQib7zRrson7pjTWl1KACPQpWXpL0Im7DUcB8hCpdlDm9HFijU
 +20JgfNinLTmNyT4GtazdcibSVI/mIO6pReMyBw2wy0R10vr3++Szu3K3
 5CT+JUgyPM62ZdUXeL3DHVwa7OMN9zOsRgFeGTO3T7qsiA/GjMo64Qc8u
 OFfya9yegAjoTxChpZXRN7YT75f62V9Nd/+ybYT+j+6uT5BSiWmvBQNcf
 SnL6OYp0vdZ4/DK6DGEAdUHTCnXmd2stRKk8vjk5AU8zekmOX0SZ+HbaY Q==;
X-CSE-ConnectionGUID: 38ohEtopRFeVJEJjWWqtew==
X-CSE-MsgGUID: UenFmPWaQUW2mpCdGEDvOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13018234"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="13018234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 16:27:20 -0700
X-CSE-ConnectionGUID: 32FSDnCERk+T2wvcEbBcwA==
X-CSE-MsgGUID: V5XrR3hmTD6YR+Z5AiV9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="34953636"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 27 May 2024 16:27:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBjkK-000BC3-15;
 Mon, 27 May 2024 23:27:16 +0000
Date: Tue, 28 May 2024 07:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:drm-misc-next 7/10]
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:25: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202405280709.9vMmDoGt-lkp@intel.com>
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
head:   40f98db5c06081ce583a24fb8950367f1058d2a3
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [7/10] drm/omap: Allow build with COMPILE_TEST=y
config: mips-randconfig-r133-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280709.9vMmDoGt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240528/202405280709.9vMmDoGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280709.9vMmDoGt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int [usertype] *wa_dma_data @@
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:25: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:25: sparse:     got unsigned int [usertype] *wa_dma_data
>> drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int [usertype] *wa_dma_data @@
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:24: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:24: sparse:     got unsigned int [usertype] *wa_dma_data
>> drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:19: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:19: sparse:     got unsigned int *

vim +122 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c

f5b9930b85dc631 Tomi Valkeinen 2018-09-26  101  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  102  static u32 dmm_read_wa(struct dmm *dmm, u32 reg)
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  103  {
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  104  	dma_addr_t src, dst;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  105  	int r;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  106  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  107  	src = dmm->phys_base + reg;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  108  	dst = dmm->wa_dma_handle;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  109  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  110  	r = dmm_dma_copy(dmm, src, dst);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  111  	if (r) {
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  112  		dev_err(dmm->dev, "sDMA read transfer timeout\n");
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  113  		return readl(dmm->base + reg);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  114  	}
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  115  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  116  	/*
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  117  	 * As per i878 workaround, the DMA is used to access the DMM registers.
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  118  	 * Make sure that the readl is not moved by the compiler or the CPU
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  119  	 * earlier than the DMA finished writing the value to memory.
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  120  	 */
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  121  	rmb();
f5b9930b85dc631 Tomi Valkeinen 2018-09-26 @122  	return readl(dmm->wa_dma_data);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  123  }
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  124  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  125  static void dmm_write_wa(struct dmm *dmm, u32 val, u32 reg)
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  126  {
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  127  	dma_addr_t src, dst;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  128  	int r;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  129  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26 @130  	writel(val, dmm->wa_dma_data);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  131  	/*
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  132  	 * As per i878 workaround, the DMA is used to access the DMM registers.
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  133  	 * Make sure that the writel is not moved by the compiler or the CPU, so
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  134  	 * the data will be in place before we start the DMA to do the actual
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  135  	 * register write.
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  136  	 */
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  137  	wmb();
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  138  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  139  	src = dmm->wa_dma_handle;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  140  	dst = dmm->phys_base + reg;
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  141  
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  142  	r = dmm_dma_copy(dmm, src, dst);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  143  	if (r) {
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  144  		dev_err(dmm->dev, "sDMA write transfer timeout\n");
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  145  		writel(val, dmm->base + reg);
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  146  	}
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  147  }
f5b9930b85dc631 Tomi Valkeinen 2018-09-26  148  

:::::: The code at line 122 was first introduced by commit
:::::: f5b9930b85dc6319fd6bcc259e447eff62fc691c drm/omap: partial workaround for DRA7xx DMM errata i878

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
