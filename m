Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A460C4B992E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788E10E91A;
	Thu, 17 Feb 2022 06:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4310E864;
 Thu, 17 Feb 2022 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645079186; x=1676615186;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Rc66vpcJbKLQOZKcEaFdcJ4BkfaF9+BdDbGF1kMAcUQ=;
 b=lmhiMBzRQflcciiK4W8y8UEC/NycbU7EjgFB276ab9af7krxaLMue+7N
 RviLuGJFNa6gxMI3kSGP24bAJfVdAKkEQkHy+POMo0Lp1VAkGaZseSnU3
 HpnseBelUewk55BXsHIvsGVQOe4Vl7grWPvf0HXWu9GivpLp+fQXI7Cgt
 N+Yg6WG04YTMnyE4V9ufJsqxxOUP5QjJJN7o+hh9n/gKltlpvtr/luYLB
 XH1s5aw9ELjVpoKuUFYhoK7U1ivc4vtSc7oZTYos04WvouVEPhAGwWC0h
 7uIut7lB+k2FBsPLWdFyn5wGzF4J47cVHgZpQTI+d6zeeeG5GFwWBmN5Z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="314074489"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="314074489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="545398810"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 16 Feb 2022 22:26:03 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKaEs-000BWZ-Gz; Thu, 17 Feb 2022 06:26:02 +0000
Date: Thu, 17 Feb 2022 14:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [drm-tip:drm-tip 4/8] drivers/gpu/drm/solomon/ssd130x.c:451:18:
 error: incomplete definition of type 'struct dma_buf_map'
Message-ID: <202202171455.bclm1YBC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   e141e36b2871c529379f7ec7d5d6ebae3137a51b
commit: 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: mips-buildonly-randconfig-r002-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171455.bclm1YBC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/solomon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/solomon/ssd130x.c:447:74: warning: declaration of 'struct dma_buf_map' will not be visible outside of this function [-Wvisibility]
   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
                                                                            ^
>> drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
           void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
                        ~~~^
   drivers/gpu/drm/solomon/ssd130x.c:447:74: note: forward declaration of 'struct dma_buf_map'
   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
                                                                            ^
>> drivers/gpu/drm/solomon/ssd130x.c:506:40: error: incompatible pointer types passing 'struct iosys_map *' to parameter of type 'const struct dma_buf_map *' [-Werror,-Wincompatible-pointer-types]
           ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:447:87: note: passing argument to parameter 'map' here
   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
                                                                                         ^
   drivers/gpu/drm/solomon/ssd130x.c:566:40: error: incompatible pointer types passing 'struct iosys_map *' to parameter of type 'const struct dma_buf_map *' [-Werror,-Wincompatible-pointer-types]
           ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:447:87: note: passing argument to parameter 'map' here
   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
                                                                                         ^
   1 warning and 3 errors generated.


vim +451 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672cf Javier Martinez Canillas 2022-02-14  446  
a61732e808672cf Javier Martinez Canillas 2022-02-14 @447  static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
a61732e808672cf Javier Martinez Canillas 2022-02-14  448  				struct drm_rect *rect)
a61732e808672cf Javier Martinez Canillas 2022-02-14  449  {
a61732e808672cf Javier Martinez Canillas 2022-02-14  450  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
a61732e808672cf Javier Martinez Canillas 2022-02-14 @451  	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
a61732e808672cf Javier Martinez Canillas 2022-02-14  452  	int ret = 0;
a61732e808672cf Javier Martinez Canillas 2022-02-14  453  	u8 *buf = NULL;
a61732e808672cf Javier Martinez Canillas 2022-02-14  454  
a61732e808672cf Javier Martinez Canillas 2022-02-14  455  	buf = kcalloc(fb->width, fb->height, GFP_KERNEL);
a61732e808672cf Javier Martinez Canillas 2022-02-14  456  	if (!buf)
a61732e808672cf Javier Martinez Canillas 2022-02-14  457  		return -ENOMEM;
a61732e808672cf Javier Martinez Canillas 2022-02-14  458  
a61732e808672cf Javier Martinez Canillas 2022-02-14  459  	drm_fb_xrgb8888_to_mono_reversed(buf, 0, vmap, fb, rect);
a61732e808672cf Javier Martinez Canillas 2022-02-14  460  
a61732e808672cf Javier Martinez Canillas 2022-02-14  461  	ssd130x_update_rect(ssd130x, buf, rect);
a61732e808672cf Javier Martinez Canillas 2022-02-14  462  
a61732e808672cf Javier Martinez Canillas 2022-02-14  463  	kfree(buf);
a61732e808672cf Javier Martinez Canillas 2022-02-14  464  
a61732e808672cf Javier Martinez Canillas 2022-02-14  465  	return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  466  }
a61732e808672cf Javier Martinez Canillas 2022-02-14  467  
a61732e808672cf Javier Martinez Canillas 2022-02-14  468  static int ssd130x_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
a61732e808672cf Javier Martinez Canillas 2022-02-14  469  					   const struct drm_display_mode *mode)
a61732e808672cf Javier Martinez Canillas 2022-02-14  470  {
a61732e808672cf Javier Martinez Canillas 2022-02-14  471  	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
a61732e808672cf Javier Martinez Canillas 2022-02-14  472  
a61732e808672cf Javier Martinez Canillas 2022-02-14  473  	if (mode->hdisplay != ssd130x->mode.hdisplay &&
a61732e808672cf Javier Martinez Canillas 2022-02-14  474  	    mode->vdisplay != ssd130x->mode.vdisplay)
a61732e808672cf Javier Martinez Canillas 2022-02-14  475  		return MODE_ONE_SIZE;
a61732e808672cf Javier Martinez Canillas 2022-02-14  476  
a61732e808672cf Javier Martinez Canillas 2022-02-14  477  	if (mode->hdisplay != ssd130x->mode.hdisplay)
a61732e808672cf Javier Martinez Canillas 2022-02-14  478  		return MODE_ONE_WIDTH;
a61732e808672cf Javier Martinez Canillas 2022-02-14  479  
a61732e808672cf Javier Martinez Canillas 2022-02-14  480  	if (mode->vdisplay != ssd130x->mode.vdisplay)
a61732e808672cf Javier Martinez Canillas 2022-02-14  481  		return MODE_ONE_HEIGHT;
a61732e808672cf Javier Martinez Canillas 2022-02-14  482  
a61732e808672cf Javier Martinez Canillas 2022-02-14  483  	return MODE_OK;
a61732e808672cf Javier Martinez Canillas 2022-02-14  484  }
a61732e808672cf Javier Martinez Canillas 2022-02-14  485  
a61732e808672cf Javier Martinez Canillas 2022-02-14  486  static void ssd130x_display_pipe_enable(struct drm_simple_display_pipe *pipe,
a61732e808672cf Javier Martinez Canillas 2022-02-14  487  					struct drm_crtc_state *crtc_state,
a61732e808672cf Javier Martinez Canillas 2022-02-14  488  					struct drm_plane_state *plane_state)
a61732e808672cf Javier Martinez Canillas 2022-02-14  489  {
a61732e808672cf Javier Martinez Canillas 2022-02-14  490  	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
a61732e808672cf Javier Martinez Canillas 2022-02-14  491  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
a61732e808672cf Javier Martinez Canillas 2022-02-14  492  	struct drm_device *drm = &ssd130x->drm;
a61732e808672cf Javier Martinez Canillas 2022-02-14  493  	int idx, ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  494  
a61732e808672cf Javier Martinez Canillas 2022-02-14  495  	ret = ssd130x_power_on(ssd130x);
a61732e808672cf Javier Martinez Canillas 2022-02-14  496  	if (ret)
a61732e808672cf Javier Martinez Canillas 2022-02-14  497  		return;
a61732e808672cf Javier Martinez Canillas 2022-02-14  498  
a61732e808672cf Javier Martinez Canillas 2022-02-14  499  	ret = ssd130x_init(ssd130x);
a61732e808672cf Javier Martinez Canillas 2022-02-14  500  	if (ret)
a61732e808672cf Javier Martinez Canillas 2022-02-14  501  		goto out_power_off;
a61732e808672cf Javier Martinez Canillas 2022-02-14  502  
a61732e808672cf Javier Martinez Canillas 2022-02-14  503  	if (!drm_dev_enter(drm, &idx))
a61732e808672cf Javier Martinez Canillas 2022-02-14  504  		goto out_power_off;
a61732e808672cf Javier Martinez Canillas 2022-02-14  505  
a61732e808672cf Javier Martinez Canillas 2022-02-14 @506  	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst);
a61732e808672cf Javier Martinez Canillas 2022-02-14  507  
a61732e808672cf Javier Martinez Canillas 2022-02-14  508  	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
a61732e808672cf Javier Martinez Canillas 2022-02-14  509  
a61732e808672cf Javier Martinez Canillas 2022-02-14  510  	backlight_enable(ssd130x->bl_dev);
a61732e808672cf Javier Martinez Canillas 2022-02-14  511  
a61732e808672cf Javier Martinez Canillas 2022-02-14  512  	drm_dev_exit(idx);
a61732e808672cf Javier Martinez Canillas 2022-02-14  513  
a61732e808672cf Javier Martinez Canillas 2022-02-14  514  	return;
a61732e808672cf Javier Martinez Canillas 2022-02-14  515  out_power_off:
a61732e808672cf Javier Martinez Canillas 2022-02-14  516  	ssd130x_power_off(ssd130x);
a61732e808672cf Javier Martinez Canillas 2022-02-14  517  }
a61732e808672cf Javier Martinez Canillas 2022-02-14  518  

:::::: The code at line 451 was first introduced by commit
:::::: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomon SSD130x OLED displays

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
