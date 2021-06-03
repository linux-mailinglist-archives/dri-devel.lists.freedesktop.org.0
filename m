Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BC399D32
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7016F45B;
	Thu,  3 Jun 2021 08:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941D6F45A;
 Thu,  3 Jun 2021 08:53:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EB6C2580D7B;
 Thu,  3 Jun 2021 04:53:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Jun 2021 04:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=TJi4Qc14cGq/RjgkkyPquANWhYFO9dnl6BqwyNpPIMI=; b=o13ObOTI
 3SSGgrdcbKbDCqkV29FZQMjKDCKyPCz33Dx57wlwKC9OJeEz4O6nVVTsidnHpymT
 tqv3N+Grrt0ccCbFLqCSjqX6pZEc+ugn+jtpoJh8SEBo6OjGfhLYUjaRONGK9see
 07M/+qjNewJMY5udh/QiyHZ1Z4AiD5mxvDwFPMYYGx6jYrWIdPAh0QDYHc3nRS/t
 ElBI1IV8oZj8Nsu/yTldi5MoWORyXCt7bUEbTIgUGRCuLyMtO4YIHiHc+C5hppb6
 qs9RwMzYr6OStH+M8lSaWXKYVitX6I2GH1va1JKbVj6tb/2HUkAfV12c3Fyg2DRY
 GyBhYAdij6HN6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=TJi4Qc14cGq/RjgkkyPquANWhYFO9
 dnl6BqwyNpPIMI=; b=uaqB9wwUxAm78rHqCVgIFIcWoMfQf9s7/EeLl8618GuyH
 zLjYmYJGNwpzYGEzHhWWvKWwqCgkL+0MuODaH15rJQ7nEj/XAL5zpb7wNExk9sO6
 31FtN9J8vmqHFIDKJlaJYOBotjiR61p0nC5BrK7l2PNfUMHBeUoeMYZxrUMQnjGh
 EGBpGfJ14as77Hc0mnmrdcW3CqQHuA0MoEX19cd7EhYcZINatqLX8OpiAxlPVIgw
 otxeUhfKHPfmPk8LYceACWm765gFo+jR18Aupa8/JddzbPvlhHSE4nCw+RTKcWxY
 ecGshlh/KUTXIJUE3lLEdV5QZXNuNSjuSLOaa5EoA==
X-ME-Sender: <xms:g5i4YKs78bbcZDPrk1LOVzHFZojiG9J4WRBvdh1OxUyW2zb6rpaFvw>
 <xme:g5i4YPcl7DOxSPVimnu1yaUkd-CxKn6g_keXik8u5ggEvxVloAshp0v-HEwBFimnF
 RoA8J2Mb0nvjlKH-sk>
X-ME-Received: <xmr:g5i4YFxsvG7YYMzVQQ54q2RmLpeL4Cwo9sLC0lcv2Div-hM9d490Ei-lpq6K5nPwddFA7NfgM-FV024UJUaokZL1NMWA1OKJxMev>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:g5i4YFM3SGHlNQ3eaQAs1ZVRphSEVX8VnLnmC4GqNgsiPh55Ld3Urg>
 <xmx:g5i4YK_kO4Sh_2gMDZC7F_xRBDDtf_LWxqlBdaEQdyRvnXTHdafuiw>
 <xmx:g5i4YNU0MDGr3XTZLFATkDyVMtLIdbPYv2ftliXcre4gVzyqU6IWjQ>
 <xmx:hJi4YNbSdZLWh-h_SzEAte856n7f4hd5fiExbVYGKKsjlNjylfp43Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 04:53:23 -0400 (EDT)
Date: Thu, 3 Jun 2021 10:53:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20210603085321.l5l6flslj632yqse@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="omzrsib4ufkod6cu"
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


--omzrsib4ufkod6cu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2021-06-03:
One fix for a fb_defio breakage
The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-06-03

for you to fetch changes up to 0b78f8bcf4951af30b0ae83ea4fad27d641ab617:

  Revert "fb_defio: Remove custom address_space_operations" (2021-06-01 17:38:40 +0200)

----------------------------------------------------------------
One fix for a fb_defio breakage

----------------------------------------------------------------
Matthew Wilcox (1):
      Revert "fb_defio: Remove custom address_space_operations"

 drivers/video/fbdev/core/fb_defio.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c    |  4 ++++
 include/linux/fb.h                  |  3 +++
 3 files changed, 42 insertions(+)

--omzrsib4ufkod6cu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLiYgQAKCRDj7w1vZxhR
xQHXAP0RI/59Q85f+7f78/gbQ3zn5TGoxwFYIWtQ9D+7VtTLYAD/U65JQZYCLSIG
gg3HXOjjZyxp6TJz5xsNOIWNpLZU3gU=
=KU5p
-----END PGP SIGNATURE-----

--omzrsib4ufkod6cu--
