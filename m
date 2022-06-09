Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A31544849
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 12:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FA61137D3;
	Thu,  9 Jun 2022 10:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C262C113783;
 Thu,  9 Jun 2022 10:07:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EF4375C014B;
 Thu,  9 Jun 2022 06:07:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Jun 2022 06:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1654769276; x=1654855676; bh=f1FVNivSAW6w18p7eCpNqBRpqJHkTr+yPcZ
 kyLc+V/Q=; b=kBp1Guo7bZ54mogYWfF8Af+dnNoOHKx0rY6+O36G8Qwo1dSKiV5
 qQaXEFBZZYIUtiuGfOfHDSAPyhPCsoh0qUrXQc786WCN5YrzralBNx5uNejo9Zjz
 qL8wCooTwQjm/Y04gqPSe+/D1Mze0DEBIqaYGgNN+AsYaxItFTDY1xT4OUuKu+Ky
 7Q6BK36IuSm3CBh8GCHelskwIsirfWP2YydWfF94/9BImw5rGDwfT/anAjNEj1SU
 qSLzwxXvov0msnEPsJp8dTI2DmDJ49UcFSFB9nCD+nKkdmKpQO31a1HysrZVXct9
 z/dY+EMiUdZY/uI2Vo0UBv+8TZrzggAA5EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654769276; x=
 1654855676; bh=f1FVNivSAW6w18p7eCpNqBRpqJHkTr+yPcZkyLc+V/Q=; b=P
 kYTbLtiyFSMWIiHX44tsQgSGBYI2vhbfXoKXftVeVuts+A9K3WD+rWPJJLum0OEg
 ZYQqmOah7cfHB5pEsqCURGffYC8+Y71ayha+5xUMD7q0cvdcR0V2MdjuEOaFaYp5
 RMY28fQozZjk/WC6wPpx+dX2lHer2pUebtWLCVkWjNNvD14rQJUbYKiQaYg9damT
 IVw9gtR1q7lbZmWoRZcRNwdhkO5fhs6FK23jAemYbHFhm/MDCzoBQJXbFg+Jj8CE
 AmpjJHEgkxdjmsOxlfq7+e6Sn8ISQlOLGMqL87iGeZHcL8bNBUsb8BmYcEf+vv5C
 RGgwJrUm5azP/NFCg4yiw==
X-ME-Sender: <xms:fMahYj8igzyfq9mq-obJSLSGAHU_4iqbsrxWAC6jkO4Gmrd7bZ3FcQ>
 <xme:fMahYvtKpBAbB0HLVIRJ3Rmys9XazBUyTFTkekL-EJrUYXK2dPK4m9RIKgmjVN2UK
 W6-oTq8atPQTt6izbk>
X-ME-Received: <xmr:fMahYhDHFXJ9szKM2LT_DUba1QgA1EG1ElmKgmku453Tb1QBigCftmv9Ynv_ApFip9eI12ogyEMNJ7yfCX04IZB1vhgBtwROHkmI-eI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:fMahYveNwcvkw6hM9Iyxbi1v3_rhvGI1grsgBNL_65OmAX8WvnIeow>
 <xmx:fMahYoMg7fThsGUbeDIgqXpArdzpRaUMVFnizphNqXX9ySWGecBdQQ>
 <xmx:fMahYhkm12d3OGmudbufpysza8TuD7h8P3JcSHrcxGXABs9MetddCQ>
 <xmx:fMahYpHZOHYb8GiSHK_k3ttUGkRhAKMGV6sF6YPwoV0JumisLmNA5Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 06:07:56 -0400 (EDT)
Date: Thu, 9 Jun 2022 12:07:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220609100754.kvrkjy67gqabjuee@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z5qqkj5p3qkumxi3"
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


--z5qqkj5p3qkumxi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-06-09:
One fix to handle DT errors in ti-sn65dsi83, a fix for a use-after-free in
panfrost, two fixes for panel self-refresh handling, and one to fix
multiple output support on AST.
The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-06-09

for you to fetch changes up to 477277c7fd43d48ae68cbdcaa7c0f82024a87421:

  drm/ast: Support multiple outputs (2022-06-09 10:27:49 +0200)

----------------------------------------------------------------
One fix to handle DT errors in ti-sn65dsi83, a fix for a use-after-free in
panfrost, two fixes for panel self-refresh handling, and one to fix
multiple output support on AST.

----------------------------------------------------------------
Brian Norris (2):
      drm/bridge: analogix_dp: Support PSR-exit to disable transition
      drm/atomic: Force bridge self-refresh-exit on CRTC switch

Marek Vasut (1):
      drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid

Maxime Ripard (1):
      Merge v5.19-rc1 into drm-misc-fixes

Steven Price (1):
      drm/panfrost: Job should reference MMU not file_priv

Thomas Zimmermann (1):
      drm/ast: Support multiple outputs

 drivers/gpu/drm/ast/ast_dp.c                       |  5 ++-
 drivers/gpu/drm/ast/ast_dp501.c                    |  2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  9 +++--
 drivers/gpu/drm/ast/ast_main.c                     | 21 +++++------
 drivers/gpu/drm/ast/ast_mode.c                     | 38 +++++++++++---------
 drivers/gpu/drm/ast/ast_post.c                     |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 42 +++++++++++++++++++---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  2 +-
 drivers/gpu/drm/drm_atomic_helper.c                | 16 +++++++--
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  5 +--
 drivers/gpu/drm/panfrost/panfrost_job.c            |  6 ++--
 drivers/gpu/drm/panfrost/panfrost_job.h            |  2 +-
 12 files changed, 100 insertions(+), 50 deletions(-)

--z5qqkj5p3qkumxi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqHGegAKCRDj7w1vZxhR
xZs5AQDYGRx/0R7I5H15naD7uzHVVhqjKJi2Aqh4h/vwC4nUxwD/Qc5+JPq1OAo9
lsd0e8EQ4KrwgTfCjG+PF/hVpGlS1wI=
=YSUp
-----END PGP SIGNATURE-----

--z5qqkj5p3qkumxi3--
