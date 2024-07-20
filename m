Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4379381B2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 16:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0FA89F71;
	Sat, 20 Jul 2024 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE5xlYDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343DF89F71
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721486043; x=1753022043;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=x1mgbUvhS13gqA1gbQuGo62h+Gzyk9liWAXvvMkA6Dk=;
 b=jE5xlYDmosqv9CDq5KSrUvBmM+EvS0npfeeSniLC0IeqaOVCPOnx5GhY
 EBlla40OlEqjMdJAtDjiQFVYAlBu7UBaSjjIWzANCK8hsFeyU79TRGEIz
 4mFp+ue69US9TtcexfSt8x+qiVOWJThXtWiaxu2U+YcT3SYHxpPDLPLnv
 CCDTAHtl0xSm67UxXCWiXDRNzyJTvxbZOyEqKcr5Fa3QwGjum+Cypx5aO
 JExjURO2kpErJcs5K6OllIQU7usT/1Cvtz53GTpfzdL9Gq8IwFg5sV05X
 XEb/qshdq4F/z6X6BPNVbEOo9BrWjPhsX+gtlWY3Pg35jeHPzqgK9O3iX g==;
X-CSE-ConnectionGUID: cHe6lS+DRMmHOp8auz5u5A==
X-CSE-MsgGUID: DXevWl4zTMOyn7dQafFiFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29718842"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="29718842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:34:03 -0700
X-CSE-ConnectionGUID: 8NGgZw0LTFq2M3cBnztNfA==
X-CSE-MsgGUID: eeBjigpwS7WC1az7H8npBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="56242719"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2024 07:34:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sVB9q-000jHK-1X;
 Sat, 20 Jul 2024 14:33:58 +0000
Date: Sat, 20 Jul 2024 22:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 1/4] drm_atomic_uapi.c:(.text+0x1e40):
 multiple definition of `drm_panic_is_enabled';
 drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
Message-ID: <202407202247.ROkHkQ18-lkp@intel.com>
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
commit: 9f774c42a908affba615bbed7463dd4f904dd5f1 [1/4] drm/panic: Add drm_panic_is_enabled()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240720/202407202247.ROkHkQ18-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202247.ROkHkQ18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202247.ROkHkQ18-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 7e33fc2ff6754b5ff39b11297f713cd0841d9962 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_atomic_uapi.o: in function `drm_panic_is_enabled':
>> drm_atomic_uapi.c:(.text+0x1e40): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_blend.o: in function `drm_panic_is_enabled':
   drm_blend.c:(.text+0x6c0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_bridge.o: in function `drm_panic_is_enabled':
   drm_bridge.c:(.text+0x1160): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_client.o: in function `drm_panic_is_enabled':
   drm_client.c:(.text+0xae0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_panic_is_enabled':
   drm_client_modeset.c:(.text+0x2550): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_color_mgmt.o: in function `drm_panic_is_enabled':
   drm_color_mgmt.c:(.text+0x6e0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_connector.o: in function `drm_panic_is_enabled':
   drm_connector.c:(.text+0x2800): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_crtc.o: in function `drm_panic_is_enabled':
   drm_crtc.c:(.text+0xa80): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_displayid.o: in function `drm_panic_is_enabled':
   drm_displayid.c:(.text+0x10): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_drv.o: in function `drm_panic_is_enabled':
   drm_drv.c:(.text+0xfe0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_dumb_buffers.o: in function `drm_panic_is_enabled':
   drm_dumb_buffers.c:(.text+0x10): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_edid.o: in function `drm_panic_is_enabled':
   drm_edid.c:(.text+0x7d80): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_eld.o: in function `drm_panic_is_enabled':
   drm_eld.c:(.text+0xd0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_encoder.o: in function `drm_panic_is_enabled':
   drm_encoder.c:(.text+0x4d0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_file.o: in function `drm_panic_is_enabled':
   drm_file.c:(.text+0xb30): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_framebuffer.o: in function `drm_panic_is_enabled':
   drm_framebuffer.c:(.text+0xdc0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_ioctl.o: in function `drm_panic_is_enabled':
   drm_ioctl.c:(.text+0xe20): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_lease.o: in function `drm_panic_is_enabled':
   drm_lease.c:(.text+0x720): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_mode_config.o: in function `drm_panic_is_enabled':
   drm_mode_config.c:(.text+0xc30): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_mode_object.o: in function `drm_panic_is_enabled':
   drm_mode_object.c:(.text+0x3a0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_modes.o: in function `drm_panic_is_enabled':
   drm_modes.c:(.text+0x3270): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_plane.o: in function `drm_panic_is_enabled':
   drm_plane.c:(.text+0x10d0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_property.o: in function `drm_panic_is_enabled':
   drm_property.c:(.text+0xc30): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_sysfs.o: in function `drm_panic_is_enabled':
   drm_sysfs.c:(.text+0x9c0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_ioc32.o: in function `drm_panic_is_enabled':
   drm_ioc32.c:(.text+0x760): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_debugfs.o: in function `drm_panic_is_enabled':
   drm_debugfs.c:(.text+0x11d0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
   ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_panic_is_enabled':
   drm_atomic_helper.c:(.text+0x5ac0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x2ca0): first defined here
--
   In file included from drivers/gpu/drm/drm_edid.c:49:
>> drivers/gpu/drm/drm_crtc_internal.h:324:6: warning: no previous prototype for 'drm_panic_is_enabled' [-Wmissing-prototypes]
     324 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
         |      ^~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
