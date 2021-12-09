Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D446EEC6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9910E160;
	Thu,  9 Dec 2021 16:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF1010E119;
 Thu,  9 Dec 2021 11:46:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3128210FF;
 Thu,  9 Dec 2021 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639050386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdU6fhHKTN9QZFT2crHPiwp/CCxFCCFbxnXgN4Vth9I=;
 b=owyX6GjuWyIkBkMHLwvDJP/aiTNgJkguo37w8RSWDcNsS9PrHq2dBEOydzvK1UjqQvVihW
 Ty5zfB+QqQ7HyQn1iMfmTD0fYGT7qK4liaB5+P/JJNrU+omidwJz6Bh4S7YjFn+7s+8wVD
 3nrzpBU3SuLhwRo+yj+XzuVmWPkrOLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639050386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdU6fhHKTN9QZFT2crHPiwp/CCxFCCFbxnXgN4Vth9I=;
 b=Vv8tU0hb89DG/2uKk2X0DPeOVCYIg1aCbQRJmTZMc//Sp9I6mXxbsBflkgpM8fjbXcxPgu
 NlXTZN4YYNM8BBBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F17113343;
 Thu,  9 Dec 2021 11:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wu72IZLssWEVUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Dec 2021 11:46:26 +0000
Date: Thu, 9 Dec 2021 12:46:24 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YbHskHZc9HoAYuPZ@linux-uq9g.fritz.box>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next.

There was a problem with merging commit e580ea25c08d ("drm/cma-helper: Pass
GEM CMA object in public interfaces") into drm-tip. The commit is correct
in drm-misc-next, but it conflicted with commit 96c5f82ef0a1 ("drm/vc4: fix
error code in vc4_create_object()") from drm-misc-fixes. This affected vc4.

After merging this PR, you may want to double check that vc4_create_object()
returns an error pointer. [1]

Best regards
Thomas

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/vc4/vc4_bo.c?h=drm-misc-next-2021-12-09#n394

drm-misc-next-2021-12-09:
drm-misc-next for 5.17:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Make fences mandatory in dma_resv_add_excl_fence

Core Changes:

 * Move hashtable to legacy code
 * Return error pointers from struct drm_driver.gem_create_object

 * cma-helper: Improve public interfaces; Remove CONFIG_DRM_KMS_CMA_HELPER option
 * mipi-dbi: Don't depend on CMA helpers
 * ttm: Don't include DRM hashtable; Stop prunning fences after wait; Documentation

Driver Changes:

 * aspeed: Select CONFIG_DRM_GEM_CMA_HELPER

 * bridge/lontium-lt9611: Fix HDMI sensing
 * bridge/parade-ps8640: Fixes
 * bridge/sn65dsi86: Defer probe is no dsi host found

 * fsl-dcu: Select CONFIG_DRM_GEM_CMA_HELPER

 * i915: Remove dma_resv_prune

 * omapdrm: Fix scatterlist export; Support virtual planes; Fixes

 * panel: Boe-tv110c9m,Inx-hj110iz: Update init code

 * qxl: Use dma-resv iterator

 * rockchip: Use generic fbdev emulation

 * tidss: Fixes

 * vmwgfx: Fix leak on probe errors; Fail probing on broken hosts; New
   placement for MOB page tables; Hide internal BOs from userspace; Cleanups
The following changes since commit 69d846126e1653ca9043c3766c66684132586941:

  drm: Fix build error caused by missing drm_nomodeset.o (2021-11-27 21:05:58 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-12-09

for you to fetch changes up to 03848335b5b1faa4a4641fcf30b7c233579a45aa:

  drm/bridge: sn65dsi86: defer if there is no dsi host (2021-12-08 08:47:10 -0800)

----------------------------------------------------------------
drm-misc-next for 5.17:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Make fences mandatory in dma_resv_add_excl_fence

Core Changes:

 * Move hashtable to legacy code
 * Return error pointers from struct drm_driver.gem_create_object

 * cma-helper: Improve public interfaces; Remove CONFIG_DRM_KMS_CMA_HELPER option
 * mipi-dbi: Don't depend on CMA helpers
 * ttm: Don't include DRM hashtable; Stop prunning fences after wait; Documentation

Driver Changes:

 * aspeed: Select CONFIG_DRM_GEM_CMA_HELPER

 * bridge/lontium-lt9611: Fix HDMI sensing
 * bridge/parade-ps8640: Fixes
 * bridge/sn65dsi86: Defer probe is no dsi host found

 * fsl-dcu: Select CONFIG_DRM_GEM_CMA_HELPER

 * i915: Remove dma_resv_prune

 * omapdrm: Fix scatterlist export; Support virtual planes; Fixes

 * panel: Boe-tv110c9m,Inx-hj110iz: Update init code

 * qxl: Use dma-resv iterator

 * rockchip: Use generic fbdev emulation

 * tidss: Fixes

 * vmwgfx: Fix leak on probe errors; Fail probing on broken hosts; New
   placement for MOB page tables; Hide internal BOs from userspace; Cleanups

----------------------------------------------------------------
Arnd Bergmann (3):
      drm: fsl-dcu: select CONFIG_DRM_GEM_CMA_HELPER
      drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
      omapdrm: dss: mark runtime PM functions __maybe_unused

Benoit Parrot (8):
      drm/omap: Add ability to check if requested plane modes can be supported
      drm/omap: Add ovl checking funcs to dispc_ops
      drm/omap: introduce omap_hw_overlay
      drm/omap: omap_plane: subclass drm_plane_state
      drm/omap: Add global state as a private atomic object
      drm/omap: dynamically assign hw overlays to planes
      drm/omap: add plane_atomic_print_state support
      drm/omap: Add a 'right overlay' to plane state

Cai Huoqing (1):
      drm/tidss: Fix warning: unused variable 'tidss_pm_ops'

Christian König (3):
      drm/qxl: use iterator instead of dma_resv_shared_list
      drm/ttm: stop pruning fences after wait
      dma-buf: make fence mandatory for dma_resv_add_excl_fence v2

Douglas Anderson (1):
      drm/bridge: parade-ps8640: Add backpointer to drm_device in drm_dp_aux

Ivaylo Dimitrov (1):
      drm: omapdrm: Export correct scatterlist for TILER backed BOs

John Keeping (2):
      drm/rockchip: use generic fbdev setup
      drm/rockchip: pass 0 to drm_fbdev_generic_setup()

Maarten Lankhorst (1):
      drm/i915: Remove dma_resv_prune

Neil Armstrong (1):
      drm/omap: add sanity plane state check

Peter Collingbourne (1):
      lontium-lt9611: check a different register bit for HDMI sensing

Rob Clark (1):
      drm/bridge: sn65dsi86: defer if there is no dsi host

Thomas Zimmermann (9):
      drm/ttm: Don't include drm_hashtab.h
      drm/vmwgfx: Copy DRM hash-table code into driver
      drm: Declare hashtable as legacy
      drm/cma-helper: Move driver and file ops to the end of header
      drm/cma-helper: Export dedicated wrappers for GEM object functions
      drm/cma-helper: Pass GEM CMA object in public interfaces
      drm/mipi-dbi: Remove dependency on GEM CMA helper library
      drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
      drm: Return error codes from struct drm_driver.gem_create_object

Zack Rusin (6):
      drm/vmwgfx: Remove the deprecated lower mem limit
      drm/vmwgfx: Release ttm memory if probe fails
      drm/vmwgfx: Fail to initialize on broken configs
      drm/vmwgfx: Introduce a new placement for MOB page tables
      drm/vmwgfx: Switch the internal BO's to ttm_bo_type_kernel
      drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs control

yangcong (1):
      drm/panel: Update Boe-tv110c9m and Inx-hj110iz initial code

 Documentation/gpu/todo.rst                         |  11 +
 drivers/dma-buf/dma-resv.c                         |   3 +-
 drivers/gpu/drm/Kconfig                            |   7 -
 drivers/gpu/drm/Makefile                           |   8 +-
 drivers/gpu/drm/arm/Kconfig                        |   2 -
 drivers/gpu/drm/arm/display/Kconfig                |   1 -
 drivers/gpu/drm/aspeed/Kconfig                     |   2 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |   1 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  24 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |  90 +++---
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  17 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   4 +-
 drivers/gpu/drm/drm_hashtab.c                      |  10 +-
 drivers/gpu/drm/drm_legacy.h                       |  40 ++-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  34 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                    |   2 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |   1 -
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/dma_resv_utils.c              |  17 -
 drivers/gpu/drm/i915/dma_resv_utils.h              |  13 -
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   3 -
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   8 -
 drivers/gpu/drm/imx/Kconfig                        |   2 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |   2 +-
 drivers/gpu/drm/ingenic/Kconfig                    |   1 -
 drivers/gpu/drm/kmb/Kconfig                        |   1 -
 drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
 drivers/gpu/drm/mcde/Kconfig                       |   1 -
 drivers/gpu/drm/meson/Kconfig                      |   1 -
 drivers/gpu/drm/mxsfb/Kconfig                      |   2 +-
 drivers/gpu/drm/omapdrm/Makefile                   |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c                |  35 ++-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   4 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |   4 +-
 drivers/gpu/drm/omapdrm/dss/dss.h                  |   5 +
 drivers/gpu/drm/omapdrm/dss/venc.c                 |   4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 | 196 +++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |  24 ++
 drivers/gpu/drm/omapdrm/omap_fb.c                  |  33 +-
 drivers/gpu/drm/omapdrm/omap_fb.h                  |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |  79 ++++-
 drivers/gpu/drm/omapdrm/omap_gem.h                 |   2 +
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |  34 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c             | 212 +++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h             |  35 +++
 drivers/gpu/drm/omapdrm/omap_plane.c               | 349 ++++++++++++++++++---
 drivers/gpu/drm/omapdrm/omap_plane.h               |   1 +
 drivers/gpu/drm/panel/Kconfig                      |   2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 108 +++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   2 +-
 drivers/gpu/drm/pl111/Kconfig                      |   1 -
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |  17 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  10 +-
 drivers/gpu/drm/rockchip/Makefile                  |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  10 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   2 -
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c      | 164 ----------
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h      |  24 --
 drivers/gpu/drm/shmobile/Kconfig                   |   1 -
 drivers/gpu/drm/sti/Kconfig                        |   1 -
 drivers/gpu/drm/stm/Kconfig                        |   1 -
 drivers/gpu/drm/sun4i/Kconfig                      |   1 -
 drivers/gpu/drm/tidss/Kconfig                      |   1 -
 drivers/gpu/drm/tidss/tidss_drv.c                  |   2 +-
 drivers/gpu/drm/tilcdc/Kconfig                     |   1 -
 drivers/gpu/drm/tiny/Kconfig                       |  20 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   1 -
 drivers/gpu/drm/tve200/Kconfig                     |   1 -
 drivers/gpu/drm/v3d/v3d_bo.c                       |   4 +-
 drivers/gpu/drm/vc4/Kconfig                        |   1 -
 drivers/gpu/drm/vc4/vc4_bo.c                       |   8 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   2 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |   4 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |  99 +-----
 drivers/gpu/drm/vmwgfx/ttm_memory.h                |   6 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |  52 +--
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |   7 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  42 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c            | 199 ++++++++++++
 .../gpu/drm/vmwgfx/vmwgfx_hashtab.h                |  54 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |  90 ++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  58 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |  22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |   7 +-
 drivers/gpu/drm/xlnx/Kconfig                       |   1 -
 include/drm/drm_device.h                           |   5 +-
 include/drm/drm_drv.h                              |   5 +-
 include/drm/drm_gem_cma_helper.h                   | 189 ++++++++---
 include/drm/drm_legacy.h                           |  15 +-
 include/drm/ttm/ttm_bo_api.h                       |   1 -
 include/drm/ttm/ttm_placement.h                    |  11 +
 100 files changed, 1810 insertions(+), 833 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 rename include/drm/drm_hashtab.h => drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h (58%)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
