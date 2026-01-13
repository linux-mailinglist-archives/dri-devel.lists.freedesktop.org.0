Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3AD16884
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 04:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2AE10E143;
	Tue, 13 Jan 2026 03:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mePDu0JA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104610E143
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768275759; x=1799811759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wRx+TNLJBbL2ubl8LIvhEos4LxCfMOOdQi3XJl6jDyE=;
 b=mePDu0JAe8NxouW206yBW2Z8KhgkyES7Dav+pb3l0uoHlK5A1iAnzYf/
 6uDyUP1go7glL5mqi61wbTDcmChaYfQut+Nde5SB2YostLeEX2pWg4GXt
 +9nCsVfuwROYcY2z0T96xSSmJqn5Bo+pU5thluXGOmaE38gsEXZempqkQ
 BVjjfXp0F6GmulHx99/O/8b4eIf1+7gJXHs2a4fTJSL5KWR03ezgY67of
 vzPEI9o2QEYoB2AqvPz0WatmwvPjU5g3piqnvieOrUu4dOmTXNudPrXTi
 Q6r+UdMrF7Y67+MU2JbHu/ojcVe+wLyQH4aAzgfD8OENeHXDjzQy909yA g==;
X-CSE-ConnectionGUID: nQFvCA3zSmOFY1BUL2AULA==
X-CSE-MsgGUID: qth8k1I3TlKL7xsXnb7EcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="81009554"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="81009554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:42:39 -0800
X-CSE-ConnectionGUID: Dp9NJNqyRymYSYWocfCcrQ==
X-CSE-MsgGUID: jSeE+nXDRt2HMQrAxmYNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209098823"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 19:42:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfVIe-00000000EB2-1gwZ;
 Tue, 13 Jan 2026 03:42:32 +0000
Date: Tue, 13 Jan 2026 11:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: Re: [PATCH v4 2/5] drm/microchip: add a driver for the Microchip
 GFX2D GPU
Message-ID: <202601131146.aeqDjJy1-lkp@intel.com>
References: <20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343@microchip.com>
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

Hi Cyrille,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38feb171b3f92d77e8061fafb5ddfffc2c13b672]

url:    https://github.com/intel-lab-lkp/linux/commits/Cyrille-Pitchen/dt-bindings-gpu-add-bindings-for-the-Microchip-GFX2D-GPU/20260112-192254
base:   38feb171b3f92d77e8061fafb5ddfffc2c13b672
patch link:    https://lore.kernel.org/r/20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343%40microchip.com
patch subject: [PATCH v4 2/5] drm/microchip: add a driver for the Microchip GFX2D GPU
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601131146.aeqDjJy1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131146.aeqDjJy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131146.aeqDjJy1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c: In function 'mchp_gfx2d_enable_exend':
>> drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c:44:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
      44 |         drm_dbg(&priv->drm, "enable EXEND interrupt\n");
         |         ^~~~~~~
         |         dev_dbg
--
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:10: error: 'const struct drm_driver' has no member named 'date'
      61 |         .date = "20240716",
         |          ^~~~
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:17: error: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
      61 |         .date = "20240716",
         |                 ^~~~~~~~~~
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:17: note: (near initialization for 'mchp_gfx2d_drm_driver.driver_features')
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:62:28: warning: initialized field overwritten [-Woverride-init]
      62 |         .driver_features = DRIVER_GEM | DRIVER_RENDER,
         |                            ^~~~~~~~~~
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:62:28: note: (near initialization for 'mchp_gfx2d_drm_driver.driver_features')
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c: In function 'mchp_gfx2d_thread':
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:98:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
      98 |         drm_dbg(&priv->drm, "enter IRQ thread\n");
         |         ^~~~~~~
         |         dev_dbg
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c: At top level:
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:344:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
     344 |         .remove_new = mchp_gfx2d_remove,
         |          ^~~~~~~~~~
         |          remove
--
   drivers/gpu/drm/microchip/mchp_gfx2d_gem.c: In function 'mchp_gfx2d_gem_create':
>> drivers/gpu/drm/microchip/mchp_gfx2d_gem.c:127:17: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
     127 |                 drm_dbg(dev, "failed to allocate buffer with size %zu\n", size);
         |                 ^~~~~~~
         |                 dev_dbg
   drivers/gpu/drm/microchip/mchp_gfx2d_gem.c: In function 'mchp_gfx2d_gem_prime_import_sg_table':
>> drivers/gpu/drm/microchip/mchp_gfx2d_gem.c:201:9: error: implicit declaration of function 'drm_dbg_prime' [-Wimplicit-function-declaration]
     201 |         drm_dbg_prime(dev, "dma_addr = %pad, size = %zu\n",
         |         ^~~~~~~~~~~~~


vim +44 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c

    41	
    42	static void mchp_gfx2d_enable_exend(struct mchp_gfx2d_device *priv)
    43	{
  > 44		drm_dbg(&priv->drm, "enable EXEND interrupt\n");
    45		writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_IE);
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
