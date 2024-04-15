Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754908A5E15
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 01:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C611126B5;
	Mon, 15 Apr 2024 23:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goUCVwM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C31126B5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 23:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713222877; x=1744758877;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=B0ohxadzXuYc46QiPLYinV5+kx/92YHtWDUJ2Lur2j4=;
 b=goUCVwM9s/D2SNTgUeMSvlHgkyiDVuz4Hr+p4vO446AZ8DeUHF4k9Xgd
 QJARQ+r1N3X8ClfH0wgdbsONkHrl3MHUXrrrEIZ7NYA0wLN1XPx9jplkf
 RCdqMZEhzzTbs2CxQYPaQKng8rJlMJ+aZKLkAFekp3AxnfysdXPGhqljB
 Mrb/LOjGx9z3wBYjRxC7/Q00Ax8fZZgh742EaJRopIKMlEWFyUcxxHJCH
 zwin0tzy/JDbtVDmp5+2KlblOagUGA+LrzZ+oDOMu52/5Jn1PP5KZxFVO
 62lGdn9by2A3RdNNXOmBMtu1gGCt6CSBU3CaDmvKd8rovkVWvKjsvG+47 w==;
X-CSE-ConnectionGUID: wlR/D+CFSU6+nsEc9UoCEQ==
X-CSE-MsgGUID: 8AHWghW2R6a51n8kIcQRYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8806359"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8806359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:14:37 -0700
X-CSE-ConnectionGUID: aoSUlE0dTAGqhaLfvJOHrw==
X-CSE-MsgGUID: SfUI2RBURjOBXVhcSzeofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26486337"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2024 16:13:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rwVVU-0004hs-2r;
 Mon, 15 Apr 2024 23:13:00 +0000
Date: Tue, 16 Apr 2024 07:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [drm-misc:for-linux-next 5/9]
 drivers/gpu/drm/drm_fb_dma_helper.c:164:5: warning: no previous prototype
 for function 'drm_fb_dma_get_scanout_buffer'
Message-ID: <202404160702.2kFuK6Qq-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   7b0062036c3b71b4a69e244ecf0502c06c4cf5f0
commit: 879b3b6511fe92b1b93dfc543961347289a8aeaa [5/9] drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240416/202404160702.2kFuK6Qq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160702.2kFuK6Qq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160702.2kFuK6Qq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_fb_dma_helper.c:12:
   In file included from include/drm/drm_damage_helper.h:35:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/drm_fb_dma_helper.c:164:5: warning: no previous prototype for function 'drm_fb_dma_get_scanout_buffer' [-Wmissing-prototypes]
     164 | int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
         |     ^
   drivers/gpu/drm/drm_fb_dma_helper.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
         | ^
         | static 
   2 warnings generated.
--
>> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter or struct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
>> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'


vim +/drm_fb_dma_get_scanout_buffer +164 drivers/gpu/drm/drm_fb_dma_helper.c

   152	
   153	/**
   154	 * drm_fb_dma_get_scanout_buffer - Provide a scanout buffer in case of panic
   155	 * @plane: DRM primary plane
   156	 * @drm_scanout_buffer: scanout buffer for the panic handler
   157	 * Returns: 0 or negative error code
   158	 *
   159	 * Generic get_scanout_buffer() implementation, for drivers that uses the
   160	 * drm_fb_dma_helper. It won't call vmap in the panic context, so the driver
   161	 * should make sure the primary plane is vmapped, otherwise the panic screen
   162	 * won't get displayed.
   163	 */
 > 164	int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
   165					  struct drm_scanout_buffer *sb)
 > 166	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
