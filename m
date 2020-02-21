Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9509167BBE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83496F411;
	Fri, 21 Feb 2020 11:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811146E25F;
 Fri, 21 Feb 2020 10:09:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5D4783712;
 Fri, 21 Feb 2020 05:09:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 21 Feb 2020 05:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=QY8Bh2vyR4jiFnn4oUghoiLtXMtdfOYsSCG6BV9QmiA=; b=e3n8HI+T
 JJ3YLDsl8Te317qBKlZnkmPksfw+wG+jxCqHm5sCY+3Ey5VG9yZVqrdgH/IOxQS5
 1yHd8WMvTN3Ekub1mr/1ZhncbDy9Zawh+6zmUOy22qZfA4HFFA/67voncNL/flVn
 Y807AxvDdtYcIjzXKlDNf65afD4i/6IhphuZyIWD09kza/no/zg0+rZRrNwcm1zj
 Nybx/0GSLHIA3uw63w8V2Vcxcs1iwqG+PwreQgLYFWZgulLauiDGWDr8htPQ1PeR
 ZMDxRI+nOKi0yu3SDKwv/yoi6MsV8rITu0PkM76oD3fDIonqmfDIbfmY2N0oI5xq
 JyeIgDXuTCzYzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=QY8Bh2vyR4jiFnn4oUghoiLtXMtdf
 OYsSCG6BV9QmiA=; b=Ly+Lu8M0CE1eeMxgpMXbkNXcVEGYPcB8Kusyj3Vkrv3Sq
 z9n5wpoxG60CXlU9izcvR+5hC8egtdBh/BeMEEP6YXB9s4trV4BWT7mA2GzP7zyN
 l78bMZPFCQPr9PuRdUqyB/VT03vrlbKwBoM3ySbqUl3+fTd6Sz6k3jYUp3zhpDLK
 plwBOqn5p6N6pG8ZEhtoimEupJaKRNz95abvtbKtdHSMKBhEkehuzzeqsgiBz0VN
 4mLAbBHa6yH3s40K3KvkcMOP3llWGcXlftW0ietbSBXs/2i5eZsKMFuHmAbBbS3c
 OMoBGXZBW88FgVcEL/7Tk90orjCaf/KvSyd6gJXDQ==
X-ME-Sender: <xms:WqxPXu6w1X11TViGND_7SZkouvi5-tujUiuJb9AATB9I3CtA84eprg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WqxPXrGGLS0F_HJPRqjuZhhpTheb8n6Q5ivxMerPvPqUTQD1Bbx0Rw>
 <xmx:WqxPXkR1vkXkgMUpYuPwJmtSaiC0tywBWJIC48IpdEpMTDEtm_HrCg>
 <xmx:WqxPXgMjtH_TN-XvLDY25ZkKaEQq6Op8GvRiymye6T66U0KQaodWkA>
 <xmx:W6xPXg-kxuOIxsdpeNVoDhAUzvmxa9IicGmGqDKSuAi4kGjpnQ2XPg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4017E3280060;
 Fri, 21 Feb 2020 05:09:30 -0500 (EST)
Date: Fri, 21 Feb 2020 11:09:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200221100928.anipic2v7q5wswkb@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Content-Type: multipart/mixed; boundary="===============0697325450=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0697325450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7samnu77bx2lwacq"
Content-Disposition: inline


--7samnu77bx2lwacq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's a new round of drm-misc-next patches.

Thanks!
Maxime

drm-misc-next-2020-02-21:
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - crtc: Drop get_crtc callback
  - dp: Add support for DP1.4 EDID corruption test
  - edid: Improve CEA detailed timings support
  - format-helper: Move to a GPL2/MIT dual license
  - mode: Drop drm_display_mode.private
  - vblank: Convert drm-driver vblank related code to CRTC equivalents and
    cleanup the core.
  - drm_global_mutex reworks

Driver Changes:
  - hibmc: Add gamma_set support and improve DPMS support
  - pl111: Support Integrator IM-PD1
  - sun4i: LVDS support for the A20, improvements to panel handling in DSI
  - virtio: job batching improvements, mem handling code rework
  - panel: Support for Rocktech RK101II01D-CT
  - bridge: Support for ADV7535, tc358768, improvements to ti-sn65dsi86
The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-02-21

for you to fetch changes up to d718e53a48f7bcfa6cdd0c00d5ed1fb516595446:

  drm/sun4i: tcon: Support LVDS output on Allwinner A20 (2020-02-20 18:25:3=
6 +0100)

----------------------------------------------------------------
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - crtc: Drop get_crtc callback
  - dp: Add support for DP1.4 EDID corruption test
  - edid: Improve CEA detailed timings support
  - format-helper: Move to a GPL2/MIT dual license
  - mode: Drop drm_display_mode.private
  - vblank: Convert drm-driver vblank related code to CRTC equivalents and
    cleanup the core.
  - drm_global_mutex reworks

Driver Changes:
  - hibmc: Add gamma_set support and improve DPMS support
  - pl111: Support Integrator IM-PD1
  - sun4i: LVDS support for the A20, improvements to panel handling in DSI
  - virtio: job batching improvements, mem handling code rework
  - panel: Support for Rocktech RK101II01D-CT
  - bridge: Support for ADV7535, tc358768, improvements to ti-sn65dsi86

----------------------------------------------------------------
Andrey Lebedev (4):
      drm/sun4i: tcon: Introduce LVDS setup routine setting
      dt-bindings: display: sun4i: New compatibles for A20 tcons
      drm/sun4i: tcon: Separate quirks for tcon0 and tcon1 on A20
      drm/sun4i: tcon: Support LVDS output on Allwinner A20

Bogdan Togorean (3):
      drm: bridge: adv7511: Remove DRM_I2C_ADV7533 Kconfig
      drm: bridge: adv7511: Add support for ADV7535
      dt-bindings: drm: bridge: adv7511: Add ADV7535 support

Boris Brezillon (1):
      drm/bridge: Fix the bridge kernel doc

Christian K=F6nig (6):
      drm/ttm: refine ghost BO resv criteria
      drm/ttm: cleanup ttm_buffer_object_transfer
      drm/ttm: use RCU in ttm_bo_flush_all_fences
      drm/ttm: rework BO delayed delete. v2
      drm/ttm: replace dma_resv object on deleted BOs v3
      drm/ttm: individualize resv objects before calling release_notify

Christophe JAILLET (1):
      dma-buf: Fix a typo in Kconfig

Daniel Vetter (6):
      drm/fbdev-helper: don't force restores
      drm/client: Rename _force to _locked
      drm: Push drm_global_mutex locking in drm_open
      drm: Nerf drm_global_mutex BKL for good drivers
      drm/print: Delete a few unused shouting macros
      drm/atomic-helper: fix kerneldoc

Douglas Anderson (9):
      drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
      drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
      drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
      drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
      drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
      drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
      drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
      drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
      drm/bridge: ti-sn65dsi86: Avoid invalid rates

Emmanuel Vadot (1):
      drm/format_helper: Dual licence the file in GPL 2 and MIT

Enric Balletbo i Serra (1):
      drm/bridge: panel: Fix typo in drm_panel_bridge_add docs

Gerd Hoffmann (19):
      drm/bochs: deinit bugfix
      drm/virtio: simplify virtio_gpu_alloc_cmd
      drm/virtio: resource teardown tweaks
      drm/virtio: move mapping teardown to virtio_gpu_cleanup_object()
      drm/virtio: move virtio_gpu_mem_entry initialization to new function
      drm/qxl: reorder calls in qxl_device_fini().
      drm/qxl: add drm_driver.release callback.
      drm/bochs: add drm_driver.release callback.
      drm/cirrus: add drm_driver.release callback.
      drm/virtio: add drm_driver.release callback.
      drm/virtio: fix virtio_gpu_execbuffer_ioctl locking
      drm/virtio: fix virtio_gpu_cursor_plane_update().
      drm/virtio: fix error check
      drm/virtio: rework notification for better batching
      drm/virtio: notify before waiting
      drm/virtio: batch plane updates (pageflip)
      drm/virtio: batch resource creation
      drm/virtio: batch display query
      drm/virtio: move remaining virtio_gpu_notify calls

Gustavo A. R. Silva (1):
      drm/qxl: replace zero-length array with flexible-array member

Jani Nikula (1):
      drm/irq: remove check on dev->dev_private

Jerry (Fangzhi) Zuo (1):
      drm: Add support for DP 1.4 Compliance edid corruption test

Jonathan Neusch=E4fer (1):
      drm/mcde: Fix Sphinx formatting

Jyri Sarha (3):
      drm/bridge: sii902x: Select SND_SOC_HDMI_CODEC if SND_SOC is configur=
ed
      dt-bindings: panel-simple: Add rocktech,rk101ii01d-ct compatible
      drm/panel: simple: Add Rocktech RK101II01D-CT panel

Kieran Bingham (1):
      drm/omapdrm: Fix trivial spelling

Linus Walleij (1):
      drm/pl111: Support Integrator IM-PD1 module

Maxime Ripard (1):
      Merge v5.6-rc2 into drm-misc-next

Peter Ujfalusi (4):
      dt-bindings: display: bridge: Add documentation for Toshiba tc358768
      drm/bridge: Add tc358768 driver
      drm/omap: dmm_tiler: Use dmaengine_prep_dma_memcpy() for i878 workaro=
und
      drm/omap: dmm_tiler: Remove the dma_async_issue_pending() call

Sam Ravnborg (3):
      drm/print: clean up RATELIMITED macros
      drm: drop unused drm_crtc callback
      drm: drop unused drm_display_mode.private

Samuel Holland (5):
      drm/sun4i: dsi: Remove unused drv from driver context
      drm/sun4i: dsi: Use NULL to signify "no panel"
      drm/sun4i: dsi: Allow binding the host without a panel
      drm/sun4i: dsi: Remove incorrect use of runtime PM
      drm/sun4i: dsi: Avoid hotplug race with DRM driver bind

Thomas Zimmermann (22):
      drm: Remove internal setup of struct drm_device.vblank_disable_immedi=
ate
      drm: Add get_scanout_position() to struct drm_crtc_helper_funcs
      drm: Add get_vblank_timestamp() to struct drm_crtc_funcs
      drm/amdgpu: Convert to struct drm_crtc_helper_funcs.get_scanout_posit=
ion()
      drm/amdgpu: Convert to CRTC VBLANK callbacks
      drm/gma500: Convert to CRTC VBLANK callbacks
      drm/i915: Convert to CRTC VBLANK callbacks
      drm/nouveau: Convert to struct drm_crtc_helper_funcs.get_scanout_posi=
tion()
      drm/nouveau: Convert to CRTC VBLANK callbacks
      drm/radeon: Convert to struct drm_crtc_helper_funcs.get_scanout_posit=
ion()
      drm/radeon: Convert to CRTC VBLANK callbacks
      drm/msm: Convert to struct drm_crtc_helper_funcs.get_scanout_position=
()
      drm/msm: Convert to CRTC VBLANK callbacks
      drm/stm: Convert to struct drm_crtc_helper_funcs.get_scanout_position=
()
      drm/stm: Convert to CRTC VBLANK callbacks
      drm/sti: Convert to CRTC VBLANK callbacks
      drm/vc4: Convert to struct drm_crtc_helper_funcs.get_scanout_position=
()
      drm/vc4: Convert to CRTC VBLANK callbacks
      drm/vkms: Convert to CRTC VBLANK callbacks
      drm/vmwgfx: Convert to CRTC VBLANK callbacks
      drm: Clean-up VBLANK-related callbacks in struct drm_driver
      drm: Remove legacy version of get_scanout_position()

Tomi Valkeinen (1):
      drm/bridge: tfp410: add pclk limits

Vasily Khoruzhick (1):
      drm/lima: fix recovering from PLBU out of memory

Ville Syrj=E4l=E4 (6):
      drm/edid: Check the number of detailed timing descriptors in the CEA =
ext block
      drm/edid: Don't accept any old garbage as a display descriptor
      drm/edid: Introduce is_detailed_timing_descritor()
      drm/edid: Clear out spurious whitespace
      drm/edid: Document why we don't bounds check the DispID CEA block sta=
rt/end
      drm/edid: Add a FIXME about DispID CEA data block revision

Wen Yang (1):
      drm/omap: fix possible object reference leak

Yannick Fertr=E9 (1):
      drm/bridge/synopsys: dsi: missing post disable

Zheng Bin (1):
      drm/omap: use true,false for bool variable

Zhihui Chen (3):
      drm/hisilicon/hibmc: fix 'xset dpms force off' fail
      drm/hisilicon/hibmc: add DPMS on/off function
      drm/hisilicon/hibmc: add gamma_set function

 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |    6 +
 .../bindings/display/bridge/adi,adv7511.txt        |   23 +-
 .../devicetree/bindings/display/bridge/ps8640.yaml |  112 +
 .../bindings/display/bridge/toshiba,tc358768.yaml  |  159 ++
 .../bindings/display/ilitek,ili9486.yaml           |   73 +
 .../bindings/display/panel/auo,b080uan01.txt       |    7 -
 .../bindings/display/panel/auo,b101aw03.txt        |    7 -
 .../bindings/display/panel/auo,b101ean01.txt       |    7 -
 .../bindings/display/panel/auo,b101xtn01.txt       |    7 -
 .../bindings/display/panel/auo,b116xw03.txt        |    7 -
 .../bindings/display/panel/auo,b133htn01.txt       |    7 -
 .../bindings/display/panel/auo,b133xtn01.txt       |    7 -
 .../bindings/display/panel/auo,g070vvn01.txt       |   29 -
 .../bindings/display/panel/auo,g101evn010.txt      |   12 -
 .../bindings/display/panel/auo,g104sn02.txt        |   12 -
 .../bindings/display/panel/auo,g133han01.txt       |    7 -
 .../bindings/display/panel/auo,g185han01.txt       |    7 -
 .../bindings/display/panel/auo,p320hvn03.txt       |    8 -
 .../bindings/display/panel/auo,t215hvn01.txt       |    7 -
 .../bindings/display/panel/avic,tm070ddh03.txt     |    7 -
 .../bindings/display/panel/boe,hv070wsa-100.txt    |   28 -
 .../bindings/display/panel/boe,nv101wxmn51.txt     |    7 -
 .../bindings/display/panel/boe,tv080wum-nl0.txt    |    7 -
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |   80 +
 .../display/panel/cdtech,s043wq26h-ct7.txt         |   12 -
 .../display/panel/cdtech,s070wv95-ct16.txt         |   12 -
 .../display/panel/chunghwa,claa070wp03xg.txt       |    7 -
 .../display/panel/chunghwa,claa101wa01a.txt        |    7 -
 .../display/panel/chunghwa,claa101wb03.txt         |    7 -
 .../display/panel/dataimage,scf0700c48ggu18.txt    |    8 -
 .../bindings/display/panel/dlc,dlc1010gig.txt      |   12 -
 .../bindings/display/panel/edt,et-series.txt       |   55 -
 .../display/panel/evervision,vgg804821.txt         |   12 -
 .../display/panel/feixin,k101-im2ba02.yaml         |   55 +
 .../display/panel/foxlink,fl500wvr00-a0t.txt       |    7 -
 .../bindings/display/panel/friendlyarm,hd702e.txt  |   32 -
 .../display/panel/giantplus,gpg482739qs5.txt       |    7 -
 .../bindings/display/panel/hannstar,hsd070pww1.txt |    7 -
 .../bindings/display/panel/hannstar,hsd100pxn1.txt |    7 -
 .../bindings/display/panel/hit,tx23d38vm0caa.txt   |    7 -
 .../bindings/display/panel/innolux,at043tn24.txt   |    7 -
 .../bindings/display/panel/innolux,at070tn92.txt   |    7 -
 .../bindings/display/panel/innolux,g070y2-l01.txt  |   12 -
 .../bindings/display/panel/innolux,g101ice-l01.txt |    7 -
 .../bindings/display/panel/innolux,g121i1-l01.txt  |    7 -
 .../bindings/display/panel/innolux,g121x1-l03.txt  |    7 -
 .../bindings/display/panel/innolux,n116bge.txt     |    7 -
 .../bindings/display/panel/innolux,n156bge-l21.txt |    7 -
 .../bindings/display/panel/innolux,zj070na-01p.txt |    7 -
 .../bindings/display/panel/koe,tx14d24vm1bpa.txt   |   42 -
 .../bindings/display/panel/koe,tx31d200vm0baa.txt  |   25 -
 .../bindings/display/panel/kyo,tcg121xglp.txt      |    7 -
 .../display/panel/lemaker,bl035-rgb-002.txt        |   12 -
 .../bindings/display/panel/lg,lb070wv8.txt         |    7 -
 .../bindings/display/panel/lg,lp079qx1-sp0v.txt    |    7 -
 .../bindings/display/panel/lg,lp097qx1-spa1.txt    |    7 -
 .../bindings/display/panel/lg,lp120up1.txt         |    7 -
 .../bindings/display/panel/lg,lp129qe.txt          |    7 -
 .../display/panel/mitsubishi,aa070mc01.txt         |    7 -
 .../bindings/display/panel/nec,nl12880b20-05.txt   |    8 -
 .../bindings/display/panel/nec,nl4827hc19-05b.txt  |    7 -
 .../bindings/display/panel/netron-dy,e231732.txt   |    7 -
 .../panel/newhaven,nhd-4.3-480272ef-atxl.txt       |    7 -
 .../display/panel/nlt,nl192108ac18-02d.txt         |    8 -
 .../devicetree/bindings/display/panel/nvd,9128.txt |    7 -
 .../display/panel/okaya,rs800480t-7x0gp.txt        |    7 -
 .../display/panel/olimex,lcd-olinuxino-43-ts.txt   |    7 -
 .../bindings/display/panel/ontat,yx700wv03.txt     |    7 -
 .../bindings/display/panel/orisetech,otm8009a.txt  |   23 -
 .../bindings/display/panel/orisetech,otm8009a.yaml |   53 +
 .../display/panel/ortustech,com37h3m05dtc.txt      |   12 -
 .../display/panel/ortustech,com37h3m99dtc.txt      |   12 -
 .../display/panel/ortustech,com43h4m85ulc.txt      |    7 -
 .../display/panel/osddisplays,osd070t1718-19ts.txt |   12 -
 .../display/panel/osddisplays,osd101t2045-53ts.txt |   11 -
 .../display/panel/panasonic,vvx10f004b00.txt       |    7 -
 .../display/panel/panasonic,vvx10f034n00.txt       |   20 -
 .../bindings/display/panel/panel-simple-dsi.yaml   |   67 +
 .../bindings/display/panel/panel-simple.yaml       |  207 ++
 .../display/panel/qiaodian,qd43003c0-40.txt        |    7 -
 .../bindings/display/panel/raydium,rm68200.txt     |   25 -
 .../bindings/display/panel/raydium,rm68200.yaml    |   56 +
 .../display/panel/rocktech,rk070er9427.txt         |   25 -
 .../display/panel/samsung,lsn122dl01-c01.txt       |    7 -
 .../bindings/display/panel/samsung,ltn101nt05.txt  |    7 -
 .../display/panel/samsung,ltn140at29-301.txt       |    7 -
 .../display/panel/samsung,s6e88a0-ams452ef01.yaml  |   50 +
 .../bindings/display/panel/sharp,lq035q7db03.txt   |   12 -
 .../bindings/display/panel/sharp,lq070y3dg3b.txt   |   12 -
 .../bindings/display/panel/sharp,lq101k1ly04.txt   |    7 -
 .../bindings/display/panel/sharp,lq123p1jx31.txt   |    7 -
 .../display/panel/shelly,sca07010-bfn-lnn.txt      |    7 -
 .../bindings/display/panel/starry,kr122ea0sra.txt  |    7 -
 .../bindings/display/panel/tianma,tm070jdhg30.txt  |    7 -
 .../bindings/display/panel/tianma,tm070rvhg71.txt  |   29 -
 .../display/panel/toshiba,lt089ac29000.txt         |    8 -
 .../bindings/display/panel/tpk,f07a-0102.txt       |    8 -
 .../bindings/display/panel/tpk,f10a-0102.txt       |    8 -
 .../bindings/display/panel/urt,umsh-8596md.txt     |   16 -
 .../bindings/display/panel/vl050_8048nt_c01.txt    |   12 -
 .../bindings/display/panel/winstar,wf35ltiacd.txt  |   48 -
 .../bindings/display/sitronix,st7735r.txt          |   35 -
 .../bindings/display/sitronix,st7735r.yaml         |   78 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |  152 ++
 .../bindings/display/ti/ti,j721e-dss.yaml          |  208 ++
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  106 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/gpu/todo.rst                         |   22 +
 MAINTAINERS                                        |   28 +-
 drivers/dma-buf/Kconfig                            |    2 +-
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   15 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    6 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    5 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    5 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |    5 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   13 +-
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |   16 -
 drivers/gpu/drm/ast/ast_main.c                     |   24 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    2 -
 drivers/gpu/drm/bochs/bochs_drv.c                  |    6 +-
 drivers/gpu/drm/bochs/bochs_hw.c                   |   24 +-
 drivers/gpu/drm/bochs/bochs_kms.c                  |   34 +-
 drivers/gpu/drm/bridge/Kconfig                     |   22 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/adv7511/Kconfig             |   13 +-
 drivers/gpu/drm/bridge/adv7511/Makefile            |    3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   40 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   20 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   44 +-
 drivers/gpu/drm/bridge/panel.c                     |    2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  348 +++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    3 +-
 drivers/gpu/drm/bridge/tc358768.c                  | 1044 ++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  267 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   13 +
 drivers/gpu/drm/cirrus/cirrus.c                    |   51 +-
 drivers/gpu/drm/drm_atomic.c                       |  117 +
 drivers/gpu/drm/drm_atomic_helper.c                |   83 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  102 +
 drivers/gpu/drm/drm_auth.c                         |    8 -
 drivers/gpu/drm/drm_bridge.c                       |  437 ++-
 drivers/gpu/drm/drm_bufs.c                         |   20 +-
 drivers/gpu/drm/drm_client_modeset.c               |   12 +-
 drivers/gpu/drm/drm_connector.c                    |   81 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |    4 -
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_debugfs.c                      |    3 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    2 +-
 drivers/gpu/drm/drm_dma.c                          |   21 +-
 drivers/gpu/drm/drm_dp_helper.c                    |   62 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   41 +-
 drivers/gpu/drm/drm_drv.c                          |   20 +-
 drivers/gpu/drm/drm_edid.c                         |  153 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   16 +-
 drivers/gpu/drm/drm_file.c                         |   90 +-
 drivers/gpu/drm/drm_format_helper.c                |    2 +-
 drivers/gpu/drm/drm_framebuffer.c                  |  122 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   61 +
 drivers/gpu/drm/drm_internal.h                     |    1 +
 drivers/gpu/drm/drm_ioctl.c                        |    1 +
 drivers/gpu/drm/drm_irq.c                          |    4 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |   39 +-
 drivers/gpu/drm/drm_pci.c                          |   36 +-
 drivers/gpu/drm/drm_syncobj.c                      |   87 +-
 drivers/gpu/drm/drm_vblank.c                       |  174 +-
 drivers/gpu/drm/drm_vm.c                           |   10 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |    3 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    4 -
 drivers/gpu/drm/gma500/psb_drv.h                   |    6 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |    3 +
 drivers/gpu/drm/gma500/psb_irq.c                   |   12 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |    7 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   56 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h   |   11 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |    1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |    5 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    7 +
 drivers/gpu/drm/i915/display/intel_display_types.h |    2 -
 drivers/gpu/drm/i915/display/intel_dp.c            |   11 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    5 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   20 +-
 drivers/gpu/drm/i915/i915_irq.h                    |    6 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |    2 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    2 +-
 drivers/gpu/drm/imx/parallel-display.c             |  176 +-
 drivers/gpu/drm/lima/lima_drv.c                    |   16 +-
 drivers/gpu/drm/lima/lima_drv.h                    |    1 +
 drivers/gpu/drm/lima/lima_gem.c                    |  134 +-
 drivers/gpu/drm/lima/lima_gem.h                    |    4 +
 drivers/gpu/drm/lima/lima_gp.c                     |   63 +-
 drivers/gpu/drm/lima/lima_mmu.c                    |    5 +
 drivers/gpu/drm/lima/lima_mmu.h                    |    1 +
 drivers/gpu/drm/lima/lima_regs.h                   |    1 +
 drivers/gpu/drm/lima/lima_sched.c                  |   33 +-
 drivers/gpu/drm/lima/lima_sched.h                  |    6 +
 drivers/gpu/drm/lima/lima_vm.c                     |   46 +-
 drivers/gpu/drm/lima/lima_vm.h                     |    1 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |    9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |    2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   82 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   95 -
 drivers/gpu/drm/msm/msm_drv.c                      |   10 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    3 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    4 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    5 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    8 -
 drivers/gpu/drm/nouveau/nouveau_display.c          |   28 +-
 drivers/gpu/drm/nouveau/nouveau_display.h          |   11 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    5 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    2 +-
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |    4 +-
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c    |    4 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |    2 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    4 +-
 drivers/gpu/drm/panel/Kconfig                      |   24 +
 drivers/gpu/drm/panel/Makefile                     |    3 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  854 ++++++
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |  526 ++++
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  293 +++
 drivers/gpu/drm/panel/panel-simple.c               |  165 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |   17 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    7 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    6 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |   73 +
 drivers/gpu/drm/qxl/qxl_cmd.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   14 -
 drivers/gpu/drm/qxl/qxl_drv.c                      |   26 +-
 drivers/gpu/drm/qxl/qxl_kms.c                      |    8 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    6 -
 drivers/gpu/drm/radeon/atombios_crtc.c             |    1 +
 drivers/gpu/drm/radeon/radeon_device.c             |    2 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   25 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   18 -
 drivers/gpu/drm/radeon/radeon_kms.c                |   29 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |    3 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |    6 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |    6 -
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |    2 +-
 drivers/gpu/drm/sti/sti_crtc.c                     |   11 +-
 drivers/gpu/drm/sti/sti_crtc.h                     |    2 -
 drivers/gpu/drm/sti/sti_drv.c                      |    4 -
 drivers/gpu/drm/stm/drv.c                          |    2 -
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    4 +-
 drivers/gpu/drm/stm/ltdc.c                         |  101 +-
 drivers/gpu/drm/stm/ltdc.h                         |    6 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  103 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.h                 |   14 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  129 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h             |    2 +-
 drivers/gpu/drm/tidss/Kconfig                      |   14 +
 drivers/gpu/drm/tidss/Makefile                     |   12 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  377 +++
 drivers/gpu/drm/tidss/tidss_crtc.h                 |   46 +
 drivers/gpu/drm/tidss/tidss_dispc.c                | 2768 ++++++++++++++++=
++++
 drivers/gpu/drm/tidss/tidss_dispc.h                |  132 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |  243 ++
 drivers/gpu/drm/tidss/tidss_drv.c                  |  285 ++
 drivers/gpu/drm/tidss/tidss_drv.h                  |   39 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |   88 +
 drivers/gpu/drm/tidss/tidss_encoder.h              |   17 +
 drivers/gpu/drm/tidss/tidss_irq.c                  |  146 ++
 drivers/gpu/drm/tidss/tidss_irq.h                  |   77 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |  249 ++
 drivers/gpu/drm/tidss/tidss_kms.h                  |   15 +
 drivers/gpu/drm/tidss/tidss_plane.c                |  217 ++
 drivers/gpu/drm/tidss/tidss_plane.h                |   25 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.c          |  202 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h          |   22 +
 drivers/gpu/drm/tiny/Kconfig                       |   22 +-
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/gm12u320.c                    |    9 -
 drivers/gpu/drm/tiny/ili9225.c                     |    9 -
 drivers/gpu/drm/tiny/ili9486.c                     |  286 ++
 drivers/gpu/drm/tiny/repaper.c                     |   21 +-
 drivers/gpu/drm/tiny/st7586.c                      |    9 -
 drivers/gpu/drm/tiny/st7735r.c                     |   76 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  256 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    3 +-
 drivers/gpu/drm/udl/udl_connector.c                |    1 -
 drivers/gpu/drm/udl/udl_modeset.c                  |   11 -
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   13 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   13 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    3 -
 drivers/gpu/drm/vc4/vc4_drv.h                      |    4 -
 drivers/gpu/drm/vc4/vc4_plane.c                    |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   12 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    6 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   20 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |    2 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   24 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   15 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   90 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    7 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  367 ++-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    9 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    1 -
 drivers/gpu/drm/vkms/vkms_drv.h                    |    4 -
 drivers/gpu/drm/vkms/vkms_plane.c                  |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    6 -
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   19 +
 drivers/gpu/drm/zte/zx_plane.c                     |    4 +-
 drivers/video/backlight/Kconfig                    |    8 +-
 drivers/video/console/Kconfig                      |   76 +-
 drivers/video/fbdev/cg14.c                         |    3 +-
 drivers/video/fbdev/core/Makefile                  |    1 -
 drivers/video/fbdev/core/fbcon.c                   |   27 +-
 drivers/video/fbdev/core/fbmem.c                   |   38 +-
 drivers/video/fbdev/hyperv_fb.c                    |    4 +-
 drivers/video/fbdev/nvidia/nvidia.c                |   37 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    4 -
 drivers/video/fbdev/pxa168fb.c                     |    2 +-
 drivers/video/fbdev/s1d13xxxfb.c                   |   16 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +-
 drivers/video/fbdev/ssd1307fb.c                    |    2 +
 include/drm/drm_atomic.h                           |   76 +
 include/drm/drm_atomic_helper.h                    |    8 +
 include/drm/drm_atomic_state_helper.h              |   13 +
 include/drm/drm_bridge.h                           |  180 +-
 include/drm/drm_client.h                           |    7 +-
 include/drm/drm_connector.h                        |   15 +-
 include/drm/drm_crtc.h                             |   80 +-
 include/drm/drm_device.h                           |    2 +-
 include/drm/drm_dp_helper.h                        |    5 +
 include/drm/drm_dp_mst_helper.h                    |    6 +-
 include/drm/drm_drv.h                              |  194 +-
 include/drm/drm_file.h                             |    1 +
 include/drm/drm_gem_vram_helper.h                  |    9 +
 include/drm/drm_legacy.h                           |    6 -
 include/drm/drm_mipi_dbi.h                         |   12 +
 include/drm/drm_modes.h                            |   11 +-
 include/drm/drm_modeset_helper_vtables.h           |   63 +-
 include/drm/drm_panel.h                            |    3 +-
 include/drm/drm_print.h                            |   80 +-
 include/drm/drm_simple_kms_helper.h                |    7 +-
 include/drm/drm_vblank.h                           |   36 +-
 include/drm/ttm/ttm_bo_api.h                       |   11 +-
 include/drm/ttm/ttm_bo_driver.h                    |   15 -
 include/uapi/drm/drm.h                             |    2 +
 include/uapi/drm/lima_drm.h                        |    9 +-
 include/video/samsung_fimd.h                       |    2 +-
 363 files changed, 14249 insertions(+), 3085 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshib=
a,tc358768.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili948=
6.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b08=
0uan01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1aw03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1ean01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1xtn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b11=
6xw03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b13=
3htn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b13=
3xtn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g07=
0vvn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g10=
1evn010.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g10=
4sn02.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g13=
3han01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g18=
5han01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,p32=
0hvn03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,t21=
5hvn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/avic,tm=
070ddh03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,hv0=
70wsa-100.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,nv1=
01wxmn51.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv0=
80wum-nl0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv1=
01wum-nl6.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,=
s043wq26h-ct7.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,=
s070wv95-ct16.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa070wp03xg.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa101wa01a.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa101wb03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dataima=
ge,scf0700c48ggu18.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc=
1010gig.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,et-=
series.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/evervis=
ion,vgg804821.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,=
k101-im2ba02.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/foxlink=
,fl500wvr00-a0t.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendl=
yarm,hd702e.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/giantpl=
us,gpg482739qs5.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannsta=
r,hsd070pww1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannsta=
r,hsd100pxn1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx2=
3d38vm0caa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,at043tn24.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,at070tn92.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g070y2-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g101ice-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g121i1-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g121x1-l03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,n116bge.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,n156bge-l21.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,zj070na-01p.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx1=
4d24vm1bpa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx3=
1d200vm0baa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg=
121xglp.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lemaker=
,bl035-rgb-002.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lb07=
0wv8.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp07=
9qx1-sp0v.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp09=
7qx1-spa1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp12=
0up1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp12=
9qe.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa070mc01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl1=
2880b20-05.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl4=
827hc19-05b.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/netron-=
dy,e231732.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/newhave=
n,nhd-4.3-480272ef-atxl.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl1=
92108ac18-02d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nvd,912=
8.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/okaya,r=
s800480t-7x0gp.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,=
lcd-olinuxino-43-ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ontat,y=
x700wv03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisete=
ch,otm8009a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/orisete=
ch,otm8009a.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m05dtc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m99dtc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com43h4m85ulc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisp=
lays,osd070t1718-19ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisp=
lays,osd101t2045-53ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panason=
ic,vvx10f004b00.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panason=
ic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-s=
imple-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/qiaodia=
n,qd43003c0-40.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium=
,rm68200.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium=
,rm68200.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktec=
h,rk070er9427.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,lsn122dl01-c01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,ltn101nt05.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,ltn140at29-301.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,s6e88a0-ams452ef01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q035q7db03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q070y3dg3b.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q101k1ly04.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q123p1jx31.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/shelly,=
sca07010-bfn-lnn.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/starry,=
kr122ea0sra.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,=
tm070jdhg30.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,=
tm070rvhg71.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/toshiba=
,lt089ac29000.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07=
a-0102.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10=
a-0102.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/urt,ums=
h-8596md.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/vl050_8=
048nt_c01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/winstar=
,wf35ltiacd.txt
 delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st77=
35r.txt
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st77=
35r.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-d=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-d=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss=
=2Eyaml
 create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
 create mode 100644 drivers/gpu/drm/bridge/tc358768.c
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
 create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
 create mode 100644 drivers/gpu/drm/tidss/Kconfig
 create mode 100644 drivers/gpu/drm/tidss/Makefile
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

--7samnu77bx2lwacq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk+sWAAKCRDj7w1vZxhR
xU8jAQC/7TybT9dZriT6uKaV/nrtYJP+aUcYAJ1j8L3Shg5ZdgEAv28xR6Uk4oIS
pcbMPus2ivpwXJNhSZL4ZfUUTfXnOQY=
=+Jfd
-----END PGP SIGNATURE-----

--7samnu77bx2lwacq--

--===============0697325450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0697325450==--
