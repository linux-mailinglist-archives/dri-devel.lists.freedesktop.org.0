Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D30CD4637
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 23:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A2410E2BD;
	Sun, 21 Dec 2025 22:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQ6FvRtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464A10E2BD
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766354721; x=1797890721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PfQczwwXfMwazzAsoi+yBU2MNeNR6M8DPtWttCCbZak=;
 b=NQ6FvRtY/RipDa7+rYEYsTZiB3KnbTM56UbCdFu9ZCtdTI/tbEl71/nf
 mdD7CFfk5wSyYkfZnw+yGoPIg/KU0klUJPoP+36L94BudPSXpV/hBITOH
 nrvkRGtnGKveSXHRP3iJmdb5L3lErFb2ujnEbSjXcdIIA4x5e4vrC+Gop
 3nxEWVcCtN/TFrcBRuuYQvw3/FZJTxstXgCsZrzghmSukQR+CRTO89ofw
 wjK0jCeLiPeJID+FsM8S38wkoH919mWJXZgZ9b1DtBLmr09+7DOjVIzoo
 lT17YWR2tSylFaQUcYG9wJ1Y0RdQVllfN3ih69GzpLOCzPy+Kb2DAy745 w==;
X-CSE-ConnectionGUID: 2Tzdh6eqRsie8B5P37irMg==
X-CSE-MsgGUID: g+a8S/T2TQyMG+o/RFt+GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67973891"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; d="scan'208";a="67973891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 14:05:20 -0800
X-CSE-ConnectionGUID: hVP3UqD3SyioJEOFWAonqQ==
X-CSE-MsgGUID: Ri6RMMUjS0Ow55Z9BHMCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; d="scan'208";a="236790262"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 14:05:17 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXRYA-000000000E9-3plt;
 Sun, 21 Dec 2025 22:05:14 +0000
Date: Mon, 22 Dec 2025 06:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Rajput <abhiraj21put@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, abhiraj21put@gmail.com
Subject: Re: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_*
 helpers in mtk_crtc.c
Message-ID: <202512220515.z3QybJ8I-lkp@intel.com>
References: <20251217070303.689913-1-abhiraj21put@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217070303.689913-1-abhiraj21put@gmail.com>
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

Hi Abhishek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on pza/reset/next linus/master v6.19-rc1 next-20251219]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Rajput/drm-mediatek-Convert-legacy-DRM-logging-to-drm_-helpers-in-mtk_crtc-c/20251217-150453
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251217070303.689913-1-abhiraj21put%40gmail.com
patch subject: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
config: loongarch-randconfig-r062-20251218 (https://download.01.org/0day-ci/archive/20251222/202512220515.z3QybJ8I-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220515.z3QybJ8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/mediatek/mtk_crtc.c:6:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_ddp_irq':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:651:28: warning: unused variable 'dev' [-Wunused-variable]
     651 |         struct drm_device *dev = mtk_crtc->base.dev;
         |                            ^~~


vim +/dev +651 drivers/gpu/drm/mediatek/mtk_crtc.c

   645	
   646	static void mtk_crtc_ddp_irq(void *data)
   647	{
   648		struct drm_crtc *crtc = data;
   649		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
   650		struct mtk_drm_private *priv = crtc->dev->dev_private;
 > 651		struct drm_device *dev = mtk_crtc->base.dev;
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
