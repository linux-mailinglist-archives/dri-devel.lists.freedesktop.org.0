Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1B87EB88
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07210F8B1;
	Mon, 18 Mar 2024 15:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxMznN3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BC210F87B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710774011; x=1742310011;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=PC104PBOwXuviVlws1W/LwILT5gKE6sViJcHCXyEwlw=;
 b=fxMznN3zDvmtbzp3Rh+vtl3M5TE+tQkJR0W+2wV0E+iN8Z+ndca5LtAx
 gtdJcrkbkxDoS0S7wH2IbgBpYOUVbydJ95LKUhVxspbtixahS2nWZ7xEr
 LNhfi4MFTnkrzhXxmpMzCoyEAdsQwpnFBTtj3SiZCppIRyvgZSJcogCSA
 bdjH/9RMDP8xYLqOQ9w2cqGidZ/mKHDjS3mxDeAJ1fBaqwhIbGgi0A2z5
 MSCnDhxLcJl9EmbOZyHefdIWfBapBRFrEBEun82FXU8Kl7ns41AKEM5lA
 FgCeaOFb8XABf8+tHSJ4eD5Ob933U3tS0lx1BGvcOKlnIgW60a9Asxm7g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5527366"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5527366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="36619807"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2024 08:00:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rmET4-000H25-2E;
 Mon, 18 Mar 2024 15:00:02 +0000
Date: Mon, 18 Mar 2024 22:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: [drm-misc:for-linux-next-fixes 1/1] ld.lld: error: undefined symbol:
 __drm_dev_dbg
Message-ID: <202403182236.BEDkBjub-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   e3f18b0dd1db242791afbc3bd173026163ce0ccc
commit: e3f18b0dd1db242791afbc3bd173026163ce0ccc [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240318/202403182236.BEDkBjub-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403182236.BEDkBjub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403182236.BEDkBjub-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __drm_dev_dbg
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced 52 more times
--
>> ld.lld: error: undefined symbol: drm_dev_has_vblank
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
   >>> referenced by drm_atomic_state_helper.c
   >>>               drivers/gpu/drm/drm_atomic_state_helper.o:(__drm_atomic_helper_crtc_reset) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_atomic_set_crtc_for_connector
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_disable_all) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_set_mode_prop_for_crtc
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_disable_all) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_connector_list_iter_end
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_duplicate_state) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_duplicate_state) in archive vmlinux.a
   >>> referenced 25 more times
--
>> ld.lld: error: undefined symbol: drm_mode_copy
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(mode_fixup) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: drm_atomic_bridge_chain_check
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(mode_fixup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mode_get_hv_timing
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_plane_state) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_normalize_zpos
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_calc_timestamping_constants
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_calc_timestamping_constants) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_bridge_chain_post_disable
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
   Selected by [y]:
   - DRM_PANEL_BRIDGE [=y] && HAS_IOMEM [=y] && DRM_BRIDGE [=y]
   Selected by [m]:
   - DRM [=m] && HAS_IOMEM [=y] && (AGP [=n] || AGP [=n]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && DRM_FBDEV_EMULATION [=y]
   - DRM_RADEON [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n])
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
   - DRM_SUN4I [=m] && HAS_IOMEM [=y] && DRM [=m] && COMMON_CLK [=y] && (ARCH_SUNXI [=y] || COMPILE_TEST [=n])
   - DRM_VIRTIO_GPU [=m] && HAS_IOMEM [=y] && DRM [=m] && VIRTIO_MENU [=y] && MMU [=y]
   - DRM_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
