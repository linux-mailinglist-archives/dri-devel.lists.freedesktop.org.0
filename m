Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8560585E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6B10E383;
	Thu, 20 Oct 2022 07:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2D10E383;
 Thu, 20 Oct 2022 07:24:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A1CC32B066F7;
 Thu, 20 Oct 2022 03:24:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 03:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1666250649; x=1666257849; bh=JcaU5FVi6AAwhCT+KtcSfksN9OhkwnuuXRF
 y5u6mfXI=; b=fKnscPYoiUZxZ4LJaPh+7+QJGliY8EHkhlNNpvL+dfe5rrB9k9k
 ZY/hQIUk+yh6TIr2PbwwXBaC1cydVLPd+bYYG1jjdefvuzLXhpb/wCHraWJFo6x5
 bUjvWKtLehmoVD6xPYvdWF8Dg0dFp/sjGd6W6jBInBNcZd8JrzrVu3f5RSTA65R4
 EqlE6EnXoeod+HC4k1pCe+rzbvLSCnJIhmfqxSO9awUz/f7ZJMF0fwuqmUtoznAi
 2KBx133PhhyPWbe38Rm0oswYPwdb/t1FbtgQf4Xk8KqAAEH1t9s85veRZy1fnKMs
 io2+1OinpVzAsWbWO6jVKahP/5Xm4hyu3eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666250649; x=
 1666257849; bh=JcaU5FVi6AAwhCT+KtcSfksN9OhkwnuuXRFy5u6mfXI=; b=F
 uRqzcyhHdcEg7csOXBwaqt5iYOCQie4u/bFSDheOO2bqg/KgoPWXwOX45X7SIb1B
 vekBAFMRYZCB1TO8hr4ZsALjHWcVFtHK7qWpQkpYpgTg4MyBh9UaM8ABXei16O5m
 lXtdfdiikISJK1D6XiXR7xOsHXjVGmGIsthBglttJFVCsn4rZGhQSB+VpcOXmL2N
 5NazBpha+9NmulH5hmiy3piYMnwNctkbg0ZHL9NQEIYlvDDhJs4b00LtzxHfKPLA
 SOR/nVMv7t+nzUFswJvmlnd2/QvP+f0tsg4iYxd9kuxGQhw92SzcWDEQBgKrUv58
 9+tl6d536Q8U/SlK4uucg==
X-ME-Sender: <xms:mPdQY-hByFAP3PySLRXz8rb9v-Z6wrwMUNv0CxByMyaQnWiHY5C1zg>
 <xme:mPdQY_CbUIozK6b_StvoIMb0xDrXP-tIElgQiuvoHeVyrKb81Qz2eEDdzNWUcGdo4
 4vCXDLHFcSoAsmh5Lg>
X-ME-Received: <xmr:mPdQY2FdDCkjf5IR_N6QRRnL_59QZ6WKpIVQQbJ_KvA-zOH8Ey92-SN8sbF_JCIlH1vP3t4GrGeghrfSY2ouK6Sh8Zf2zfEiAkCj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkeehjeeguefhtefhgfehkeehudefudfhjefgheffkedufeegudfghfekfefh
 vedvnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:mfdQY3RUeA6dUVvK8OVaNoxfUlxikhm_BOX349vaOyfeGjVPCDNfUg>
 <xmx:mfdQY7zxT_RIu0bDch5du8Vy9lsnL2neJy2Kpx0bXRMWAsqtLuC-cw>
 <xmx:mfdQY15xbzvrt9GP_kgchtFeaeKnbYi4YhfX11Eqba_i7yyAAPDQfQ>
 <xmx:mfdQYyhwzPkAU3OVer2vjXYIBgx3nmAhIMU_1JndzDlfYLkBUn63H9b5hjE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 03:24:08 -0400 (EDT)
Date: Thu, 20 Oct 2022 09:24:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221020072405.g3o4hxuk75gmeumw@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="it2hlqa4etx4kqus"
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


--it2hlqa4etx4kqus
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-10-20:
drm-misc-next for 6.2:

UAPI Changes:
  - Documentation for page-flip flags

Cross-subsystem Changes:
  - dma-buf: Add unlocked variant of vmapping and attachment-mapping
    functions

Core Changes:
  - atomic-helpers: CRTC primary plane test fixes
  - connector: TV API consistency improvements, cmdline parsing
    improvements
  - crtc-helpers: Introduce drm_crtc_helper_atomic_check() helper
  - edid: Fixes for HFVSDB parsing,
  - fourcc: Addition of the Vivante tiled modifier
  - makefile: Sort and reorganize the objects files
  - mode_config: Remove fb_base from drm_mode_config_funcs
  - sched: Add a module parameter to change the scheduling policy,
    refcounting fix for fences
  - tests: Sort the Kunit tests in the Makefile, improvements to the
    DP-MST tests
  - ttm: Remove unnecessary drm_mm_clean() call

Driver Changes:
  - New driver: ofdrm
  - Move all drivers to a common dma-buf locking convention
  - bridge:
    - adv7533: Remove dynamic lane switching
    - it6505: Runtime PM support
    - ps8640: Handle AUX defer messages
    - tc358775: Drop soft-reset over I2C
  - ast: Atomic Gamma LUT Support, Convert to SHMEM, various
    improvements
  - lcdif: Support for YUV planes
  - mgag200: Fix PLL Setup on some revisions
  - udl: Modesetting improvements, hot-unplug support
  - vc4: Fix support for PAL-M
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-10-20

for you to fetch changes up to 7c99616e3fe7f35fe25bf6f5797267da29b4751e:

  drm: Remove drm_mode_config::fb_base (2022-10-19 21:46:16 -0400)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:
  - Documentation for page-flip flags

Cross-subsystem Changes:
  - dma-buf: Add unlocked variant of vmapping and attachment-mapping
    functions

Core Changes:
  - atomic-helpers: CRTC primary plane test fixes
  - connector: TV API consistency improvements, cmdline parsing
    improvements
  - crtc-helpers: Introduce drm_crtc_helper_atomic_check() helper
  - edid: Fixes for HFVSDB parsing,
  - fourcc: Addition of the Vivante tiled modifier
  - makefile: Sort and reorganize the objects files
  - mode_config: Remove fb_base from drm_mode_config_funcs
  - sched: Add a module parameter to change the scheduling policy,
    refcounting fix for fences
  - tests: Sort the Kunit tests in the Makefile, improvements to the
    DP-MST tests
  - ttm: Remove unnecessary drm_mm_clean() call

Driver Changes:
  - New driver: ofdrm
  - Move all drivers to a common dma-buf locking convention
  - bridge:
    - adv7533: Remove dynamic lane switching
    - it6505: Runtime PM support
    - ps8640: Handle AUX defer messages
    - tc358775: Drop soft-reset over I2C
  - ast: Atomic Gamma LUT Support, Convert to SHMEM, various
    improvements
  - lcdif: Support for YUV planes
  - mgag200: Fix PLL Setup on some revisions
  - udl: Modesetting improvements, hot-unplug support
  - vc4: Fix support for PAL-M

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge

Andrey Grodzovsky (1):
      drm/sched: Add FIFO sched policy to run queue

Ankit Nautiyal (4):
      drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
      drm/edid: Split DSC parsing into separate function
      drm/edid: Refactor HFVSDB parsing for DSC1.2
      drm/edid: Avoid multiple log lines for HFVSDB parsing

Christian K=F6nig (2):
      drm/scheduler: fix fence ref counting
      drm/sched: add missing NULL check in drm_sched_get_cleanup_job v2

Dmitry Osipenko (21):
      dma-buf: Add unlocked variant of vmapping functions
      dma-buf: Add unlocked variant of attachment-mapping functions
      drm/gem: Take reservation lock for vmap/vunmap operations
      drm/prime: Prepare to dynamic dma-buf locking specification
      drm/armada: Prepare to dynamic dma-buf locking specification
      drm/i915: Prepare to dynamic dma-buf locking specification
      drm/omapdrm: Prepare to dynamic dma-buf locking specification
      drm/tegra: Prepare to dynamic dma-buf locking specification
      drm/etnaviv: Prepare to dynamic dma-buf locking specification
      RDMA/umem: Prepare to dynamic dma-buf locking specification
      misc: fastrpc: Prepare to dynamic dma-buf locking specification
      xen/gntdev: Prepare to dynamic dma-buf locking specification
      media: videobuf2: Prepare to dynamic dma-buf locking specification
      media: tegra-vde: Prepare to dynamic dma-buf locking specification
      dma-buf: Move dma_buf_vmap() to dynamic locking specification
      dma-buf: Move dma_buf_attach() to dynamic locking specification
      dma-buf: Move dma_buf_map_attachment() to dynamic locking specificati=
on
      dma-buf: Move dma_buf_mmap() to dynamic locking specification
      dma-buf: Document dynamic locking convention
      media: videobuf2: Stop using internal dma-buf lock
      dma-buf: Remove obsoleted internal lock

Geert Uytterhoeven (1):
      drm/modes: parse_cmdline: Add support for named modes containing dash=
es

Jani Nikula (1):
      drm: split build lists one per line and sort

Jason Yen (1):
      drm/bridge: ps8640: Add software to support aux defer

Javier Martinez Canillas (5):
      drm/ssd130x: Iterate over damage clips instead of using a merged rect
      drm/mgag200: Do not call drm_atomic_add_affected_planes()
      drm/simpledrm: Do not call drm_atomic_add_affected_planes()
      drm/ssd130x: Do not call drm_atomic_add_affected_planes()
      drm/crtc-helper: Add a drm_crtc_helper_atomic_check() helper

Jilin Yuan (1):
      drm/edid: fix repeated words in comments

Jocelyn Falempe (2):
      drm/ast: Add Atomic gamma lut support for aspeed
      drm/mgag200: Fix PLL setup for G200_SE_A rev >=3D4

Kieran Bingham (1):
      drm: lcdif: Add support for YUV planes

Laurent Pinchart (3):
      drm: lcdif: Fix indentation in lcdif_regs.h
      drm: lcdif: Don't use BIT() for multi-bit register fields
      drm: lcdif: Switch to limited range for RGB to YUV conversion

Lucas Stach (1):
      drm/fourcc: add Vivante tile status modifiers

Mateusz Kwiatkowski (1):
      drm/vc4: vec: Fix definition of PAL-M mode

Maxime Ripard (6):
      drm/tests: Order Kunit tests in Makefile
      drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to avo=
id ambiguity
      drm/connector: Rename subconnector state variable
      drm/atomic: Add TV subconnector property to get/set_property
      drm/modes: Only consider bpp and refresh before options
      Merge drm/drm-next into drm-misc-next

Ma=EDra Canal (2):
      drm/tests: Split drm_test_dp_mst_calc_pbn_mode into parameterized tes=
ts
      drm/tests: Split drm_test_dp_mst_sideband_msg_req_decode into paramet=
erized tests

Pin-yen Lin (2):
      drm/bridge: it6505: Adapt runtime power management framework
      drm/bridge: it6505: Add pre_enable/post_disable callback

Simon Ser (1):
      drm: document uAPI page-flip flags

Teresa Remmet (1):
      drm/bridge: tc358775: Do not soft reset i2c-slave controller

Thomas Zimmermann (31):
      drm/udl: Rename struct udl_drm_connector to struct udl_connector
      drm/udl: Test pixel limit in mode-config's mode-valid function
      drm/udl: Use USB timeout constant when reading EDID
      drm/udl: Various improvements to the connector
      drm/udl: Move connector to modesetting code
      drm/udl: Remove udl_simple_display_pipe_mode_valid()
      drm/udl: Convert to atomic-modesetting helpers
      drm/udl: Simplify modesetting in CRTC's enable function
      drm/udl: Support DRM hot-unplugging
      drm/udl: Use damage iterator
      drm/udl: Move register constants to udl_proto.h
      drm/udl: Add constants for display-mode registers
      drm/udl: Add register constants for color depth
      drm/udl: Add register constants for video locks
      drm/udl: Add register constants for framebuffer scanout addresses
      drm/udl: Add constants for commands
      drm/atomic-helper: Don't allocate new plane state in CRTC check
      drm/atomic-helper: Replace drm_atomic_helper_check_crtc_state()
      drm/ofdrm: Add ofdrm for Open Firmware framebuffers
      drm/ofdrm: Add CRTC state
      drm/ofdrm: Add per-model device function
      drm/ofdrm: Support color management
      drm/ofdrm: Support big-endian scanout buffers
      drm/ast: Acquire I/O-register lock in atomic_commit_tail function
      drm/ast: Call drm_atomic_helper_check_plane_state() unconditionally
      drm/ast: Do not call drm_atomic_add_affected_planes()
      drm/ast: Remove cursor double buffering
      drm/ast: Rename struct ast_cursor_plane to struct ast_plane
      drm/ast: Style cleanups in plane code
      drm/ast: Convert ast to SHMEM
      drm/ast: Avoid reprogramming primary-plane scanout address

Ville Syrj=E4l=E4 (8):
      drm/edid: Clarify why we only accept the "range limits only" descript=
or
      drm/edid: Define more flags
      drm/edid: Only parse VRR range for continuous frequency displays
      drm/edid: Extract drm_gtf2_mode()
      drm/edid: Use GTF2 for inferred modes
      drm/edid: Use the correct formula for standard timings
      drm/edid: Unconfuse preferred timing stuff a bit
      drm/edid: Make version checks less convoluted

Wei Yongjun (3):
      drm/panel: db7430: Silent no spi_device_id warning
      drm/panel: tpg110: Silent no spi_device_id warning
      drm/panel: ws2401: Silent no spi_device_id warning

Zack Rusin (1):
      drm: Remove drm_mode_config::fb_base

Zeng Heng (1):
      drm/ttm: Remove unnecessary drm_mm_clean

ruanjinjie (1):
      drm/nouveau/disp: fix cast removes address space of expression warnin=
gs

 Documentation/driver-api/dma-buf.rst               |    6 +
 MAINTAINERS                                        |    1 +
 drivers/dma-buf/dma-buf.c                          |  216 ++-
 drivers/gpu/drm/Makefile                           |  107 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    2 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    2 -
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    2 -
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    2 -
 drivers/gpu/drm/armada/armada_gem.c                |    8 +-
 drivers/gpu/drm/ast/Kconfig                        |    4 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    4 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   34 +-
 drivers/gpu/drm/ast/ast_main.c                     |    5 +-
 drivers/gpu/drm/ast/ast_mm.c                       |   14 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  501 +++----
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   18 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   25 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   58 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    9 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    2 +-
 drivers/gpu/drm/display/Makefile                   |   14 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   60 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |    6 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_client.c                       |    4 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |   26 +
 drivers/gpu/drm/drm_edid.c                         |  346 +++--
 drivers/gpu/drm/drm_format_helper.c                |   10 +
 drivers/gpu/drm/drm_gem.c                          |   24 +
 drivers/gpu/drm/drm_gem_dma_helper.c               |    6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    6 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    9 +-
 drivers/gpu/drm/drm_modes.c                        |   18 +-
 drivers/gpu/drm/drm_plane_helper.c                 |    4 +-
 drivers/gpu/drm/drm_prime.c                        |    6 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    6 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    1 +
 drivers/gpu/drm/gud/gud_connector.c                |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   16 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |    3 -
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   14 +
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   16 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |    3 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   11 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    2 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |  239 +++-
 drivers/gpu/drm/mxsfb/lcdif_regs.h                 |   37 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    1 -
 drivers/gpu/drm/nouveau/nv04_fbcon.c               |    6 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    2 -
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |    4 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |    7 +
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |    7 +
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |    7 +
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    6 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |    2 -
 drivers/gpu/drm/qxl/qxl_object.c                   |   17 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    2 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |    2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   26 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   96 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   37 +-
 drivers/gpu/drm/tegra/fb.c                         |    1 -
 drivers/gpu/drm/tegra/gem.c                        |   17 +-
 drivers/gpu/drm/tests/Makefile                     |   14 +-
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |  445 +++---
 drivers/gpu/drm/tiny/Kconfig                       |   13 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/bochs.c                       |    1 -
 drivers/gpu/drm/tiny/ofdrm.c                       | 1424 ++++++++++++++++=
++++
 drivers/gpu/drm/tiny/simpledrm.c                   |   16 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    1 -
 drivers/gpu/drm/udl/Makefile                       |    2 +-
 drivers/gpu/drm/udl/udl_connector.c                |  139 --
 drivers/gpu/drm/udl/udl_connector.h                |   15 -
 drivers/gpu/drm/udl/udl_drv.h                      |   42 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  572 +++++---
 drivers/gpu/drm/udl/udl_proto.h                    |   68 +
 drivers/gpu/drm/udl/udl_transfer.c                 |    7 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |    8 +-
 drivers/infiniband/core/umem_dmabuf.c              |    7 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   22 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   19 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   17 +-
 .../media/platform/nvidia/tegra-vde/dmabuf-cache.c |    6 +-
 drivers/misc/fastrpc.c                             |    6 +-
 drivers/video/fbdev/Kconfig                        |    1 +
 drivers/xen/gntdev-dmabuf.c                        |    8 +-
 include/drm/drm_atomic_helper.h                    |    3 +-
 include/drm/drm_atomic_state_helper.h              |    2 +-
 include/drm/drm_connector.h                        |    4 +-
 include/drm/drm_crtc_helper.h                      |    2 +
 include/drm/drm_edid.h                             |   14 +-
 include/drm/drm_gem.h                              |    3 +
 include/drm/drm_mode_config.h                      |    2 -
 include/drm/gpu_scheduler.h                        |   32 +
 include/linux/dma-buf.h                            |   17 +-
 include/uapi/drm/drm_fourcc.h                      |   29 +
 include/uapi/drm/drm_mode.h                        |   63 +-
 110 files changed, 3854 insertions(+), 1358 deletions(-)
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.h
 create mode 100644 drivers/gpu/drm/udl/udl_proto.h

--it2hlqa4etx4kqus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1D3lQAKCRDj7w1vZxhR
xamSAQC5o07ZwefDIWU9tx9qwxGrtuz60gRkbU/4OOCAdmkApQD/dfPEGVsz53HD
xon9AV2w5TiNjLKbwoMYMGjJjkwuigM=
=kRl7
-----END PGP SIGNATURE-----

--it2hlqa4etx4kqus--
