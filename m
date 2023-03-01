Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6746A6D09
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2840910E247;
	Wed,  1 Mar 2023 13:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBD010E247
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677677437; x=1709213437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NmxyP4356gq5Xno/7bpT+rSOql6hU9mFKRogJkOZLYk=;
 b=ftKKIhf9jQAZH8wcQ16SkAz5DXPAbp8pVY633gJo/AWIRA1zgVNr7dxk
 4jcMFncr++5NzlMdFPdel2lQR/Jo0kqpPT+8PVGukQICAgRniEcjHKCNT
 EL5+e67ZftFnroyXyRmDboS7oMiE316VzR0aVUyIPKogwl/5z9TDIXMdC
 TYTFfSNnwx71ESSfB9+Uu7hCwURUlMpfnoNUswe2W1PdKaR1llen3eBcx
 oNGUf8UY0ruvCG4wLeqEBrgNy8YjNVrpbak/a9fuvsy/bcLxRC7/NbHek
 H3BkbPwT8zTKEf29SgeuaHfhxT3FTEqHldXK2dfpJ1OhQrIUbDLm+n1PG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333133499"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333133499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="667868810"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="667868810"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 01 Mar 2023 05:30:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pXMXC-0006Aj-0y;
 Wed, 01 Mar 2023 13:30:18 +0000
Date: Wed, 1 Mar 2023 21:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: suijingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v6 1/2] drm: add kms driver for loongson display controller
Message-ID: <202303012148.S6ymQNI9-lkp@intel.com>
References: <20230301072306.572685-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301072306.572685-1-15330273260@189.cn>
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi suijingfeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/suijingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230301-153240
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230301072306.572685-1-15330273260%40189.cn
patch subject: [PATCH v6 1/2] drm: add kms driver for loongson display controller
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303012148.S6ymQNI9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/125bbfe8c188e62159ecd4d143246d36b1801f79
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review suijingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230301-153240
        git checkout 125bbfe8c188e62159ecd4d143246d36b1801f79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012148.S6ymQNI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/loongson/lsdc_plane.c: In function 'lsdc_update_primary_plane':
>> drivers/gpu/drm/loongson/lsdc_plane.c:95:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      95 |         if (IS_ERR((void *)bo_offset)) {
         |                    ^
--
   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/drm/drm_device.h:5,
                    from include/drm/drm_drv.h:35,
                    from drivers/gpu/drm/loongson/lsdc_ttm.c:3:
   drivers/gpu/drm/loongson/lsdc_ttm.c: In function 'lsdc_dumb_create':
>> drivers/gpu/drm/loongson/lsdc_ttm.c:378:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                   |
         |                                                   size_t {aka unsigned int}
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/drm/drm_print.h:413:9: note: in expansion of macro '_dynamic_func_call_cls'
     413 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:492:9: note: in expansion of macro 'drm_dev_dbg'
     492 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/drm/drm_print.h:510:33: note: in expansion of macro 'drm_dbg_driver'
     510 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_ttm.c:378:9: note: in expansion of macro 'drm_dbg'
     378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
         |         ^~~~~~~
   drivers/gpu/drm/loongson/lsdc_ttm.c:378:33: note: format string is defined here
     378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
         |                               ~~^
         |                                 |
         |                                 long unsigned int
         |                               %u


vim +95 drivers/gpu/drm/loongson/lsdc_plane.c

    77	
    78	static void lsdc_update_primary_plane(struct drm_plane *plane,
    79					      struct drm_atomic_state *state)
    80	{
    81		struct drm_device *ddev = plane->dev;
    82		struct lsdc_device *ldev = to_lsdc(ddev);
    83		struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
    84		struct drm_crtc *crtc = new_plane_state->crtc;
    85		struct drm_framebuffer *fb = new_plane_state->fb;
    86		struct ttm_buffer_object *tbo = to_ttm_bo(fb->obj[0]);
    87		unsigned int pipe = drm_crtc_index(crtc);
    88		unsigned int fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
    89		u64 bo_offset = lsdc_bo_gpu_offset(tbo);
    90		u64 fb_addr = ldev->vram_base + bo_offset + fb_offset;
    91		u32 stride = fb->pitches[0];
    92		u32 cfg;
    93		u32 lo, hi;
    94	
  > 95		if (IS_ERR((void *)bo_offset)) {
    96			drm_warn(ddev, "bo not pinned, should not happen\n");
    97			return;
    98		}
    99	
   100		/* 40-bit width physical address bus */
   101		lo = fb_addr & 0xFFFFFFFF;
   102		hi = (fb_addr >> 32) & 0xFF;
   103	
   104		cfg = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, pipe);
   105		if (cfg & CFG_FB_IN_USING) {
   106			drm_dbg(ddev, "CRTC-%u(FB1) is in using\n", pipe);
   107			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG, pipe, lo);
   108			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG, pipe, hi);
   109		} else {
   110			drm_dbg(ddev, "CRTC-%u(FB0) is in using\n", pipe);
   111			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG, pipe, lo);
   112			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG, pipe, hi);
   113		}
   114	
   115		drm_dbg(ddev, "CRTC-%u scanout from 0x%llx\n", pipe, fb_addr);
   116	
   117		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, pipe, stride);
   118	
   119		cfg &= ~CFG_PIX_FMT_MASK;
   120		cfg |= LSDC_PF_XRGB8888;
   121	
   122		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, pipe, cfg);
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
