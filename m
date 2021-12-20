Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2247B627
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 00:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F90710E163;
	Mon, 20 Dec 2021 23:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D90F10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640042434; x=1671578434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2gMiwg/PyuvqjzPoCNHebtE17bJB95fTO0RVsbVSb6c=;
 b=IaUqpDSLWav5Y5I/xi28QPvQm7hzrCnc/EU6HrdGq13TaHWjc1o4AkWt
 5KUknhQgEZgnwItFfZtinSDVTTrQTcWLRUP4GpTyQC8rxJj46egskc5s/
 8vaX50CNEGpet9drR+H+uTv6k1T3oUiRpbgL+FX0khoks4uDYR36WViFa
 EbpCK7607rFfzxVaO5oX7BmxHTijugQ3A9+CGVr8SZNG7Dfyxq4YQ4Z3/
 YFNZmM8Mn7N9xWty1TzByxTruyHE79eVcWQL77a6dxr5tyzkxIVyWoKPc
 rKZ2nNt+ITisOvS6Q5/qZ5hbJORrKwyF/FXt0l/6fVCwWwcAQEW+wz+UM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227140058"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="227140058"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 15:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="547593542"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 15:20:30 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzRxF-0008Oo-OK; Mon, 20 Dec 2021 23:20:29 +0000
Date: Tue, 21 Dec 2021 07:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Message-ID: <202112210748.VrULDmGp-lkp@intel.com>
References: <20211220110630.3521121-23-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220110630.3521121-23-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on tegra-drm/drm/tegra/for-next v5.16-rc6]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next airlied/drm-next next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211220-190821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211221/202112210748.VrULDmGp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ade6380669a79670b48d440d8b7a00986a5d7ca8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211220-190821
        git checkout ade6380669a79670b48d440d8b7a00986a5d7ca8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/rockchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_cluster_init':
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2525:1: warning: the frame size of 1100 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2525 | };
         | ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_esmart_init':
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2597:1: warning: the frame size of 1100 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2597 | };
         | ^


vim +2525 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

  2450	
  2451	static int vop2_cluster_init(struct vop2_win *win)
  2452	{
  2453		struct vop2 *vop2 = win->vop2;
  2454		int i;
  2455		struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
  2456			[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
  2457			[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
  2458			[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 14, 14),
  2459			[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 18, 18),
  2460			[VOP2_WIN_ACT_INFO] = REG_FIELD(RK3568_CLUSTER_WIN_ACT_INFO, 0, 31),
  2461			[VOP2_WIN_DSP_INFO] = REG_FIELD(RK3568_CLUSTER_WIN_DSP_INFO, 0, 31),
  2462			[VOP2_WIN_DSP_ST] = REG_FIELD(RK3568_CLUSTER_WIN_DSP_ST, 0, 31),
  2463			[VOP2_WIN_YRGB_MST] = REG_FIELD(RK3568_CLUSTER_WIN_YRGB_MST, 0, 31),
  2464			[VOP2_WIN_UV_MST] = REG_FIELD(RK3568_CLUSTER_WIN_CBR_MST, 0, 31),
  2465			[VOP2_WIN_YUV_CLIP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 19, 19),
  2466			[VOP2_WIN_YRGB_VIR] = REG_FIELD(RK3568_CLUSTER_WIN_VIR, 0, 15),
  2467			[VOP2_WIN_UV_VIR] = REG_FIELD(RK3568_CLUSTER_WIN_VIR, 16, 31),
  2468			[VOP2_WIN_Y2R_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 8, 8),
  2469			[VOP2_WIN_R2Y_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 9, 9),
  2470			[VOP2_WIN_CSC_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 10, 11),
  2471	
  2472			/* Scale */
  2473			[VOP2_WIN_SCALE_YRGB_X] = REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 0, 15),
  2474			[VOP2_WIN_SCALE_YRGB_Y] = REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 16, 31),
  2475			[VOP2_WIN_YRGB_VER_SCL_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 14, 15),
  2476			[VOP2_WIN_YRGB_HOR_SCL_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 12, 13),
  2477			[VOP2_WIN_BIC_COE_SEL] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 2, 3),
  2478			[VOP2_WIN_VSD_YRGB_GT2] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 28, 28),
  2479			[VOP2_WIN_VSD_YRGB_GT4] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 29, 29),
  2480	
  2481			/* cluster regs */
  2482			[VOP2_WIN_AFBC_ENABLE] = REG_FIELD(RK3568_CLUSTER_CTRL, 1, 1),
  2483			[VOP2_WIN_CLUSTER_ENABLE] = REG_FIELD(RK3568_CLUSTER_CTRL, 0, 0),
  2484			[VOP2_WIN_CLUSTER_LB_MODE] = REG_FIELD(RK3568_CLUSTER_CTRL, 4, 7),
  2485	
  2486			/* afbc regs */
  2487			[VOP2_WIN_AFBC_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 2, 6),
  2488			[VOP2_WIN_AFBC_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 9, 9),
  2489			[VOP2_WIN_AFBC_UV_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 10, 10),
  2490			[VOP2_WIN_AFBC_AUTO_GATING_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_OUTPUT_CTRL, 4, 4),
  2491			[VOP2_WIN_AFBC_HALF_BLOCK_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 7, 7),
  2492			[VOP2_WIN_AFBC_BLOCK_SPLIT_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 8, 8),
  2493			[VOP2_WIN_AFBC_HDR_PTR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_HDR_PTR, 0, 31),
  2494			[VOP2_WIN_AFBC_PIC_SIZE] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_SIZE, 0, 31),
  2495			[VOP2_WIN_AFBC_PIC_VIR_WIDTH] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 0, 15),
  2496			[VOP2_WIN_AFBC_TILE_NUM] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 16, 31),
  2497			[VOP2_WIN_AFBC_PIC_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_OFFSET, 0, 31),
  2498			[VOP2_WIN_AFBC_DSP_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET, 0, 31),
  2499			[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET, 0, 31),
  2500			[VOP2_WIN_AFBC_ROTATE_90] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 0, 0),
  2501			[VOP2_WIN_AFBC_ROTATE_270] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 1, 1),
  2502			[VOP2_WIN_XMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 2, 2),
  2503			[VOP2_WIN_YMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 3, 3),
  2504			[VOP2_WIN_UV_SWAP] = { .reg = 0xffffffff },
  2505			[VOP2_WIN_COLOR_KEY] = { .reg = 0xffffffff },
  2506			[VOP2_WIN_COLOR_KEY_EN] = { .reg = 0xffffffff },
  2507			[VOP2_WIN_SCALE_CBCR_X] = { .reg = 0xffffffff },
  2508			[VOP2_WIN_SCALE_CBCR_Y] = { .reg = 0xffffffff },
  2509			[VOP2_WIN_YRGB_HSCL_FILTER_MODE] = { .reg = 0xffffffff },
  2510			[VOP2_WIN_YRGB_VSCL_FILTER_MODE] = { .reg = 0xffffffff },
  2511			[VOP2_WIN_CBCR_VER_SCL_MODE] = { .reg = 0xffffffff },
  2512			[VOP2_WIN_CBCR_HSCL_FILTER_MODE] = { .reg = 0xffffffff },
  2513			[VOP2_WIN_CBCR_HOR_SCL_MODE] = { .reg = 0xffffffff },
  2514			[VOP2_WIN_CBCR_VSCL_FILTER_MODE] = { .reg = 0xffffffff },
  2515			[VOP2_WIN_VSD_CBCR_GT2] = { .reg = 0xffffffff },
  2516			[VOP2_WIN_VSD_CBCR_GT4] = { .reg = 0xffffffff },
  2517		};
  2518	
  2519		for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
  2520			vop2_cluster_regs[i].reg += win->offset;
  2521	
  2522		return devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
  2523						    vop2_cluster_regs,
  2524						    ARRAY_SIZE(vop2_cluster_regs));
> 2525	};
  2526	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
