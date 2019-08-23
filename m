Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E29AA6F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C96D6EC20;
	Fri, 23 Aug 2019 08:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB16EC1B;
 Fri, 23 Aug 2019 08:35:14 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A35C01BF20C;
 Fri, 23 Aug 2019 08:35:09 +0000 (UTC)
Date: Fri, 23 Aug 2019 10:35:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20190823083509.c7mduqdqjnxc7ubb@flea>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1942324549=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1942324549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qigpbldqffyl3bre"
Content-Disposition: inline


--qigpbldqffyl3bre
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here is what should be the final drm-misc-next PR for 5.4.

Thanks!
Maxime

drm-misc-next-2019-08-23:
drm-misc-next for 5.4:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - dma-buf: dma-fence selftests

Driver Changes:
  - kirin: Various cleanups and reworks
  - komeda: Add support for DT memory-regions
  - meson: Rely on the compatible to detect vpu features
  - omap: Implement alpha and pixel blend mode properties
  - panfrost: Implement per-fd address spaces, various fixes
  - rockchip: DSI DT binding rework
  - fbdev: Various cleanups
The following changes since commit d777478599f781fc5162d1ae95dbee6e5ae05a41:

  drm/xen-front: Make structure fb_funcs constant (2019-08-19 08:32:52 +030=
0)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2019-08-23

for you to fetch changes up to e26ae7c0432101a924cf745b07470c8592de64cb:

  omapdrm: no need to check return value of debugfs_create functions (2019-=
08-23 10:21:03 +0300)

----------------------------------------------------------------
drm-misc-next for 5.4:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - dma-buf: dma-fence selftests

Driver Changes:
  - kirin: Various cleanups and reworks
  - komeda: Add support for DT memory-regions
  - meson: Rely on the compatible to detect vpu features
  - omap: Implement alpha and pixel blend mode properties
  - panfrost: Implement per-fd address spaces, various fixes
  - rockchip: DSI DT binding rework
  - fbdev: Various cleanups

----------------------------------------------------------------
Anders Roxell (1):
      video: fbdev: sh_mobile_lcdcfb: Mark expected switch fall-through

Chris Wilson (5):
      dma-buf: Introduce selftesting framework
      dma-buf: Add selftests for dma-fence
      drm/i915: Select DMABUF_SELFTESTS for the default i915.ko debug build
      dma-buf: Use %zu for printing sizeof
      dmabuf: Mark up onstack timer for selftests

Chuhong Yuan (2):
      video: fbdev: sm712fb: Use dev_get_drvdata
      video: fbdev: radeonfb: Use dev_get_drvdata

Da Lv (1):
      drm: kirin: Fix for hikey620 display offset problem

Dariusz Marcinkiewicz (2):
      drm: dw-hdmi: use cec_notifier_conn_(un)register
      dw-hdmi-cec: use cec_notifier_cec_adap_(un)register

Greg Kroah-Hartman (1):
      omapdrm: no need to check return value of debugfs_create functions

Gustavo A. R. Silva (2):
      video: fbdev: pvr2fb: remove unnecessary comparison of unsigned integ=
er with < 0
      video: fbdev/mmp/core: Use struct_size() in kzalloc()

Hans de Goede (1):
      efifb: BGRT: Improve efifb_bgrt_sanity_check

Jani Nikula (1):
      drm: fix module name in edid_firmware log message

Jean-Jacques Hiblot (1):
      drm/omap: Add 'alpha' and 'pixel blend mode' plane properties

John Stultz (3):
      drm: kirin: Remove HISI_KIRIN_DW_DSI config option
      drm: kirin: Remove unreachable return
      drm: kirin: Move workqueue to ade_hw_ctx structure

Jonathan Neusch=E4fer (1):
      drm/drv: Use // for comments in example code

Julien Masson (1):
      drm: meson: use match data to detect vpu compatibility

Mihail Atanassov (1):
      drm/komeda: Add support for 'memory-region' DT node property

Nickey Yang (1):
      dt-bindings: display: rockchip: update DSI controller

Nishka Dasgupta (1):
      udlfb: Make dlfb_ops constant

Rob Herring (2):
      drm/panfrost: Implement per FD address spaces
      drm/panfrost: Fix sleeping while atomic in panfrost_gem_open

Souptick Joarder (2):
      video: fbdev: aty[128]fb: Remove dead code
      video: fbdev: viafb: Remove dead code

Steven Price (2):
      drm/panfrost: Enable devfreq to work without regulator
      drm/panfrost: Remove opp table when unloading

Thierry Reding (1):
      drm/nouveau: Initialize GEM object before TTM object

Wei Yongjun (1):
      drm/panfrost: Fix missing unlock on error in panfrost_mmu_map_fault_a=
ddr()

Xu YiPing (21):
      drm: kirin: Remove uncessary parameter indirection
      drm: kirin: Remove out_format from ade_crtc
      drm: kirin: Rename ade_plane to kirin_plane
      drm: kirin: Rename ade_crtc to kirin_crtc
      drm: kirin: Dynamically allocate the hw_ctx
      drm: kirin: Move request irq handle in ade hw ctx alloc
      drm: kirin: Move kirin_crtc, kirin_plane, kirin_format to kirin_drm_d=
rv.h
      drm: kirin: Reanme dc_ops to kirin_drm_data
      drm: kirin: Move ade crtc/plane help functions to driver_data
      drm: kirin: Move channel formats to driver data
      drm: kirin: Move mode config function to driver_data
      drm: kirin: Move plane number and primay plane in driver data
      drm: kirin: Move config max_width and max_height to driver data
      drm: kirin: Move drm driver to driver data
      drm: kirin: Add register connect helper functions in drm init
      drm: kirin: Rename plane_init and crtc_init
      drm: kirin: Fix dev->driver_data setting
      drm: kirin: Make driver_data variable non-global
      drm: kirin: Add alloc_hw_ctx/clean_hw_ctx ops in driver data
      drm: kirin: Pass driver data to crtc init and plane init
      drm: kirin: Move ade drm init to kirin drm drv

 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |  23 +-
 drivers/dma-buf/Kconfig                            |   5 +
 drivers/dma-buf/Makefile                           |   6 +
 drivers/dma-buf/selftest.c                         | 167 ++++++
 drivers/dma-buf/selftest.h                         |  30 ++
 drivers/dma-buf/selftests.h                        |  13 +
 drivers/dma-buf/st-dma-fence.c                     | 574 +++++++++++++++++=
++++
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |   9 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |  13 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  45 +-
 drivers/gpu/drm/drm_drv.c                          |  14 +-
 drivers/gpu/drm/drm_kms_helper_common.c            |   2 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |  10 +-
 drivers/gpu/drm/hisilicon/kirin/Makefile           |   3 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |   1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    | 351 +++++--------
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    | 262 +++++++---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |  48 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |   1 +
 drivers/gpu/drm/meson/meson_crtc.c                 |   2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  14 +-
 drivers/gpu/drm/meson/meson_drv.h                  |  13 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   2 +-
 drivers/gpu/drm/meson/meson_overlay.c              |   2 +-
 drivers/gpu/drm/meson/meson_plane.c                |  10 +-
 drivers/gpu/drm/meson/meson_vclk.c                 |  64 +--
 drivers/gpu/drm/meson/meson_venc.c                 |   2 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |  10 +-
 drivers/gpu/drm/meson/meson_viu.c                  |  10 +-
 drivers/gpu/drm/meson/meson_vpp.c                  |  10 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  69 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   4 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  29 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |  16 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |  11 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |   9 +-
 drivers/gpu/drm/panfrost/TODO                      |   4 -
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |  13 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.h        |   1 +
 drivers/gpu/drm/panfrost/panfrost_device.c         |   2 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |  24 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  36 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |  23 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h            |   3 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |  14 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            | 227 +++++---
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |   8 +
 drivers/video/fbdev/aty/aty128fb.c                 |  18 -
 drivers/video/fbdev/aty/atyfb_base.c               |  29 --
 drivers/video/fbdev/aty/radeon_base.c              |   6 +-
 drivers/video/fbdev/efifb.c                        |  27 +-
 drivers/video/fbdev/mmp/core.c                     |   6 +-
 drivers/video/fbdev/pvr2fb.c                       |   6 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   2 +
 drivers/video/fbdev/sm712fb.c                      |   8 +-
 drivers/video/fbdev/udlfb.c                        |   2 +-
 drivers/video/fbdev/via/via-core.c                 |  43 --
 57 files changed, 1681 insertions(+), 675 deletions(-)
 create mode 100644 drivers/dma-buf/selftest.c
 create mode 100644 drivers/dma-buf/selftest.h
 create mode 100644 drivers/dma-buf/selftests.h
 create mode 100644 drivers/dma-buf/st-dma-fence.c

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qigpbldqffyl3bre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV+lPQAKCRDj7w1vZxhR
xa0hAP4p8LQULYds0+uw0O2xyAs94q3NqdukTNbLBJ9gaLh6hAD+LNhzTv2G6h17
PWQL3nYC/G7vt+7UE6MCJM3s1a5g2Ao=
=7Anj
-----END PGP SIGNATURE-----

--qigpbldqffyl3bre--

--===============1942324549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1942324549==--
