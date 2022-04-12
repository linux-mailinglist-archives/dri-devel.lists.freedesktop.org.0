Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F14FCDEF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9E110EDE4;
	Tue, 12 Apr 2022 04:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4656110EDE4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D2620320187F;
 Tue, 12 Apr 2022 00:28:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Apr 2022 00:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737726; x=1649824126; bh=2F
 Fi/xkoVj6iwlrA1EObaufgO0Y0jToiRKkjZNAOp+c=; b=m4bG2Ug+7KDdednS35
 4LA9XNsqFQKms7P3ncOqO4fcv98E44h6oLgDPXFwO8ArrNngWHzlEY5nk3pIbdpT
 3GaBvKrwhsC7Mq3ILaT1shbbtbXFnjB6Jw6IuizNT+3nD5WlGjLcCCJ8ttpkQ2CG
 62jPZmZop1SE2EC3mCmcqnH/g1VBZX/EyCopN3gxJs2jTk/yS6yTXpL+DfB0Vlef
 JizlsCUCre9yHrjcIofW5HGdSmk6Ss7TZamed7VSX8TkUyns03LdFmv0IH5T1/4a
 6hI10jL8JuSUaoErq3g17Mb6z4xvqe6ilAUrdgByN8SrM0NIEKl0etQodDLsSF8x
 Q0xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737726; x=1649824126; bh=2FFi/xkoVj6iwlrA1EObaufgO0Y0jToiRKk
 jZNAOp+c=; b=EPvetHmtv8s0kR7CwaMEFJ3/5GHBI7DxFe1G/+ZeTJLbivBMFHP
 ma7xlHryQIlFK7bNwA9zLCYdDfjU54tr2GqWEkfj3qLJ2TdSWOOzoag4ShCRK3aq
 2Lo+P8lfKRlFkEyY+JIb/mY4PWLjSCay7u+SfCUW0vo5PwLjtBo2FDBQf8Fg3kKf
 XxSmek33xJfyOoPvtPpSGAfT+EfWrg0QqoSjlBUwdP0NjqRfllxheoJdwwsAxfHJ
 LGmL++Gw9GLc5cFnKOWEVMRuHX9Z+eCOjtLXGGG+iN/s3BHaaW6GTxZ8JC+hf+9C
 jgIEGfbinvxVmmpdvmNovRW663I3dG6DYsg==
X-ME-Sender: <xms:_v9UYhnAmngukD6y0ht6j4LdxUlrmU0JcpUDk0gpKeiZ_OvnoUitGQ>
 <xme:_v9UYs1cfG8bkLjCFCmFjkIDrn1_HIgNemq2qoNVf3y1iyJLU45rHymvs6fnWL2Cx
 a_fjsMcxViTJRFRIQ>
X-ME-Received: <xmr:_v9UYnoJsH3Tlu78SqRNokX0qYfgQioR1QDZuLoYG5W5w31zsCrijuG5nlI7HPg0Y2gp1eJky97CY_YD8Yym4quiYbhVspNxSN65wGotWYdCGtTUy31qWT9t8W6NxVxCQAJu8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:_v9UYhkR03m4i6V-Z2th-3z354Q9u6qy-v3Ks9NiSmRCXMYB-HSC9A>
 <xmx:_v9UYv2Bii23H2jkUjIZVxj6HIa5Oh0jf5YJ3z-R-rhYFUKuIjB-uQ>
 <xmx:_v9UYgtD5ZCPJPehcQUtEjclT3Vtj3RUwaihrIGX7xjFxtWlo2rKDA>
 <xmx:_v9UYosuTlTqUuhWJc2HMTH1ohEfOHz5wfTUsirvkdH7HeWy8CpNiw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:45 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 12/14] drm/sun4i: Add support for D1 TCON TOP
Date: Mon, 11 Apr 2022 23:28:04 -0500
Message-Id: <20220412042807.47519-13-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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

