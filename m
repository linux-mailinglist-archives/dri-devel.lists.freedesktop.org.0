Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E25CB31E2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DD10E749;
	Wed, 10 Dec 2025 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8LYSOhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADE610E744;
 Wed, 10 Dec 2025 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376061; x=1796912061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KJ7kD7PXxYe8tjWHtWajJDK3fbizOA8VB40bkjZ2BfI=;
 b=k8LYSOhneMINQXgAJVPIgFJ0yxkXeOc2eAmmvj49k4kyCScii8u6PmWi
 6HqbeScwueveiuhtYXBq8YzKWzkc5/R1hlaVs0E6P0YG90qyrzRrgilrd
 KReD9AOkMn5gavxRO7osiA6vKK76ysW3QLXn6wDyqdQOcoqBXNCRuzM/U
 QOflIYIh/yaQlkBHUtwg0kDgB30/qQwbhumkEbV0nqIlwNyfKAvBFMjaV
 L1d4zdZGBnNJKnysMfKzRgVoKw+7EFzdv8Zh84eHGatpBu1fLMHmb4NrZ
 Wc6xvMAYrJTZyG+Jn6aHssvWFkFQVZuhaa5zll99fFEJV/ftWPFL9YRL5 A==;
X-CSE-ConnectionGUID: W2oRGlNGRoOMU2Ii5+rmCA==
X-CSE-MsgGUID: iGKqp6jRTJ2NObe3mACUtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67235010"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67235010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:14:21 -0800
X-CSE-ConnectionGUID: 3yL4uNdZQVOnO912V8BTRw==
X-CSE-MsgGUID: m+acr95gR5SjdzeqdJSzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200691829"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 10 Dec 2025 06:14:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vTKxL-000000003G5-2Afg;
 Wed, 10 Dec 2025 14:14:15 +0000
Date: Wed, 10 Dec 2025 22:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512102159.xsvvXCXy-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.18 next-20251210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-195929
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: parisc-randconfig-002-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102159.xsvvXCXy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102159.xsvvXCXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102159.xsvvXCXy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/svga.h:6,
                    from drivers/video/fbdev/arkfb.c:24:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from drivers/video/fbdev/arkfb.c:28:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   drivers/video/fbdev/arkfb.c:68:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_total_regs[]        = {{0x00, 0, 7}, {0x41, 7, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:69:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_display_regs[]      = {{0x01, 0, 7}, {0x41, 6, 6}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:70:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_blank_start_regs[]  = {{0x02, 0, 7}, {0x41, 5, 5}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:71:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_blank_end_regs[]    = {{0x03, 0, 4}, {0x05, 7, 7 }, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:72:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_sync_start_regs[]   = {{0x04, 0, 7}, {0x41, 4, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:73:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_h_sync_end_regs[]     = {{0x05, 0, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:75:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_total_regs[]        = {{0x06, 0, 7}, {0x07, 0, 0}, {0x07, 5, 5}, {0x40, 7, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:76:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_display_regs[]      = {{0x12, 0, 7}, {0x07, 1, 1}, {0x07, 6, 6}, {0x40, 6, 6}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:77:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_blank_start_regs[]  = {{0x15, 0, 7}, {0x07, 3, 3}, {0x09, 5, 5}, {0x40, 5, 5}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:79:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_blank_end_regs[]    = {{0x16, 0, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:80:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_sync_start_regs[]   = {{0x10, 0, 7}, {0x07, 2, 2}, {0x07, 7, 7}, {0x40, 4, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:81:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_v_sync_end_regs[]     = {{0x11, 0, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:83:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_line_compare_regs[]   = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:84:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_start_address_regs[]  = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x40, 0, 2}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:85:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset ark_offset_regs[]         = {{0x13, 0, 7}, {0x41, 3, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c: In function 'arkfb_tilecursor':
>> drivers/video/fbdev/arkfb.c:152:21: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     svga_tilecursor(par->state.vgabase, info, cursor);
                        ^~
   drivers/video/fbdev/arkfb.c: At top level:
   drivers/video/fbdev/arkfb.c:303:29: warning: 'struct dac_info' declared inside parameter list will not be visible outside of this definition or declaration
     int (*dac_get_mode)(struct dac_info *info);
                                ^~~~~~~~
   drivers/video/fbdev/arkfb.c:304:29: warning: 'struct dac_info' declared inside parameter list will not be visible outside of this definition or declaration
     int (*dac_set_mode)(struct dac_info *info, int mode);
                                ^~~~~~~~
   drivers/video/fbdev/arkfb.c:305:29: warning: 'struct dac_info' declared inside parameter list will not be visible outside of this definition or declaration
     int (*dac_get_freq)(struct dac_info *info, int channel);
                                ^~~~~~~~
   drivers/video/fbdev/arkfb.c:306:29: warning: 'struct dac_info' declared inside parameter list will not be visible outside of this definition or declaration
     int (*dac_set_freq)(struct dac_info *info, int channel, u32 freq);
                                ^~~~~~~~
   drivers/video/fbdev/arkfb.c:307:29: warning: 'struct dac_info' declared inside parameter list will not be visible outside of this definition or declaration
     void (*dac_release)(struct dac_info *info);
                                ^~~~~~~~
   drivers/video/fbdev/arkfb.c: In function 'dac_set_mode':
   drivers/video/fbdev/arkfb.c:339:36: error: passing argument 1 of 'info->dacops->dac_set_mode' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return info->dacops->dac_set_mode(info, mode);
                                       ^~~~
   drivers/video/fbdev/arkfb.c:339:36: note: expected 'struct dac_info *' but argument is of type 'struct dac_info *'
   drivers/video/fbdev/arkfb.c: In function 'dac_set_freq':
   drivers/video/fbdev/arkfb.c:344:36: error: passing argument 1 of 'info->dacops->dac_set_freq' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return info->dacops->dac_set_freq(info, channel, freq);
                                       ^~~~
   drivers/video/fbdev/arkfb.c:344:36: note: expected 'struct dac_info *' but argument is of type 'struct dac_info *'
   drivers/video/fbdev/arkfb.c: In function 'dac_release':
   drivers/video/fbdev/arkfb.c:349:28: error: passing argument 1 of 'info->dacops->dac_release' from incompatible pointer type [-Werror=incompatible-pointer-types]
     info->dacops->dac_release(info);
                               ^~~~
   drivers/video/fbdev/arkfb.c:349:28: note: expected 'struct dac_info *' but argument is of type 'struct dac_info *'
   drivers/video/fbdev/arkfb.c: At top level:
   drivers/video/fbdev/arkfb.c:426:18: error: initialization of 'int (*)(struct dac_info *, int)' from incompatible pointer type 'int (*)(struct dac_info *, int)' [-Werror=incompatible-pointer-types]
     .dac_set_mode = ics5342_set_mode,
                     ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:426:18: note: (near initialization for 'ics5342_ops.dac_set_mode')
   drivers/video/fbdev/arkfb.c:427:18: error: initialization of 'int (*)(struct dac_info *, int,  u32)' {aka 'int (*)(struct dac_info *, int,  unsigned int)'} from incompatible pointer type 'int (*)(struct dac_info *, int,  u32)' {aka 'int (*)(struct dac_info *, int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     .dac_set_freq = ics5342_set_freq,
                     ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:427:18: note: (near initialization for 'ics5342_ops.dac_set_freq')
   drivers/video/fbdev/arkfb.c:428:17: error: initialization of 'void (*)(struct dac_info *)' from incompatible pointer type 'void (*)(struct dac_info *)' [-Werror=incompatible-pointer-types]
     .dac_release = ics5342_release
                    ^~~~~~~~~~~~~~~
   drivers/video/fbdev/arkfb.c:428:17: note: (near initialization for 'ics5342_ops.dac_release')
   drivers/video/fbdev/arkfb.c: In function 'ark_dac_read_regs':
   drivers/video/fbdev/arkfb.c:461:23: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     regval = vga_rseq(par->state.vgabase, 0x1C);
                          ^~
   drivers/video/fbdev/arkfb.c: In function 'ark_dac_write_regs':
   drivers/video/fbdev/arkfb.c:480:23: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     regval = vga_rseq(par->state.vgabase, 0x1C);
                          ^~
   drivers/video/fbdev/arkfb.c: In function 'ark_set_pixclock':
   drivers/video/fbdev/arkfb.c:498:27: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     int rv = dac_set_freq(par->dac, 0, 1000000000 / pixclock);
                              ^~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/video/fbdev/arkfb.c:15:
   drivers/video/fbdev/arkfb.c: In function 'arkfb_open':
   drivers/video/fbdev/arkfb.c:516:18: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   drivers/video/fbdev/arkfb.c: In function 'arkfb_release':
   drivers/video/fbdev/arkfb.c:540:18: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   drivers/video/fbdev/arkfb.c: In function 'arkfb_set_par':
   drivers/video/fbdev/arkfb.c:658:20: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     svga_wcrt_mask(par->state.vgabase, 0x11, 0x00, 0x80);
                       ^~
   drivers/video/fbdev/arkfb.c: In function 'arkfb_blank':
   drivers/video/fbdev/arkfb.c:881:21: error: dereferencing pointer to incomplete type 'struct arkfb_info'
      svga_wseq_mask(par->state.vgabase, 0x01, 0x00, 0x20);
                        ^~
   drivers/video/fbdev/arkfb.c: In function 'arkfb_pan_display':
   drivers/video/fbdev/arkfb.c:920:21: error: dereferencing pointer to incomplete type 'struct arkfb_info'
     svga_wcrt_multi(par->state.vgabase, ark_start_address_regs, offset);
                        ^~
   drivers/video/fbdev/arkfb.c: In function 'ark_pci_probe':
   drivers/video/fbdev/arkfb.c:973:34: error: invalid application of 'sizeof' to incomplete type 'struct arkfb_info'
     info = framebuffer_alloc(sizeof(struct arkfb_info), &(dev->dev));
                                     ^~~~~~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
--
   In file included from include/linux/svga.h:6,
                    from drivers/video/fbdev/vt8623fb.c:24:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from drivers/video/fbdev/vt8623fb.c:28:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   drivers/video/fbdev/vt8623fb.c:66:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_total_regs[]       = {{0x00, 0, 7}, {0x36, 3, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:67:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_display_regs[]     = {{0x01, 0, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:68:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_blank_start_regs[] = {{0x02, 0, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:69:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_blank_end_regs[]   = {{0x03, 0, 4}, {0x05, 7, 7}, {0x33, 5, 5}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:70:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_sync_start_regs[]  = {{0x04, 0, 7}, {0x33, 4, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:71:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_h_sync_end_regs[]    = {{0x05, 0, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:73:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_total_regs[]       = {{0x06, 0, 7}, {0x07, 0, 0}, {0x07, 5, 5}, {0x35, 0, 0}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:74:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_display_regs[]     = {{0x12, 0, 7}, {0x07, 1, 1}, {0x07, 6, 6}, {0x35, 2, 2}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:75:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_blank_start_regs[] = {{0x15, 0, 7}, {0x07, 3, 3}, {0x09, 5, 5}, {0x35, 3, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:76:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_blank_end_regs[]   = {{0x16, 0, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:77:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_sync_start_regs[]  = {{0x10, 0, 7}, {0x07, 2, 2}, {0x07, 7, 7}, {0x35, 1, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:78:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_v_sync_end_regs[]    = {{0x11, 0, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:80:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_offset_regs[]        = {{0x13, 0, 7}, {0x35, 5, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:81:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_line_compare_regs[]  = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, {0x33, 0, 2}, {0x35, 4, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:82:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_fetch_count_regs[]   = {{0x1C, 0, 7}, {0x1D, 0, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:83:32: error: array type has incomplete element type 'struct vga_regset'
    static const struct vga_regset vt8623_start_address_regs[] = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x34, 0, 7}, {0x48, 0, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_tilecursor':
>> drivers/video/fbdev/vt8623fb.c:119:21: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     svga_tilecursor(par->state.vgabase, info, cursor);
                        ^~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623_set_pixclock':
   drivers/video/fbdev/vt8623fb.c:265:20: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     regval = vga_r(par->state.vgabase, VGA_MIS_R);
                       ^~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/video/fbdev/vt8623fb.c:16:
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_open':
   drivers/video/fbdev/vt8623fb.c:284:18: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_release':
   drivers/video/fbdev/vt8623fb.c:306:18: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_set_par':
   drivers/video/fbdev/vt8623fb.c:431:20: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     svga_wseq_mask(par->state.vgabase, 0x10, 0x01, 0x01);
                       ^~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_blank':
   drivers/video/fbdev/vt8623fb.c:593:21: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
      svga_wcrt_mask(par->state.vgabase, 0x36, 0x00, 0x30);
                        ^~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623fb_pan_display':
   drivers/video/fbdev/vt8623fb.c:639:21: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     svga_wcrt_multi(par->state.vgabase, vt8623_start_address_regs, offset);
                        ^~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623_pci_probe':
   drivers/video/fbdev/vt8623fb.c:690:34: error: invalid application of 'sizeof' to incomplete type 'struct vt8623fb_info'
     info = framebuffer_alloc(sizeof(struct vt8623fb_info), &(dev->dev));
                                     ^~~~~~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/video/fbdev/vt8623fb.c:16:
   drivers/video/fbdev/vt8623fb.c:695:17: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     mutex_init(&par->open_lock);
                    ^~
   include/linux/mutex.h:64:16: note: in definition of macro 'mutex_init'
     __mutex_init((mutex), #mutex, &__key);    \
                   ^~~~~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623_pci_remove':
   drivers/video/fbdev/vt8623fb.c:823:23: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
      arch_phys_wc_del(par->wc_cookie);
                          ^~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/video/fbdev/vt8623fb.c:16:
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623_pci_suspend':
   drivers/video/fbdev/vt8623fb.c:847:18: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   drivers/video/fbdev/vt8623fb.c: In function 'vt8623_pci_resume':
   drivers/video/fbdev/vt8623fb.c:874:18: error: dereferencing pointer to incomplete type 'struct vt8623fb_info'
     mutex_lock(&(par->open_lock));
                     ^~
   include/linux/mutex.h:168:44: note: in definition of macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
   At top level:
   drivers/video/fbdev/vt8623fb.c:83:32: warning: 'vt8623_start_address_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_start_address_regs[] = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x34, 0, 7}, {0x48, 0, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:82:32: warning: 'vt8623_fetch_count_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_fetch_count_regs[]   = {{0x1C, 0, 7}, {0x1D, 0, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:81:32: warning: 'vt8623_line_compare_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_line_compare_regs[]  = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, {0x33, 0, 2}, {0x35, 4, 4}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:80:32: warning: 'vt8623_offset_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_offset_regs[]        = {{0x13, 0, 7}, {0x35, 5, 7}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:78:32: warning: 'vt8623_v_sync_end_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_v_sync_end_regs[]    = {{0x11, 0, 3}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/vt8623fb.c:77:32: warning: 'vt8623_v_sync_start_regs' defined but not used [-Wunused-variable]
    static const struct vga_regset vt8623_v_sync_start_regs[]  = {{0x10, 0, 7}, {0x07, 2, 2}, {0x07, 7, 7}, {0x35, 1, 1}, VGA_REGSET_END};
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
..


vim +152 drivers/video/fbdev/arkfb.c

681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   82  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   83  static const struct vga_regset ark_line_compare_regs[]   = {{0x18, 0, 7}, {0x07, 4, 4}, {0x09, 6, 6}, VGA_REGSET_END};
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  @84  static const struct vga_regset ark_start_address_regs[]  = {{0x0d, 0, 7}, {0x0c, 0, 7}, {0x40, 0, 2}, VGA_REGSET_END};
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   85  static const struct vga_regset ark_offset_regs[]         = {{0x13, 0, 7}, {0x41, 3, 3}, VGA_REGSET_END};
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   86  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   87  static const struct svga_timing_regs ark_timing_regs     = {
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   88  	ark_h_total_regs, ark_h_display_regs, ark_h_blank_start_regs,
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   89  	ark_h_blank_end_regs, ark_h_sync_start_regs, ark_h_sync_end_regs,
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   90  	ark_v_total_regs, ark_v_display_regs, ark_v_blank_start_regs,
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   91  	ark_v_blank_end_regs, ark_v_sync_start_regs, ark_v_sync_end_regs,
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   92  };
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   93  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   94  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   95  /* ------------------------------------------------------------------------- */
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   96  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   97  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   98  /* Module parameters */
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09   99  
48c68c4f1b5424 drivers/video/arkfb.c Greg Kroah-Hartman 2012-12-21  100  static char *mode_option = "640x480-8@60";
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  101  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  102  MODULE_AUTHOR("(c) 2007 Ondrej Zajicek <santiago@crfreenet.org>");
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  103  MODULE_LICENSE("GPL");
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  104  MODULE_DESCRIPTION("fbdev driver for ARK 2000PV");
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  105  
1abf91729faf2f drivers/video/arkfb.c Krzysztof Helt     2008-04-28  106  module_param(mode_option, charp, 0444);
1abf91729faf2f drivers/video/arkfb.c Krzysztof Helt     2008-04-28  107  MODULE_PARM_DESC(mode_option, "Default video mode ('640x480-8@60', etc)");
1abf91729faf2f drivers/video/arkfb.c Krzysztof Helt     2008-04-28  108  module_param_named(mode, mode_option, charp, 0444);
1abf91729faf2f drivers/video/arkfb.c Krzysztof Helt     2008-04-28  109  MODULE_PARM_DESC(mode, "Default video mode ('640x480-8@60', etc) (deprecated)");
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  110  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  111  static int threshold = 4;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  112  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  113  module_param(threshold, int, 0644);
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  114  MODULE_PARM_DESC(threshold, "FIFO threshold");
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  115  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  116  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  117  /* ------------------------------------------------------------------------- */
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  118  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  119  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  120  static void arkfb_settile(struct fb_info *info, struct fb_tilemap *map)
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  121  {
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  122  	const u8 *font = map->data;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  123  	u8 __iomem *fb = (u8 __iomem *)info->screen_base;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  124  	int i, c;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  125  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  126  	if ((map->width != 8) || (map->height != 16) ||
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  127  	    (map->depth != 1) || (map->length != 256)) {
31b6780c15a4e3 drivers/video/arkfb.c Joe Perches        2013-09-19  128  		fb_err(info, "unsupported font parameters: width %d, height %d, depth %d, length %d\n",
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  129  		       map->width, map->height, map->depth, map->length);
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  130  		return;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  131  	}
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  132  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  133  	fb += 2;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  134  	for (c = 0; c < map->length; c++) {
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  135  		for (i = 0; i < map->height; i++) {
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  136  			fb_writeb(font[i], &fb[i * 4]);
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  137  			fb_writeb(font[i], &fb[i * 4 + (128 * 8)]);
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  138  		}
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  139  		fb += 128;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  140  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  141  		if ((c % 8) == 7)
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  142  			fb += 128*8;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  143  
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  144  		font += map->height;
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  145  	}
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  146  }
681e14730c73cc drivers/video/arkfb.c Ondrej Zajicek     2007-05-09  147  
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  148  static void arkfb_tilecursor(struct fb_info *info, struct fb_tilecursor *cursor)
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  149  {
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  150  	struct arkfb_info *par = info->par;
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  151  
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11 @152  	svga_tilecursor(par->state.vgabase, info, cursor);
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  153  }
55db0923884554 drivers/video/arkfb.c David Miller       2011-01-11  154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
