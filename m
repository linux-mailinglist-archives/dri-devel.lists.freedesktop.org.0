Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014C194AB0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEEF6E952;
	Thu, 26 Mar 2020 21:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8ED6E138;
 Thu, 26 Mar 2020 13:04:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E8E14602;
 Thu, 26 Mar 2020 09:04:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 26 Mar 2020 09:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=ZNMe83bl6xj3BrLuPRMRlnPdfyYVllJeSb73Lo+Xzhw=; b=f4tM6tai
 3nsjSfVcTLTbAtwz7VsAG6mgpNfyjz9tt0Kvww+Gqc0EsBbdqzfivgLonk1kWdAW
 H8+iQa0RnxrnX4aPm2qrKuoToouQ9Er+qNMXg9c0qgF8wLigWuyFwFTlU82EoQqI
 jSqxJpvCqj83YqyRVy5HQRP41929+4aePFQJP79dYMADUji4EWAGx1+UAY4rrtST
 ZiNNiV2ES8MRFoQjjj+TSUhrzeXsJf4/6T1P/zenBqhoeSHB4BzdeDdh0FN1L9yz
 715fBBjT+sPCnJK0Jy7yAqDLWbD0b9+r+xHSWGVcHxTNY/qPZdIxmb9D8Nz4tFwQ
 Grt1eD4JTEUNTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ZNMe83bl6xj3BrLuPRMRlnPdfyYVl
 lJeSb73Lo+Xzhw=; b=toqRsBwvKLM5BA8/YUsJJnu/iaabMpx7/7nBQwsq6Na0/
 gZPiiON/3t7AJ20s2+mY3PyuDfqyIgLGDNsipAK120sv05Kv4mBwk2ETHS3DQgIM
 gEfGUC9/N2VSOW56u020NIH7BxVHGo7tJXQkEr6DywytOMHDNplR8YYWhQmG0VL0
 aIL8kiZgFJEzBegTTTsR+Bkn6CYNzblNfhFUiJk+VrrXIicL6Tl8DIxUOAbVTIer
 t8y5ZWowPOnetWMNlPhT2zAbXkloBxvz6JPzO1H8pnbW6uzo2HI0z/Vb6pB/vkHL
 WYMnd6m5tT5MgQGI8hDOsSZm4jABn5dp7VQudjAUw==
X-ME-Sender: <xms:a6h8Xn1xVLXWJtLRh0JjfcEPpTysBxCyVhXvqxuSnNafRNxMMzwbHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpe
 hfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
 gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:a6h8XhTeJejZFKvpMecpcHT8VrKn2PTuwd2Cq3ftMSiAacRA9_SXsQ>
 <xmx:a6h8XrsETiypMVgy_Aoz3KFVU3l96AlAmVgJ9P89qrqW_Vk5mMS_kQ>
 <xmx:a6h8XnILiVqVSb0aPv27G4gGwazflKWRtY9G19QPgPVvd0uPzMDSIA>
 <xmx:bKh8XrIlMmoZf2jRr28bkfq2m5VWVh4hvMDojhwUywq1XMb7kynRxRUDJVE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9F7E3280067;
 Thu, 26 Mar 2020 09:04:42 -0400 (EDT)
Date: Thu, 26 Mar 2020 14:04:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20200326130441.spdlhm3dlvo5jpi2@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Content-Type: multipart/mixed; boundary="===============1700781330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1700781330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="km4vu7u47d3kvioq"
Content-Disposition: inline


--km4vu7u47d3kvioq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's the first drm-misc-next-fixes PR for 5.7.

Thanks!
Maxime

drm-misc-next-fixes-2020-03-26:
Two main topics in that first drm-misc-next-fixes PR, first a revert of the
data-mapping property in the DT that turned out to be non-optimal (but
hasn't reached a stable release yet), and an improvement of a Kconfig help
text.
The following changes since commit 6afe6929964bca6847986d0507a555a041f07753:

  drm: Mark up racy check of drm_gem_object.handle_count (2020-03-16 10:31:35 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-03-26

for you to fetch changes up to d021d751c14752a0266865700f6f212fab40a18c:

  drm/panel-simple: drop use of data-mapping property (2020-03-25 21:59:22 +0100)

----------------------------------------------------------------
Two main topics in that first drm-misc-next-fixes PR, first a revert of the
data-mapping property in the DT that turned out to be non-optimal (but
hasn't reached a stable release yet), and an improvement of a Kconfig help
text.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text

Sam Ravnborg (2):
      dt-bindings: display: drop data-mapping from panel-dpi
      drm/panel-simple: drop use of data-mapping property

 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 10 ----------
 drivers/dma-buf/Kconfig                                       | 11 ++++++-----
 drivers/gpu/drm/panel/panel-simple.c                          | 11 -----------
 3 files changed, 6 insertions(+), 26 deletions(-)

--km4vu7u47d3kvioq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnyoaQAKCRDj7w1vZxhR
xbRWAP9i9GmwZR80Sk20fMdhNsBL3cLNpD1y3JhqJPo4Q7eZXQEAwn/4iT+BQXmx
PkNHFfFcuBeTypgt5mL0Pht2kSGUGAM=
=7eIr
-----END PGP SIGNATURE-----

--km4vu7u47d3kvioq--

--===============1700781330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1700781330==--
