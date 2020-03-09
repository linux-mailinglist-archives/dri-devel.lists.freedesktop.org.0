Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4317F1C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340D6E82F;
	Tue, 10 Mar 2020 08:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A1D6E45E;
 Mon,  9 Mar 2020 13:54:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14A891306;
 Mon,  9 Mar 2020 09:54:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 09:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=wQgfCVRdPJ3Bx1L7GGAPhGdKOPQIPPMfvLVXr9WOc0g=; b=q1VMloOv
 9B6+gVjnWJukXoyxFGVJL5OOkgdU1oD+486T7hv99Zan9GM5RbfP6HkR7CPQ9pzV
 4R9n3Ok6AG8AST8vMdIT/6eqFbXvqiZOyJhI1yaxWWSj5kg2C6p0wr1zQa2ZE+RD
 FcYBSGZI4nJQdcTVGJMxlQYCmMFeYaLs62OJX+sd2VGwSvtXEhx9VEBPyC9ihWMB
 tqHUTiStO9/QLunTnNHooTN9GZ3qzZN8BpWPZhMKdw7feLSL39rIjFAcJ4/Yofft
 EVl0wd/N0vIRlh0rw0kPvZzqDBksPzZD+FhPaxHp5lZ5sxvaJT0g1KWHIfd0SvPg
 jJ8waQp7ZRmgjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=wQgfCVRdPJ3Bx1L7GGAPhGdKOPQIP
 PMfvLVXr9WOc0g=; b=cRXYbq/z2sN3HLRCbHFTs+CM8baxhPbSl/0R2GKin1yLR
 mu6xLdD28de6afNkiiLPfsFaMbA0GJZk5QvkHm4B1MHxLWc22pUQwHeW3jqe/55T
 0X7XSYHmBQmvo2h2Mdx+n+i0nW8Qr4q1s+xdpymqrZ5cLGffEn9G5nNDt71Mk+Rz
 yt/2NJ8AI24hncSfKKIlZa/giTO1vsL+coz0ERBHWP6jrLy6jeqkYiUNDjBJlxn0
 3OIWA1QBOu8j3IrJyq9Dwli/7uuw9ixmEozLiPS5z/mn5od4e4uFzBRMoFBRqavJ
 SY5T6j1zcMpmmQkjWR/Na15K2UQ2G1yUwWqD1w37g==
X-ME-Sender: <xms:oUpmXnYxMLoDQTMeTS8SOm-r6qWsKWJHKqEgen3HBFk1jnLML2M6lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpe
 hfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
 gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oUpmXnyq1-HoDBj7hhB8-VopBuuc7cGVEmBs7YUzQ2PBVrNyso6URg>
 <xmx:oUpmXjO-BToM5wdl7AIr8su7bzOCg30oQ-kAa07jlORUbIGm7J0d-A>
 <xmx:oUpmXl6ETnJuwndsdmbAXp-A3mugf3zAFQ_ZK-Nf1s-wBNWokE8jpg>
 <xmx:okpmXnHY1AV67im2Bt62_SLpkEmL9XMMigzmApjoyMQEbNR3c2oXEQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17ECC3061363;
 Mon,  9 Mar 2020 09:54:41 -0400 (EDT)
Date: Mon, 9 Mar 2020 14:54:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200309135439.dicfnbo4ikj4tkz7@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Content-Type: multipart/mixed; boundary="===============1366167866=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1366167866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7lexsgadoik4gdmh"
Content-Disposition: inline


--7lexsgadoik4gdmh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's a new drm-misc-next PR.

Thanks!
Maxime

drm-misc-next-2020-03-09:
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
 - fb-helper: Remove drm_fb_helper_{add,add_all,remove}_one_connector
 - fbdev: some cleanups and dead-code removal
 - Conversions to simple-encoder
 - zero-length array removal
 - Panel: panel-dpi support in panel-simple, Novatek NT35510, Elida
   KD35T133,
The following changes since commit 60347451ddb0646c1a9cc5b9581e5bcf648ad1aa:

  Merge tag 'drm-misc-next-2020-02-27' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2020-02-28 16:22:41 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-03-09

for you to fetch changes up to bc1a4130fc0309cc2f43b9cc616ebbc295e886ff:

  drm/virtio: add case for shmem objects in virtio_gpu_cleanup_object(..) (=
2020-03-09 10:44:34 +0100)

----------------------------------------------------------------
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
 - fb-helper: Remove drm_fb_helper_{add,add_all,remove}_one_connector
 - fbdev: some cleanups and dead-code removal
 - Conversions to simple-encoder
 - zero-length array removal
 - Panel: panel-dpi support in panel-simple, Novatek NT35510, Elida
   KD35T133,

----------------------------------------------------------------
Andy Shevchenko (1):
      fbdev: simplefb: Platform data shan't include kernel.h

Bartlomiej Zolnierkiewicz (7):
      video: fbdev: sh_mobile_lcdcfb: fix sparse warnings about using incor=
rect types
      video: fbdev: sh_mobile_lcdcfb: add COMPILE_TEST support
      video: fbdev: arcfb: add COMPILE_TEST support
      video: fbdev: w100fb: fix sparse warnings
      video: fbdev: w100fb: add COMPILE_TEST support
      video: fbdev: wm8505fb: fix sparse warnings about using incorrect typ=
es
      video: fbdev: wm8505fb: add COMPILE_TEST support

Benjamin Gaignard (2):
      drm/dp_mst: Fix W=3D1 warnings
      drm/dp_mst: Check crc4 value while building sideband message

Chris Wilson (2):
      drm/mm: Break long searches in fragmented address spaces
      drm: Make drm_pci_agp_init legacy

Christian K=C3=B6nig (7):
      dma-buf: add dynamic DMA-buf handling v15
      drm/ttm: remove the backing store if no placement is given
      drm/amdgpu: use allowed_domains for exported DMA-bufs
      drm/amdgpu: add amdgpu_dma_buf_pin/unpin v2
      drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
      dma-buf: drop dynamic_mapping flag
      dma-buf: make move_notify mandatory if importer_ops are provided

Colin Ian King (1):
      drm/tidss: fix spelling mistakes "bufer" and "requsted"

Dafna Hirschfeld (1):
      dt-bindings: convert rockchip-drm.txt to rockchip-drm.yaml

Dan Carpenter (1):
      drm: prevent a harmless integer overflow in drm_legacy_sg_alloc()

Daniel Vetter (1):
      drm/pci: Unexport drm_get_pci_dev

Emmanuel Vadot (1):
      drm/client: Dual licence the file in GPL-2 and MIT

Gurchetan Singh (2):
      drm/virtio: factor out the sg_table from virtio_gpu_object
      drm/virtio: add case for shmem objects in virtio_gpu_cleanup_object(.=
=2E)

Gustavo A. R. Silva (5):
      video: Replace zero-length array with flexible-array member
      drm/gma500/intel_bios.h: Replace zero-length array with flexible-arra=
y member
      drm/vc4/vc4_drv.h: Replace zero-length array with flexible-array memb=
er
      drm/bridge/mhl.h: Replace zero-length array with flexible-array member
      drm/vboxvideo/vboxvideo.h: Replace zero-length array with flexible-ar=
ray member

Heiko Stuebner (2):
      dt-bindings: display: panel: Add binding document for Elida KD35T133
      drm/panel: add panel driver for Elida KD35T133 panels

James Hughes (2):
      drm/vc4: Replace wait_for macros to remove use of msleep
      drm/v3d: Replace wait_for macros to remove use of msleep

Jyri Sarha (1):
      drm/tidss: dispc: Fix broken plane positioning code

Laurent Pinchart (1):
      drm/tidss: Use drm_for_each_bridge_in_chain()

Linus Walleij (3):
      dt-bindings: Add vendor prefix for Hydis technologies
      drm/panel: Add DT bindings for Novatek NT35510-based panels
      drm/panel: Add driver for Novatek NT35510-based panels

Lukas Bulwahn (1):
      MAINTAINERS: adjust to reservation.h renaming

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Pankaj Bharadiya (7):
      drm: Remove unused arg from drm_fb_helper_init
      drm/radeon: remove radeon_fb_{add,remove}_connector functions
      drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
      drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector cal=
ls
      drm: Remove drm_fb_helper add, add all and remove connector calls
      drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector=
 functions
      drm/todo: Update drm_fb_helper tasks

Peter Rosin (1):
      Revert "drm/panel: simple: Add support for Sharp LQ150X1LG11 panels"

Ramalingam C (2):
      drm/hdcp: optimizing the srm handling
      drm/hdcp: fix DRM_HDCP_2_KSV_COUNT_2_LSBITS

Randy Dunlap (1):
      drm: unbreak the DRM menu, broken by DRM_EXPORT_FOR_TESTS

Rich Felker (1):
      matroxfb: add Matrox MGA-G200eW board support

Sam Ravnborg (5):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema
      dt-bindings: display: add data-mapping to panel-dpi
      drm/panel: simple: add panel-dpi support

Souptick Joarder (1):
      video: fbdev: radeon: Remove dead code

Thomas Zimmermann (6):
      drm/simple-kms: Add drm_simple_encoder_{init,create}()
      drm/ast: Use simple encoder
      drm/mgag200: Use simple encoder
      drm/qxl: Use simple encoder
      drm/simple-kms: Fix documentation for drm_simple_encoder_init()
      drm/vblank: Fix documentation of VBLANK timestamp helper

Vasily Khoruzhick (4):
      drm/bridge: anx6345: don't print error message if regulator is not re=
ady
      dt-bindings: Add Guangdong Neweast Optoelectronics CO. LTD vendor pre=
fix
      dt-bindings: display: simple: Add NewEast Optoelectronics WJFH116008A=
 compatible
      drm/panel: simple: Add NewEast Optoelectronics CO., LTD WJFH116008A p=
anel support

YueHaibing (2):
      drm/tidss: Drop pointless static qualifier in dispc_find_csc()
      video: fbdev: pxa168fb: remove unnecessary platform_get_irq

kbuild test robot (1):
      drm/panfrost: default_supplies[] can be static

yu kuai (6):
      video: fbdev: radeonfb: remove set but not used variable 'hSyncPol'
      video: fbdev: radeonfb: remove set but not used variable 'vSyncPol'
      video: fbdev: radeonfb: remove set but not used variable '=E2=80=98cS=
ync=E2=80=99'
      video: fbdev: radeonfb: remove set but not used variable 'bytpp'
      video: fbdev: kyrofb: remove set but not used variable 'ulScaleRight'
      video: fbdev: atyfb: remove set but not used variable 'mach64RefFreq'

 .../bindings/display/panel/display-timing.txt      |  124 +--
 .../bindings/display/panel/display-timings.yaml    |   77 ++
 .../bindings/display/panel/elida,kd35t133.yaml     |   49 +
 .../bindings/display/panel/novatek,nt35510.yaml    |   56 +
 .../bindings/display/panel/panel-common.yaml       |   15 +-
 .../bindings/display/panel/panel-dpi.txt           |   50 -
 .../bindings/display/panel/panel-dpi.yaml          |   81 ++
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/panel-timing.yaml       |  227 ++++
 .../bindings/display/rockchip/rockchip-drm.txt     |   19 -
 .../bindings/display/rockchip/rockchip-drm.yaml    |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/todo.rst                         |   17 -
 MAINTAINERS                                        |    9 +-
 drivers/dma-buf/Kconfig                            |   10 +
 drivers/dma-buf/dma-buf.c                          |  110 +-
 drivers/gpu/drm/Kconfig                            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  124 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   11 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   13 -
 drivers/gpu/drm/armada/armada_fbdev.c              |    8 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    6 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   25 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    8 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    3 -
 drivers/gpu/drm/drm_client.c                       |    2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  118 ++-
 drivers/gpu/drm/drm_fb_helper.c                    |    6 +-
 drivers/gpu/drm/drm_hdcp.c                         |  152 +--
 drivers/gpu/drm/drm_internal.h                     |    4 -
 drivers/gpu/drm/drm_mm.c                           |    8 +-
 drivers/gpu/drm/drm_pci.c                          |   46 +-
 drivers/gpu/drm/drm_scatter.c                      |    3 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |   44 +-
 drivers/gpu/drm/drm_sysfs.c                        |    2 -
 drivers/gpu/drm/drm_vblank.c                       |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    1 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   10 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    6 +-
 drivers/gpu/drm/gma500/intel_bios.h                |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   12 -
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    9 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   86 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    7 -
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |    6 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    6 +-
 drivers/gpu/drm/panel/Kconfig                      |   20 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  352 +++++++
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      | 1098 ++++++++++++++++=
++++
 drivers/gpu/drm/panel/panel-simple.c               |  149 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   29 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   10 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |   19 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |    3 -
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c      |    9 +-
 drivers/gpu/drm/tegra/fb.c                         |    8 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   55 +
 drivers/gpu/drm/tidss/tidss_crtc.h                 |    2 +
 drivers/gpu/drm/tidss/tidss_dispc.c                |   61 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    5 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   52 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   12 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   41 +-
 drivers/gpu/drm/vboxvideo/vboxvideo.h              |    2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   45 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   15 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   50 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    6 +-
 drivers/video/fbdev/Kconfig                        |    9 +-
 drivers/video/fbdev/aty/mach64_gx.c                |    3 +-
 drivers/video/fbdev/aty/radeon_base.c              |   26 +-
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c    |    3 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |   15 +
 drivers/video/fbdev/mmp/hw/mmp_ctrl.h              |    2 +-
 drivers/video/fbdev/pxa168fb.c                     |    3 -
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    4 +-
 drivers/video/fbdev/ssd1307fb.c                    |    2 +-
 drivers/video/fbdev/w100fb.c                       |   18 +-
 drivers/video/fbdev/wm8505fb.c                     |    2 +-
 include/drm/bridge/mhl.h                           |    4 +-
 include/drm/drm_fb_helper.h                        |   27 +-
 include/drm/drm_hdcp.h                             |    6 +-
 include/drm/drm_pci.h                              |   11 -
 include/drm/drm_simple_kms_helper.h                |    4 +
 include/linux/dma-buf.h                            |   97 +-
 include/linux/platform_data/simplefb.h             |    2 +-
 include/video/mmp_disp.h                           |    2 +-
 94 files changed, 3015 insertions(+), 921 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/display=
-timings.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/elida,k=
d35t133.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek=
,nt35510.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-d=
pi.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-d=
pi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-t=
iming.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip-drm.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip-drm.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-elida-kd35t133.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35510.c

--7lexsgadoik4gdmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXmZKnwAKCRDj7w1vZxhR
xQD3AP4z7QWLG4mYuBtaZ8PmtwSLJRopDxeDl/5SZXbipCfYmAD/RSwjovP7gK3v
YBoN+pk9r2kKPs9/NbNBpAMT8LlgHwc=
=FxMJ
-----END PGP SIGNATURE-----

--7lexsgadoik4gdmh--

--===============1366167866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1366167866==--
