Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF62542DE6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 12:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2A10E3C2;
	Wed,  8 Jun 2022 10:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8C10E3C2;
 Wed,  8 Jun 2022 10:34:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B13721B88;
 Wed,  8 Jun 2022 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654684489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zj5Ik1XIiJ7NHOXrsr4Hoo/pm3bT6KkHcW7aM/VpkSQ=;
 b=JkMk+uBax8NHjj3TRTUuledTJS1MuCSXq76pWgYyxx1PGivfsNRMsq0OKS1L/+HxyASVXm
 /aBqMNtsU+OUiveiPXhZvonmrnngmkvQQkp2/POPT+i0HxErik/n+uLwHUfQmEYHh6BV+9
 bPrIlMnTkSliufEPE4FrFS8n41+eOCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654684489;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zj5Ik1XIiJ7NHOXrsr4Hoo/pm3bT6KkHcW7aM/VpkSQ=;
 b=2qqIYg56wRWkvFet3TGCDiRcxae03oglVdWvVqLfX5yokCNV6EvHprt4Z0ERv8eYTCPkls
 Cx8fzPNrLqqqM9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45BF613AD9;
 Wed,  8 Jun 2022 10:34:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ec1MEEl7oGKfBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Jun 2022 10:34:49 +0000
Date: Wed, 8 Jun 2022 12:34:41 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YqBtumw05JZDEZE2@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the first PR for drm-misc-next that will go into v5.20.

Best regards
Thomas

drm-misc-next-2022-06-08:
drm-misc-next for 5.20:

UAPI Changes:

 * connector: export bpc limits in debugfs

 * dma-buf: Print buffer name in debugfs

Cross-subsystem Changes:

 * dma-buf: Improve dma-fence handling; Cleanups

 * fbdev: Device-unregistering fixes

Core Changes:

 * client: Only use driver-validated modes to avoid blank screen

 * dp-aux: Make probing more reliable; Small fixes

 * edit: CEA data-block iterators; Introduce struct drm_edid; Many cleanups

 * gem: Don't use framebuffer format's non-exising color planes

 * probe-helper: Use 640x480 as DisplayPort fallback; Refactoring

 * scheduler: Don't kill jobs in interrupt context

Driver Changes:

 * amdgpu: Use atomic fence helpers in DM; Fix VRAM address calculation;
   Export CRTC bpc settings via debugfs

 * bridge: Add TI-DLPC3433;  anx7625: Fixes;  fy07024di26a30d: Optional
   GPIO reset;  icn6211: Cleanups;  ldb: Add reg and reg-name properties
   to bindings, Kconfig fixes;  lt9611: Fix display sensing;  lt9611uxc:
   Fixes;  nwl-dsi: Fixes;  ps8640: Cleanups;  st7735r: Fixes;  tc358767:
   DSI/DPI refactoring and DSI-to-eDP support, Fixes; ti-sn65dsi83:
   Fixes;

 * gma500: Cleanup connector I2C handling

 * hyperv: Unify VRAM allocation of Gen1 and Gen2

 * i915: export CRTC bpc settings via debugfs

 * meson: Support YUV422 output; Refcount fixes

 * mgag200: Support damage clipping; Support gamma handling; Protect
   concurrent HW access; Fixes to connector; Store model-specific limits
   in device-info structure; Cleanups

 * nouveau: Fixes and Cleanups

 * panel: Kconfig fixes

 * panfrost: Valhall support

 * r128: Fix bit-shift overflow

 * rockchip: Locking fixes in error path; Minor cleanups

 * ssd130x: Fix built-in linkage

 * ttm: Cleanups

 * udl; Always advertize VGA connector

 * fbdev/vesa: Support COMPILE_TEST
The following changes since commit 6071c4c2a319da360b0bf2bc397d4fefad10b2c8:

  drm/qxl: add drm_gem_plane_helper_prepare_fb (2022-05-05 12:30:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-06-08

for you to fetch changes up to dfa687bffc8a4a21ed929c7dececf01b8f1f52ee:

  drm/bridge: lt9611uxc: Cancel only driver's work (2022-06-07 14:57:47 +0200)

----------------------------------------------------------------
drm-misc-next for 5.20:

UAPI Changes:

 * connector: export bpc limits in debugfs

 * dma-buf: Print buffer name in debugfs

Cross-subsystem Changes:

 * dma-buf: Improve dma-fence handling; Cleanups

 * fbdev: Device-unregistering fixes

Core Changes:

 * client: Only use driver-validated modes to avoid blank screen

 * dp-aux: Make probing more reliable; Small fixes

 * edit: CEA data-block iterators; Introduce struct drm_edid; Many cleanups

 * gem: Don't use framebuffer format's non-exising color planes

 * probe-helper: Use 640x480 as DisplayPort fallback; Refactoring

 * scheduler: Don't kill jobs in interrupt context

Driver Changes:

 * amdgpu: Use atomic fence helpers in DM; Fix VRAM address calculation;
   Export CRTC bpc settings via debugfs

 * bridge: Add TI-DLPC3433;  anx7625: Fixes;  fy07024di26a30d: Optional
   GPIO reset;  icn6211: Cleanups;  ldb: Add reg and reg-name properties
   to bindings, Kconfig fixes;  lt9611: Fix display sensing;  lt9611uxc:
   Fixes;  nwl-dsi: Fixes;  ps8640: Cleanups;  st7735r: Fixes;  tc358767:
   DSI/DPI refactoring and DSI-to-eDP support, Fixes; ti-sn65dsi83:
   Fixes;

 * gma500: Cleanup connector I2C handling

 * hyperv: Unify VRAM allocation of Gen1 and Gen2

 * i915: export CRTC bpc settings via debugfs

 * meson: Support YUV422 output; Refcount fixes

 * mgag200: Support damage clipping; Support gamma handling; Protect
   concurrent HW access; Fixes to connector; Store model-specific limits
   in device-info structure; Cleanups

 * nouveau: Fixes and Cleanups

 * panel: Kconfig fixes

 * panfrost: Valhall support

 * r128: Fix bit-shift overflow

 * rockchip: Locking fixes in error path; Minor cleanups

 * ssd130x: Fix built-in linkage

 * ttm: Cleanups

 * udl; Always advertize VGA connector

 * fbdev/vesa: Support COMPILE_TEST

----------------------------------------------------------------
Alyssa Rosenzweig (9):
      dt-bindings: Add compatible for Mali Valhall (JM)
      drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
      drm/panfrost: Constify argument to has_hw_issue
      drm/panfrost: Handle HW_ISSUE_TTRX_3076
      drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
      drm/panfrost: Add "clean only safe" feature bit
      drm/panfrost: Don't set L2_MMU_CONFIG quirks
      drm/panfrost: Add Mali-G57 "Natt" support
      drm/panfrost: Add arm,mali-valhall-jm compatible

André Almeida (1):
      drm/vkms: Update vkms_composer_worker documentation

Bhanuprakash Modem (3):
      drm/debug: Expose connector's max supported bpc via debugfs
      drm/i915/display/debug: Expose crtc current bpc via debugfs
      drm/amd/display: Move connector debugfs to drm

Bjorn Andersson (1):
      drm/bridge: lt9611uxc: Cancel only driver's work

Borislav Petkov (1):
      drm/r128: Fix undefined behavior due to shift overflowing the constant

Christian König (10):
      drm/ttm: move default BO destructor into VMWGFX v2
      drm/amdgpu: switch DM to atomic fence helpers v2
      drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new
      drm/amdgpu: move internal vram_mgr function into the C file
      dma-buf: cleanup dma_fence_chain_walk
      dma-buf: cleanup dma_fence_unwrap selftest v2
      dma-buf: cleanup dma_fence_unwrap implementation
      dma-buf: return only unsignaled fences in dma_fence_unwrap_for_each v3
      dma-buf: generalize dma_fence unwrap & merging v3
      drm: use dma_fence_unwrap_merge() in drm_syncobj

Colin Ian King (1):
      drm/rockchip: Fix spelling mistake "aligened" -> "aligned"

Dan Carpenter (1):
      drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()

Dmitry Osipenko (1):
      drm/scheduler: Don't kill jobs in interrupt context

Dongjin Kim (1):
      drm/meson: add YUV422 output support

Douglas Anderson (8):
      drm/probe-helper: Add helper for drm_helper_probe_single_connector_modes()
      drm/probe-helper: For DP, add 640x480 if all other modes are bad
      drm: Document the power requirements for DP AUX transfers
      drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
      drm/dp: Add callbacks to make using DP AUX bus properly easier
      drm/bridge: Add devm_drm_bridge_add()
      drm/bridge: parade-ps8640: Handle DP AUX more properly
      drm/probe-helper: Default to 640x480 if no EDID on DP

Fabio Estevam (1):
      drm: bridge: adv7511: Move CEC definitions to adv7511_cec.c

Gao Chao (1):
      drm/panel: Fix build error when CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m

Geert Uytterhoeven (1):
      drm: bridge: DRM_FSL_LDB should depend on ARCH_MXC

Guo Zhengkui (1):
      drm/nouveau/tegra: remove needless NULL check

Jagan Teki (2):
      dt-bindings: display: bridge: Add TI DLPC3433 DSI to DMD
      drm: bridge: Add TI DLPC3433 DSI to DMD bridge

Jani Nikula (44):
      drm/edid: reset display info in drm_add_edid_modes() for NULL edid
      drm/edid: rename HDMI Forum VSDB to SCDS
      drm/edid: clean up CTA data block tag definitions
      drm/edid: add iterator for EDID base and extension blocks
      drm/edid: add iterator for CTA data blocks
      drm/edid: clean up cea_db_is_*() functions
      drm/edid: convert add_cea_modes() to use cea db iter
      drm/edid: convert drm_edid_to_speaker_allocation() to use cea db iter
      drm/edid: convert drm_edid_to_sad() to use cea db iter
      drm/edid: convert drm_detect_hdmi_monitor() to use cea db iter
      drm/edid: convert drm_detect_monitor_audio() to use cea db iter
      drm/edid: convert drm_parse_cea_ext() to use cea db iter
      drm/edid: convert drm_edid_to_eld() to use cea db iter
      drm/edid: sunset the old unused cea data block iterators
      drm/edid: restore some type safety to cea_db_*() functions
      drm/edid: detect basic audio in all CEA extensions
      drm/edid: detect color formats and CTA revision in all CTA extensions
      drm/edid: skip CTA extension scan in drm_edid_to_eld() just for CTA rev
      drm/edid: sunset drm_find_cea_extension()
      drm/edid: use else-if in CTA extension parsing
      drm/edid: convert drm_for_each_detailed_block() to edid iter
      drm/edid: add struct drm_edid container
      drm/edid: start propagating drm_edid to lower levels
      drm/edid: keep propagating drm_edid to display info
      drm/edid: propagate drm_edid to drm_edid_to_eld()
      drm/edid: convert drm_edid_connector_update() to drm_edid fully
      drm/edid: convert struct detailed_mode_closure to drm_edid
      drm/edid: convert drm_mode_detailed() to drm_edid
      drm/edid: convert drm_dmt_modes_for_range() to drm_edid
      drm/edid: convert drm_gtf_modes_for_range() to drm_edid
      drm/edid: convert drm_cvt_modes_for_range() to drm_edid
      drm/edid: convert drm_mode_std() and children to drm_edid
      drm/edid: convert mode_in_range() and drm_monitor_supports_rb() to drm_edid
      drm/edid: convert get_monitor_name() to drm_edid
      drm/edid: convert drm_for_each_detailed_block() to drm_edid
      drm/edid: add drm_edid helper for drm_edid_to_sad()
      drm/edid: add drm_edid helper for drm_edid_to_speaker_allocation()
      drm/edid: add drm_edid helper for drm_detect_hdmi_monitor()
      drm/edid: add drm_edid helper for drm_detect_monitor_audio()
      drm/edid: convert cea_db_iter_edid_begin() to drm_edid
      drm/edid: convert drm_edid_iter_begin() to drm_edid
      drm/edid: add drm_edid helper for drm_update_tile_info()
      drm/displayid: convert to drm_edid
      drm/edid: convert version_greater() to drm_edid

Javier Martinez Canillas (6):
      MAINTAINERS: Add simpledrm driver co-maintainer
      drm/todo: Add entry for converting kselftests to kunit
      fbdev: Restart conflicting fb removal loop when unregistering devices
      fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled
      drm/st7735r: Fix module autoloading for Okaya RH128128T
      drm/ssd130x: Only define a SPI device ID table when built as a module

Jayshri Pawar (1):
      drm/bridge: cdns-dsi: Add support for pre_enable and post_enable control functions.

Jiapeng Chong (1):
      drm/nouveau/gr/gf100-: Clean up some inconsistent indenting

Jocelyn Falempe (4):
      drm/mgag200: Add FB_DAMAGE_CLIPS support
      drm/mgag200: Optimize damage clips
      drm/mgag200: Warn once if trying to set start address on broken hardware.
      drm/mgag200: Enable atomic gamma lut update

John Stultz (2):
      drm/bridge: lt9611: Consolidate detection logic
      drm/bridge: lt9611: Use both bits for HDMI sensing

Jonathan Liu (1):
      drm: bridge: icn6211: Adjust clock phase using SYS_CTRL_1

Julia Lawall (1):
      drm/nouveau/mmu: fix typo in comment

Lee Shawn C (1):
      drm/edid: check for HF-SCDB block

Liu Ying (1):
      drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()

Marek Vasut (9):
      dt-bindings: display: bridge: ldb: Fill in reg property
      drm/bridge: tc358767: Factor out DSI and DPI RX enablement
      drm/bridge: tc358767: Add DSI-to-(e)DP mode support
      drm: bridge: icn6211: Register macro clean up
      drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
      drm/bridge: tc358767: Report DSI-to-(e)DP as supported
      drm/bridge: tc358767: Make sure Refclk clock are enabled
      drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
      drm/bridge: anx7625: Add missing of_node_put for endpoint

Mark Menzynski (1):
      drm/nouveau: clear output poll workers before nouveau_fbcon_destroy()

Melissa Wen (1):
      MAINTAINERS: add Melissa to V3D maintainers

Miaoqian Lin (3):
      drm/meson: Fix refcount leak in meson_encoder_hdmi_init
      drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
      drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init

Minghao Chi (1):
      drm/bridge: simplify the return expression of ps8640_bridge_host_attach

Niels Dossche (1):
      drm: use ENOMEM for drmm_kzalloc allocation failures

Patrik Jakobsson (8):
      drm/gma500: Use gma_ prefix for our i2c abstraction
      drm/gma500: Make gma_i2c_chan a subclass of i2c_adapter
      drm/gma500: Make cdv lvds use ddc adapter from drm_connector
      drm/gma500: Make cdv hdmi use ddc adapter from drm_connector
      drm/gma500: Make psb lvds use ddc adapter from drm_connector
      drm/gma500: Make cdv crt use ddc adapter from drm_connector
      drm/gma500: Make oaktrail lvds use ddc adapter from drm_connector
      drm/gma500: Read EDID from the correct i2c adapter

Peter Geis (2):
      dt-bindings: display: panel: feiyang, fy07024di26a30d: make reset gpio optional
      drm/panel: feiyang-fy07024di26a30d: make reset gpio optional

Ren Zhijie (1):
      drm/rockchip: Fix Kconfig dependencies for display-port encoders

Rob Herring (1):
      dt-bindings: display: ingenic,jz4780-hdmi: Drop undocumented 'ddc-i2c-bus'

Robert Foss (2):
      Revert "drm/bridge: anx7625: Use DPI bus type"
      Revert "dt-bindings:drm/bridge:anx7625: add port@0 property"

Saurabh Sengar (1):
      drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size

Thomas Zimmermann (26):
      drm: Always warn if user-defined modes are not supported
      drm/client: Look for command-line modes first
      drm/client: Don't add new command-line mode
      drm/mgag200: Acquire I/O lock while reading EDID
      drm/mgag200: Fail on I2C initialization errors
      drm/mgag200: Implement connector's get_modes with helper
      drm/mgag200: Switch I2C code to managed cleanup
      drm/mgag200: Remove struct mga_connector
      drm/mgag200: Test memory requirements in drm_mode_config_funcs.mode_valid
      drm/mgag200: Split up connector's mode_valid helper
      drm/udl: Set VGA connector
      drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
      drm/gem: Ignore color planes that are unused by framebuffer format
      drm/gem-vram: Share code between GEM VRAM's _{prepare, cleanup}_fb()
      drm/gem-vram: Ignore planes that are unused by framebuffer format
      drm/gem: Warn on trying to use a non-existing framebuffer plane
      drm/mgag200: Remove special case for G200SE with <2 MiB
      drm/mgag200: Initialize each model in separate function
      drm/mgag200: Move PCI-option setup into model-specific code
      drm/mgag200: Call mgag200_device_probe_vram() from per-model init
      drm/mgag200: Implement new init logic
      drm/mgag200: Add struct mgag200_device_info
      drm/mgag200: Store HW_BUG_NO_STARTADD flag in device info
      drm/mgag200: Store maximum resolution and memory bandwidth in device info
      drm/mgag200: Store vidrst flag in device info
      drm/mgag200: Store positions of I2C data and clock bits in device info

Timur Tabi (1):
      drm/nouveau: fix another off-by-one in nvbios_addr

Tom Rix (1):
      drm/nouveau/fifo/gv100-: set gv100_fifo_runlist storage-class to static

Ville Syrjälä (1):
      drm/edid: Extract drm_edid_decode_mfg_id()

Xin Ji (2):
      dt-bindings:drm/bridge:anx7625: add port@0 property
      drm/bridge: anx7625: Use DPI bus type

Yang Li (1):
      drm/rockchip: remove unneeded semicolon from vop2 driver

Yuanzheng Song (1):
      dma-buf: add the name field to the table header

Yunhao Tian (1):
      drm/mipi-dbi: align max_chunk to 2 in spi_transfer

 .../bindings/display/bridge/fsl,ldb.yaml           |   16 +-
 .../display/bridge/ingenic,jz4780-hdmi.yaml        |    1 -
 .../bindings/display/bridge/ti,dlpc3433.yaml       |  117 ++
 .../display/panel/feiyang,fy07024di26a30d.yaml     |    1 -
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   25 +-
 Documentation/gpu/todo.rst                         |   11 +
 MAINTAINERS                                        |    8 +
 drivers/dma-buf/Makefile                           |    2 +-
 drivers/dma-buf/dma-buf.c                          |    4 +-
 drivers/dma-buf/dma-fence-chain.c                  |    4 +-
 drivers/dma-buf/dma-fence-unwrap.c                 |  162 +++
 drivers/dma-buf/st-dma-fence-unwrap.c              |  157 ++-
 drivers/dma-buf/sync_file.c                        |  119 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   27 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   27 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   38 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h  |    2 -
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   12 -
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |   12 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    1 +
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   26 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   42 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   24 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    6 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |   73 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  169 ++-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  417 +++++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c           |  211 ++--
 drivers/gpu/drm/drm_bridge.c                       |   23 +
 drivers/gpu/drm/drm_client_modeset.c               |   28 +-
 drivers/gpu/drm/drm_debugfs.c                      |   21 +
 drivers/gpu/drm/drm_displayid.c                    |   16 +-
 drivers/gpu/drm/drm_edid.c                         | 1272 ++++++++++++--------
 drivers/gpu/drm/drm_encoder.c                      |    2 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |    6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  104 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   54 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |    7 +
 drivers/gpu/drm/drm_modes.c                        |    4 +
 drivers/gpu/drm/drm_probe_helper.c                 |  178 ++-
 drivers/gpu/drm/drm_syncobj.c                      |   57 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |   47 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   98 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   80 +-
 drivers/gpu/drm/gma500/intel_i2c.c                 |   36 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |   50 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |   36 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |   24 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   86 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   74 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   28 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   27 +-
 drivers/gpu/drm/mgag200/Makefile                   |   14 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |  386 +++---
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  148 ++-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |  200 +++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   50 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   51 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   46 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   50 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   60 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |  130 ++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   50 +
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |   59 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c               |  116 --
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  453 ++++---
 drivers/gpu/drm/mgag200/mgag200_pll.c              |   12 +-
 drivers/gpu/drm/mgag200/mgag200_reg.h              |    2 +
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |    2 +
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    2 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |    9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    1 +
 drivers/gpu/drm/panfrost/panfrost_features.h       |   13 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   18 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h         |   19 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    1 +
 drivers/gpu/drm/r128/r128_drv.h                    |    4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    5 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    6 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    2 +
 drivers/gpu/drm/tiny/st7735r.c                     |    1 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |    9 +-
 drivers/gpu/drm/udl/udl_connector.c                |    2 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   10 +-
 drivers/video/fbdev/Kconfig                        |    2 +-
 drivers/video/fbdev/core/fbmem.c                   |   22 +-
 include/drm/display/drm_dp_aux_bus.h               |   34 +-
 include/drm/display/drm_dp_helper.h                |   16 +-
 include/drm/drm_bridge.h                           |    1 +
 include/drm/drm_displayid.h                        |    6 +-
 include/drm/drm_edid.h                             |   27 +-
 include/drm/drm_gem_framebuffer_helper.h           |   10 +-
 include/drm/drm_probe_helper.h                     |    2 +
 include/drm/gpu_scheduler.h                        |    4 +-
 include/linux/dma-fence-unwrap.h                   |   82 +-
 include/linux/fb.h                                 |    1 -
 111 files changed, 4032 insertions(+), 2286 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
 create mode 100644 drivers/dma-buf/dma-fence-unwrap.c
 create mode 100644 drivers/gpu/drm/bridge/ti-dlpc3433.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200er.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ev.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ew3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200se.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200wb.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_mm.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
