Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244F41D8C8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 13:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7A6EB78;
	Thu, 30 Sep 2021 11:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6EE6EB75;
 Thu, 30 Sep 2021 11:27:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 3816A2B00428;
 Thu, 30 Sep 2021 07:27:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 30 Sep 2021 07:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=iXgj+XdWCTmhVdz1HLAhOYRBscuRXvoJCsyFGjXf9Ds=; b=ZbVcOXGA
 hOu4fHhWk/GATyT4LnRnzNiPZ2sTztOb6HA1lAF8whHFgr2cbjfH6pi/99m6aWPi
 QFnhiwq4uG21l/V8gLhtMIwCfJLB1w/WHfPMyGJvISng0g9yKnWvmEomTSKewB3i
 77edP4UmNoLnuAkopNO7ITg24sZL/BWLqi3Lx39/u8dobtw64Ah4ZhQNsscPAbZL
 EnhZxPR9mfsmGMHzqAYdAksAv3Fs2rzptyY5wEGDm/UfwqoiEjP3xT39cPvtywD2
 qDCMrcYW6JZIcBIZc9bGTxJr1+h+bRUtAOqFnpQIDepQajioOVrjmVx1q6nGP297
 xAyboqikQHv7Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=iXgj+XdWCTmhVdz1HLAhOYRBscuRX
 voJCsyFGjXf9Ds=; b=fi5PuEVCXX7Al5Wlku/pfIkWO/NFwlfB1I50G5pGllx5f
 6BxsEIJ2Oh2Ta10aFaRzBcBBo3X09a89r2LqaXDk6LpyHphWxKsHPGUTNvwyFkCo
 UON/YuZ8Lfyf2690X6YMtwtGS3zQ/82K88tRcTLq6aordfaYgD0Upg7wnMiwcbBQ
 mfSFqukGFQiJe7eAMVOdy2IH0LSWVk3VqwDimzeKZaip0m/lbMMBKewgdAEJSeXh
 /Y1eFabtfWaglpIr9iRb+FFYJomNXGb4ZI2IvyBetXrbGFiWqHcyueLZQaN9+Zg2
 N5t8HcGch1ih7GW3f+HIYzCa+lTS03mmyNHSI+ANA==
X-ME-Sender: <xms:KJ9VYWe4lX19cwS8pWYJWGNUgGApc9TRNL0pzw6kPSFvj2S_ybKHQw>
 <xme:KJ9VYQMqVpXXBBwpYMrle3syJfbUEO0RZ7ZUScWdJ0pLa6-Lacv-SpjTAFU81Wicj
 5eboMYY0lBoT8uXfkw>
X-ME-Received: <xmr:KJ9VYXjtkktaLIFqaHRgqinBHdY9aMW-diVsTIN0hKIA13--eC4QhaQ4pq-h0v1QO1WkNHFXD9coDN73BijW2U2UJDJGeIsxfMjHehiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:KJ9VYT9YbG4Ol87kmxDxzzPv2fOfYsbp5Zs9ZhGI2ZRG-nf7GnJcxw>
 <xmx:KJ9VYSvxwZM16gzttwfTBTZI3Uq-jRSprRBdIFaUNsnWLlSofvQnnw>
 <xmx:KJ9VYaHtykYq9fDiCUJ3cLCY76p5-imrxK4SHfZcYixrXEU6Jl2pdA>
 <xmx:KJ9VYcIG1JtCiN4CCvtaC_v6DNdPP9ZOBTgZXT5iSRqMCk9GJtzNmcbLgjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Sep 2021 07:27:36 -0400 (EDT)
Date: Thu, 30 Sep 2021 13:27:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20210930112734.dcwnibbxstdieg7g@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="awryl5cewamo54na"
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


--awryl5cewamo54na
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week PR for drm-misc-next

Maxime

drm-misc-next-2021-09-30:
drm-misc-next for 5.16:

UAPI Changes:
  - virtio: UAPI additions to support context init

Cross-subsystem Changes:

Core Changes:
  - bridge: documentation improvements
  - mipi-dsi: new devm_mipi_dsi_device_register_full and
    devm_mipi_dsi_attach functions
  - probe-helper: New HPD helper for devices with per-connector
    interrupts
  - ttm: ttm_tt improvements, flags documentation improvements

Driver Changes:
  - Convertion to devm_arch_phys_wc_add and
    devm_arch_io_reserve_memtype_wc
  - gma500: Cleanups
  - vc4: Fix for hotplug reporting
  - virtio: Implement Context Init

  - bridge: Suport DP-AUX in ps8640
  - panel: Support for Boe TV110C9M-LL3, Innolux HJ110IZ-01A
The following changes since commit 9c2fce137852e6434ca0c6fe3d75e00feb168c07:

  drm: Fix scaling_mode docs (2021-09-22 22:11:53 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-09-30

for you to fetch changes up to 49e7f76fc514cecf2cad1303fa74d99be7e5d9a6:

  drm/ttm: add TTM_TT_FLAG_EXTERNAL_MAPPABLE (2021-09-29 16:18:43 +0200)

----------------------------------------------------------------
drm-misc-next for 5.16:

UAPI Changes:
  - virtio: UAPI additions to support context init

Cross-subsystem Changes:

Core Changes:
  - bridge: documentation improvements
  - mipi-dsi: new devm_mipi_dsi_device_register_full and
    devm_mipi_dsi_attach functions
  - probe-helper: New HPD helper for devices with per-connector
    interrupts
  - ttm: ttm_tt improvements, flags documentation improvements

Driver Changes:
  - Convertion to devm_arch_phys_wc_add and
    devm_arch_io_reserve_memtype_wc
  - gma500: Cleanups
  - vc4: Fix for hotplug reporting
  - virtio: Implement Context Init

  - bridge: Suport DP-AUX in ps8640
  - panel: Support for Boe TV110C9M-LL3, Innolux HJ110IZ-01A

----------------------------------------------------------------
Anthoine Bourgeois (2):
      drm/virtio: implement context init: probe for feature
      drm/virtio: implement context init: support init ioctl

Christian K=F6nig (1):
      drm/msm: allow compile_test on !ARM

Douglas Anderson (3):
      drm/edid: Fix EDID quirk compile error on older compilers
      drm/print: Add deprecation notes to DRM_...() functions
      drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning

Gurchetan Singh (10):
      virtio-gpu api: multiple context types with explicit initialization
      drm/virtgpu api: create context init feature
      drm/virtio: implement context init: track valid capabilities in a mask
      drm/virtio: implement context init: track {ring_idx, emit_fence_info}=
 in virtio_gpu_fence
      drm/virtio: implement context init: plumb {base_fence_ctx, ring_idx} =
to virtio_gpu_fence_alloc
      drm/virtio: implement context init: stop using drv->context when crea=
ting fence
      drm/virtio: implement context init: allocate an array of fence contex=
ts
      drm/virtio: implement context init: handle VIRTGPU_CONTEXT_PARAM_POLL=
_RINGS_MASK
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

Maxime Ripard (7):
      drm/bridge: Add documentation sections
      drm/bridge: Document the probe issue with MIPI-DSI bridges
      drm/mipi-dsi: Create devm device registration
      drm/mipi-dsi: Create devm device attachment
      drm/probe-helper: Document drm_helper_hpd_irq_event() return value
      drm/probe-helper: Create a HPD IRQ event helper for a single connector
      drm/vc4: hdmi: Actually check for the connector status in hotplug

Philip Chen (2):
      drm/bridge: parade-ps8640: Use regmap APIs
      drm/bridge: parade-ps8640: Add support for AUX channel

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
      dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3 a=
nd inx hj110iz-01a
      drm/panel: support for BOE and INX video mode panel

 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |   7 +
 Documentation/gpu/drm-kms-helpers.rst              |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  25 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   2 -
 drivers/gpu/drm/ast/ast_mm.c                       |  27 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             | 274 +++++++-
 drivers/gpu/drm/drm_bridge.c                       |  69 +-
 drivers/gpu/drm/drm_edid.c                         | 121 ++--
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
 drivers/gpu/drm/gma500/psb_drv.c                   | 145 ++--
 drivers/gpu/drm/gma500/psb_drv.h                   |  24 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |  10 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |  31 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  10 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  26 +-
 drivers/gpu/drm/gma500/psb_lid.c                   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   6 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   2 -
 drivers/gpu/drm/mgag200/mgag200_mm.c               |  35 +-
 drivers/gpu/drm/msm/Kconfig                        |   4 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 743 +++++++++++++++++=
+++-
 drivers/gpu/drm/panel/panel-edp.c                  |  23 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  15 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  54 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   5 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |   1 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |  17 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |  44 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  28 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |  30 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             | 199 +++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |  26 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   3 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  19 +-
 include/drm/drm_bridge.h                           |  10 +-
 include/drm/drm_edid.h                             |  14 +-
 include/drm/drm_mipi_dsi.h                         |   4 +
 include/drm/drm_print.h                            |  30 +
 include/drm/drm_probe_helper.h                     |   1 +
 include/drm/ttm/ttm_device.h                       |   2 +-
 include/drm/ttm/ttm_tt.h                           |  82 ++-
 include/linux/io.h                                 |   5 +
 include/uapi/drm/virtgpu_drm.h                     |  27 +
 include/uapi/linux/virtio_gpu.h                    |  18 +-
 lib/devres.c                                       |  82 +++
 76 files changed, 2210 insertions(+), 623 deletions(-)

--awryl5cewamo54na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVWfJgAKCRDj7w1vZxhR
xT1wAQDxH72Nqx1iQRim1PVue2zV3epSIvAD5hpnIZau0rHRBQEA0Feu8zDj6gSe
0okXke7elUNiktZWke66kDxV1NNrygw=
=r1eY
-----END PGP SIGNATURE-----

--awryl5cewamo54na--
