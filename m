Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E9CB322C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AB110E26D;
	Wed, 10 Dec 2025 14:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXeBHnEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08410E1F4;
 Wed, 10 Dec 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376722; x=1796912722;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6zIyq8rgofQn0ebLU2yV60RpctEeHlc/GLxk+YA8EWA=;
 b=jXeBHnEZS3a6Jk897Rsmh+wFjfDrxRpMj9WJgAN9SFy5e2HqkTAx74Fl
 thqIh7BbSeYcjzJDriqOluyR5ym+e2yjHyveKH8KLvDf1qvAtbbZc5SXF
 kpkMhx3wCJ3mkZSmfhdrL5+eZhLf7nHqbu5lZjLbw1YZVNNzzs+IBHnDv
 Am7YXKAmjdoE+Pwn+nT0OUIKpE96K4oOCXwZnTKAF03ks1hGE93CTMW7Z
 M7bw/QNZ4uNvEC3RalWEcBossSBeQrmT5adc2HJfNv2qy0HtRHKJxOiUR
 Ta3z1wZd7EnHFocfaM1Q/xIPJ9Kb+Bk6Xn4g966D/UPJ/gebOu/W2VMxs A==;
X-CSE-ConnectionGUID: apFrP+6tSOKACWJb3vA82A==
X-CSE-MsgGUID: 4vafZDyLQAyo/OzfLuifug==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54893111"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="54893111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:25:22 -0800
X-CSE-ConnectionGUID: OvXahgJSSaGyUE0XKKWTaQ==
X-CSE-MsgGUID: gX/pGK64Q4mAEfZQthb5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="219863626"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 06:25:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vTL82-000000003GX-0lVV;
 Wed, 10 Dec 2025 14:25:18 +0000
Date: Wed, 10 Dec 2025 22:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512102200.KIAC3RLu-lkp@intel.com>
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
config: s390-randconfig-002-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102200.KIAC3RLu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102200.KIAC3RLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102200.KIAC3RLu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/vgastate.c:20:
   include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
     489 | ?
         | ^
   drivers/video/vgastate.c: In function 'save_vga_text':
>> drivers/video/vgastate.c:89:9: error: dereferencing pointer to incomplete type 'struct regstate'
      89 |    saved->vga_font0[i] = vga_r(fbbase, i);
         |         ^~
   drivers/video/vgastate.c: In function 'restore_vga_text':
   drivers/video/vgastate.c:175:26: error: dereferencing pointer to incomplete type 'struct regstate'
     175 |    vga_w(fbbase, i, saved->vga_font0[i]);
         |                          ^~
   drivers/video/vgastate.c: In function 'save_vga_mode':
   drivers/video/vgastate.c:232:7: error: dereferencing pointer to incomplete type 'struct regstate'
     232 |  saved->misc = vga_r(state->vgabase, VGA_MIS_R);
         |       ^~
   drivers/video/vgastate.c: In function 'restore_vga_mode':
   drivers/video/vgastate.c:263:40: error: dereferencing pointer to incomplete type 'struct regstate'
     263 |  vga_w(state->vgabase, VGA_MIS_W, saved->misc);
         |                                        ^~
   drivers/video/vgastate.c: In function 'save_vga_cmap':
   drivers/video/vgastate.c:319:8: error: dereferencing pointer to incomplete type 'struct regstate'
     319 |   saved->vga_cmap[i] = vga_r(state->vgabase, VGA_PEL_D);
         |        ^~
   drivers/video/vgastate.c: In function 'restore_vga_cmap':
   drivers/video/vgastate.c:332:41: error: dereferencing pointer to incomplete type 'struct regstate'
     332 |   vga_w(state->vgabase, VGA_PEL_D, saved->vga_cmap[i]);
         |                                         ^~
   drivers/video/vgastate.c: In function 'vga_cleanup':
   drivers/video/vgastate.c:340:14: error: dereferencing pointer to incomplete type 'struct regstate'
     340 |   vfree(saved->vga_font0);
         |              ^~
   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/video/vgastate.c:16:
   drivers/video/vgastate.c: In function 'save_vga':
   drivers/video/vgastate.c:354:25: error: invalid application of 'sizeof' to incomplete type 'struct regstate'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |                         ^~~~~~
   include/linux/alloc_tag.h:251:9: note: in definition of macro 'alloc_hooks_tag'
     251 |  typeof(_do_alloc) _res;      \
         |         ^~~~~~~~~
   include/linux/slab.h:1096:25: note: in expansion of macro 'alloc_hooks'
    1096 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   drivers/video/vgastate.c:354:10: note: in expansion of macro 'kzalloc'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |          ^~~~~~~
   drivers/video/vgastate.c:354:25: error: invalid application of 'sizeof' to incomplete type 'struct regstate'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |                         ^~~~~~
   include/linux/alloc_tag.h:255:10: note: in definition of macro 'alloc_hooks_tag'
     255 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/slab.h:1096:25: note: in expansion of macro 'alloc_hooks'
    1096 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   drivers/video/vgastate.c:354:10: note: in expansion of macro 'kzalloc'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |          ^~~~~~~
   drivers/video/vgastate.c:354:25: error: invalid application of 'sizeof' to incomplete type 'struct regstate'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |                         ^~~~~~
   include/linux/alloc_tag.h:258:10: note: in definition of macro 'alloc_hooks_tag'
     258 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/slab.h:1096:25: note: in expansion of macro 'alloc_hooks'
    1096 | #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   drivers/video/vgastate.c:354:10: note: in expansion of macro 'kzalloc'
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |          ^~~~~~~
   drivers/video/vgastate.c:354:8: warning: assignment to 'struct regstate *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     354 |  saved = kzalloc(sizeof(struct regstate), GFP_KERNEL);
         |        ^
   drivers/video/vgastate.c:362:8: error: dereferencing pointer to incomplete type 'struct regstate'
     362 |   saved->vga_cmap = vmalloc(768);
         |        ^~


vim +89 drivers/video/vgastate.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   47  
^1da177e4c3f41 Linus Torvalds 2005-04-16   48  static void save_vga_text(struct vgastate *state, void __iomem *fbbase)
^1da177e4c3f41 Linus Torvalds 2005-04-16   49  {
^1da177e4c3f41 Linus Torvalds 2005-04-16   50  	struct regstate *saved = (struct regstate *) state->vidstate;
^1da177e4c3f41 Linus Torvalds 2005-04-16   51  	int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16   52  	u8 misc, attr10, gr4, gr5, gr6, seq1, seq2, seq4;
0449359f053829 Ondrej Zajicek 2007-05-08   53  	unsigned short iobase;
^1da177e4c3f41 Linus Torvalds 2005-04-16   54  
^1da177e4c3f41 Linus Torvalds 2005-04-16   55  	/* if in graphics mode, no need to save */
0449359f053829 Ondrej Zajicek 2007-05-08   56  	misc = vga_r(state->vgabase, VGA_MIS_R);
0449359f053829 Ondrej Zajicek 2007-05-08   57  	iobase = (misc & 1) ? 0x3d0 : 0x3b0;
0449359f053829 Ondrej Zajicek 2007-05-08   58  
0449359f053829 Ondrej Zajicek 2007-05-08   59  	vga_r(state->vgabase, iobase + 0xa);
0449359f053829 Ondrej Zajicek 2007-05-08   60  	vga_w(state->vgabase, VGA_ATT_W, 0x00);
^1da177e4c3f41 Linus Torvalds 2005-04-16   61  	attr10 = vga_rattr(state->vgabase, 0x10);
0449359f053829 Ondrej Zajicek 2007-05-08   62  	vga_r(state->vgabase, iobase + 0xa);
0449359f053829 Ondrej Zajicek 2007-05-08   63  	vga_w(state->vgabase, VGA_ATT_W, 0x20);
0449359f053829 Ondrej Zajicek 2007-05-08   64  
^1da177e4c3f41 Linus Torvalds 2005-04-16   65  	if (attr10 & 1)
^1da177e4c3f41 Linus Torvalds 2005-04-16   66  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16   67  
^1da177e4c3f41 Linus Torvalds 2005-04-16   68  	/* save regs */
^1da177e4c3f41 Linus Torvalds 2005-04-16   69  	gr4 = vga_rgfx(state->vgabase, VGA_GFX_PLANE_READ);
^1da177e4c3f41 Linus Torvalds 2005-04-16   70  	gr5 = vga_rgfx(state->vgabase, VGA_GFX_MODE);
^1da177e4c3f41 Linus Torvalds 2005-04-16   71  	gr6 = vga_rgfx(state->vgabase, VGA_GFX_MISC);
^1da177e4c3f41 Linus Torvalds 2005-04-16   72  	seq2 = vga_rseq(state->vgabase, VGA_SEQ_PLANE_WRITE);
^1da177e4c3f41 Linus Torvalds 2005-04-16   73  	seq4 = vga_rseq(state->vgabase, VGA_SEQ_MEMORY_MODE);
^1da177e4c3f41 Linus Torvalds 2005-04-16   74  
^1da177e4c3f41 Linus Torvalds 2005-04-16   75  	/* blank screen */
^1da177e4c3f41 Linus Torvalds 2005-04-16   76  	seq1 = vga_rseq(state->vgabase, VGA_SEQ_CLOCK_MODE);
^1da177e4c3f41 Linus Torvalds 2005-04-16   77  	vga_wseq(state->vgabase, VGA_SEQ_RESET, 0x1);
^1da177e4c3f41 Linus Torvalds 2005-04-16   78  	vga_wseq(state->vgabase, VGA_SEQ_CLOCK_MODE, seq1 | 1 << 5);
^1da177e4c3f41 Linus Torvalds 2005-04-16   79  	vga_wseq(state->vgabase, VGA_SEQ_RESET, 0x3);
^1da177e4c3f41 Linus Torvalds 2005-04-16   80  
^1da177e4c3f41 Linus Torvalds 2005-04-16   81  	/* save font at plane 2 */
^1da177e4c3f41 Linus Torvalds 2005-04-16   82  	if (state->flags & VGA_SAVE_FONT0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16   83  		vga_wseq(state->vgabase, VGA_SEQ_PLANE_WRITE, 0x4);
^1da177e4c3f41 Linus Torvalds 2005-04-16   84  		vga_wseq(state->vgabase, VGA_SEQ_MEMORY_MODE, 0x6);
^1da177e4c3f41 Linus Torvalds 2005-04-16   85  		vga_wgfx(state->vgabase, VGA_GFX_PLANE_READ, 0x2);
^1da177e4c3f41 Linus Torvalds 2005-04-16   86  		vga_wgfx(state->vgabase, VGA_GFX_MODE, 0x0);
^1da177e4c3f41 Linus Torvalds 2005-04-16   87  		vga_wgfx(state->vgabase, VGA_GFX_MISC, 0x5);
^1da177e4c3f41 Linus Torvalds 2005-04-16   88  		for (i = 0; i < 4 * 8192; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  @89  			saved->vga_font0[i] = vga_r(fbbase, i);
^1da177e4c3f41 Linus Torvalds 2005-04-16   90  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16   91  
^1da177e4c3f41 Linus Torvalds 2005-04-16   92  	/* save font at plane 3 */
^1da177e4c3f41 Linus Torvalds 2005-04-16   93  	if (state->flags & VGA_SAVE_FONT1) {
^1da177e4c3f41 Linus Torvalds 2005-04-16   94  		vga_wseq(state->vgabase, VGA_SEQ_PLANE_WRITE, 0x8);
^1da177e4c3f41 Linus Torvalds 2005-04-16   95  		vga_wseq(state->vgabase, VGA_SEQ_MEMORY_MODE, 0x6);
^1da177e4c3f41 Linus Torvalds 2005-04-16   96  		vga_wgfx(state->vgabase, VGA_GFX_PLANE_READ, 0x3);
^1da177e4c3f41 Linus Torvalds 2005-04-16   97  		vga_wgfx(state->vgabase, VGA_GFX_MODE, 0x0);
^1da177e4c3f41 Linus Torvalds 2005-04-16   98  		vga_wgfx(state->vgabase, VGA_GFX_MISC, 0x5);
^1da177e4c3f41 Linus Torvalds 2005-04-16   99  		for (i = 0; i < state->memsize; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  100  			saved->vga_font1[i] = vga_r(fbbase, i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  101  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  102  
^1da177e4c3f41 Linus Torvalds 2005-04-16  103  	/* save font at plane 0/1 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  104  	if (state->flags & VGA_SAVE_TEXT) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  105  		vga_wseq(state->vgabase, VGA_SEQ_PLANE_WRITE, 0x1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  106  		vga_wseq(state->vgabase, VGA_SEQ_MEMORY_MODE, 0x6);
^1da177e4c3f41 Linus Torvalds 2005-04-16  107  		vga_wgfx(state->vgabase, VGA_GFX_PLANE_READ, 0x0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  		vga_wgfx(state->vgabase, VGA_GFX_MODE, 0x0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  109  		vga_wgfx(state->vgabase, VGA_GFX_MISC, 0x5);
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  		for (i = 0; i < 8192; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  			saved->vga_text[i] = vga_r(fbbase, i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  112  
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  		vga_wseq(state->vgabase, VGA_SEQ_PLANE_WRITE, 0x2);
^1da177e4c3f41 Linus Torvalds 2005-04-16  114  		vga_wseq(state->vgabase, VGA_SEQ_MEMORY_MODE, 0x6);
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  		vga_wgfx(state->vgabase, VGA_GFX_PLANE_READ, 0x1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  116  		vga_wgfx(state->vgabase, VGA_GFX_MODE, 0x0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  117  		vga_wgfx(state->vgabase, VGA_GFX_MISC, 0x5);
^1da177e4c3f41 Linus Torvalds 2005-04-16  118  		for (i = 0; i < 8192; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  			saved->vga_text[8192+i] = vga_r(fbbase + 2 * 8192, i);
^1da177e4c3f41 Linus Torvalds 2005-04-16  120  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  121  
^1da177e4c3f41 Linus Torvalds 2005-04-16  122  	/* restore regs */
^1da177e4c3f41 Linus Torvalds 2005-04-16  123  	vga_wseq(state->vgabase, VGA_SEQ_PLANE_WRITE, seq2);
^1da177e4c3f41 Linus Torvalds 2005-04-16  124  	vga_wseq(state->vgabase, VGA_SEQ_MEMORY_MODE, seq4);
^1da177e4c3f41 Linus Torvalds 2005-04-16  125  
^1da177e4c3f41 Linus Torvalds 2005-04-16  126  	vga_wgfx(state->vgabase, VGA_GFX_PLANE_READ, gr4);
^1da177e4c3f41 Linus Torvalds 2005-04-16  127  	vga_wgfx(state->vgabase, VGA_GFX_MODE, gr5);
^1da177e4c3f41 Linus Torvalds 2005-04-16  128  	vga_wgfx(state->vgabase, VGA_GFX_MISC, gr6);
^1da177e4c3f41 Linus Torvalds 2005-04-16  129  
^1da177e4c3f41 Linus Torvalds 2005-04-16  130  	/* unblank screen */
^1da177e4c3f41 Linus Torvalds 2005-04-16  131  	vga_wseq(state->vgabase, VGA_SEQ_RESET, 0x1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  132  	vga_wseq(state->vgabase, VGA_SEQ_CLOCK_MODE, seq1 & ~(1 << 5));
^1da177e4c3f41 Linus Torvalds 2005-04-16  133  	vga_wseq(state->vgabase, VGA_SEQ_RESET, 0x3);
^1da177e4c3f41 Linus Torvalds 2005-04-16  134  
^1da177e4c3f41 Linus Torvalds 2005-04-16  135  	vga_wseq(state->vgabase, VGA_SEQ_CLOCK_MODE, seq1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  136  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
