Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E42CE9B8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09D6E134;
	Fri,  4 Dec 2020 08:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C06EB6E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 25BFB58041B;
 Thu,  3 Dec 2020 08:25:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Dec 2020 08:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=geZUeybIHQTuI
 SdZ3qUEkr2KlwzlIkbS5IzecxF6hSU=; b=rFDF1ec6N0hY9L7/SEk+mVamVvPcP
 VuXaPN1ngCmA6y92MlQ0DCtLOjLpWhXtFeZMnW6reWiRO1LGLhEjgdiDVACG+bB2
 hAseiIRx6GWKtZShMYBFN97gcuE3oEBtzp2nrpR0W5GrErgCjc/KqLx6kZIiLzUh
 kEUzOt2j1wDy2VbJtg7O6asutRB5H13LRjKB18XuSjwgvArxo2jUm/QWkF1qfwft
 Ibm6+FUAht+sCgj16N7e/s1uSCy2HVSQgqXIESGcsbOj1F19FMyYNi56KxtH1GLR
 SURei3JFglyfT3qIH3V4L0FC31KAaxnxRxq1dy3oXzJsOxX7GwWKE6L2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=geZUeybIHQTuISdZ3qUEkr2KlwzlIkbS5IzecxF6hSU=; b=CT47VD90
 MDnAbpGuwzBg3bX2eJO+dIGtZa9KDa3axBaT5NrLu+/8x/jbE4a1/kRVC1Q4Y9hs
 6yDS+q2D5ENyzoZQTLfoxkx4MP86RJEsEUUMWsXz1DHatnKPYLMdL3bQXO3MkyXc
 /DS4Gp7/EI4/vA2Crqx8vxA1I0InOuRjfQKomO19M3pTlQuNOwydCfANe0xA9XQd
 JrAk0jA8tYpJ1jzagj4Op3ONNWJT2i2l3KiD2xSkHy6f8gvlT2wHC0iTQV0p4RXZ
 yF0xMoIxznSglGr9Sy6m+qY4n99/nhOpCpKnIA5s4rLuHx/WiMkm0X1HZpG89W5l
 EVhFN/q/WhyNtg==
X-ME-Sender: <xms:Y-fIXwOfHQSuoXsktD1qwi8EHQC2HoDxlNYEYyVmzHVcgmC6a5jrnA>
 <xme:Y-fIX_sBZiuR41a0-QC5Cze2Z-q0BDkEW7rTJMNgAfxkPj7y8jTfo7ho3rYI9uDad
 vxYQHEZHuY8XNbNZk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y-fIX195Oej4jQbURHtSpheVq1-tuKfyCwqoXe7H0mMmke3RhbXp7w>
 <xmx:Y-fIX7GeMitmZ7qDM3m-YJbUNUgvCgor6PVc-FG9D8I3j21-CNo_MA>
 <xmx:Y-fIX8RWA0Sp-ZnGI3Jj-3uCYBa7ivkJKrXeTDD4l0mnoGn5ATrpmQ>
 <xmx:Y-fIX5hbfZRaTrWowudjnwhdJHe4iZJXheXWWyW63zgBhPwJeZkilA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA00324005D;
 Thu,  3 Dec 2020 08:25:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 7/8] drm/vc4: dsi: Add configuration for BCM2711 DSI1
Date: Thu,  3 Dec 2020 14:25:42 +0100
Message-Id: <20201203132543.861591-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

BCM2711 DSI1 doesn't have the issue with the ARM not being
able to write to the registers, therefore remove the DMA
workaround for that compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 82162900e351..a55256ed0955 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1324,6 +1324,13 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
 };
 
+static const struct vc4_dsi_variant bcm2711_dsi1_variant = {
+	.port			= 1,
+	.debugfs_name		= "dsi1_regs",
+	.regs			= dsi1_regs,
+	.nregs			= ARRAY_SIZE(dsi1_regs),
+};
+
 static const struct vc4_dsi_variant bcm2835_dsi0_variant = {
 	.port			= 0,
 	.debugfs_name		= "dsi0_regs",
@@ -1340,6 +1347,7 @@ static const struct vc4_dsi_variant bcm2835_dsi1_variant = {
 };
 
 static const struct of_device_id vc4_dsi_dt_match[] = {
+	{ .compatible = "brcm,bcm2711-dsi1", &bcm2711_dsi1_variant },
 	{ .compatible = "brcm,bcm2835-dsi0", &bcm2835_dsi0_variant },
 	{ .compatible = "brcm,bcm2835-dsi1", &bcm2835_dsi1_variant },
 	{}
@@ -1524,8 +1532,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	/* DSI1 has a broken AXI slave that doesn't respond to writes
-	 * from the ARM.  It does handle writes from the DMA engine,
+	/* DSI1 on BCM2835/6/7 has a broken AXI slave that doesn't respond to
+	 * writes from the ARM.  It does handle writes from the DMA engine,
 	 * so set up a channel for talking to it.
 	 */
 	if (dsi->variant->broken_axi_workaround) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
