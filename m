Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAF348D51
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2D6ECF9;
	Thu, 25 Mar 2021 09:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55956ECF3;
 Thu, 25 Mar 2021 09:47:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 163085809D5;
 Thu, 25 Mar 2021 05:47:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 25 Mar 2021 05:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=ZuXqaF05fc9j5zWBVeD86LX4OcaUJMbcMgKOHA/Zfjw=; b=FLWO4knb
 /BadBHeRkmtUFOSe81qtmiRsMghSAFemKbjN8VWGey4jX24dh1bB/6MklBEzB2S8
 yMq4cV1wnsll7yDkoW2kLalfZNUZhAoqotZ/i6YrTMgZ+6kzdIljMe/7H5LY1Eip
 +QyofUA+TvIWvMtUM0nXOPZ0EZgUFIlHRrF9TG/vQKvNLVnH+ZAawLiVQ6LJP7BA
 ICZp1csBcL8/fdPj4OqolPU+P/4APITCFQvXxTmk8p1bQ8nV1oX4bhTHatf0GXd4
 IGPUpuhFKoF7FcauIVkk/xHhfWZFeMGJ93XBWKI0ejEWZ98kUAkrJX+4zoVALObe
 hEHx5eA5VqOTQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ZuXqaF05fc9j5zWBVeD86LX4OcaUJ
 MbcMgKOHA/Zfjw=; b=lyWC31xMOw0lJwuJReC0KUSXQm/8kd/m9KfcLosKWfdLW
 mNp3QOTHZHwxGQT6fpgPASGOaXwNpBcHCdHnyoife0VMJXCjYrEZCWtdmtdQIEPE
 2xBq0VRUxxVDEMCUZH4TWafBfyALH1QCYvQDbpGcvpnRgVMJK7W3TMj7wxxnJw/c
 AmvoyYxANP4epvTnF+ci4q1IfCJFnPWw/dJZkY1A/uTnfVxYedcQT1JBXN56yMt0
 xK5BUlXNdsay4477qTi0foa83Krt0gT7FC0Pd7W4VKe5n/9+aP/vR6hdkDguCmwC
 IQf4XfyfThGECEEOWZg7KBjSAmKD6ZQ7h/WwBO42Q==
X-ME-Sender: <xms:KVxcYFU_uLtQ8US0NAVyvuMxX_loitLpvrIrifg65lztc7CgwtQv6A>
 <xme:KVxcYFlxq9bKriUxgnq2hSAh-QxweDo0xd5K7Kn-vHintfAygsaAwcBnfO7jUatEt
 9x7jmEK6Z14N_1Foe0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KVxcYBaRQRLxXo2fRq0I1tc7jGyjIUl556eXz31VT7R48nLOAXdBUA>
 <xmx:KVxcYIX2b8e9K6DQjvDgsPU-P6wEAMhfDDkmEYeqOAPOKLaTpx3_hA>
 <xmx:KVxcYPk4B1d3WK7gucAqi4jkhAjzR3dZFmhLYDvAoHxRE2wtih5cAQ>
 <xmx:K1xcYB7rbltezqcgeTDUMwpHramPXlOD-CAyMK5tnpyrbCZG9gQ0pg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F0FE1080057;
 Thu, 25 Mar 2021 05:47:21 -0400 (EDT)
Date: Thu, 25 Mar 2021 10:47:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20210325094718.anz5cg6r4xfab3r6@gilmour>
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
Content-Type: multipart/mixed; boundary="===============1304551602=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1304551602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5bxtamprq5fwubep"
Content-Disposition: inline


--5bxtamprq5fwubep
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

It's still a fairly quiet week, but here's this week's drm-misc-next PR

maxime

drm-misc-next-2021-03-25:
drm-misc-next for 5.13:

UAPI Changes:
  - New USB connector type

Cross-subsystem Changes:

Core Changes:
  - ttm: Introduce a per-device LRU lock, remove swap LRU

Driver Changes:
  - Introduction of USB Display driver
  - an78xx: DP-Aux fixes
  - an6345: DP-Aux fixes
  - tilcdc: Pixel clocks fixes
The following changes since commit 51c3b916a4d7e24b4918925965867fdd9bd8dd59:

  Merge tag 'drm-misc-next-2021-03-03' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2021-03-16 17:08:46 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-03-25

for you to fetch changes up to a1f091f8ef2b680a5184db065527612247cb4cae:

  drm/ttm: switch to per device LRU lock (2021-03-24 17:05:25 +0100)

----------------------------------------------------------------
drm-misc-next for 5.13:

UAPI Changes:
  - New USB connector type

Cross-subsystem Changes:

Core Changes:
  - ttm: Introduce a per-device LRU lock, remove swap LRU

Driver Changes:
  - Introduction of USB Display driver
  - an78xx: DP-Aux fixes
  - an6345: DP-Aux fixes
  - tilcdc: Pixel clocks fixes

----------------------------------------------------------------
Arnd Bergmann (2):
      fbdev: omapfb: avoid -Wempty-body warning
      vgaarb: avoid -Wempty-body warnings

Bhaskar Chowdhury (2):
      drm: Few typo fixes
      drm/meson: Fix few typo

Christian K=F6nig (7):
      drm/sched: select new rq even if there is only one v3
      drm/qxl: clean up qxl_bo_move_notify
      drm/nouveau: clean up nouveau_bo_move_ntfy
      drm/vmwgfx: clean up vmw_move_notify v2
      drm/ttm: move swapout logic around v3
      drm/ttm: remove swap LRU v3
      drm/ttm: switch to per device LRU lock

Daniel Vetter (1):
      dma-fence: Document recoverable page fault implications

Dario Binacchi (3):
      drm/tilcdc: rename req_rate to pclk_rate
      drm/tilcdc: fix LCD pixel clock setting
      drm/tilcdc: fix pixel clock setting warning message

Douglas Anderson (6):
      drm/panel-simple: Undo enable if HPD never asserts
      drm/panel-simple: Don't wait longer for HPD than hpd_absent_delay
      drm/panel-simple: Retry if we timeout waiting for HPD
      dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1
      drm/panel-simple: Add N116BCA-EA1
      drm: panel: simple: Set enable delay for BOE NV110WTM-N61

Jagan Teki (1):
      drm/stm: ltdc: Use simple encoder

Jianhui Zhao (1):
      docs: gpu: fix typo

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

Paul Cercueil (1):
      drm/ingenic: Fix non-OSD mode

Simon Ser (1):
      drm/uapi: document kernel capabilities

Tian Tao (2):
      drm/vboxvideo: Use managed VRAM-helper initialization
      drm/sysfs: Convert sysfs sprintf/snprintf family to sysfs_emit

Yang Li (2):
      drm/gma500: use NULL instead of using plain integer as pointer
      drm/tilcdc: panel: fix platform_no_drv_owner.cocci warnings

Yannick Fertre (1):
      drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER

kernel test robot (2):
      drm/gud: fix sizeof use
      drm/gud: Remove unneeded semicolon

xndcn (1):
      drm/virtio: fix possible leak/unlock virtio_gpu_object_array

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/driver-api/dma-buf.rst               |  76 +++
 Documentation/gpu/todo.rst                         |   2 +-
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   8 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  27 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  27 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   1 +
 drivers/gpu/drm/bridge/tc358767.c                  |  20 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  18 +-
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_probe_helper.c                 |   7 +-
 drivers/gpu/drm/drm_property.c                     |   4 +-
 drivers/gpu/drm/drm_sysfs.c                        |   9 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   2 +-
 drivers/gpu/drm/gud/Kconfig                        |  14 +
 drivers/gpu/drm/gud/Makefile                       |   4 +
 drivers/gpu/drm/gud/gud_connector.c                | 729 +++++++++++++++++=
++++
 drivers/gpu/drm/gud/gud_drv.c                      | 661 +++++++++++++++++=
++
 drivers/gpu/drm/gud/gud_internal.h                 | 154 +++++
 drivers/gpu/drm/gud/gud_pipe.c                     | 552 ++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  11 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   2 +-
 drivers/gpu/drm/meson/meson_venc.c                 |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  13 +-
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
 drivers/gpu/drm/ttm/ttm_device.c                   |  71 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   8 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   9 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |   7 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   1 +
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  27 +-
 drivers/video/fbdev/core/fb_defio.c                |  35 -
 drivers/video/fbdev/core/fbmem.c                   |   4 -
 drivers/video/fbdev/omap2/omapfb/omapfb.h          |   2 +-
 include/drm/gud.h                                  | 333 ++++++++++
 include/drm/ttm/ttm_bo_api.h                       |   4 +-
 include/drm/ttm/ttm_bo_driver.h                    |   5 +-
 include/drm/ttm/ttm_device.h                       |  13 +-
 include/linux/fb.h                                 |   3 -
 include/linux/vgaarb.h                             |   4 +-
 include/uapi/drm/drm.h                             | 125 +++-
 include/uapi/drm/drm_mode.h                        |   1 +
 65 files changed, 3014 insertions(+), 318 deletions(-)
 create mode 100644 drivers/gpu/drm/gud/Kconfig
 create mode 100644 drivers/gpu/drm/gud/Makefile
 create mode 100644 drivers/gpu/drm/gud/gud_connector.c
 create mode 100644 drivers/gpu/drm/gud/gud_drv.c
 create mode 100644 drivers/gpu/drm/gud/gud_internal.h
 create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
 create mode 100644 include/drm/gud.h

--5bxtamprq5fwubep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFxcJgAKCRDj7w1vZxhR
xdeWAQD7ZLa1Y0wBK4R+TYWFzBocLNx/a7SDZnIl0fY2RVDD8gD8DETZ3p1CAQwt
Y8eFhbTyn3VylnMunE1LXb6GcI703Q8=
=Cumt
-----END PGP SIGNATURE-----

--5bxtamprq5fwubep--

--===============1304551602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1304551602==--
