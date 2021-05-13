Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BD37F8DF
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 15:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D056E892;
	Thu, 13 May 2021 13:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0316E890;
 Thu, 13 May 2021 13:36:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 76217283E;
 Thu, 13 May 2021 09:36:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 13 May 2021 09:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=Psx9EmsSFQxFpbOC+shS/JI20lBse8P/ruUGEyBzc6U=; b=VJFMWZa9
 ChpSTKkiARM2W2DjRH6G6srAa2p6BA3HuaVd3MWujXIa1II7CcCQi1hh0K54B4J/
 JvO/RPk8GaIob5Q6M6/ucKD55ScgC83YbIEGzFopJ2loOvgSgm4BmmSWUjG7tVPL
 tPl54EWz63WkjVepLVF+K+OBEUEllrrvIjeu/a/5IvX9fWTAvDgnhOSYPWC0KtTq
 WpRFesshtUSt41QQRO3fJMFxFrLJZl3iLftXhHhFkE9HzF8ULvmJAmJJbuA0kcLU
 N8TDFSp+s/LlkPuIa15tSLQATO7fNPwwjmZcsyuVV6sc53Cq0MSqttAmQA0Yr28V
 4a+4wBrTl3RIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Psx9EmsSFQxFpbOC+shS/JI20lBse
 8P/ruUGEyBzc6U=; b=fMU/AkE2M8FuVa38fyUA9qjMNdeQ3VmXVMJ5tcCesGxVy
 LlCYiQTt5xQ/FE+vzI1T+Uq/oN5EEaMkfoe0Nh83YJtScG2gsu94C5tueGaC4cfl
 l6RX38hlbK1bi6DuzjV4mGEJcx/x9H6p0lveG7WflMKQAz+pSaEe2nIaSTjVTap/
 5OSFLY6qx/OVvqlQZy2vIyRaeXJPPB3y9TCE822kGpFs1nc59h9iDckAEMrt1bc3
 YXiUWpSTSwPEytuA0dYbT7jTfWrgFqITrFRssI/Z6c/4M/CrvIzBzhiVg4pTa6Ss
 txAyeywcdCs4XPNgj5L71alcXeJEtQdemlB/sZodQ==
X-ME-Sender: <xms:UyudYGljG3otcgj8-2Lln_zLQjnubGjYXDYKD_3h6wyjQu8XmIuirg>
 <xme:UyudYN3Fu5NGlbUGESNTnxrlG9KLewBElGWbIdk5NIf0q0q4qsBpCcuV_Jy2Yka3P
 TCqjX1PbRW0F4S6AU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeluddrudeife
 drieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UyudYEol1J9pBBagP1o5WuOFCQVGub2wCbHgrfGXEFxtpuzpiT94Rw>
 <xmx:UyudYKnI73dYD32uA_Qqb-RKZVYU37aBowyK9vJjk-IazvPtOym1ng>
 <xmx:UyudYE0KcEXRcvsuS1lEazQvnYrz8sXr0bmak9Y1XO5MPZUMp-btCQ>
 <xmx:VSudYFL0XhoZczpq_H_ger3dmQDBPiOMwj_7gYSnfNDkuc5I5QyRRH4pxp4>
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 13 May 2021 09:36:19 -0400 (EDT)
Date: Thu, 13 May 2021 15:36:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210513133617.xq77wwrehpuh7yn2@hendrix>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="atub3ne7a65whkcn"
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


--atub3ne7a65whkcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's the first round of drm-misc-fixes for 5.13

Maxime

drm-misc-fixes-2021-05-13:
A BO list maintainance fix for TTM, removing an unused function and a
MAINTAINERS update.
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-05-13

for you to fetch changes up to c55b44c9386f3ee1b08752638559f19deaf6040d:

  Merge drm/drm-fixes into drm-misc-fixes (2021-05-11 13:35:52 +0200)

----------------------------------------------------------------
A BO list maintainance fix for TTM, removing an unused function and a
MAINTAINERS update.

----------------------------------------------------------------
Jernej Skrabec (1):
      MAINTAINERS: Update my e-mail

Jiapeng Chong (1):
      drm/vc4: remove unused function

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

xinhui pan (1):
      drm/ttm: Do not add non-system domain BO into swap list

 .mailmap                      |  1 +
 MAINTAINERS                   | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_vec.c |  6 ------
 3 files changed, 6 insertions(+), 11 deletions(-)

--atub3ne7a65whkcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJ0rUQAKCRDj7w1vZxhR
xbSAAQCcprbj/38dZNeAafooQD9MXgf/RFbA9Iim2VxGgU/AhwEA4bIheX4G76/K
hkWMhkriYyOjxNTg7I/eJRfoh2sh3Ag=
=fmKf
-----END PGP SIGNATURE-----

--atub3ne7a65whkcn--
