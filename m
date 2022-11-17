Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42462D51C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11710E578;
	Thu, 17 Nov 2022 08:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B510E1E5;
 Thu, 17 Nov 2022 08:36:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 787A82B066FA;
 Thu, 17 Nov 2022 03:36:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 03:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1668674192; x=1668681392; bh=m8pOB82nWXmAJcWBLIgdlGqZLkTDbQsBR4r
 8KOegMrY=; b=ZrIOU69QiJ8+9Doik/iA4kGX7gorW2/GcsxvO5lPH4nLLMILwyC
 G4scscTSCGjlhdPyzSSOLPloDKrT2IuBdmdgw9tmQIBjfOBKG2kpkSTalmkkop+S
 QpXUaRzWiPOJQT+wHDbx/WTZL9qZiOcbQsosDD5S/WWY/RWE05NeIaItzKeJ5ojR
 5oQU4A0KF9rUlziYj0B68QH/MXh/3VHnIp0OgYOcOorchQDibBhE1odM28OlMXgE
 Pyq/0urledUtuTPjYQUpyYT+HQMKHTUHGQaF1gu1QZ2W6rcPVrXh5xOLDVBcX8C7
 xUZb9BkhENdO1HEGjqN/4hLWUOANI26qhvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668674192; x=
 1668681392; bh=m8pOB82nWXmAJcWBLIgdlGqZLkTDbQsBR4r8KOegMrY=; b=t
 7FCtn/DgqQUdtaU6v9puy3f1PYPUbm3mW95n6clOpwwh3idoI09oujfofq8u62vh
 o/SEG8/W83hZmXYVbNfYXg2yMmVHhSOvPNJjY2Q5V3AdHs/AdgV7YqtBDHowOMW8
 wHkRmU1ssW6bwj0bgFupztzO5e/TmT6CkHnroC9ySaPet9AAW9CI8awg/MhTf0S6
 cKNhzgTQRNrq55CK7U017SIvyORXzGl687In7JWquIwkvOAUhZnTSc6xmdr5kMr7
 gZ5Q6oBHmhiXbu03o1sHOTueHdUPN8chjIp5W3fR8fAnZXRJJb/NtuGxy3E9o/QN
 1j8HpxjryO220otlWztHw==
X-ME-Sender: <xms:j_J1YzzL67x1cRy4-EdGUTZdYtGHN6O6tjP9e3cKWZybiaXjs37WdA>
 <xme:j_J1Y7SMQ_RGv8kkDsPkOpzBzEblkhU_qQqzAeYleOVgWlGHclX4eUKIlG9xmJgQ3
 _Rqf5ItvLMhBqlvefM>
X-ME-Received: <xmr:j_J1Y9X4fHYdfuUKVhovNznJQa5SYpe-dcB1s_1qdj4Qnd8qhazrtcFvQoPULEnHYrV-v8aBlPNWoB-cijbbwlEn6Ks0mRaG4Q6CtwwzGJQKDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:j_J1Y9i8BBpAkd8NHIYM4SMrWPTHTTmYukg7rIkwcNGZmoQIUepQmg>
 <xmx:j_J1Y1A8EvkfOxNM8fJvdPve3qg1ehpb8H38skocK6npyZz6esFCwQ>
 <xmx:j_J1Y2Iqmuny7uvL-MpR0MmcgW9Pd7Zov-vhuSfgogq8t3-BCwUoRw>
 <xmx:kPJ1Y3wzM6ne1HRAI6p0TILs7JN_E7dfZ8sBHXk4eHw0bKTUlof3pHD_YkM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 03:36:31 -0500 (EST)
Date: Thu, 17 Nov 2022 09:36:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221117083628.mzij5nrbdzokek7c@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p5cawifcn5lskeyn"
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


--p5cawifcn5lskeyn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next PR. Given we're at rc5 already, it's
probably going to be the last for 6.2.

Thanks!
Maxime

drm-misc-next-2022-11-17:
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- fbdev: Add support for the nomodeset kernel parameter

Core Changes:
- client: Add kunit tests for drm_connector_pick_cmdline_mode()
- dma-buf: Move dma_buf_mmap_internal() to new locking specification
- edid: Dump EDID on drm_edid_get_panel_id() failure, Stop using a
  temporary device to load the EDID through the firmware mechanism
- fb-helper: Remove damage worker
- gem-vram: Fix deadlock in drm_gem_vram_vmap()
- modes: Named mode parsing improvements
- tests: Add Kunit helpers to create a DRM device

Driver Changes:
- hisilicon: convert to drm_mode_init()
- malidp: Use drm-managed resources
- msm: convert to drm_mode_init() and drm_mode_copy()
- mtk: convert to drm_mode_init()
- nouveau: Support backlight control for nva3
- rockchip: convert to drm_mode_copy()
- sti: convert to drm_mode_copy()
- v3d: Switch to drm-managed resources
- vc4: Fix potential NULL pointer dereference

- panels:
  - New panel: NewVision NV3051D
The following changes since commit 6b818c533dd8615a803a72733eace58fd06e5a3c:

  drm: panel: Add Jadard JD9365DA-H3 DSI panel (2022-11-09 10:40:56 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-11-17

for you to fetch changes up to 35c3a2d02f0dc153a5f2f304ba33e1436b6a8d8f:

  drm/tests: helpers: Add SPDX header (2022-11-17 09:25:38 +0100)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- fbdev: Add support for the nomodeset kernel parameter

Core Changes:
- client: Add kunit tests for drm_connector_pick_cmdline_mode()
- dma-buf: Move dma_buf_mmap_internal() to new locking specification
- edid: Dump EDID on drm_edid_get_panel_id() failure, Stop using a
  temporary device to load the EDID through the firmware mechanism
- fb-helper: Remove damage worker
- gem-vram: Fix deadlock in drm_gem_vram_vmap()
- modes: Named mode parsing improvements
- tests: Add Kunit helpers to create a DRM device

Driver Changes:
- hisilicon: convert to drm_mode_init()
- malidp: Use drm-managed resources
- msm: convert to drm_mode_init() and drm_mode_copy()
- mtk: convert to drm_mode_init()
- nouveau: Support backlight control for nva3
- rockchip: convert to drm_mode_copy()
- sti: convert to drm_mode_copy()
- v3d: Switch to drm-managed resources
- vc4: Fix potential NULL pointer dereference

- panels:
  - New panel: NewVision NV3051D

----------------------------------------------------------------
Antonio Gomes (1):
      drm/nouveau: Add support to control backlight using bl_power for nva3.

Brian Starkey (1):
      drm/fourcc: Fix vsub/hsub for Q410 and Q401

Chris Morgan (3):
      dt-bindings: vendor-prefixes: add NewVision vendor prefix
      dt-bindings: display: panel: Add NewVision NV3051D bindings
      drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

Danilo Krummrich (5):
      drm/arm/malidp: use drmm_* to allocate driver structures
      drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
      drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
      drm/arm/malidp: plane: use drm managed resources
      drm/arm/malidp: remove calls to drm_mode_config_cleanup()

Dmitry Osipenko (7):
      dma-buf: Move dma_buf_mmap_internal() to dynamic locking specification
      drm: Assert held reservation lock for dma-buf mmapping
      udmabuf: Assert held reservation lock for dma-buf mmapping
      dma-buf/heaps: Assert held reservation lock for dma-buf mmapping
      media: videobuf2: Assert held reservation lock for dma-buf mmapping
      fastrpc: Assert held reservation lock for dma-buf mmapping
      drm/gem-vram: Fix deadlock in drm_gem_vram_vmap()

Douglas Anderson (1):
      drm/edid: Dump the EDID when drm_edid_get_panel_id() has an error

Jani Nikula (1):
      drm/edid/firmware: stop using a throwaway platform device

Jos=E9 Exp=F3sito (2):
      drm/vc4: hdmi: Pass vc4_hdmi to vc4_hdmi_supports_scrambling()
      drm/vc4: hdmi: Fix pointer dereference before check

Maxime Ripard (11):
      docs/fb: Document current named modes
      drm/tests: Add Kunit Helpers
      drm/client: Add some tests for drm_connector_pick_cmdline_mode()
      drm/modes: Move named modes parsing to a separate function
      drm/modes: Switch to named mode descriptors
      drm/modes: Fill drm_cmdline mode from named modes
      drm/connector: Add pixel clock to cmdline mode
      drm/tests: Include helpers header
      drm/tests: helpers: Add module infos
      drm/tests: client: Remove extra blank lines
      drm/tests: helpers: Add SPDX header

Ma=EDra Canal (2):
      drm/v3d: switch to drmm_mutex_init
      drm/v3d: add missing mutex_destroy

Thomas Zimmermann (8):
      drm/fb-helper: Set damage-clip area in helper
      drm/fb-helper: Move dirty-fb update into helper function
      drm/fb-helper: Remove test for fb_dirty callback from deferred-I/O he=
lper
      drm/fb-helper: Perform damage handling in deferred-I/O helper
      drm/fb-helper: Schedule deferred-I/O worker after writing to framebuf=
fer
      drm/fb-helper: Remove damage worker
      drm: Move nomodeset kernel parameter to drivers/video
      fbdev: Add support for the nomodeset kernel parameter

Ville Syrj=E4l=E4 (6):
      drm/hisilicon: Use drm_mode_init() for on-stack modes
      drm/msm: Use drm_mode_init() for on-stack modes
      drm/msm: Use drm_mode_copy()
      drm/mtk: Use drm_mode_init() for on-stack modes
      drm/rockchip: Use drm_mode_copy()
      drm/sti: Use drm_mode_copy()

 Documentation/admin-guide/kernel-parameters.txt    |  13 +-
 .../bindings/display/panel/newvision,nv3051d.yaml  |  63 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/fb/modedb.rst                        |   5 +
 MAINTAINERS                                        |   2 +
 drivers/dma-buf/dma-buf.c                          |   7 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   3 +
 drivers/dma-buf/heaps/system_heap.c                |   3 +
 drivers/dma-buf/udmabuf.c                          |   3 +
 drivers/gpu/drm/Kconfig                            |   7 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/arm/malidp_crtc.c                  |   7 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |  69 ++-
 drivers/gpu/drm/arm/malidp_drv.h                   |   2 +
 drivers/gpu/drm/arm/malidp_hw.c                    |  10 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   6 +-
 drivers/gpu/drm/arm/malidp_planes.c                |  32 +-
 drivers/gpu/drm/drm_client_modeset.c               |   4 +
 drivers/gpu/drm/drm_edid.c                         |   2 +
 drivers/gpu/drm/drm_edid_load.c                    |  13 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  52 ++-
 drivers/gpu/drm/drm_fourcc.c                       |   8 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  18 +-
 drivers/gpu/drm/drm_modes.c                        |  98 +++-
 drivers/gpu/drm/drm_prime.c                        |   2 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   7 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |   6 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |   2 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    | 504 +++++++++++++++++=
++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   2 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/tegra/gem.c                        |   2 +
 drivers/gpu/drm/tests/Makefile                     |   1 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |  98 ++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  71 +++
 drivers/gpu/drm/tests/drm_kunit_helpers.h          |  11 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |  17 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   6 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  14 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   3 +
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   3 +
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   3 +
 drivers/misc/fastrpc.c                             |   3 +
 drivers/staging/sm750fb/Kconfig                    |   1 +
 drivers/staging/sm750fb/sm750.c                    |   3 +
 drivers/video/Kconfig                              |   4 +
 drivers/video/Makefile                             |   1 +
 drivers/video/fbdev/Kconfig                        |  37 ++
 drivers/video/fbdev/arkfb.c                        |   5 +
 drivers/video/fbdev/asiliantfb.c                   |   3 +
 drivers/video/fbdev/aty/aty128fb.c                 |   5 +
 drivers/video/fbdev/aty/atyfb_base.c               |   5 +
 drivers/video/fbdev/aty/radeon_base.c              |   5 +
 drivers/video/fbdev/carminefb.c                    |   3 +
 drivers/video/fbdev/chipsfb.c                      |   3 +
 drivers/video/fbdev/cirrusfb.c                     |   5 +
 drivers/video/fbdev/core/fb_defio.c                |  16 +
 drivers/video/fbdev/core/fbmem.c                   |  15 +
 drivers/video/fbdev/cyber2000fb.c                  |   6 +-
 drivers/video/fbdev/geode/Kconfig                  |   3 +
 drivers/video/fbdev/geode/gx1fb_core.c             |   5 +
 drivers/video/fbdev/geode/gxfb_core.c              |   5 +
 drivers/video/fbdev/geode/lxfb_core.c              |   5 +
 drivers/video/fbdev/gxt4500.c                      |   3 +
 drivers/video/fbdev/hyperv_fb.c                    |   4 +-
 drivers/video/fbdev/i740fb.c                       |   5 +
 drivers/video/fbdev/i810/i810_main.c               |   6 +
 drivers/video/fbdev/imsttfb.c                      |   5 +
 drivers/video/fbdev/intelfb/intelfbdrv.c           |   3 +
 drivers/video/fbdev/kyro/fbdev.c                   |   5 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |   3 +
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |   3 +
 drivers/video/fbdev/neofb.c                        |   5 +
 drivers/video/fbdev/nvidia/nvidia.c                |   5 +
 drivers/video/fbdev/pm2fb.c                        |   5 +
 drivers/video/fbdev/pm3fb.c                        |   5 +
 drivers/video/fbdev/pvr2fb.c                       |   5 +
 drivers/video/fbdev/riva/fbdev.c                   |   5 +
 drivers/video/fbdev/s3fb.c                         |   5 +
 drivers/video/fbdev/savage/savagefb_driver.c       |   3 +
 drivers/video/fbdev/sis/sis_main.c                 |   5 +
 drivers/video/fbdev/skeletonfb.c                   |   5 +
 drivers/video/fbdev/sm712fb.c                      |   3 +
 drivers/video/fbdev/sstfb.c                        |   3 +
 drivers/video/fbdev/sunxvr2500.c                   |   3 +
 drivers/video/fbdev/sunxvr500.c                    |   3 +
 drivers/video/fbdev/tdfxfb.c                       |   5 +
 drivers/video/fbdev/tgafb.c                        |   5 +
 drivers/video/fbdev/tridentfb.c                    |   5 +
 drivers/video/fbdev/vermilion/vermilion.c          |   5 +
 drivers/video/fbdev/via/via-core.c                 |   3 +
 drivers/video/fbdev/vt8623fb.c                     |   5 +
 .../{gpu/drm/drm_nomodeset.c =3D> video/nomodeset.c} |  12 +-
 include/drm/drm_connector.h                        |   7 +
 include/drm/drm_drv.h                              |   8 +-
 include/drm/drm_fb_helper.h                        |   2 -
 include/linux/fb.h                                 |  10 +
 include/video/nomodeset.h                          |   8 +
 108 files changed, 1330 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvisi=
on,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c
 create mode 100644 drivers/gpu/drm/tests/drm_client_modeset_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.h
 rename drivers/{gpu/drm/drm_nomodeset.c =3D> video/nomodeset.c} (63%)
 create mode 100644 include/video/nomodeset.h

--p5cawifcn5lskeyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3XyjAAKCRDj7w1vZxhR
xefzAQD1Cm72JV+7hJVsmKUbpX5KJBj4ppCOZoh/ShioCWe8ZQEA+8IK93NxJ7VS
S8ZRKcwRxcuHFoj+6YpOetoxbuJ1/wY=
=7bD6
-----END PGP SIGNATURE-----

--p5cawifcn5lskeyn--
