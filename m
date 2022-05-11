Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890B524037
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 00:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542D10E45C;
	Wed, 11 May 2022 22:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552FC10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 22:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652307986; x=1683843986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jE1UyGvLFFFLH6yYJw3asEf+q1Uvmml70c+XecdjABU=;
 b=KGNs+5ShH8KGQ+s+gVvgvVc7pjXt7Z4Jglxqlp+IZhyPuWCvVyb563iL
 VSv8WttY+khxFc12/bRy2we8y0afEpJ/71NgTAyt50P2VFRX43K3jJxOQ
 w1i089114ScyRhECjf1gUihbnRWRuIIYyGwd3uzojoPeKap8gQibNXnED
 sD2r3N/2eF5/lyfyeJgWFMceNOJTUNZFQrSasSan2fHy3EgU90jYbJyd6
 F/MSZ1R77A+EW8Cez2MS59GM+/d6ynY807gG7MWp+kQPQlzgNwJvPvqKy
 o7yY2IRBMXxL17XglmZQezrSyXD17H+dVypFFor70Itz1/gvzRYrdYqI7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="257377087"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="257377087"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 15:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="572271298"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 11 May 2022 15:26:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nouml-000Jdg-4X;
 Wed, 11 May 2022 22:26:23 +0000
Date: Thu, 12 May 2022 06:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, tzimmermann@suse.de
Subject: Re: [PATCH v2] mgag200: Enable atomic gamma lut update
Message-ID: <202205120649.U2yM0PXz-lkp@intel.com>
References: <20220511152815.892562-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511152815.892562-1-jfalempe@redhat.com>
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
Cc: michel@daenzer.net, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on v5.18-rc6]
[cannot apply to drm/drm-next drm-tip/drm-tip airlied/drm-next next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220511-233134
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: i386-randconfig-a003-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120649.U2yM0PXz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0831f1db9ae8814796efea603749709e80d2808c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220511-233134
        git checkout 0831f1db9ae8814796efea603749709e80d2808c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_mode.c:972:5: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                   crtc_state->gamma_lut->length);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:438:46: note: expanded from macro 'drm_err'
           __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
                                                ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:425:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +972 drivers/gpu/drm/mgag200/mgag200_mode.c

   937	
   938	static int
   939	mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
   940					  struct drm_plane_state *plane_state,
   941					  struct drm_crtc_state *crtc_state)
   942	{
   943		struct drm_plane *plane = plane_state->plane;
   944		struct drm_device *dev = plane->dev;
   945		struct mga_device *mdev = to_mga_device(dev);
   946		struct mgag200_pll *pixpll = &mdev->pixpll;
   947		struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
   948		struct drm_framebuffer *new_fb = plane_state->fb;
   949		struct drm_framebuffer *fb = NULL;
   950		int ret;
   951	
   952		if (!new_fb)
   953			return 0;
   954	
   955		if (plane->state)
   956			fb = plane->state->fb;
   957	
   958		if (!fb || (fb->format != new_fb->format))
   959			crtc_state->mode_changed = true; /* update PLL settings */
   960	
   961		if (crtc_state->mode_changed) {
   962			ret = pixpll->funcs->compute(pixpll, crtc_state->mode.clock,
   963						     &mgag200_crtc_state->pixpllc);
   964			if (ret)
   965				return ret;
   966		}
   967	
   968		if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
   969			if (crtc_state->gamma_lut->length !=
   970			    MGAG200_LUT_SIZE * sizeof(struct drm_color_lut)) {
   971				drm_err(dev, "Wrong size for gamma_lut %ld\n",
 > 972					crtc_state->gamma_lut->length);
   973				return -EINVAL;
   974			}
   975		}
   976		return 0;
   977	}
   978	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
