Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC240D3CF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 09:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA866EAC5;
	Thu, 16 Sep 2021 07:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E9B6EAC1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 07:31:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D95E580E7E;
 Thu, 16 Sep 2021 03:31:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Sep 2021 03:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=6oYCZ7JLyEEl0EuOcZvPcsvDTpEUHZ+NjqsOam/V6Pg=; b=JUC3QvXP
 tnUg8y6pxanD8XPQLTn3oKju4B8D9goCBzQRGh22W2U7l5y8AFmC+lWwOn/eLm7q
 ZEOQQhmTdPfxTSGIw6/TVN/OB6kQrYCVWUQB1CWgFXSuSZ09XjvNrSPBo2tmY+Sv
 Y/IPfGBLJpSECDjkYqPGfKmkBa1AyIYBaD5v66dp4N8GJCz+vp1DQiNtJqqFCySe
 bygZ75mpuQxxFQ4AIzEN90Ep+wQw0n1NjrRYOQx+5At36PkXcmgBXhUstXdAhs2G
 naXsGBAn3MoPX/gLvazD4aY1u/S123IATPxrdOizcgFohdPgmHnMXGLaBQCxT1Nz
 BurP3goQDB2WqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=6oYCZ7JLyEEl0EuOcZvPcsvDTpEUH
 Z+NjqsOam/V6Pg=; b=HQMSAKhbAbRAdG+KphLUlew0GD10cfxz8eQ0N09M+SZC7
 18kNUvVDRFY0mlrI7Dhw5SszHz2OeO8aIza333z0iyzW7c0Eb8c19cWds/P8PtBA
 ADO4OrDCDqPQh90Pl62EatoOpZlcntJOAm+Aq89TppwmHCJMNkqmUWEgPMRhOGD1
 DF6r2i7daCXmNTi0hPxIJjs01TgNUyzJKFhbCO56IOfIluKfg2ywWhfJ5GvYrPhI
 wM/xfSBF3Qmay+srWjBNFMPxWmgXKwyjZdw+yPt2GmngKBreH1oGX9zgok4GZ0Qs
 WLEAuW76HqgAwet0Bm5Rt+hiojOGGZ049fpEoZZ8g==
X-ME-Sender: <xms:1_JCYVpDeniPnRuQ6LDKJ9GP0CrS7aFDI4I02Tgag26pC_1c-VW3sw>
 <xme:1_JCYXqlf48NQqlcc-EBi03ybyBE2ZFDXXg1nHJQh7M4CBBzr8BwTK0o1NF8sUAkB
 TCCSldTsADVgVlPOsg>
X-ME-Received: <xmr:1_JCYSNp3ReBhPoZM858mE8S7I1zrSEpbsKmoMQYJ9jgIhnIRikto301F_mHPrA73vBD05pL1ZFeXreK5EyanwghkxMVeatR106e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehfedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedthffhvdejhfejledtjeegffeiffeivdeuudegteegudejueffieelfefgfedu
 heenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1_JCYQ6i4qAFWH6Rq4k-9zkRa9p-vvkBBVFIzP2HevpscGv32gBV3w>
 <xmx:1_JCYU5YQ-MfyxlqwnLM6yGrBHRZZ03QO5ueU6iP1Kag2XTZHt_wAQ>
 <xmx:1_JCYYhJ0dEHueuxE41SSLlcHqLN6sp40V_FcfFB53EHKmrJBiTDVQ>
 <xmx:2PJCYVFiPGoe_BRiLIhxjenCf-orerTfelkGb22HMXBfucofK2Z5FA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 03:31:35 -0400 (EDT)
Date: Thu, 16 Sep 2021 09:31:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20210916073132.ptbbmjetm7v3ufq3@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nsbzyzo4xffmhlhq"
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


--nsbzyzo4xffmhlhq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's the first drm-misc-next PR for 5.16

Thanks!
Maxime

drm-misc-next-2021-09-16:
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Avoid a warning with some allocations, Remove
    DMA_FENCE_TRACE macros

Core Changes:
  - bridge: New helper to git rid of panels in drivers
  - fence: Improve dma_fence_add_callback documentation, Improve
    dma_fence_ops->wait documentation
  - ioctl: Unexport drm_ioctl_permit
  - lease: Documentation improvements
  - fourcc: Add new macro to determine the modifier vendor
  - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
    Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
  - resv: Improve the documentation
  - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
  - sched: Fix for a timer being canceled too soon, Avoid null pointer
    derefence if the fence is null in drm_sched_fence_free, Convert
    drivers to rely on its dependency tracking
  - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
    shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
    unbinding on multiple drivers

Driver Changes:
  - bochs: New PCI IDs
  - msm: Fence ordering impromevemnts
  - stm: Add layer alpha support, zpos
  - v3d: Fix for a Vulkan CTS failure
  - vc4: Conversion to the new bridge helpers
  - vgem: Use shmem helpers
  - virtio: Support mapping exported vram
  - zte: Remove obsolete driver

  - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
    errors propagation improvements for anx7625

  - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1
The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-09-16

for you to fetch changes up to e4f868191138975f2fdf2f37c11318b47db4acc9:

  drm/v3d: fix wait for TMU write combiner flush (2021-09-15 18:43:37 +0100)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Avoid a warning with some allocations, Remove
    DMA_FENCE_TRACE macros

Core Changes:
  - bridge: New helper to git rid of panels in drivers
  - fence: Improve dma_fence_add_callback documentation, Improve
    dma_fence_ops->wait documentation
  - ioctl: Unexport drm_ioctl_permit
  - lease: Documentation improvements
  - fourcc: Add new macro to determine the modifier vendor
  - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
    Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
  - resv: Improve the documentation
  - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
  - sched: Fix for a timer being canceled too soon, Avoid null pointer
    derefence if the fence is null in drm_sched_fence_free, Convert
    drivers to rely on its dependency tracking
  - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
    shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
    unbinding on multiple drivers

Driver Changes:
  - bochs: New PCI IDs
  - msm: Fence ordering impromevemnts
  - stm: Add layer alpha support, zpos
  - v3d: Fix for a Vulkan CTS failure
  - vc4: Conversion to the new bridge helpers
  - vgem: Use shmem helpers
  - virtio: Support mapping exported vram
  - zte: Remove obsolete driver

  - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
    errors propagation improvements for anx7625

  - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1

----------------------------------------------------------------
Alyssa Rosenzweig (2):
      drm/panfrost: Use upper/lower_32_bits helpers
      drm/plane: Fix comment typo

Andrey Grodzovsky (2):
      drm/ttm: Create pinned list
      drm/ttm: Clear all DMA mappings on demand

Boris Brezillon (2):
      panfrost: Don't cleanup the job if it was successfully queued
      drm/sched: Fix drm_sched_fence_free() so it can be passed an uninitia=
lized fence

Cai Huoqing (7):
      drm/bridge: cdns: Make use of the helper function devm_platform_iorem=
ap_resource()
      drm: adv7511: Convert to SPDX identifier
      drm/vc4: Make use of the helper function devm_platform_ioremap_resour=
ce()
      drm/sun4i: Make use of the helper function devm_platform_ioremap_reso=
urce()
      drm/panfrost: Make use of the helper function devm_platform_ioremap_r=
esource()
      drm/mcde: Make use of the helper function devm_platform_ioremap_resou=
rce()
      drm/meson: Make use of the helper function devm_platform_ioremap_reso=
urcexxx()

Charan Teja Reddy (1):
      dma-buf: WARN on dmabuf release with pending attachments

Christian K=F6nig (21):
      dma-buf: nuke seqno-fence
      drm/vmwgfx: unbind in vmw_ttm_unpopulate
      drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
      drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
      drm/radeon: unbind in radeon_ttm_tt_unpopulate()
      drm/ttm: remove ttm_tt_destroy_common v2
      mm/vmscan: add sync_shrinkers function v3
      drm/ttm: optimize the pool shrinker a bit v2
      dma-buf: nuke DMA_FENCE_TRACE macros v2
      dma-buf: cleanup kerneldoc of removed component
      dma-buf: clarify dma_fence_ops->wait documentation
      dma-buf: clarify dma_fence_add_callback documentation
      drm/ttm: cleanup ttm_resource_compat
      drm/ttm: remove the outdated kerneldoc section
      drm/ttm: add some general module kerneldoc
      drm/ttm: add kerneldoc for enum ttm_caching
      drm/ttm: enable TTM device object kerneldoc v2
      drm/ttm: enable TTM resource object kerneldoc v2
      drm/ttm: enable TTM placement kerneldoc
      drm/ttm: enable TTM TT object kerneldoc v2
      drm/ttm: enable TTM page pool kerneldoc

Christophe JAILLET (1):
      drm/r128: switch from 'pci_' to 'dma_' API

Daniel Vetter (16):
      drm/shmem-helper: Switch to vmf_insert_pfn
      drm/shmem-helpers: Allocate wc pages on x86
      drm/vgem: use shmem helpers
      drm/sched: Split drm_sched_job_init
      drm/msm: Improve drm/sched point of no return rules
      drm/sched: Barriers are needed for entity->last_scheduled
      drm/sched: Add dependency tracking
      drm/sched: drop entity parameter from drm_sched_push_job
      drm/sched: improve docs around drm_sched_entity
      drm/panfrost: use scheduler dependency tracking
      drm/lima: use scheduler dependency tracking
      drm/v3d: Move drm_sched_job_init to v3d_job_init
      drm/v3d: Use scheduler dependency handling
      drm/msm: Use scheduler dependency handling
      drm/msm: Don't break exclusive fence ordering
      dma-resv: Give the docs a do-over

David Stevens (1):
      drm/virtio: support mapping exported vram

Desmond Cheong Zhi Xi (1):
      drm: unexport drm_ioctl_permit

Douglas Anderson (1):
      drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01

F.A.Sulaiman (1):
      GPU: drm: fix style errors

H. Peter Anvin (Intel) (1):
      drm/bochs: add Bochs PCI ID for Simics model

Hans de Goede (11):
      drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (=
v2)
      drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-=
in-1
      drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book =
10.6
      drm: panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro
      drm/connector: Give connector sysfs devices there own device_type
      drm/connector: Add a fwnode pointer to drm_connector and register wit=
h ACPI (v2)
      drm/connector: Add drm_connector_find_by_fwnode() function (v3)
      drm/connector: Add support for out-of-band hotplug notification (v3)
      usb: typec: altmodes/displayport: Make dp_altmode_notify() more gener=
ic
      usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
      drm: panel-orientation-quirks: Add quirk for the Chuwi HiBook

Huang Rui (1):
      drm/ttm: fix the type mismatch error on sparc64

Iago Toral Quiroga (1):
      drm/v3d: fix wait for TMU write combiner flush

Javier Martinez Canillas (1):
      drm: Remove unused code to load the non-existing fbcon.ko

Jernej Skrabec (1):
      drm/sun4i: Fix macros in sun8i_csc.h

John Stultz (1):
      dma-buf: system_heap: Avoid warning on mid-order allocations

Krzysztof Kozlowski (1):
      dt-bindings: panel: ili9341: correct indentation

Lukas Bulwahn (4):
      drm: rockchip: remove reference to non-existing config DRM_RGB
      drm: v3d: correct reference to config ARCH_BRCMSTB
      drm: zte: remove obsolete DRM Support for ZTE SoCs
      drm: omap: remove obsolete selection of OMAP2_DSS in config DRM_OMAP

Markuss Broks (2):
      drm/panel: Add DT bindings for Samsung S6D27A1 display panel
      drm/panel: s6d27a1: Add driver for Samsung S6D27A1 display panel

Maxime Ripard (5):
      Merge tag 'drm-misc-intel-oob-hotplug-v1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/hansg/linux into drm-misc-next
      Merge drm/drm-next into drm-misc-next
      drm/bridge: Add a function to abstract away panels
      drm/vc4: dpi: Switch to devm_drm_of_get_bridge
      drm/vc4: dsi: Switch to devm_drm_of_get_bridge

Monk Liu (1):
      drm/sched: fix the bug of time out calculation(v4)

Paul Cercueil (2):
      drm/bridge: it66121: Initialize {device,vendor}_ids
      drm/bridge: it66121: Wait for next bridge to be probed

Philip Chen (1):
      drm/bridge: parade-ps8640: Reorg the macros

Raphael GALLAIS-POU - foss (1):
      drm/panel: otm8009a: add a 60 fps mode

Raphael Gallais-Pou (2):
      drm/stm: ltdc: attach immutable zpos property to planes
      drm/stm: ltdc: add layer alpha support

Robert Foss (2):
      drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()
      drm/bridge: anx7625: Propagate errors from sp_tx_edid_read()

Simon Ser (2):
      drm: document drm_mode_create_lease object requirements
      drm/panel-orientation-quirks: add Valve Steam Deck

Thierry Reding (3):
      drm/fourcc: Add macros to determine the modifier vendor
      drm/arm: malidp: Use fourcc_mod_is_vendor() helper
      drm/tegra: Use fourcc_mod_is_vendor() helper

Xin Ji (1):
      drm/bridge: anx7625: enable DSI EOTP

bibo mao (1):
      drm/qxl: User page size macro for qxl release bo

xinhui pan (1):
      drm/ttm: Try to check if new ttm man out of bounds during compile

zhangzhijie (1):
      drm: Improve the output_poll_changed description

 .../bindings/display/panel/ilitek,ili9341.yaml     |   2 +-
 .../bindings/display/panel/samsung,s6d27a1.yaml    |  98 +++
 Documentation/driver-api/dma-buf.rst               |   6 -
 Documentation/gpu/drm-mm.rst                       | 100 +--
 MAINTAINERS                                        |   6 +
 drivers/dma-buf/Makefile                           |   2 +-
 drivers/dma-buf/dma-buf.c                          |   1 +
 drivers/dma-buf/dma-fence.c                        |  13 +-
 drivers/dma-buf/dma-resv.c                         |  24 +-
 drivers/dma-buf/heaps/system_heap.c                |   5 +-
 drivers/dma-buf/seqno-fence.c                      |  71 --
 drivers/gpu/drm/Kconfig                            |   9 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  15 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  27 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   4 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   5 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  18 +-
 drivers/gpu/drm/drm_bridge.c                       |  41 +-
 drivers/gpu/drm/drm_connector.c                    |  79 ++
 drivers/gpu/drm/drm_crtc_internal.h                |   2 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  23 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   1 -
 drivers/gpu/drm/drm_ioctl.c                        |  21 +-
 drivers/gpu/drm/drm_kms_helper_common.c            |  11 -
 drivers/gpu/drm/drm_of.c                           |   3 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  49 +-
 drivers/gpu/drm/drm_sysfs.c                        |  87 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   4 +-
 drivers/gpu/drm/gud/Kconfig                        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   1 -
 drivers/gpu/drm/lima/lima_gem.c                    |   9 +-
 drivers/gpu/drm/lima/lima_sched.c                  |  28 +-
 drivers/gpu/drm/lima/lima_sched.h                  |   6 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |   4 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   3 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   4 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   5 -
 drivers/gpu/drm/msm/msm_gem_submit.c               |  35 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  12 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   2 -
 drivers/gpu/drm/omapdrm/Kconfig                    |   1 -
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  83 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c      | 320 +++++++
 drivers/gpu/drm/panel/panel-simple.c               |  26 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  29 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |  48 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |   5 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  12 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   4 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   1 -
 drivers/gpu/drm/r128/ati_pcigart.c                 |  11 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |  24 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   7 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   1 -
 drivers/gpu/drm/scheduler/sched_entity.c           | 140 ++--
 drivers/gpu/drm/scheduler/sched_fence.c            |  64 +-
 drivers/gpu/drm/scheduler/sched_main.c             | 199 ++++-
 drivers/gpu/drm/stm/ltdc.c                         |   7 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |   4 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   4 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   4 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |   4 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |   4 +-
 drivers/gpu/drm/tegra/fb.c                         |   2 +-
 drivers/gpu/drm/tegra/plane.c                      |   2 +-
 drivers/gpu/drm/tiny/Kconfig                       |   4 +-
 drivers/gpu/drm/tiny/bochs.c                       |   8 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |  67 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |  48 ++
 drivers/gpu/drm/ttm/ttm_module.c                   |  12 +
 drivers/gpu/drm/ttm/ttm_pool.c                     |  53 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   8 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  49 ++
 drivers/gpu/drm/ttm/ttm_tt.c                       |  17 +-
 drivers/gpu/drm/udl/Kconfig                        |   1 +
 drivers/gpu/drm/v3d/Kconfig                        |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      | 118 ++-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  44 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  15 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   6 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  28 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    | 342 +-------
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   8 +
 drivers/gpu/drm/virtio/virtgpu_prime.c             |  32 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c              |  61 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  10 +-
 drivers/gpu/drm/zte/Kconfig                        |  10 -
 drivers/gpu/drm/zte/Makefile                       |  10 -
 drivers/gpu/drm/zte/zx_common_regs.h               |  28 -
 drivers/gpu/drm/zte/zx_drm_drv.c                   | 184 ----
 drivers/gpu/drm/zte/zx_drm_drv.h                   |  34 -
 drivers/gpu/drm/zte/zx_hdmi.c                      | 760 -----------------
 drivers/gpu/drm/zte/zx_hdmi_regs.h                 |  66 --
 drivers/gpu/drm/zte/zx_plane.c                     | 537 ------------
 drivers/gpu/drm/zte/zx_plane.h                     |  26 -
 drivers/gpu/drm/zte/zx_plane_regs.h                | 120 ---
 drivers/gpu/drm/zte/zx_tvenc.c                     | 400 ---------
 drivers/gpu/drm/zte/zx_tvenc_regs.h                |  27 -
 drivers/gpu/drm/zte/zx_vga.c                       | 527 ------------
 drivers/gpu/drm/zte/zx_vga_regs.h                  |  33 -
 drivers/gpu/drm/zte/zx_vou.c                       | 921 -----------------=
----
 drivers/gpu/drm/zte/zx_vou.h                       |  64 --
 drivers/gpu/drm/zte/zx_vou_regs.h                  | 212 -----
 drivers/usb/typec/altmodes/Kconfig                 |   1 +
 drivers/usb/typec/altmodes/displayport.c           |  58 +-
 include/drm/drm_bridge.h                           |   2 +
 include/drm/drm_connector.h                        |  25 +
 include/drm/drm_ioctl.h                            |   1 -
 include/drm/drm_mode_config.h                      |  13 +-
 include/drm/drm_plane.h                            |   2 +-
 include/drm/gpu_scheduler.h                        | 188 ++++-
 include/drm/ttm/ttm_bo_api.h                       |  12 -
 include/drm/ttm/ttm_caching.h                      |  17 +
 include/drm/ttm/ttm_device.h                       |  77 +-
 include/drm/ttm/ttm_placement.h                    |   1 +
 include/drm/ttm/ttm_pool.h                         |   5 +-
 include/drm/ttm/ttm_range_manager.h                |  18 +-
 include/drm/ttm/ttm_resource.h                     |   9 +-
 include/drm/ttm/ttm_tt.h                           |  18 +-
 include/linux/dma-buf.h                            |   7 +
 include/linux/dma-fence.h                          |  32 +-
 include/linux/dma-resv.h                           | 104 ++-
 include/linux/seqno-fence.h                        | 109 ---
 include/linux/shrinker.h                           |   1 +
 include/uapi/drm/drm_fourcc.h                      |   6 +
 include/uapi/drm/drm_mode.h                        |   3 +
 mm/vmscan.c                                        |  15 +
 145 files changed, 2095 insertions(+), 5455 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,s6d27a1.yaml
 delete mode 100644 drivers/dma-buf/seqno-fence.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 delete mode 100644 drivers/gpu/drm/zte/Kconfig
 delete mode 100644 drivers/gpu/drm/zte/Makefile
 delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
 delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
 delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
 delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
 delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
 delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
 delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
 delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h
 delete mode 100644 include/linux/seqno-fence.h

--nsbzyzo4xffmhlhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYULy1AAKCRDj7w1vZxhR
xf0OAP4lrQfz/6bQ843ky3KAGji4iBOgp/PxSfvidqWFqtlp2gEAw2gtTbTmojeC
PW2nGwaLVc3dguhibMEj9F0SbY0aTgo=
=t19n
-----END PGP SIGNATURE-----

--nsbzyzo4xffmhlhq--
