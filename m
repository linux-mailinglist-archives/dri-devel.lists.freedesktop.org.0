Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02DC54A30B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6C10FD2A;
	Tue, 14 Jun 2022 00:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F2510FD2A;
 Tue, 14 Jun 2022 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655165168; x=1686701168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gbJfpRZz/YDVR/gEGs030Xf6wY1Tu9v0X3I8mzAd5RQ=;
 b=LMPpywhqi6ukBQ6h3Fhsq48R+t1v9uOq20nUHNwQRvszxc/2l59H+gvl
 CcTJdAqol+mP49EEZnykgoj0frNSruhNjyF/p28WvafPxQvN8YDnONJpB
 zmIPqS3ViymQjeZ9Gtg+e9U1ue7x+rxfIQu9yGUeW7BCtqrT/8Ci1LyVB
 HiAqF69+woBmzV7EQ17cVzuB9FwgOmRLLpJZKC4bGLTJR5RN89A4s1Ndd
 1Ll4xRIwkLiuamFq4slg2L7Adi0/E/p21jQ81t7s4UdvO3evIcgbTSm5F
 kXQQLOMACuUkjidtkJtn/+PbVgX3LezcgglfxpIm/zGMMsNFEtWhNCYUa Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342418761"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="342418761"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 17:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="569570863"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2022 17:06:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o0u4L-000LH5-Cr;
 Tue, 14 Jun 2022 00:06:05 +0000
Date: Tue, 14 Jun 2022 08:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] drm: Remove linux/media-bus-format.h from drm_crtc.h
Message-ID: <202206140738.nK4EvaXD-lkp@intel.com>
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
config: xtensa-randconfig-r012-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140738.nK4EvaXD-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a94efb8736c53bd301f57ecaf952c154db64a56f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
        git checkout a94efb8736c53bd301f57ecaf952c154db64a56f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/gpu/drm/ingenic/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_plane_atomic_check':
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:499:36: error: invalid use of undefined type 'struct drm_framebuffer'
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
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_encoder_atomic_mode_set':
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:765:30: error: 'MEDIA_BUS_FMT_RGB565_1X16' undeclared (first use in this function)
     765 |                         case MEDIA_BUS_FMT_RGB565_1X16:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:765:30: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:768:30: error: 'MEDIA_BUS_FMT_RGB666_1X18' undeclared (first use in this function)
     768 |                         case MEDIA_BUS_FMT_RGB666_1X18:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:771:30: error: 'MEDIA_BUS_FMT_RGB888_1X24' undeclared (first use in this function)
     771 |                         case MEDIA_BUS_FMT_RGB888_1X24:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:774:30: error: 'MEDIA_BUS_FMT_RGB888_3X8_DELTA' undeclared (first use in this function)
     774 |                         case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:777:30: error: 'MEDIA_BUS_FMT_RGB888_3X8' undeclared (first use in this function)
     777 |                         case MEDIA_BUS_FMT_RGB888_3X8:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_bridge_atomic_check':
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:813:14: error: 'MEDIA_BUS_FMT_RGB888_3X8' undeclared (first use in this function)
     813 |         case MEDIA_BUS_FMT_RGB888_3X8:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:814:14: error: 'MEDIA_BUS_FMT_RGB888_3X8_DELTA' undeclared (first use in this function)
     814 |         case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:827:14: error: 'MEDIA_BUS_FMT_RGB565_1X16' undeclared (first use in this function)
     827 |         case MEDIA_BUS_FMT_RGB565_1X16:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:828:14: error: 'MEDIA_BUS_FMT_RGB666_1X18' undeclared (first use in this function)
     828 |         case MEDIA_BUS_FMT_RGB666_1X18:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:829:14: error: 'MEDIA_BUS_FMT_RGB888_1X24' undeclared (first use in this function)
     829 |         case MEDIA_BUS_FMT_RGB888_1X24:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_bridge_atomic_get_input_bus_fmts':
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:845:14: error: 'MEDIA_BUS_FMT_RGB888_1X24' undeclared (first use in this function)
     845 |         case MEDIA_BUS_FMT_RGB888_1X24:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:846:14: error: 'MEDIA_BUS_FMT_RGB666_1X18' undeclared (first use in this function)
     846 |         case MEDIA_BUS_FMT_RGB666_1X18:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:847:14: error: 'MEDIA_BUS_FMT_RGB565_1X16' undeclared (first use in this function)
     847 |         case MEDIA_BUS_FMT_RGB565_1X16:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:848:14: error: 'MEDIA_BUS_FMT_RGB888_3X8' undeclared (first use in this function)
     848 |         case MEDIA_BUS_FMT_RGB888_3X8:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:849:14: error: 'MEDIA_BUS_FMT_RGB888_3X8_DELTA' undeclared (first use in this function)
     849 |         case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/MEDIA_BUS_FMT_RGB565_1X16 +765 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  726  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  727  static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  728  						struct drm_crtc_state *crtc_state,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  729  						struct drm_connector_state *conn_state)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  730  {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  731  	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  732  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  733  	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
ca459a7407a2f5 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  734  	unsigned int cfg, rgbcfg = 0;
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  735  
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  736  	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  737  
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  738  	if (priv->panel_is_sharp) {
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  739  		cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | JZ_LCD_CFG_REV_POLARITY;
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  740  	} else {
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  741  		cfg = JZ_LCD_CFG_PS_DISABLE | JZ_LCD_CFG_CLS_DISABLE
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  742  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  743  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  744  
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  745  	if (priv->soc_info->use_extended_hwdesc)
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  746  		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  747  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  748  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  749  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  750  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  751  		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  752  	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  753  		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  754  	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  755  		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  756  
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  757  	if (!priv->panel_is_sharp) {
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  758  		if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  759  			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  760  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  761  			else
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  762  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  763  		} else {
dded00395bdbd4 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  764  			switch (bridge->bus_cfg.format) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @765  			case MEDIA_BUS_FMT_RGB565_1X16:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  766  				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  767  				break;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @768  			case MEDIA_BUS_FMT_RGB666_1X18:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  769  				cfg |= JZ_LCD_CFG_MODE_GENERIC_18BIT;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  770  				break;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03 @771  			case MEDIA_BUS_FMT_RGB888_1X24:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  772  				cfg |= JZ_LCD_CFG_MODE_GENERIC_24BIT;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  773  				break;
ca459a7407a2f5 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19 @774  			case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
ca459a7407a2f5 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  775  				rgbcfg = JZ_LCD_RGBC_EVEN_GBR | JZ_LCD_RGBC_ODD_RGB;
ca459a7407a2f5 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  776  				fallthrough;
8721215c7ef928 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27 @777  			case MEDIA_BUS_FMT_RGB888_3X8:
8721215c7ef928 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  778  				cfg |= JZ_LCD_CFG_MODE_8BIT_SERIAL;
8721215c7ef928 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  779  				break;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  780  			default:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  781  				break;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  782  			}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  783  		}
dba8e987687f14 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-27  784  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  785  
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  786  	regmap_write(priv->map, JZ_REG_LCD_CFG, cfg);
ca459a7407a2f5 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-11-19  787  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  788  }
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  789  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
