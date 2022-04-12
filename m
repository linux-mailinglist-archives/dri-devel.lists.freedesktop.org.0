Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B154FCE07
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803210EDD5;
	Tue, 12 Apr 2022 04:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2692E10EDD5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BBF5A320187F;
 Tue, 12 Apr 2022 00:35:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 00:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1649738114; x=1649824514; bh=YUiP9VQJuWMZb0paS2AkAyUb3
 wyC18anBgv4DgL7YiE=; b=nYKlpPg3Xy+h973SZniYhFzqf4O3EGcQXCT9SwJct
 Tsb4zzwg9tkT7Fr/1yN2PmLemhMA+EDeVLdvOFsWgGKNUaiQiwYfWbo9T1ND2X24
 j88iqZsHhRbVs52t1wL8jijctwCiG9Hw/ED64kikbsa790QU8r/J0s9eMjkabkyr
 a+hz7z/L9+NEm9DBMtxULCqrcfHGP5RqHA8FVDprC/2FLuFrIg0zFqeejXR+q0re
 KEv20QwfxsGNzyCK33lcZZSqSsj+cOapTJteMNQBNmBRC5qC9oIpRfSp47L9Sdb1
 P4DBC1I7yVX6zN0dDjWrfPdTrQTKtQR96G9PtJhP2NeSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1649738114; x=1649824514; bh=Y
 UiP9VQJuWMZb0paS2AkAyUb3wyC18anBgv4DgL7YiE=; b=g+VEyempk0wE1iy2o
 /hil7Og5CXsUkRrPVZIaQYx7n4dYaA1d1h4sxjG0gOxwwPfctIxx1JEJZuFP9upq
 cqRBSnLR9/q/OqLgHNpFZgHCiIgRCEbYM8T4AXt66/ydeGDZhfrrmOkyHDjZ4+Qc
 9+P0496/yJ5cFi3iA6fji/Bafy2Hot1xJhk2egUeZZPLFTF5aghn6AV1n9adFlL6
 59K5BN1Bpb26Mxwy8xAHug6DhXicA5JmejkS7VPcsDYsLa0KgAABbiFWZycL6nKa
 A3oyWhoGUlgyRqF4J0yL1M2lLjkyPp2GDFZKtz8r3pJQ0HUo2oWA2NicGQTxDVqp
 aA0pQ==
X-ME-Sender: <xms:gQFVYgbLJ9cMLEqGB_BN3LeTJKxZkNx9MQs69BcDADoSM8ZaU1MX9g>
 <xme:gQFVYrbx1gEH3mMTneBk3GHvqGAUsJLz5U0cT9paEwX9JLM1caHXXtxU79Aa0BKHW
 JfjknCGkdonJZW9GQ>
X-ME-Received: <xmr:gQFVYq_G1oT1LhlNkaDyj95hpAt2DZst3u_c7UqO9kw4c4qUc4r7r0QTQ0LdMNauPqiqY0Dx3TyTFkBlbPcM8UreHxSVcQ0B0QEUfdSidx9Rsu6MJZ0igqpIS4kNAAOl2oFbvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
 vedtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ggFVYqo-K7YE1NEEmNbc7Gi8OMzNHpQdpBr8M96xzEFl9d37gnza-g>
 <xmx:ggFVYroustfJwrYZaQ0bckg0sAYclD69azPuGdTkvAq6tcaGI4NZng>
 <xmx:ggFVYoSdN83C079qLa1bD7V6pO6Osy-lbiVb2w5ICFC2UHJiEJnPog>
 <xmx:ggFVYu1dldlD1_DnIKiT5KNL6jkC3tvsCNfOyeX0EKGYOOnr--PVBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:13 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/6] drm/sun4i: HDMI PHY cleanup/refactoring
Date: Mon, 11 Apr 2022 23:35:05 -0500
Message-Id: <20220412043512.49364-1-samuel@sholland.org>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series prepares the sun8i HDMI PHY driver for supporting the new
custom PHY in the Allwinner D1 SoC. No functional change intended here.

This series was tested on D1 and H3.


Samuel Holland (6):
  drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
  drm/sun4i: sun8i-hdmi-phy: Use devm_platform_ioremap_resource
  drm/sun4i: sun8i-hdmi-phy: Used device-managed clocks/resets
  drm/sun4i: sun8i-hdmi-phy: Support multiple custom PHY ops
  drm/sun4i: sun8i-hdmi-phy: Separate A83T and H3 PHY ops
  drm/sun4i: sun8i-hdmi-phy: Group PHY ops functions by generation

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |   9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 252 ++++++++++---------------
 2 files changed, 101 insertions(+), 160 deletions(-)

-- 
2.35.1

