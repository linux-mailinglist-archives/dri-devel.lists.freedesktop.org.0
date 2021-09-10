Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86103406CB1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190E46E9F2;
	Fri, 10 Sep 2021 13:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A406E9F2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:09:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0F1042B012A6;
 Fri, 10 Sep 2021 09:09:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 10 Sep 2021 09:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=Q9z3lLEAaevDUD49j6RHOkYod/
 ot7jQUn3ZBL3TnwVg=; b=ULkDc5ydZ0lzCerUrWcfR4AsM6ZC1zEKmQs/Cmq/Yf
 7QE/q4bDWap99ZjPxMSbCmcChg9AXBfF0i7rKa6LHQpqb5lr6ziPlAOzIEwc4Tat
 pRPDZG4EUCjdWEjGHspYRLbGE9a+jdxH5EtnZPxAOYrrRpPDlijOBEesdyoSPqe3
 C44aDhsmpTRjT4ORZ/heldngD++d0/PSZcMAdi26L4m99njTlbp3Xfu7kme5vS0z
 IJ7OumUcDiGYrViYGdoGbPUm66rMfer6ZEFHQComptlqNOhwHBaP9Oh3UVBMEEfm
 YLCT9MipuTgoodb8rgos5kcQRRATsgKpqZJ3pZlivQDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q9z3lL
 EAaevDUD49j6RHOkYod/ot7jQUn3ZBL3TnwVg=; b=poTjO7yzoGlZJfn7uixG7A
 wqIi5QyVNexwTteJYYTMx6A+6IqdFpBfuJbmn3BYZTJ42Odsudr9of4eplg339E3
 /CQK3JzyMidtVkRcXAydOsDoigvU+WzYVIofs67Jf6Hrvx+WC4UkE7FEsjYs6fQv
 k7RBU0RWbfx8MBNmsgsKXyeKyEW4kBFaQ4wyCJQZ5kPinGpHnpik8fRC7/0YukGh
 8UFpdvj09IVEfqC5UsZVnOBCX3WVAnUVzSC8O9wAygPeXOtbfYYGwZEZ6MAhWSEv
 NoXCNL78jWunKAf613B3nCIa4h+OsR0iGGsANDCT5205yrWkiY2d4EhOqiDQlnQw
 ==
X-ME-Sender: <xms:F1k7YaDmnrZD1x6L12sAoHWy-iGbb9u4LarWKYN0x_68bWMsnnZ0dw>
 <xme:F1k7YUgOUihzf3babzsKEOv-UMCY8uCP7-nKaOUy0Pvx2tfizanUecSabkDn7__Wq
 gxXyhPqHjyQqa59UeQ>
X-ME-Received: <xmr:F1k7YdkchXVBbSPszlMV2CIZ0U2_udmhlmVe-4tXHNeukxBtCVULbdFvhcVRQv71s0m-P_fvjSzYcuB_YNFzOyPRt9EuoRoJbo9l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F1k7YYyqh6zOWlwwfJy71W6uddqcim9gnkSXmGNBzKqNkQb0pBac0A>
 <xmx:F1k7YfQpUTbekC6uvwlVzUWr9XacTpM1AZ3xvji85q4cu1b_SVUmuQ>
 <xmx:F1k7YTaxFtKCaFeHkiUQL6t2PtcD5PqZ-qy-Rx5BGDj0N9fnMALTOA>
 <xmx:Glk7YUIh5n_VfkLMxzX4ctJKsnogVNYlTB-rXXLk_xMxuvQaAcZ0JVJozAo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 09:09:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/bridge: Create a function to abstract panels away
Date: Fri, 10 Sep 2021 15:09:38 +0200
Message-Id: <20210910130941.1740182-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series used to be part of the DSI probe order series, but got removed=
=0D
since it wasn't useful there anymore.=0D
=0D
However, I still believe there is value in moving towards merging bridges a=
nd=0D
panels by only making encoder (or upstream bridges) manipulate bridges.=0D
=0D
The first patch creates a new helper that does just this by looking for a=0D
bridge and a panel, and if a panel is found create a panel_bridge to return=
=0D
that bridge instead.=0D
=0D
The next two patches convert the vc4 encoders to use it.=0D
=0D
If it's accepted, I plan on converting all the relevant users over time.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (3):=0D
  drm/bridge: Add a function to abstract away panels=0D
  drm/vc4: dpi: Switch to devm_drm_of_get_bridge=0D
  drm/vc4: dsi: Switch to devm_drm_of_get_bridge=0D
=0D
 drivers/gpu/drm/drm_bridge.c  | 42 +++++++++++++++++++++++++++++++----=0D
 drivers/gpu/drm/drm_of.c      |  3 +++=0D
 drivers/gpu/drm/vc4/vc4_dpi.c | 15 ++++---------=0D
 drivers/gpu/drm/vc4/vc4_drv.c |  2 ++=0D
 drivers/gpu/drm/vc4/vc4_dsi.c | 28 ++++-------------------=0D
 include/drm/drm_bridge.h      |  2 ++=0D
 6 files changed, 53 insertions(+), 39 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
