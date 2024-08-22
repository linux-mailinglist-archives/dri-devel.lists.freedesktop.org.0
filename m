Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76795B6CE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADA410EAA8;
	Thu, 22 Aug 2024 13:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jub/uZZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4C710EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724333592; x=1755869592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YOQpzuPpXnB6FLMYSxu8prpD2kqwsQoJZlJ9qa6UWSw=;
 b=Jub/uZZ1v/VXXkByls0m2YGFtB/3/W531JmadGyhLUsuo3NLcVC2IGuS
 pmOOkwUplNqWm5bdPi+VS796S4pEoWJybsUHUcXWy5RF6OMtkJXjanRVD
 K4zfDW9jXncWgildhMZ6i2D7MbtD+ZZnainOMpkOsDeAX4Tv5cHxthZ2p
 S1tYrD+g/fyAoiE1B+kqHd8N3LQ0Dy8uzIipgBDMKl+kuOMVxxDAIQRpn
 82kHEDSfmFuLPom3AxK3ixzvzukq8QnpGXlnWBE0PXHgAKJk3ZYCQi0//
 Oj8wQUQzKzsjAzUjxhllbuPYFO6Up28j5N+s/E4Fp2IMRoJE4tOlbK5KR A==;
X-CSE-ConnectionGUID: QbBwOICwTjGSCgQtttOh/Q==
X-CSE-MsgGUID: hthq0gmAT4GW5rvLJTM+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26543133"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="26543133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:33:12 -0700
X-CSE-ConnectionGUID: mZuSZ+AmQ0WSvzHpq1dwAQ==
X-CSE-MsgGUID: HcwZRDhLQf6xVVmAv3B3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84615922"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 22 Aug 2024 06:33:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sh7w2-000Cn6-2S;
 Thu, 22 Aug 2024 13:33:06 +0000
Date: Thu, 22 Aug 2024 21:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: "hongchi.peng" <hongchi.peng@siengine.com>, liviu.dudau@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hongchi.peng@siengine.com
Subject: Re: [PATCH] drm: komeda: Fix an issue related to normalized zpos
Message-ID: <202408222146.r7E6lCGh-lkp@intel.com>
References: <20240821085613.5408-1-hongchi.peng@siengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821085613.5408-1-hongchi.peng@siengine.com>
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

Hi hongchi.peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hongchi-peng/drm-komeda-Fix-an-issue-related-to-normalized-zpos/20240822-045334
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240821085613.5408-1-hongchi.peng%40siengine.com
patch subject: [PATCH] drm: komeda: Fix an issue related to normalized zpos
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408222146.r7E6lCGh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222146.r7E6lCGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222146.r7E6lCGh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/arm/display/komeda/komeda_kms.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/arm/display/komeda/komeda_kms.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/arm/display/komeda/komeda_kms.c:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/arm/display/komeda/komeda_kms.c:9:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:207:5: error: call to '__compiletime_assert_310' declared with 'error' attribute: max(slave_zpos, kcrtc_st->max_slave_zorder) signedness error
     207 |                                 max(slave_zpos, kcrtc_st->max_slave_zorder);
         |                                 ^
   include/linux/minmax.h:136:19: note: expanded from macro 'max'
     136 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:105:2: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:100:2: note: expanded from macro '__careful_cmp_once'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:79:1: note: expanded from here
      79 | __compiletime_assert_310
         | ^
   7 warnings and 1 error generated.


vim +207 drivers/gpu/drm/arm/display/komeda/komeda_kms.c

   151	
   152	static int komeda_crtc_normalize_zpos(struct drm_crtc *crtc,
   153					      struct drm_crtc_state *crtc_st)
   154	{
   155		struct drm_atomic_state *state = crtc_st->state;
   156		struct komeda_crtc *kcrtc = to_kcrtc(crtc);
   157		struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(crtc_st);
   158		struct komeda_plane_state *kplane_st;
   159		struct drm_plane_state *plane_st;
   160		struct drm_plane *plane;
   161		struct list_head zorder_list;
   162		int order = 0, slave_zpos, err;
   163	
   164		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
   165				 crtc->base.id, crtc->name);
   166	
   167		INIT_LIST_HEAD(&zorder_list);
   168	
   169		/* This loop also added all effected planes into the new state */
   170		drm_for_each_plane_mask(plane, crtc->dev, crtc_st->plane_mask) {
   171			plane_st = drm_atomic_get_plane_state(state, plane);
   172			if (IS_ERR(plane_st))
   173				return PTR_ERR(plane_st);
   174	
   175			/* Build a list by zpos increasing */
   176			err = komeda_plane_state_list_add(plane_st, &zorder_list);
   177			if (err)
   178				return err;
   179		}
   180	
   181		kcrtc_st->max_slave_zorder = 0;
   182	
   183		list_for_each_entry(kplane_st, &zorder_list, zlist_node) {
   184			plane_st = &kplane_st->base;
   185			plane = plane_st->plane;
   186	
   187			plane_st->normalized_zpos = order++;
   188			/* When layer_split has been enabled, one plane will be handled
   189			 * by two separated komeda layers (left/right), which may needs
   190			 * two zorders.
   191			 * - zorder: for left_layer for left display part.
   192			 * - zorder + 1: will be reserved for right layer.
   193			 */
   194			if (to_kplane_st(plane_st)->layer_split)
   195				order++;
   196	
   197			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] zpos:%d, normalized zpos: %d\n",
   198					 plane->base.id, plane->name,
   199					 plane_st->zpos, plane_st->normalized_zpos);
   200	
   201			/* calculate max slave zorder */
   202			if (has_bit(drm_plane_index(plane), kcrtc->slave_planes)) {
   203				slave_zpos = plane_st->normalized_zpos;
   204				if (to_kplane_st(plane_st)->layer_split)
   205					slave_zpos++;
   206				kcrtc_st->max_slave_zorder =
 > 207					max(slave_zpos, kcrtc_st->max_slave_zorder);
   208			}
   209		}
   210	
   211		crtc_st->zpos_changed = true;
   212	
   213		return 0;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
