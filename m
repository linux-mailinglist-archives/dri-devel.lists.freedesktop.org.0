Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D045E806
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 07:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F406E841;
	Fri, 26 Nov 2021 06:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5306E841
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 06:44:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="259521530"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="259521530"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 22:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="475820944"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 25 Nov 2021 22:44:18 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqUy1-0007iJ-CR; Fri, 26 Nov 2021 06:44:17 +0000
Date: Fri, 26 Nov 2021 14:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/12] drm: rockchip: Add VOP2 driver
Message-ID: <202111261442.VG18rKq6-lkp@intel.com>
References: <20211117143347.314294-13-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117143347.314294-13-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on drm/drm-next v5.16-rc2 next-20211125]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211117-223601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20211126/202111261442.VG18rKq6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f8c11ce8b4d254bb4824a87adbf9ed187a3c1178
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/drm-rockchip-RK356x-VOP2-support/20211117-223601
        git checkout f8c11ce8b4d254bb4824a87adbf9ed187a3c1178
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_setup_dly_for_window':
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2943:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
    2943 |         struct drm_plane *plane;
         |                           ^~~~~


vim +/plane +2943 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

  2937	
  2938	static void vop2_setup_dly_for_window(struct vop2_video_port *vp, const struct vop2_zpos *vop2_zpos,
  2939					      int nr_layers)
  2940	{
  2941		struct vop2 *vop2 = vp->vop2;
  2942		const struct vop2_zpos *zpos;
> 2943		struct drm_plane *plane;
  2944		struct vop2_win *win;
  2945		uint32_t dly;
  2946		int i = 0;
  2947	
  2948		for (i = 0; i < nr_layers; i++) {
  2949			zpos = &vop2_zpos[i];
  2950			win = zpos->win;
  2951			plane = &win->base;
  2952			dly = win->data->dly[VOP2_DLY_MODE_DEFAULT];
  2953	
  2954			if (vop2_cluster_window(win))
  2955				dly |= dly << 8;
  2956	
  2957			vop2_write(vop2, &vop2->data->ctrl->win_dly[win->data->phys_id], dly);
  2958		}
  2959	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
