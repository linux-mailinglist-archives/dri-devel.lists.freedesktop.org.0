Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E875E6AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6510E241;
	Mon, 24 Jul 2023 01:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F5D10E241
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 01:22:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD4D360F33;
 Mon, 24 Jul 2023 01:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028D1C433C7;
 Mon, 24 Jul 2023 01:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161727;
 bh=3EMk2o0Q0xBharwdoEGgunrjb5LYrw1JPMEvYbiz/5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iuQNGc/XdMB1X6qh6tOW/r9nHUuFn8ic7dSsKI9fg/loM/4WDKJJhLhfpvfvLNLD8
 YA3V30ecTuy8YAxxAd/mSS3Wam4vJT1NPBmq5JzhCSbr0CVDrQHzz7h4JLxgR+vGAP
 iGUtO2LM1O6ViRJLKj0c8fCtOyscDpXHyKYWxuJ9aFnKQ5NfHTofQIaKjLh4d0YvPJ
 S2QAEDQJ0nrr/MtTebX6qhnhG2vJxjS1rswGrQfEXwGgGot4ocOpLIDtcxiqcIrW5w
 gN0AzT293V+y0To8nvbArlBhf8HlQAWxHzzrw2ZSGqP44tgmYTX7LkGYfYnLu45rKV
 fp/qjV0Fow4Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/41] drm: rcar-du: remove R-Car H3 ES1.*
 workarounds
Date: Sun, 23 Jul 2023 21:20:45 -0400
Message-Id: <20230724012118.2316073-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

[ Upstream commit 2da4b728f994a1f9189a8066b0be90b615768764 ]

R-Car H3 ES1.* was only available to an internal development group and
needed a lot of quirks and workarounds. These become a maintenance
burden now, so our development group decided to remove upstream support
for this SoC and prevent booting it. Public users only have ES2 onwards.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 37 ++------------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 48 --------------------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  2 --
 drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 +-
 4 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b7dd59fe119e6..9edb5edb2bad9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -223,20 +223,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		 * DU channels that have a display PLL can't use the internal
 		 * system clock, and have no internal clock divider.
 		 */
-
-		/*
-		 * The H3 ES1.x exhibits dot clock duty cycle stability issues.
-		 * We can work around them by configuring the DPLL to twice the
-		 * desired frequency, coupled with a /2 post-divider. Restrict
-		 * the workaround to H3 ES1.x as ES2.0 and all other SoCs have
-		 * no post-divider when a display PLL is present (as shown by
-		 * the workaround breaking HDMI output on M3-W during testing).
-		 */
-		if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY) {
-			target *= 2;
-			div = 1;
-		}
-
 		extclk = clk_get_rate(rcrtc->extclock);
 		rcar_du_dpll_divider(rcrtc, &dpll, extclk, target);
 
@@ -245,30 +231,13 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
 		       | DPLLCR_STBY;
 
-		if (rcrtc->index == 1) {
+		if (rcrtc->index == 1)
 			dpllcr |= DPLLCR_PLCS1
 			       |  DPLLCR_INCS_DOTCLKIN1;
-		} else {
-			dpllcr |= DPLLCR_PLCS0_PLL
+		else
+			dpllcr |= DPLLCR_PLCS0
 			       |  DPLLCR_INCS_DOTCLKIN0;
 
-			/*
-			 * On ES2.x we have a single mux controlled via bit 21,
-			 * which selects between DCLKIN source (bit 21 = 0) and
-			 * a PLL source (bit 21 = 1), where the PLL is always
-			 * PLL1.
-			 *
-			 * On ES1.x we have an additional mux, controlled
-			 * via bit 20, for choosing between PLL0 (bit 20 = 0)
-			 * and PLL1 (bit 20 = 1). We always want to use PLL1,
-			 * so on ES1.x, in addition to setting bit 21, we need
-			 * to set the bit 20.
-			 */
-
-			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
-				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1;
-		}
-
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
 		escr = ESCR_DCLKSEL_DCLKIN | div;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 6381578c4db58..bd7003d6e0753 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
-#include <linux/sys_soc.h>
 #include <linux/wait.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -387,43 +386,6 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
-static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
-	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ
-		  | RCAR_DU_FEATURE_CRTC_CLOCK
-		  | RCAR_DU_FEATURE_VSP1_SOURCE
-		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
-	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
-		| RCAR_DU_QUIRK_H3_ES1_PLL,
-	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
-	.routes = {
-		/*
-		 * R8A7795 has one RGB output, two HDMI outputs and one
-		 * LVDS output.
-		 */
-		[RCAR_DU_OUTPUT_DPAD0] = {
-			.possible_crtcs = BIT(3),
-			.port = 0,
-		},
-		[RCAR_DU_OUTPUT_HDMI0] = {
-			.possible_crtcs = BIT(1),
-			.port = 1,
-		},
-		[RCAR_DU_OUTPUT_HDMI1] = {
-			.possible_crtcs = BIT(2),
-			.port = 2,
-		},
-		[RCAR_DU_OUTPUT_LVDS0] = {
-			.possible_crtcs = BIT(0),
-			.port = 3,
-		},
-	},
-	.num_lvds = 1,
-	.num_rpf = 5,
-	.dpll_mask =  BIT(2) | BIT(1),
-};
-
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
@@ -592,11 +554,6 @@ static const struct of_device_id rcar_du_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
-static const struct soc_device_attribute rcar_du_soc_table[] = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rcar_du_r8a7795_es1_info },
-	{ /* sentinel */ }
-};
-
 const char *rcar_du_output_name(enum rcar_du_output output)
 {
 	static const char * const names[] = {
@@ -688,7 +645,6 @@ static void rcar_du_shutdown(struct platform_device *pdev)
 
 static int rcar_du_probe(struct platform_device *pdev)
 {
-	const struct soc_device_attribute *soc_attr;
 	struct rcar_du_device *rcdu;
 	unsigned int mask;
 	int ret;
@@ -706,10 +662,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 	rcdu->info = of_device_get_match_data(rcdu->dev);
 
-	soc_attr = soc_device_match(rcar_du_soc_table);
-	if (soc_attr)
-		rcdu->info = soc_attr->data;
-
 	platform_set_drvdata(pdev, rcdu);
 
 	/* I/O resources */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index acc3673fefe18..5cfa2bb7ad93d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -34,8 +34,6 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
-#define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
-#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index 789ae9285108e..288eff12b2b1a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -283,8 +283,7 @@
 #define DPLLCR			0x20044
 #define DPLLCR_CODE		(0x95 << 24)
 #define DPLLCR_PLCS1		(1 << 23)
-#define DPLLCR_PLCS0_PLL	(1 << 21)
-#define DPLLCR_PLCS0_H3ES1X_PLL1	(1 << 20)
+#define DPLLCR_PLCS0		(1 << 21)
 #define DPLLCR_CLKE		(1 << 18)
 #define DPLLCR_FDPLL(n)		((n) << 12)
 #define DPLLCR_N(n)		((n) << 5)
-- 
2.39.2

