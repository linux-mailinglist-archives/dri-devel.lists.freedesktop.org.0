Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F55525C57
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 09:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D310E33E;
	Fri, 13 May 2022 07:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2C10E33E;
 Fri, 13 May 2022 07:30:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D4DC5C0054;
 Fri, 13 May 2022 03:30:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 13 May 2022 03:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1652427046; x=1652513446; bh=hUsceP+Ueazcop04Mxyb5u1xpYIPj9uE4ap
 VBiH9t74=; b=qZCzjbghrC0MXLuu4fpJp6uzuyKerQx7gNWOsZAHzj/VvNKb6t6
 fskQUleOKFTUvn/qt50dJ3x0FPs5PGlK+O7zMRTKUXSVBAIT8FkJzp/pBFFAdW0q
 eXCVFw5d8GWEQnTkiWUA29+WNv5pf/cwCrKPPAQOh+HvBGELHOCtxyRvysHGejg3
 bWNYjIK6uReqz7KHw5G2DHgOSjCnOdGxZED7ZzSZZsYkDj2bB4Un2O9BDc/mlLDc
 vUJ4CC44nY74UyT7mw/H4DXMGvC3ACCBq2Y66pRCSj8cryPReyMHY6gBtuunB62Y
 xA3wKXOgW5GOHijFu9yOrteoxt8mzlXwNHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652427046; x=1652513446; bh=hUsceP+Ueazco
 p04Mxyb5u1xpYIPj9uE4apVBiH9t74=; b=NFOrDlHcrPDm5UeAVJOk9U2tzugLQ
 5YSxHa3WWH2NDk3riu4ZoL1vdbRmfT3+rBz99qElTFAhHUE+qxOJoo3tpB6psFLg
 F0/5ChOpavND+UrKken0EwNUKYytIontfl00GnsZnEi3jp+rCBCe97hv0f7zEl63
 8SZmK2op8BWrg8TdwBjZk4IlEdC/5bFDtOsjR8aGteXVda7T3/fBCmzZK7NHG5CS
 BVNR8OcVSEaMluSulxG5t6VTbT2Gb3JofV4x0nN0ix738NAdoq4hoI3R88irvicA
 PfE0ak2KJ6ZwizF6IO1rzsjnohTf852+eITVxJ4vIBvceg/K90r4lbQ8g==
X-ME-Sender: <xms:Jgl-Yk2kshBet_qcboLLLLnRWXdMppaxNm9T4BQsD25aPgkQ8WpT2Q>
 <xme:Jgl-YvE-nyD195pU44KXtvXAsWwkobRHkUAOQc5sacjMlDX_jqGd6Of3Qqr72-6zj
 OTtu4rSjKrwygtK9zM>
X-ME-Received: <xmr:Jgl-Ys6q5vEq3avfdvGsNy1cdSuF_f5m487RZGsn8wITddVsjk_S9mzn87tkJU2GCB4yCN6YGvyty9NT5zHCiQKzCIi8fiQdc0T5zsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeekgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:Jgl-Yt05d5sS9lgSuc0p9kVd0Kqn1tRsQPoq0FossuJyCBu4xh4Axw>
 <xmx:Jgl-YnH1v4niPS7eGFdfktEUZzRChcUS4mxnfn9iXsdIrbXSZowNOg>
 <xmx:Jgl-Ym-jUeDlvPAuRBvRWJBGTBxi_PEhV8I34ny6NomWFPibIgFBKA>
 <xmx:Jgl-Yv_FQqFsFFu0h4gz5txQxfLu_ARITaEp_88sRmUZuWunWbzRqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 May 2022 03:30:45 -0400 (EDT)
Date: Fri, 13 May 2022 09:30:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220513073044.ymayac7x7bzatrt7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="indhsql6dmowzej7"
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--indhsql6dmowzej7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes. drm-misc-next-fixes is empty at the
moment, so there won't be a PR for it this week.

Thanks!
Maxime

drm-misc-fixes-2022-05-13:
Multiple fixes to fbdev to address a regression at unregistration, an
iommu detection improvement for nouveau, a memory leak fix for nouveau,
pointer dereference fix for dma_buf_file_release(), and a build breakage
fix for vc4
The following changes since commit c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a:

  Linux 5.18-rc6 (2022-05-08 13:54:17 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-05-13

for you to fetch changes up to 6fed53de560768bde6d701a7c79c253b45b259e3:

  drm/vc4: hdmi: Fix build error for implicit function declaration (2022-05-12 11:01:19 +0200)

----------------------------------------------------------------
Multiple fixes to fbdev to address a regression at unregistration, an
iommu detection improvement for nouveau, a memory leak fix for nouveau,
pointer dereference fix for dma_buf_file_release(), and a build breakage
fix for vc4

----------------------------------------------------------------
Charan Teja Reddy (1):
      dma-buf: call dma_buf_stats_setup after dmabuf is in valid list

Christophe JAILLET (1):
      drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()

Daniel Vetter (1):
      fbdev: Prevent possible use-after-free in fb_release()

Hui Tang (1):
      drm/vc4: hdmi: Fix build error for implicit function declaration

Javier Martinez Canillas (5):
      Revert "fbdev: Make fb_release() return -ENODEV if fbdev was unregistered"
      fbdev: simplefb: Cleanup fb_info in .fb_destroy rather than .remove
      fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove
      fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove
      fbdev: efifb: Fix a use-after-free due early fb_info cleanup

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Robin Murphy (1):
      drm/nouveau/tegra: Stop using iommu_present()

 drivers/dma-buf/dma-buf.c                          | 8 ++++----
 drivers/gpu/drm/nouveau/nouveau_backlight.c        | 9 +++++----
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 1 +
 drivers/video/fbdev/core/fbmem.c                   | 5 +----
 drivers/video/fbdev/core/fbsysfs.c                 | 4 ++++
 drivers/video/fbdev/efifb.c                        | 9 ++++++++-
 drivers/video/fbdev/simplefb.c                     | 8 +++++++-
 drivers/video/fbdev/vesafb.c                       | 8 +++++++-
 9 files changed, 38 insertions(+), 16 deletions(-)

--indhsql6dmowzej7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYn4JJAAKCRDj7w1vZxhR
xQU/AQDmrpG26RyjJZaA8bCjNHvPTh6jlx6WElOSXIO8nlknUAD8CZx1jolkB5Ll
Z65UkVYo6lkwx07O193Wc1j9pbz4IgY=
=0yUQ
-----END PGP SIGNATURE-----

--indhsql6dmowzej7--
