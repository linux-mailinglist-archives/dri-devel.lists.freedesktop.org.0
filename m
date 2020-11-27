Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721192C60DE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 09:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F95A6EB5A;
	Fri, 27 Nov 2020 08:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF86EB5F;
 Fri, 27 Nov 2020 08:31:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CE5DAC0C;
 Fri, 27 Nov 2020 08:31:02 +0000 (UTC)
Date: Fri, 27 Nov 2020 09:30:55 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20201127083055.GA29139@linux-uq9g>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next. Many fixes and updates. The most
important change is probably the amdgpu fix that unbreaks TTM multihop.

Best regards
Thomas

drm-misc-next-2020-11-27-1:
drm-misc-next for 5.11:

UAPI Changes:

Cross-subsystem Changes:

 * char/agp: Disable frontend without CONFIG_DRM_LEGACY
 * mm: Fix fput in mmap error path; Introduce vma_set_file() to change
   vma->vm_file

Core Changes:

 * dma-buf: Use sgtables in system heap; Move heap helpers to CMA-heap code;
   Skip sync for unmapped buffers; Alloc higher order pages is available;
   Respect num_fences when initializing shared fence list
 * doc: Improvements around DRM modes and SCALING_FILTER
 * Pass full state to connector atomic functions + callee updates
 * Cleanups
 * shmem: Map pages with caching by default; Cleanups
 * ttm: Fix DMA32 for global page pool
 * fbdev: Cleanups
 * fb-helper: Update framebuffer after userspace writes; Unmap console buff=
er
   during shutdown; Rework damage handling of shadow framebuffer

Driver Changes:

 * amdgpu: Multi-hop fixes, Clenaups
 * imx: Fix rotation for Vivante tiled formats; Support nearest-neighour
   skaling; Cleanups
 * mcde: Fix RGB formats; Support DPI output; Cleanups
 * meson: HDMI clock fixes
 * panel: Add driver and bindings for Innolux N125HCE-GN1
 * panel/s6e63m0: More backlight levels; Fix init; Cleanups
 * via: Clenunps
 * virtio: Use fence ID for handling fences; Cleanups

The following changes since commit fa388231fec99b60346319d56495ae531b666275:

  drm/docs: Fix todo.rst (2020-11-18 11:51:58 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-11-27-1

for you to fetch changes up to 05faf1559de52465f1e753e31883aa294e6179c1:

  drm/imx/dcss: allow using nearest neighbor interpolation scaling (2020-11=
-26 11:29:44 +0100)

----------------------------------------------------------------
drm-misc-next for 5.11:

UAPI Changes:

Cross-subsystem Changes:

 * char/agp: Disable frontend without CONFIG_DRM_LEGACY
 * mm: Fix fput in mmap error path; Introduce vma_set_file() to change
   vma->vm_file

Core Changes:

 * dma-buf: Use sgtables in system heap; Move heap helpers to CMA-heap code;
   Skip sync for unmapped buffers; Alloc higher order pages is available;
   Respect num_fences when initializing shared fence list
 * doc: Improvements around DRM modes and SCALING_FILTER
 * Pass full state to connector atomic functions + callee updates
 * Cleanups
 * shmem: Map pages with caching by default; Cleanups
 * ttm: Fix DMA32 for global page pool
 * fbdev: Cleanups
 * fb-helper: Update framebuffer after userspace writes; Unmap console buff=
er
   during shutdown; Rework damage handling of shadow framebuffer

Driver Changes:

 * amdgpu: Multi-hop fixes, Clenaups
 * imx: Fix rotation for Vivante tiled formats; Support nearest-neighour
   skaling; Cleanups
 * mcde: Fix RGB formats; Support DPI output; Cleanups
 * meson: HDMI clock fixes
 * panel: Add driver and bindings for Innolux N125HCE-GN1
 * panel/s6e63m0: More backlight levels; Fix init; Cleanups
 * via: Clenunps
 * virtio: Use fence ID for handling fences; Cleanups

----------------------------------------------------------------
Anthoine Bourgeois (3):
      drm/virtio: suffix create blob call with _ioctl like any ioctl
      drm/virtio: fix a file name comment reference
      virtio-gpu api: Add a comment on VIRTIO_GPU_SHM_ID_HOST_VISIBLE

Bernard Zhao (1):
      drm/via: fix assignment in if condition

Christian K=F6nig (4):
      drm/amdgpu: fix check order in amdgpu_bo_move
      mm: mmap: fix fput in error path v2
      mm: introduce vma_set_file function v5
      drm/ttm: fix DMA32 handling in the global page pool

Colin Ian King (1):
      drm/mcde: fix masking and bitwise-or on variable val

Daniel Vetter (1):
      char/agp: Disable frontend without CONFIG_DRM_LEGACY

Gurchetan Singh (2):
      drm/virtio: use fence_id when processing fences
      drm/virtio: rename sync_seq and last_seq

Gustavo A. R. Silva (4):
      drm: Fix fall-through warnings for Clang
      drm/via: Fix fall-through warnings for Clang
      video: fbdev: lxfb_ops: Fix fall-through warnings for Clang
      video: fbdev: pm2fb: Fix fall-through warnings for Clang

John Stultz (5):
      dma-buf: system_heap: Rework system heap to use sgtables instead of p=
agelists
      dma-buf: heaps: Move heap-helper logic into the cma_heap implementati=
on
      dma-buf: heaps: Remove heap-helpers code
      dma-buf: heaps: Skip sync if not mapped
      dma-buf: system_heap: Allocate higher order pages if available

Laurentiu Palcu (3):
      drm/imx/dcss: fix rotations for Vivante tiled formats
      drm/imx/dcss: fix coccinelle warning
      drm/imx/dcss: allow using nearest neighbor interpolation scaling

Linus Walleij (7):
      drm/panel: s6e63m0: Fix and extend MCS table
      drm/panel: s6e63m0: Implement 28 backlight levels
      drm/panel: s6e63m0: Fix init sequence
      drm/mcde: Fix RGB/BGR bug
      drm/mcde: Break out DSI set-up routine
      drm/mcde: Support DPI output
      drm/mcde: Fix uninitialized value

Luben Tuikov (1):
      drm/amdgpu: Fix missing prototype warning

Lukas F. Hartmann (2):
      dt-bindings: display/panel: add Innolux N125HCE-GN1
      panel-simple: add Innolux N125HCE-GN1

Maarten Lankhorst (1):
      dma-buf/dma-resv: Respect num_fences when initializing the shared fen=
ce list.

Marc Zyngier (2):
      drm/meson: dw-hdmi: Disable clocks on driver teardown
      drm/meson: dw-hdmi: Enable the iahb clock early enough

Maxime Ripard (1):
      drm: Pass the full state to connectors atomic functions

Simon Ser (4):
      drm: improve kernel-docs in drm_mode.h
      drm: document drm_mode_get_connector
      drm: document drm_mode_modeinfo
      drm: fix kernel-doc warnings for SCALING_FILTER

Thomas Zimmermann (12):
      drm/shmem-helper: Use cached mappings by default
      drm/shmem-helper: Removed drm_gem_shmem_create_object_cached()
      drm/fb-helper: Call dirty helper after writing to fbdev
      drm/fb-helper: Unmap client buffer during shutdown
      drm/client: Depend on GEM object kmap ref-counting
      drm/fb-helper: Rename dirty worker to damage worker
      drm/fb-helper: Return early in damage worker
      drm/fb-helper: Separate shadow-buffer flushing and calling dirty call=
back
      drm/fb-helper: Move damage blit code and its setup into separate rout=
ine
      drm/fb-helper: Restore damage area upon errors
      drm/fb-helper: Copy dma-buf map before flushing shadow fb
      drm/fb-helper: Acquire modeset lock around shadow-buffer flushing

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 drivers/char/agp/Makefile                          |   6 +-
 drivers/char/agp/agp.h                             |   5 +
 drivers/dma-buf/dma-buf.c                          |  19 +-
 drivers/dma-buf/dma-resv.c                         |   2 +-
 drivers/dma-buf/heaps/Makefile                     |   1 -
 drivers/dma-buf/heaps/cma_heap.c                   | 329 ++++++++++++---
 drivers/dma-buf/heaps/heap-helpers.c               | 274 -------------
 drivers/dma-buf/heaps/heap-helpers.h               |  53 ---
 drivers/dma-buf/heaps/system_heap.c                | 414 ++++++++++++++++-=
--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  53 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   5 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   8 +-
 drivers/gpu/drm/drm_blend.c                        |   2 +-
 drivers/gpu/drm/drm_bufs.c                         |   1 +
 drivers/gpu/drm/drm_client.c                       |   4 -
 drivers/gpu/drm/drm_crtc.c                         |  12 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 155 ++++---
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  40 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   5 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |   3 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |  24 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |  47 ++-
 drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
 drivers/gpu/drm/mcde/Kconfig                       |   1 +
 drivers/gpu/drm/mcde/Makefile                      |   2 +-
 drivers/gpu/drm/mcde/mcde_clk_div.c                | 192 +++++++++
 drivers/gpu/drm/mcde/mcde_display.c                | 456 ++++++++++++++++-=
----
 drivers/gpu/drm/mcde/mcde_display_regs.h           |  91 +++-
 drivers/gpu/drm/mcde/mcde_drm.h                    |  10 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |  46 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  51 ++-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   1 -
 drivers/gpu/drm/msm/msm_gem.c                      |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   5 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      | 345 ++++++++++++----
 drivers/gpu/drm/panel/panel-simple.c               |  28 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  22 +
 drivers/gpu/drm/udl/udl_drv.c                      |   2 -
 drivers/gpu/drm/v3d/v3d_bo.c                       |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   4 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   3 +-
 drivers/gpu/drm/via/via_irq.c                      |   1 +
 drivers/gpu/drm/via/via_verifier.c                 |   7 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   8 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |  13 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   7 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   1 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |   1 -
 drivers/gpu/drm/vkms/vkms_writeback.c              |   7 +-
 drivers/staging/android/ashmem.c                   |   6 +-
 drivers/video/fbdev/geode/lxfb_ops.c               |   1 +
 drivers/video/fbdev/pm2fb.c                        |   1 +
 include/drm/drm_fb_helper.h                        |  14 +-
 include/drm/drm_gem_shmem_helper.h                 |   7 +-
 include/drm/drm_modes.h                            |   3 +
 include/drm/drm_modeset_helper_vtables.h           |  13 +-
 include/linux/mm.h                                 |   2 +
 include/uapi/drm/drm_mode.h                        | 165 ++++++--
 include/uapi/linux/virtio_gpu.h                    |   4 +
 mm/mmap.c                                          |   2 +-
 mm/util.c                                          |  12 +
 70 files changed, 2131 insertions(+), 902 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h
 create mode 100644 drivers/gpu/drm/mcde/mcde_clk_div.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
