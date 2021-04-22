Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FC3684EB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00766E05A;
	Thu, 22 Apr 2021 16:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA196E05A;
 Thu, 22 Apr 2021 16:33:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id A3E68582B9F;
 Thu, 22 Apr 2021 12:33:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Apr 2021 12:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=gSRogRQ+WrmQp6tKZpAhKXf0Wf00LBctjhsGY4vUI8E=; b=V+dqHFPT
 rZkUq+/p3BLL0uiVh3aF7bXeCyuBiRV2H9YaLfhqpuEVo/GyG2LaqjAvYEIg0+ny
 CEpkw+xUtdL9vgofEC368jqcGPm1VQLBTGi0br2YD2D2KkCgOAHCG/hqliTvS1Wr
 c0o5GO9VMaCJM9cZMiXtCcLdbOo+JcjBjo1YO6tpK0ZvOfDdYlgqrc7UQuQtAYCa
 sjpxdJx4udCd9qCvB9ghfGeeA7YWFI4EfSTq9rsdrzU4sj0mNcrFNEI/USk/pYGS
 bh+PwMBQ0OjbSq4o6TUq1Y0ANuh9rpNvUcdnVSryD/v6s1YaJ8jF2A79vH2HzV1r
 xNUhM13GZXraYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=gSRogRQ+WrmQp6tKZpAhKXf0Wf00L
 BctjhsGY4vUI8E=; b=rjFyDM6+mAXOUGJjxURHJOc7zWxfFj/f7wCqL5O92RknQ
 GrpuGxwnGsD8PgIbPbYbg/8N3fNRIG1qXeULEdiqUAtcCwHibNpCeyDrO/Kbf1OI
 k60VHzxAXAd3ARSDYabk+C6NFDQQnB5Q5Jp/2OEHR8qkfUW/v4uxgmu2nBhb/PUD
 xjcjvMZZ9R6iCjEEIg4fO5kTcjfLVxV4CqCDW8snK7KKFJP6aKruFIWxBaK+rHSG
 6RxfwDkje6+K70F7MYvN5vZFJbBeXFTGrnsdz6hDVyCtoNhRMWjWvMl73+j0Gtog
 238gaQMvgFoevi3hOMNumfUe4GlhWnIEJ1OW0JhZA==
X-ME-Sender: <xms:XKWBYPUV5PjLaOasa2JBkGdWtBvipjpik91jwNjVtu5LAgupozqQcA>
 <xme:XKWBYCKFnQZgadm_LFK1R1hK-MLIfP_Vzwxh6NPYcC6VzwD2PrGmk2aMxJBTK4DXi
 b_AB3rv76UcWMXcQ2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XKWBYH9JJmeQh0dDYhQTGgLCOYllTLSDTrfP37GT39WaolaF5Uwong>
 <xmx:XKWBYNKaquHUPQJ30Jm3_KKtQmpQx8JnQf3iuK0Rfm7h40riWjADnQ>
 <xmx:XKWBYEnl6oAMylcjsU6hG24YTGrtgJE14YlxpqCW_VoxdAJGPwn5Gg>
 <xmx:XaWBYLkg6_fkAxSuX30ua_tnZXSkXKNhKwbaBBxttIuml8vrZ05enQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24CCA108005B;
 Thu, 22 Apr 2021 12:33:32 -0400 (EDT)
Date: Thu, 22 Apr 2021 18:33:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20210422163329.dvbuwre3akwdmzjt@gilmour>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1634535167=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1634535167==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uszy7nwn2bcbg3zw"
Content-Disposition: inline


--uszy7nwn2bcbg3zw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next-fixes PR, for the next merge window

Thanks!
Maxime

drm-misc-next-fixes-2021-04-22:
A few fixes for the next merge window, with some build fixes for anx7625
and lt8912b bridges, incorrect error handling for lt8912b and TTM, and
one fix for TTM page limit accounting.
The following changes since commit 9c0fed84d5750e1eea6c664e073ffa2534a17743:

  Merge tag 'drm-intel-next-2021-04-01' of git://anongit.freedesktop.org/dr=
m/drm-intel into drm-next (2021-04-08 14:02:21 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-=
04-22

for you to fetch changes up to a4394b6d0a273941a75ebe86a86d6416d536ed0f:

  drm/ttm: Don't count pages in SG BOs against pages_limit (2021-04-21 15:3=
5:20 +0200)

----------------------------------------------------------------
A few fixes for the next merge window, with some build fixes for anx7625
and lt8912b bridges, incorrect error handling for lt8912b and TTM, and
one fix for TTM page limit accounting.

----------------------------------------------------------------
Adrien Grassein (1):
      drm/bridge: lt8912b: fix incorrect handling of of_* return values

Christian K=F6nig (1):
      drm/ttm: fix return value check

Felix Kuehling (1):
      drm/ttm: Don't count pages in SG BOs against pages_limit

Randy Dunlap (2):
      drm: bridge: fix ANX7625 use of mipi_dsi_() functions
      drm: bridge: fix LONTIUM use of mipi_dsi_() functions

 drivers/gpu/drm/bridge/Kconfig           |  3 +++
 drivers/gpu/drm/bridge/analogix/Kconfig  |  1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 32 +++++++++++++++++-----------=
----
 drivers/gpu/drm/ttm/ttm_tt.c             | 29 +++++++++++++++++++----------
 4 files changed, 40 insertions(+), 25 deletions(-)

--uszy7nwn2bcbg3zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIGlWQAKCRDj7w1vZxhR
xSZbAQCODFS274YG+2lKy4KLM2CbYMdgGHi3umOtKZUHGgClkQEAsqan1AcQ3/Is
0O/qvMwXzs6W3ACdHWbe6G0/2sCv9Qw=
=rBa2
-----END PGP SIGNATURE-----

--uszy7nwn2bcbg3zw--

--===============1634535167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1634535167==--
