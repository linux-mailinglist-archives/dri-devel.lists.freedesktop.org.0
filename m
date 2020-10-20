Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3A2948BB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605876E9AE;
	Wed, 21 Oct 2020 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427AB6ECA8;
 Tue, 20 Oct 2020 14:14:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 4CFC9B45;
 Tue, 20 Oct 2020 10:14:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 20 Oct 2020 10:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=QNxDlJJQRQrOOLUrLPsoyXNQLI0P4pusWiyTYiUp3D4=; b=CebhdNj4
 e+tsVNlDaqXzt+5TyTL5+nmlarnlcXVW7nB3dil372bboMpCmHfAc4Kd3+JCnBdV
 U5ug15/bwwvlZSQiH5dYsj3xIIRSY8Ws1Wgm64fs4Wn+F0uJQzIh3gIoZSV2F+GZ
 AnmEmu5bDt+k+J+4n+KNADdnkkoDVprlS9mXihEkuU62KfjqHh7v1h9QLLuR+WjG
 226LbtzNMkAf+0GgfPfT0xe84P/SUiSiDFoRi4AX4rgEPm7ZBFEJgaJR2YTjMSOR
 K/UNm8oVlWsPA9EkIKpgxYzeOFwuBZ0Upd1AjD6lqgWVi0hPA2AducPqOzHy8MbX
 FKr5n+8Q/bNJvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=QNxDlJJQRQrOOLUrLPsoyXNQLI0P4
 pusWiyTYiUp3D4=; b=PLfG9Nxw9rpNR5Tg7Dejc3RTLy1DxPd3uXGA6vunT35ns
 f44yClnqADL9atBaxBiqIAxokUn1CySp44W7RKQmbjiG2zLFpvHYzHpGtRUpM3Do
 LlgdavxGO7yOC4zsBzGacg0RCoIXUMb1QNFJhLVk/OA3jhhJhRoX8X9LBocU0PZ+
 vM6ZhEiuOmUv+A5m/gf+LMWVqe6Ak7sWh11mctBafkwFtPnjLWu5jUxllQLS6pSj
 shgfEUcRbCVssGwuX+Qf1lr7/9Ws5doZOnwKI3fLyQku5oiA9ZokhGxVgwxnkOmL
 mffOnao6F+jAFBwNtzK1soqMDmyKaAVqs33JPKFiA==
X-ME-Sender: <xms:2PCOX6koDCe_uLxAFJKa0VIGk3Nb8be9ti6jGfETpz0pIC3dT7_Vug>
 <xme:2PCOXx1Cd95aRth1EQ0AlYkdg8OrHk4FzXWGSHVFgU854ko_kS1tyerShARWKi40G
 dWVFiWB8dKrhlGTQwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeeguedvtdehgeeghefhieegteffueefleevgefgkeevgeeiveduleejueegvdeigfen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrie
 ekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2PCOX4qMSe5__ZJn6RLlidWuA8AZ8mrfy2tvMK0ottVAfb0yuV12Ew>
 <xmx:2PCOX-k-sAmWLezgq7E3x9_c3n_DgQoQHhAounrzAEtvcg3YQRtBJQ>
 <xmx:2PCOX43jn8FW_28RBAmV8txWEqQ-wT9L5ndpG8E_Cbw95a2pdexa0g>
 <xmx:2vCOX5Kr_Lm1TTmyGF6c0xdrgczklP52bXLjcHJPOcknfr7jYePZWKBR09o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5479A3280063;
 Tue, 20 Oct 2020 10:14:48 -0400 (EDT)
Date: Tue, 20 Oct 2020 16:14:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20201020141445.4jisqylfbusdnzge@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Content-Type: multipart/mixed; boundary="===============0843284710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0843284710==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cjr3fy77yrhqgfqc"
Content-Disposition: inline


--cjr3fy77yrhqgfqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Here's a couple of patches that should be merged in the current merge-window.

Thanks!
Maxime

drm-misc-next-fixes-2020-10-20:
Two patches to prevent out-of-bands accesses on fonts buffers
The following changes since commit d3c8f2784d3266d27956659c78835ee1d1925ad2:

  drm/ingenic: Fix bad revert (2020-10-12 20:26:14 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-10-20

for you to fetch changes up to 272d70895113ef00c03ab325787d159ee51718c8:

  Fonts: Support FONT_EXTRA_WORDS macros for font_6x8 (2020-10-19 17:55:10 +0200)

----------------------------------------------------------------
Two patches to prevent out-of-bands accesses on fonts buffers

----------------------------------------------------------------
Peilin Ye (2):
      docs: fb: Add font_6x8 to available built-in fonts
      Fonts: Support FONT_EXTRA_WORDS macros for font_6x8

 Documentation/fb/fbcon.rst | 2 +-
 lib/fonts/font_6x8.c       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

--cjr3fy77yrhqgfqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX47w1QAKCRDj7w1vZxhR
xdOcAQCNl61Tr2zRoeD0sBeDstoAICioSfcXnJATXOQOlDhB/AD+IdTeU6ZZ7U/z
6dTV02h2nd99xSpJgGSCR+m0tuFVagA=
=heIM
-----END PGP SIGNATURE-----

--cjr3fy77yrhqgfqc--

--===============0843284710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0843284710==--
