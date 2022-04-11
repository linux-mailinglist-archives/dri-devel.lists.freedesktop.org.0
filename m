Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9C4FB2FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5710EB85;
	Mon, 11 Apr 2022 04:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929710EB85
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E7D4D3200D78;
 Mon, 11 Apr 2022 00:34:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Apr 2022 00:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1649651666; x=1649738066; bh=UADj43RFHZwY34uGNWFBbRbPs
 ti5GL31jj1csV2jv00=; b=d9sIXm3fZjepfsUk1yqvaRFb2lrDthNzo/KLQoROC
 6o5jt28hQBuvSMy76jkX+CMUOj0iLNAaSZhC4eL5jarzZ2/xaAe+QcN1l1dnY2Z+
 ZygA/KEdHYZ9Y/lGrFxud+aQAxGYjiEXtmVvu4/p+YykyOi9MZfodx9HX/vSvldg
 ttPuQ+mNOIO0xCzncr5NcUuiksAvs1SNceQpFsuTZ1DbotOAbQ+Mml4ko0RjEb6j
 JCYnix5fJIiKmUwDG4T2gQdQuve4RKUQ6N74jfL6OnGeGlQ+gP4Dtpt9/BPxFTa8
 BxHSENmfaWg7qZK6bxiI5VYFQi9foUogDAofopK1PCwQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1649651666; x=1649738066; bh=U
 ADj43RFHZwY34uGNWFBbRbPsti5GL31jj1csV2jv00=; b=YYz7e9VAgM1dCGVTV
 /uK6eUgwClFPFYcNmNkwRyn7gKopKOYIAcZTFtS/tGm7uI4Nh+1Fy3Y+0RoD1qDq
 dRhTs3ja8m8jutojKg+GLZPUtfdhIsv35IVcWn8vSbjDGmw119+gSe7SOqexonQn
 zLcAsE8vSBNXfj4nQV1uZlIXB1TnnidSKcCzSNnSh4+IpSaf5vGmJNRBH7xoc53I
 5R5/b2p5xvRnEWJsteszHCj1B0LeuaUVLNmuCvu9WWaUcA+1tX8P8XuCcbpSdzH2
 26KSkkYKGigk9UTcbBe0uXV5rHmEcK15LnUzeXoetgmk/4SaBiFk8MVvqkw8wH6I
 8rUMQ==
X-ME-Sender: <xms:0a9TYv-p6Q5nuleDPFcP87OHhxG2kU9zyfAs8LPWhEjD4OZS8FUXTQ>
 <xme:0a9TYruXQmmlRW4rKYGRqO-hFy-mWInFpsWpp_hK6aw58jwQtR94jaMTYW3AFQ7Is
 SzL8LBqMZ9wQGIYPw>
X-ME-Received: <xmr:0a9TYtD0cKdslGAxW1FwNE8Bv-SZsr7aaEmKUaJl4_IHp1-bB1JYbibt0G4HHqFuS2snWPgbtQR36bP2L8KZdNuahAgflwXvnnHzl-rDAeYGnkzkFzfpf074dOW4wwIg5atnmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
 vedtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:0a9TYreIrhsxN46nReyzw4kSGGcCxNwQ7RKO5eK8fzGiDXg6r4z7_w>
 <xmx:0a9TYkNkHI9965TaJKmaUG9kmGG7VwOfxO3ijqEkhusPmAtaKN33NA>
 <xmx:0a9TYtl-1XkY6jNrt8ECdRTW2Tv2FpLcshbeNEJKMHUj4U6529nPtQ>
 <xmx:0q9TYtn5HLMATeVFiRfwfR27Ml3yplO4ZtHnYUk8p9Ojiw_5enLb1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:24 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/10] drm/sun4i: Allwinner D1 Display Engine 2.0 Support
Date: Sun, 10 Apr 2022 23:34:12 -0500
Message-Id: <20220411043423.37333-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds binding and driver support for Display Engine 2.0
variant found in the Allwinner D1.

So far it has only been tested with HDMI. I will be sending the HDMI
support series separately, because the hardware comes with a brand new
custom HDMI PHY, which requires some refactoring to support cleanly.


Samuel Holland (10):
  dt-bindings: display: Separate clock item lists by compatible
  dt-bindings: display: Add D1 display engine compatibles
  drm/sun4i: Remove obsolete references to PHYS_OFFSET
  drm/sun4i: Allow building the driver on RISC-V
  drm/sun4i: csc: Add support for the new MMIO layout
  drm/sun4i: Allow VI layers to be primary planes
  drm/sun4i: Add support for D1 mixers
  drm/sun4i: Add support for D1 TCON TOP
  drm/sun4i: Add support for D1 TCONs
  drm/sun4i: Add compatible for D1 display engine

 .../allwinner,sun4i-a10-display-engine.yaml   |   1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |   2 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   2 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 145 ++++++++++++------
 drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |   3 -
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   8 +
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   3 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  26 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |   6 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  36 ++++-
 14 files changed, 196 insertions(+), 55 deletions(-)

-- 
2.35.1

