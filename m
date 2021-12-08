Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71946DDE9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 22:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B986E041;
	Wed,  8 Dec 2021 21:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182266E08E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 21:57:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="236697089"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="236697089"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 13:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="564284920"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2021 13:50:58 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mv4q2-00015x-1C; Wed, 08 Dec 2021 21:50:58 +0000
Date: Thu, 9 Dec 2021 05:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 17/18] drm: rockchip: Add VOP2 driver
Message-ID: <202112090519.Beunfs20-lkp@intel.com>
References: <20211208151230.3695378-18-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208151230.3695378-18-s.hauer@pengutronix.de>
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
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-exynos/exynos-drm-next v5.16-rc4]
[cannot apply to drm-tip/drm-tip tegra-drm/drm/tegra/for-next airlied/drm-next next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211208-231502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20211209/202112090519.Beunfs20-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8d57a528cbdfec4716a21d22d3d6c04c40451355
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211208-231502
        git checkout 8d57a528cbdfec4716a21d22d3d6c04c40451355
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/rockchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_setup_cluster_alpha':
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1861:33: warning: variable 'top_win_pstate' set but not used [-Wunused-but-set-variable]
    1861 |         struct drm_plane_state *top_win_pstate;
         |                                 ^~~~~~~~~~~~~~


vim +/top_win_pstate +1861 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

  1855	
  1856	static void vop2_setup_cluster_alpha(struct vop2 *vop2, struct vop2_win *main_win)
  1857	{
  1858		uint32_t offset = (main_win->data->phys_id * 0x10);
  1859		struct vop2_alpha_config alpha_config;
  1860		struct vop2_alpha alpha;
> 1861		struct drm_plane_state *top_win_pstate;
  1862		struct drm_plane_state *bottom_win_pstate;
  1863		bool src_pixel_alpha_en = false;
  1864		uint16_t src_glb_alpha_val, dst_glb_alpha_val;
  1865		bool premulti_en = false;
  1866		bool swap = false;
  1867	
  1868		/* At one win mode, win0 is dst/bottom win, and win1 is a all zero src/top win */
  1869		top_win_pstate = NULL;
  1870		bottom_win_pstate = main_win->base.state;
  1871		src_glb_alpha_val = 0;
  1872		dst_glb_alpha_val = main_win->base.state->alpha;
  1873	
  1874		if (!bottom_win_pstate->fb)
  1875			return;
  1876	
  1877		alpha_config.src_premulti_en = premulti_en;
  1878		alpha_config.dst_premulti_en = false;
  1879		alpha_config.src_pixel_alpha_en = src_pixel_alpha_en;
  1880		alpha_config.dst_pixel_alpha_en = true; /* alpha value need transfer to next mix */
  1881		alpha_config.src_glb_alpha_value = src_glb_alpha_val;
  1882		alpha_config.dst_glb_alpha_value = dst_glb_alpha_val;
  1883		vop2_parse_alpha(&alpha_config, &alpha);
  1884	
  1885		alpha.src_color_ctrl.bits.src_dst_swap = swap;
  1886		vop2_writel(vop2, RK3568_CLUSTER0_MIX_SRC_COLOR_CTRL + offset,
  1887			    alpha.src_color_ctrl.val);
  1888		vop2_writel(vop2, RK3568_CLUSTER0_MIX_DST_COLOR_CTRL + offset,
  1889			    alpha.dst_color_ctrl.val);
  1890		vop2_writel(vop2, RK3568_CLUSTER0_MIX_SRC_ALPHA_CTRL + offset,
  1891			    alpha.src_alpha_ctrl.val);
  1892		vop2_writel(vop2, RK3568_CLUSTER0_MIX_DST_ALPHA_CTRL + offset,
  1893			    alpha.dst_alpha_ctrl.val);
  1894	}
  1895	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
