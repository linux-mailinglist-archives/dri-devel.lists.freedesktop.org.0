Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28169382BC
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 21:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E803F10E2B9;
	Sat, 20 Jul 2024 19:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYR/SWDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D8B10E2B9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721504870; x=1753040870;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=dU3MdKQmXUX8ZYEDKVY5SPwiWmCgrwiV7koeOrmzWws=;
 b=jYR/SWDYGI5/XlD8jTroA+1uoUxOWSrrAmaw06FSm0oUV61R0y8/4lls
 NJctgIU03MixHUcsXo8Jz7CnXAKMZjDFATfn7n36mvoHps1l4V2vASgHC
 uySyzhh73v2wC7dGWNY8tPsx6qUa9aItvfRwXoQqpbPgoIoF/DEluUWUN
 QiCLcNR8wXHHedUfnEqMjfE9kFttuX13wnUKMVtlTlGAeHykZ6qKWrmCY
 U8/YPt7kvvgKTrBCAg/M+hwTZNaCzDGwjl0nLk+s1QlfdVrqdUD89fCGJ
 4XtiJ0+f3futoSPq6BFt5fV3LNN/SkZ7GfxMxHh66shyDFziwQTOHewDT Q==;
X-CSE-ConnectionGUID: J64EaDgxSbq9BpcbVmUFSQ==
X-CSE-MsgGUID: aEooSfKeThqGFeCct2KdEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18953478"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="18953478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 12:47:49 -0700
X-CSE-ConnectionGUID: fVplVZ6lRgKpGCmYWBrDKA==
X-CSE-MsgGUID: wmw+6NB5SX6HDPDMY24gdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="51341466"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2024 12:47:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sVG3W-000jai-06;
 Sat, 20 Jul 2024 19:47:46 +0000
Date: Sun, 21 Jul 2024 03:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 3/4]
 drivers/gpu/drm/drm_crtc_internal.h:324: multiple definition of
 `drm_panic_is_enabled';
 drivers/gpu/drm/drm_atomic_helper.o:drivers/gpu/drm/drm_crtc_internal.h:324:
 first defined here
Message-ID: <202407210342.prqxRmZF-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   7e33fc2ff6754b5ff39b11297f713cd0841d9962
commit: c2c2a91f3868515969a758042887fdc722216525 [3/4] drm/fb-helper: Set skip_panic if the drm driver supports drm panic
config: i386-randconfig-011-20240720 (https://download.01.org/0day-ci/archive/20240721/202407210342.prqxRmZF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210342.prqxRmZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210342.prqxRmZF-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 7e33fc2ff6754b5ff39b11297f713cd0841d9962 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_panic_is_enabled':
>> drivers/gpu/drm/drm_crtc_internal.h:324: multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic_helper.o:drivers/gpu/drm/drm_crtc_internal.h:324: first defined here


vim +324 drivers/gpu/drm/drm_crtc_internal.h

d70ca9069042c3 Jani Nikula     2024-03-08  319  
9f774c42a908af Jocelyn Falempe 2024-07-17  320  /* drm_panic.c */
9f774c42a908af Jocelyn Falempe 2024-07-17  321  #ifdef CONFIG_DRM_PANIC
9f774c42a908af Jocelyn Falempe 2024-07-17  322  bool drm_panic_is_enabled(struct drm_device *dev);
9f774c42a908af Jocelyn Falempe 2024-07-17  323  #else
9f774c42a908af Jocelyn Falempe 2024-07-17 @324  bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
9f774c42a908af Jocelyn Falempe 2024-07-17  325  #endif
9f774c42a908af Jocelyn Falempe 2024-07-17  326  

:::::: The code at line 324 was first introduced by commit
:::::: 9f774c42a908affba615bbed7463dd4f904dd5f1 drm/panic: Add drm_panic_is_enabled()

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
