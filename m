Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306D4FB302
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437ED10EB9E;
	Mon, 11 Apr 2022 04:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD9710EB66
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DEC753201F1D;
 Mon, 11 Apr 2022 00:34:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Apr 2022 00:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651691; x=1649738091; bh=Ee
 ELMxOcuMd5dlC9drLgSMkL5eOSmt8s+z1boXPmSNc=; b=m6OCHnmdReMA76HGcG
 cR/UcV6TMt1z4KhyALb9tksg1Cjy+WutX1c/zr6AvTsGYwqBLvMPCVqFv0bxtsoL
 PSCcQEnK4Xk94bF8HNETEunn+Bnzq55R3gYn+Ba20Zt7GXWdxpRuyup8JYo9CZiB
 v8WJ6MOUBBdMDyGPo09t4s/2s7RYiGJDb0fKeHSOK5BI6sBaJYG0CZS+IeoWdY5t
 Af7aR6xmXOPN99RYXWt76Iktvdwdywm28858BnI8OeI3K7M2KijnPSt6BIEAOCFg
 dYfJl8PlfQZhiox0X5RQWhWJhHdZkfNPnYYD8zb1SuhTCA1EFwmriMPZP1XOsQjj
 YWbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651691; x=1649738091; bh=EeELMxOcuMd5dlC9drLgSMkL5eOSmt8s+z1
 boXPmSNc=; b=jPP1bVbetBskG5AwBjCXXxhJLcZVHk82ErXlQw77VE9G1Jq0vEs
 6jFOl3RmwAwWf0oeP5ezji7vjd59AVqESYpBvIx1LmaDlGMlGuyVALxWDu5dPHEd
 tEW6bQSdWk8iFlmRvI2djepVS2isdTEM2HpyFlELWm/CP10mrB6AkoERPW4pMY88
 h5Gczv73DScgiUY9y0hsDqGDULmZvZIwGTPsIOWZ4pCrlL/ZvhRpyTj7/KeYFyYp
 wsaEdgMAM8BGztWQe1GS7V1669BCCl96AEw46opqTnEQ9kFguX+O/mh/11YF8DJ4
 3UqD/5DXzM9HPihjw0+ofZmMDUNxumP8r4g==
X-ME-Sender: <xms:669TYql_CcdXGLO1t0AQYcDVioLiD-1AM78-lAEZaAl6ofdTpq3N5A>
 <xme:669TYh1Nf81PFGiThulbidFSTjr6ejDHQ1anwNmQ7GQ57W1LmMUd7H8WySaXLEIIu
 WUflawwnz5ZoCDQNw>
X-ME-Received: <xmr:669TYoo7mBIs9VxiRGPRnkRxD-KEtSofIdDa-8YihWvCO8Tx7_mT_d01e6AuQ_e4YKzKIqER7ctJ48K7pzOwIB6R3XTmecbdCpUoBX8QyxXezvIVU_Q8q1ODOradBJfJmpf78g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:669TYunBaoSf7RlEn3n15t83e5VV-z5qU2r5BlHDTLbWRh0IwK4Dqw>
 <xmx:669TYo2qu1hfiMKsusI8hIONcf2TwJ5wTYOCauHflMg7cY5EPyJt-Q>
 <xmx:669TYlvoBGS2eKmKanMQ9RK1NLY1aIMpmhahQoMcosZmdzV5ZQuy0Q>
 <xmx:669TYtvH4RY_jScszvkiK2Cagxc5plSjSeosFPI4ISxaB-drDoYMDw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 08/10] drm/sun4i: Add support for D1 TCON TOP
Date: Sun, 10 Apr 2022 23:34:20 -0500
Message-Id: <20220411043423.37333-9-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411043423.37333-1-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
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

D1 has a TCON TOP with TCON TV0 and DSI, but no TCON TV1. This puts the
DSI clock name at index 1 in clock-output-names. Support this by only
incrementing the index for clocks that are actually supported.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 1b9b8b48f4a7..da97682b6835 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -189,22 +189,23 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * if TVE is active on each TCON TV. If it is, mux should be switched
 	 * to TVE clock parent.
 	 */
+	i = 0;
 	clk_data->hws[CLK_TCON_TOP_TV0] =
 		sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
 					     &tcon_top->reg_lock,
-					     TCON_TOP_TCON_TV0_GATE, 0);
+					     TCON_TOP_TCON_TV0_GATE, i++);
 
 	if (quirks->has_tcon_tv1)
 		clk_data->hws[CLK_TCON_TOP_TV1] =
 			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_TV1_GATE, 1);
+						     TCON_TOP_TCON_TV1_GATE, i++);
 
 	if (quirks->has_dsi)
 		clk_data->hws[CLK_TCON_TOP_DSI] =
 			sun8i_tcon_top_register_gate(dev, "dsi", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_DSI_GATE, 2);
+						     TCON_TOP_TCON_DSI_GATE, i++);
 
 	for (i = 0; i < CLK_NUM; i++)
 		if (IS_ERR(clk_data->hws[i])) {
@@ -272,6 +273,10 @@ static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
 	.has_dsi	= true,
 };
 
+static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
+	.has_dsi	= true,
+};
+
 static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	/* Nothing special */
 };
@@ -282,6 +287,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun8i-r40-tcon-top",
 		.data = &sun8i_r40_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun20i-d1-tcon-top",
+		.data = &sun20i_d1_tcon_top_quirks
+	},
 	{
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks
-- 
2.35.1

