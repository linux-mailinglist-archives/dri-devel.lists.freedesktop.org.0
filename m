Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0A1B6710
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641436EA1B;
	Thu, 23 Apr 2020 22:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192C26E183;
 Thu, 23 Apr 2020 10:32:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D514A77B;
 Thu, 23 Apr 2020 06:32:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Apr 2020 06:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=YTqkbA+gunNzREuXuxfuTFdHYCTe/NL4zm46YcGOOfM=; b=mRhVymiz
 8w5gHRPezGxOxFRarUTi2r6QIkxiNTCrNn7rNBCnGzV6G2zwuZlHORBmQ4/npQ04
 cVu+Z3r+ZrW8jwohfwUf5xbjgoqXGCwu8hbb3m21PPTgxrBz9/Ezaf3vvULQP5eK
 TUVYP/UIgf49W458ggc2nfrTHdx472gcA0/mzVMHsLpU7y4sYAkchfxF5OZTmBcD
 DNjq0jZLWbwF00FVsnAG7wv1ivnpyNPnB3SqF/yiTolH2mVG4wGjEZtHwUd3cDyY
 AFm2kd5Npp6TiAWMCc2/ZWNiA6Slbcvs8vtS0D42S9w9VmiAlWoYQWNO3Ni85iRs
 ztviMcM58w/gpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=YTqkbA+gunNzREuXuxfuTFdHYCTe/
 NL4zm46YcGOOfM=; b=Y74CihfjBpBFZaUNjssyZM/XcMaKhHuA08FQopLHi8/bO
 H1jW0t/a3hvbMTRJt1ebf8sz6X9RXLcsfiiXHka1I8vMDredDBfBAFSZ98rG6SKC
 uCSj50Sdf39j6ZzOOBb256pDfeMaCRvbQUJpGWpWKXwYWX0Hs0FJWqrr6BisfbWr
 FlZjcjKyHPkL4cOSMw8GIylNHnHq/Z7Dlw01x0xpFl6S7sk3C2EEfUENNydIfJiX
 JUvoluNP53cGkx+fnMPEg3zQ0lSES6b5czqM7w2eMUPJTPQ+pwPvwS/m6k+BlRvY
 c6QXAslrKnJwfZUn/GYASbtvSXd+9C5nXzyip5UQA==
X-ME-Sender: <xms:uW6hXqexzonmUPFEJwim1G3y4xfoHmybBOZh21o0k8TmNySS-xHxtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uW6hXjSp-oYE4nfPVcXYNTAtnVwAEVECe-ZmHfcjuWLOrMoQiDKoMw>
 <xmx:uW6hXhuBO1QaqgnBH55018Eku5kqWvzS5ckSW9mUJw_6y1hxeJnLVQ>
 <xmx:uW6hXkdYITf2Edb6QF-4vQ6RNR-QSTPQRYV5gMPcdlfeSn96Tbr11A>
 <xmx:um6hXtXTxgKcxpGDrLq7lCo34bjFhoQsTv6z9nv94j8BUD1fGfqhAyeU6AQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DB303280067;
 Thu, 23 Apr 2020 06:32:25 -0400 (EDT)
Date: Thu, 23 Apr 2020 12:32:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200423103224.7hvyr3v7dmuny2bz@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Content-Type: multipart/mixed; boundary="===============1976174416=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1976174416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gsjnbpjy3pkk4dou"
Content-Disposition: inline


--gsjnbpjy3pkk4dou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here is this week (and the first) drm-misc-fixes PR.

Maxime

drm-misc-fixes-2020-04-23:
A few resources-related fixes (tidss, dp_mst, scheduler), probe fixes and
DT bindings adjustments.
The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-04-23

for you to fetch changes up to 9da67433f64eb89e5a7b47977507806c6ea026e7:

  drm/tidss: fix crash related to accessing freed memory (2020-04-20 10:07:=
35 +0300)

----------------------------------------------------------------
A few resources-related fixes (tidss, dp_mst, scheduler), probe fixes and
DT bindings adjustments.

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/scheduler: fix drm_sched_get_cleanup_job

Fabio Estevam (2):
      dt-bindings: display: ltk500hd1829: Remove the reg property
      dt-bindings: display: xpp055c272: Remove the reg property

Marek Szyprowski (1):
      drm/bridge: analogix_dp: Split bind() into probe() and real bind()

Markus Elfring (1):
      drm/meson: Delete an error message in meson_dw_hdmi_bind()

Maxime Ripard (1):
      Merge v5.7-rc1 into drm-misc-fixes

Mikita Lipski (1):
      drm/dp_mst: Zero assigned PBN when releasing VCPI slots

Sam Ravnborg (1):
      dt-bindings: display: allow port and ports in panel-lvds

Tomi Valkeinen (1):
      drm/tidss: fix crash related to accessing freed memory

Vasily Khoruzhick (1):
      drm/bridge: anx6345: set correct BPC for display_info of connector

 .../display/panel/leadtek,ltk500hd1829.yaml        |  1 -
 .../devicetree/bindings/display/panel/lvds.yaml    | 10 ++++++++-
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |  1 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
 drivers/gpu/drm/drm_dp_mst_topology.c              |  1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  4 +---
 drivers/gpu/drm/scheduler/sched_main.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 | 16 ++++++++++++---
 drivers/gpu/drm/tidss/tidss_encoder.c              | 14 ++++++++++---
 drivers/gpu/drm/tidss/tidss_plane.c                | 24 ++++++++++++++++--=
----
 10 files changed, 57 insertions(+), 19 deletions(-)

--gsjnbpjy3pkk4dou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqFuuAAKCRDj7w1vZxhR
xSi8AP0R02mkWzUUOl4WBCqHG1PIwxHXDLZcRvZHcgQZchMD5gD/QUE3lidGxgY1
zK2ZOqZuCRuxt8rMx3E4pfwDkLPACAo=
=Z0h2
-----END PGP SIGNATURE-----

--gsjnbpjy3pkk4dou--

--===============1976174416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1976174416==--
