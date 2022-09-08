Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660C5B27D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2627910E24B;
	Thu,  8 Sep 2022 20:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADC610E24B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662669511; x=1694205511;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=jullD78EFRfJTUEIXXbS0A7cYNAmhXeLMkAknNPluLI=;
 b=k7824DS0KCx5am9SSijVq50w0tzFl4CA6++8pkItzMGlWK3/yBlE9ke9
 eT8fHOQasVRagD7rg5Z14nNHWyT2O5AvtNtIP7xFzq7n+Vcf+nwYvwWBg
 vTUkAowUSB9J7APFfvdRUi1Jt9xtaEj1AW1ByZt9Hwnm8HdDB5qSUj5c0
 3DPxE2NycPGIoaUMflTx+82UkOQ4XvutyVhl6a2lqbHgmkb/qjcUIQm8Y
 coIKbfMrObxlVI/ixikjCyBe6QOkf2eq0g4eATtN0LmiXghJrK1t76L8L
 pTs9lvvnXQCz4F9WN4OQdTDhXdjCk9u9LGpOJIVlo8/rPPwLXVh3xaNrX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359048228"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="359048228"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="566097348"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 13:38:29 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oWOI8-0000Iu-32;
 Thu, 08 Sep 2022 20:38:28 +0000
Date: Fri, 9 Sep 2022 04:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [drm-misc:drm-misc-next 1/1]
 drivers/gpu/drm/sun4i/sun4i_tv.c:356:17: error: implicit declaration of
 function 'drm_atomic_get_new_crtc_state'; did you mean
 'drm_atomic_helper_swap_state'?
Message-ID: <202209090435.Nc6iroRU-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   5d832b6694e094b176627ed9918a1b21c56fb742
commit: ec491291dc94914cf962dcd399c3e9b43b00a770 [1/1] drm/sun4i: tv: Merge mode_set into atomic_enable
config: parisc-randconfig-r003-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090435.Nc6iroRU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout ec491291dc94914cf962dcd399c3e9b43b00a770
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/gpu/drm/sun4i/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_tv.c: In function 'sun4i_tv_enable':
>> drivers/gpu/drm/sun4i/sun4i_tv.c:356:17: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
     356 |                 drm_atomic_get_new_crtc_state(state, encoder->crtc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 drm_atomic_helper_swap_state
>> drivers/gpu/drm/sun4i/sun4i_tv.c:356:17: warning: initialization of 'struct drm_crtc_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +356 drivers/gpu/drm/sun4i/sun4i_tv.c

   349	
   350	static void sun4i_tv_enable(struct drm_encoder *encoder,
   351				    struct drm_atomic_state *state)
   352	{
   353		struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
   354		struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
   355		struct drm_crtc_state *crtc_state =
 > 356			drm_atomic_get_new_crtc_state(state, encoder->crtc);
   357		struct drm_display_mode *mode = &crtc_state->mode;
   358		const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
   359	
   360		DRM_DEBUG_DRIVER("Enabling the TV Output\n");
   361	
   362		/* Enable and map the DAC to the output */
   363		regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
   364				   SUN4I_TVE_EN_DAC_MAP_MASK,
   365				   SUN4I_TVE_EN_DAC_MAP(0, 1) |
   366				   SUN4I_TVE_EN_DAC_MAP(1, 2) |
   367				   SUN4I_TVE_EN_DAC_MAP(2, 3) |
   368				   SUN4I_TVE_EN_DAC_MAP(3, 4));
   369	
   370		/* Set PAL settings */
   371		regmap_write(tv->regs, SUN4I_TVE_CFG0_REG,
   372			     tv_mode->mode |
   373			     (tv_mode->yc_en ? SUN4I_TVE_CFG0_YC_EN : 0) |
   374			     SUN4I_TVE_CFG0_COMP_EN |
   375			     SUN4I_TVE_CFG0_DAC_CONTROL_54M |
   376			     SUN4I_TVE_CFG0_CORE_DATAPATH_54M |
   377			     SUN4I_TVE_CFG0_CORE_CONTROL_54M);
   378	
   379		/* Configure the DAC for a composite output */
   380		regmap_write(tv->regs, SUN4I_TVE_DAC0_REG,
   381			     SUN4I_TVE_DAC0_DAC_EN(0) |
   382			     (tv_mode->dac3_en ? SUN4I_TVE_DAC0_DAC_EN(3) : 0) |
   383			     SUN4I_TVE_DAC0_INTERNAL_DAC_37_5_OHMS |
   384			     SUN4I_TVE_DAC0_CHROMA_0_75 |
   385			     SUN4I_TVE_DAC0_LUMA_0_4 |
   386			     SUN4I_TVE_DAC0_CLOCK_INVERT |
   387			     (tv_mode->dac_bit25_en ? BIT(25) : 0) |
   388			     BIT(30));
   389	
   390		/* Configure the sample delay between DAC0 and the other DAC */
   391		regmap_write(tv->regs, SUN4I_TVE_NOTCH_REG,
   392			     SUN4I_TVE_NOTCH_DAC0_TO_DAC_DLY(1, 0) |
   393			     SUN4I_TVE_NOTCH_DAC0_TO_DAC_DLY(2, 0));
   394	
   395		regmap_write(tv->regs, SUN4I_TVE_CHROMA_FREQ_REG,
   396			     tv_mode->chroma_freq);
   397	
   398		/* Set the front and back porch */
   399		regmap_write(tv->regs, SUN4I_TVE_PORCH_REG,
   400			     SUN4I_TVE_PORCH_BACK(tv_mode->back_porch) |
   401			     SUN4I_TVE_PORCH_FRONT(tv_mode->front_porch));
   402	
   403		/* Set the lines setup */
   404		regmap_write(tv->regs, SUN4I_TVE_LINE_REG,
   405			     SUN4I_TVE_LINE_FIRST(22) |
   406			     SUN4I_TVE_LINE_NUMBER(tv_mode->line_number));
   407	
   408		regmap_write(tv->regs, SUN4I_TVE_LEVEL_REG,
   409			     SUN4I_TVE_LEVEL_BLANK(tv_mode->video_levels->blank) |
   410			     SUN4I_TVE_LEVEL_BLACK(tv_mode->video_levels->black));
   411	
   412		regmap_write(tv->regs, SUN4I_TVE_DAC1_REG,
   413			     SUN4I_TVE_DAC1_AMPLITUDE(0, 0x18) |
   414			     SUN4I_TVE_DAC1_AMPLITUDE(1, 0x18) |
   415			     SUN4I_TVE_DAC1_AMPLITUDE(2, 0x18) |
   416			     SUN4I_TVE_DAC1_AMPLITUDE(3, 0x18));
   417	
   418		regmap_write(tv->regs, SUN4I_TVE_CB_CR_LVL_REG,
   419			     SUN4I_TVE_CB_CR_LVL_CB_BURST(tv_mode->burst_levels->cb) |
   420			     SUN4I_TVE_CB_CR_LVL_CR_BURST(tv_mode->burst_levels->cr));
   421	
   422		/* Set burst width for a composite output */
   423		regmap_write(tv->regs, SUN4I_TVE_BURST_WIDTH_REG,
   424			     SUN4I_TVE_BURST_WIDTH_HSYNC_WIDTH(126) |
   425			     SUN4I_TVE_BURST_WIDTH_BURST_WIDTH(68) |
   426			     SUN4I_TVE_BURST_WIDTH_BREEZEWAY(22));
   427	
   428		regmap_write(tv->regs, SUN4I_TVE_CB_CR_GAIN_REG,
   429			     SUN4I_TVE_CB_CR_GAIN_CB(tv_mode->color_gains->cb) |
   430			     SUN4I_TVE_CB_CR_GAIN_CR(tv_mode->color_gains->cr));
   431	
   432		regmap_write(tv->regs, SUN4I_TVE_SYNC_VBI_REG,
   433			     SUN4I_TVE_SYNC_VBI_SYNC(0x10) |
   434			     SUN4I_TVE_SYNC_VBI_VBLANK(tv_mode->vblank_level));
   435	
   436		regmap_write(tv->regs, SUN4I_TVE_ACTIVE_LINE_REG,
   437			     SUN4I_TVE_ACTIVE_LINE(1440));
   438	
   439		/* Set composite chroma gain to 50 % */
   440		regmap_write(tv->regs, SUN4I_TVE_CHROMA_REG,
   441			     SUN4I_TVE_CHROMA_COMP_GAIN_50);
   442	
   443		regmap_write(tv->regs, SUN4I_TVE_12C_REG,
   444			     SUN4I_TVE_12C_COMP_YUV_EN |
   445			     SUN4I_TVE_12C_NOTCH_WIDTH_WIDE);
   446	
   447		regmap_write(tv->regs, SUN4I_TVE_RESYNC_REG,
   448			     SUN4I_TVE_RESYNC_PIXEL(tv_mode->resync_params->pixel) |
   449			     SUN4I_TVE_RESYNC_LINE(tv_mode->resync_params->line) |
   450			     (tv_mode->resync_params->field ?
   451			      SUN4I_TVE_RESYNC_FIELD : 0));
   452	
   453		regmap_write(tv->regs, SUN4I_TVE_SLAVE_REG, 0);
   454	
   455		sunxi_engine_apply_color_correction(crtc->engine);
   456	
   457		regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
   458				   SUN4I_TVE_EN_ENABLE,
   459				   SUN4I_TVE_EN_ENABLE);
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
