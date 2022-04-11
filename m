Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD624FB300
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D03F10EB94;
	Mon, 11 Apr 2022 04:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1712F10EB85
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DEAF13201F43;
 Mon, 11 Apr 2022 00:34:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Apr 2022 00:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651688; x=1649738088; bh=N4
 owQ9/Cd3nixi2R9mF9dun/uhDiVSwowfRJ5Lt96QU=; b=wYGxErcydPByZPckw1
 FGP092owOmC8xV7Lj+e2uCLfXDitkHg1SrOMc6FBAGfvwpB1nPaggjKO3Hm1GoqC
 Oim9JbETWrQETP+nZaGD/Et9mBTb2H9o6eckU58aF5YrLZ9d7VYS+ns89H8vYcDC
 VTZQMNzU35JFCSGasNv19qimSoXNH7laIegMZqsgTEQuohuh0SuAYfjSoxkJPPpM
 9uCWmt7KTpPQeggSv9sPojfAg6yuIJXu4tl3Ck/i+kmmrA3o06M3u8LrKrsCagPH
 IJx0/Wg/ZOfcxLH0vLFAbBbeWmCOrVch+pPEY0o9j3QC5nur+EzkdmlTjAiXRIVx
 ldqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651688; x=1649738088; bh=N4owQ9/Cd3nixi2R9mF9dun/uhDiVSwowfR
 J5Lt96QU=; b=XaHpD8jZEslw3zz6Z+6Mnjw8n/TBt6U5gP370/WKVPYYJXGZp9C
 cyNJQjYnjLDyuxCQImaL4V1h4GAqpN0cceqjALV+DnGkUffNkqjefqOsfGu/P0WN
 II7vln8mfQqA/BCwjbdaMX0zNEBgK9Y/rCEni5dhNBBtRDFVA37Ru6heeLh3m1th
 Vq4sMTMt5qcAAVfCN9UuOo1nW9j/udenuRy7nKnq5APROG6CsT/MVna/8cEBcyny
 EinDdYoLuB6jBQp/AUP5pzuOnOl19xuHcpJAtSR0sSjWzA9mT49JLltaVc+kuC6U
 JgLqz2vj7jv8kmqvpY56PszijaJ2TGI1B7w==
X-ME-Sender: <xms:6K9TYqTk3WjS9aSTninm4CGzkFH6rz9F_4bmNwgulWs1-Al9Gde1MQ>
 <xme:6K9TYvzNC0nA_JKd4LnPPaNPYKKicfHhuZQdo8z6h85-DlKgcXvIFpJuAxLdiCI_L
 Kr-MHGtw3sEclNxdw>
X-ME-Received: <xmr:6K9TYn10xxhZXXHrRxPKiXZR1lm34dwOek2qIydVOmPrJun9aGNn4adgh50vsigmwDztNSoPM5KzLa8Lkw-T5idl_3QqyjzMIS6_tV7eHMuj4QPkAIng3iKYhu-nVLfzIqYF6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6K9TYmBTtM0RSC-UeXdlnxiYQouvctD7MHU8YaaEnzJgk9Ip7QRZ6Q>
 <xmx:6K9TYjiEc_Ht3i06sJMMEpRfPED4mIjPwpKtiJYYlhMvGRqTYJ7j9w>
 <xmx:6K9TYio4gIsLVRxwrJN5tPP3flw0HTgGUHy1sX2fqFmYRkLXMWpCpg>
 <xmx:6K9TYmqpnN1UnVSEXNJEZRQ5UpbVgQxG1vJPuU7bIaJKTUNLdj0Nqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 07/10] drm/sun4i: Add support for D1 mixers
Date: Sun, 10 Apr 2022 23:34:19 -0500
Message-Id: <20220411043423.37333-8-samuel@sholland.org>
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

D1 has a display engine with the usual pair of mixers, albeit with
relatively few layers. In fact, D1 appears to be the first SoC to have
a mixer without any UI layers. Add support for these new variants.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_mixer.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f5e8aeaa3cdf..49c0d17c6f0a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -585,6 +585,24 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.mod_rate = 150000000,
 };
 
+static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
+	.ccsc		= 2,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.scanline_yuv	= 2048,
+	.ui_num		= 1,
+	.vi_num		= 1,
+};
+
+static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
+	.ccsc		= 1,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x1,
+	.scanline_yuv	= 1024,
+	.ui_num		= 0,
+	.vi_num		= 1,
+};
+
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= 0,
 	.mod_rate	= 297000000,
@@ -638,6 +656,14 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
 	},
+	{
+		.compatible = "allwinner,sun20i-d1-de2-mixer-0",
+		.data = &sun20i_d1_mixer0_cfg,
+	},
+	{
+		.compatible = "allwinner,sun20i-d1-de2-mixer-1",
+		.data = &sun20i_d1_mixer1_cfg,
+	},
 	{
 		.compatible = "allwinner,sun50i-a64-de2-mixer-0",
 		.data = &sun50i_a64_mixer0_cfg,
-- 
2.35.1

