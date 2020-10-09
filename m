Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B06289FCD
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F8A6EE9F;
	Sat, 10 Oct 2020 10:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0616EC6F;
 Fri,  9 Oct 2020 07:54:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC70C58021E;
 Fri,  9 Oct 2020 03:53:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 09 Oct 2020 03:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=MDwRyGcf2G5rHQwm3zWKNar5+AM2sdput6vtz2rRJtM=; b=NlfazMIf
 bRlZiWz+VKHjVd0xwtcClXmZdn4NbFG5F3W++QV5/KauAcBju9825/5SNEvOIEQY
 I6hfAaBvfPCR0FbJtqDUMtCpFIQYKgDE8VLDgIap5VgnbSlWOODpnpZ8d+YDSbkd
 hs8mwnTOR8sM6t1snnyQ9NQehhCvTVAolJLVUQl1rixf660XI3z8QIKXZsvPnfBH
 y/yt6Ayp3U5DiyMhGAX3L8sCVsDtN2m5PiG56ZP9YIccsvywvWqBN8qnYSJGmwAB
 X07tfEER/odw73jAMPlZylvVBFmo4SVLlQnr5Yi7Kf/5UOenFf9fWWTFCcBHjdut
 jQz83xR55d/VwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=MDwRyGcf2G5rHQwm3zWKNar5+AM2s
 dput6vtz2rRJtM=; b=cQ4Eq6Z0uv0hD3Nvvx1OGgkmzAGKlh1TTZomFq+CDyLus
 vNztuzZz9uTqv2Ud6Ti7h4QrTGKAxccLw9KPuJdCB35B08xgYx6RzeLsGMiYwGnT
 jP2bcfbEKTNu/cIPOk3ybPb9FUxh6SPVAUj8lOOQqJZo8lyID1dkFXf0HYnOVqcB
 VsU9CYHP4A11HGgo1YqI5ofmOW07YReT2I/Y+woZX4ZEujGdeTsHjgUm3IzXro8c
 EuM5Fw0bJNqrWhjjcUO7olCd8rEf4PlxfC/F5xf/9gmPkmVSp7Z2lolpEoEFQQuP
 r8Vo8oqh2mHOEcDdBbqo7dtjWLwx0orBemjCeMM6Q==
X-ME-Sender: <xms:FheAX26aUDE-bYJasUtGBCOmFukumZCxbvWp_6DnFmqeAYrQX04_sA>
 <xme:FheAX_6wbnPLhL_oEiNdK78Emjo7twZNBtEqPLtQtOub7QscLiv4MNmg5Nf3FwwBR
 _nGXXcYxwZc-lKTOBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedtgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FheAX1forf7Nv1_9ESrAUUiPoJKODf_DA3E3PsBwGMRnPAcjOtCzEA>
 <xmx:FheAXzKD4ZWHGrsqVT6ibzDPWaf3qzVAzv-HoIt8ZCaguX8sh9wymA>
 <xmx:FheAX6KMP_fzFAd4k9WZ_FmmBPs4PrIaf4RUbo0LFtg3168EJOAexQ>
 <xmx:FxeAX5-UEyVcwKh6F89OGfyXnw6csUR1ANrh0E6xtIFmAncJeAsjHg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72739328005E;
 Fri,  9 Oct 2020 03:53:58 -0400 (EDT)
Date: Fri, 9 Oct 2020 09:53:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20201009075357.wfddfvb2xth23ofs@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Content-Type: multipart/mixed; boundary="===============0795759519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0795759519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpcgmkrp2xhrpdoo"
Content-Disposition: inline


--tpcgmkrp2xhrpdoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week PR for drm-misc-next-fixes

Maxime

drm-misc-next-fixes-2020-10-09:
One MAINTAINERS change and a revert for a compilation breakage in next for
ingenic
The following changes since commit 089d83418914abd4d908db117d9a3eca7f51a68c:

  drm/vc4: hvs: Pull the state of all the CRTCs prior to PV muxing (2020-09-21 16:43:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-10-09

for you to fetch changes up to 6561e0aa4627da90f59076fec5e3a1b72a8aa63f:

  MAINTAINERS: Update entry for st7703 driver after the rename (2020-10-09 08:55:00 +0200)

----------------------------------------------------------------
One MAINTAINERS change and a revert for a compilation breakage in next for
ingenic

----------------------------------------------------------------
Maxime Ripard (3):
      drm/vc4: kms: Assign a FIFO to enabled CRTCs instead of active
      drm/vc4: crtc: Rework a bit the CRTC state code
      drm/vc4: crtc: Keep the previously assigned HVS FIFO

Ondrej Jirman (1):
      MAINTAINERS: Update entry for st7703 driver after the rename

Paul Cercueil (1):
      Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached"

 MAINTAINERS                               |   7 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 116 +++---------------------------
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 --
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  12 +---
 drivers/gpu/drm/vc4/vc4_crtc.c            |  14 +++-
 drivers/gpu/drm/vc4/vc4_drv.h             |   2 +
 drivers/gpu/drm/vc4/vc4_kms.c             |  22 ++++--
 7 files changed, 46 insertions(+), 131 deletions(-)

--tpcgmkrp2xhrpdoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4AXFQAKCRDj7w1vZxhR
xTSyAQDP6IP3e/8Yl3zsgpJllFqJKfbMkLzS5M+TzAq+3uJDmwEA9Q9I470aFV7A
Lf/mIAOXQeHbXG4SVWdRatx+uT0aoAg=
=KLzu
-----END PGP SIGNATURE-----

--tpcgmkrp2xhrpdoo--

--===============0795759519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0795759519==--
