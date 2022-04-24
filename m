Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A883050D351
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D9510FC5F;
	Sun, 24 Apr 2022 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9910FC5F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E9935C00D0;
 Sun, 24 Apr 2022 12:26:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 24 Apr 2022 12:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817618; x=1650904018; bh=2F
 Fi/xkoVj6iwlrA1EObaufgO0Y0jToiRKkjZNAOp+c=; b=jTc4qXG4yQKZ1WF9Gn
 R07utbzOJAZatX33Gy9kFgYYzY5yIzdMyYLjm1ayPTVHp99zdlbevmBsEjJU4rlC
 Yp2LFUPTYykjhLNW/nFI29UPG/7eZRM0enUazQoz0QIgVL0ONbhbppzclMRhzAIQ
 g0Dv5c5JcMI4CsqzWxrZ43yRSy0A7ChrNNolyE6JFq1+KTd4i/KChgEqjb2gHnl/
 Y/cDqKvscJIISqsNaUWRHFbdNTFauxPiq4ly7HAvHDsAzaiHJ48flpZvjhLiTDuT
 Kdl08m4i5rACmERSnQJxCP3xm5zE4FsKJsz9fkYUoDcvhCSyjKJWRCkfx/kPKUix
 b2ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817618; x=1650904018; bh=2FFi/xkoVj6iwlrA1EObaufgO0Y0jToiRKk
 jZNAOp+c=; b=UGga3K3DMlIU2u+sHQmZOGr7vY3No+13DlhU5cZdZGyOEXNp3Pp
 K25VsMFLwM2AD+OihomHY9U1OPdiyRiUdQzFClui4psPK3zGbFs16JjsR/945sHe
 AR6ZU0+qqyyE1b+O4UiCQp6dSJ4kzcJBBSViXtVMcj+qwmUGHfHC6yHj+cENw8/E
 9ZtIMCEw8TWXzT3Y4VTGxyLHdtdOw0HnXvEXvs1+SADuGvP2GhoxeallT9vNlLvF
 uMPE5GStkzaGLu1Fg5cstjBeYOVF1YfAz4RZQQ/wlAsBF7Iytm0tiHf7UBc8KIf+
 Gj+/UBmrigNl8pioG004aF0ixbod9iOC7JA==
X-ME-Sender: <xms:UnplYr6wEC-ZlHM9g09oqtdMUuo9Zute0X9hrMBbrGG-igyu2c4k9g>
 <xme:UnplYg4RBARiMRvsJAiHk8jNjjwA41oEB4L5qyQN8MbMqJuBivS5lkK8JDSzxmG95
 UNm-RtKpvDzApMzUg>
X-ME-Received: <xmr:UnplYicvVjFHTVPGihGVAAG_-Zhu2vf33b2pEJV0FNMz8D_xGvSxba86g7g96yxZdG3BU3MWysh7dp2TvHM2zdWXDC8FNyegVvl649CWSK1lSBTGBACbN1AFZmcqzsHlU8MqiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UnplYsKJ5v6WEg6XvYLu_mMj2cAzXbj8Bc9QP4FvvxFiykESG8WrMg>
 <xmx:UnplYvK3CB9yU0YyAR3BqoARtaZekLQzTckkbs0CuXkCXKkGwjyAcQ>
 <xmx:UnplYlxa-Puuo9yqqeVGEOPgMcd4jQVJSC1uZ3ZyeoizGaUKEAOMkA>
 <xmx:UnplYhy8CZuS8sx4AGOrvt3GQ56kGXQ5qGuc727c-KJAQ6bnanYbPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:57 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 12/14] drm/sun4i: Add support for D1 TCON TOP
Date: Sun, 24 Apr 2022 11:26:30 -0500
Message-Id: <20220424162633.12369-13-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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

(no changes since v1)

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

