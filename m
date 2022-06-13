Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E0754A2B2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 01:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FFB10F38F;
	Mon, 13 Jun 2022 23:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558A10F53D;
 Mon, 13 Jun 2022 23:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655162707; x=1686698707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xIOue7JLd+OLiufPp2v/UpuaeY4qgCnSY2S9wzhG6qI=;
 b=AHuZkVczXLLImBAVlzq+sszokxfxkAXgzrmH0UKh+m088FAoYw7ewUHG
 PCkkiHzHycaAfXAhEAmopF0l+MuP6wpkLPZId2Ir6plGjMBxmb9U/w3VX
 yomUk4Sfl9AA0MiUQruF5APtEwDAp4yeGF42MjhjqToHwTzqDykzxAXXd
 3Oax0PRFvZLA2pMu3vG/aG2h53HjOAhQ6mNaystduDXbpnxC/DRBzteTb
 LGm/hzwWiOzaWTvnDwwvdHXt70d8gJC6cXAcuhpH2Ypfd5IOnURBH9ssc
 GXbFNXDSTpB1wl5mxmar/eSsaTo9TBhY5xsfC972EW2tC5u6Jjb2DArP7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="340110688"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="340110688"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 16:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="640013922"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 16:25:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o0tQe-000LFJ-2E;
 Mon, 13 Jun 2022 23:25:04 +0000
Date: Tue, 14 Jun 2022 07:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/8] drm: Drop drm_framebuffer.h from
 drm_crtc.h
Message-ID: <202206140730.7koRev9k-lkp@intel.com>
References: <20220613200317.11305-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613200317.11305-3-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220610]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next v5.19-rc2 v5.19-rc1 v5.18 v5.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
base:    6d0c806803170f120f8cb97b321de7bd89d3a791
config: xtensa-randconfig-r012-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140730.7koRev9k-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/be7de5c4289616ee04e75a6fe7df89e80a184da0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
        git checkout be7de5c4289616ee04e75a6fe7df89e80a184da0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/gpu/drm/ingenic/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_plane_atomic_check':
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:499:36: error: invalid use of undefined type 'struct drm_framebuffer'
     499 |                 new_plane_state->fb->format->format == DRM_FORMAT_C8;
         |                                    ^~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:33: error: invalid use of undefined type 'struct drm_framebuffer'
     511 |              old_plane_state->fb->format->format != new_plane_state->fb->format->format))
         |                                 ^~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:72: error: invalid use of undefined type 'struct drm_framebuffer'
     511 |              old_plane_state->fb->format->format != new_plane_state->fb->format->format))
         |                                                                        ^~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_plane_atomic_update':
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:677:35: error: invalid use of undefined type 'struct drm_framebuffer'
     677 |                 cpp = newstate->fb->format->cpp[0];
         |                                   ^~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:695:45: error: invalid use of undefined type 'struct drm_framebuffer'
     695 |                         switch (newstate->fb->format->format) {
         |                                             ^~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:715:46: error: invalid use of undefined type 'struct drm_framebuffer'
     715 |                         fourcc = newstate->fb->format->format;
         |                                              ^~
--
   drivers/gpu/drm/ingenic/ingenic-ipu.c: In function 'ingenic_ipu_plane_atomic_update':
>> drivers/gpu/drm/ingenic/ingenic-ipu.c:342:45: error: invalid use of undefined type 'struct drm_framebuffer'
     342 |         finfo = drm_format_info(newstate->fb->format->format);
         |                                             ^~


vim +499 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  451  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  452  static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
7c11b99a8e58c0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  453  					  struct drm_atomic_state *state)
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  454  {
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  455  	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  456  										 plane);
7c11b99a8e58c0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  457  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
7c11b99a8e58c0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  458  										 plane);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  459  	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  460  	struct ingenic_drm_private_state *priv_state;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  461  	struct drm_crtc_state *crtc_state;
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  462  	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  463  	int ret;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  464  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  465  	if (!crtc)
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  466  		return 0;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  467  
5357402398784b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2022-02-12  468  	if (priv->soc_info->plane_f0_not_working && plane == &priv->f0)
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  469  		return -EINVAL;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  470  
dec92020671c48 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  471  	crtc_state = drm_atomic_get_existing_crtc_state(state,
ba5c1649465d40 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  472  							crtc);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  473  	if (WARN_ON(!crtc_state))
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  474  		return -EINVAL;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  475  
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  476  	priv_state = ingenic_drm_get_priv_state(priv, state);
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  477  	if (IS_ERR(priv_state))
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  478  		return PTR_ERR(priv_state);
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  479  
ba5c1649465d40 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  480  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  481  						  DRM_PLANE_HELPER_NO_SCALING,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  482  						  DRM_PLANE_HELPER_NO_SCALING,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  483  						  priv->soc_info->has_osd,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  484  						  true);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  485  	if (ret)
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  486  		return ret;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  487  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  488  	/*
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  489  	 * If OSD is not available, check that the width/height match.
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  490  	 * Note that state->src_* are in 16.16 fixed-point format.
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  491  	 */
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  492  	if (!priv->soc_info->has_osd &&
ba5c1649465d40 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  493  	    (new_plane_state->src_x != 0 ||
ba5c1649465d40 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  494  	     (new_plane_state->src_w >> 16) != new_plane_state->crtc_w ||
ba5c1649465d40 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  495  	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  496  		return -EINVAL;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  497  
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  498  	priv_state->use_palette = new_plane_state->fb &&
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26 @499  		new_plane_state->fb->format->format == DRM_FORMAT_C8;
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  500  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  501  	/*
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  502  	 * Require full modeset if enabling or disabling a plane, or changing
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  503  	 * its position, size or depth.
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  504  	 */
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  505  	if (priv->soc_info->has_osd &&
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  506  	    (!old_plane_state->fb || !new_plane_state->fb ||
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  507  	     old_plane_state->crtc_x != new_plane_state->crtc_x ||
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  508  	     old_plane_state->crtc_y != new_plane_state->crtc_y ||
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  509  	     old_plane_state->crtc_w != new_plane_state->crtc_w ||
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  510  	     old_plane_state->crtc_h != new_plane_state->crtc_h ||
0b6aaf9d76f042 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  511  	     old_plane_state->fb->format->format != new_plane_state->fb->format->format))
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  512  		crtc_state->mode_changed = true;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  513  
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  514  	if (priv->soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  515  		drm_atomic_helper_check_plane_damage(state, new_plane_state);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  516  
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  517  	return 0;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  518  }
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  519  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
