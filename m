Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72019E507
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FE6E20D;
	Sat,  4 Apr 2020 12:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B216E05C;
 Sat,  4 Apr 2020 09:01:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F2B3F5DB;
 Sat,  4 Apr 2020 05:01:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 04 Apr 2020 05:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=9UvRQ8rOdR9Pc3CY7UmQz2lpIzP1pzvR6YSrH0Inw1A=; b=X0uyY+UE
 GM7kT6O0bXHPgftiJlC6DEo/vHHM9GvMopGJKV99G42fD9XHa72jFOTZtvGwcTcp
 HQGuc/fZQ7xom268dRwEdmSebehH8UW2m0fhWg3+XAR2sHpQlSnlmmt7rWqjyehx
 0/P7xI3iGAjSB7Qw8mx+s5RsetfVPta3ZYxlsdonEJXzR7SuoR2s1C2rwpgbcGDj
 ynn1eWS2Gwa+KtmwDUBpbrm4wb76BLofVwx09v6xauY1N57bJfUPbpdTB5cizLOf
 uNDW1JAHXgDzYobE6ivwr3zhXhrkrMqZ5MQ0Lq43sVqDXNFtZQ3rPheoLeKjsC7g
 4gxH/7x2vDGKSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=9UvRQ8rOdR9Pc3CY7UmQz2lpIzP1p
 zvR6YSrH0Inw1A=; b=2yZcv3loyAFjfX+bS5LP7CpXiv9uHmgm57vRTw47W+RUi
 BnM0f3c8eOixmr8ZFAy91zDgwDMrqhRhspYIU74ReobPheuMzO7g53XETJVmSFx7
 +BAzhflU2tg40uTRuT3gE6c8ybeZA75eThgmX2MCLUARdgiJmzyCJzv3xdjKlTTn
 HSXk7m5nA9uyM4AguHwUVnvgSxAlGy8JwPFByyqdUQr47ZVqgSFn+XvuW1EWhGmJ
 S6mvoGGcDAz/08nHXKt+tq22ugL9g4P1fDfIhI9q8l+9S5gPFVx+/yr3OnfyGpta
 MASwn3s7ZRsMT+ElKeQ4l7vdPL6w1C/ipiGGtuiDA==
X-ME-Sender: <xms:y0yIXs8C61jr_iGN_fbc1ZgD6OwURHKNQPH-HX2Vv28dxq1Tp4yRGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdekgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:y0yIXszR9IiW36dzws78d3QAGxSB0NKlIUU8nRlGot4rSx2BGIO-oQ>
 <xmx:y0yIXnJRKdrVH0vXKOF0VYpSwXAR3xPrAPGE63JvGpBlJJhCwupL4g>
 <xmx:y0yIXoCrAp0b70F3S-vPh-6tPjWyThdpn8Rc_g9Z3tLSsecpHUwSIw>
 <xmx:zkyIXtiu3Xhs2-5NAjCibjtxe_Ww-8K6HPnZQ95zBU6hR9iQVOdqQMy8z9E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 838E0328005A;
 Sat,  4 Apr 2020 05:00:59 -0400 (EDT)
Date: Sat, 4 Apr 2020 11:00:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20200404090057.a3m7uw6tavwtcyon@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Content-Type: multipart/mixed; boundary="===============1323156926=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1323156926==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qzt3vtz5r5vaonvw"
Content-Disposition: inline


--qzt3vtz5r5vaonvw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week round of drm-misc-next fixes.

Thanks!
Maxime

drm-misc-next-fixes-2020-04-04:
A bunch of fixes to avoid null pointer dereference in fbcon, fix a return
in xen, some DT bindings fixes, a vc4 issue with 1920x1200 mode validation,
and a conflicting framebuffer in vboxvideo.
The following changes since commit 6afe6929964bca6847986d0507a555a041f07753:

  drm: Mark up racy check of drm_gem_object.handle_count (2020-03-16 10:31:=
35 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-=
04-04

for you to fetch changes up to d8a26d8fc37c5b8b9e95f2fa194f287cf8cab3f4:

  drm/mm: revert "Break long searches in fragmented address spaces" (2020-0=
3-31 17:35:56 +0200)

----------------------------------------------------------------
A bunch of fixes to avoid null pointer dereference in fbcon, fix a return
in xen, some DT bindings fixes, a vc4 issue with 1920x1200 mode validation,
and a conflicting framebuffer in vboxvideo.

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/mm: revert "Break long searches in fragmented address spaces"

Ding Xiang (1):
      drm/xen: fix passing zero to 'PTR_ERR' warning

Geert Uytterhoeven (1):
      dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text

Hans de Goede (1):
      drm/vboxvideo: Add missing remove_conflicting_pci_framebuffers call, =
v2

Mauro Carvalho Chehab (1):
      docs: dt: display/ti: fix typos at the devicetree/ directory name

Nicolas Saenz Julienne (1):
      drm/vc4: Fix HDMI mode validation

Qiujun Huang (1):
      fbcon: fix null-ptr-deref in fbcon_switch

Rob Herring (1):
      dt-bindings: display: ti: Fix dtc unit-address warnings in examples

Sam Ravnborg (2):
      dt-bindings: display: drop data-mapping from panel-dpi
      drm/panel-simple: drop use of data-mapping property

 .../devicetree/bindings/display/panel/panel-dpi.yaml | 10 ----------
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml |  4 ++--
 .../devicetree/bindings/display/ti/ti,j721e-dss.yaml |  4 ++--
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml   |  4 ++--
 drivers/dma-buf/Kconfig                              | 11 ++++++-----
 drivers/gpu/drm/drm_mm.c                             |  8 +-------
 drivers/gpu/drm/panel/panel-simple.c                 | 11 -----------
 drivers/gpu/drm/vboxvideo/vbox_drv.c                 |  4 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                       | 20 ++++++++++++++++=
----
 drivers/gpu/drm/xen/xen_drm_front.c                  |  2 +-
 drivers/video/fbdev/core/fbcon.c                     |  3 +++
 11 files changed, 37 insertions(+), 44 deletions(-)

--qzt3vtz5r5vaonvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXohMyQAKCRDj7w1vZxhR
xUt0AP48SudBLEuyf9QSl31ZoMZ8OQeXJW2lkUEttYqPoOrvuAEApPt4FwfuGkCL
+4YRXacemMwIVua7/k9i+fKnQeXZeAs=
=afiS
-----END PGP SIGNATURE-----

--qzt3vtz5r5vaonvw--

--===============1323156926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1323156926==--
