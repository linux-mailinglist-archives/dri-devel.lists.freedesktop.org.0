Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E735142B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA346E3DA;
	Thu,  1 Apr 2021 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A526E3DB;
 Thu,  1 Apr 2021 11:06:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EC5D32015;
 Thu,  1 Apr 2021 07:05:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Apr 2021 07:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=lCiyUGiZQRnRlB8+I7t9/t+uEZJpVnNrgSWE+g6620k=; b=HS2YvFmD
 K08uaKHYEfFEoC6vrdcS/ayFkSAu+RDmYrvuLOdrf41z+r8lmtkUDwTK3m27adVw
 48tSLjjqchNBQg0MuIqjjnkW7rD9SbUqGzbS8GCMdM+fg9nr1gbdHrRuh0/1FJOL
 RYhvBVDZCpR0eAsH/xdM7b/evSMI+7+vjG5xb2ivRugKo4im7Js4VGCOgs1Ejauc
 Lu/Zs61AvTbJ7BRDn0E+c7xbhRkL8j8/BBMzLouijCRbG2x+493v3l6efNbpcg4T
 7z+SQJNjjwp6Q+uH3Tem8wEZIh66wSc9QqibUbtIkieSAhSaUAfa34mK1+gWXFzV
 ctiDW8fIy9/MVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=lCiyUGiZQRnRlB8+I7t9/t+uEZJpV
 nNrgSWE+g6620k=; b=tUQ0y+FPsQu7DTwSjYuJ1QdvMscMnIXruYBjrtkXOAvnR
 iaq04n4I3kfTIyjkVrT0F5+yOH3B5lfgo2VquEnBdX6nLYCl7FmY04j4d1GsdtXq
 jtV48mMBom3HxU9XQbKqZSrhUzOu75kw+GLURYP+H3E2PZZOqDSH6u6dI37+XgJU
 Zrasb1D+DqfdWR4TLYPcTFDLwjhc+pny3Q+aZE5wd94FuC1D20S3DjvxwvspOSGC
 depMD7y1vrXzC5udH3DN4BiZvfr0U54lFXEkFfDIV86e/j6U02qqSlKj8TtUDG1/
 nGfNRDqh28E8wi+w/UlEaAg1u1bnIiI2sSfUBF+vg==
X-ME-Sender: <xms:E6llYFftnMvir9U0UdPVA9ZJrUCWZYZeVd_3nLKGMguRXXyDoLFQrQ>
 <xme:E6llYDNUNzUHcbNtyjjDEvL-yON2v3g6nFa5tYPbP1xi6QHfvlBftxurUjBGd0gvA
 zov1wtAg5mfgkaHK9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E6llYOgDmS6nJmapqyMxX1RLmalxO4yChi2oPi07DBpiqbWS3hLlhw>
 <xmx:E6llYO-FbF_TSh7a1mUgHAI2CF8pDHn1iO5PNdBEywxiSrwan-cQqg>
 <xmx:E6llYBuFIRhtF7CHyREG4DhIWxdZzZPpLWR1Y-3WbbCp55gzxZOKiQ>
 <xmx:FKllYHC2sAMc_BGO29bYjYDwzrjWpXTaZZkAzcDQtzolBuVha66dnJSTZmY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 420E7240057;
 Thu,  1 Apr 2021 07:05:55 -0400 (EDT)
Date: Thu, 1 Apr 2021 13:05:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20210401110552.2b3yetlgsjtlotcn@gilmour>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0087836731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0087836731==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4lvqoee7xyiqztpx"
Content-Disposition: inline


--4lvqoee7xyiqztpx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

It's still a fairly quiet week, but here's what should be our last
drm-misc-next PR for 5.13

Maxime

drm-misc-next-2021-04-01:
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - mst: Improve topology logging
  - edid: Rework and improvements for displayid

Driver Changes:
  - anx7625: Regulators support
  - bridge: Support for the Chipone ICN6211, Lontium LT8912B
  - lt9611: Fix 4k panels handling
The following changes since commit 51c3b916a4d7e24b4918925965867fdd9bd8dd59:

  Merge tag 'drm-misc-next-2021-03-03' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2021-03-16 17:08:46 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-04-01

for you to fetch changes up to 6c744983004ebc66756e582294672f8b991288d5:

  drm/bridge: anx7625: disable regulators when power off (2021-04-01 10:38:=
02 +0200)

----------------------------------------------------------------
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - mst: Improve topology logging
  - edid: Rework and improvements for displayid

Driver Changes:
  - anx7625: Regulators support
  - bridge: Support for the Chipone ICN6211, Lontium LT8912B
  - lt9611: Fix 4k panels handling

----------------------------------------------------------------
Adrien Grassein (2):
      dt-bindings: display: bridge: Add documentation for LT8912B
      drm/bridge: Introduce LT8912B DSI to HDMI bridge

Arnd Bergmann (3):
      fbdev: omapfb: avoid -Wempty-body warning
      vgaarb: avoid -Wempty-body warnings
      drm/omap: fix misleading indentation in pixinc()

Bhaskar Chowdhury (2):
      drm: Few typo fixes
      drm/meson: Fix few typo

Christian K=F6nig (9):
      drm/sched: select new rq even if there is only one v3
      drm/qxl: clean up qxl_bo_move_notify
      drm/nouveau: clean up nouveau_bo_move_ntfy
      drm/vmwgfx: clean up vmw_move_notify v2
      drm/ttm: move swapout logic around v3
      drm/ttm: remove swap LRU v3
      drm/ttm: switch to per device LRU lock
      drm/ttm: fix invalid NULL deref
      drm/ttm: switch back to static allocation limits for now

Dafna Hirschfeld (1):
      drm: Fix 3 typos in the inline doc

Daniel Vetter (1):
      dma-fence: Document recoverable page fault implications

Dario Binacchi (3):
      drm/tilcdc: rename req_rate to pclk_rate
      drm/tilcdc: fix LCD pixel clock setting
      drm/tilcdc: fix pixel clock setting warning message

Dmitry Vyukov (1):
      drm/vkms: fix misuse of WARN_ON

Douglas Anderson (6):
      drm/panel-simple: Undo enable if HPD never asserts
      drm/panel-simple: Don't wait longer for HPD than hpd_absent_delay
      drm/panel-simple: Retry if we timeout waiting for HPD
      dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1
      drm/panel-simple: Add N116BCA-EA1
      drm: panel: simple: Set enable delay for BOE NV110WTM-N61

Eryk Brol (1):
      drm/mst: Enhance MST topology logging

Hsin-Yi Wang (2):
      dt-bindings: drm/bridge: anx7625: Add power supplies
      drm/bridge: anx7625: disable regulators when power off

Jagan Teki (3):
      drm/stm: ltdc: Use simple encoder
      dt-bindings: display: bridge: Add Chipone ICN6211 bindings
      drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge

Jani Nikula (8):
      drm/edid: make a number of functions, parameters and variables const
      drm/displayid: add separate drm_displayid.c
      drm/displayid: add new displayid section/block iterators
      drm/edid: use the new displayid iterator for detailed modes
      drm/edid: use the new displayid iterator for finding CEA extension
      drm/edid: use the new displayid iterator for tile info
      drm/displayid: allow data blocks with 0 payload length
      drm/displayid: rename displayid_hdr to displayid_header

Jianhui Zhao (1):
      docs: gpu: fix typo

Jiapeng Chong (1):
      drm: bridge: convert sysfs sprintf/snprintf family to sysfs_emit

Linus Walleij (1):
      drm/mcde/panel: Inverse misunderstood flag

Lyude Paul (9):
      drm/bridge/tc358767: Don't register DP AUX channel until bridge is at=
tached
      drm/bridge/ti-sn65dsi86: (Un)register aux device on bridge attach/det=
ach
      drm/bridge/analogix/anx78xx: Add missing drm_dp_aux_unregister() call
      drm/bridge/analogix/anx78xx: Setup encoder before registering connect=
or
      drm/bridge/analogix/anx78xx: Cleanup on error in anx78xx_bridge_attac=
h()
      drm/bridge/analogix/anx6345: Add missing drm_dp_aux_unregister() call
      drm/bridge/analogix/anx6345: Don't link encoder until after connector=
 registration
      drm/bridge/analogix/anx6345: Cleanup on errors in anx6345_bridge_atta=
ch()
      drm/bridge/analogix/dp_core: Unregister DP AUX channel on error in an=
alogix_dp_probe()

Matthew Wilcox (Oracle) (1):
      fb_defio: Remove custom address_space_operations

Maxime Ripard (2):
      Merge drm/drm-next into drm-misc-next
      drm/rockchip: Remove unused variable

Noralf Tr=F8nnes (3):
      drm/uapi: Add USB connector type
      drm/probe-helper: Check epoch counter in output_poll_execute()
      drm: Add GUD USB Display driver

Paul Cercueil (4):
      drm/ingenic: Fix non-OSD mode
      drm: bridge/panel: Cleanup connector on bridge detach
      drm/encoder: Add macro drmm_plain_encoder_alloc()
      drm/ingenic: Register devm action to cleanup encoders

Robert Foss (2):
      MAINTAINERS: Update Maintainers of DRM Bridge Drivers
      drm/bridge: lt9611: Fix handling of 4k panels

Simon Ser (1):
      drm/uapi: document kernel capabilities

Tian Tao (2):
      drm/vboxvideo: Use managed VRAM-helper initialization
      drm/sysfs: Convert sysfs sprintf/snprintf family to sysfs_emit

Wan Jiabing (1):
      drm/omap: Remove duplicate declaration

Yang Li (3):
      drm/gma500: use NULL instead of using plain integer as pointer
      drm/tilcdc: panel: fix platform_no_drv_owner.cocci warnings
      drm/omap: dsi: Add missing IRQF_ONESHOT

Yannick Fertre (1):
      drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER

kernel test robot (2):
      drm/gud: fix sizeof use
      drm/gud: Remove unneeded semicolon

xndcn (1):
      drm/virtio: fix possible leak/unlock virtio_gpu_object_array

 .../bindings/display/bridge/analogix,anx7625.yaml  |  15 +
 .../bindings/display/bridge/chipone,icn6211.yaml   |  99 +++
 .../bindings/display/bridge/lontium,lt8912b.yaml   | 102 +++
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/driver-api/dma-buf.rst               |  76 ++
 Documentation/gpu/todo.rst                         |   2 +-
 MAINTAINERS                                        |  21 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   8 +-
 drivers/gpu/drm/bridge/Kconfig                     |  27 +
 drivers/gpu/drm/bridge/Makefile                    |   2 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  27 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  27 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  34 +
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           | 293 ++++++++
 drivers/gpu/drm/bridge/lontium-lt8912b.c           | 765 +++++++++++++++++=
++++
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   2 +-
 drivers/gpu/drm/bridge/panel.c                     |  12 +
 drivers/gpu/drm/bridge/tc358767.c                  |  20 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  18 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  15 +-
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_displayid.c                    | 132 ++++
 drivers/gpu/drm/drm_dp_mst_topology.c              |  59 +-
 drivers/gpu/drm/drm_edid.c                         | 171 +----
 drivers/gpu/drm/drm_probe_helper.c                 |   7 +-
 drivers/gpu/drm/drm_property.c                     |   4 +-
 drivers/gpu/drm/drm_sysfs.c                        |   9 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   2 +-
 drivers/gpu/drm/gud/Kconfig                        |  14 +
 drivers/gpu/drm/gud/Makefile                       |   4 +
 drivers/gpu/drm/gud/gud_connector.c                | 729 +++++++++++++++++=
+++
 drivers/gpu/drm/gud/gud_drv.c                      | 661 ++++++++++++++++++
 drivers/gpu/drm/gud/gud_internal.h                 | 154 +++++
 drivers/gpu/drm/gud/gud_pipe.c                     | 552 +++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  28 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   2 +-
 drivers/gpu/drm/meson/meson_venc.c                 |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  13 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |   5 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |   9 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   1 -
 drivers/gpu/drm/panel/panel-simple.c               |  85 ++-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |   3 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   5 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  16 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   2 -
 drivers/gpu/drm/scheduler/sched_entity.c           |   6 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   9 +-
 drivers/gpu/drm/stm/ltdc.c                         |  12 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  19 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       | 135 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   1 -
 drivers/gpu/drm/ttm/ttm_device.c                   |  85 ++-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   8 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   9 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       | 114 ++-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |   7 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   1 +
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   3 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  27 +-
 drivers/video/fbdev/core/fb_defio.c                |  35 -
 drivers/video/fbdev/core/fbmem.c                   |   4 -
 drivers/video/fbdev/omap2/omapfb/omapfb.h          |   2 +-
 include/drm/drm_displayid.h                        |  30 +-
 include/drm/drm_drv.h                              |   2 +-
 include/drm/drm_edid.h                             |   3 +
 include/drm/drm_encoder.h                          |  18 +
 include/drm/gud.h                                  | 333 +++++++++
 include/drm/ttm/ttm_bo_api.h                       |   4 +-
 include/drm/ttm/ttm_bo_driver.h                    |   5 +-
 include/drm/ttm/ttm_device.h                       |  13 +-
 include/drm/ttm/ttm_tt.h                           |   3 +-
 include/linux/fb.h                                 |   3 -
 include/linux/vgaarb.h                             |   4 +-
 include/uapi/drm/drm.h                             | 125 +++-
 include/uapi/drm/drm_mode.h                        |   1 +
 90 files changed, 4725 insertions(+), 578 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chipon=
e,icn6211.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontiu=
m,lt8912b.yaml
 create mode 100644 drivers/gpu/drm/bridge/chipone-icn6211.c
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c
 create mode 100644 drivers/gpu/drm/drm_displayid.c
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

--4lvqoee7xyiqztpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGWpEAAKCRDj7w1vZxhR
xa2zAQC98+9vh8Dbb97P0VOBMiqQ9VKrl112O8FuTzXD3WZ95wD+Mw0EpX+MAO0Y
TgXkgtBY/4fXYhR/sv855I8xIxxFMgQ=
=UyUi
-----END PGP SIGNATURE-----

--4lvqoee7xyiqztpx--

--===============0087836731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0087836731==--
