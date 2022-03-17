Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9454DD183
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 00:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F12A10E87E;
	Thu, 17 Mar 2022 23:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206A210E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 23:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647561222; x=1679097222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mP43wm2VRzyJLi07z0WbAStVbYu097TFKkMMG6xRxBs=;
 b=lfRMJ/+s+ztxICRc5rMhJ3PueSnAuVOvoSpGcTbwCWxfpRcxpRkNo1I3
 9MRzIInN8qJsKUZm9KXURzF0K463Saz/nFZ0LvXYecZLz/xAlVwv1bVpZ
 7cvYyU4+FtAx4QTt4BakMYRkYpmu7VR4yY1nrMDkXI78HUfUe0iZxRho5
 GAvqs/n7Y7mL3JX0N6fEcGDZrhPK8jGIaWcDFOju9RHku3L6c8MNDcuZN
 npz5jx0y/u89tAtALUABSQp9M6QnZsOXSf0BqP9xd+J1QGSIazxXuXfl+
 Ap7t0/7AZCW7QyuhJlyGnb0oUBm3MLs5EfSEtXTXF/6iUfmqXAeKGHJpr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="320223490"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="320223490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 16:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="513625825"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2022 16:53:39 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUzw2-000EF5-AQ; Thu, 17 Mar 2022 23:53:38 +0000
Date: Fri, 18 Mar 2022 07:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/gma500: Move gma_intel_crtc_funcs into
 gma_display.c
Message-ID: <202203180730.btyhkeem-lkp@intel.com>
References: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 tzimmermann@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc8 next-20220317]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220318/202203180730.btyhkeem-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cdcc3ba62afbe456eb16b00d5df129abf8db5ca1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
        git checkout cdcc3ba62afbe456eb16b00d5df129abf8db5ca1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/gma500/gma_display.c:175:5: warning: no previous prototype for function 'gma_crtc_gamma_set' [-Wmissing-prototypes]
   int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
       ^
   drivers/gpu/drm/gma500/gma_display.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
   ^
   static 
>> drivers/gpu/drm/gma500/gma_display.c:322:5: warning: no previous prototype for function 'gma_crtc_cursor_set' [-Wmissing-prototypes]
   int gma_crtc_cursor_set(struct drm_crtc *crtc,
       ^
   drivers/gpu/drm/gma500/gma_display.c:322:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int gma_crtc_cursor_set(struct drm_crtc *crtc,
   ^
   static 
>> drivers/gpu/drm/gma500/gma_display.c:440:5: warning: no previous prototype for function 'gma_crtc_cursor_move' [-Wmissing-prototypes]
   int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
       ^
   drivers/gpu/drm/gma500/gma_display.c:440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
   ^
   static 
   3 warnings generated.


vim +/gma_crtc_gamma_set +175 drivers/gpu/drm/gma500/gma_display.c

2eff0b3359c097b Patrik Jakobsson  2013-07-05  174  
7ea7728387820a2 Maarten Lankhorst 2016-06-07 @175  int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
6d124ff845334bc Daniel Vetter     2017-04-03  176  		       u32 size,
6d124ff845334bc Daniel Vetter     2017-04-03  177  		       struct drm_modeset_acquire_ctx *ctx)
2eff0b3359c097b Patrik Jakobsson  2013-07-05  178  {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  179  	gma_crtc_load_lut(crtc);
7ea7728387820a2 Maarten Lankhorst 2016-06-07  180  
7ea7728387820a2 Maarten Lankhorst 2016-06-07  181  	return 0;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  182  }
2eff0b3359c097b Patrik Jakobsson  2013-07-05  183  
98daaba0a7c36dc Lee Jones         2021-01-15  184  /*
2eff0b3359c097b Patrik Jakobsson  2013-07-05  185   * Sets the power management mode of the pipe and plane.
2eff0b3359c097b Patrik Jakobsson  2013-07-05  186   *
2eff0b3359c097b Patrik Jakobsson  2013-07-05  187   * This code should probably grow support for turning the cursor off and back
2eff0b3359c097b Patrik Jakobsson  2013-07-05  188   * on appropriately at the same time as we're turning the pipe off/on.
2eff0b3359c097b Patrik Jakobsson  2013-07-05  189   */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  190  void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
2eff0b3359c097b Patrik Jakobsson  2013-07-05  191  {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  192  	struct drm_device *dev = crtc->dev;
f71635e893c3832 Thomas Zimmermann 2021-09-20  193  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
6306865daf0283d Patrik Jakobsson  2013-07-22  194  	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
6306865daf0283d Patrik Jakobsson  2013-07-22  195  	int pipe = gma_crtc->pipe;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  196  	const struct psb_offset *map = &dev_priv->regmap[pipe];
2eff0b3359c097b Patrik Jakobsson  2013-07-05  197  	u32 temp;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  198  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  199  	/* XXX: When our outputs are all unaware of DPMS modes other than off
2eff0b3359c097b Patrik Jakobsson  2013-07-05  200  	 * and on, we should map those modes to DRM_MODE_DPMS_OFF in the CRTC.
2eff0b3359c097b Patrik Jakobsson  2013-07-05  201  	 */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  202  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  203  	if (IS_CDV(dev))
75346fe9bc4c9b3 Patrik Jakobsson  2013-08-15  204  		dev_priv->ops->disable_sr(dev);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  205  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  206  	switch (mode) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  207  	case DRM_MODE_DPMS_ON:
2eff0b3359c097b Patrik Jakobsson  2013-07-05  208  	case DRM_MODE_DPMS_STANDBY:
2eff0b3359c097b Patrik Jakobsson  2013-07-05  209  	case DRM_MODE_DPMS_SUSPEND:
6306865daf0283d Patrik Jakobsson  2013-07-22  210  		if (gma_crtc->active)
2eff0b3359c097b Patrik Jakobsson  2013-07-05  211  			break;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  212  
6306865daf0283d Patrik Jakobsson  2013-07-22  213  		gma_crtc->active = true;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  214  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  215  		/* Enable the DPLL */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  216  		temp = REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  217  		if ((temp & DPLL_VCO_ENABLE) == 0) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  218  			REG_WRITE(map->dpll, temp);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  219  			REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  220  			/* Wait for the clocks to stabilize. */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  221  			udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  222  			REG_WRITE(map->dpll, temp | DPLL_VCO_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  223  			REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  224  			/* Wait for the clocks to stabilize. */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  225  			udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  226  			REG_WRITE(map->dpll, temp | DPLL_VCO_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  227  			REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  228  			/* Wait for the clocks to stabilize. */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  229  			udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  230  		}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  231  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  232  		/* Enable the plane */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  233  		temp = REG_READ(map->cntr);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  234  		if ((temp & DISPLAY_PLANE_ENABLE) == 0) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  235  			REG_WRITE(map->cntr,
2eff0b3359c097b Patrik Jakobsson  2013-07-05  236  				  temp | DISPLAY_PLANE_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  237  			/* Flush the plane changes */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  238  			REG_WRITE(map->base, REG_READ(map->base));
2eff0b3359c097b Patrik Jakobsson  2013-07-05  239  		}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  240  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  241  		udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  242  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  243  		/* Enable the pipe */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  244  		temp = REG_READ(map->conf);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  245  		if ((temp & PIPEACONF_ENABLE) == 0)
2eff0b3359c097b Patrik Jakobsson  2013-07-05  246  			REG_WRITE(map->conf, temp | PIPEACONF_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  247  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  248  		temp = REG_READ(map->status);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  249  		temp &= ~(0xFFFF);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  250  		temp |= PIPE_FIFO_UNDERRUN;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  251  		REG_WRITE(map->status, temp);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  252  		REG_READ(map->status);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  253  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  254  		gma_crtc_load_lut(crtc);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  255  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  256  		/* Give the overlay scaler a chance to enable
2eff0b3359c097b Patrik Jakobsson  2013-07-05  257  		 * if it's on this pipe */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  258  		/* psb_intel_crtc_dpms_video(crtc, true); TODO */
b20e9afb38d0b7f Paul Kocialkowski 2019-11-06  259  
b20e9afb38d0b7f Paul Kocialkowski 2019-11-06  260  		drm_crtc_vblank_on(crtc);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  261  		break;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  262  	case DRM_MODE_DPMS_OFF:
6306865daf0283d Patrik Jakobsson  2013-07-22  263  		if (!gma_crtc->active)
2eff0b3359c097b Patrik Jakobsson  2013-07-05  264  			break;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  265  
6306865daf0283d Patrik Jakobsson  2013-07-22  266  		gma_crtc->active = false;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  267  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  268  		/* Give the overlay scaler a chance to disable
2eff0b3359c097b Patrik Jakobsson  2013-07-05  269  		 * if it's on this pipe */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  270  		/* psb_intel_crtc_dpms_video(crtc, FALSE); TODO */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  271  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  272  		/* Disable the VGA plane that we never use */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  273  		REG_WRITE(VGACNTRL, VGA_DISP_DISABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  274  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  275  		/* Turn off vblank interrupts */
c02726ffea2df09 Gustavo Padovan   2016-06-07  276  		drm_crtc_vblank_off(crtc);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  277  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  278  		/* Wait for vblank for the disable to take effect */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  279  		gma_wait_for_vblank(dev);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  280  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  281  		/* Disable plane */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  282  		temp = REG_READ(map->cntr);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  283  		if ((temp & DISPLAY_PLANE_ENABLE) != 0) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  284  			REG_WRITE(map->cntr,
2eff0b3359c097b Patrik Jakobsson  2013-07-05  285  				  temp & ~DISPLAY_PLANE_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  286  			/* Flush the plane changes */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  287  			REG_WRITE(map->base, REG_READ(map->base));
2eff0b3359c097b Patrik Jakobsson  2013-07-05  288  			REG_READ(map->base);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  289  		}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  290  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  291  		/* Disable pipe */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  292  		temp = REG_READ(map->conf);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  293  		if ((temp & PIPEACONF_ENABLE) != 0) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  294  			REG_WRITE(map->conf, temp & ~PIPEACONF_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  295  			REG_READ(map->conf);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  296  		}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  297  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  298  		/* Wait for vblank for the disable to take effect. */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  299  		gma_wait_for_vblank(dev);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  300  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  301  		udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  302  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  303  		/* Disable DPLL */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  304  		temp = REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  305  		if ((temp & DPLL_VCO_ENABLE) != 0) {
2eff0b3359c097b Patrik Jakobsson  2013-07-05  306  			REG_WRITE(map->dpll, temp & ~DPLL_VCO_ENABLE);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  307  			REG_READ(map->dpll);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  308  		}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  309  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  310  		/* Wait for the clocks to turn off. */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  311  		udelay(150);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  312  		break;
2eff0b3359c097b Patrik Jakobsson  2013-07-05  313  	}
2eff0b3359c097b Patrik Jakobsson  2013-07-05  314  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  315  	if (IS_CDV(dev))
28a8194c12f8c8b Patrik Jakobsson  2013-08-14  316  		dev_priv->ops->update_wm(dev, crtc);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  317  
2eff0b3359c097b Patrik Jakobsson  2013-07-05  318  	/* Set FIFO watermarks */
2eff0b3359c097b Patrik Jakobsson  2013-07-05  319  	REG_WRITE(DSPARB, 0x3F3E);
2eff0b3359c097b Patrik Jakobsson  2013-07-05  320  }
2eff0b3359c097b Patrik Jakobsson  2013-07-05  321  
38945be630a5848 Patrik Jakobsson  2013-07-10 @322  int gma_crtc_cursor_set(struct drm_crtc *crtc,
38945be630a5848 Patrik Jakobsson  2013-07-10  323  			struct drm_file *file_priv,
38945be630a5848 Patrik Jakobsson  2013-07-10  324  			uint32_t handle,
38945be630a5848 Patrik Jakobsson  2013-07-10  325  			uint32_t width, uint32_t height)
38945be630a5848 Patrik Jakobsson  2013-07-10  326  {
38945be630a5848 Patrik Jakobsson  2013-07-10  327  	struct drm_device *dev = crtc->dev;
f71635e893c3832 Thomas Zimmermann 2021-09-20  328  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
6306865daf0283d Patrik Jakobsson  2013-07-22  329  	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
6306865daf0283d Patrik Jakobsson  2013-07-22  330  	int pipe = gma_crtc->pipe;
38945be630a5848 Patrik Jakobsson  2013-07-10  331  	uint32_t control = (pipe == 0) ? CURACNTR : CURBCNTR;
38945be630a5848 Patrik Jakobsson  2013-07-10  332  	uint32_t base = (pipe == 0) ? CURABASE : CURBBASE;
38945be630a5848 Patrik Jakobsson  2013-07-10  333  	uint32_t temp;
38945be630a5848 Patrik Jakobsson  2013-07-10  334  	size_t addr = 0;
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  335  	struct psb_gem_object *pobj;
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  336  	struct psb_gem_object *cursor_pobj = gma_crtc->cursor_pobj;
38945be630a5848 Patrik Jakobsson  2013-07-10  337  	struct drm_gem_object *obj;
8b250cd3b5da18b Ira Weiny         2022-01-23  338  	void *tmp_dst;
38945be630a5848 Patrik Jakobsson  2013-07-10  339  	int ret = 0, i, cursor_pages;
38945be630a5848 Patrik Jakobsson  2013-07-10  340  
38945be630a5848 Patrik Jakobsson  2013-07-10  341  	/* If we didn't get a handle then turn the cursor off */
38945be630a5848 Patrik Jakobsson  2013-07-10  342  	if (!handle) {
38945be630a5848 Patrik Jakobsson  2013-07-10  343  		temp = CURSOR_MODE_DISABLE;
38945be630a5848 Patrik Jakobsson  2013-07-10  344  		if (gma_power_begin(dev, false)) {
38945be630a5848 Patrik Jakobsson  2013-07-10  345  			REG_WRITE(control, temp);
38945be630a5848 Patrik Jakobsson  2013-07-10  346  			REG_WRITE(base, 0);
38945be630a5848 Patrik Jakobsson  2013-07-10  347  			gma_power_end(dev);
38945be630a5848 Patrik Jakobsson  2013-07-10  348  		}
38945be630a5848 Patrik Jakobsson  2013-07-10  349  
38945be630a5848 Patrik Jakobsson  2013-07-10  350  		/* Unpin the old GEM object */
6306865daf0283d Patrik Jakobsson  2013-07-22  351  		if (gma_crtc->cursor_obj) {
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  352  			pobj = to_psb_gem_object(gma_crtc->cursor_obj);
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  353  			psb_gem_unpin(pobj);
e19baf704a4b51b Emil Velikov      2020-05-15  354  			drm_gem_object_put(gma_crtc->cursor_obj);
6306865daf0283d Patrik Jakobsson  2013-07-22  355  			gma_crtc->cursor_obj = NULL;
38945be630a5848 Patrik Jakobsson  2013-07-10  356  		}
38945be630a5848 Patrik Jakobsson  2013-07-10  357  		return 0;
38945be630a5848 Patrik Jakobsson  2013-07-10  358  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  359  
38945be630a5848 Patrik Jakobsson  2013-07-10  360  	/* Currently we only support 64x64 cursors */
38945be630a5848 Patrik Jakobsson  2013-07-10  361  	if (width != 64 || height != 64) {
38945be630a5848 Patrik Jakobsson  2013-07-10  362  		dev_dbg(dev->dev, "We currently only support 64x64 cursors\n");
38945be630a5848 Patrik Jakobsson  2013-07-10  363  		return -EINVAL;
38945be630a5848 Patrik Jakobsson  2013-07-10  364  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  365  
a8ad0bd84f98607 Chris Wilson      2016-05-09  366  	obj = drm_gem_object_lookup(file_priv, handle);
631794b44bd3dbf Patrik Jakobsson  2014-01-08  367  	if (!obj) {
631794b44bd3dbf Patrik Jakobsson  2014-01-08  368  		ret = -ENOENT;
631794b44bd3dbf Patrik Jakobsson  2014-01-08  369  		goto unlock;
631794b44bd3dbf Patrik Jakobsson  2014-01-08  370  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  371  
38945be630a5848 Patrik Jakobsson  2013-07-10  372  	if (obj->size < width * height * 4) {
38945be630a5848 Patrik Jakobsson  2013-07-10  373  		dev_dbg(dev->dev, "Buffer is too small\n");
38945be630a5848 Patrik Jakobsson  2013-07-10  374  		ret = -ENOMEM;
38945be630a5848 Patrik Jakobsson  2013-07-10  375  		goto unref_cursor;
38945be630a5848 Patrik Jakobsson  2013-07-10  376  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  377  
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  378  	pobj = to_psb_gem_object(obj);
38945be630a5848 Patrik Jakobsson  2013-07-10  379  
38945be630a5848 Patrik Jakobsson  2013-07-10  380  	/* Pin the memory into the GTT */
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  381  	ret = psb_gem_pin(pobj);
38945be630a5848 Patrik Jakobsson  2013-07-10  382  	if (ret) {
38945be630a5848 Patrik Jakobsson  2013-07-10  383  		dev_err(dev->dev, "Can not pin down handle 0x%x\n", handle);
38945be630a5848 Patrik Jakobsson  2013-07-10  384  		goto unref_cursor;
38945be630a5848 Patrik Jakobsson  2013-07-10  385  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  386  
38945be630a5848 Patrik Jakobsson  2013-07-10  387  	if (dev_priv->ops->cursor_needs_phys) {
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  388  		if (!cursor_pobj) {
38945be630a5848 Patrik Jakobsson  2013-07-10  389  			dev_err(dev->dev, "No hardware cursor mem available");
38945be630a5848 Patrik Jakobsson  2013-07-10  390  			ret = -ENOMEM;
38945be630a5848 Patrik Jakobsson  2013-07-10  391  			goto unref_cursor;
38945be630a5848 Patrik Jakobsson  2013-07-10  392  		}
38945be630a5848 Patrik Jakobsson  2013-07-10  393  
38945be630a5848 Patrik Jakobsson  2013-07-10  394  		/* Prevent overflow */
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  395  		if (pobj->npage > 4)
38945be630a5848 Patrik Jakobsson  2013-07-10  396  			cursor_pages = 4;
38945be630a5848 Patrik Jakobsson  2013-07-10  397  		else
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  398  			cursor_pages = pobj->npage;
38945be630a5848 Patrik Jakobsson  2013-07-10  399  
38945be630a5848 Patrik Jakobsson  2013-07-10  400  		/* Copy the cursor to cursor mem */
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  401  		tmp_dst = dev_priv->vram_addr + cursor_pobj->offset;
38945be630a5848 Patrik Jakobsson  2013-07-10  402  		for (i = 0; i < cursor_pages; i++) {
8b250cd3b5da18b Ira Weiny         2022-01-23  403  			memcpy_from_page(tmp_dst, pobj->pages[i], 0, PAGE_SIZE);
38945be630a5848 Patrik Jakobsson  2013-07-10  404  			tmp_dst += PAGE_SIZE;
38945be630a5848 Patrik Jakobsson  2013-07-10  405  		}
38945be630a5848 Patrik Jakobsson  2013-07-10  406  
6306865daf0283d Patrik Jakobsson  2013-07-22  407  		addr = gma_crtc->cursor_addr;
38945be630a5848 Patrik Jakobsson  2013-07-10  408  	} else {
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  409  		addr = pobj->offset;
6306865daf0283d Patrik Jakobsson  2013-07-22  410  		gma_crtc->cursor_addr = addr;
38945be630a5848 Patrik Jakobsson  2013-07-10  411  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  412  
38945be630a5848 Patrik Jakobsson  2013-07-10  413  	temp = 0;
38945be630a5848 Patrik Jakobsson  2013-07-10  414  	/* set the pipe for the cursor */
38945be630a5848 Patrik Jakobsson  2013-07-10  415  	temp |= (pipe << 28);
38945be630a5848 Patrik Jakobsson  2013-07-10  416  	temp |= CURSOR_MODE_64_ARGB_AX | MCURSOR_GAMMA_ENABLE;
38945be630a5848 Patrik Jakobsson  2013-07-10  417  
38945be630a5848 Patrik Jakobsson  2013-07-10  418  	if (gma_power_begin(dev, false)) {
38945be630a5848 Patrik Jakobsson  2013-07-10  419  		REG_WRITE(control, temp);
38945be630a5848 Patrik Jakobsson  2013-07-10  420  		REG_WRITE(base, addr);
38945be630a5848 Patrik Jakobsson  2013-07-10  421  		gma_power_end(dev);
38945be630a5848 Patrik Jakobsson  2013-07-10  422  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  423  
38945be630a5848 Patrik Jakobsson  2013-07-10  424  	/* unpin the old bo */
6306865daf0283d Patrik Jakobsson  2013-07-22  425  	if (gma_crtc->cursor_obj) {
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  426  		pobj = to_psb_gem_object(gma_crtc->cursor_obj);
f2d061ed01b3f0e Thomas Zimmermann 2021-10-15  427  		psb_gem_unpin(pobj);
e19baf704a4b51b Emil Velikov      2020-05-15  428  		drm_gem_object_put(gma_crtc->cursor_obj);
38945be630a5848 Patrik Jakobsson  2013-07-10  429  	}
38945be630a5848 Patrik Jakobsson  2013-07-10  430  
6306865daf0283d Patrik Jakobsson  2013-07-22  431  	gma_crtc->cursor_obj = obj;
631794b44bd3dbf Patrik Jakobsson  2014-01-08  432  unlock:
38945be630a5848 Patrik Jakobsson  2013-07-10  433  	return ret;
38945be630a5848 Patrik Jakobsson  2013-07-10  434  
38945be630a5848 Patrik Jakobsson  2013-07-10  435  unref_cursor:
e19baf704a4b51b Emil Velikov      2020-05-15  436  	drm_gem_object_put(obj);
38945be630a5848 Patrik Jakobsson  2013-07-10  437  	return ret;
38945be630a5848 Patrik Jakobsson  2013-07-10  438  }
38945be630a5848 Patrik Jakobsson  2013-07-10  439  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
