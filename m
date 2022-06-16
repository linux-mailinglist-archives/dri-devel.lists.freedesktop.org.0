Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEFD54DB75
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA7A10EACF;
	Thu, 16 Jun 2022 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337DE10E2B8;
 Thu, 16 Jun 2022 07:25:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 871375C00E3;
 Thu, 16 Jun 2022 03:25:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 03:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1655364322; x=1655450722; bh=fo8XxAvQ50IL/ZRZfiCQ2zU+hIubPi7ODKQ
 aa23W52o=; b=BVuPieRYyT0wK75CHeyUGVy2IbZjzuzq0jaswNR7XiN6tp6tZM2
 oOmIltKFkN/+68rWeGYXOZ2aJEhEVknE6oINkg5MaPsP2RJWJULlJzaLxAbGen2S
 BhYJRHHEjknvrp0ozqZJGb8wS6yR9WyKwsAEIuwh8d6P8mhy27vARnJ5JkeZM2rY
 Lf/TpZu7h5F8GeTZXRffWbtnll9xyaJDIkdf14VH9Kxb/+B+rgSIeg2Wt8sXdzQR
 yJHFbNIRT21yYojmd4OQmOB10ulMEhHXLFEspEIwqHqB4+l4CBIK7ienSPirTF3u
 7qUg5mDNxpUzNPfgYmEuLrFjs3tfQmO8+3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655364322; x=
 1655450722; bh=fo8XxAvQ50IL/ZRZfiCQ2zU+hIubPi7ODKQaa23W52o=; b=Q
 CWB8V4lQlqCjk3UpfM5So7zaQz7FrMjuo2IXgUhAN5mXjlbwviUFKkf1GLfzFyyW
 tZXGnfe0ikAGbHlWKu4YOpN45qOgAgqz3vcr9bWAGPPa8bH89yQX+l3A7kjdEMhl
 lAgJiuwo69PO+TZoxNKq91lQGax6gqOjjHsaYaMZpO4ortJIa7vPZYylMv0aezT5
 LXqxz9650ANDX9x4TkbPGWuURxocxv4YlWXYqVuu0XPh05XgFFjMRrOeITu7yElN
 hohBCFDr4nPzTGcmIaD7+zYB60VeCMvAoGJHSsMmFCuyYzvikLPGAYuMzB60RyEt
 3FOUmkuZqJYmhVtXLIphw==
X-ME-Sender: <xms:4tqqYktfDjHDJyg_nG4F7XcC8uC2MyPDOppiPx1vJvtSjg1VV7RFTw>
 <xme:4tqqYhcR1vck3JJ-MqqoZ1OjS81bopSkwpG3yQ_9By8Papqvko4SxGJZRoq5S1Bmr
 g0K74sBfl_-ZNuU39s>
X-ME-Received: <xmr:4tqqYvxIFIRGMi8mI_-eR6Kox8xcNCpACUI3dYIVAG0rnD-BOZm2Sy44L2fT2bt5ZeaB02wfL_VfJFjSMdowaC3QnE1PrptDDllW4zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkeehjeeguefhtefhgfehkeehudefudfhjefgheffkedufeegudfghfekfefh
 vedvnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:4tqqYnPnaItk-2QQLfa5sZ2qTPfmw2PRcGfdvsxqC7b1h2MdbE2-HA>
 <xmx:4tqqYk-i4-9_0NeFcSO_RcZegzj7NMD9hqGRellbrqZWGcCrXZjtLQ>
 <xmx:4tqqYvWxeUsoUzhFBGmZGhqRNE70YOBQu_S46om84Sud-Agx41NBCQ>
 <xmx:4tqqYl1mQ2x5D0or_n4UpN8Pvvsvm_1ErnyKnAk7YhzHMBx1vFmUwA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 03:25:21 -0400 (EDT)
Date: Thu, 16 Jun 2022 09:25:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220616072519.qwrsefsemejefowu@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5rt3225icc7b6s5"
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


--r5rt3225icc7b6s5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-06-16:
Two fixes for TTM, one for a NULL pointer dereference and one to make sure
the buffer is pinned prior to a bulk move, and a fix for a spurious
compiler warning.
The following changes since commit 477277c7fd43d48ae68cbdcaa7c0f82024a87421:

  drm/ast: Support multiple outputs (2022-06-09 10:27:49 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-06-16

for you to fetch changes up to 0f9cd1ea10d307cad221d6693b648a8956e812b0:

  drm/ttm: fix bulk move handling v2 (2022-06-14 11:15:19 +0200)

----------------------------------------------------------------
Two fixes for TTM, one for a NULL pointer dereference and one to make sure
the buffer is pinned prior to a bulk move, and a fix for a spurious
compiler warning.

----------------------------------------------------------------
Christian K=F6nig (2):
      drm/ttm: fix missing NULL check in ttm_device_swapout
      drm/ttm: fix bulk move handling v2

GONG, Ruiqi (1):
      drm/atomic: fix warning of unused variable

 drivers/gpu/drm/ttm/ttm_bo.c       | 22 ++++++++++------
 drivers/gpu/drm/ttm/ttm_device.c   |  6 ++++-
 drivers/gpu/drm/ttm/ttm_resource.c | 52 ++++++++++++++++++++++++++--------=
----
 include/drm/drm_atomic.h           |  1 +
 include/drm/ttm/ttm_resource.h     |  8 +++---
 5 files changed, 60 insertions(+), 29 deletions(-)

--r5rt3225icc7b6s5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqra3wAKCRDj7w1vZxhR
xS6zAQCpSVGSPRzaPOdSSrDYVw8B4WgqmIX2Vduj8sr0sodWQAD/dFyIoUyqkZ7S
4+x5+SO/FKV2bOgUeBgJkfzHOKn/hgM=
=tzWJ
-----END PGP SIGNATURE-----

--r5rt3225icc7b6s5--
