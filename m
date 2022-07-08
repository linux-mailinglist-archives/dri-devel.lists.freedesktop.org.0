Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4456B25A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 07:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CCA10E9DA;
	Fri,  8 Jul 2022 05:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7695910E818;
 Fri,  8 Jul 2022 05:43:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 586B55C0100;
 Fri,  8 Jul 2022 01:43:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 01:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1657258990; x=1657345390; bh=SaWTP/ipYOsNzkBPsdvH+wrCaeRLBav4Q0a
 rAjsBm6k=; b=ekK9GFYo8Aj8NgCl4uLPMOR0+AIwQtyUZ0lB/DTcHjxrilg3S2j
 9F5cMTuOb/BYZ/p2LhM8Y+U3skNfSFchqbaeR3zvh1mI0F995oyXsLCmCKWabTIr
 JML1BGmnYp/xDx6544gsEsPUDz7ffeE5p3lDyg4SJtWejAOB7xVpGkSSLZCNi6kl
 GGtqhyHE5kZul46j2IOPQTYhIVycAIqKKPxCE02xbe0ODo5Jox+i0CBwHbowVaJd
 XUbtGrcyZzkGOnA7z69Ff6tPlG3dCafjwJFrKhOon8G0ldhFHxv6rVCSVXkMYPqt
 PJOen9nF20iTAbq2zfnp9ZNc8EVJ25XQAkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657258990; x=
 1657345390; bh=SaWTP/ipYOsNzkBPsdvH+wrCaeRLBav4Q0arAjsBm6k=; b=x
 0/z8+S4Rg/YN+tPnl2aF20r3m9/fWQlBHXIkq0jzNiETSrpO542sMmz4kvmosvyH
 CutNEu4M6y+XnfUB/Ct8uQXkKRhvb0LsDVJcypFUEPUu2FrVv/JpvfaTi75L7eju
 yQTv43iCQghMe6dEGXRwsKNz8l7lRFaBZXvKdv2+GDr0qpDrfmQvhXe4LyVl4Won
 g0m0OBtMgEJ3sKasN1CJ3E9hInqRORELwPN4KO8CTkR18oOPgR7ZhACvJb0Puswb
 qiyGY0g1PR57SUEzN5qYYZAhPEIhbKp2R1GB/2RC1DWdXqXmNxXQnevwbCe6H5PB
 Bq5ME3+KAMY/uxd/AakjA==
X-ME-Sender: <xms:7cPHYl2vDgZ9_TVUcc1rFZEjVwgQSoxjDWt7ZQIa-59BpnbBJ1vAsg>
 <xme:7cPHYsFUgF3JiYUWbVSPllo3hiYZlk4NG-62cqvhfZMuy8AUuiQpAN6Av541fYKsX
 gbyqZ_ojjNQvOmOXXc>
X-ME-Received: <xmr:7cPHYl7UFZO5khLV4zLsF_L0Np_dRkm--S2J_vAmROEWyvhYZgSj1rB148pZjSBYz0SFrDA_2BnzdgvbwtA2UADHarGoaMZL1WSYSFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:7cPHYi1Mo8wkIF2aCuIE2oOHVIK1WY_iN0Jiqzr78rnVK0qkfEiwOQ>
 <xmx:7cPHYoGht1PIHV6e71zL1mo3uVMq2BBq1kFUKYLZR8609aYQQ87xtw>
 <xmx:7cPHYj9GHOJApVtt94MBXZpU_lOSgArct9_6BdFTTi5Y-sDDRPx9Dg>
 <xmx:7sPHYt6lqqifm_fbxYl9zNd66zmOZRVN_v_mIRB8Um5o8dqycudR-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 01:43:08 -0400 (EDT)
Date: Fri, 8 Jul 2022 07:43:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220708054306.wr6jcfdunuypftbq@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fwarr4xlxp4kje7c"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fwarr4xlxp4kje7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Here's this week drm-misc-fixes PR.

Somehow the email wasn't sent yesterday when I first did it, so let's
try again.

Maxime

drm-misc-fixes-2022-07-07-1:
Three mode setting fixes for fsl-ldb, a fbdev removal use-after-free fix,
a dma-buf fence use-after-free fix, a DMA setup fix for rockchip, an error
path fix and memory corruption fix for panfrost and one more orientation
quirk

The following changes since commit ee7a69aa38d87a3bbced7b8245c732c05ed0c6ec:

  fbdev: Disable sysfb device registration when removing conflicting FBs (2022-06-29 09:51:50 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2022-07-07-1

for you to fetch changes up to b68277f19e31a25312c4acccadb5cf1502e52e84:

  drm/ssd130x: Fix pre-charge period setting (2022-07-07 10:52:03 +0200)

----------------------------------------------------------------
Three mode setting fixes for fsl-ldb, a fbdev removal use-after-free fix,
a dma-buf fence use-after-free fix, a DMA setup fix for rockchip, an error
path fix and memory corruption fix for panfrost and one more orientation
quirk

----------------------------------------------------------------
Dmitry Osipenko (2):
      drm/panfrost: Put mapping instead of shmem obj on panfrost_mmu_map_fault_addr() error
      drm/panfrost: Fix shrinker list corruption by madvise IOCTL

Ezequiel Garcia (1):
      drm/ssd130x: Fix pre-charge period setting

Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Tablet 2 830

Liu Ying (3):
      drm/bridge: fsl-ldb: Fix mode clock rate validation
      drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
      drm/bridge: fsl-ldb: Drop DE signal polarity inversion

Steven Price (1):
      drm/rockchip: Detach from ARM DMA domain in attach_device

Thomas Zimmermann (1):
      drm/aperture: Run fbdev removal before internal helpers

xinhui pan (1):
      dma-buf: Fix one use-after-free of fence

 drivers/dma-buf/dma-resv.c                     |  2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c               | 21 ++-------------------
 drivers/gpu/drm/drm_aperture.c                 | 26 +++++++++++++++-----------
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 15 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c        |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c        |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c    | 17 +++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c              |  2 +-
 8 files changed, 54 insertions(+), 35 deletions(-)

--fwarr4xlxp4kje7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYsfD6gAKCRDj7w1vZxhR
xc3hAQCIVPsgwjqTEyaiOhpJmf3oeHMptoISeuOn+1IgD56Y9QEA/gsQSwn8eGMT
njr8/wHZwrd9GfK+dKVz25ZlNqlW0gk=
=g9tA
-----END PGP SIGNATURE-----

--fwarr4xlxp4kje7c--
