Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BB28C920
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211116E8A8;
	Tue, 13 Oct 2020 07:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E0F6E872;
 Tue, 13 Oct 2020 06:57:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 42715816;
 Tue, 13 Oct 2020 02:57:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Oct 2020 02:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=ze2pfgrr7TNSylID41m19UPE7vbTMbF15m10yVdWrF4=; b=R8sZVKiF
 k5LBqK//sXRNAHIhkXCE3UAG+wj7Rxocof1fFyD64sSNiHNENxRjByOPs0j8AvVw
 4b9vORWbo5pRO/Zq0eArIqSwhKvPRLZN/Rld3Dhf/8j8JRbOAFynYnQxgGCu2lbj
 yLX1rBF22YpudJOaNAsKegQR+eDaUhjBtH3/V9CL6ONV28dsG478T3MmeE4C0gJ+
 9e1AdlK3Y4Rs8iiugc3Ux3lwSBv4SBjP8aqqYa+rIfJz3K0VwIeGbfpyRoeyn1vH
 Ot8tgkXo4SShtk/C6Z9mzfOzucLdUVIA0rDP8d6VDfnk+CHu6P5YtBK9xmFXP3pd
 bSrDe/R+TILPcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=ze2pfgrr7TNSylID41m19UPE7vbTM
 bF15m10yVdWrF4=; b=Iehapgqc4kcZCG8FAH6/e3CiuCTw0YF+VsiB5jy7kmP6/
 rvz6Wcwa3zSkhMRkFcfR7jAq+7ZhNOK7g2Nn+wQfDKVNqh9COsFOlFhzbqTxbGqG
 tFYgYAn75EsFs/TdduYnhVtX7Ftlluy9qAtbaUEy2FE8HlnBtJKUPETEBGgn4UEI
 1mIlwAYNwPH6fLcYWvMLDENfXU/roWg2IAtmDL6X0Z6DL+QKHU1omeFGnzmVvcul
 HU4ww9EJCVUMEAXgMohdVkG6HkIXlJynXmM1FOI0MXqrCEq1XY60R4Y671Xv7lQr
 90qdewUMvJojBfNIGqpAd4MRxJAZP8GqZvKpOzXRg==
X-ME-Sender: <xms:x0-FX7K8EqhGTO3fh6xNjF0PSBLUbqiIyrMId_-E33VDHHDx9A_oSA>
 <xme:x0-FX_JfkP1YsOP8ZweiE3beSIQlpwaTLhOsuwOkBb0VashoytZ442dyn1OLI3_9E
 Vak_QLZDcmRZNn5Iwo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheekgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x0-FXzueJPNt_fHynyjFkUoOInIGch6ljA9PJPw7Fpy3vntFC1o8sg>
 <xmx:x0-FX0bNB7rKXcYmYNU1Yo0g7udXslJxtVTteOo8z9nSbxcySycctw>
 <xmx:x0-FXyYPi2TJD83X052evagOXrxw2AasFd_gtm61FiXaa10CKbPqiw>
 <xmx:yE-FX4OL8w_EqUl5ueWvmu7fLs02r4d5gimLRw5nPT0zl0sdSSPeY73QWeQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F91D328005D;
 Tue, 13 Oct 2020 02:57:11 -0400 (EDT)
Date: Tue, 13 Oct 2020 08:57:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20201013065709.lwjw3fthoxwsbqsl@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Content-Type: multipart/mixed; boundary="===============1580749661=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1580749661==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x2ygx4kz7pktrxul"
Content-Disposition: inline


--x2ygx4kz7pktrxul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

Here's the remaining patches we have in drm-misc-next-fixes

Maxime

drm-misc-next-fixes-2020-10-13:
One fix for a bad revert in ingenic-drm, and one fix for panfrost to increase a timeout at power up.
The following changes since commit 8ba0b6d196315f68c271f549e8585129caefce97:

  drm/vc4: crtc: Keep the previously assigned HVS FIFO (2020-09-25 16:56:21 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-10-13

for you to fetch changes up to d3c8f2784d3266d27956659c78835ee1d1925ad2:

  drm/ingenic: Fix bad revert (2020-10-12 20:26:14 +0200)

----------------------------------------------------------------
One fix for a bad revert in ingenic-drm, and one fix for panfrost to increase a timeout at power up.

----------------------------------------------------------------
Christian Hewitt (1):
      drm/panfrost: increase readl_relaxed_poll_timeout values

Ondrej Jirman (1):
      MAINTAINERS: Update entry for st7703 driver after the rename

Paul Cercueil (2):
      Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached"
      drm/ingenic: Fix bad revert

 MAINTAINERS                               |   7 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 114 +-----------------------------
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 --
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  12 +---
 drivers/gpu/drm/panfrost/panfrost_gpu.c   |   4 +-
 5 files changed, 10 insertions(+), 131 deletions(-)

--x2ygx4kz7pktrxul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4VPxQAKCRDj7w1vZxhR
xatQAP4/YXu16Mt69ADcZF8cnrHgX6fn3PtO2PY0PA3X71wQ8wD6AzEI3c45XTih
Migf2njfVBITYel0Kz5FPKoJZr0A1Q0=
=nY+j
-----END PGP SIGNATURE-----

--x2ygx4kz7pktrxul--

--===============1580749661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1580749661==--
