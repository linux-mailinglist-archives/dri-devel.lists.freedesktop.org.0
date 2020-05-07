Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD71CA671
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E7E6EAA4;
	Fri,  8 May 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEE889C03;
 Thu,  7 May 2020 16:01:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 50F61646;
 Thu,  7 May 2020 12:01:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 07 May 2020 12:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=QazTyFkSQXybJPYQ9GQxKjJWf0nEOB13Mn+6NH1nk/0=; b=caR77rM9
 y0XWGg6LetvYbyD76uUkMPpmnAzWKmNN1gvldWXgBlPx1OrtuWXwLR20WKY4ZOv/
 JvylX1Rv6NEeyUsT2cAuHVMS1eUSBKM3UMqjKbe9muFE9DII6MfUr6b2bmj6alv2
 A15SxICVRthPSIP+dLN5RSb+nBqfWMHMXCx+A4tXwgYEbmRaqXhDrc4X95gYqmlM
 SfHPAyjBGcCjr9uSNalCFSRDPJBs4eCNwox74seZB0fqN8NFwKWre197FOapos/S
 /4Lo8tTIdB/kdLLjsB6+adwTshK9FTrNd7+Z5HbslevZwrYV/gNLrtw4c2K0aciP
 rvh0mhPGadouQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=QazTyFkSQXybJPYQ9GQxKjJWf0nEO
 B13Mn+6NH1nk/0=; b=UTljZDyp9F4HoykYCrBoKQ1zYjl/5/e84eUNL/rrZhwTJ
 YF+2uqoQxmYb2mMtlJAenoJ7t52XsBRS9Uo2+WypUoywEExkbD7vzsX2finODa+F
 AmfHuGCvkJ0hekuYE1F7NXGnk8rVWasKAWvqV++FxCdin7Px4UvP886Pw1gAJwXO
 lTZmC/98dpq3J9FxMwOUs5gQxXk9jTH08FgkXWLiBwU9s/zCg2A6VyuCvDemQ04Y
 jnhLBTl9dJYyUVx5PlrfcHyMA2cYdl+/lNkxOA3PmVaEwneHQkEhhjrdg/luNC/6
 wkLjwsifGVqf/Pt/UGItBgPbtQDi0HPRz+sukcUZw==
X-ME-Sender: <xms:3DC0XqEKFUCTVMy6JjopuBfwZYa53FHTMPigF8CYsXfw4kj74-I4Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedtgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdeigfen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrie
 ekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3DC0XiTLhuo25pFgKoFk9D77ai7FZhL_6PhRQRq9qCVLpoB7SATGAA>
 <xmx:3DC0Xvs7f6ilXOBTBpWvfWA8-kBurHJSvRPyXGlZScVT3zpkKS1lKQ>
 <xmx:3DC0XmJTzsDYDJGlF-r-zqjdPAGwM6SqibzlTWO2XVphslV2SmDA9Q>
 <xmx:3TC0XmhVLhFLHgH5CGLq0URBlY45b2vEJHvslhLnZhr8ZM5XYjJKZCFaLKw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F06203280075;
 Thu,  7 May 2020 12:01:31 -0400 (EDT)
Date: Thu, 7 May 2020 18:01:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200507160130.id64niqgf5wsha4u@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Content-Type: multipart/mixed; boundary="===============1545337170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1545337170==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t6hvcwk6omuzk36w"
Content-Disposition: inline


--t6hvcwk6omuzk36w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Here is this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2020-05-07:
A few minor fixes for an ordering issue in virtio, an (old) gcc warning
in sun4i, a probe issue in ingenic-drm and a regression in the HDCP
support.
The following changes since commit 6f49c2515e2258f08f2b905c9772dbf729610415:

  dma-buf: fix documentation build warnings (2020-04-30 19:47:39 +0530)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-05-07

for you to fetch changes up to 5fe89a6acd668cbd1817fcdef5caa9fee568c2e8:

  drm: Fix HDCP failures when SRM fw is missing (2020-05-05 14:01:53 -0400)

----------------------------------------------------------------
A few minor fixes for an ordering issue in virtio, an (old) gcc warning
in sun4i, a probe issue in ingenic-drm and a regression in the HDCP
support.

----------------------------------------------------------------
Arnd Bergmann (1):
      sun6i: dsi: fix gcc-4.8

Gurchetan Singh (1):
      drm/virtio: create context before RESOURCE_CREATE_2D in 3D mode

H. Nikolaus Schaller (1):
      drm: ingenic-drm: add MODULE_DEVICE_TABLE

Sean Paul (1):
      drm: Fix HDCP failures when SRM fw is missing

 drivers/gpu/drm/drm_hdcp.c             | 8 +++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.c  | 1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 3 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +--
 6 files changed, 14 insertions(+), 4 deletions(-)

--t6hvcwk6omuzk36w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrQw2gAKCRDj7w1vZxhR
xe0uAP47aZY1t/VxJNBKraDNUVoXvWz6VHpABOwFsOgP6lua7wD9EBM+cpRHZ/4/
U9bZ7gWCJv0gz5sOzUd9R7jVsC2hIAc=
=FYaG
-----END PGP SIGNATURE-----

--t6hvcwk6omuzk36w--

--===============1545337170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1545337170==--
