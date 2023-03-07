Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A76ADB8A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A757F10E113;
	Tue,  7 Mar 2023 10:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4D210E0FD;
 Tue,  7 Mar 2023 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678184101; x=1709720101;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=y/0485fu39kmHHomQmrCRTYSMh4OCzigYeoUbgnE23o=;
 b=oDxoCNl0O7e2gqA2FLZgo2/y9a6AUfptAFV0CXrDKyyxG464z4yo/Sve
 sbAktFPK7lTuK73dDuPTdgGjhC7/6nCeB0tQIFjxv0q0lK9aSX4Kldypy
 tfq9K94ONrHEyGh61VgXwLH6I6XjcdZxY2C/2R3hO5a00KR3g143iI6ub
 yWQ9MqZqQCMv2J0X7kNxRWwKL8e3HtWh4ENE+VBOkjitoeDHCGr6Wb8nW
 FBU6jUGlx5DKQYNJZbnKlT32QiyRwq14kMXNvO24E5Um6jvflcJSlxlyY
 7kpDpDHE0L0IjU/Lr2kxzXQEG5TosWlo8H/rN8Hw1EP9RaqBFGqM56One A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315467625"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
 d="scan'208,217";a="315467625"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708998481"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
 d="scan'208,217";a="708998481"
Received: from szymansk-mobl1.ger.corp.intel.com (HELO [10.249.43.98])
 ([10.249.43.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:14:56 -0800
Content-Type: multipart/alternative;
 boundary="------------CkLPkpAqpkmxCX2Tle66aEoP"
Message-ID: <ac1f5186-54bb-02f4-ac56-907f5b76f3de@linux.intel.com>
Date: Tue, 7 Mar 2023 11:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------CkLPkpAqpkmxCX2Tle66aEoP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,

I apparently didn't send my 2023-02-23 pull request or at least don't see it on dri-devel, so I added both shortlogs here.

Enjoy!
~Maarten

drm-misc-next-2023-03-07:
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Add Neil Armstrong as linaro maintainer.

Core Changes:
- Add function for adding syncobj dep to sched_job and use it in panfrost, v3d.
- Improve DisplayID 2.0 topology parsing and EDID parsing in general.
- Add a gem eviction function and callback for generic GEM shrinker
   purposes.
- Prepare to convert shmem helper to use the GEM reservation lock instead of own
   locking. (Actual commit itself got reverted for now)
- Move the suballocator from radeon and amdgpu drivers to core in preparation
   for Xe.
- Assorted small fixes and documentation.

Driver Changes:
- Use drm_gem_objects_lookup in vc4.
- Assorted small fixes to virtio, ast, bridge/tc358762, meson, nouveau.
- Allow virtio KMS to be disabled and compiled out.

--------------------
drm-misc-next-2023-02-23:
drm-misc-next for v6.4-rc1: First pull request to keep the delta from 
growing too big. UAPI Changes: - Convert rockchip bindings to YAML. - 
Constify kobj_type structure in dma-buf. - FBDEV cmdline parser fixes, 
and other small fbdev fixes for mode  parsing. Cross-subsystem Changes: 
- Actually signal the private stub dma-fence. Core Changes: - Fixes to 
HPD polling. - Assorted small fixes in simpledrm, bridge, accel, 
shmem-helper,  and the selftest of format-helper. - Remove dummy 
resource when ttm bo is created, and during pipelined  gutting. Fix all 
drivers to accept a NULL ttm_bo->resource. - Handle pinned BO moving 
prevention in ttm core. - Set drm panel-bridge orientation before 
connector is registered. - Remove dumb_destroy callback. - Add 
documentation to GEM_CLOSE, PRIME_HANDLE_TO_FD, PRIME_FD_TO_HANDLE, 
GETFB2 ioctl's. - Add atomic enable_plane callback, use it in ast, 
mgag200, tidss. Driver Changes: - Add Radxa 8/10HD, Samsung AMS495QA01 
panels. - Fix ivpu compiler errors. - Assorted fixes to drm/panel, 
malidp, rockchip, ivpu, amdgpu, vgem,  nouveau, vc4. - Assorted 
cleanups, simplifications and fixes to vmwgfx.
--------------------

The following changes since commit aebd8f0c6f8280ba35bc989f4a9ea47469d3589a:

   Merge v6.2-rc6 into drm-next (2023-01-31 12:23:23 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-07

for you to fetch changes up to 9228742caf899fa72230dd8da19ca4c7528badb8:

   drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks (2023-03-06 19:42:50 -0500)

----------------------------------------------------------------
Andrzej Kacprowski (2):
       accel/ivpu: Fix FW API data alignment issues
       accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

Arnd Bergmann (3):
       accel/ivpu: PM: remove broken ivpu_dbg() statements
       accel: fix CONFIG_DRM dependencies
       accel/ivpu: avoid duplicate assignment

Asahi Lina (1):
       drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()

Brian Norris (1):
       drm/rockchip: vop: Quiet always-warning AFBC log

Carlo Caione (1):
       drm/meson/meson_venc: Relax the supported mode checks

Chris Morgan (3):
       drm: of: Add drm_of_get_dsi_bus helper function
       dt-bindings: display: panel: Add Samsung AMS495QA01
       drm/panel: Add Magnachip D53E6EA8966 Panel Driver

Christian König (4):
       drm/ttm: stop allocating dummy resources during BO creation
       drm/ttm: stop allocating a dummy resource for pipelined gutting
       drm/ttm: prevent moving of pinned BOs
       drm: remove dumb_destroy callback

Dan Carpenter (1):
       drm/simpledrm: Fix an NULL vs IS_ERR() bug

Danilo Krummrich (1):
       dma-buf: actually set signaling bit for private stub fences

Deepak R Varma (2):
       drm/arm/malidp: use sysfs_emit in show function callback
       drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks

Dmitry Baryshkov (2):
       drm/probe_helper: extract two helper functions
       drm/probe_helper: sort out poll_running vs poll_enabled

Dmitry Osipenko (6):
       drm/gem: Add evict() callback to drm_gem_object_funcs
       drm/shmem-helper: Put booleans in the end of struct drm_gem_shmem_object
       drm/shmem-helper: Switch to use drm_* debug helpers
       drm/shmem-helper: Don't use vmap_use_count for dma-bufs
       drm/shmem-helper: Switch to reservation lock
       drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS option

Dom Cobley (1):
       drm/probe-helper: Cancel previous job before starting new one

Douglas Anderson (1):
       drm/bridge: tc358762: Set pre_enable_prev_first

Geert Uytterhoeven (1):
       drivers: Restore alignment and newline in Makefile

Harry Wentland (2):
       drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
       drm/connector: print max_requested_bpc in state debugfs

Jagan Teki (4):
       dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 10HD
       drm: panel: jd9365da-h3: Add Radxa Display 10HD
       dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 8HD
       drm: panel: jd9365da-h3: Add Radxa Display 8HD

Jani Nikula (5):
       drm/displayid: add displayid_get_header() and check bounds better
       drm/displayid: return struct displayid_header from validate_displayid()
       drm/displayid: provide access to DisplayID version and primary use case
       drm/edid: update non-desktop use also from DisplayID
       drm/edid: parse Tiled Display Topology Data Block for DisplayID 2.0

Jiri Slaby (SUSE) (1):
       drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype

Johan Jonker (7):
       dt-bindings: display: rockchip: convert rockchip-lvds.txt to YAML
       dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
       dt-bindings: display: dsi-controller: move clock-master property
       dt-bindings: display: bridge: snps,dw-mipi-dsi: fix clock properties
       dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to yaml
       dt-bindings: display: bridge: convert analogix_dp.txt to yaml
       dt-bindings: display: rockchip: convert analogix_dp-rockchip.txt to yaml

John Keeping (2):
       drm/rockchip: avoid duplicate mappings for IOMMU devices
       drm/bridge: panel: Set orientation on panel_bridge connector

Maarten Lankhorst (3):
       drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
       drm/amd: Convert amdgpu to use suballocation helper.
       drm/radeon: Use the drm suballocation manager implementation.

Matthew Auld (6):
       drm/i915/ttm: fix sparse warning
       drm/i915/ttm: audit remaining bo->resource
       drm/ttm: clear the ttm_tt when bo->resource is NULL
       drm/gem-vram: handle NULL bo->resource in move callback
       drm/qxl: handle NULL bo->resource in move callback
       drm/radeon: handle NULL bo->resource in move callback

Maxime Ripard (4):
       drm/vc4: hdmi: Replace hardcoded value by define
       drm/vc4: hdmi: Enable power domain before setting minimum
       Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
       Revert "drm/vc4: hdmi: Enforce the minimum rate at runtime_resume"

Maíra Canal (8):
       drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
       drm/vgem: add missing mutex_destroy
       drm/sched: Create wrapper to add a syncobj dependency to job
       drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
       drm/v3d: Use drm_sched_job_add_syncobj_dependency()
       drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
       drm/vc4: replace obj lookup steps with drm_gem_objects_lookup
       dma-buf: Include missing parentheses to documentation

Michael Riesch (5):
       drm/rockchip: vop2: initialize possible_crtcs properly
       drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
       drm/rockchip: rgb: add video_port parameter to init function
       drm/rockchip: vop2: use symmetric function pair vop2_{create,destroy}_crtcs
       drm/rockchip: vop2: add support for the rgb output block

Neil Armstrong (1):
       MAINTAINERS: Add myself as maintainer for DRM Panels drivers

Randy Dunlap (1):
       drm/bridge: Kconfig: fix a spelling mistake

Rayyan Ansari (2):
       drm/simpledrm: Allow physical width and height configuration via panel node
       dt-bindings: display: simple-framebuffer: Document the panel node

Rob Clark (3):
       drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
       drm/rockchip: Drop unbalanced obj unref
       drm/virtio: Add option to disable KMS support

Simon Ser (5):
       drm: document DRM_IOCTL_GEM_CLOSE
       drm: document expectations for GETFB2 handles
       drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and PRIME_FD_TO_HANDLE
       drm: document connector margin properties
       drm: remove outdated doc TODO for subconnector property

Somalapuram Amaranath (1):
       drm/amdgpu: Remove TTM resource->start visible VRAM condition v2

Stanislaw Gruszka (2):
       accel/ivpu: Set dma max_segment_size
       accel/ivpu: Fix old dma_buf api usage

Stephen Boyd (1):
       drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable

Thomas Weißschuh (2):
       drm/nouveau/led: explicitly include linux/leds.h
       dma-buf: make kobj_type structure constant

Thomas Zimmermann (23):
       Merge drm/drm-next into drm-misc-next
       fbdev: Fix contact info in fb_cmdline.c
       fbdev: Transfer video= option strings to caller; clarify ownership
       fbdev: Support NULL for name in option-string lookup
       drivers/ps3: Read video= option with fb_get_option()
       fbdev: Read video= option with fb_get_option() in modedb
       fbdev: Unexport fb_mode_option
       fbdev: Move option-string lookup into helper
       fbdev: Handle video= parameter in video/cmdline.c
       driver/ps3: Include <video/cmdline.h> for mode parsing
       drm: Include <video/cmdline.h> for mode parsing
       drm: Fix comment on mode parsing
       drm/atomic-helper: Add atomic_enable plane-helper callback
       drm/ast: Implement struct drm_plane_helper_funcs.atomic_enable
       drm/mgag200: Remove disable handling from atomic_update
       drm/mgag200: Implement struct drm_plane_helper_funcs.atomic_enable
       drm/tidss: Remove return values from dispc_plane_{setup, enable}()
       drm/tidss: Implement struct drm_plane_helper_funcs.atomic_enable
       Revert "drm/shmem-helper: Switch to reservation lock"
       drm/ast: Remove little-endianism from I/O helpers
       drm/ast: Rework definition of I/O read and write helpers
       drm/ast: Rename struct ast_private to struct ast_device
       drm/ast: Rename to_ast_private() to to_ast_device()

Ville Syrjälä (1):
       drm/edid: Fix csync detailed mode parsing

Xu Panda (1):
       drm/virtio: use strscpy() to instead of strncpy()

Zack Rusin (11):
       drm/vmwgfx: Use the common gem mmap instead of the custom code
       drm/vmwgfx: Remove the duplicate bo_free function
       drm/vmwgfx: Rename vmw_buffer_object to vmw_bo
       drm/vmwgfx: Simplify fb pinning
       drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
       drm/vmwgfx: Rename dummy to is_iomem
       drm/vmwgfx: Abstract placement selection
       drm/vmwgfx: Stop using raw ttm_buffer_object's
       drm/vmwgfx: Make the driver work without the dummy resources
       drm/vmwgfx: Stop accessing buffer objects which failed init
       drm/vmwgfx: Do not drop the reference to the handle too soon

suijingfeng (1):
       ttm/ttm_device.h: fix a trival typo

  .../bindings/display/bridge/analogix,dp.yaml       |  63 +++
  .../bindings/display/bridge/analogix_dp.txt        |  51 --
  .../bindings/display/bridge/snps,dw-mipi-dsi.yaml  |  16 +-
  .../bindings/display/dsi-controller.yaml           |  18 +-
  .../bindings/display/exynos/exynos_dp.txt          |   2 +-
  .../bindings/display/panel/jadard,jd9365da-h3.yaml |   2 +
  .../bindings/display/panel/samsung,ams495qa01.yaml |  57 +++
  .../display/rockchip/analogix_dp-rockchip.txt      |  98 ----
  .../display/rockchip/dw_mipi_dsi_rockchip.txt      |  94 ----
  .../display/rockchip/rockchip,analogix-dp.yaml     | 103 ++++
  .../display/rockchip/rockchip,dw-mipi-dsi.yaml     | 166 +++++++
  .../bindings/display/rockchip/rockchip,lvds.yaml   | 170 +++++++
  .../bindings/display/rockchip/rockchip-lvds.txt    |  92 ----
  .../bindings/display/simple-framebuffer.yaml       |   9 +
  .../devicetree/bindings/soc/rockchip/grf.yaml      |  10 +-
  MAINTAINERS                                        |   2 +-
  drivers/accel/Kconfig                              |   5 +-
  drivers/accel/ivpu/ivpu_drv.c                      |   3 +-
  drivers/accel/ivpu/ivpu_fw.c                       |  37 +-
  drivers/accel/ivpu/ivpu_gem.c                      |   8 +-
  drivers/accel/ivpu/ivpu_job.c                      |   5 +-
  drivers/accel/ivpu/ivpu_jsm_msg.c                  |  11 +
  drivers/accel/ivpu/ivpu_jsm_msg.h                  |   2 +-
  drivers/accel/ivpu/ivpu_pm.c                       |  10 -
  drivers/accel/ivpu/vpu_jsm_api.h                   |  67 +--
  drivers/dma-buf/dma-buf-sysfs-stats.c              |   2 +-
  drivers/dma-buf/dma-buf.c                          |   2 +-
  drivers/dma-buf/dma-fence.c                        |   2 +-
  drivers/gpu/drm/Kconfig                            |   6 +-
  drivers/gpu/drm/Makefile                           |   3 +
  drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  26 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   5 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   9 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  23 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   3 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             | 324 +------------
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 -
  drivers/gpu/drm/arm/malidp_drv.c                   |   2 +-
  drivers/gpu/drm/ast/ast_dp.c                       |  10 +-
  drivers/gpu/drm/ast/ast_dp501.c                    |  40 +-
  drivers/gpu/drm/ast/ast_drv.c                      |   2 +-
  drivers/gpu/drm/ast/ast_drv.h                      |  84 ++--
  drivers/gpu/drm/ast/ast_i2c.c                      |   8 +-
  drivers/gpu/drm/ast/ast_main.c                     |  24 +-
  drivers/gpu/drm/ast/ast_mm.c                       |   4 +-
  drivers/gpu/drm/ast/ast_mode.c                     | 104 ++--
  drivers/gpu/drm/ast/ast_post.c                     |  94 ++--
  drivers/gpu/drm/bridge/Kconfig                     |   2 +-
  drivers/gpu/drm/bridge/panel.c                     |   2 +
  drivers/gpu/drm/bridge/tc358762.c                  |   1 +
  drivers/gpu/drm/display/drm_hdmi_helper.c          |   6 +-
  drivers/gpu/drm/drm_atomic.c                       |   1 +
  drivers/gpu/drm/drm_atomic_helper.c                |  20 +-
  drivers/gpu/drm/drm_connector.c                    |  28 +-
  drivers/gpu/drm/drm_displayid.c                    |  62 ++-
  drivers/gpu/drm/drm_dumb_buffers.c                 |   5 +-
  drivers/gpu/drm/drm_edid.c                         |  65 ++-
  drivers/gpu/drm/drm_gem.c                          |  25 +-
  drivers/gpu/drm/drm_gem_shmem_helper.c             | 132 +++---
  drivers/gpu/drm/drm_gem_vram_helper.c              |  11 +
  drivers/gpu/drm/drm_internal.h                     |   3 -
  drivers/gpu/drm/drm_modes.c                        |   3 +-
  drivers/gpu/drm/drm_of.c                           |  51 ++
  drivers/gpu/drm/drm_probe_helper.c                 | 113 +++--
  drivers/gpu/drm/drm_suballoc.c                     | 457 ++++++++++++++++++
  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  15 +-
  drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   2 +-
  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   4 +
  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   7 +-
  drivers/gpu/drm/meson/meson_venc.c                 |   4 +-
  drivers/gpu/drm/mgag200/mgag200_drv.h              |   3 +
  drivers/gpu/drm/mgag200/mgag200_mode.c             |  22 +-
  drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   5 +-
  drivers/gpu/drm/nouveau/nouveau_bo.c               |   3 -
  drivers/gpu/drm/nouveau/nouveau_hwmon.c            |  10 +-
  drivers/gpu/drm/nouveau/nouveau_led.h              |   2 +-
  drivers/gpu/drm/panel/Kconfig                      |  11 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  16 +-
  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 209 ++++++++-
  .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    | 522 +++++++++++++++++++++
  drivers/gpu/drm/panfrost/panfrost_drv.c            |  11 +-
  drivers/gpu/drm/qxl/qxl_ttm.c                      |  11 +
  drivers/gpu/drm/radeon/Kconfig                     |   1 +
  drivers/gpu/drm/radeon/radeon.h                    |  55 +--
  drivers/gpu/drm/radeon/radeon_ib.c                 |  12 +-
  drivers/gpu/drm/radeon/radeon_object.h             |  25 +-
  drivers/gpu/drm/radeon/radeon_sa.c                 | 316 +------------
  drivers/gpu/drm/radeon/radeon_semaphore.c          |   4 +-
  drivers/gpu/drm/radeon/radeon_ttm.c                |   7 +-
  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |  16 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   7 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  80 +++-
  drivers/gpu/drm/rockchip/rockchip_rgb.c            |  19 +-
  drivers/gpu/drm/rockchip/rockchip_rgb.h            |   6 +-
  drivers/gpu/drm/scheduler/sched_main.c             |  29 ++
  drivers/gpu/drm/tests/drm_format_helper_test.c     |  10 +-
  drivers/gpu/drm/tidss/tidss_dispc.c                |  12 +-
  drivers/gpu/drm/tidss/tidss_dispc.h                |   8 +-
  drivers/gpu/drm/tidss/tidss_plane.c                |  20 +-
  drivers/gpu/drm/tiny/simpledrm.c                   |  35 +-
  drivers/gpu/drm/ttm/ttm_bo.c                       |  30 +-
  drivers/gpu/drm/ttm/ttm_bo_util.c                  |  19 +-
  drivers/gpu/drm/ttm/ttm_resource.c                 |   1 -
  drivers/gpu/drm/v3d/v3d_gem.c                      |  26 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +-
  drivers/gpu/drm/vc4/vc4_gem.c                      |  78 +--
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  46 +-
  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
  drivers/gpu/drm/vc4/vc4_validate.c                 |   4 +-
  drivers/gpu/drm/vgem/vgem_fence.c                  |   1 +
  drivers/gpu/drm/virtio/Kconfig                     |  11 +
  drivers/gpu/drm/virtio/virtgpu_display.c           |   6 +
  drivers/gpu/drm/virtio/virtgpu_drv.c               |   4 +
  drivers/gpu/drm/virtio/virtgpu_kms.c               |  39 +-
  drivers/gpu/drm/virtio/virtgpu_vq.c                |   3 +-
  drivers/gpu/drm/vmwgfx/Makefile                    |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 | 413 ++++++++--------
  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 | 203 ++++++++
  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |  14 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |  53 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |  36 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |  65 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  26 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                | 245 ++--------
  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            | 103 ++--
  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  95 ++--
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 234 ++++-----
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  43 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  57 ++-
  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |  45 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |  21 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |  68 ++-
  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           | 246 +++++-----
  drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h      |  10 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  53 ++-
  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |  66 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |   6 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               | 323 ++-----------
  drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |  20 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            | 115 ++---
  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         | 134 ++----
  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           | 110 -----
  drivers/gpu/drm/vmwgfx/vmwgfx_va.c                 |   6 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         | 150 +++---
  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |  10 +-
  drivers/ps3/ps3av.c                                |   9 +-
  drivers/video/Kconfig                              |   3 +
  drivers/video/Makefile                             |   1 +
  drivers/video/cmdline.c                            | 133 ++++++
  drivers/video/fbdev/Kconfig                        |   5 +-
  drivers/video/fbdev/core/Makefile                  |   3 +-
  drivers/video/fbdev/core/fb_cmdline.c              |  94 +---
  drivers/video/fbdev/core/modedb.c                  |   8 +-
  include/drm/drm_atomic_helper.h                    |  26 +
  include/drm/drm_displayid.h                        |  12 +-
  include/drm/drm_drv.h                              |  19 -
  include/drm/drm_edid.h                             |  12 +-
  include/drm/drm_gem.h                              |  12 +
  include/drm/drm_gem_shmem_helper.h                 |  30 +-
  include/drm/drm_modeset_helper_vtables.h           |  29 +-
  include/drm/drm_of.h                               |  12 +
  include/drm/drm_suballoc.h                         | 108 +++++
  include/drm/gpu_scheduler.h                        |   6 +
  include/drm/ttm/ttm_device.h                       |   2 +-
  include/linux/fb.h                                 |   1 -
  include/uapi/drm/drm.h                             |  57 ++-
  include/video/cmdline.h                            |  20 +
  170 files changed, 4650 insertions(+), 3587 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
  delete mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
  create mode 100644 drivers/gpu/drm/drm_suballoc.c
  create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
  delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
  create mode 100644 drivers/video/cmdline.c
  create mode 100644 include/drm/drm_suballoc.h
  create mode 100644 include/video/cmdline.h

--------------CkLPkpAqpkmxCX2Tle66aEoP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Dave, Daniel,

I apparently didn't send my 2023-02-23 pull request or at least don't see it on dri-devel, so I added both shortlogs here.

Enjoy!
~Maarten

drm-misc-next-2023-03-07:
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Add Neil Armstrong as linaro maintainer.

Core Changes:
- Add function for adding syncobj dep to sched_job and use it in panfrost, v3d.
- Improve DisplayID 2.0 topology parsing and EDID parsing in general.
- Add a gem eviction function and callback for generic GEM shrinker
  purposes.
- Prepare to convert shmem helper to use the GEM reservation lock instead of own
  locking. (Actual commit itself got reverted for now)
- Move the suballocator from radeon and amdgpu drivers to core in preparation
  for Xe.
- Assorted small fixes and documentation.

Driver Changes:
- Use drm_gem_objects_lookup in vc4.
- Assorted small fixes to virtio, ast, bridge/tc358762, meson, nouveau.
- Allow virtio KMS to be disabled and compiled out.

--------------------
drm-misc-next-2023-02-23:
<span style="font-family:monospace"><span style="color:#000000;background-color:#ffffff;">drm-misc-next for v6.4-rc1:
</span>
First pull request to keep the delta from growing too big.

UAPI Changes:
- Convert rockchip bindings to YAML.
- Constify kobj_type structure in dma-buf.
- FBDEV cmdline parser fixes, and other small fbdev fixes for mode
  parsing.

Cross-subsystem Changes:
- Actually signal the private stub dma-fence.

Core Changes:
- Fixes to HPD polling.
- Assorted small fixes in simpledrm, bridge, accel, shmem-helper,
  and the selftest of format-helper.
- Remove dummy resource when ttm bo is created, and during pipelined
  gutting. Fix all drivers to accept a NULL ttm_bo-&gt;resource.
- Handle pinned BO moving prevention in ttm core.
- Set drm panel-bridge orientation before connector is registered.
- Remove dumb_destroy callback.
- Add documentation to GEM_CLOSE, PRIME_HANDLE_TO_FD, PRIME_FD_TO_HANDLE, GETFB2 ioctl's.
- Add atomic enable_plane callback, use it in ast, mgag200, tidss.

Driver Changes:
- Add Radxa 8/10HD, Samsung AMS495QA01 panels.
- Fix ivpu compiler errors.
- Assorted fixes to drm/panel, malidp, rockchip, ivpu, amdgpu, vgem,
  nouveau, vc4.
- Assorted cleanups, simplifications and fixes to vmwgfx.
</span>
--------------------

The following changes since commit aebd8f0c6f8280ba35bc989f4a9ea47469d3589a:

  Merge v6.2-rc6 into drm-next (2023-01-31 12:23:23 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-07

for you to fetch changes up to 9228742caf899fa72230dd8da19ca4c7528badb8:

  drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks (2023-03-06 19:42:50 -0500)

----------------------------------------------------------------
Andrzej Kacprowski (2):
      accel/ivpu: Fix FW API data alignment issues
      accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

Arnd Bergmann (3):
      accel/ivpu: PM: remove broken ivpu_dbg() statements
      accel: fix CONFIG_DRM dependencies
      accel/ivpu: avoid duplicate assignment

Asahi Lina (1):
      drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()

Brian Norris (1):
      drm/rockchip: vop: Quiet always-warning AFBC log

Carlo Caione (1):
      drm/meson/meson_venc: Relax the supported mode checks

Chris Morgan (3):
      drm: of: Add drm_of_get_dsi_bus helper function
      dt-bindings: display: panel: Add Samsung AMS495QA01
      drm/panel: Add Magnachip D53E6EA8966 Panel Driver

Christian König (4):
      drm/ttm: stop allocating dummy resources during BO creation
      drm/ttm: stop allocating a dummy resource for pipelined gutting
      drm/ttm: prevent moving of pinned BOs
      drm: remove dumb_destroy callback

Dan Carpenter (1):
      drm/simpledrm: Fix an NULL vs IS_ERR() bug

Danilo Krummrich (1):
      dma-buf: actually set signaling bit for private stub fences

Deepak R Varma (2):
      drm/arm/malidp: use sysfs_emit in show function callback
      drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks

Dmitry Baryshkov (2):
      drm/probe_helper: extract two helper functions
      drm/probe_helper: sort out poll_running vs poll_enabled

Dmitry Osipenko (6):
      drm/gem: Add evict() callback to drm_gem_object_funcs
      drm/shmem-helper: Put booleans in the end of struct drm_gem_shmem_object
      drm/shmem-helper: Switch to use drm_* debug helpers
      drm/shmem-helper: Don't use vmap_use_count for dma-bufs
      drm/shmem-helper: Switch to reservation lock
      drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS option

Dom Cobley (1):
      drm/probe-helper: Cancel previous job before starting new one

Douglas Anderson (1):
      drm/bridge: tc358762: Set pre_enable_prev_first

Geert Uytterhoeven (1):
      drivers: Restore alignment and newline in Makefile

Harry Wentland (2):
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs

Jagan Teki (4):
      dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 10HD
      drm: panel: jd9365da-h3: Add Radxa Display 10HD
      dt-bindings: display: panel: jadard,jd9365da-h3: Add Radxa Display 8HD
      drm: panel: jd9365da-h3: Add Radxa Display 8HD

Jani Nikula (5):
      drm/displayid: add displayid_get_header() and check bounds better
      drm/displayid: return struct displayid_header from validate_displayid()
      drm/displayid: provide access to DisplayID version and primary use case
      drm/edid: update non-desktop use also from DisplayID
      drm/edid: parse Tiled Display Topology Data Block for DisplayID 2.0

Jiri Slaby (SUSE) (1):
      drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype

Johan Jonker (7):
      dt-bindings: display: rockchip: convert rockchip-lvds.txt to YAML
      dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
      dt-bindings: display: dsi-controller: move clock-master property
      dt-bindings: display: bridge: snps,dw-mipi-dsi: fix clock properties
      dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to yaml
      dt-bindings: display: bridge: convert analogix_dp.txt to yaml
      dt-bindings: display: rockchip: convert analogix_dp-rockchip.txt to yaml

John Keeping (2):
      drm/rockchip: avoid duplicate mappings for IOMMU devices
      drm/bridge: panel: Set orientation on panel_bridge connector

Maarten Lankhorst (3):
      drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
      drm/amd: Convert amdgpu to use suballocation helper.
      drm/radeon: Use the drm suballocation manager implementation.

Matthew Auld (6):
      drm/i915/ttm: fix sparse warning
      drm/i915/ttm: audit remaining bo-&gt;resource
      drm/ttm: clear the ttm_tt when bo-&gt;resource is NULL
      drm/gem-vram: handle NULL bo-&gt;resource in move callback
      drm/qxl: handle NULL bo-&gt;resource in move callback
      drm/radeon: handle NULL bo-&gt;resource in move callback

Maxime Ripard (4):
      drm/vc4: hdmi: Replace hardcoded value by define
      drm/vc4: hdmi: Enable power domain before setting minimum
      Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
      Revert "drm/vc4: hdmi: Enforce the minimum rate at runtime_resume"

Maíra Canal (8):
      drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
      drm/vgem: add missing mutex_destroy
      drm/sched: Create wrapper to add a syncobj dependency to job
      drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
      drm/v3d: Use drm_sched_job_add_syncobj_dependency()
      drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
      drm/vc4: replace obj lookup steps with drm_gem_objects_lookup
      dma-buf: Include missing parentheses to documentation

Michael Riesch (5):
      drm/rockchip: vop2: initialize possible_crtcs properly
      drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
      drm/rockchip: rgb: add video_port parameter to init function
      drm/rockchip: vop2: use symmetric function pair vop2_{create,destroy}_crtcs
      drm/rockchip: vop2: add support for the rgb output block

Neil Armstrong (1):
      MAINTAINERS: Add myself as maintainer for DRM Panels drivers

Randy Dunlap (1):
      drm/bridge: Kconfig: fix a spelling mistake

Rayyan Ansari (2):
      drm/simpledrm: Allow physical width and height configuration via panel node
      dt-bindings: display: simple-framebuffer: Document the panel node

Rob Clark (3):
      drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
      drm/rockchip: Drop unbalanced obj unref
      drm/virtio: Add option to disable KMS support

Simon Ser (5):
      drm: document DRM_IOCTL_GEM_CLOSE
      drm: document expectations for GETFB2 handles
      drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and PRIME_FD_TO_HANDLE
      drm: document connector margin properties
      drm: remove outdated doc TODO for subconnector property

Somalapuram Amaranath (1):
      drm/amdgpu: Remove TTM resource-&gt;start visible VRAM condition v2

Stanislaw Gruszka (2):
      accel/ivpu: Set dma max_segment_size
      accel/ivpu: Fix old dma_buf api usage

Stephen Boyd (1):
      drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable

Thomas Weißschuh (2):
      drm/nouveau/led: explicitly include linux/leds.h
      dma-buf: make kobj_type structure constant

Thomas Zimmermann (23):
      Merge drm/drm-next into drm-misc-next
      fbdev: Fix contact info in fb_cmdline.c
      fbdev: Transfer video= option strings to caller; clarify ownership
      fbdev: Support NULL for name in option-string lookup
      drivers/ps3: Read video= option with fb_get_option()
      fbdev: Read video= option with fb_get_option() in modedb
      fbdev: Unexport fb_mode_option
      fbdev: Move option-string lookup into helper
      fbdev: Handle video= parameter in video/cmdline.c
      driver/ps3: Include &lt;video/cmdline.h&gt; for mode parsing
      drm: Include &lt;video/cmdline.h&gt; for mode parsing
      drm: Fix comment on mode parsing
      drm/atomic-helper: Add atomic_enable plane-helper callback
      drm/ast: Implement struct drm_plane_helper_funcs.atomic_enable
      drm/mgag200: Remove disable handling from atomic_update
      drm/mgag200: Implement struct drm_plane_helper_funcs.atomic_enable
      drm/tidss: Remove return values from dispc_plane_{setup, enable}()
      drm/tidss: Implement struct drm_plane_helper_funcs.atomic_enable
      Revert "drm/shmem-helper: Switch to reservation lock"
      drm/ast: Remove little-endianism from I/O helpers
      drm/ast: Rework definition of I/O read and write helpers
      drm/ast: Rename struct ast_private to struct ast_device
      drm/ast: Rename to_ast_private() to to_ast_device()

Ville Syrjälä (1):
      drm/edid: Fix csync detailed mode parsing

Xu Panda (1):
      drm/virtio: use strscpy() to instead of strncpy()

Zack Rusin (11):
      drm/vmwgfx: Use the common gem mmap instead of the custom code
      drm/vmwgfx: Remove the duplicate bo_free function
      drm/vmwgfx: Rename vmw_buffer_object to vmw_bo
      drm/vmwgfx: Simplify fb pinning
      drm/vmwgfx: Cleanup the vmw bo usage in the cursor paths
      drm/vmwgfx: Rename dummy to is_iomem
      drm/vmwgfx: Abstract placement selection
      drm/vmwgfx: Stop using raw ttm_buffer_object's
      drm/vmwgfx: Make the driver work without the dummy resources
      drm/vmwgfx: Stop accessing buffer objects which failed init
      drm/vmwgfx: Do not drop the reference to the handle too soon

suijingfeng (1):
      ttm/ttm_device.h: fix a trival typo

 .../bindings/display/bridge/analogix,dp.yaml       |  63 +++
 .../bindings/display/bridge/analogix_dp.txt        |  51 --
 .../bindings/display/bridge/snps,dw-mipi-dsi.yaml  |  16 +-
 .../bindings/display/dsi-controller.yaml           |  18 +-
 .../bindings/display/exynos/exynos_dp.txt          |   2 +-
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |   2 +
 .../bindings/display/panel/samsung,ams495qa01.yaml |  57 +++
 .../display/rockchip/analogix_dp-rockchip.txt      |  98 ----
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |  94 ----
 .../display/rockchip/rockchip,analogix-dp.yaml     | 103 ++++
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     | 166 +++++++
 .../bindings/display/rockchip/rockchip,lvds.yaml   | 170 +++++++
 .../bindings/display/rockchip/rockchip-lvds.txt    |  92 ----
 .../bindings/display/simple-framebuffer.yaml       |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  10 +-
 MAINTAINERS                                        |   2 +-
 drivers/accel/Kconfig                              |   5 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   3 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  37 +-
 drivers/accel/ivpu/ivpu_gem.c                      |   8 +-
 drivers/accel/ivpu/ivpu_job.c                      |   5 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  11 +
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |   2 +-
 drivers/accel/ivpu/ivpu_pm.c                       |  10 -
 drivers/accel/ivpu/vpu_jsm_api.h                   |  67 +--
 drivers/dma-buf/dma-buf-sysfs-stats.c              |   2 +-
 drivers/dma-buf/dma-buf.c                          |   2 +-
 drivers/dma-buf/dma-fence.c                        |   2 +-
 drivers/gpu/drm/Kconfig                            |   6 +-
 drivers/gpu/drm/Makefile                           |   3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c             | 324 +------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 -
 drivers/gpu/drm/arm/malidp_drv.c                   |   2 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  10 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |  40 +-
 drivers/gpu/drm/ast/ast_drv.c                      |   2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  84 ++--
 drivers/gpu/drm/ast/ast_i2c.c                      |   8 +-
 drivers/gpu/drm/ast/ast_main.c                     |  24 +-
 drivers/gpu/drm/ast/ast_mm.c                       |   4 +-
 drivers/gpu/drm/ast/ast_mode.c                     | 104 ++--
 drivers/gpu/drm/ast/ast_post.c                     |  94 ++--
 drivers/gpu/drm/bridge/Kconfig                     |   2 +-
 drivers/gpu/drm/bridge/panel.c                     |   2 +
 drivers/gpu/drm/bridge/tc358762.c                  |   1 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   6 +-
 drivers/gpu/drm/drm_atomic.c                       |   1 +
 drivers/gpu/drm/drm_atomic_helper.c                |  20 +-
 drivers/gpu/drm/drm_connector.c                    |  28 +-
 drivers/gpu/drm/drm_displayid.c                    |  62 ++-
 drivers/gpu/drm/drm_dumb_buffers.c                 |   5 +-
 drivers/gpu/drm/drm_edid.c                         |  65 ++-
 drivers/gpu/drm/drm_gem.c                          |  25 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             | 132 +++---
 drivers/gpu/drm/drm_gem_vram_helper.c              |  11 +
 drivers/gpu/drm/drm_internal.h                     |   3 -
 drivers/gpu/drm/drm_modes.c                        |   3 +-
 drivers/gpu/drm/drm_of.c                           |  51 ++
 drivers/gpu/drm/drm_probe_helper.c                 | 113 +++--
 drivers/gpu/drm/drm_suballoc.c                     | 457 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   7 +-
 drivers/gpu/drm/meson/meson_venc.c                 |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   3 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  22 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   3 -
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |  10 +-
 drivers/gpu/drm/nouveau/nouveau_led.h              |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  16 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 209 ++++++++-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    | 522 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  11 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  11 +
 drivers/gpu/drm/radeon/Kconfig                     |   1 +
 drivers/gpu/drm/radeon/radeon.h                    |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c                 |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h             |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c                 | 316 +------------
 drivers/gpu/drm/radeon/radeon_semaphore.c          |   4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |  16 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  80 +++-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  19 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.h            |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  29 ++
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  10 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  12 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   8 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |  20 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  35 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  30 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  19 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   1 -
 drivers/gpu/drm/v3d/v3d_gem.c                      |  26 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  78 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  46 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
 drivers/gpu/drm/vc4/vc4_validate.c                 |   4 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |   1 +
 drivers/gpu/drm/virtio/Kconfig                     |  11 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   6 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   4 +
 drivers/gpu/drm/virtio/virtgpu_kms.c               |  39 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   3 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 | 413 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 | 203 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |  53 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |  36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |  65 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                | 245 ++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            | 103 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  95 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 234 ++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  43 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  57 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |  45 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |  21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |  68 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           | 246 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h      |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  53 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |  66 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               | 323 ++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            | 115 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         | 134 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           | 110 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_va.c                 |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         | 150 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |  10 +-
 drivers/ps3/ps3av.c                                |   9 +-
 drivers/video/Kconfig                              |   3 +
 drivers/video/Makefile                             |   1 +
 drivers/video/cmdline.c                            | 133 ++++++
 drivers/video/fbdev/Kconfig                        |   5 +-
 drivers/video/fbdev/core/Makefile                  |   3 +-
 drivers/video/fbdev/core/fb_cmdline.c              |  94 +---
 drivers/video/fbdev/core/modedb.c                  |   8 +-
 include/drm/drm_atomic_helper.h                    |  26 +
 include/drm/drm_displayid.h                        |  12 +-
 include/drm/drm_drv.h                              |  19 -
 include/drm/drm_edid.h                             |  12 +-
 include/drm/drm_gem.h                              |  12 +
 include/drm/drm_gem_shmem_helper.h                 |  30 +-
 include/drm/drm_modeset_helper_vtables.h           |  29 +-
 include/drm/drm_of.h                               |  12 +
 include/drm/drm_suballoc.h                         | 108 +++++
 include/drm/gpu_scheduler.h                        |   6 +
 include/drm/ttm/ttm_device.h                       |   2 +-
 include/linux/fb.h                                 |   1 -
 include/uapi/drm/drm.h                             |  57 ++-
 include/video/cmdline.h                            |  20 +
 170 files changed, 4650 insertions(+), 3587 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
 create mode 100644 drivers/video/cmdline.c
 create mode 100644 include/drm/drm_suballoc.h
 create mode 100644 include/video/cmdline.h

</pre>
  </body>
</html>

--------------CkLPkpAqpkmxCX2Tle66aEoP--
