Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B173E1A44A5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E103F6ECB7;
	Fri, 10 Apr 2020 09:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855856EA52;
 Thu,  9 Apr 2020 09:14:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5047364D;
 Thu,  9 Apr 2020 05:14:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 09 Apr 2020 05:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=C1p+Rld4hVWf8r9Z7DAfkkp5lK5V59qTzXoUs0XWoak=; b=VpSF2GLf
 Qr9MAro9JrGkH2MD2gRUHsFs9XW5QZEeDP+iUyQYPBxsOQmRGj8zVjFB4iePv/mx
 ivWNxdHH5ESWtWn0qiyy8OIfYf1NvBfLwFUrvSO59ay7FIKh1n680YJAoJlvEqrk
 N9BcJM4B0/9WpoLSulpAEZl1uHEx1yWanJsZOI0I32Wp6Hy0y5v7+0IWEejCSB/e
 THw8G3tJgTNgpehdFO4KFuGrWCWTA1tbeLg3nGcHceKRkjU9t+mqKZVPFKnbWtx+
 9zdMxDurCRSh2BNdTXsVEwef7i4IAIidXeJMLz5zLjR38+2+pX0qFPIaEUbCkrNN
 HLD+PLlTSdmkAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=C1p+Rld4hVWf8r9Z7DAfkkp5lK5V5
 9qTzXoUs0XWoak=; b=LwJMYc2rVvaYeWJnH/3YGN+PcPZGk0UO0wAnRYE5rVaCB
 VXI62xY7Aj7j3aslnXcYXNxOb/eztM+m+tkxczN7puS2nRUwFI9iqzyvke5CosvU
 G/iadbofKb6lMGcFStZDiSHInpK/uYfYM00tpOeumhkHQrANxXB6CtABbGeh0xDE
 eJvEtqX7OmSsL/FQrj9CA6HDhSJy7M8QCAdeiFia1UU18OBhJhyOuH8C1ddSAOK2
 MHaW7vojaah+sdkJJuDzDGoC/T7WxhyiwZTmOPd3ReZ3H9LCGdI+SH/1AWbPB/CO
 wKKQSse3unhshSg2ijzGwuTzCHh7eV4lpC3jd+nyA==
X-ME-Sender: <xms:cueOXlaqdGClNi7YoCZk-bbCHR1zYdKb79Gz3KnFNwBfe4f0J0rhAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudelgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cueOXoQZAVr3SdSEdqcBzeDo3RWIG1SWcL9PLANJ4T594OJQBXKmJA>
 <xmx:cueOXjdcKFaSqxS9lbmigHy8rtnr9M3U81cE-RPa_7vV052FRN7Dlw>
 <xmx:cueOXnmXL_rUtFSnrXThiNlU18F6l-sya_dbgdTmEPP0acepj7gknQ>
 <xmx:c-eOXnGSii36XUWFs2YDxStoqKJt5SN_M3lEgkjzywUz-vder_oNcUVYd2U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16FB83280068;
 Thu,  9 Apr 2020 05:14:26 -0400 (EDT)
Date: Thu, 9 Apr 2020 11:14:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20200409091424.cfpqqbqjxtkgnfme@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Content-Type: multipart/mixed; boundary="===============1897431388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1897431388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jtqvxnv4eyglp7l3"
Content-Disposition: inline


--jtqvxnv4eyglp7l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week round of drm-misc-next-fixes

Maxime

drm-misc-next-fixes-2020-04-09:
A few DMA-related fixes, an OOB fix for virtio and a probe-related fix for
analogix_dp
The following changes since commit 0e7e6198af28c1573267aba1be33dd0b7fb35691:

  Merge branch 'ttm-transhuge' of git://people.freedesktop.org/~thomash/linux into drm-next (2020-04-03 09:07:49 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-04-09

for you to fetch changes up to 152cce0006abf7e17dfb7dc94896b044bda4e588:

  drm/bridge: analogix_dp: Split bind() into probe() and real bind() (2020-04-09 10:29:35 +0200)

----------------------------------------------------------------
A few DMA-related fixes, an OOB fix for virtio and a probe-related fix for
analogix_dp

----------------------------------------------------------------
Chris Wilson (1):
      drm/legacy: Fix type for drm_local_map.offset

Jiri Slaby (1):
      drm/virtio: fix OOB in virtio_gpu_object_create

Marek Szyprowski (2):
      drm/prime: fix extracting of the DMA addresses from a scatterlist
      drm/bridge: analogix_dp: Split bind() into probe() and real bind()

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next-fixes

 .../bindings/display/panel/panel-dpi.yaml          | 10 ------
 .../bindings/display/ti/ti,am65x-dss.yaml          |  4 +--
 .../bindings/display/ti/ti,j721e-dss.yaml          |  4 +--
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  4 +--
 drivers/dma-buf/Kconfig                            | 11 ++++---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 33 ++++++++++++-------
 drivers/gpu/drm/drm_mm.c                           |  8 +----
 drivers/gpu/drm/drm_prime.c                        | 37 +++++++++++++++-------
 drivers/gpu/drm/exynos/exynos_dp.c                 | 29 ++++++++++-------
 drivers/gpu/drm/panel/panel-simple.c               | 11 -------
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 36 +++++++++++----------
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |  4 +++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 20 +++++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c            | 14 ++++----
 drivers/gpu/drm/xen/xen_drm_front.c                |  2 +-
 drivers/video/fbdev/core/fbcon.c                   |  3 ++
 include/drm/bridge/analogix_dp.h                   |  5 +--
 include/drm/drm_legacy.h                           |  2 +-
 18 files changed, 132 insertions(+), 105 deletions(-)

--jtqvxnv4eyglp7l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXo7ncAAKCRDj7w1vZxhR
xSmvAP4hPJuGgNWWlDRmITVnhgOw/egUygtw13QV4cxMSWOEHAD+LjgnTlI7THIR
zJGp55uVJobrbxyPlPe7R3+bQeoRbAk=
=ZdZp
-----END PGP SIGNATURE-----

--jtqvxnv4eyglp7l3--

--===============1897431388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1897431388==--
