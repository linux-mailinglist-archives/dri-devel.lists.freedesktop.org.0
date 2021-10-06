Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BBA423BB5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 12:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66986ED94;
	Wed,  6 Oct 2021 10:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17DA6E50C;
 Wed,  6 Oct 2021 10:48:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="226277805"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="226277805"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 03:48:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="478073596"
Received: from alebede1-mobl1.ccr.corp.intel.com (HELO [10.252.38.139])
 ([10.252.38.139])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 03:48:45 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <2602f4e9-a8ac-83f8-6c2a-39fd9ca2e1ba@linux.intel.com>
Date: Wed, 6 Oct 2021 12:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Handling drm-misc-next this week for Maxime.

drm-misc-next-2021-10-06:
drm-misc-next for v5.16:

UAPI Changes:
- Allow empty drm leases for creating separate GEM namespaces.

Cross-subsystem Changes:
- Slightly rework dma_buf_poll.
- Add dma_resv_for_each_fence_unlocked to iterate, and use it inside
  the lockless dma-resv functions.

Core Changes:
- Allow devm_drm_of_get_bridge to build without CONFIG_OF for compile testing.
- Add more DP2 headers.
- fix CONFIG_FB dependency in fb_helper.
- Add DRM_FORMAT_R8 to drm_format_info, and helpers for RGB332 and RGB888.
- Fix crash on a 0 or invalid EDID.

Driver Changes:
- Apply and revert DRM_MODESET_LOCK_ALL_BEGIN.
- Add mode_valid to ti-sn65dsi86 bridge.
- Support multiple syncobjs in v3d.
- Add R8, RGB332 and RGB888 pixel formats to GUD.
- Use devm_add_action_or_reset in dw-hdmi-cec.
The following changes since commit 9c2fce137852e6434ca0c6fe3d75e00feb168c07:

  drm: Fix scaling_mode docs (2021-09-22 22:11:53 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-10-06

for you to fetch changes up to 9962601ca5719050906915c3c33a63744ac7b15c:

  drm/bridge: dw-hdmi-cec: Make use of the helper function devm_add_action_or_reset() (2021-10-06 11:21:46 +0200)

----------------------------------------------------------------
drm-misc-next for v5.16:

UAPI Changes:
- Allow empty drm leases for creating separate GEM namespaces.

Cross-subsystem Changes:
- Slightly rework dma_buf_poll.
- Add dma_resv_for_each_fence_unlocked to iterate, and use it inside
  the lockless dma-resv functions.

Core Changes:
- Allow devm_drm_of_get_bridge to build without CONFIG_OF for compile testing.
- Add more DP2 headers.
- fix CONFIG_FB dependency in fb_helper.
- Add DRM_FORMAT_R8 to drm_format_info, and helpers for RGB332 and RGB888.
- Fix crash on a 0 or invalid EDID.

Driver Changes:
- Apply and revert DRM_MODESET_LOCK_ALL_BEGIN.
- Add mode_valid to ti-sn65dsi86 bridge.
- Support multiple syncobjs in v3d.
- Add R8, RGB332 and RGB888 pixel formats to GUD.
- Use devm_add_action_or_reset in dw-hdmi-cec.

----------------------------------------------------------------
Anthoine Bourgeois (2):
      drm/virtio: implement context init: probe for feature
      drm/virtio: implement context init: support init ioctl

Arnd Bergmann (1):
      drm: fb_helper: fix CONFIG_FB dependency

Cai Huoqing (1):
      drm/bridge: dw-hdmi-cec: Make use of the helper function devm_add_action_or_reset()

Christian König (7):
      drm/msm: allow compile_test on !ARM
      dma-buf: fix and rework dma_buf_poll v7
      dma-buf: add dma_resv_for_each_fence_unlocked v8
      dma-buf: use new iterator in dma_resv_copy_fences
      dma-buf: use new iterator in dma_resv_get_fences v3
      dma-buf: use new iterator in dma_resv_wait_timeout
      dma-buf: use new iterator in dma_resv_test_signaled

Douglas Anderson (4):
      drm/edid: Fix EDID quirk compile error on older compilers
      drm/print: Add deprecation notes to DRM_...() functions
      drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
      drm/edid: Fix crash with zero/invalid EDID

Fangzhi Zuo (1):
      drm/dp: Add Additional DP2 Headers

Fernando Ramos (17):
      drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
      drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
      drm: cleanup: remove drm_modeset_(un)lock_all()
      doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup

Gurchetan Singh (10):
      virtio-gpu api: multiple context types with explicit initialization
      drm/virtgpu api: create context init feature
      drm/virtio: implement context init: track valid capabilities in a mask
      drm/virtio: implement context init: track {ring_idx, emit_fence_info} in virtio_gpu_fence
      drm/virtio: implement context init: plumb {base_fence_ctx, ring_idx} to virtio_gpu_fence_alloc
      drm/virtio: implement context init: stop using drv->context when creating fence
      drm/virtio: implement context init: allocate an array of fence contexts
      drm/virtio: implement context init: handle VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
      drm/virtio: implement context init: add virtio_gpu_fence_event
      drm/virtio: implement context init: advertise feature to userspace

Matthew Auld (7):
      drm/ttm: stop calling tt_swapin in vm_access
      drm/ttm: stop setting page->index for the ttm_tt
      drm/ttm: move ttm_tt_{add, clear}_mapping into amdgpu
      drm/ttm: remove TTM_PAGE_FLAG_NO_RETRY
      drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
      drm/ttm: add some kernel-doc for TTM_TT_FLAG_*
      drm/ttm: add TTM_TT_FLAG_EXTERNAL_MAPPABLE

Maxime Ripard (8):
      drm/bridge: Add documentation sections
      drm/bridge: Document the probe issue with MIPI-DSI bridges
      drm/mipi-dsi: Create devm device registration
      drm/mipi-dsi: Create devm device attachment
      drm/probe-helper: Document drm_helper_hpd_irq_event() return value
      drm/probe-helper: Create a HPD IRQ event helper for a single connector
      drm/vc4: hdmi: Actually check for the connector status in hotplug
      drm/bridge: Add stubs for devm_drm_of_get_bridge when OF is disabled

Melissa Wen (4):
      drm/v3d: decouple adding job dependencies steps from job init
      drm/v3d: alloc and init job in one shot
      drm/v3d: add generic ioctl extension
      drm/v3d: add multiple syncobjs support

Noralf Trønnes (6):
      drm/fourcc: Add R8 to drm_format_info
      drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
      drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
      drm/gud: Add GUD_PIXEL_FORMAT_R8
      drm/gud: Add GUD_PIXEL_FORMAT_RGB332
      drm/gud: Add GUD_PIXEL_FORMAT_RGB888

Philip Chen (2):
      drm/bridge: parade-ps8640: Use regmap APIs
      drm/bridge: parade-ps8640: Add support for AUX channel

Rob Clark (1):
      drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()

Sean Paul (16):
      Revert "drm: cleanup: remove drm_modeset_(un)lock_all()"
      Revert "drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2"
      Revert "drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
      Revert "drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"

Simon Ser (1):
      drm/lease: allow empty leases

Thomas Zimmermann (10):
      lib: devres: Add managed arch_phys_wc_add()
      lib: devres: Add managed arch_io_reserve_memtype_wc()
      drm/ast: Use managed interfaces for framebuffer write combining
      drm/mgag200: Use managed interfaces for framebuffer write combining
      drm/vboxvideo: Use managed interfaces for framebuffer write combining
      drm/gma500: Replace references to dev_private with helper function
      drm/gma500: Disable PCI device during shutdown
      drm/gma500: Embed struct drm_device in struct drm_psb_private
      drm/gma500: Remove dev_priv branch from unload function
      drm/gma500: Managed device release

Yang Yingliang (1):
      drm/gma500: Fix wrong pointer passed to PTR_ERR()

yangcong (4):
      dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
      drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
      dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3 and inx hj110iz-01a
      drm/panel: support for BOE and INX video mode panel

 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |   7 +
 Documentation/gpu/drm-kms-helpers.rst              |  12 +
 Documentation/gpu/todo.rst                         |  17 -
 Documentation/locking/ww-mutex-design.rst          |   2 +-
 drivers/dma-buf/dma-buf.c                          | 152 ++---
 drivers/dma-buf/dma-resv.c                         | 418 +++++-------
 drivers/gpu/drm/Kconfig                            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  25 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   2 -
 drivers/gpu/drm/ast/ast_mm.c                       |  27 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             | 274 +++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  25 +-
 drivers/gpu/drm/drm_bridge.c                       |  71 +-
 drivers/gpu/drm/drm_edid.c                         | 148 ++--
 drivers/gpu/drm/drm_format_helper.c                |  88 +++
 drivers/gpu/drm/drm_fourcc.c                       |   1 +
 drivers/gpu/drm/drm_lease.c                        |  39 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |  81 +++
 drivers/gpu/drm/drm_probe_helper.c                 | 119 +++-
 drivers/gpu/drm/gma500/backlight.c                 |  12 +-
 drivers/gpu/drm/gma500/cdv_device.c                |  24 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |  10 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |  12 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  22 +-
 drivers/gpu/drm/gma500/framebuffer.c               |  16 +-
 drivers/gpu/drm/gma500/gem.c                       |   2 +-
 drivers/gpu/drm/gma500/gma_device.c                |   2 +-
 drivers/gpu/drm/gma500/gma_display.c               |  14 +-
 drivers/gpu/drm/gma500/gtt.c                       |  18 +-
 drivers/gpu/drm/gma500/intel_bios.c                |  10 +-
 drivers/gpu/drm/gma500/intel_gmbus.c               |  12 +-
 drivers/gpu/drm/gma500/mid_bios.c                  |  11 +-
 drivers/gpu/drm/gma500/mmu.c                       |  12 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |   8 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |  20 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |  18 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |  14 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |   2 +-
 drivers/gpu/drm/gma500/opregion.c                  |  14 +-
 drivers/gpu/drm/gma500/power.c                     |  20 +-
 drivers/gpu/drm/gma500/psb_device.c                |  16 +-
 drivers/gpu/drm/gma500/psb_drv.c                   | 147 ++--
 drivers/gpu/drm/gma500/psb_drv.h                   |  24 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |  10 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |  31 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  10 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  26 +-
 drivers/gpu/drm/gma500/psb_lid.c                   |   2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   6 +
 drivers/gpu/drm/gud/gud_internal.h                 |  12 +
 drivers/gpu/drm/gud/gud_pipe.c                     |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   6 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   2 -
 drivers/gpu/drm/mgag200/mgag200_mm.c               |  35 +-
 drivers/gpu/drm/msm/Kconfig                        |   4 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 743 ++++++++++++++++++++-
 drivers/gpu/drm/panel/panel-edp.c                  |  23 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  15 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  54 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  10 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  24 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      | 390 ++++++++---
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   5 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |   1 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |  17 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |  44 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  28 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |  30 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             | 195 +++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |  26 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   3 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  19 +-
 include/drm/drm_bridge.h                           |  23 +-
 include/drm/drm_dp_helper.h                        |  20 +
 include/drm/drm_edid.h                             |  14 +-
 include/drm/drm_format_helper.h                    |   4 +
 include/drm/drm_mipi_dsi.h                         |   4 +
 include/drm/drm_print.h                            |  30 +
 include/drm/drm_probe_helper.h                     |   1 +
 include/drm/gud.h                                  |   6 +-
 include/drm/ttm/ttm_device.h                       |   2 +-
 include/drm/ttm/ttm_tt.h                           |  82 ++-
 include/linux/dma-buf.h                            |   2 +-
 include/linux/dma-resv.h                           |  95 +++
 include/linux/io.h                                 |   5 +
 include/uapi/drm/drm_mode.h                        |   3 +-
 include/uapi/drm/v3d_drm.h                         |  78 +++
 include/uapi/drm/virtgpu_drm.h                     |  27 +
 include/uapi/linux/virtio_gpu.h                    |  18 +-
 lib/devres.c                                       |  82 +++
 99 files changed, 3148 insertions(+), 1131 deletions(-)
