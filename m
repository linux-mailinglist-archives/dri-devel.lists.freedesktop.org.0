Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7D44BCBF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 09:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2546F625;
	Wed, 10 Nov 2021 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8776ECA9;
 Wed, 10 Nov 2021 08:21:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26208580797;
 Wed, 10 Nov 2021 03:21:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Nov 2021 03:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=hj9KCxvE42r1pLUquZIp+ESn960HP8RuvfOcjEE+dUI=; b=jZYcchiZ
 yL5Ydz+5W3O+5BqJ4HM757W8n9oQi6c2lpfK5l35i9LXIiKiCX1qF/4/TA30U0VO
 MdXlBYbnldssprdZZNoDMEko9aqqsuWhB+P3xyGpo/rZf9OLiOrr2kVSXlCh/Q8i
 srvX/uv+Z7YZ1ZLYVM2h/KC4qWIFiZktqeiGv0PkFPYgBdP4alWJn0oNDgJOpM1u
 Mx32enHLwgvTfPEfF7vC+QYx4x9/dStteuTRtg4wViQ3T6JD2Ou2i7UGRb8DIS1t
 6Es04Oc9b74LADpeB6bh82kp6Fzws0LitAkFwHL9FTrVf6SSgFs0WE8IgxWnltFP
 Gf/cKuRYpj7zKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=hj9KCxvE42r1pLUquZIp+ESn960HP
 8RuvfOcjEE+dUI=; b=PmkNT0nhLmFRxiY/wbMNRuFX7/9FMqbCe04ODmRy+V6PL
 sVTsRKuXwDrI7ZzB0ntuxlCVArkI56qJv952O8QiFz7xR0gp+1E894xeRDpjPh8N
 G2CAxy9zk92KGEUC7ZoLpXAafRxvEiy8C61gBvRmePThwkhc3vdYqjY1MpH7Jjpr
 jgSpMQ04DjbUTQMMRUsObMLvnGL+q6NmTaR4Dxn5d/642X7cfCjDcFzzjezBAYcJ
 tm1MyyYZwt914Wa/8OyERWCx7yCtf2iKbpGkjwlWz4WvY3vrDV7k2PA9tD9gUAGu
 RNvgTrQFW0R/HkSWdtZuCxOFSOAQwQvzuQHUXTeJQ==
X-ME-Sender: <xms:_ICLYdlDZ0sQnPKPfsZwrLjj4mfaGL_HtB4s_K-y1wlDitepR7zmbQ>
 <xme:_ICLYY317uPAlCU9d776Jk1bnyTgn6XW8kCEZ1T2mOvClm2A0P7xbtoL8wTX0hr7j
 jVUKxV1LupLOSfL_0Y>
X-ME-Received: <xmr:_ICLYTqTt1g2TmaywwFnoOvVsEJ248QEA-MtcXDoYa5cuPaeo8_Wm0Ki3XK_Jcdz31idaSaZfND6pQuWBGSTOny5rGJRIUiU6nPgBgd9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdeigfen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:_ICLYdk3y_448BE-gE7gV7tCJejlvlzwz0VmB80UpZOIeT3ko2NeCA>
 <xmx:_ICLYb2BA_dFDOXLDG7m_9fjkGxMMVD6FYTpvvraFbQqKo4xGBDTfw>
 <xmx:_ICLYcunMFRlLkng3sE6hRGKhTKs1h29uGHjbqfhsSkxuZ4w_1mQ6Q>
 <xmx:_YCLYdwAchOUbTX_GD7_DnIJiBBHhJwmAbWQeOl9wPO7B2WP2PvFdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Nov 2021 03:21:16 -0500 (EST)
Date: Wed, 10 Nov 2021 09:21:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20211110082114.vfpkpnecwdfg27lk@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="va4lzbch4txyrqsh"
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--va4lzbch4txyrqsh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week PR for drm-misc-next-fixes.

Maxime

drm-misc-next-fixes-2021-11-10:
Removed the TTM Huge Page functionnality to address a crash, a timeout
fix for udl, CONFIG_FB dependency improvements, a fix for a circular
locking depency in imx, a NULL pointer dereference fix for virtio, and a
naming collision fix for drm/locking.
The following changes since commit ff2d23843f7fb4f13055be5a4a9a20ddd04e6e9c:

  dma-buf/poll: Get a file reference for outstanding fence callbacks (2021-11-04 09:18:57 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-11-10

for you to fetch changes up to bcae3af286f49bf4f6cda03f165fbe530f4a6bed:

  drm/locking: fix __stack_depot_* name conflict (2021-11-09 13:08:13 +0200)

----------------------------------------------------------------
Removed the TTM Huge Page functionnality to address a crash, a timeout
fix for udl, CONFIG_FB dependency improvements, a fix for a circular
locking depency in imx, a NULL pointer dereference fix for virtio, and a
naming collision fix for drm/locking.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm: fb_helper: improve CONFIG_FB dependency

Daniel Vetter (1):
      MAINTAINERS: dri-devel is for all of drivers/gpu

Fabio Estevam (1):
      Revert "drm/imx: Annotate dma-fence critical section in commit path"

Jason Gunthorpe (1):
      drm/ttm: remove ttm_bo_vm_insert_huge()

Johan Hovold (1):
      drm/udl: fix control-message timeout

Stephen Rothwell (1):
      drm/locking: fix __stack_depot_* name conflict

Vivek Kasireddy (1):
      drm/virtio: Fix NULL dereference error in virtio_gpu_poll

 MAINTAINERS                                |  3 +-
 drivers/gpu/drm/Kconfig                    |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
 drivers/gpu/drm/drm_modeset_lock.c         | 14 ++---
 drivers/gpu/drm/imx/imx-drm-core.c         |  2 -
 drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 94 +-----------------------------
 drivers/gpu/drm/udl/udl_connector.c        |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c       |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 --
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 72 +----------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  3 -
 include/drm/ttm/ttm_bo_api.h               |  3 +-
 14 files changed, 20 insertions(+), 191 deletions(-)

--va4lzbch4txyrqsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYuA+gAKCRDj7w1vZxhR
xSNVAP9FDXOQSlbu1X7QIzPBN2ENOEKApQoeia+u0ubdp59dmwD9EJg9NJY/S0UI
cYEz/IKxoQ1QqFYlQABfxRFizDuaxAI=
=8JcO
-----END PGP SIGNATURE-----

--va4lzbch4txyrqsh--
