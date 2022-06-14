Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FDF54A355
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D301810F959;
	Tue, 14 Jun 2022 00:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E6210F77C;
 Tue, 14 Jun 2022 00:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655168229; x=1686704229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rQvvkQcPqldN3du0h4UGJIowhgpW7m2pjJkUpnxfqpo=;
 b=ZbBuISVOxCj0+uW3LsQhp8QvGY7aLulgjeQjqdmkVBo0JiQn8YWb3QIo
 4Buh/K0pfjUO4hl099Z50RD3TXWXUWBIvGO++/1CQGLTx83OBrMwALPi6
 i9S9IoWwzVdC7rceBBvpvBO4RpReuHOFjRhL1fYbmXUEDlo2/44Ahrx/6
 84lbyGL4YuiUWnQARtEFANBI4cYBDAPS1NFtC/k8j3kuF+zyy7iISnNpI
 /c8NTsLyJzmXvIIwHkZ6Dmgqr6S0rrHgjH0wkIutjojAm6+g5//7JSXlL
 zlYFQPweo6kyKOxEp59Y/rHJlta8IvfkuGYx3bURBj5Fy7ky4sQAZsQSw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="275992296"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="275992296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 17:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="686362830"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2022 17:57:07 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o0uri-000LIn-Ap;
 Tue, 14 Jun 2022 00:57:06 +0000
Date: Tue, 14 Jun 2022 08:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] drm: Remove linux/media-bus-format.h from drm_crtc.h
Message-ID: <202206140805.EbEq2F87-lkp@intel.com>
References: <20220613200317.11305-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613200317.11305-8-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org
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
config: arm64-randconfig-r004-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140805.EbEq2F87-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a94efb8736c53bd301f57ecaf952c154db64a56f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
        git checkout a94efb8736c53bd301f57ecaf952c154db64a56f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/ingenic/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:499:22: error: incomplete definition of type 'struct drm_framebuffer'
                   new_plane_state->fb->format->format == DRM_FORMAT_C8;
                   ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:26: error: incomplete definition of type 'struct drm_framebuffer'
                old_plane_state->fb->format->format != new_plane_state->fb->format->format))
                ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:65: error: incomplete definition of type 'struct drm_framebuffer'
                old_plane_state->fb->format->format != new_plane_state->fb->format->format))
                                                       ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:677:21: error: incomplete definition of type 'struct drm_framebuffer'
                   cpp = newstate->fb->format->cpp[0];
                         ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:695:24: error: incomplete definition of type 'struct drm_framebuffer'
                           switch (newstate->fb->format->format) {
                                   ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:715:25: error: incomplete definition of type 'struct drm_framebuffer'
                           fourcc = newstate->fb->format->format;
                                    ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:765:9: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB565_1X16'
                           case MEDIA_BUS_FMT_RGB565_1X16:
                                ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:768:9: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB666_1X18'
                           case MEDIA_BUS_FMT_RGB666_1X18:
                                ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:771:9: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_1X24'
                           case MEDIA_BUS_FMT_RGB888_1X24:
                                ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:774:9: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_3X8_DELTA'
                           case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
                                ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:777:9: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_3X8'
                           case MEDIA_BUS_FMT_RGB888_3X8:
                                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:813:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_3X8'
           case MEDIA_BUS_FMT_RGB888_3X8:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:814:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_3X8_DELTA'
           case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:827:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB565_1X16'
           case MEDIA_BUS_FMT_RGB565_1X16:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:828:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB666_1X18'
           case MEDIA_BUS_FMT_RGB666_1X18:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:829:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_1X24'
           case MEDIA_BUS_FMT_RGB888_1X24:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:845:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB888_1X24'
           case MEDIA_BUS_FMT_RGB888_1X24:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:846:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB666_1X18'
           case MEDIA_BUS_FMT_RGB666_1X18:
                ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:847:7: error: use of undeclared identifier 'MEDIA_BUS_FMT_RGB565_1X16'
           case MEDIA_BUS_FMT_RGB565_1X16:
                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/MEDIA_BUS_FMT_RGB565_1X16 +765 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  653  
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  654  static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
977697e20b3d758 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  655  					    struct drm_atomic_state *state)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  656  {
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  657  	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  658  	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  659  	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
1bdb542da736e29 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  660  	unsigned int width, height, cpp, next_id, plane_id;
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  661  	struct ingenic_drm_private_state *priv_state;
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  662  	struct drm_crtc_state *crtc_state;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  663  	struct ingenic_dma_hwdesc *hwdesc;
354b051c5dcbeb3 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-12-10  664  	dma_addr_t addr;
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  665  	u32 fourcc;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  666  
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  667  	if (newstate && newstate->fb) {
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  668  		if (priv->soc_info->map_noncoherent)
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  669  			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  670  
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  671  		crtc_state = newstate->crtc->state;
1bdb542da736e29 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  672  		plane_id = !!(priv->soc_info->has_osd && plane != &priv->f0);
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  673  
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  674  		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  675  		width = newstate->src_w >> 16;
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  676  		height = newstate->src_h >> 16;
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  677  		cpp = newstate->fb->format->cpp[0];
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  678  
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  679  		priv_state = ingenic_drm_get_new_priv_state(priv, state);
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  680  		next_id = (priv_state && priv_state->use_palette) ? HWDESC_PALETTE : plane_id;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  681  
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  682  		hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  683  		hwdesc->addr = addr;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  684  		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  685  		hwdesc->next = dma_hwdesc_addr(priv, next_id);
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  686  
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  687  		if (priv->soc_info->use_extended_hwdesc) {
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  688  			hwdesc->cmd |= JZ_LCD_CMD_FRM_ENABLE;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  689  
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  690  			/* Extended 8-byte descriptor */
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  691  			hwdesc->cpos = 0;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  692  			hwdesc->offsize = 0;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  693  			hwdesc->pagewidth = 0;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  694  
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  695  			switch (newstate->fb->format->format) {
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  696  			case DRM_FORMAT_XRGB1555:
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  697  				hwdesc->cpos |= JZ_LCD_CPOS_RGB555;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  698  				fallthrough;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  699  			case DRM_FORMAT_RGB565:
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  700  				hwdesc->cpos |= JZ_LCD_CPOS_BPP_15_16;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  701  				break;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  702  			case DRM_FORMAT_XRGB8888:
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  703  				hwdesc->cpos |= JZ_LCD_CPOS_BPP_18_24;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  704  				break;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  705  			}
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  706  			hwdesc->cpos |= (JZ_LCD_CPOS_COEFFICIENT_1 <<
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  707  					 JZ_LCD_CPOS_COEFFICIENT_OFFSET);
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  708  			hwdesc->dessize =
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  709  				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  710  				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK, height - 1) |
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  711  				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK, width - 1);
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  712  		}
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  713  
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  714  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
41016fe1028e4b0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19 @715  			fourcc = newstate->fb->format->format;
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  716  
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  717  			ingenic_drm_plane_config(priv->dev, plane, fourcc);
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  718  
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  719  			crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  720  		}
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  721  
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  722  		if (crtc_state->color_mgmt_changed)
686d4b4b99afe79 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-09-27  723  			ingenic_drm_update_palette(priv, crtc_state->gamma_lut->data);
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  724  	}
354b051c5dcbeb3 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-12-10  725  }
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  726  
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  727  static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  728  						struct drm_crtc_state *crtc_state,
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  729  						struct drm_connector_state *conn_state)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  730  {
c369cb27c267fe3 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  731  	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  732  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  733  	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
ca459a7407a2f5c drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  734  	unsigned int cfg, rgbcfg = 0;
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  735  
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  736  	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  737  
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  738  	if (priv->panel_is_sharp) {
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  739  		cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | JZ_LCD_CFG_REV_POLARITY;
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  740  	} else {
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  741  		cfg = JZ_LCD_CFG_PS_DISABLE | JZ_LCD_CFG_CLS_DISABLE
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  742  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  743  	}
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  744  
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  745  	if (priv->soc_info->use_extended_hwdesc)
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  746  		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  747  
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  748  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  749  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  750  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  751  		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  752  	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  753  		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  754  	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  755  		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  756  
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  757  	if (!priv->panel_is_sharp) {
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  758  		if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV) {
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  759  			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  760  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  761  			else
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  762  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  763  		} else {
dded00395bdbd45 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  764  			switch (bridge->bus_cfg.format) {
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @765  			case MEDIA_BUS_FMT_RGB565_1X16:
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  766  				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  767  				break;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @768  			case MEDIA_BUS_FMT_RGB666_1X18:
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  769  				cfg |= JZ_LCD_CFG_MODE_GENERIC_18BIT;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  770  				break;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @771  			case MEDIA_BUS_FMT_RGB888_1X24:
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  772  				cfg |= JZ_LCD_CFG_MODE_GENERIC_24BIT;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  773  				break;
ca459a7407a2f5c drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19 @774  			case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
ca459a7407a2f5c drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  775  				rgbcfg = JZ_LCD_RGBC_EVEN_GBR | JZ_LCD_RGBC_ODD_RGB;
ca459a7407a2f5c drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  776  				fallthrough;
8721215c7ef9282 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27 @777  			case MEDIA_BUS_FMT_RGB888_3X8:
8721215c7ef9282 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  778  				cfg |= JZ_LCD_CFG_MODE_8BIT_SERIAL;
8721215c7ef9282 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  779  				break;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  780  			default:
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  781  				break;
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  782  			}
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  783  		}
dba8e987687f141 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  784  	}
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  785  
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  786  	regmap_write(priv->map, JZ_REG_LCD_CFG, cfg);
ca459a7407a2f5c drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  787  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  788  }
90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  789  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
