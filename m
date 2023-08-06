Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AB771748
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 01:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B1110E120;
	Sun,  6 Aug 2023 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEEF10E120
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 23:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691364550; x=1722900550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fnQ8ABUclgfMax1Zfre4SLNESctzSCJB4VQ5XU2qkOE=;
 b=Tg2vsL7tJMYfI/gouy8s6jTn4KdBqMZd1mc+em4ESUGs6LnQjZId5uGK
 tve4wMcMLnKC1yAerMsC2maoZtdBqxcW8Wscj2dda7lhR+ZIXq9IG6/EJ
 FmIrpbj+M8XPcCnGgy88NvTuoGG0fKopkvww1NJic9BgE83PEtYqscj1U
 sfuk3jooXIest86631HBUG/PfqQ/BNVKOLCz9pW8Iu2RO63uEa4PKzB3R
 oTfuKQJIksrsvwJ+2ENlDzIgbvvPHzsleMgTVhDMqPBfn+H7FLfSakU9I
 s80QRlyKhJGEDcm8OxbcEqxGnFPl0QHG/wlhrI18zVz2mzYzGNjDiy+Ye A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="360492168"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="360492168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2023 16:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="765782366"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="765782366"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 06 Aug 2023 16:29:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qSnBI-0004Po-1f;
 Sun, 06 Aug 2023 23:29:04 +0000
Date: Mon, 7 Aug 2023 07:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH -next] drm/kmb: Make layer_irqs static
Message-ID: <202308070728.VycQGxPi-lkp@intel.com>
References: <20230804085033.32410-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804085033.32410-1-guozihua@huawei.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GUO,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230804]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/drm-kmb-Make-layer_irqs-static/20230807-054559
base:   next-20230804
patch link:    https://lore.kernel.org/r/20230804085033.32410-1-guozihua%40huawei.com
patch subject: [PATCH -next] drm/kmb: Make layer_irqs static
config: hexagon-randconfig-r041-20230807 (https://download.01.org/0day-ci/archive/20230807/202308070728.VycQGxPi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070728.VycQGxPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308070728.VycQGxPi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/kmb/kmb_plane.c:6:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/kmb/kmb_plane.c:6:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/kmb/kmb_plane.c:6:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/kmb/kmb_plane.c:20:18: warning: unused variable 'layer_irqs' [-Wunused-const-variable]
   static const u32 layer_irqs[] = {
                    ^
   7 warnings generated.


vim +/layer_irqs +20 drivers/gpu/drm/kmb/kmb_plane.c

    19	
  > 20	static const u32 layer_irqs[] = {
    21		LCD_INT_VL0,
    22		LCD_INT_VL1,
    23		LCD_INT_GL0,
    24		LCD_INT_GL1
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
