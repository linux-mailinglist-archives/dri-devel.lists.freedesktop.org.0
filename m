Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F6509816
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA0210F431;
	Thu, 21 Apr 2022 06:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B0310F367;
 Thu, 21 Apr 2022 06:59:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 77AE03202287;
 Thu, 21 Apr 2022 02:59:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 21 Apr 2022 02:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1650524391; x=1650610791; bh=+oTDUcx1dvE7fFQm55vYFKuSJDTAtfAmpCM
 bCerI3Z8=; b=SFEIpeIrYUmjNZWi62XTxU+sZzvVregFPAveqXrtJgtTqKASGn+
 nrSass+4513NzNlIjzMGsc22xwoXF7MHUppGzZyBHM0gXP+jyLFEDgodR0GEVCej
 Aj6mUiWkoRqUn67C9CJE4PBoq+fIvkIkMnlptIYXDiGI3nG1eP0UGcbrzBDf+PvY
 21OIpS3rdub5WXInp2O27QWt4DT3PJ9Kyw+1nHMUsaRhLyfzzVwE2cXCe9EkNhG/
 uuABqoEbcQFq6/qoqceniCQ4K56PLn3vwgOUMksNXZG+jNNhQrk6HnsWLXxSVvXT
 gW+kwxLQAm5t3DK4BEIDjoFJSySLE/0HCGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650524391; x=1650610791; bh=+oTDUcx1dvE7f
 FQm55vYFKuSJDTAtfAmpCMbCerI3Z8=; b=hx9p6s4Z3ICevU+79DLgSHu+demlA
 LRtNH4Q4L1kjYV0JjMHhxlkmETbcrBUhEIuFvKsVJNazjwVYR1luN2l2OVOMTBHd
 wuiYl2k/q79tY34ZxxCT+HX2IwVoNk3lIpCZB2cS7zdlBfBsNhIcdohgcEM0NJ7m
 9E4UD+i1pGeLRhz5jikvuo+apTLT5irXkF7PMU9anDqytmWLtR2ogoes3oPZnv/C
 ggYHn3XBvZw/jcW7kqfjMishboY8POginpSgmuCKfPaUcQi5tAnXupUTIsBxfldJ
 4N7iSJGtlkqdozrYM/y4demIy+JnLmB8HaiLnnpXYQyBuU9AC8vbCWVBA==
X-ME-Sender: <xms:5wBhYnXBLpKyPtE7QH-7VyHxrH8TmPBNwOCwex1rCansziTDEV24oA>
 <xme:5wBhYvmYiVVX128Tq2BOjt2c0gi1YIcN0pBhJkKMK6ToECqFC_xiu0tvEsLKbjYwe
 CmLviX8EidZBhS0CgQ>
X-ME-Received: <xmr:5wBhYjYw8vVsdb9Y9GAiVFo_dy0wpI2yKDKNg25QocuhENxZP7-dwMaQtMxk6jdSqDvzG2Qy1RAzK3P33qnfEoFfVnIVZFgiqjty9hE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:5wBhYiV3GtpsOSEwANsi3JTUMzp8Ynagm46j3IIb3IHeXkH4a8SWAA>
 <xmx:5wBhYhm9r8xUKg1q5yz7UzfhywVFTLPpSzNlXDb4kiUKFnqlqMP2Zw>
 <xmx:5wBhYveVqoxZLncVDmaX8QqBkfGlrLaxa4wMNHp4zFPLD_xjQhhKQA>
 <xmx:5wBhYqfH0_c8K1_EZ5JizaDPjS9Kvwlpm71Qy29e7Ugpsf2al89AdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 02:59:51 -0400 (EDT)
Date: Thu, 21 Apr 2022 08:59:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220421065948.2pyp3j7acxtl6pz5@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2bhz6ea7uk6s7544"
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


--2bhz6ea7uk6s7544
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-04-21:
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - of: Create a platform_device for offb

Core Changes:
  - edid: block read refactoring
  - ttm: Add common debugfs code for resource managers

Driver Changes:
  - bridges:
    - adv7611: Enable DRM_BRIDGE_OP_HPD if there's an interrupt
    - anx7625: Fill ELD if no monitor is connected
    - dw_hdmi: Add General Parallel Audio support
    - icn6211: Add data-lanes DT property
    - new driver: Lontium LT9211
  - nouveau: make some structures static
  - tidss: Reset DISPC on startup
  - solomon: SPI Support and DT bindings improvements
The following changes since commit c54b39a565227538c52ead2349eb17d54aadd6f7:

  Merge tag 'drm-intel-next-2022-04-13-1' of git://anongit.freedesktop.org/=
drm/drm-intel into drm-next (2022-04-14 12:03:09 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-04-21

for you to fetch changes up to 40d8d4bd06720aed6c1125bab7296c57de4f1157:

  drm/radeon: Use TTM builtin resource manager debugfs code (2022-04-20 21:=
06:02 -0400)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - of: Create a platform_device for offb

Core Changes:
  - edid: block read refactoring
  - ttm: Add common debugfs code for resource managers

Driver Changes:
  - bridges:
    - adv7611: Enable DRM_BRIDGE_OP_HPD if there's an interrupt
    - anx7625: Fill ELD if no monitor is connected
    - dw_hdmi: Add General Parallel Audio support
    - icn6211: Add data-lanes DT property
    - new driver: Lontium LT9211
  - nouveau: make some structures static
  - tidss: Reset DISPC on startup
  - solomon: SPI Support and DT bindings improvements

----------------------------------------------------------------
Arunpravin Paneer Selvam (2):
      drm/amdgpu: add drm buddy support to amdgpu
      drm: add a check to verify the size alignment

Biju Das (1):
      drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD interrupt

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

Devarsh Thakkar (1):
      drm/tidss: Soft Reset DISPC on startup

H. Nikolaus Schaller (1):
      drm/bridge: display-connector: add ddc-en gpio support

Helge Deller (1):
      Revert "video: fbdev: fbmem: fix pointer reference to null device fie=
ld"

Hsin-Yi Wang (1):
      drm/bridge: anx7625: Fill in empty ELD when no connector

Imre Deak (1):
      drm/dp: Factor out a function to probe a DPCD address

Jani Nikula (12):
      drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
      drm/edid: have edid_block_check() detect blocks that are all zero
      drm/edid: refactor EDID block status printing
      drm/edid: add a helper to log dump an EDID block
      drm/edid: pass struct edid to connector_bad_edid()
      drm/edid: add typedef for block read function
      drm/edid: abstract an EDID block read helper
      drm/edid: use EDID block read helper in drm_do_get_edid()
      drm/edid: convert extension block read to EDID block read helper
      drm/edid: drop extra local var
      drm/edid: add single point of return to drm_do_get_edid()
      drm/edid: add EDID block count and size helpers

Javier Martinez Canillas (6):
      drm/vc4: Use newer fence API properly to fix build errors
      dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
      dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
      drm/solomon: Add ssd130x new compatible strings and deprecate old one=
s.
      drm/solomon: Move device info from ssd130x-i2c to the core driver
      drm/solomon: Add SSD130x OLED displays SPI support

Jiasheng Jiang (1):
      drm: mali-dp: potential dereference of null pointer

Julia Lawall (1):
      drm/sti: fix typos in comments

Liviu Dudau (1):
      drm/komeda: return early if drm_universal_plane_init() fails.

Marek Szyprowski (1):
      drm: bridge: panel: Register connector if DRM device is already regis=
tered

Marek Vasut (7):
      drm: bridge: icn6211: Convert to regmap
      drm/panel: lvds: Simplify mode parsing
      drm/panel: lvds: Use bus_flags from DT panel-timing property
      dt-bindings: display: bridge: lt9211: Add Lontium LT9211 bridge driver
      drm/bridge: lt9211: Add Lontium LT9211 bridge driver
      dt-bindings: display: bridge: icn6211: Document DSI data-lanes proper=
ty
      drm: bridge: icn6211: Add DSI lane count DT property parsing

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

N=EDcolas F. R. A. Prado (1):
      drm/bridge: anx7625: Use uint8 for lane-swing arrays

Paul Boddie (1):
      drm/ingenic: Add dw-hdmi driver specialization for jz4780

Paul Cercueil (2):
      drm/ingenic: Implement proper .atomic_get_input_bus_fmts
      Merge drm/drm-next into drm-misc-next

Randy Dunlap (1):
      drm: sti: don't use kernel-doc markers

Robin Murphy (1):
      drm/arm/malidp: Stop using iommu_present()

Sandor Yu (4):
      drm: bridge: dw_hdmi: default enable workaround to clear the overflow
      drm: bridge: dw_hdmi: Enable GCP only for Deep Color
      drm: bridge: dw_hdmi: add reset function for PHY GEN1
      drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver

Thomas Zimmermann (2):
      of: Create platform devices for OF framebuffers
      fbdev: Warn in hot-unplug workaround for framebuffers without device

Tom Rix (2):
      drm/nouveau: change base917c_format from global to static
      drm/nouveau/gr/gf100-: change gf108_gr_fwif from global to static

Ville Syrj=E4l=E4 (2):
      drm: Use drm_mode_init() for on-stack modes
      drm: Use drm_mode_copy()

Xiaomeng Tong (2):
      stm: ltdc: fix two incorrect NULL checks on list iterator
      drm/gma500: fix a potential repeat execution in psb_driver_load

Yang Guang (1):
      fbcon: replace snprintf in show functions with sysfs_emit

Zack Rusin (5):
      drm/ttm: Add common debugfs code for resource managers
      drm/vmwgfx: Add debugfs entries for various ttm resource managers
      drm/amdgpu: Use TTM builtin resource manager debugfs code
      drm/qxl: Use TTM builtin resource manager debugfs code
      drm/radeon: Use TTM builtin resource manager debugfs code

Zhou Qingyang (1):
      drm/komeda: Fix an undefined behavior bug in komeda_plane_add()

Zhouyi Zhou (1):
      video: fbdev: fbmem: fix pointer reference to null device field

 .../bindings/display/bridge/chipone,icn6211.yaml   |  18 +-
 .../bindings/display/bridge/lontium,lt9211.yaml    | 117 +++
 .../bindings/display/solomon,ssd1307fb.yaml        |  95 ++-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/dma-buf/dma-buf.c                          |  22 +-
 drivers/dma-buf/dma-resv.c                         | 401 +++++------
 drivers/dma-buf/st-dma-resv.c                      | 111 +--
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  89 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 359 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |  89 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |  10 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |   5 +-
 drivers/gpu/drm/arm/malidp_planes.c                |  14 +-
 drivers/gpu/drm/bridge/Kconfig                     |  14 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   6 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  24 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   4 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           | 119 ++-
 drivers/gpu/drm/bridge/display-connector.c         |  15 +
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 802 +++++++++++++++++=
++++
 drivers/gpu/drm/bridge/panel.c                     |   7 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |  10 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c | 199 +++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 186 ++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h          |  16 +-
 drivers/gpu/drm/dp/drm_dp.c                        |  33 +-
 drivers/gpu/drm/drm_buddy.c                        |   3 +
 drivers/gpu/drm/drm_crtc_helper.c                  |  12 +-
 drivers/gpu/drm/drm_edid.c                         | 358 +++++----
 drivers/gpu/drm/drm_gem.c                          |   3 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   2 +-
 drivers/gpu/drm/drm_modes.c                        |   4 +-
 drivers/gpu/drm/drm_vblank.c                       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |  10 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   5 +-
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
 drivers/gpu/drm/nouveau/dispnv50/base917c.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  17 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  12 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |  17 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c     |   2 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  31 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   3 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   3 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  39 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   3 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |   9 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |   4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  13 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |  14 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  36 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |  12 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   3 +-
 drivers/gpu/drm/solomon/Kconfig                    |  18 +-
 drivers/gpu/drm/solomon/Makefile                   |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |  56 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              | 178 +++++
 drivers/gpu/drm/solomon/ssd130x.c                  | 108 ++-
 drivers/gpu/drm/solomon/ssd130x.h                  |  16 +
 drivers/gpu/drm/sti/sti_gdp.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |  22 +-
 drivers/gpu/drm/stm/ltdc.c                         |  16 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  18 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |  37 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  27 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  34 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   8 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  34 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |   4 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   6 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  26 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  39 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |  13 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  18 +
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   5 -
 drivers/infiniband/core/umem_dmabuf.c              |   3 +-
 drivers/of/platform.c                              |  83 ++-
 drivers/video/fbdev/core/fbcon.c                   | 724 +++++++++--------=
--
 drivers/video/fbdev/core/fbcon.h                   |   8 +-
 drivers/video/fbdev/core/fbmem.c                   |  37 +-
 drivers/video/fbdev/core/fbsysfs.c                 |   2 +
 drivers/video/fbdev/offb.c                         | 100 ++-
 include/drm/bridge/dw_hdmi.h                       |  11 +-
 include/drm/dp/drm_dp_helper.h                     |   1 +
 include/drm/ttm/ttm_bo_api.h                       |   2 -
 include/drm/ttm/ttm_bo_driver.h                    |  11 +-
 include/drm/ttm/ttm_resource.h                     |   7 +-
 include/linux/dma-buf.h                            |  24 +-
 include/linux/dma-resv.h                           | 180 +++--
 include/linux/fb.h                                 |   1 -
 include/linux/seqlock.h                            |   8 +-
 kernel/futex/futex.h                               |   1 +
 146 files changed, 4031 insertions(+), 1849 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontiu=
m,lt9211.yaml
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9211.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

--2bhz6ea7uk6s7544
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmEA5AAKCRDj7w1vZxhR
xYobAP4kqnciF7RZoP9cGh/cNNHP4nFbgiSS8+sUh3G58kYQzwD+LrzJ+jf8oE8k
hK/xHV3UM4kGjX98Nm8vbiw4uhBEMws=
=2EMv
-----END PGP SIGNATURE-----

--2bhz6ea7uk6s7544--
