Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798EBA634B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 22:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F6E10E009;
	Sat, 27 Sep 2025 20:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hG80zyK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D6D10E009
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759005663; x=1790541663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GEbJJ3qqxHy27CrTr5HO3O5vlb8HsgBH2fOVaytuVMg=;
 b=hG80zyK5XLORtcb7Oz9YVp22BstXY53I2prSFbIoBmnYOxL87A3TXbrN
 xGgxGIUHi98TauVdQkCgK5YLv7+r8rkWdiqCTadFDSU8fQkoUtlO78Paq
 ljtru+FRNy84vI6uQIBOzjLrl8hbOty5DQcPqbBxjk4Xlp/qS2JO1mUrq
 Ecc8oOUgiUs+niHgnGu0NZLPv+w81BfM6L0XXDwy+zJvGx2Pw47d0RG8h
 Gp+kty00szGFtatmnUWF5abzKXmYgj68M2QgtNIrNULDotFzNXqTXSkMt
 T7QGKfl7SMzoOCanrsKIxgNYh9/dCtpu4oMf7ce9sRKogL9zsKhS92nb2 Q==;
X-CSE-ConnectionGUID: nQN+q1BtTAKDNuiY9d1W8w==
X-CSE-MsgGUID: gPvzGbOITVKw5PN4ENjG8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71914149"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="71914149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 13:41:02 -0700
X-CSE-ConnectionGUID: oll6RGoJQj2oDNRJPiwUAg==
X-CSE-MsgGUID: E0HZ1Z3pTE64KrtVmh9U5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="201560329"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2025 13:41:00 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2biz-0007Kh-2d;
 Sat, 27 Sep 2025 20:40:57 +0000
Date: Sun, 28 Sep 2025 04:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chu Guangqing <chuguangqing@inspur.com>, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.cc, dmitry.baryshkov@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chu Guangqing <chuguangqing@inspur.com>
Subject: Re: [PATCH v5 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Message-ID: <202509280424.vdB0od7m-lkp@intel.com>
References: <20250925091715.12739-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925091715.12739-2-chuguangqing@inspur.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.17-rc7]
[cannot apply to next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chu-Guangqing/gpu-drm-add-support-for-Yhgc-ZX1000-soc-chipset/20250925-172156
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250925091715.12739-2-chuguangqing%40inspur.com
patch subject: [PATCH v5 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset
config: loongarch-randconfig-r123-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280424.vdB0od7m-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280424.vdB0od7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280424.vdB0od7m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:65:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *addr_base @@
   drivers/gpu/drm/yhgch/yhgch_drm_de.c:65:41: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/yhgch/yhgch_drm_de.c:65:41: sparse:     got void *addr_base
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:92:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr_base @@     got void [noderef] __iomem *vram_base @@
   drivers/gpu/drm/yhgch/yhgch_drm_de.c:92:41: sparse:     expected void *addr_base
   drivers/gpu/drm/yhgch/yhgch_drm_de.c:92:41: sparse:     got void [noderef] __iomem *vram_base
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:123:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/yhgch/yhgch_drm_de.c:126:9: sparse:   also defined here

vim +65 drivers/gpu/drm/yhgch/yhgch_drm_de.c

    58	
    59	static void yhgch_handle_damage(void *addr_base, struct iosys_map *src,
    60					struct drm_framebuffer *fb,
    61					struct drm_rect *clip)
    62	{
    63		struct iosys_map dst;
    64	
  > 65		iosys_map_set_vaddr_iomem(&dst, addr_base);
    66		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
    67		drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
    68	}
    69	
    70	static void yhgch_plane_atomic_update(struct drm_plane *plane,
    71					      struct drm_atomic_state *state)
    72	{
    73		struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
    74		struct drm_framebuffer *fb = plane_state->fb;
    75		struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
    76		struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
    77		struct yhgch_drm_private *priv = to_yhgch_drm_private(plane->dev);
    78		struct drm_atomic_helper_damage_iter iter;
    79		struct drm_rect damage;
    80		u32 reg;
    81		s64 gpu_addr = 0;
    82		u32 line_l;
    83	
    84		if (!plane_state->crtc || !plane_state->fb)
    85			return;
    86	
    87		if (!plane_state->visible)
    88			return;
    89	
    90		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
    91		drm_atomic_for_each_plane_damage(&iter, &damage) {
  > 92			yhgch_handle_damage(priv->vram_base, shadow_plane_state->data, fb, &damage);
    93		}
    94	
    95		fb->pitches[0] = (fb->pitches[0] + 15) & ~15;
    96	
    97		writel(gpu_addr, priv->mmio + YHGCH_CRT_FB_ADDRESS);
    98	
    99		reg = fb->width * fb->format->cpp[0];
   100	
   101		line_l = fb->pitches[0];
   102		writel(FIELD_PREP(YHGCH_CRT_FB_WIDTH_WIDTH_MASK, reg) |
   103		       FIELD_PREP(YHGCH_CRT_FB_WIDTH_OFFS_MASK, line_l),
   104		       priv->mmio + YHGCH_CRT_FB_WIDTH);
   105	
   106		/* SET PIXEL FORMAT */
   107		reg = readl(priv->mmio + YHGCH_CRT_DISP_CTL);
   108		reg &= ~YHGCH_CRT_DISP_CTL_FORMAT_MASK;
   109		reg |= FIELD_PREP(YHGCH_CRT_DISP_CTL_FORMAT_MASK,
   110				   fb->format->cpp[0] * 8 / 16);
   111		writel(reg, priv->mmio + YHGCH_CRT_DISP_CTL);
   112	}
   113	
   114	static const u32 channel_formats1[] = {
   115		DRM_FORMAT_RGB565, DRM_FORMAT_RGB888,
   116		DRM_FORMAT_XRGB8888,
   117	};
   118	
   119	static struct drm_plane_funcs yhgch_plane_funcs = {
   120		.update_plane = drm_atomic_helper_update_plane,
   121		.disable_plane = drm_atomic_helper_disable_plane,
   122		.destroy = drm_plane_cleanup,
 > 123		.reset = drm_atomic_helper_plane_reset,
   124		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
   125		.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
   126		DRM_GEM_SHADOW_PLANE_FUNCS,
   127	};
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
