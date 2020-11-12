Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0282B1756
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A3D6E479;
	Fri, 13 Nov 2020 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BBC6E1F3;
 Thu, 12 Nov 2020 13:07:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2F0E8D41;
 Thu, 12 Nov 2020 08:07:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 12 Nov 2020 08:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=OPUCsR3Smh2adGdPwnfvJyElgjO1Jgi203euJDpcUGM=; b=ek6t71Q6
 6gzUpNL/Oc9g/KRI49ClOtkSP8vknFq5kHMmEpOfYWuB6q5oioLevKym40KzDo4u
 OJzBbWSfEtQTbHC9l5f1/d+C5eyj0qxov/xrlMCm7xwm4QzSxbPGZjxO2m7fplHJ
 eebnQNy/BexRbYkVg/OLJdCc3IwH0NrMtsmeIc7oHq/SFnpb5e7UILVboHnVpC+J
 te/HPT0u2sZMNT9iWrYotj3vykiqnHYutrK+RfppI5kTx4SGlQ34V422EuPkL7uc
 Iohsx1srf9q95/J+AhECGmgzxF3STJSnDWSwo8MqA3jpWRjNsehQqnr+MvmlJ1wC
 7kp70l+r2HHFwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=OPUCsR3Smh2adGdPwnfvJyElgjO1J
 gi203euJDpcUGM=; b=UF9MhKe25fOzFKl8cmFHdT26U+62NEUn8J8a7+oOCMB5m
 n/qYUAruiw32g8NUR478hrqfrXH/PCNdHKOz2vkf0QcIiiE3z/HbZ4lCVmRhih1Y
 oPJkyY0oPpDueiNgCrPAcm21oAnq+Pwz2VHl10MAR6CFACes1pA0Bc9LRKn0pR91
 aA8ibjY3gNPDco//Uw9/QSyzzmjc8KSxGJAmk7WTjza5HEcIcA+k3s/qBwkaH7e1
 Cb8q2POFpBD3EYSidGKLuMtX2xPwTNMR2Yidt/fheQp5rpOAbNJ5ljqSxl5tCZqe
 rYVNT9bai6nQjth09NE2PEP8779kGpTa2EPwi1xug==
X-ME-Sender: <xms:kDOtX6VqZv39QdbEu9JPQhrQm0X1PCp7J5kXjt0oP0b1RCUcgxAU_Q>
 <xme:kDOtX2nCfZbm20dh0WJOB_GyGjizUy6gxq0ZrE93uQX3igY9iQhRqhiuHvELQtM4E
 v3kpgsgxDn5f_OJTt0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kDOtX-Z0Yk4aQ9NVF1xeG5CVxJ2MoruF5qJRqltSK57N0sLxRMrFyw>
 <xmx:kDOtXxXW3VFSLLKVUmFnIa8qsAEYwnSs25KVE2jdF6FqFDXg3rKsmw>
 <xmx:kDOtX0nJavcuc8vMYlDtbR_ytobI-V4F7VOc_ywW9mlxjF3J1R8rsw>
 <xmx:kTOtX-5i0BvpeGvODuj_NJGu_Mk4SRdFtGEQI4rQKJ8M7Xt7u_LaDwVAtUk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 129EF3280063;
 Thu, 12 Nov 2020 08:07:27 -0500 (EST)
Date: Thu, 12 Nov 2020 14:07:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201112130726.qwtryqvgspmljkax@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Content-Type: multipart/mixed; boundary="===============0968964996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0968964996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7uaw3bv46dovgufw"
Content-Disposition: inline


--7uaw3bv46dovgufw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week (quite small) round of fixes for drm-misc.

Thanks!
Maxime

drm-misc-fixes-2020-11-12:
One Kconfig fix for bridge/cdns, a missing include for hypervb_fb, an
out-of-bound access fix for gma500 and a unbalanced regulator fix for
mcde.
The following changes since commit 9522750c66c689b739e151fcdf895420dc81efc0:

  Fonts: Replace discarded const qualifier (2020-11-03 10:51:34 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-11-12

for you to fetch changes up to a6c40b8032b845f132abfcbcbed6bddebbcc3b4a:

  drm/mcde: Fix unbalanced regulator (2020-11-11 00:27:53 +0100)

----------------------------------------------------------------
One Kconfig fix for bridge/cdns, a missing include for hypervb_fb, an
out-of-bound access fix for gma500 and a unbalanced regulator fix for
mcde.

----------------------------------------------------------------
Linus Walleij (1):
      drm/mcde: Fix unbalanced regulator

Nishanth Menon (1):
      drm: bridge: cdns: Kconfig: Switch over dependency to ARCH_K3

Olaf Hering (1):
      video: hyperv_fb: include vmalloc.h

Thomas Zimmermann (1):
      drm/gma500: Fix out-of-bounds access to struct drm_device.vblank[]

 drivers/gpu/drm/bridge/cadence/Kconfig |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c       | 34 ++++++++++++----------------------
 drivers/gpu/drm/mcde/mcde_drv.c        |  8 +++++++-
 drivers/video/fbdev/hyperv_fb.c        |  1 +
 4 files changed, 21 insertions(+), 24 deletions(-)

--7uaw3bv46dovgufw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX60zjgAKCRDj7w1vZxhR
xZ0rAP0Y7D1rieBs98/DNaEeA4gJ9ynGPrrLJSkp2bNJLh4BzAEAt6Ah8OxnSGVJ
VAC4cbL6h+tOFkctVwmMx5zM3NXxPw0=
=1jrq
-----END PGP SIGNATURE-----

--7uaw3bv46dovgufw--

--===============0968964996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0968964996==--
