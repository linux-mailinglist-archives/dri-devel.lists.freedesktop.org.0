Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D94556DC6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 23:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DBE10E8AB;
	Wed, 22 Jun 2022 21:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F91A10E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655932924; x=1687468924;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IbJqKgVzWt0o5Y3O9M+5SCg2XTHUXnehLhnQxYd9qVY=;
 b=nDlbAvcVcWyPyN6AcghktteMJEi72EDMT4gga/f791rmoEAZqnpJ6xtg
 Qq0TnDkbtE2HSFTNibrafXTSRbGaoyOJG6owUAVOtYcBFWm84MrJnMdXJ
 +9VSYOLvobSyVhrZzV6cRVkA9WyGnjcfsef7RLno+xVpEwya8sbhpMwee
 xORiExj+ZA4XkkRj36yB13qHzwa6wrYUnnUNxNX79d4dZ+dJeUzBoyNkz
 oPWNO0OPcYB/1uQdXbsoZdQgmBnz3bZn8jgbAhlHgqDsYitfg6UbrkzxS
 MEfPGLmJ5eIs8NSdZgAO7/QcssuQzHOcDdtzViQdHDyOeIwxy19bGnLKb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260983770"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260983770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 14:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="563184359"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2022 14:22:02 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o47nV-0001hf-VJ;
 Wed, 22 Jun 2022 21:22:01 +0000
Date: Thu, 23 Jun 2022 05:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [drm-misc:drm-misc-next 2/4]
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of
 undefined type 'struct drm_framebuffer'
Message-ID: <202206230540.nPlOQSBG-lkp@intel.com>
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
head:   009a3a52791f31c57d755a73f6bc66fbdd8bd76c
commit: 720cf96d8fecde29b72e1101f8a567a0ce99594f [2/4] drm: Drop drm_framebuffer.h from drm_crtc.h
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220623/202206230540.nPlOQSBG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 720cf96d8fecde29b72e1101f8a567a0ce99594f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the drm-misc/drm-misc-next HEAD 009a3a52791f31c57d755a73f6bc66fbdd8bd76c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:7,
                    from include/linux/hyperv.h:17,
                    from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_rect':
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                                ^~
   include/linux/container_of.h:18:33: note: in definition of macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of macro 'to_hv'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                        ^~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/hyperv.h:17,
                    from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                                ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'container_of'
      40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, dev)
         |                     ^~~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of macro 'to_hv'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                        ^~~~~
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                                ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'container_of'
      40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, dev)
         |                     ^~~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of macro 'to_hv'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                        ^~~~~
   include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
     293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'container_of'
      40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, dev)
         |                     ^~~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of macro 'to_hv'
      25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
         |                                        ^~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:33:37: error: invalid use of undefined type 'struct drm_framebuffer'
      33 |         dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
         |                                     ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:33:53: error: invalid use of undefined type 'struct drm_framebuffer'
      33 |         dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
         |                                                     ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:34:35: error: invalid use of undefined type 'struct drm_framebuffer'
      34 |         drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
         |                                   ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_fullscreen':
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:46:25: error: invalid use of undefined type 'struct drm_framebuffer'
      46 |                 .x2 = fb->width,
         |                         ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:48:25: error: invalid use of undefined type 'struct drm_framebuffer'
      48 |                 .y2 = fb->height,
         |                         ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_get_modes':
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:58:17: error: implicit declaration of function 'drm_add_modes_noedid' [-Werror=implicit-function-declaration]
      58 |         count = drm_add_modes_noedid(connector,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:61:9: error: implicit declaration of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'? [-Werror=implicit-function-declaration]
      61 |         drm_set_preferred_mode(connector, hv->preferred_width,
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         drm_mm_reserve_node
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_check_size':
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:93:27: error: invalid use of undefined type 'struct drm_framebuffer'
      93 |                 pitch = fb->pitches[0];
         |                           ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_pipe_enable':
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:112:48: error: invalid use of undefined type 'struct drm_framebuffer'
     112 |                                 plane_state->fb->pitches[0]);
         |                                                ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_pipe_check':
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:123:15: error: invalid use of undefined type 'struct drm_framebuffer'
     123 |         if (fb->format->format != DRM_FORMAT_XRGB8888)
         |               ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:126:15: error: invalid use of undefined type 'struct drm_framebuffer'
     126 |         if (fb->pitches[0] * fb->height > hv->fb_size) {
         |               ^~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:126:32: error: invalid use of undefined type 'struct drm_framebuffer'
     126 |         if (fb->pitches[0] * fb->height > hv->fb_size) {
         |                                ^~
   In file included from include/linux/device.h:15,
                    from include/linux/hyperv.h:23,
                    from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:128:42: error: invalid use of undefined type 'struct drm_framebuffer'
     128 |                         current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
         |                                          ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
     425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
     438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:17: note: in expansion of macro 'drm_err'
     127 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
         |                 ^~~~~~~
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:128:53: error: invalid use of undefined type 'struct drm_framebuffer'
     128 |                         current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
         |                                                     ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \


vim +25 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c

76c56a5affeba1 Deepak Rawat      2021-05-27  @6  #include <linux/hyperv.h>
76c56a5affeba1 Deepak Rawat      2021-05-27   7  
76c56a5affeba1 Deepak Rawat      2021-05-27   8  #include <drm/drm_damage_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27   9  #include <drm/drm_drv.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  10  #include <drm/drm_fb_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  11  #include <drm/drm_format_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  12  #include <drm/drm_fourcc.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  13  #include <drm/drm_gem_atomic_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  14  #include <drm/drm_gem_framebuffer_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  15  #include <drm/drm_gem_shmem_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  16  #include <drm/drm_probe_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  17  #include <drm/drm_simple_kms_helper.h>
76c56a5affeba1 Deepak Rawat      2021-05-27  18  
76c56a5affeba1 Deepak Rawat      2021-05-27  19  #include "hyperv_drm.h"
76c56a5affeba1 Deepak Rawat      2021-05-27  20  
76c56a5affeba1 Deepak Rawat      2021-05-27  21  static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
7938f4218168ae Lucas De Marchi   2022-02-04  22  				    const struct iosys_map *map,
76c56a5affeba1 Deepak Rawat      2021-05-27  23  				    struct drm_rect *rect)
76c56a5affeba1 Deepak Rawat      2021-05-27  24  {
76c56a5affeba1 Deepak Rawat      2021-05-27 @25  	struct hyperv_drm_device *hv = to_hv(fb->dev);
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  26  	void __iomem *dst = hv->vram;
76c56a5affeba1 Deepak Rawat      2021-05-27  27  	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
76c56a5affeba1 Deepak Rawat      2021-05-27  28  	int idx;
76c56a5affeba1 Deepak Rawat      2021-05-27  29  
76c56a5affeba1 Deepak Rawat      2021-05-27  30  	if (!drm_dev_enter(&hv->dev, &idx))
76c56a5affeba1 Deepak Rawat      2021-05-27  31  		return -ENODEV;
76c56a5affeba1 Deepak Rawat      2021-05-27  32  
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  33  	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  34  	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  35  
76c56a5affeba1 Deepak Rawat      2021-05-27  36  	drm_dev_exit(idx);
76c56a5affeba1 Deepak Rawat      2021-05-27  37  
76c56a5affeba1 Deepak Rawat      2021-05-27  38  	return 0;
76c56a5affeba1 Deepak Rawat      2021-05-27  39  }
76c56a5affeba1 Deepak Rawat      2021-05-27  40  

:::::: The code at line 25 was first introduced by commit
:::::: 76c56a5affeba1e163b66b9d8cc192e6154466f0 drm/hyperv: Add DRM driver for hyperv synthetic video device

:::::: TO: Deepak Rawat <drawat.floss@gmail.com>
:::::: CC: Deepak Rawat <drawat.floss@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
