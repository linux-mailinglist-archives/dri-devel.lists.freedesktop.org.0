Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E933B368E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 21:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBAE6ECC4;
	Thu, 24 Jun 2021 19:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48B6ECBE;
 Thu, 24 Jun 2021 19:04:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 3A2582B01335;
 Thu, 24 Jun 2021 15:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 24 Jun 2021 15:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=OBuP9sreWlOXlTpL1WeRNqdk6MdVC3ddt4Wtt2u4XOs=; b=MgyTvR1i
 EkZFyTlM6k+d2RezqdTgTb3KzjLreveMRHVmV+rZ3tU+s789lyhl2pxHCmq3gGIe
 4aQH1Y8OvKZ606pAmK86BlQtpY+45HuOwEjEQw+phRJSbhiL+huM/5TD3Zerp1vo
 fHYwa+PF8QqzHher6AanB1ujyc3rr1oeoZ27ltrIdrDiLbSWaj0pXyNDEmfp/7Qk
 mvxBUKOLfqaevTLTR1qx8LfgP8IlUkN1QYb17hR7paOw2h0nEODLVGNz0eTIZPiA
 3GQFK09rZ8fFmTTv4t5rASqi/KTt2LsKZ1rdnntiSleinn9C2G+sQaki4QbtyhSZ
 rjAA4gM0S4A8hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=OBuP9sreWlOXlTpL1WeRNqdk6MdVC
 3ddt4Wtt2u4XOs=; b=isa5zAkD93qgQ3SrLIVytmI9puiDCJpy4+mLREbe8iNcn
 rB+fH3Mj6QiBlF5q/fxUUi5xIUyptdRelUelP/kTMTizbqhaEK5aMLyVm1Y96fFP
 JcEzALzScqi1DHpdH2+9ccYP/1QFU0bcERFMCZoACfxoBu2MlM2XB5NVOGRK3NgG
 AspUqdDgxnsfeOVH2Jg+C9oyKSzEWBYighna10Q/KHIwQxBNIJk0073BDfHHQOjy
 1G4MMPnAwMUrRT93hLLf3GCBuySpzE3shzJXeccIUaA0294pOAtcfl5VpTtv5VbI
 2R4dFq9Y3dcvo9YFd7SCHTibhGoIEBvEex7Ndxzdw==
X-ME-Sender: <xms:HNfUYJwW6NKjA-iP6PrKU9dZjNjJQ6KsOxYubztzXXbg9Wr5WmCNKQ>
 <xme:HNfUYJTk57igKyrGVFbNDphOd8V5szbKUGRdkGuCi7pf9Mq0rWFmynPnaMDIMHqFf
 Kj-7hHJAQiaJVX1AFQ>
X-ME-Received: <xmr:HNfUYDWj6Rn04P0leWYbgt4SP1NHg1R21JHjFplA4VgdDe_2Zhku7C2XHrs2fSkM3QfRiN7PRBVYYTVSf2PIjEGeJJ5MLVy2w36S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeghedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:HNfUYLiH26AtXEETORCI2DRm_9pHmNCzT7GMFMvVTgUIg9bVNelCcQ>
 <xmx:HNfUYLDdS6NJsr1BFY0oUwFaDgK261jNzLRd_tOV17jxhXEH3_oaSg>
 <xmx:HNfUYEIgoC_XZkPyclvFeLLehFne46ct1JdZoAWx0taodlR2pTc0zQ>
 <xmx:HdfUYHsGQit7lDhkOY-9nMEBFfNOeoru87e8pFB1Q58tixzw_lOy1KqAB2M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Jun 2021 15:03:55 -0400 (EDT)
Date: Thu, 24 Jun 2021 21:03:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210624190353.wyizoil3wqrrxz5d@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a5kdybf52icymnkd"
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


--a5kdybf52icymnkd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Thanks!
Maxime

drm-misc-fixes-2021-06-24:
A DMA address check for nouveau, an error code return fix for kmb, fixes
to wait for a moving fence after pinning the BO for amdgpu, nouveau and
radeon, a crtc and async page flip fix for atmel-hlcdc and a cpu hang
fix for vc4.
The following changes since commit c336a5ee984708db4826ef9e47d184e638e29717:

  drm: Lock pointer access in drm_master_release() (2021-06-10 12:22:02 +02=
00)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-06-24

for you to fetch changes up to d330099115597bbc238d6758a4930e72b49ea9ba:

  drm/nouveau: fix dma_address check for CPU/GPU sync (2021-06-24 15:40:44 =
+0200)

----------------------------------------------------------------
A DMA address check for nouveau, an error code return fix for kmb, fixes
to wait for a moving fence after pinning the BO for amdgpu, nouveau and
radeon, a crtc and async page flip fix for atmel-hlcdc and a cpu hang
fix for vc4.

----------------------------------------------------------------
Christian K=F6nig (4):
      drm/nouveau: wait for moving fence after pinning v2
      drm/radeon: wait for moving fence after pinning
      drm/amdgpu: wait for moving fence after pinning
      drm/nouveau: fix dma_address check for CPU/GPU sync

Dan Sneddon (2):
      drm: atmel_hlcdc: Enable the crtc vblank prior to crtc usage.
      drm/atmel-hlcdc: Allow async page flips

Daniel Vetter (1):
      Revert "drm: add a locked version of drm_is_current_master"

Desmond Cheong Zhi Xi (1):
      drm: add a locked version of drm_is_current_master

Krzysztof Kozlowski (1):
      drm/panel: ld9040: reference spi_device_id table

Maxime Ripard (2):
      drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
      drm/vc4: hdmi: Make sure the controller is powered in detect

Zhen Lei (1):
      drm/kmb: Fix error return code in kmb_hw_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c    | 14 +++++++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 17 ++++++----
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c   |  1 +
 drivers/gpu/drm/kmb/kmb_drv.c                  |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c           |  4 +--
 drivers/gpu/drm/nouveau/nouveau_prime.c        | 17 +++++++++-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c   |  1 +
 drivers/gpu/drm/radeon/radeon_prime.c          | 14 ++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                 | 44 ++++++++++++++++++++--=
----
 9 files changed, 90 insertions(+), 23 deletions(-)

--a5kdybf52icymnkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNTXGQAKCRDj7w1vZxhR
xWskAQDRWFG66LvbYsXfeDhuXC2Wk/iPOHb6yyhddnvmXIUnKAD+KL8cvaIqR+cY
YvLTgU0vWOlNcj/qGUyiukz21joYDgU=
=TVQo
-----END PGP SIGNATURE-----

--a5kdybf52icymnkd--
