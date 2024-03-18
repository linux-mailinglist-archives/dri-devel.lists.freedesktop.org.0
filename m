Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E487EB87
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C9910F8AC;
	Mon, 18 Mar 2024 15:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb6ncfWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A43910F888
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710774011; x=1742310011;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=g4vB6plgit5oFzuUgOyVSylcOYtRJgoNMUJ3K3Loe5Y=;
 b=Pb6ncfWuzJ2OD0JcpVrUqqQhAP+bypR6gBOiE+zReXOT8BY2ka4i2eGe
 vTMg94w4SHIfzszG+z7kEeGTp1kh/whOwqxur+DVNRRM7wDiU06u57O1u
 H2hmjaxXD14srcit6ripZ5x5EMwKCWTDU/2aTcI43uKW7EQQK1+e9gKE4
 FgSTaRcu2En+fxIqa1J56XKcM0iKfcCPyEvN5Soa8ZJt8plKrIpaRoBRR
 H92VEplXSGuWyO7NyxFZO0NAmvYkM+PASU1fuTdXb7Hycsqs7t1V3GW+Q
 a57ZbWQltT9/KnbbLSo5+FA09yJwJvTJbZ4NhSqu6OoDDhGldlfQBR6Tu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5527362"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5527362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="36619805"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2024 08:00:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rmET4-000H23-28;
 Mon, 18 Mar 2024 15:00:02 +0000
Date: Mon, 18 Mar 2024 22:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [drm-misc:for-linux-next-fixes 1/1] undefined reference to
 `__drm_dev_dbg'
Message-ID: <202403182243.DO4x1bo0-lkp@intel.com>
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
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240318/202403182243.DO4x1bo0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403182243.DO4x1bo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403182243.DO4x1bo0-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check_wb_connector_state':
>> (.text+0x9a4): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check_crtc_primary_plane':
   (.text+0xa48): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `update_connector_routing':
   (.text+0xadc): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0xc4c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0xcc4): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o:(.text+0xd48): more undefined references to `__drm_dev_dbg' follow
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `handle_conflicting_encoders':
>> (.text+0xf40): undefined reference to `drm_connector_list_iter_begin'
>> hppa-linux-ld: (.text+0xf58): undefined reference to `drm_connector_list_iter_next'
>> hppa-linux-ld: (.text+0xfbc): undefined reference to `drm_atomic_get_connector_state'
   hppa-linux-ld: (.text+0x1014): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0x1038): undefined reference to `drm_atomic_set_crtc_for_connector'
>> hppa-linux-ld: (.text+0x1050): undefined reference to `drm_atomic_set_mode_prop_for_crtc'
   hppa-linux-ld: (.text+0x1060): undefined reference to `drm_connector_list_iter_next'
>> hppa-linux-ld: (.text+0x1070): undefined reference to `drm_connector_list_iter_end'
   hppa-linux-ld: (.text+0x112c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x118c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `mode_valid':
>> (.text+0x1250): undefined reference to `drm_bridge_chain_mode_valid'
   hppa-linux-ld: (.text+0x1274): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x12fc): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1334): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `mode_fixup':
>> (.text+0x13c4): undefined reference to `drm_mode_copy'
>> hppa-linux-ld: (.text+0x1460): undefined reference to `drm_atomic_bridge_chain_check'
   hppa-linux-ld: (.text+0x15b0): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x15c8): undefined reference to `drm_atomic_bridge_chain_check'
   hppa-linux-ld: (.text+0x15f4): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1630): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1668): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check_modeset':
>> (.text+0x17a8): undefined reference to `drm_mode_equal'
   hppa-linux-ld: (.text+0x17d8): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x181c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1864): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0x1884): undefined reference to `drm_dev_has_vblank'
   hppa-linux-ld: (.text+0x1a08): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1ae0): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0x1aec): undefined reference to `drm_atomic_add_affected_connectors'
>> hppa-linux-ld: (.text+0x1b00): undefined reference to `drm_atomic_add_affected_planes'
>> hppa-linux-ld: (.text+0x1bdc): undefined reference to `drm_atomic_add_encoder_bridges'
   hppa-linux-ld: (.text+0x1bec): undefined reference to `drm_atomic_add_encoder_bridges'
   hppa-linux-ld: (.text+0x1c58): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1c94): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check_plane_state':
   (.text+0x1eb0): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0x1ef0): undefined reference to `drm_mode_get_hv_timing'
   hppa-linux-ld: (.text+0x1f70): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x1fc4): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_calc_timestamping_constants':
>> (.text+0x203c): undefined reference to `drm_calc_timestamping_constants'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `crtc_set_mode':
   (.text+0x2130): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x21a4): undefined reference to `__drm_dev_dbg'
>> hppa-linux-ld: (.text+0x21e0): undefined reference to `drm_bridge_chain_mode_set'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_async_check':
   (.text+0x24cc): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x251c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x2554): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x2594): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_wait_for_dependencies':
>> (.text+0x2734): undefined reference to `drm_crtc_commit_wait'
   hppa-linux-ld: (.text+0x2778): undefined reference to `drm_crtc_commit_wait'
   hppa-linux-ld: (.text+0x27bc): undefined reference to `drm_crtc_commit_wait'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_fake_vblank':
   (.text+0x28e8): undefined reference to `drm_crtc_send_vblank_event'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_commit_duplicated_state':
   (.text+0x2d60): undefined reference to `drm_atomic_commit'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `page_flip_common':
   (.text+0x2dc0): undefined reference to `drm_atomic_get_crtc_state'
   hppa-linux-ld: (.text+0x2de4): undefined reference to `drm_atomic_get_plane_state'
   hppa-linux-ld: (.text+0x2df8): undefined reference to `drm_atomic_set_crtc_for_plane'
   hppa-linux-ld: (.text+0x2e38): undefined reference to `drm_atomic_set_fb_for_plane'
   hppa-linux-ld: (.text+0x2e84): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `disable_outputs':
   (.text+0x3020): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x303c): undefined reference to `drm_atomic_bridge_chain_disable'
   hppa-linux-ld: (.text+0x3064): undefined reference to `drm_atomic_bridge_chain_post_disable'
   hppa-linux-ld: (.text+0x30b4): undefined reference to `drm_dev_has_vblank'
   hppa-linux-ld: (.text+0x30c4): undefined reference to `drm_crtc_vblank_get'
   hppa-linux-ld: (.text+0x30e0): undefined reference to `drm_crtc_vblank_put'
   hppa-linux-ld: (.text+0x315c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x3188): undefined reference to `drm_dev_has_vblank'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_wait_for_vblanks.part.0':
   (.text+0x33d8): undefined reference to `drm_crtc_vblank_get'
   hppa-linux-ld: (.text+0x3400): undefined reference to `drm_crtc_vblank_count'
   hppa-linux-ld: (.text+0x3464): undefined reference to `drm_crtc_vblank_count'
   hppa-linux-ld: (.text+0x3474): undefined reference to `drm_crtc_vblank_put'
   hppa-linux-ld: (.text+0x352c): undefined reference to `drm_crtc_vblank_count'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_prepare_planes':
   (.text+0x3838): undefined reference to `drm_writeback_prepare_job'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_commit_modeset_enables':
   (.text+0x3a38): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x3af0): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x3b0c): undefined reference to `drm_atomic_bridge_chain_pre_enable'
   hppa-linux-ld: (.text+0x3b34): undefined reference to `drm_atomic_bridge_chain_enable'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check_planes':
   (.text+0x3e0c): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x3e60): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_check':
   (.text+0x3eb4): undefined reference to `drm_atomic_normalize_zpos'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_duplicate_state':
   (.text+0x3f5c): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x3fa0): undefined reference to `drm_atomic_get_crtc_state'
   hppa-linux-ld: (.text+0x4070): undefined reference to `drm_atomic_get_plane_state'
   hppa-linux-ld: (.text+0x4090): undefined reference to `drm_connector_list_iter_begin'
   hppa-linux-ld: (.text+0x409c): undefined reference to `drm_connector_list_iter_next'
   hppa-linux-ld: (.text+0x40ac): undefined reference to `drm_atomic_get_connector_state'
   hppa-linux-ld: (.text+0x40bc): undefined reference to `drm_connector_list_iter_end'
   hppa-linux-ld: (.text+0x40d4): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: (.text+0x40fc): undefined reference to `drm_connector_list_iter_end'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `release_crtc_commit':
   (.text+0x4588): undefined reference to `__drm_crtc_commit_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_wait_for_fences':
   (.text+0x4654): undefined reference to `drm_crtc_next_vblank_start'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_commit_hw_done':
   (.text+0x4a1c): undefined reference to `__drm_crtc_commit_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_setup_commit':
   (.text+0x518c): undefined reference to `__drm_crtc_commit_free'
   hppa-linux-ld: (.text+0x5324): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x5360): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: (.text+0x53ac): undefined reference to `__drm_dev_dbg'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_page_flip':
   (.text+0x5418): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x544c): undefined reference to `drm_atomic_nonblocking_commit'
   hppa-linux-ld: (.text+0x54f4): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_set_config':
   (.text+0x5548): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x555c): undefined reference to `__drm_atomic_helper_set_config'
   hppa-linux-ld: (.text+0x5608): undefined reference to `drm_atomic_commit'
   hppa-linux-ld: (.text+0x561c): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_disable_plane':
   (.text+0x56a0): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x56b4): undefined reference to `drm_atomic_get_plane_state'
   hppa-linux-ld: (.text+0x56dc): undefined reference to `__drm_atomic_helper_disable_plane'
   hppa-linux-ld: (.text+0x5778): undefined reference to `drm_atomic_commit'
   hppa-linux-ld: (.text+0x578c): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: (.text+0x57c0): undefined reference to `__drm_atomic_helper_disable_plane'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_update_plane':
   (.text+0x584c): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x5864): undefined reference to `drm_atomic_get_plane_state'
   hppa-linux-ld: (.text+0x587c): undefined reference to `drm_atomic_set_crtc_for_plane'
   hppa-linux-ld: (.text+0x5928): undefined reference to `drm_atomic_set_fb_for_plane'
   hppa-linux-ld: (.text+0x5978): undefined reference to `drm_atomic_commit'
   hppa-linux-ld: (.text+0x598c): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_page_flip_target':
   (.text+0x5a08): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x5a58): undefined reference to `drm_atomic_nonblocking_commit'
   hppa-linux-ld: (.text+0x5b00): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_resume':
   (.text+0x5b78): undefined reference to `drm_mode_config_reset'
   hppa-linux-ld: (.text+0x5bac): undefined reference to `drm_modeset_acquire_init'
   hppa-linux-ld: (.text+0x5bbc): undefined reference to `drm_modeset_backoff'
   hppa-linux-ld: (.text+0x5bd0): undefined reference to `drm_modeset_lock_all_ctx'
   hppa-linux-ld: (.text+0x5bf8): undefined reference to `drm_modeset_drop_locks'
   hppa-linux-ld: (.text+0x5c00): undefined reference to `drm_modeset_acquire_fini'
   hppa-linux-ld: (.text+0x5ce8): undefined reference to `__drm_atomic_state_free'
   hppa-linux-ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_atomic_helper_disable_all':
   (.text+0x5d30): undefined reference to `drm_atomic_state_alloc'
   hppa-linux-ld: (.text+0x5d5c): undefined reference to `drm_atomic_set_mode_prop_for_crtc'
   hppa-linux-ld: (.text+0x5d70): undefined reference to `drm_atomic_add_affected_planes'
   hppa-linux-ld: (.text+0x5d84): undefined reference to `drm_atomic_add_affected_connectors'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
   Selected by [y]:
   - DRM_PANEL_BRIDGE [=y] && HAS_IOMEM [=y] && DRM_BRIDGE [=y]
   Selected by [m]:
   - DRM [=m] && HAS_IOMEM [=y] && (AGP [=n] || AGP [=n]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && DRM_FBDEV_EMULATION [=y]
   - DRM_RADEON [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n])
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
   - DRM_UDL [=m] && HAS_IOMEM [=y] && DRM [=m] && USB [=y] && USB_ARCH_HAS_HCD [=y] && MMU [=y]
   - DRM_MGAG200 [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
