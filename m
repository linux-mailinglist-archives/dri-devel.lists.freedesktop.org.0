Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83739F2ED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC806EB97;
	Tue,  8 Jun 2021 09:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576BB6EB97
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:53:41 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A040D82E68;
 Tue,  8 Jun 2021 11:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623146020;
 bh=5yhNZHLHK7OSV9mQu96dLKN/2zz5vIMYtUxSGXS81pQ=;
 h=From:To:Cc:Subject:Date:From;
 b=QgpybtX96HfiwW9HIb7M16HUdLfud/6gffLTVWCKVq8zVhoLDCNqGvGiwvLd9iLOz
 rysvtIhNcy4sNdgbHudjILDCmjWhE+YDh6/wAq35snVZMUcYJN6qEXjY8FP1+JH88e
 ralmUPS4k0ORR3a8/AJd2R7anGNFfZ1/kihrVmLhnaj97lcPyrt2L6auFnmMnKaPw0
 Z/T9VQY3JN0d3k2D1v2cUxZnR8zpSiYa4N806qIGriDRYfsdCKeCPmSzNl5ZbeN2xA
 i+L6eD9S6jaF9XcqwnjGgniHSUlVWBWtFJbQnUmAzEuPAVMxs7JFH4jK/nObKHQS7p
 +jkEQwJhROBug==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Fix checkpatch --strict CHECKs
Date: Tue,  8 Jun 2021 11:53:22 +0200
Message-Id: <20210608095322.23644-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 ch@denx.de, Sam Ravnborg <sam@ravnborg.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix ./scripts/checkpatch.pl --strict -f drivers/gpu/drm/bridge/ti-sn65dsi83.c
CHECKs, no functional change. This is the same modification done to V7 of the
original patch.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Valentin Raevsky <valentin@compulab.co.il>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index eff35611fabf..750f2172ef08 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -377,19 +377,19 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
 
 	/* Reference clock derived from DSI link clock. */
 	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
-		REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
-		REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
+		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
+		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
 	regmap_write(ctx->regmap, REG_DSI_CLK,
-		REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
+		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
 	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
-		REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
+		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
 
 	/* Set number of DSI lanes and LVDS link config. */
 	regmap_write(ctx->regmap, REG_DSI_LANE,
-		REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
-		REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
-		/* CHB is DSI85-only, set to default on DSI83/DSI84 */
-		REG_DSI_LANE_CHB_DSI_LANES(3));
+		     REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
+		     REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
+		     /* CHB is DSI85-only, set to default on DSI83/DSI84 */
+		     REG_DSI_LANE_CHB_DSI_LANES(3));
 	/* No equalization. */
 	regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
 
@@ -420,10 +420,10 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
 	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
 	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
-		(ctx->lvds_dual_link_even_odd_swap ?
-		 REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
-		REG_LVDS_LANE_CHA_LVDS_TERM |
-		REG_LVDS_LANE_CHB_LVDS_TERM);
+		     (ctx->lvds_dual_link_even_odd_swap ?
+		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
+		     REG_LVDS_LANE_CHA_LVDS_TERM |
+		     REG_LVDS_LANE_CHB_LVDS_TERM);
 	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
 
 	val = cpu_to_le16(ctx->mode.hdisplay);
@@ -455,8 +455,8 @@ static void sn65dsi83_enable(struct drm_bridge *bridge)
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
 	usleep_range(3000, 4000);
 	ret = regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
-					pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
-					1000, 100000);
+				       pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
+				       1000, 100000);
 	if (ret) {
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
@@ -513,8 +513,8 @@ static void sn65dsi83_mode_set(struct drm_bridge *bridge,
 }
 
 static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adj)
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adj)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	u32 input_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
@@ -546,8 +546,8 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
 			ctx->lvds_format_24bpp = true;
 			ctx->lvds_format_jeida = false;
 			dev_warn(ctx->dev,
-				"Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
-				connector->display_info.bus_formats[0]);
+				 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
+				 connector->display_info.bus_formats[0]);
 			break;
 		}
 
-- 
2.30.2

