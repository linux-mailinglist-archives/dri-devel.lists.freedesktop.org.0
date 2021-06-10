Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84A3A31E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93236EDC5;
	Thu, 10 Jun 2021 17:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBF66EDBF;
 Thu, 10 Jun 2021 17:16:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 472301DA1;
 Thu, 10 Jun 2021 13:16:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 10 Jun 2021 13:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=P7hVAvB2TeXkgmcNSF4IKKkA9DBHyxgCl0Q8HoZxWXw=; b=Oe1HDj/h
 WZCqHpN+ssWEEkzBT/NNOYjfoLWD+vijZ6Klh32dlgR1Y+D7cXhzeM07ZpH1S4DX
 mINoINCqYP1w9ptfCP2X8LnJyPKB51JrNrMkzInxTsVwxTCdkmu9vS+ETmensim9
 kh1SovpgzVqULac3T2qeJwgY5E56B0Z8jHM2zBQH1AAyM95X5akmxDhIFBVaDIJV
 SjITyvvgfDBkldP/LQvqF1PU+V8E2jgMEZmpyzLWNy8+zlibilflL23ObFrr0KuR
 A7G5nYY50HMiL9+IHY2H7V2cb/Wvpu8p5hmM6knBxxJSmJH3YrM8mrpdhbDN9umR
 9iNIj0A1uqzMVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=P7hVAvB2TeXkgmcNSF4IKKkA9DBHy
 xgCl0Q8HoZxWXw=; b=unGeLr2iJKXGBa5AFmCJ3cAFd/6M67J/5TFHbeFlgrlMs
 giYEfxVfEf+iHYpfFsuW8+vmhm3ctefEsAY4sPAGgmMyf77ngJyxu0uRrc4RyRxf
 CZvY5SxApi4j/A0DJGqOAux1XIrXcDFvzpcP3wHhYpuo1mS4clz8IV2QFMJa/uPp
 yEpPXGRQLM1YnEmyb3ke+eZjveWObSir76wHBiZFAFX/LRexVV+bixbcC1JqRogR
 Gqh5HybqZtq52W3D4A1lruJK8r6l6wKCIeRElM9yzAUONqrGVZDk8IllYSMQFVaw
 F1a8OSMqt1vtHkvEMh8BJZ0zUojb1tOKknt+B6B1w==
X-ME-Sender: <xms:B0nCYDM8Jjr7i86hFzZgIu8wlUy6y4JNE794-1tl0wKG3wzKpWLxMQ>
 <xme:B0nCYN-PVx0Nri7yGXEQLK0hL7IMSkVJl8bW9etL2NJDmRjwyZqIGhlQRM9DqSsK7
 LSQu30z1vi6ZXKPE5I>
X-ME-Received: <xmr:B0nCYCT0fiRzxFMCR1ocqOX5lFxXxs9LKrQfwhCdkBcYlxCVoWBSlI4CiTTHdqWe8urWf1wOY4iZzrfFGeDgnK_Lfy8bBtfsnNJx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:B0nCYHu3eSd0DJ7bWtYJh-Z41uFlbxyOEobuNCN_Az6hN9x9RdKHaQ>
 <xmx:B0nCYLdlUzUB6qG7urnmmlu8IHDQDE2yxX31DU9LZrWONikAIWEQlw>
 <xmx:B0nCYD1Vf5mzModquv7rS0vTd8Ynh8L4zX5OTN3eICvR2hQovRictA>
 <xmx:CEnCYP6sJ1oqAbKzXUpa8REeOsHKFBapsrhc-l6nzqWwSLVEupyAynYTiIM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 13:16:55 -0400 (EDT)
Date: Thu, 10 Jun 2021 19:16:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210610171653.lqsoadxrhdk73cdy@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d7amxd44o7pbxu6o"
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


--d7amxd44o7pbxu6o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Thanks!
Maxime

drm-misc-fixes-2021-06-10:
One fix for snu4i that prevents it from probing, two locking fixes for
ttm and drm_auth, one off-by-x1000 fix for mcde and a fix for vc4 to
prevent an out-of-bounds access.
The following changes since commit 0b78f8bcf4951af30b0ae83ea4fad27d641ab617:

  Revert "fb_defio: Remove custom address_space_operations" (2021-06-01 17:=
38:40 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-06-10

for you to fetch changes up to c336a5ee984708db4826ef9e47d184e638e29717:

  drm: Lock pointer access in drm_master_release() (2021-06-10 12:22:02 +02=
00)

----------------------------------------------------------------
One fix for snu4i that prevents it from probing, two locking fixes for
ttm and drm_auth, one off-by-x1000 fix for mcde and a fix for vc4 to
prevent an out-of-bounds access.

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/ttm: fix deref of bo->ttm without holding the lock v2

Desmond Cheong Zhi Xi (2):
      drm: Fix use-after-free read in drm_getunique()
      drm: Lock pointer access in drm_master_release()

Linus Walleij (1):
      drm/mcde: Fix off by 10^3 in calculation

Mark Rutland (1):
      drm/vc4: fix vc4_atomic_commit_tail() logic

Saravana Kannan (1):
      drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device

 drivers/gpu/drm/drm_auth.c             |  3 ++-
 drivers/gpu/drm/drm_ioctl.c            |  9 ++++----
 drivers/gpu/drm/mcde/mcde_dsi.c        |  2 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 31 +++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 41 +++++++++++++++++++++++++++++-=
----
 drivers/gpu/drm/ttm/ttm_bo.c           |  5 ++++-
 drivers/gpu/drm/ttm/ttm_device.c       |  8 +------
 drivers/gpu/drm/vc4/vc4_kms.c          |  2 +-
 9 files changed, 80 insertions(+), 26 deletions(-)

--d7amxd44o7pbxu6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMJJBQAKCRDj7w1vZxhR
xbmRAP4ph9oofkApv0wgbfJWq2Ca+qDZzDm13FGD1doFWRQ4BQD/dND9iKJN2y03
lXcQKi2uJbtedpcR9HlNMbLYKadKUAE=
=yPmP
-----END PGP SIGNATURE-----

--d7amxd44o7pbxu6o--
