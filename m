Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5725AE049
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809C810E57F;
	Tue,  6 Sep 2022 06:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9A10E576;
 Tue,  6 Sep 2022 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662447220; x=1693983220;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=Axc6it7CIJWcHRhJuLbWDm9dFfHNN3ziZ1LAksYRsbg=;
 b=h8LbaaXYWjsrahfJcoZeE9ZOEneDBkIEsaT9rhvBFHsHwjaEhu2TBjM2
 N2H8Q8Pqz/wmgbAOTCUknP3oj0WsuXE0Xl4GTvgmztqv9yyZO1/3WlQoW
 0Bpqzlr8PUceX1QqIP45amSdA4b42VojcQ2fCVc1WSvFVJTGSC2bPEncB
 amnh2je+NZCarVrABF8rot9daZeDA6hP3wERrwMzMPfbcB4lFt3N8M0jy
 B53mMReOaAq/1uDY9AIgCI+plCLUC1SOiFyKgsbQurCIMOKgonr5qT+xC
 ZhTb8yOkFFb6aJO5izMb1v2MFy3L17EDabRNdU8ZlLqv1Dus2o9A/U+IE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276914192"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
 d="scan'208,217";a="276914192"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 23:53:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
 d="scan'208,217";a="942344531"
Received: from chenjinw-mobl.ger.corp.intel.com (HELO [10.251.221.134])
 ([10.251.221.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 23:53:29 -0700
Content-Type: multipart/alternative;
 boundary="------------zC8RVkorIWM0JbM1S0T5X0ZM"
Message-ID: <f0c71766-61e8-19b7-763a-5fbcdefc633d@linux.intel.com>
Date: Tue, 6 Sep 2022 08:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------zC8RVkorIWM0JbM1S0T5X0ZM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,

A pull request prepared in Germany and Denmark, but sent from Sweden after fighting with gpg on an infamous bridge.

My computer's somewhere in my trunk so I just copied someone else's pull request and pretend my laptop is a dev machine that sends pull requests every day works..

Tag is still correctly signed, hope I didn't mess up anything!

drm-misc-next-2022-08-20-1:
drm-misc-next for v6.1:

UAPI Changes:

Cross-subsystem Changes:
- DMA-buf: documentation updates.
- Assorted small fixes to vga16fb
- Fix fbdev drivers to use the aperture helpers.
- Make removal of conflicting drivers work correctly without fbdev enabled.

Core Changes:
- bridge, scheduler, dp-mst: Assorted small fixes.
- Add more format helpers to fourcc, and use it to replace the cpp usage.
- Add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx (single channel), and DRM_FORMAT_Dxx
   ("darkness", inverted single channel)
- Add packed AYUV8888 and XYUV8888 formats.
- Assorted documentation updates.
- Rename ttm_bo_init to ttm_bo_init_validate.
- Allow TTM bo's to exist without backing store.
- Convert drm selftests to kunit.
- Add managed init functions for (panel) bridge, crtc, encoder and connector.
- Fix endianness handling in various format conversion helpers.
- Make tests pass on big-endian platforms, and add test for rgb888 -> rgb565
- Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers and rename, so
   drm_plane_helper is no longer needed in most drivers.
- Use idr_init_base instead of idr_init.
- Rename FB and GEM CMA helpers to DMA helpers.
- Rework XRGB8888 related conversion helpers, and add drm_fb_blit() that
   takes a iosys_map. Make drm_fb_memcpy take an iosys_map too.
- Move edid luminance calculation to core, and use it in i915.

Driver Changes:
- bridge/{adv7511,ti-sn65dsi86,parade-ps8640}, panel/{simple,nt35510,tc358767},
   nouveau, sun4i, mipi-dsi, mgag200, bochs, arm, komeda, vmwgfx, pl111:
   Assorted small fixes and doc updates.
- vc4: Rework hdmi power up, and depend on PM.
- panel/simple: Add Samsung LTL101AL01.
- ingenic: Add JZ4760(B) support, avoid a modeset when sharpness property
   is unchanged, and use the new PM ops.
- Revert some amdgpu commits that cause garbaged graphics when starting
   X, and reapply them with the real problem fixed.
- Completely rework vc4 init to use managed helpers.
- Rename via_drv to via_dri1, and move all stuff there only used by the
   dri1 implementation in preperation for atomic modeset.
- Use regmap bulk write in ssd130x.
- Power sequence and clock updates to it6505.
- Split panel-sitrox-st7701  init sequence and rework mode programming code.
- virtio: Improve error and edge conditions handling, and convert to use managed
   helpers.
- Add Samsung LTL101AL01, B120XAN01.0, R140NWF5 RH, DMT028VGHMCMI-1A T, panels.
- Add generic fbdev support to komeda.
- Split mgag200 modeset handling to make it more model-specific.
- Convert simpledrm to use atomic helpers.
- Improve udl suspend/disconnect handling.
The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:

   Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-08-20-1

for you to fetch changes up to 8869fa666a9e6782c3c896c1fa57d65adca23249:

   drm/virtio: remove drm_plane_cleanup() destroy hook (2022-08-19 16:00:15 +0200)

----------------------------------------------------------------
drm-misc-next for v6.1:

UAPI Changes:

Cross-subsystem Changes:
- DMA-buf: documentation updates.
- Assorted small fixes to vga16fb
- Fix fbdev drivers to use the aperture helpers.
- Make removal of conflicting drivers work correctly without fbdev enabled.

Core Changes:
- bridge, scheduler, dp-mst: Assorted small fixes.
- Add more format helpers to fourcc, and use it to replace the cpp usage.
- Add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx (single channel), and DRM_FORMAT_Dxx
   ("darkness", inverted single channel)
- Add packed AYUV8888 and XYUV8888 formats.
- Assorted documentation updates.
- Rename ttm_bo_init to ttm_bo_init_validate.
- Allow TTM bo's to exist without backing store.
- Convert drm selftests to kunit.
- Add managed init functions for (panel) bridge, crtc, encoder and connector.
- Fix endianness handling in various format conversion helpers.
- Make tests pass on big-endian platforms, and add test for rgb888 -> rgb565
- Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers and rename, so
   drm_plane_helper is no longer needed in most drivers.
- Use idr_init_base instead of idr_init.
- Rename FB and GEM CMA helpers to DMA helpers.
- Rework XRGB8888 related conversion helpers, and add drm_fb_blit() that
   takes a iosys_map. Make drm_fb_memcpy take an iosys_map too.
- Move edid luminance calculation to core, and use it in i915.

Driver Changes:
- bridge/{adv7511,ti-sn65dsi86,parade-ps8640}, panel/{simple,nt35510,tc358767},
   nouveau, sun4i, mipi-dsi, mgag200, bochs, arm, komeda, vmwgfx, pl111:
   Assorted small fixes and doc updates.
- vc4: Rework hdmi power up, and depend on PM.
- panel/simple: Add Samsung LTL101AL01.
- ingenic: Add JZ4760(B) support, avoid a modeset when sharpness property
   is unchanged, and use the new PM ops.
- Revert some amdgpu commits that cause garbaged graphics when starting
   X, and reapply them with the real problem fixed.
- Completely rework vc4 init to use managed helpers.
- Rename via_drv to via_dri1, and move all stuff there only used by the
   dri1 implementation in preperation for atomic modeset.
- Use regmap bulk write in ssd130x.
- Power sequence and clock updates to it6505.
- Split panel-sitrox-st7701  init sequence and rework mode programming code.
- virtio: Improve error and edge conditions handling, and convert to use managed
   helpers.
- Add Samsung LTL101AL01, B120XAN01.0, R140NWF5 RH, DMT028VGHMCMI-1A T, panels.
- Add generic fbdev support to komeda.
- Split mgag200 modeset handling to make it more model-specific.
- Convert simpledrm to use atomic helpers.
- Improve udl suspend/disconnect handling.

----------------------------------------------------------------
Adrián Larumbe (2):
       drm/panfrost: Add specific register offset macros for JS and MMU AS
       drm/panfrost: Add support for devcoredump

Alvin Šipraga (2):
       drm: bridge: adv7511: fix CEC power down control register offset
       drm: bridge: adv7511: unregister cec i2c device after cec adapter

Arthur Grillo (1):
       drm: selftest: convert drm_mm selftest to KUnit

Arunpravin Paneer Selvam (2):
       Revert "drm/amdgpu: move internal vram_mgr function into the C file"
       Revert "drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new"

Carsten Haitzler (2):
       drm/komeda: Add legacy FB support so VT's work as expected
       drm/komeda - At init write GCU control block to handle already on DPU

Chen-Yu Tsai (1):
       drm/bridge: parade-ps8640: Fix regulator supply order

Christian König (9):
       drm/ttm: rename and cleanup ttm_bo_init
       drm/amdgpu: audit bo->resource usage
       drm/nouveau: audit bo->resource usage
       drm/ttm: audit bo->resource usage v2
       dma-buf: revert "return only unsignaled fences in dma_fence_unwrap_for_each v3"
       drm/amdgpu: reapply "fix start calculation in amdgpu_vram_mgr_new""
       drm/amdgpu: re-apply "move internal vram_mgr function into the C file""
       dma-buf/dma_resv_usage: update explicit sync documentation
       drm/sched: move calling drm_sched_entity_select_rq

Christophe JAILLET (1):
       drm/bochs: Fix some error handling paths in bochs_pci_probe()

Dan Carpenter (2):
       drm/bridge: Avoid uninitialized variable warning
       drm/vmwgfx: clean up some error pointer checking

Daniel Vetter (1):
       fbdev: Make registered_fb[] private to fbmem.c

Danilo Krummrich (18):
       drm/virtio: plane: use drm managed resources
       drm/virtio: kms: use drm managed resources
       drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
       drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
       drm: use idr_init_base() to initialize master->magic_map
       drm: use idr_init_base() to initialize master->lessee_idr
       drm: use idr_init_base() to initialize mode_config.object_idr
       drm: use idr_init_base() to initialize mode_config.tile_idr
       drm/sis: use idr_init_base() to initialize dev_priv->object_idr
       drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
       drm/via: use idr_init_base() to initialize dev_priv->object_idr
       drm/todo: remove task for idr_init_base()
       drm/fb: remove unused includes of drm_fb_cma_helper.h
       drm/fb: rename FB CMA helpers to FB DMA helpers
       drm/gem: rename GEM CMA helpers to GEM DMA helpers
       drm/gem: rename struct drm_gem_dma_object.{paddr => dma_addr}
       drm/todo: remove task to rename CMA helpers
       drm/virtio: remove drm_plane_cleanup() destroy hook

Dmitry Baryshkov (2):
       drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
       drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

Dmitry Osipenko (9):
       drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
       drm/virtio: Check whether transferred 2D BO is shmem
       drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() error
       drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
       drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
       drm/virtio: Simplify error handling of virtio_gpu_object_create()
       drm/virtio: Improve DMA API usage for shmem BOs
       drm/virtio: Use dev_is_pci()
       drm/virtio: Return proper error codes instead of -1

Geert Uytterhoeven (14):
       drm/fourcc: Add drm_format_info_bpp() helper
       drm/fourcc: Add drm_format_info.is_color_indexed flag
       drm/client: Use actual bpp when allocating frame buffers
       drm/framebuffer: Use actual bpp for DRM_IOCTL_MODE_GETFB
       drm/fourcc: Add DRM_FORMAT_C[124]
       drm/fb-helper: Add support for DRM_FORMAT_C[124]
       drm/gem-fb-helper: Use actual bpp for size calculations
       drm/fourcc: Clarify the meaning of single-channel "red"
       drm/fourcc: Add DRM_FORMAT_R[124]
       drm/fourcc: Add DRM_FORMAT_D[1248]
       drm/mode: Improve drm_mode_fb_cmd2 documentation
       drm/fb: Improve drm_framebuffer.offsets documentation
       drm/format-helper: Fix endianness in drm_fb_*_to_*() conversion helpers
       drm/gud: Fix endianness in gud_xrgb8888_to_color() helper

Javier Martinez Canillas (4):
       drm: Use size_t type for len variable in drm_copy_field()
       drm: Prevent drm_copy_field() to attempt copying a NULL pointer
       drm/ssd130x: Use new regmap bulk write support to drop custom bus
       drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid polluting the log

Jianglei Nie (2):
       drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
       drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()

José Expósito (4):
       drm/format-helper: Fix test on big endian architectures
       drm/format-helper: Rename test cases to make them more generic
       drm/format-helper: Support multiple target formats results
       drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()

Jouni Högander (3):
       drm: New function to get luminance range based on static hdr metadata
       drm/amdgpu_dm: Rely on split out luminance calculation function
       drm/i915: Use luminance range calculated during edid parsing

Laurent Pinchart (1):
       drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and XVUY permutations

Liang He (3):
       drm/bridge: anx7625: Fix refcount bug in anx7625_parse_dt()
       drm/bridge: tc358767: Add of_node_put() when breaking out of loop
       drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()

Liu Zixian (1):
       drm: correct comments

Liviu Dudau (1):
       drm/komeda: Fix handling of atomic commits in the atomic_commit_tail hook

Lucas Stach (3):
       drm/bridge: tc358767: don't fixup mode sync polarity
       drm/bridge: tc358767: increase CLRSIPO count
       drm/bridge: tc358767: disable main link PHYs on main link disable

Lyude Paul (1):
       drm/nouveau/kms/nv140-: Disable interlacing

Marek Vasut (11):
       drm/panel/panel-sitronix-st7701: Make DSI mode flags common to ST7701
       drm/panel/panel-sitronix-st7701: Enable DSI burst mode, LPM, non-continuous clock
       drm/panel/panel-sitronix-st7701: Make voltage supplies common to ST7701
       drm/panel/panel-sitronix-st7701: Make gamma correction TFT specific
       drm/panel/panel-sitronix-st7701: Infer vertical line count from TFT mode
       drm/panel/panel-sitronix-st7701: Adjust porch control bitfield name
       drm/panel/panel-sitronix-st7701: Infer horizontal pixel count from TFT mode
       drm/panel/panel-sitronix-st7701: Parametrize voltage and timing
       drm/panel/panel-sitronix-st7701: Split GIP and init sequences
       dt-bindings: display: panel: sitronix,st7701: Add Densitron DMT028VGHMCMI-1A TFT
       drm/panel/panel-sitronix-st7701: Add Densitron DMT028VGHMCMI-1A TFT

Martin Jücker (2):
       dt-bindings: display: simple: add support for Samsung LTL101AL01
       drm/panel: simple: add support for the Samsung LTL101AL01 panel

Maxime Ripard (72):
       drm/vc4: hdmi: Depends on CONFIG_PM
       drm/vc4: hdmi: Rework power up
       Merge drm/drm-next into drm-misc-next
       drm/mipi-dsi: Detach devices when removing the host
       drm/crtc: Introduce drmm_crtc_init_with_planes
       drm/encoder: Introduce drmm_encoder_init
       drm/connector: Reorder headers
       drm/connector: Mention the cleanup after drm_connector_init
       drm/connector: Clarify when drm_connector_unregister is needed
       drm/connector: Consolidate Connector Initialization
       drm/connector: Check for destroy implementation
       drm/connector: Introduce drmm_connector_init
       drm/bridge: panel: Introduce drmm_panel_bridge_add
       drm/bridge: panel: Introduce drmm_of_get_bridge
       drm/vc4: drv: Call component_unbind_all()
       drm/vc4: drv: Use drm_dev_unplug
       drm/vc4: crtc: Create vblank reporting function
       drm/vc4: hvs: Protect device resources after removal
       drm/vc4: hvs: Remove planes currently allocated before taking down
       drm/vc4: plane: Take possible_crtcs as an argument
       drm/vc4: crtc: Remove manual plane removal on error
       drm/vc4: plane: Switch to drmm_universal_plane_alloc()
       drm/vc4: crtc: Move debugfs_name to crtc_data
       drm/vc4: crtc: Switch to drmm_kzalloc
       drm/vc4: crtc: Switch to DRM-managed CRTC initialization
       drm/vc4: dpi: Remove vc4_dev dpi pointer
       drm/vc4: dpi: Embed DRM structures into the private structure
       drm/vc4: dpi: Switch to drmm_kzalloc
       drm/vc4: dpi: Return an error if we can't enable our clock
       drm/vc4: dpi: Remove unnecessary drm_of_panel_bridge_remove call
       drm/vc4: dpi: Add action to disable the clock
       drm/vc4: dpi: Switch to DRM-managed encoder initialization
       drm/vc4: dpi: Switch to drmm_of_get_bridge
       drm/vc4: dpi: Protect device resources
       drm/vc4: dsi: Embed DRM structures into the private structure
       drm/vc4: dsi: Switch to DRM-managed encoder initialization
       drm/vc4: dsi: Switch to drmm_of_get_bridge
       drm/vc4: dsi: Fix the driver structure lifetime
       drm/vc4: dsi: Switch to devm_pm_runtime_enable
       drm/vc4: hdmi: Switch to drmm_kzalloc
       drm/vc4: hdmi: Remove call to drm_connector_unregister()
       drm/vc4: hdmi: Switch to DRM-managed encoder initialization
       drm/vc4: hdmi: Switch to DRM-managed connector initialization
       drm/vc4: hdmi: Switch to device-managed ALSA initialization
       drm/vc4: hdmi: Switch to device-managed CEC initialization
       drm/vc4: hdmi: Use a device-managed action for DDC
       drm/vc4: hdmi: Switch to DRM-managed kfree to build regsets
       drm/vc4: hdmi: Use devm to register hotplug interrupts
       drm/vc4: hdmi: Move audio structure offset checks
       drm/vc4: hdmi: Protect device resources after removal
       drm/vc4: hdmi: Switch to devm_pm_runtime_enable
       drm/vc4: txp: Remove vc4_dev txp pointer
       drm/vc4: txp: Remove duplicate regset
       drm/vc4: txp: Switch to drmm_kzalloc
       drm/vc4: txp: Remove call to drm_connector_unregister()
       drm/vc4: txp: Protect device resources
       drm/vc4: vec: Remove vc4_dev vec pointer
       drm/vc4: vec: Embed DRM structures into the private structure
       drm/vc4: vec: Switch to drmm_kzalloc
       drm/vc4: vec: Remove call to drm_connector_unregister()
       drm/vc4: vec: Switch to DRM-managed encoder initialization
       drm/vc4: vec: Switch to DRM-managed connector initialization
       drm/vc4: vec: Protect device resources after removal
       drm/vc4: vec: Switch to devm_pm_runtime_enable
       drm/vc4: debugfs: Protect device resources
       drm/vc4: debugfs: Return an error on failure
       drm/vc4: debugfs: Simplify debugfs registration
       drm/vc4: Switch to drmm_mutex_init
       drm/vc4: perfmon: Add missing mutex_destroy
       drm/vc4: v3d: Stop disabling interrupts
       drm/vc4: v3d: Rework the runtime_pm setup
       drm/vc4: v3d: Switch to devm_pm_runtime_enable

Maíra Canal (10):
       drm: selftest: convert drm_damage_helper selftest to KUnit
       drm: selftest: convert drm_cmdline_parser selftest to KUnit
       drm: selftest: convert drm_rect selftest to KUnit
       drm: selftest: convert drm_format selftest to KUnit
       drm: selftest: convert drm_plane_helper selftest to KUnit
       drm: selftest: convert drm_dp_mst_helper selftest to KUnit
       drm: selftest: convert drm_framebuffer selftest to KUnit
       drm: selftest: convert drm_buddy selftest to KUnit
       drm/tests: Split up test cases in igt_check_drm_format_min_pitch
       drm/vc4: Drop of_gpio header

Nathan Chancellor (1):
       drm/simpledrm: Fix return type of simpledrm_simple_display_pipe_mode_valid()

Nícolas F. R. A. Prado (2):
       drm/panel-edp: Add panel entry for R140NWF5 RH
       drm/panel-edp: Add panel entry for B120XAN01.0

Paul Cercueil (5):
       dt-bindings/display: ingenic: Add compatible string for the JZ4760(B)
       drm/ingenic: Fix MODULE_LICENSE() string
       drm/ingenic: Add support for the JZ4760(B)
       drm/ingenic: Don't request full modeset if property is not modified
       drm/ingenic: Use the new PM macros

Pin-Yen Lin (1):
       drm/bridge: it6505: Power on downstream device in .atomic_enable

Robin Murphy (2):
       drm/arm/hdlcd: Take over EFI framebuffer properly
       drm/arm/hdlcd: Simplify IRQ install/uninstall

Sam Ravnborg (13):
       drm/via: Rename via_drv to via_dri1
       drm/via: Embed via_dma in via_dri1
       drm/via: Embed via_map in via_dri1
       drm/via: Embed via_mm in via_dri1
       drm/via: Embed via_video in via_dri1
       drm/via: Embed via_irq in via_dri1
       drm/via: Embed via_dmablit in via_dri1
       drm/via: Embed via_verifier in via_dri1
       drm/via: Embed via_drv.h in via_dri1
       drm/via: Update to the latest via_3d_reg header
       drm/via: Use SPDX tag for MIT license in via_3d_reg header
       drm/via: Make macros readable in the via_3d_reg header
       drm/via: Fix style issues in via_3d_reg header

Samuel Holland (1):
       drm/sun4i: Update Kconfig defaults and descriptions

Simon Ser (2):
       drm/dp_mst: fix drm_dp_dpcd_read return value checks
       drm: fix whitespace in drm_plane_create_color_properties()

Slark Xiao (1):
       drm: Fix typo 'the the' in comment

Takashi Iwai (4):
       drm/udl: Replace semaphore with a simple wait queue
       drm/udl: Sync pending URBs at suspend / disconnect
       drm/udl: Kill pending URBs at suspend and disconnect
       drm/udl: Replace BUG_ON() with WARN_ON()

Thomas Zimmermann (53):
       fbdev: Remove trailing whitespaces
       fbdev/vga16fb: Create EGA/VGA devices in sysfb code
       fbdev/vga16fb: Auto-generate module init/exit code
       fbdev/core: Remove remove_conflicting_pci_framebuffers()
       fbdev: Convert drivers to aperture helpers
       fbdev: Remove conflicting devices on PCI bus
       video/aperture: Disable and unregister sysfb devices via aperture helpers
       video: Provide constants for VGA I/O range
       video/aperture: Remove conflicting VGA devices, if any
       fbdev: Acquire framebuffer apertures for firmware devices
       fbdev: Remove conflict-handling code
       fbdev: Fix order of arguments to aperture_remove_conflicting_devices()
       drm/vmwgfx: Remove trailing whitespace
       drm/atomic-helper: Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers
       drm/atomic-helper: Remove _HELPER_ infix from DRM_PLANE_HELPER_NO_SCALING
       drm: Remove unnecessary include statements of drm_plane_helper.h
       drm/plane-helper: Export individual helpers
       drm/armada: Use drm_plane_helper_destroy()
       drm/fsl-dcu: Use drm_plane_helper_destroy()
       drm/mgag200: Split mgag200_modeset_init()
       drm/mgag200: Move DAC-register setup into model-specific code
       drm/mgag200: Move ER/EW3 register initialization to per-model code
       drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
       drm/mgag200: Store primary plane's color format in CRTC state
       drm/mgag200: Reorganize before dropping simple-KMS helpers
       drm/mgag200: Replace simple-KMS with regular atomic helpers
       drm/mgag200: Set SCROFF in primary-plane code
       drm/mgag200: Add per-device callbacks
       drm/mgag200: Provide per-device callbacks for BMC synchronization
       drm/mgag200: Provide per-device callbacks for PIXPLLC
       drm/mgag200: Move mode-config to model-specific code
       drm/mgag200: Move CRTC atomic_enable to model-specific code
       drm/mgag200: Remove type field from struct mga_device
       Merge drm/drm-next into drm-misc-next
       drm/simpledrm: Remove mem field from device structure
       drm/simpledrm: Inline device-init helpers
       drm/simpledrm: Remove pdev field from device structure
       drm/simpledrm: Compute framebuffer stride if not set
       drm/simpledrm: Convert to atomic helpers
       iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
       drm/format-helper: Provide drm_fb_blit()
       drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
       drm/format-helper: Convert drm_fb_swab() to struct iosys_map
       drm/format-helper: Rework XRGB8888-to-RGBG332 conversion
       drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
       drm/format-helper: Rework XRGB8888-to-RGB888 conversion
       drm/format-helper: Rework RGB565-to-XRGB8888 conversion
       drm/format-helper: Rework RGB888-to-XRGB8888 conversion
       drm/format-helper: Rework XRGB8888-to-XRGB2101010 conversion
       drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
       drm/format-helper: Rework XRGB8888-to-MONO conversion
       drm/format-helper: Move destination-buffer handling into internal helper
       drm/format-helper: Rename parameter vmap to src

Tom Rix (2):
       drm/nouveau/bios: set info only when the return is not 0
       drm/vmwgfx: cleanup comments

Uwe Kleine-König (3):
       drm/panel: simple: Make panel_simple_remove() return void
       drm/panel-novatek-nt35510: Emit an error message if power off fails
       drm/mipi-dsi: Make remove callback return void

Wang Jingjin (1):
       drm/vc4: Add explicit declaration of 'drmm_of_get_bridge'

XueBing Chen (1):
       dma-buf/sync_file: use strscpy to replace strlcpy

Zack Rusin (2):
       drm/vmwgfx: Remove unused hugepage support
       drm: Remove the drm_get_unmapped_area() helper

Zeng Jingxiang (1):
       gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()

allen chen (3):
       drm/bridge: it6505: Modified power sequence
       drm/bridge: it6505: Add i2c api power on check
       drm/bridge: it6505: Modified video clock calculation and video debug message

pengfuyuan (1):
       drm/arm: Fix spelling typo in comments

shaomin Deng (3):
       drm/mgag200:remove rebundant word "or" in comments
       drm:delete the repeated word "the" in comments
       drm:remove rebundant word "in" in comments

  .../devicetree/bindings/display/ingenic,lcd.yaml   |    2 +
  .../bindings/display/panel/panel-simple.yaml       |    2 +
  .../bindings/display/panel/sitronix,st7701.yaml    |    4 +
  Documentation/gpu/drm-kms-helpers.rst              |    8 +-
  Documentation/gpu/drm-mm.rst                       |   16 +-
  Documentation/gpu/todo.rst                         |   36 -
  drivers/dma-buf/sync_file.c                        |    8 +-
  drivers/firmware/sysfb.c                           |    4 +
  drivers/gpu/drm/Kconfig                            |   24 +-
  drivers/gpu/drm/Makefile                           |    7 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 -
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    3 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    4 +-
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   36 +-
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    2 +-
  drivers/gpu/drm/arm/Kconfig                        |    4 +-
  drivers/gpu/drm/arm/display/Kconfig                |    2 +-
  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |    3 +-
  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    5 +-
  drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +
  .../drm/arm/display/komeda/komeda_framebuffer.c    |   12 +-
  drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   31 +-
  drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    2 +
  .../drm/arm/display/komeda/komeda_pipeline_state.c |    2 +-
  drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |    1 -
  drivers/gpu/drm/arm/hdlcd_crtc.c                   |   11 +-
  drivers/gpu/drm/arm/hdlcd_drv.c                    |   77 +-
  drivers/gpu/drm/arm/malidp_drv.c                   |    9 +-
  drivers/gpu/drm/arm/malidp_mw.c                    |    8 +-
  drivers/gpu/drm/arm/malidp_planes.c                |   35 +-
  drivers/gpu/drm/arm/malidp_regs.h                  |    2 +-
  drivers/gpu/drm/armada/armada_crtc.c               |    1 -
  drivers/gpu/drm/armada/armada_gem.c                |    6 +-
  drivers/gpu/drm/armada/armada_overlay.c            |    8 +-
  drivers/gpu/drm/armada/armada_plane.c              |    2 +-
  drivers/gpu/drm/aspeed/Kconfig                     |    2 +-
  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |   10 +-
  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    7 +-
  drivers/gpu/drm/ast/ast_mode.c                     |    9 +-
  drivers/gpu/drm/atmel-hlcdc/Kconfig                |    2 +-
  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    6 +-
  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |    9 +-
  drivers/gpu/drm/bridge/adv7511/adv7511.h           |    5 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    4 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 +-
  drivers/gpu/drm/bridge/analogix/anx7625.c          |    1 +
  drivers/gpu/drm/bridge/chipone-icn6211.c           |    4 +-
  drivers/gpu/drm/bridge/ite-it6505.c                |   23 +-
  drivers/gpu/drm/bridge/lontium-lt9611.c            |    3 +-
  drivers/gpu/drm/bridge/panel.c                     |   74 +
  drivers/gpu/drm/bridge/parade-ps8640.c             |    4 +-
  drivers/gpu/drm/bridge/tc358762.c                  |    4 +-
  drivers/gpu/drm/bridge/tc358764.c                  |    4 +-
  drivers/gpu/drm/bridge/tc358767.c                  |   75 +-
  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   47 +-
  drivers/gpu/drm/display/drm_dp_helper.c            |    2 +-
  drivers/gpu/drm/display/drm_dp_mst_topology.c      |    6 +-
  drivers/gpu/drm/drm_atomic_helper.c                |    1 -
  drivers/gpu/drm/drm_auth.c                         |    4 +-
  drivers/gpu/drm/drm_bridge.c                       |    4 +-
  drivers/gpu/drm/drm_client.c                       |    4 +-
  drivers/gpu/drm/drm_color_mgmt.c                   |    2 +-
  drivers/gpu/drm/drm_connector.c                    |  135 +-
  drivers/gpu/drm/drm_crtc.c                         |   94 +-
  drivers/gpu/drm/drm_crtc_helper.c                  |    1 -
  drivers/gpu/drm/drm_edid.c                         |   52 +-
  drivers/gpu/drm/drm_encoder.c                      |   75 +-
  .../{drm_fb_cma_helper.c => drm_fb_dma_helper.c}   |   67 +-
  drivers/gpu/drm/drm_fb_helper.c                    |  101 +-
  drivers/gpu/drm/drm_file.c                         |  143 +-
  drivers/gpu/drm/drm_format_helper.c                |  593 ++--
  drivers/gpu/drm/drm_fourcc.c                       |   55 +-
  drivers/gpu/drm/drm_framebuffer.c                  |    4 +-
  .../{drm_gem_cma_helper.c => drm_gem_dma_helper.c} |  302 +-
  drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   12 +-
  drivers/gpu/drm/drm_gem_shmem_helper.c             |    2 +-
  drivers/gpu/drm/drm_gem_vram_helper.c              |    6 +-
  drivers/gpu/drm/drm_ioctl.c                        |    8 +-
  drivers/gpu/drm/drm_mipi_dbi.c                     |   11 +-
  drivers/gpu/drm/drm_mipi_dsi.c                     |    5 +-
  drivers/gpu/drm/drm_mode_config.c                  |    4 +-
  drivers/gpu/drm/drm_modeset_helper.c               |    8 +-
  drivers/gpu/drm/drm_plane_helper.c                 |   74 +-
  drivers/gpu/drm/drm_simple_kms_helper.c            |    5 +-
  drivers/gpu/drm/exynos/exynos_drm_plane.c          |    1 -
  drivers/gpu/drm/fsl-dcu/Kconfig                    |    2 +-
  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    7 +-
  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c          |    1 -
  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   18 +-
  drivers/gpu/drm/gma500/psb_intel_display.c         |    2 -
  drivers/gpu/drm/gud/gud_pipe.c                     |   34 +-
  drivers/gpu/drm/hisilicon/kirin/Kconfig            |    2 +-
  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   15 +-
  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    3 +-
  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    9 +-
  drivers/gpu/drm/i915/display/i9xx_plane.c          |    5 +-
  drivers/gpu/drm/i915/display/intel_atomic.c        |    1 -
  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    1 -
  drivers/gpu/drm/i915/display/intel_crtc.c          |    1 -
  drivers/gpu/drm/i915/display/intel_cursor.c        |    5 +-
  drivers/gpu/drm/i915/display/intel_display.c       |    1 -
  .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   15 +-
  drivers/gpu/drm/i915/display/intel_sprite.c        |    9 +-
  drivers/gpu/drm/i915/display/skl_universal_plane.c |    5 +-
  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    5 +-
  drivers/gpu/drm/i915/i915_irq.c                    |    2 +-
  drivers/gpu/drm/i915/intel_pm.c                    |    1 -
  drivers/gpu/drm/imx/Kconfig                        |    2 +-
  drivers/gpu/drm/imx/dcss/Kconfig                   |    2 +-
  drivers/gpu/drm/imx/dcss/dcss-kms.c                |    6 +-
  drivers/gpu/drm/imx/dcss/dcss-plane.c              |   18 +-
  drivers/gpu/drm/imx/imx-drm-core.c                 |   10 +-
  drivers/gpu/drm/imx/imx-drm.h                      |    2 +-
  drivers/gpu/drm/imx/ipuv3-crtc.c                   |    3 +-
  drivers/gpu/drm/imx/ipuv3-plane.c                  |   33 +-
  drivers/gpu/drm/ingenic/Kconfig                    |    2 +-
  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   58 +-
  drivers/gpu/drm/ingenic/ingenic-ipu.c              |   17 +-
  drivers/gpu/drm/kmb/Kconfig                        |    2 +-
  drivers/gpu/drm/kmb/kmb_drv.c                      |    6 +-
  drivers/gpu/drm/kmb/kmb_plane.c                    |   15 +-
  drivers/gpu/drm/logicvc/Kconfig                    |    4 +-
  drivers/gpu/drm/logicvc/logicvc_crtc.c             |    2 +-
  drivers/gpu/drm/logicvc/logicvc_drm.c              |   10 +-
  drivers/gpu/drm/logicvc/logicvc_interface.c        |    2 +-
  drivers/gpu/drm/logicvc/logicvc_layer.c            |   11 +-
  drivers/gpu/drm/logicvc/logicvc_mode.c             |    3 +-
  drivers/gpu/drm/mcde/Kconfig                       |    2 +-
  drivers/gpu/drm/mcde/mcde_display.c                |    8 +-
  drivers/gpu/drm/mcde/mcde_drv.c                    |   10 +-
  drivers/gpu/drm/mediatek/Kconfig                   |    2 +-
  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    1 -
  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +-
  drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    4 +-
  drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    9 +-
  drivers/gpu/drm/meson/Kconfig                      |    2 +-
  drivers/gpu/drm/meson/meson_drv.c                  |   10 +-
  drivers/gpu/drm/meson/meson_overlay.c              |   19 +-
  drivers/gpu/drm/meson/meson_plane.c                |   13 +-
  drivers/gpu/drm/mgag200/Makefile                   |    4 +-
  drivers/gpu/drm/mgag200/mgag200_bmc.c              |   99 +
  drivers/gpu/drm/mgag200/mgag200_drv.c              |   21 +-
  drivers/gpu/drm/mgag200/mgag200_drv.h              |  208 +-
  drivers/gpu/drm/mgag200/mgag200_g200.c             |  254 +-
  drivers/gpu/drm/mgag200/mgag200_g200eh.c           |  277 +-
  drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |  181 +-
  drivers/gpu/drm/mgag200/mgag200_g200er.c           |  315 +-
  drivers/gpu/drm/mgag200/mgag200_g200ev.c           |  316 +-
  drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |  192 +-
  drivers/gpu/drm/mgag200/mgag200_g200se.c           |  431 ++-
  drivers/gpu/drm/mgag200/mgag200_g200wb.c           |  326 +-
  drivers/gpu/drm/mgag200/mgag200_mode.c             |  726 ++--
  drivers/gpu/drm/mgag200/mgag200_pll.c              |  997 ------
  drivers/gpu/drm/mgag200/mgag200_reg.h              |    2 +-
  drivers/gpu/drm/msm/msm_drv.c                      |    2 +-
  drivers/gpu/drm/msm/msm_drv.h                      |    1 -
  drivers/gpu/drm/mxsfb/Kconfig                      |    4 +-
  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    6 +-
  drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   13 +-
  drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    6 +-
  drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   39 +-
  drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    8 +-
  drivers/gpu/drm/nouveau/dispnv50/base507c.c        |    5 +-
  drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |    5 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |    1 -
  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |    5 +-
  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |    5 +-
  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |    1 -
  drivers/gpu/drm/nouveau/nouveau_bo.c               |   13 +-
  drivers/gpu/drm/nouveau/nouveau_connector.c        |    3 +-
  drivers/gpu/drm/nouveau/nouveau_prime.c            |    1 -
  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c     |    5 +-
  drivers/gpu/drm/omapdrm/omap_crtc.c                |    1 -
  drivers/gpu/drm/omapdrm/omap_overlay.c             |    1 -
  drivers/gpu/drm/omapdrm/omap_plane.c               |    1 -
  drivers/gpu/drm/panel/Kconfig                      |    2 +-
  .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |    4 +-
  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |    4 +-
  drivers/gpu/drm/panel/panel-boe-himax8279d.c       |    4 +-
  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    4 +-
  drivers/gpu/drm/panel/panel-dsi-cm.c               |    4 +-
  drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |    4 +-
  drivers/gpu/drm/panel/panel-edp.c                  |    9 +
  drivers/gpu/drm/panel/panel-elida-kd35t133.c       |    4 +-
  drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    4 +-
  .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    4 +-
  drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    6 +-
  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |    4 +-
  drivers/gpu/drm/panel/panel-innolux-p079zca.c      |    4 +-
  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |    4 +-
  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |    4 +-
  drivers/gpu/drm/panel/panel-khadas-ts050.c         |    4 +-
  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |    4 +-
  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    4 +-
  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |    4 +-
  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |    4 +-
  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    9 +-
  drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    4 +-
  drivers/gpu/drm/panel/panel-novatek-nt35950.c      |    4 +-
  drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |    4 +-
  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    4 +-
  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |    4 +-
  .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |    4 +-
  drivers/gpu/drm/panel/panel-raydium-rm67191.c      |    4 +-
  drivers/gpu/drm/panel/panel-raydium-rm68200.c      |    4 +-
  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    4 +-
  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    4 +-
  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    4 +-
  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    4 +-
  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    3 +-
  .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    4 +-
  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |    4 +-
  drivers/gpu/drm/panel/panel-samsung-sofef00.c      |    4 +-
  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |    6 +-
  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    4 +-
  drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |    4 +-
  drivers/gpu/drm/panel/panel-simple.c               |   46 +-
  drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  547 ++-
  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    4 +-
  .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |    4 +-
  drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |    4 +-
  drivers/gpu/drm/panel/panel-truly-nt35597.c        |    3 +-
  drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    3 +-
  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |    4 +-
  drivers/gpu/drm/panfrost/Kconfig                   |    1 +
  drivers/gpu/drm/panfrost/Makefile                  |    3 +-
  drivers/gpu/drm/panfrost/panfrost_dump.c           |  249 ++
  drivers/gpu/drm/panfrost/panfrost_dump.h           |   12 +
  drivers/gpu/drm/panfrost/panfrost_job.c            |    3 +
  drivers/gpu/drm/panfrost/panfrost_regs.h           |   42 +-
  drivers/gpu/drm/pl111/Kconfig                      |    2 +-
  drivers/gpu/drm/pl111/pl111_display.c              |    8 +-
  drivers/gpu/drm/pl111/pl111_drv.c                  |    9 +-
  drivers/gpu/drm/pl111/pl111_versatile.c            |    1 +
  drivers/gpu/drm/qxl/qxl_display.c                  |    4 +-
  drivers/gpu/drm/qxl/qxl_object.c                   |    2 +-
  drivers/gpu/drm/radeon/radeon_display.c            |    1 -
  drivers/gpu/drm/radeon/radeon_object.c             |    6 +-
  drivers/gpu/drm/rcar-du/Kconfig                    |    2 +-
  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    4 +-
  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    5 +-
  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   37 +-
  drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   15 +-
  drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |    9 +-
  drivers/gpu/drm/rockchip/Kconfig                   |    2 +-
  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    2 +-
  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    4 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    9 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
  drivers/gpu/drm/scheduler/sched_main.c             |    3 +-
  drivers/gpu/drm/selftests/Makefile                 |    8 -
  drivers/gpu/drm/selftests/drm_buddy_selftests.h    |   15 -
  drivers/gpu/drm/selftests/drm_cmdline_selftests.h  |   68 -
  drivers/gpu/drm/selftests/drm_mm_selftests.h       |   28 -
  drivers/gpu/drm/selftests/drm_modeset_selftests.h  |   40 -
  drivers/gpu/drm/selftests/drm_selftest.c           |  109 -
  drivers/gpu/drm/selftests/drm_selftest.h           |   41 -
  drivers/gpu/drm/selftests/test-drm_buddy.c         |  994 ------
  .../gpu/drm/selftests/test-drm_cmdline_parser.c    | 1141 ------
  drivers/gpu/drm/selftests/test-drm_damage_helper.c |  668 ----
  drivers/gpu/drm/selftests/test-drm_format.c        |  280 --
  .../gpu/drm/selftests/test-drm_modeset_common.c    |   32 -
  .../gpu/drm/selftests/test-drm_modeset_common.h    |   52 -
  drivers/gpu/drm/selftests/test-drm_rect.c          |  223 --
  drivers/gpu/drm/shmobile/Kconfig                   |    2 +-
  drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   15 +-
  drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    6 +-
  drivers/gpu/drm/shmobile/shmob_drm_kms.c           |    3 +-
  drivers/gpu/drm/shmobile/shmob_drm_kms.h           |    2 +-
  drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   14 +-
  drivers/gpu/drm/sis/sis_drv.c                      |    2 +-
  drivers/gpu/drm/solomon/ssd130x-spi.c              |   21 +-
  drivers/gpu/drm/solomon/ssd130x.c                  |    8 +-
  drivers/gpu/drm/sprd/Kconfig                       |    2 +-
  drivers/gpu/drm/sprd/sprd_dpu.c                    |   15 +-
  drivers/gpu/drm/sprd/sprd_drm.c                    |    6 +-
  drivers/gpu/drm/sti/Kconfig                        |    2 +-
  drivers/gpu/drm/sti/sti_crtc.c                     |    1 -
  drivers/gpu/drm/sti/sti_cursor.c                   |   14 +-
  drivers/gpu/drm/sti/sti_drv.c                      |    7 +-
  drivers/gpu/drm/sti/sti_gdp.c                      |   18 +-
  drivers/gpu/drm/sti/sti_hqvdp.c                    |   18 +-
  drivers/gpu/drm/sti/sti_plane.c                    |    3 +-
  drivers/gpu/drm/sti/sti_plane.h                    |    1 -
  drivers/gpu/drm/stm/Kconfig                        |    2 +-
  drivers/gpu/drm/stm/drv.c                          |   11 +-
  drivers/gpu/drm/stm/ltdc.c                         |   17 +-
  drivers/gpu/drm/sun4i/Kconfig                      |   28 +-
  drivers/gpu/drm/sun4i/sun4i_backend.c              |   17 +-
  drivers/gpu/drm/sun4i/sun4i_drv.c                  |    9 +-
  drivers/gpu/drm/sun4i/sun4i_frontend.c             |   26 +-
  drivers/gpu/drm/sun4i/sun4i_layer.c                |    1 -
  drivers/gpu/drm/sun4i/sun8i_mixer.c                |    4 +-
  drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   27 +-
  drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   27 +-
  drivers/gpu/drm/tegra/dc.c                         |    1 -
  drivers/gpu/drm/tegra/fb.c                         |    2 +-
  drivers/gpu/drm/tegra/plane.c                      |    1 -
  drivers/gpu/drm/tests/Makefile                     |    4 +-
  drivers/gpu/drm/tests/drm_buddy_test.c             |  756 ++++
  drivers/gpu/drm/tests/drm_cmdline_parser_test.c    | 1078 ++++++
  drivers/gpu/drm/tests/drm_damage_helper_test.c     |  634 ++++
  .../drm_dp_mst_helper_test.c}                      |   89 +-
  drivers/gpu/drm/tests/drm_format_helper_test.c     |  178 +-
  drivers/gpu/drm/tests/drm_format_test.c            |  299 ++
  .../drm_framebuffer_test.c}                        |   77 +-
  .../test-drm_mm.c => tests/drm_mm_test.c}          | 1248 +++----
  .../drm_plane_helper_test.c}                       |  155 +-
  drivers/gpu/drm/tests/drm_rect_test.c              |  214 ++
  drivers/gpu/drm/tidss/Kconfig                      |    2 +-
  drivers/gpu/drm/tidss/tidss_crtc.c                 |    4 +-
  drivers/gpu/drm/tidss/tidss_dispc.c                |   28 +-
  drivers/gpu/drm/tidss/tidss_drv.c                  |    6 +-
  drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
  drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
  drivers/gpu/drm/tilcdc/Kconfig                     |    2 +-
  drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   10 +-
  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    6 +-
  drivers/gpu/drm/tilcdc/tilcdc_plane.c              |    1 -
  drivers/gpu/drm/tiny/Kconfig                       |   22 +-
  drivers/gpu/drm/tiny/arcpgu.c                      |   14 +-
  drivers/gpu/drm/tiny/bochs.c                       |   12 +-
  drivers/gpu/drm/tiny/cirrus.c                      |   19 +-
  drivers/gpu/drm/tiny/hx8357d.c                     |    6 +-
  drivers/gpu/drm/tiny/ili9163.c                     |    6 +-
  drivers/gpu/drm/tiny/ili9225.c                     |   12 +-
  drivers/gpu/drm/tiny/ili9341.c                     |    6 +-
  drivers/gpu/drm/tiny/ili9486.c                     |    6 +-
  drivers/gpu/drm/tiny/mi0283qt.c                    |    6 +-
  drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    6 +-
  drivers/gpu/drm/tiny/repaper.c                     |   16 +-
  drivers/gpu/drm/tiny/simpledrm.c                   |  565 +--
  drivers/gpu/drm/tiny/st7586.c                      |   17 +-
  drivers/gpu/drm/tiny/st7735r.c                     |    6 +-
  drivers/gpu/drm/ttm/ttm_bo.c                       |  163 +-
  drivers/gpu/drm/ttm/ttm_bo_util.c                  |    7 +-
  drivers/gpu/drm/tve200/Kconfig                     |    2 +-
  drivers/gpu/drm/tve200/tve200_display.c            |   12 +-
  drivers/gpu/drm/tve200/tve200_drv.c                |    7 +-
  drivers/gpu/drm/udl/udl_drv.h                      |   14 +-
  drivers/gpu/drm/udl/udl_main.c                     |  125 +-
  drivers/gpu/drm/udl/udl_modeset.c                  |    4 +
  drivers/gpu/drm/udl/udl_transfer.c                 |    3 +-
  drivers/gpu/drm/v3d/v3d_drv.c                      |    1 -
  drivers/gpu/drm/v3d/v3d_gem.c                      |    4 +-
  drivers/gpu/drm/v3d/v3d_perfmon.c                  |    2 +-
  drivers/gpu/drm/vboxvideo/vbox_mode.c              |   12 +-
  drivers/gpu/drm/vc4/Kconfig                        |    3 +-
  drivers/gpu/drm/vc4/vc4_bo.c                       |   79 +-
  drivers/gpu/drm/vc4/vc4_crtc.c                     |  108 +-
  drivers/gpu/drm/vc4/vc4_debugfs.c                  |   72 +-
  drivers/gpu/drm/vc4/vc4_dpi.c                      |  131 +-
  drivers/gpu/drm/vc4/vc4_drv.c                      |   28 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |   65 +-
  drivers/gpu/drm/vc4/vc4_dsi.c                      |  131 +-
  drivers/gpu/drm/vc4/vc4_gem.c                      |   22 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  684 +++-
  drivers/gpu/drm/vc4/vc4_hdmi.h                     |    3 +-
  drivers/gpu/drm/vc4/vc4_hvs.c                      |  145 +-
  drivers/gpu/drm/vc4/vc4_irq.c                      |    4 +-
  drivers/gpu/drm/vc4/vc4_kms.c                      |    1 -
  drivers/gpu/drm/vc4/vc4_perfmon.c                  |    1 +
  drivers/gpu/drm/vc4/vc4_plane.c                    |   51 +-
  drivers/gpu/drm/vc4/vc4_render_cl.c                |   40 +-
  drivers/gpu/drm/vc4/vc4_txp.c                      |   63 +-
  drivers/gpu/drm/vc4/vc4_v3d.c                      |   73 +-
  drivers/gpu/drm/vc4/vc4_validate.c                 |   28 +-
  drivers/gpu/drm/vc4/vc4_validate_shaders.c         |    2 +-
  drivers/gpu/drm/vc4/vc4_vec.c                      |  216 +-
  drivers/gpu/drm/via/Makefile                       |    2 +-
  drivers/gpu/drm/via/via_3d_reg.h                   |  349 +-
  drivers/gpu/drm/via/via_dma.c                      |  744 ----
  drivers/gpu/drm/via/via_dmablit.c                  |  807 -----
  drivers/gpu/drm/via/via_dmablit.h                  |  140 -
  drivers/gpu/drm/via/via_dri1.c                     | 3630 ++++++++++++++++++++
  drivers/gpu/drm/via/via_drv.c                      |  124 -
  drivers/gpu/drm/via/via_drv.h                      |  229 --
  drivers/gpu/drm/via/via_irq.c                      |  388 ---
  drivers/gpu/drm/via/via_map.c                      |  132 -
  drivers/gpu/drm/via/via_mm.c                       |  241 --
  drivers/gpu/drm/via/via_verifier.c                 | 1110 ------
  drivers/gpu/drm/via/via_verifier.h                 |   62 -
  drivers/gpu/drm/via/via_video.c                    |   94 -
  drivers/gpu/drm/virtio/virtgpu_drv.c               |   53 +-
  drivers/gpu/drm/virtio/virtgpu_drv.h               |    5 +-
  drivers/gpu/drm/virtio/virtgpu_gem.c               |    4 +-
  drivers/gpu/drm/virtio/virtgpu_kms.c               |   23 +-
  drivers/gpu/drm/virtio/virtgpu_object.c            |   65 +-
  drivers/gpu/drm/virtio/virtgpu_plane.c             |   40 +-
  drivers/gpu/drm/virtio/virtgpu_vq.c                |   21 +-
  drivers/gpu/drm/vkms/vkms_plane.c                  |    5 +-
  .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |    2 +-
  drivers/gpu/drm/vmwgfx/ttm_object.h                |    4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   14 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |    8 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   13 -
  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   11 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    1 -
  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    8 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    3 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |    2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    1 -
  drivers/gpu/drm/xlnx/Kconfig                       |    2 +-
  drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   13 +-
  drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    8 +-
  drivers/staging/sm750fb/sm750.c                    |   15 +-
  drivers/video/aperture.c                           |   69 +-
  drivers/video/fbdev/arkfb.c                        |    5 +
  drivers/video/fbdev/asiliantfb.c                   |    5 +
  drivers/video/fbdev/aty/aty128fb.c                 |   57 +-
  drivers/video/fbdev/aty/atyfb_base.c               |    7 +-
  drivers/video/fbdev/aty/radeon_base.c              |   83 +-
  drivers/video/fbdev/carminefb.c                    |    5 +
  drivers/video/fbdev/chipsfb.c                      |   13 +-
  drivers/video/fbdev/cirrusfb.c                     |    5 +
  drivers/video/fbdev/core/fbmem.c                   |  219 +-
  drivers/video/fbdev/cyber2000fb.c                  |    5 +
  drivers/video/fbdev/geode/gx1fb_core.c             |    5 +
  drivers/video/fbdev/geode/gxfb_core.c              |    5 +
  drivers/video/fbdev/geode/lxfb_core.c              |    5 +
  drivers/video/fbdev/gxt4500.c                      |    5 +
  drivers/video/fbdev/hyperv_fb.c                    |    6 +-
  drivers/video/fbdev/i740fb.c                       |    5 +
  drivers/video/fbdev/i810/i810_main.c               |  315 +-
  drivers/video/fbdev/imsttfb.c                      |   36 +-
  drivers/video/fbdev/intelfb/intelfbdrv.c           |    5 +
  drivers/video/fbdev/kyro/fbdev.c                   |    5 +
  drivers/video/fbdev/matrox/matroxfb_base.c         |    5 +
  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    5 +
  drivers/video/fbdev/neofb.c                        |   41 +-
  drivers/video/fbdev/nvidia/nvidia.c                |    7 +-
  drivers/video/fbdev/pm2fb.c                        |    5 +
  drivers/video/fbdev/pm3fb.c                        |    5 +
  drivers/video/fbdev/pvr2fb.c                       |    5 +
  drivers/video/fbdev/riva/fbdev.c                   |   67 +-
  drivers/video/fbdev/s3fb.c                         |    5 +
  drivers/video/fbdev/savage/savagefb_driver.c       |    5 +
  drivers/video/fbdev/sis/sis_main.c                 |    5 +
  drivers/video/fbdev/skeletonfb.c                   |  210 +-
  drivers/video/fbdev/sm712fb.c                      |    5 +
  drivers/video/fbdev/sstfb.c                        |   43 +-
  drivers/video/fbdev/sunxvr2500.c                   |    5 +
  drivers/video/fbdev/sunxvr500.c                    |    5 +
  drivers/video/fbdev/tdfxfb.c                       |    5 +
  drivers/video/fbdev/tgafb.c                        |   17 +-
  drivers/video/fbdev/tridentfb.c                    |    5 +
  drivers/video/fbdev/vermilion/vermilion.c          |    7 +-
  drivers/video/fbdev/vga16fb.c                      |  191 +-
  drivers/video/fbdev/via/via-core.c                 |    5 +
  drivers/video/fbdev/vt8623fb.c                     |    5 +
  include/drm/drm_atomic_helper.h                    |    9 +
  include/drm/drm_bridge.h                           |   12 +
  include/drm/drm_connector.h                        |   26 +
  include/drm/drm_crtc.h                             |    9 +
  include/drm/drm_encoder.h                          |    6 +
  .../{drm_fb_cma_helper.h => drm_fb_dma_helper.h}   |   10 +-
  include/drm/drm_file.h                             |    9 -
  include/drm/drm_format_helper.h                    |   56 +-
  include/drm/drm_fourcc.h                           |    4 +
  include/drm/drm_framebuffer.h                      |    8 +-
  include/drm/drm_gem.h                              |    2 +-
  .../{drm_gem_cma_helper.h => drm_gem_dma_helper.h} |  158 +-
  include/drm/drm_gem_shmem_helper.h                 |    2 +-
  include/drm/drm_mipi_dsi.h                         |    2 +-
  include/drm/drm_plane_helper.h                     |   29 +-
  include/drm/ttm/ttm_bo_api.h                       |   93 +-
  include/linux/dma-resv.h                           |   16 +-
  include/linux/fb.h                                 |   10 -
  include/linux/iosys-map.h                          |   15 +-
  include/uapi/drm/drm_fourcc.h                      |   34 +-
  include/uapi/drm/drm_mode.h                        |    8 +-
  include/uapi/drm/panfrost_drm.h                    |   47 +
  include/video/vga.h                                |   20 +-
  478 files changed, 16283 insertions(+), 14656 deletions(-)
  rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (60%)
  rename drivers/gpu/drm/{drm_gem_cma_helper.c => drm_gem_dma_helper.c} (61%)
  create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c
  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h
  delete mode 100644 drivers/gpu/drm/selftests/Makefile
  delete mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
  delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
  delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
  delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
  delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
  create mode 100644 drivers/gpu/drm/tests/drm_buddy_test.c
  create mode 100644 drivers/gpu/drm/tests/drm_cmdline_parser_test.c
  create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c
  rename drivers/gpu/drm/{selftests/test-drm_dp_mst_helper.c => tests/drm_dp_mst_helper_test.c} (72%)
  create mode 100644 drivers/gpu/drm/tests/drm_format_test.c
  rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c => tests/drm_framebuffer_test.c} (86%)
  rename drivers/gpu/drm/{selftests/test-drm_mm.c => tests/drm_mm_test.c} (55%)
  rename drivers/gpu/drm/{selftests/test-drm_plane_helper.c => tests/drm_plane_helper_test.c} (51%)
  create mode 100644 drivers/gpu/drm/tests/drm_rect_test.c
  delete mode 100644 drivers/gpu/drm/via/via_dma.c
  delete mode 100644 drivers/gpu/drm/via/via_dmablit.c
  delete mode 100644 drivers/gpu/drm/via/via_dmablit.h
  create mode 100644 drivers/gpu/drm/via/via_dri1.c
  delete mode 100644 drivers/gpu/drm/via/via_drv.c
  delete mode 100644 drivers/gpu/drm/via/via_drv.h
  delete mode 100644 drivers/gpu/drm/via/via_irq.c
  delete mode 100644 drivers/gpu/drm/via/via_map.c
  delete mode 100644 drivers/gpu/drm/via/via_mm.c
  delete mode 100644 drivers/gpu/drm/via/via_verifier.c
  delete mode 100644 drivers/gpu/drm/via/via_verifier.h
  delete mode 100644 drivers/gpu/drm/via/via_video.c
  rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)
  rename include/drm/{drm_gem_cma_helper.h => drm_gem_dma_helper.h} (53%)

--------------zC8RVkorIWM0JbM1S0T5X0ZM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Dave, Daniel,</pre>
    <pre>A pull request prepared in Germany and Denmark, but sent from Sweden after fighting with gpg on an infamous bridge.</pre>
    <pre>My computer's somewhere in my trunk so I just copied someone else's pull request and pretend my laptop is a dev machine that sends pull requests every day works..

Tag is still correctly signed, hope I didn't mess up anything!

drm-misc-next-2022-08-20-1:
drm-misc-next for v6.1:

UAPI Changes:

Cross-subsystem Changes:
- DMA-buf: documentation updates.
- Assorted small fixes to vga16fb
- Fix fbdev drivers to use the aperture helpers.
- Make removal of conflicting drivers work correctly without fbdev enabled.

Core Changes:
- bridge, scheduler, dp-mst: Assorted small fixes.
- Add more format helpers to fourcc, and use it to replace the cpp usage.
- Add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx (single channel), and DRM_FORMAT_Dxx
  ("darkness", inverted single channel)
- Add packed AYUV8888 and XYUV8888 formats.
- Assorted documentation updates.
- Rename ttm_bo_init to ttm_bo_init_validate.
- Allow TTM bo's to exist without backing store.
- Convert drm selftests to kunit.
- Add managed init functions for (panel) bridge, crtc, encoder and connector.
- Fix endianness handling in various format conversion helpers.
- Make tests pass on big-endian platforms, and add test for rgb888 -&gt; rgb565
- Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers and rename, so
  drm_plane_helper is no longer needed in most drivers.
- Use idr_init_base instead of idr_init.
- Rename FB and GEM CMA helpers to DMA helpers.
- Rework XRGB8888 related conversion helpers, and add drm_fb_blit() that
  takes a iosys_map. Make drm_fb_memcpy take an iosys_map too.
- Move edid luminance calculation to core, and use it in i915.

Driver Changes:
- bridge/{adv7511,ti-sn65dsi86,parade-ps8640}, panel/{simple,nt35510,tc358767},
  nouveau, sun4i, mipi-dsi, mgag200, bochs, arm, komeda, vmwgfx, pl111:
  Assorted small fixes and doc updates.
- vc4: Rework hdmi power up, and depend on PM.
- panel/simple: Add Samsung LTL101AL01.
- ingenic: Add JZ4760(B) support, avoid a modeset when sharpness property
  is unchanged, and use the new PM ops.
- Revert some amdgpu commits that cause garbaged graphics when starting
  X, and reapply them with the real problem fixed.
- Completely rework vc4 init to use managed helpers.
- Rename via_drv to via_dri1, and move all stuff there only used by the
  dri1 implementation in preperation for atomic modeset.
- Use regmap bulk write in ssd130x.
- Power sequence and clock updates to it6505.
- Split panel-sitrox-st7701  init sequence and rework mode programming code.
- virtio: Improve error and edge conditions handling, and convert to use managed
  helpers.
- Add Samsung LTL101AL01, B120XAN01.0, R140NWF5 RH, DMT028VGHMCMI-1A T, panels.
- Add generic fbdev support to komeda.
- Split mgag200 modeset handling to make it more model-specific.
- Convert simpledrm to use atomic helpers.
- Improve udl suspend/disconnect handling.
The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:

  Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-08-20-1

for you to fetch changes up to 8869fa666a9e6782c3c896c1fa57d65adca23249:

  drm/virtio: remove drm_plane_cleanup() destroy hook (2022-08-19 16:00:15 +0200)

----------------------------------------------------------------
drm-misc-next for v6.1:

UAPI Changes:

Cross-subsystem Changes:
- DMA-buf: documentation updates.
- Assorted small fixes to vga16fb
- Fix fbdev drivers to use the aperture helpers.
- Make removal of conflicting drivers work correctly without fbdev enabled.

Core Changes:
- bridge, scheduler, dp-mst: Assorted small fixes.
- Add more format helpers to fourcc, and use it to replace the cpp usage.
- Add DRM_FORMAT_Cxx, DRM_FORMAT_Rxx (single channel), and DRM_FORMAT_Dxx
  ("darkness", inverted single channel)
- Add packed AYUV8888 and XYUV8888 formats.
- Assorted documentation updates.
- Rename ttm_bo_init to ttm_bo_init_validate.
- Allow TTM bo's to exist without backing store.
- Convert drm selftests to kunit.
- Add managed init functions for (panel) bridge, crtc, encoder and connector.
- Fix endianness handling in various format conversion helpers.
- Make tests pass on big-endian platforms, and add test for rgb888 -&gt; rgb565
- Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers and rename, so
  drm_plane_helper is no longer needed in most drivers.
- Use idr_init_base instead of idr_init.
- Rename FB and GEM CMA helpers to DMA helpers.
- Rework XRGB8888 related conversion helpers, and add drm_fb_blit() that
  takes a iosys_map. Make drm_fb_memcpy take an iosys_map too.
- Move edid luminance calculation to core, and use it in i915.

Driver Changes:
- bridge/{adv7511,ti-sn65dsi86,parade-ps8640}, panel/{simple,nt35510,tc358767},
  nouveau, sun4i, mipi-dsi, mgag200, bochs, arm, komeda, vmwgfx, pl111:
  Assorted small fixes and doc updates.
- vc4: Rework hdmi power up, and depend on PM.
- panel/simple: Add Samsung LTL101AL01.
- ingenic: Add JZ4760(B) support, avoid a modeset when sharpness property
  is unchanged, and use the new PM ops.
- Revert some amdgpu commits that cause garbaged graphics when starting
  X, and reapply them with the real problem fixed.
- Completely rework vc4 init to use managed helpers.
- Rename via_drv to via_dri1, and move all stuff there only used by the
  dri1 implementation in preperation for atomic modeset.
- Use regmap bulk write in ssd130x.
- Power sequence and clock updates to it6505.
- Split panel-sitrox-st7701  init sequence and rework mode programming code.
- virtio: Improve error and edge conditions handling, and convert to use managed
  helpers.
- Add Samsung LTL101AL01, B120XAN01.0, R140NWF5 RH, DMT028VGHMCMI-1A T, panels.
- Add generic fbdev support to komeda.
- Split mgag200 modeset handling to make it more model-specific.
- Convert simpledrm to use atomic helpers.
- Improve udl suspend/disconnect handling.

----------------------------------------------------------------
Adrián Larumbe (2):
      drm/panfrost: Add specific register offset macros for JS and MMU AS
      drm/panfrost: Add support for devcoredump

Alvin Šipraga (2):
      drm: bridge: adv7511: fix CEC power down control register offset
      drm: bridge: adv7511: unregister cec i2c device after cec adapter

Arthur Grillo (1):
      drm: selftest: convert drm_mm selftest to KUnit

Arunpravin Paneer Selvam (2):
      Revert "drm/amdgpu: move internal vram_mgr function into the C file"
      Revert "drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new"

Carsten Haitzler (2):
      drm/komeda: Add legacy FB support so VT's work as expected
      drm/komeda - At init write GCU control block to handle already on DPU

Chen-Yu Tsai (1):
      drm/bridge: parade-ps8640: Fix regulator supply order

Christian König (9):
      drm/ttm: rename and cleanup ttm_bo_init
      drm/amdgpu: audit bo-&gt;resource usage
      drm/nouveau: audit bo-&gt;resource usage
      drm/ttm: audit bo-&gt;resource usage v2
      dma-buf: revert "return only unsignaled fences in dma_fence_unwrap_for_each v3"
      drm/amdgpu: reapply "fix start calculation in amdgpu_vram_mgr_new""
      drm/amdgpu: re-apply "move internal vram_mgr function into the C file""
      dma-buf/dma_resv_usage: update explicit sync documentation
      drm/sched: move calling drm_sched_entity_select_rq

Christophe JAILLET (1):
      drm/bochs: Fix some error handling paths in bochs_pci_probe()

Dan Carpenter (2):
      drm/bridge: Avoid uninitialized variable warning
      drm/vmwgfx: clean up some error pointer checking

Daniel Vetter (1):
      fbdev: Make registered_fb[] private to fbmem.c

Danilo Krummrich (18):
      drm/virtio: plane: use drm managed resources
      drm/virtio: kms: use drm managed resources
      drm/amdgpu: use idr_init_base() to initialize mgr-&gt;ctx_handles
      drm/amdgpu: use idr_init_base() to initialize fpriv-&gt;bo_list_handles
      drm: use idr_init_base() to initialize master-&gt;magic_map
      drm: use idr_init_base() to initialize master-&gt;lessee_idr
      drm: use idr_init_base() to initialize mode_config.object_idr
      drm: use idr_init_base() to initialize mode_config.tile_idr
      drm/sis: use idr_init_base() to initialize dev_priv-&gt;object_idr
      drm/v3d: use idr_init_base() to initialize v3d_priv-&gt;perfmon.idr
      drm/via: use idr_init_base() to initialize dev_priv-&gt;object_idr
      drm/todo: remove task for idr_init_base()
      drm/fb: remove unused includes of drm_fb_cma_helper.h
      drm/fb: rename FB CMA helpers to FB DMA helpers
      drm/gem: rename GEM CMA helpers to GEM DMA helpers
      drm/gem: rename struct drm_gem_dma_object.{paddr =&gt; dma_addr}
      drm/todo: remove task to rename CMA helpers
      drm/virtio: remove drm_plane_cleanup() destroy hook

Dmitry Baryshkov (2):
      drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
      drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

Dmitry Osipenko (9):
      drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
      drm/virtio: Check whether transferred 2D BO is shmem
      drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() error
      drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
      drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
      drm/virtio: Simplify error handling of virtio_gpu_object_create()
      drm/virtio: Improve DMA API usage for shmem BOs
      drm/virtio: Use dev_is_pci()
      drm/virtio: Return proper error codes instead of -1

Geert Uytterhoeven (14):
      drm/fourcc: Add drm_format_info_bpp() helper
      drm/fourcc: Add drm_format_info.is_color_indexed flag
      drm/client: Use actual bpp when allocating frame buffers
      drm/framebuffer: Use actual bpp for DRM_IOCTL_MODE_GETFB
      drm/fourcc: Add DRM_FORMAT_C[124]
      drm/fb-helper: Add support for DRM_FORMAT_C[124]
      drm/gem-fb-helper: Use actual bpp for size calculations
      drm/fourcc: Clarify the meaning of single-channel "red"
      drm/fourcc: Add DRM_FORMAT_R[124]
      drm/fourcc: Add DRM_FORMAT_D[1248]
      drm/mode: Improve drm_mode_fb_cmd2 documentation
      drm/fb: Improve drm_framebuffer.offsets documentation
      drm/format-helper: Fix endianness in drm_fb_*_to_*() conversion helpers
      drm/gud: Fix endianness in gud_xrgb8888_to_color() helper

Javier Martinez Canillas (4):
      drm: Use size_t type for len variable in drm_copy_field()
      drm: Prevent drm_copy_field() to attempt copying a NULL pointer
      drm/ssd130x: Use new regmap bulk write support to drop custom bus
      drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid polluting the log

Jianglei Nie (2):
      drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
      drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()

José Expósito (4):
      drm/format-helper: Fix test on big endian architectures
      drm/format-helper: Rename test cases to make them more generic
      drm/format-helper: Support multiple target formats results
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()

Jouni Högander (3):
      drm: New function to get luminance range based on static hdr metadata
      drm/amdgpu_dm: Rely on split out luminance calculation function
      drm/i915: Use luminance range calculated during edid parsing

Laurent Pinchart (1):
      drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and XVUY permutations

Liang He (3):
      drm/bridge: anx7625: Fix refcount bug in anx7625_parse_dt()
      drm/bridge: tc358767: Add of_node_put() when breaking out of loop
      drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()

Liu Zixian (1):
      drm: correct comments

Liviu Dudau (1):
      drm/komeda: Fix handling of atomic commits in the atomic_commit_tail hook

Lucas Stach (3):
      drm/bridge: tc358767: don't fixup mode sync polarity
      drm/bridge: tc358767: increase CLRSIPO count
      drm/bridge: tc358767: disable main link PHYs on main link disable

Lyude Paul (1):
      drm/nouveau/kms/nv140-: Disable interlacing

Marek Vasut (11):
      drm/panel/panel-sitronix-st7701: Make DSI mode flags common to ST7701
      drm/panel/panel-sitronix-st7701: Enable DSI burst mode, LPM, non-continuous clock
      drm/panel/panel-sitronix-st7701: Make voltage supplies common to ST7701
      drm/panel/panel-sitronix-st7701: Make gamma correction TFT specific
      drm/panel/panel-sitronix-st7701: Infer vertical line count from TFT mode
      drm/panel/panel-sitronix-st7701: Adjust porch control bitfield name
      drm/panel/panel-sitronix-st7701: Infer horizontal pixel count from TFT mode
      drm/panel/panel-sitronix-st7701: Parametrize voltage and timing
      drm/panel/panel-sitronix-st7701: Split GIP and init sequences
      dt-bindings: display: panel: sitronix,st7701: Add Densitron DMT028VGHMCMI-1A TFT
      drm/panel/panel-sitronix-st7701: Add Densitron DMT028VGHMCMI-1A TFT

Martin Jücker (2):
      dt-bindings: display: simple: add support for Samsung LTL101AL01
      drm/panel: simple: add support for the Samsung LTL101AL01 panel

Maxime Ripard (72):
      drm/vc4: hdmi: Depends on CONFIG_PM
      drm/vc4: hdmi: Rework power up
      Merge drm/drm-next into drm-misc-next
      drm/mipi-dsi: Detach devices when removing the host
      drm/crtc: Introduce drmm_crtc_init_with_planes
      drm/encoder: Introduce drmm_encoder_init
      drm/connector: Reorder headers
      drm/connector: Mention the cleanup after drm_connector_init
      drm/connector: Clarify when drm_connector_unregister is needed
      drm/connector: Consolidate Connector Initialization
      drm/connector: Check for destroy implementation
      drm/connector: Introduce drmm_connector_init
      drm/bridge: panel: Introduce drmm_panel_bridge_add
      drm/bridge: panel: Introduce drmm_of_get_bridge
      drm/vc4: drv: Call component_unbind_all()
      drm/vc4: drv: Use drm_dev_unplug
      drm/vc4: crtc: Create vblank reporting function
      drm/vc4: hvs: Protect device resources after removal
      drm/vc4: hvs: Remove planes currently allocated before taking down
      drm/vc4: plane: Take possible_crtcs as an argument
      drm/vc4: crtc: Remove manual plane removal on error
      drm/vc4: plane: Switch to drmm_universal_plane_alloc()
      drm/vc4: crtc: Move debugfs_name to crtc_data
      drm/vc4: crtc: Switch to drmm_kzalloc
      drm/vc4: crtc: Switch to DRM-managed CRTC initialization
      drm/vc4: dpi: Remove vc4_dev dpi pointer
      drm/vc4: dpi: Embed DRM structures into the private structure
      drm/vc4: dpi: Switch to drmm_kzalloc
      drm/vc4: dpi: Return an error if we can't enable our clock
      drm/vc4: dpi: Remove unnecessary drm_of_panel_bridge_remove call
      drm/vc4: dpi: Add action to disable the clock
      drm/vc4: dpi: Switch to DRM-managed encoder initialization
      drm/vc4: dpi: Switch to drmm_of_get_bridge
      drm/vc4: dpi: Protect device resources
      drm/vc4: dsi: Embed DRM structures into the private structure
      drm/vc4: dsi: Switch to DRM-managed encoder initialization
      drm/vc4: dsi: Switch to drmm_of_get_bridge
      drm/vc4: dsi: Fix the driver structure lifetime
      drm/vc4: dsi: Switch to devm_pm_runtime_enable
      drm/vc4: hdmi: Switch to drmm_kzalloc
      drm/vc4: hdmi: Remove call to drm_connector_unregister()
      drm/vc4: hdmi: Switch to DRM-managed encoder initialization
      drm/vc4: hdmi: Switch to DRM-managed connector initialization
      drm/vc4: hdmi: Switch to device-managed ALSA initialization
      drm/vc4: hdmi: Switch to device-managed CEC initialization
      drm/vc4: hdmi: Use a device-managed action for DDC
      drm/vc4: hdmi: Switch to DRM-managed kfree to build regsets
      drm/vc4: hdmi: Use devm to register hotplug interrupts
      drm/vc4: hdmi: Move audio structure offset checks
      drm/vc4: hdmi: Protect device resources after removal
      drm/vc4: hdmi: Switch to devm_pm_runtime_enable
      drm/vc4: txp: Remove vc4_dev txp pointer
      drm/vc4: txp: Remove duplicate regset
      drm/vc4: txp: Switch to drmm_kzalloc
      drm/vc4: txp: Remove call to drm_connector_unregister()
      drm/vc4: txp: Protect device resources
      drm/vc4: vec: Remove vc4_dev vec pointer
      drm/vc4: vec: Embed DRM structures into the private structure
      drm/vc4: vec: Switch to drmm_kzalloc
      drm/vc4: vec: Remove call to drm_connector_unregister()
      drm/vc4: vec: Switch to DRM-managed encoder initialization
      drm/vc4: vec: Switch to DRM-managed connector initialization
      drm/vc4: vec: Protect device resources after removal
      drm/vc4: vec: Switch to devm_pm_runtime_enable
      drm/vc4: debugfs: Protect device resources
      drm/vc4: debugfs: Return an error on failure
      drm/vc4: debugfs: Simplify debugfs registration
      drm/vc4: Switch to drmm_mutex_init
      drm/vc4: perfmon: Add missing mutex_destroy
      drm/vc4: v3d: Stop disabling interrupts
      drm/vc4: v3d: Rework the runtime_pm setup
      drm/vc4: v3d: Switch to devm_pm_runtime_enable

Maíra Canal (10):
      drm: selftest: convert drm_damage_helper selftest to KUnit
      drm: selftest: convert drm_cmdline_parser selftest to KUnit
      drm: selftest: convert drm_rect selftest to KUnit
      drm: selftest: convert drm_format selftest to KUnit
      drm: selftest: convert drm_plane_helper selftest to KUnit
      drm: selftest: convert drm_dp_mst_helper selftest to KUnit
      drm: selftest: convert drm_framebuffer selftest to KUnit
      drm: selftest: convert drm_buddy selftest to KUnit
      drm/tests: Split up test cases in igt_check_drm_format_min_pitch
      drm/vc4: Drop of_gpio header

Nathan Chancellor (1):
      drm/simpledrm: Fix return type of simpledrm_simple_display_pipe_mode_valid()

Nícolas F. R. A. Prado (2):
      drm/panel-edp: Add panel entry for R140NWF5 RH
      drm/panel-edp: Add panel entry for B120XAN01.0

Paul Cercueil (5):
      dt-bindings/display: ingenic: Add compatible string for the JZ4760(B)
      drm/ingenic: Fix MODULE_LICENSE() string
      drm/ingenic: Add support for the JZ4760(B)
      drm/ingenic: Don't request full modeset if property is not modified
      drm/ingenic: Use the new PM macros

Pin-Yen Lin (1):
      drm/bridge: it6505: Power on downstream device in .atomic_enable

Robin Murphy (2):
      drm/arm/hdlcd: Take over EFI framebuffer properly
      drm/arm/hdlcd: Simplify IRQ install/uninstall

Sam Ravnborg (13):
      drm/via: Rename via_drv to via_dri1
      drm/via: Embed via_dma in via_dri1
      drm/via: Embed via_map in via_dri1
      drm/via: Embed via_mm in via_dri1
      drm/via: Embed via_video in via_dri1
      drm/via: Embed via_irq in via_dri1
      drm/via: Embed via_dmablit in via_dri1
      drm/via: Embed via_verifier in via_dri1
      drm/via: Embed via_drv.h in via_dri1
      drm/via: Update to the latest via_3d_reg header
      drm/via: Use SPDX tag for MIT license in via_3d_reg header
      drm/via: Make macros readable in the via_3d_reg header
      drm/via: Fix style issues in via_3d_reg header

Samuel Holland (1):
      drm/sun4i: Update Kconfig defaults and descriptions

Simon Ser (2):
      drm/dp_mst: fix drm_dp_dpcd_read return value checks
      drm: fix whitespace in drm_plane_create_color_properties()

Slark Xiao (1):
      drm: Fix typo 'the the' in comment

Takashi Iwai (4):
      drm/udl: Replace semaphore with a simple wait queue
      drm/udl: Sync pending URBs at suspend / disconnect
      drm/udl: Kill pending URBs at suspend and disconnect
      drm/udl: Replace BUG_ON() with WARN_ON()

Thomas Zimmermann (53):
      fbdev: Remove trailing whitespaces
      fbdev/vga16fb: Create EGA/VGA devices in sysfb code
      fbdev/vga16fb: Auto-generate module init/exit code
      fbdev/core: Remove remove_conflicting_pci_framebuffers()
      fbdev: Convert drivers to aperture helpers
      fbdev: Remove conflicting devices on PCI bus
      video/aperture: Disable and unregister sysfb devices via aperture helpers
      video: Provide constants for VGA I/O range
      video/aperture: Remove conflicting VGA devices, if any
      fbdev: Acquire framebuffer apertures for firmware devices
      fbdev: Remove conflict-handling code
      fbdev: Fix order of arguments to aperture_remove_conflicting_devices()
      drm/vmwgfx: Remove trailing whitespace
      drm/atomic-helper: Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers
      drm/atomic-helper: Remove _HELPER_ infix from DRM_PLANE_HELPER_NO_SCALING
      drm: Remove unnecessary include statements of drm_plane_helper.h
      drm/plane-helper: Export individual helpers
      drm/armada: Use drm_plane_helper_destroy()
      drm/fsl-dcu: Use drm_plane_helper_destroy()
      drm/mgag200: Split mgag200_modeset_init()
      drm/mgag200: Move DAC-register setup into model-specific code
      drm/mgag200: Move ER/EW3 register initialization to per-model code
      drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
      drm/mgag200: Store primary plane's color format in CRTC state
      drm/mgag200: Reorganize before dropping simple-KMS helpers
      drm/mgag200: Replace simple-KMS with regular atomic helpers
      drm/mgag200: Set SCROFF in primary-plane code
      drm/mgag200: Add per-device callbacks
      drm/mgag200: Provide per-device callbacks for BMC synchronization
      drm/mgag200: Provide per-device callbacks for PIXPLLC
      drm/mgag200: Move mode-config to model-specific code
      drm/mgag200: Move CRTC atomic_enable to model-specific code
      drm/mgag200: Remove type field from struct mga_device
      Merge drm/drm-next into drm-misc-next
      drm/simpledrm: Remove mem field from device structure
      drm/simpledrm: Inline device-init helpers
      drm/simpledrm: Remove pdev field from device structure
      drm/simpledrm: Compute framebuffer stride if not set
      drm/simpledrm: Convert to atomic helpers
      iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
      drm/format-helper: Provide drm_fb_blit()
      drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
      drm/format-helper: Convert drm_fb_swab() to struct iosys_map
      drm/format-helper: Rework XRGB8888-to-RGBG332 conversion
      drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
      drm/format-helper: Rework XRGB8888-to-RGB888 conversion
      drm/format-helper: Rework RGB565-to-XRGB8888 conversion
      drm/format-helper: Rework RGB888-to-XRGB8888 conversion
      drm/format-helper: Rework XRGB8888-to-XRGB2101010 conversion
      drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
      drm/format-helper: Rework XRGB8888-to-MONO conversion
      drm/format-helper: Move destination-buffer handling into internal helper
      drm/format-helper: Rename parameter vmap to src

Tom Rix (2):
      drm/nouveau/bios: set info only when the return is not 0
      drm/vmwgfx: cleanup comments

Uwe Kleine-König (3):
      drm/panel: simple: Make panel_simple_remove() return void
      drm/panel-novatek-nt35510: Emit an error message if power off fails
      drm/mipi-dsi: Make remove callback return void

Wang Jingjin (1):
      drm/vc4: Add explicit declaration of 'drmm_of_get_bridge'

XueBing Chen (1):
      dma-buf/sync_file: use strscpy to replace strlcpy

Zack Rusin (2):
      drm/vmwgfx: Remove unused hugepage support
      drm: Remove the drm_get_unmapped_area() helper

Zeng Jingxiang (1):
      gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()

allen chen (3):
      drm/bridge: it6505: Modified power sequence
      drm/bridge: it6505: Add i2c api power on check
      drm/bridge: it6505: Modified video clock calculation and video debug message

pengfuyuan (1):
      drm/arm: Fix spelling typo in comments

shaomin Deng (3):
      drm/mgag200:remove rebundant word "or" in comments
      drm:delete the repeated word "the" in comments
      drm:remove rebundant word "in" in comments

 .../devicetree/bindings/display/ingenic,lcd.yaml   |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/sitronix,st7701.yaml    |    4 +
 Documentation/gpu/drm-kms-helpers.rst              |    8 +-
 Documentation/gpu/drm-mm.rst                       |   16 +-
 Documentation/gpu/todo.rst                         |   36 -
 drivers/dma-buf/sync_file.c                        |    8 +-
 drivers/firmware/sysfb.c                           |    4 +
 drivers/gpu/drm/Kconfig                            |   24 +-
 drivers/gpu/drm/Makefile                           |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   36 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    2 +-
 drivers/gpu/drm/arm/Kconfig                        |    4 +-
 drivers/gpu/drm/arm/display/Kconfig                |    2 +-
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |    3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    5 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +
 .../drm/arm/display/komeda/komeda_framebuffer.c    |   12 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   31 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    2 +
 .../drm/arm/display/komeda/komeda_pipeline_state.c |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |    1 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   11 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   77 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    9 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |    8 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   35 +-
 drivers/gpu/drm/arm/malidp_regs.h                  |    2 +-
 drivers/gpu/drm/armada/armada_crtc.c               |    1 -
 drivers/gpu/drm/armada/armada_gem.c                |    6 +-
 drivers/gpu/drm/armada/armada_overlay.c            |    8 +-
 drivers/gpu/drm/armada/armada_plane.c              |    2 +-
 drivers/gpu/drm/aspeed/Kconfig                     |    2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |   10 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    7 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    9 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |    2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    6 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |    9 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    4 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   23 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    3 +-
 drivers/gpu/drm/bridge/panel.c                     |   74 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |    4 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    4 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    4 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   75 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   47 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |    2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    6 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    1 -
 drivers/gpu/drm/drm_auth.c                         |    4 +-
 drivers/gpu/drm/drm_bridge.c                       |    4 +-
 drivers/gpu/drm/drm_client.c                       |    4 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |    2 +-
 drivers/gpu/drm/drm_connector.c                    |  135 +-
 drivers/gpu/drm/drm_crtc.c                         |   94 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |    1 -
 drivers/gpu/drm/drm_edid.c                         |   52 +-
 drivers/gpu/drm/drm_encoder.c                      |   75 +-
 .../{drm_fb_cma_helper.c =&gt; drm_fb_dma_helper.c}   |   67 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  101 +-
 drivers/gpu/drm/drm_file.c                         |  143 +-
 drivers/gpu/drm/drm_format_helper.c                |  593 ++--
 drivers/gpu/drm/drm_fourcc.c                       |   55 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    4 +-
 .../{drm_gem_cma_helper.c =&gt; drm_gem_dma_helper.c} |  302 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |    6 +-
 drivers/gpu/drm/drm_ioctl.c                        |    8 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   11 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    5 +-
 drivers/gpu/drm/drm_mode_config.c                  |    4 +-
 drivers/gpu/drm/drm_modeset_helper.c               |    8 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   74 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |    1 -
 drivers/gpu/drm/fsl-dcu/Kconfig                    |    2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    7 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c          |    1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   18 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |    2 -
 drivers/gpu/drm/gud/gud_pipe.c                     |   34 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   15 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    3 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    9 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    1 -
 drivers/gpu/drm/i915/display/intel_crtc.c          |    1 -
 drivers/gpu/drm/i915/display/intel_cursor.c        |    5 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    1 -
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   15 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    9 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |    2 +-
 drivers/gpu/drm/i915/intel_pm.c                    |    1 -
 drivers/gpu/drm/imx/Kconfig                        |    2 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |    2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    6 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |   18 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |   10 +-
 drivers/gpu/drm/imx/imx-drm.h                      |    2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |    3 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |   33 +-
 drivers/gpu/drm/ingenic/Kconfig                    |    2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   58 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   17 +-
 drivers/gpu/drm/kmb/Kconfig                        |    2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    6 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |   15 +-
 drivers/gpu/drm/logicvc/Kconfig                    |    4 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c             |    2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   10 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c        |    2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |   11 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c             |    3 +-
 drivers/gpu/drm/mcde/Kconfig                       |    2 +-
 drivers/gpu/drm/mcde/mcde_display.c                |    8 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |   10 +-
 drivers/gpu/drm/mediatek/Kconfig                   |    2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    9 +-
 drivers/gpu/drm/meson/Kconfig                      |    2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   10 +-
 drivers/gpu/drm/meson/meson_overlay.c              |   19 +-
 drivers/gpu/drm/meson/meson_plane.c                |   13 +-
 drivers/gpu/drm/mgag200/Makefile                   |    4 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |   99 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   21 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  208 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |  254 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |  277 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |  181 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |  315 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |  316 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |  192 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |  431 ++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |  326 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  726 ++--
 drivers/gpu/drm/mgag200/mgag200_pll.c              |  997 ------
 drivers/gpu/drm/mgag200/mgag200_reg.h              |    2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    1 -
 drivers/gpu/drm/mxsfb/Kconfig                      |    4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    6 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   13 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   39 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    8 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |    5 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |    5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    1 -
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |    5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |    5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |    1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   13 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    3 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c     |    5 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |    1 -
 drivers/gpu/drm/omapdrm/omap_overlay.c             |    1 -
 drivers/gpu/drm/omapdrm/omap_plane.c               |    1 -
 drivers/gpu/drm/panel/Kconfig                      |    2 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |    4 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |    4 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |    4 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    4 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |    4 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |    4 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    9 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |    4 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    4 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |    4 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |    4 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |    4 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |    4 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |    4 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |    4 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    4 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |    4 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |    4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    9 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |    4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |    4 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    4 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |    4 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |    4 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |    4 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |    4 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    3 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |    4 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |    4 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |    6 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    4 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |    4 +-
 drivers/gpu/drm/panel/panel-simple.c               |   46 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  547 ++-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    4 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |    4 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |    4 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |    3 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    3 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |    4 +-
 drivers/gpu/drm/panfrost/Kconfig                   |    1 +
 drivers/gpu/drm/panfrost/Makefile                  |    3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |  249 ++
 drivers/gpu/drm/panfrost/panfrost_dump.h           |   12 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |    3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   42 +-
 drivers/gpu/drm/pl111/Kconfig                      |    2 +-
 drivers/gpu/drm/pl111/pl111_display.c              |    8 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    9 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |    1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |    4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |    2 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    1 -
 drivers/gpu/drm/radeon/radeon_object.c             |    6 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |    2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    5 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   37 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   15 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |    9 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
 drivers/gpu/drm/scheduler/sched_main.c             |    3 +-
 drivers/gpu/drm/selftests/Makefile                 |    8 -
 drivers/gpu/drm/selftests/drm_buddy_selftests.h    |   15 -
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h  |   68 -
 drivers/gpu/drm/selftests/drm_mm_selftests.h       |   28 -
 drivers/gpu/drm/selftests/drm_modeset_selftests.h  |   40 -
 drivers/gpu/drm/selftests/drm_selftest.c           |  109 -
 drivers/gpu/drm/selftests/drm_selftest.h           |   41 -
 drivers/gpu/drm/selftests/test-drm_buddy.c         |  994 ------
 .../gpu/drm/selftests/test-drm_cmdline_parser.c    | 1141 ------
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |  668 ----
 drivers/gpu/drm/selftests/test-drm_format.c        |  280 --
 .../gpu/drm/selftests/test-drm_modeset_common.c    |   32 -
 .../gpu/drm/selftests/test-drm_modeset_common.h    |   52 -
 drivers/gpu/drm/selftests/test-drm_rect.c          |  223 --
 drivers/gpu/drm/shmobile/Kconfig                   |    2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   15 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |    3 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.h           |    2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   14 +-
 drivers/gpu/drm/sis/sis_drv.c                      |    2 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |   21 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    8 +-
 drivers/gpu/drm/sprd/Kconfig                       |    2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                    |   15 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    6 +-
 drivers/gpu/drm/sti/Kconfig                        |    2 +-
 drivers/gpu/drm/sti/sti_crtc.c                     |    1 -
 drivers/gpu/drm/sti/sti_cursor.c                   |   14 +-
 drivers/gpu/drm/sti/sti_drv.c                      |    7 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   18 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   18 +-
 drivers/gpu/drm/sti/sti_plane.c                    |    3 +-
 drivers/gpu/drm/sti/sti_plane.h                    |    1 -
 drivers/gpu/drm/stm/Kconfig                        |    2 +-
 drivers/gpu/drm/stm/drv.c                          |   11 +-
 drivers/gpu/drm/stm/ltdc.c                         |   17 +-
 drivers/gpu/drm/sun4i/Kconfig                      |   28 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |   17 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    9 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |   26 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |    1 -
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |    4 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   27 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   27 +-
 drivers/gpu/drm/tegra/dc.c                         |    1 -
 drivers/gpu/drm/tegra/fb.c                         |    2 +-
 drivers/gpu/drm/tegra/plane.c                      |    1 -
 drivers/gpu/drm/tests/Makefile                     |    4 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  756 ++++
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    | 1078 ++++++
 drivers/gpu/drm/tests/drm_damage_helper_test.c     |  634 ++++
 .../drm_dp_mst_helper_test.c}                      |   89 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  178 +-
 drivers/gpu/drm/tests/drm_format_test.c            |  299 ++
 .../drm_framebuffer_test.c}                        |   77 +-
 .../test-drm_mm.c =&gt; tests/drm_mm_test.c}          | 1248 +++----
 .../drm_plane_helper_test.c}                       |  155 +-
 drivers/gpu/drm/tests/drm_rect_test.c              |  214 ++
 drivers/gpu/drm/tidss/Kconfig                      |    2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |   28 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    6 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
 drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
 drivers/gpu/drm/tilcdc/Kconfig                     |    2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   10 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    6 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |    1 -
 drivers/gpu/drm/tiny/Kconfig                       |   22 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |   14 +-
 drivers/gpu/drm/tiny/bochs.c                       |   12 +-
 drivers/gpu/drm/tiny/cirrus.c                      |   19 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    6 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    6 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   12 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    6 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    6 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    6 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    6 +-
 drivers/gpu/drm/tiny/repaper.c                     |   16 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  565 +--
 drivers/gpu/drm/tiny/st7586.c                      |   17 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  163 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    7 +-
 drivers/gpu/drm/tve200/Kconfig                     |    2 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   12 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    7 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   14 +-
 drivers/gpu/drm/udl/udl_main.c                     |  125 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    4 +
 drivers/gpu/drm/udl/udl_transfer.c                 |    3 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    1 -
 drivers/gpu/drm/v3d/v3d_gem.c                      |    4 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   12 +-
 drivers/gpu/drm/vc4/Kconfig                        |    3 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   79 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  108 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   72 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  131 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   28 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   65 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  131 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   22 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  684 +++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    3 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  145 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |    1 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |   51 +-
 drivers/gpu/drm/vc4/vc4_render_cl.c                |   40 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   63 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   73 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |   28 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |    2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  216 +-
 drivers/gpu/drm/via/Makefile                       |    2 +-
 drivers/gpu/drm/via/via_3d_reg.h                   |  349 +-
 drivers/gpu/drm/via/via_dma.c                      |  744 ----
 drivers/gpu/drm/via/via_dmablit.c                  |  807 -----
 drivers/gpu/drm/via/via_dmablit.h                  |  140 -
 drivers/gpu/drm/via/via_dri1.c                     | 3630 ++++++++++++++++++++
 drivers/gpu/drm/via/via_drv.c                      |  124 -
 drivers/gpu/drm/via/via_drv.h                      |  229 --
 drivers/gpu/drm/via/via_irq.c                      |  388 ---
 drivers/gpu/drm/via/via_map.c                      |  132 -
 drivers/gpu/drm/via/via_mm.c                       |  241 --
 drivers/gpu/drm/via/via_verifier.c                 | 1110 ------
 drivers/gpu/drm/via/via_verifier.h                 |   62 -
 drivers/gpu/drm/via/via_video.c                    |   94 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   53 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    5 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   23 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   65 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   40 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   21 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |    5 +-
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h |    2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   13 -
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    1 -
 drivers/gpu/drm/xlnx/Kconfig                       |    2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   13 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    8 +-
 drivers/staging/sm750fb/sm750.c                    |   15 +-
 drivers/video/aperture.c                           |   69 +-
 drivers/video/fbdev/arkfb.c                        |    5 +
 drivers/video/fbdev/asiliantfb.c                   |    5 +
 drivers/video/fbdev/aty/aty128fb.c                 |   57 +-
 drivers/video/fbdev/aty/atyfb_base.c               |    7 +-
 drivers/video/fbdev/aty/radeon_base.c              |   83 +-
 drivers/video/fbdev/carminefb.c                    |    5 +
 drivers/video/fbdev/chipsfb.c                      |   13 +-
 drivers/video/fbdev/cirrusfb.c                     |    5 +
 drivers/video/fbdev/core/fbmem.c                   |  219 +-
 drivers/video/fbdev/cyber2000fb.c                  |    5 +
 drivers/video/fbdev/geode/gx1fb_core.c             |    5 +
 drivers/video/fbdev/geode/gxfb_core.c              |    5 +
 drivers/video/fbdev/geode/lxfb_core.c              |    5 +
 drivers/video/fbdev/gxt4500.c                      |    5 +
 drivers/video/fbdev/hyperv_fb.c                    |    6 +-
 drivers/video/fbdev/i740fb.c                       |    5 +
 drivers/video/fbdev/i810/i810_main.c               |  315 +-
 drivers/video/fbdev/imsttfb.c                      |   36 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c           |    5 +
 drivers/video/fbdev/kyro/fbdev.c                   |    5 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |    5 +
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    5 +
 drivers/video/fbdev/neofb.c                        |   41 +-
 drivers/video/fbdev/nvidia/nvidia.c                |    7 +-
 drivers/video/fbdev/pm2fb.c                        |    5 +
 drivers/video/fbdev/pm3fb.c                        |    5 +
 drivers/video/fbdev/pvr2fb.c                       |    5 +
 drivers/video/fbdev/riva/fbdev.c                   |   67 +-
 drivers/video/fbdev/s3fb.c                         |    5 +
 drivers/video/fbdev/savage/savagefb_driver.c       |    5 +
 drivers/video/fbdev/sis/sis_main.c                 |    5 +
 drivers/video/fbdev/skeletonfb.c                   |  210 +-
 drivers/video/fbdev/sm712fb.c                      |    5 +
 drivers/video/fbdev/sstfb.c                        |   43 +-
 drivers/video/fbdev/sunxvr2500.c                   |    5 +
 drivers/video/fbdev/sunxvr500.c                    |    5 +
 drivers/video/fbdev/tdfxfb.c                       |    5 +
 drivers/video/fbdev/tgafb.c                        |   17 +-
 drivers/video/fbdev/tridentfb.c                    |    5 +
 drivers/video/fbdev/vermilion/vermilion.c          |    7 +-
 drivers/video/fbdev/vga16fb.c                      |  191 +-
 drivers/video/fbdev/via/via-core.c                 |    5 +
 drivers/video/fbdev/vt8623fb.c                     |    5 +
 include/drm/drm_atomic_helper.h                    |    9 +
 include/drm/drm_bridge.h                           |   12 +
 include/drm/drm_connector.h                        |   26 +
 include/drm/drm_crtc.h                             |    9 +
 include/drm/drm_encoder.h                          |    6 +
 .../{drm_fb_cma_helper.h =&gt; drm_fb_dma_helper.h}   |   10 +-
 include/drm/drm_file.h                             |    9 -
 include/drm/drm_format_helper.h                    |   56 +-
 include/drm/drm_fourcc.h                           |    4 +
 include/drm/drm_framebuffer.h                      |    8 +-
 include/drm/drm_gem.h                              |    2 +-
 .../{drm_gem_cma_helper.h =&gt; drm_gem_dma_helper.h} |  158 +-
 include/drm/drm_gem_shmem_helper.h                 |    2 +-
 include/drm/drm_mipi_dsi.h                         |    2 +-
 include/drm/drm_plane_helper.h                     |   29 +-
 include/drm/ttm/ttm_bo_api.h                       |   93 +-
 include/linux/dma-resv.h                           |   16 +-
 include/linux/fb.h                                 |   10 -
 include/linux/iosys-map.h                          |   15 +-
 include/uapi/drm/drm_fourcc.h                      |   34 +-
 include/uapi/drm/drm_mode.h                        |    8 +-
 include/uapi/drm/panfrost_drm.h                    |   47 +
 include/video/vga.h                                |   20 +-
 478 files changed, 16283 insertions(+), 14656 deletions(-)
 rename drivers/gpu/drm/{drm_fb_cma_helper.c =&gt; drm_fb_dma_helper.c} (60%)
 rename drivers/gpu/drm/{drm_gem_cma_helper.c =&gt; drm_gem_dma_helper.c} (61%)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h
 delete mode 100644 drivers/gpu/drm/selftests/Makefile
 delete mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
 delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
 create mode 100644 drivers/gpu/drm/tests/drm_buddy_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_cmdline_parser_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_damage_helper_test.c
 rename drivers/gpu/drm/{selftests/test-drm_dp_mst_helper.c =&gt; tests/drm_dp_mst_helper_test.c} (72%)
 create mode 100644 drivers/gpu/drm/tests/drm_format_test.c
 rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c =&gt; tests/drm_framebuffer_test.c} (86%)
 rename drivers/gpu/drm/{selftests/test-drm_mm.c =&gt; tests/drm_mm_test.c} (55%)
 rename drivers/gpu/drm/{selftests/test-drm_plane_helper.c =&gt; tests/drm_plane_helper_test.c} (51%)
 create mode 100644 drivers/gpu/drm/tests/drm_rect_test.c
 delete mode 100644 drivers/gpu/drm/via/via_dma.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.h
 create mode 100644 drivers/gpu/drm/via/via_dri1.c
 delete mode 100644 drivers/gpu/drm/via/via_drv.c
 delete mode 100644 drivers/gpu/drm/via/via_drv.h
 delete mode 100644 drivers/gpu/drm/via/via_irq.c
 delete mode 100644 drivers/gpu/drm/via/via_map.c
 delete mode 100644 drivers/gpu/drm/via/via_mm.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.h
 delete mode 100644 drivers/gpu/drm/via/via_video.c
 rename include/drm/{drm_fb_cma_helper.h =&gt; drm_fb_dma_helper.h} (56%)
 rename include/drm/{drm_gem_cma_helper.h =&gt; drm_gem_dma_helper.h} (53%)

</pre>
  </body>
</html>

--------------zC8RVkorIWM0JbM1S0T5X0ZM--
