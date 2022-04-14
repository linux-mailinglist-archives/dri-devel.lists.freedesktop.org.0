Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73A0500715
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243310F36B;
	Thu, 14 Apr 2022 07:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B1310E281;
 Thu, 14 Apr 2022 07:38:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 31624320209C;
 Thu, 14 Apr 2022 03:38:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 Apr 2022 03:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1649921920; x=1650008320; bh=sjp1cJjrFcUS5itoisubNVPGUImwD9ewNsC
 lFZC3RKc=; b=NgiDhiS0EfQ5BLOHofplVxFDnDVvfaUuZXBoNAXWYgC+hiYedF8
 glnF5EBWw3AgvgiZhK3dbZk3uDj80gas7YKKD+jr3hBEWP4OxbgLATUGg5w9eu7O
 es6tN/jro03cKZGo3qIz0dFYbKWLbXluT2fAVqFDpZool2j6YZiAzowFbtLCm5q9
 PX0KczNdDDE6eRATnwiKbjP3rFrSaWmG5huwxocvoTZSeXF/3/Fa1cTOADZp6yo7
 a1lgpdpuB98hTbQi615sEVEVkdJwUkLRBbpvWciZwhiZcQBHCDeUs/i1Xecycyqb
 eFRzLuIFk4O4b5j8o8IMTaTJh4eKKxBSthg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1649921920; x=1650008320; bh=sjp1cJjrFcUS5
 itoisubNVPGUImwD9ewNsClFZC3RKc=; b=YWXOXkd/N3rMKIhKa1n8JZUuBahZL
 +fUDPOQ3G6f54qrI7pnpapbqJ7gBks8WuDyZG5zmJuuFikBu3TNHCssQG8v2rlJ9
 PntigDGr9fBriAN3ltmZ2C7ABPm24UEUp6ki2vHJWgrWc7tEyh90I17lbtghRSnr
 v19w8GCcGLi84eAOcBrVHLh9NkP30T6iyVaxBO2kbypkjbP+26MDpPlBZu88q6b/
 ZU3XiR1g1c1tjTGusWE0g8M24oin/TtjIpcG8FZNp513xw8y2M8YJrzjxttdMAqN
 Lw8173d4TdsGPTwhaefQJWcXSe/bqRLRe+Pgg/tq66sEEDeErw81VQCOA==
X-ME-Sender: <xms:gM9XYsWaL3ahrH9k3xaruL812qWhzVj5Q1RqztGkjICko3jZ6T1UbQ>
 <xme:gM9XYgkA5OIchoExiWHHcq-kyNJJ5-jdW8N9L4XpKO7cCe2-mdJptcPCuMwQ7tCkb
 nyBtO-HEsx-scOhjmY>
X-ME-Received: <xmr:gM9XYgZyyEB5aYxbQAEUGjVXAgWqBdEdNYOXw-BTX_4k62FDnzItEE0n_UijFTVn1brtFAihhELQ9XSZopc1HoG4BrzVuqD3aicGb0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:gM9XYrVcNULnmA8GN6gJRR4Hd9XpWa-odFjNBNn4F5HdswvpKZhROw>
 <xmx:gM9XYmnbIsv8KQ_I2YhB29cgIWOiZfYHGPDFfIrJTkC_Oi-5P3rTew>
 <xmx:gM9XYgdeqqJOWa-2tlSl-U6yCif3C0o4AnO_hvtgPob9By6bdGrOQw>
 <xmx:gM9XYvcZizVHmd3vx9v4-xJbhjnDOzgcVEQsVFvBnO1zNplbCkzP_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Apr 2022 03:38:39 -0400 (EDT)
Date: Thu, 14 Apr 2022 09:38:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220414073837.76dqnqazxbsqslio@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="psekeudunrkp6i2f"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--psekeudunrkp6i2f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-04-14:
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - fbcon: various loading and locking cleanups

Core Changes:
  - buddy: Check for page size alignment at allocation
  - dma-buf: Add dma_resv_usage enum, new usage for kernel submissions,
    memory management submissions, documentation improvements,

Driver Changes:
  - Switch drivers to drm_mode_init, drm_mode_copy
  - amdgpu: Add drm buddy allocator support
  - bridge: Add DDC enable gpio support to display-connector, convert
    icn6211 to regmap
  - ingenic: HDMI support
  - panels: Support for SINO WEALTH SH1106 OLED display, simplify mode
    parsing in panel-lvds
  - sti: spelling fixes, bridge list iteration fixes
  - vc4: Writeback fixes and improvements
The following changes since commit c8d4c18bfbc4ab467188dbe45cc8155759f49d9e:

  dma-buf/drivers: make reserving a shared slot mandatory v4 (2022-04-06 17=
:38:25 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-04-14

for you to fetch changes up to 9d79799193b728b62c9899d931b5009da1f89b67:

  fbcon: Fix delayed takeover locking (2022-04-13 22:54:48 +0200)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - fbcon: various loading and locking cleanups

Core Changes:
  - buddy: Check for page size alignment at allocation
  - dma-buf: Add dma_resv_usage enum, new usage for kernel submissions,
    memory management submissions, documentation improvements,

Driver Changes:
  - Switch drivers to drm_mode_init, drm_mode_copy
  - amdgpu: Add drm buddy allocator support
  - bridge: Add DDC enable gpio support to display-connector, convert
    icn6211 to regmap
  - ingenic: HDMI support
  - panels: Support for SINO WEALTH SH1106 OLED display, simplify mode
    parsing in panel-lvds
  - sti: spelling fixes, bridge list iteration fixes
  - vc4: Writeback fixes and improvements

----------------------------------------------------------------
Arunpravin Paneer Selvam (2):
      drm/amdgpu: add drm buddy support to amdgpu
      drm: add a check to verify the size alignment

Changcheng Deng (1):
      fbcon: use min() to make code cleaner

Chen-Yu Tsai (4):
      dt-bindings: vendor-prefixes: Add prefix for SINO WEALTH Eletronics L=
td.
      dt-bindings: display: ssd1307fb: Add entry for SINO WEALTH SH1106
      drm/ssd130x: Support page addressing mode
      drm/ssd130x: Add support for SINO WEALTH SH1106

Christian K=F6nig (16):
      dma-buf: add enum dma_resv_usage v4
      dma-buf: specify usage while adding fences to dma_resv obj v7
      dma-buf & drm/amdgpu: remove dma_resv workaround
      dma-buf: add DMA_RESV_USAGE_KERNEL v3
      drm/amdgpu: use DMA_RESV_USAGE_KERNEL
      drm/radeon: use DMA_RESV_USAGE_KERNEL
      RDMA: use DMA_RESV_USAGE_KERNEL
      dma-buf: add DMA_RESV_USAGE_BOOKKEEP v3
      dma-buf: wait for map to complete for static attachments
      drm/i915: drop bo->moving dependency
      drm/ttm: remove bo->moving
      dma-buf: drop seq count based update
      seqlock: drop seqcount_ww_mutex_t
      futex: add missing rtmutex.h include
      drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
      drm/ttm: fix kerneldoc for ttm_lru_bulk_move

Colin Ian King (1):
      drm: sti: fix spelling mistake: rejec -> rejection

Daniel Vetter (18):
      fbcon: delete a few unneeded forward decl
      fbcon: Move fbcon_bmove(_rec) functions
      fbcon: Introduce wrapper for console->fb_info lookup
      fbcon: delete delayed loading code
      fbdev/sysfs: Fix locking
      fbcon: Use delayed work for cursor
      fbcon: Replace FBCON_FLAGS_INIT with a boolean
      fb: Delete fb_info->queue
      fbcon: Extract fbcon_open/release helpers
      fbcon: Ditch error handling for con2fb_release_oldinfo
      fbcon: move more common code into fb_open()
      fbcon: use lock_fb_info in fbcon_open/release
      fbcon: Consistently protect deferred_takeover with console_lock()
      fbcon: Move console_lock for register/unlink/unregister
      fbcon: Move more code into fbcon_release
      fbcon: untangle fbcon_exit
      fbcon: Maintain a private array of fb_info
      fbcon: Fix delayed takeover locking

H. Nikolaus Schaller (1):
      drm/bridge: display-connector: add ddc-en gpio support

Javier Martinez Canillas (1):
      drm/vc4: Use newer fence API properly to fix build errors

Jiasheng Jiang (1):
      drm: mali-dp: potential dereference of null pointer

Julia Lawall (1):
      drm/sti: fix typos in comments

Liviu Dudau (1):
      drm/komeda: return early if drm_universal_plane_init() fails.

Marek Vasut (3):
      drm: bridge: icn6211: Convert to regmap
      drm/panel: lvds: Simplify mode parsing
      drm/panel: lvds: Use bus_flags from DT panel-timing property

Matthew Auld (4):
      drm/i915: fix broken build
      drm/i915: fix i915_gem_object_wait_moving_fence
      drm/ttm: stop passing NULL fence in ttm_bo_move_sync_cleanup
      drm/ttm: fixup ttm_bo_add_move_fence v2

Maxime Ripard (6):
      drm/vc4: hvs: Reset muxes at probe time
      drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
      drm/vc4: txp: Force alpha to be 0xff if it's disabled
      drm/vc4: kms: Store channel in local variable
      drm/vc4: kms: Warn if we have an incompatible muxing setup
      drm/vc4: kms: Improve logging

Paul Boddie (1):
      drm/ingenic: Add dw-hdmi driver specialization for jz4780

Paul Cercueil (1):
      drm/ingenic: Implement proper .atomic_get_input_bus_fmts

Randy Dunlap (1):
      drm: sti: don't use kernel-doc markers

Robin Murphy (1):
      drm/arm/malidp: Stop using iommu_present()

Ville Syrj=E4l=E4 (2):
      drm: Use drm_mode_init() for on-stack modes
      drm: Use drm_mode_copy()

Xiaomeng Tong (1):
      stm: ltdc: fix two incorrect NULL checks on list iterator

Zhou Qingyang (1):
      drm/komeda: Fix an undefined behavior bug in komeda_plane_add()

 .../bindings/display/solomon,ssd1307fb.yaml        |  13 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/dma-buf/dma-buf.c                          |  22 +-
 drivers/dma-buf/dma-resv.c                         | 401 +++++-------
 drivers/dma-buf/st-dma-resv.c                      | 111 +---
 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |  97 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 359 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |  89 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |  10 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |   5 +-
 drivers/gpu/drm/arm/malidp_planes.c                |  14 +-
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  96 ++-
 drivers/gpu/drm/bridge/display-connector.c         |  15 +
 drivers/gpu/drm/drm_buddy.c                        |   3 +
 drivers/gpu/drm/drm_crtc_helper.c                  |  12 +-
 drivers/gpu/drm/drm_edid.c                         |   8 +-
 drivers/gpu/drm/drm_gem.c                          |   3 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   2 +-
 drivers/gpu/drm/drm_modes.c                        |   4 +-
 drivers/gpu/drm/drm_vblank.c                       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |  10 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  42 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   3 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   5 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   4 +-
 drivers/gpu/drm/i915/i915_deps.c                   |   2 +-
 drivers/gpu/drm/i915/i915_request.c                |   3 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  17 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   3 +-
 drivers/gpu/drm/ingenic/Kconfig                    |   9 +
 drivers/gpu/drm/ingenic/Makefile                   |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  28 +-
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c          | 103 +++
 drivers/gpu/drm/lima/lima_gem.c                    |   7 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  17 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  12 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |  17 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  31 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   3 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   3 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |   9 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |   4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  13 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |  14 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |  12 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   3 +-
 drivers/gpu/drm/solomon/Kconfig                    |   9 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |  11 +
 drivers/gpu/drm/solomon/ssd130x.c                  |  73 ++-
 drivers/gpu/drm/solomon/ssd130x.h                  |   2 +
 drivers/gpu/drm/sti/sti_gdp.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |  22 +-
 drivers/gpu/drm/stm/ltdc.c                         |  16 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  37 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  27 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  34 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   8 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   4 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   6 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  26 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  39 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |  13 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   5 -
 drivers/infiniband/core/umem_dmabuf.c              |   3 +-
 drivers/video/fbdev/core/fbcon.c                   | 720 ++++++++++-------=
----
 drivers/video/fbdev/core/fbcon.h                   |   8 +-
 drivers/video/fbdev/core/fbmem.c                   |  27 +-
 drivers/video/fbdev/core/fbsysfs.c                 |   2 +
 include/drm/ttm/ttm_bo_api.h                       |   2 -
 include/drm/ttm/ttm_bo_driver.h                    |  11 +-
 include/drm/ttm/ttm_resource.h                     |   3 +-
 include/linux/dma-buf.h                            |  24 +-
 include/linux/dma-resv.h                           | 180 ++++--
 include/linux/fb.h                                 |   1 -
 include/linux/seqlock.h                            |   8 +-
 kernel/futex/futex.h                               |   1 +
 117 files changed, 1823 insertions(+), 1428 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

--psekeudunrkp6i2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlfPfQAKCRDj7w1vZxhR
xWSrAQCfxozLyRZMLXwFk7c7aDXFbzTm3LQAlu46sgtGDXuAfgD/f35uOD5ZZir9
/ASUfi88nzpdMtlVCTypCLyDoVTXJAg=
=ob/W
-----END PGP SIGNATURE-----

--psekeudunrkp6i2f--
