Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB07935AF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479910E57B;
	Wed,  6 Sep 2023 06:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8513A10E56B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:37 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98809283;
 Wed,  6 Sep 2023 08:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983009;
 bh=iIhP4OBd9bTNKWQ7Dv6rkC8lGjA6raktXGPsD/PxquE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AaHhNA2MFB8chTBqZ/MnO3nObqRLG5/pkmEkHtxuJZMPQzBy12+NgGTVtfXOzIQyp
 oMQfPBsXhhs46zL5xSYhV9FoX43jW2Owtkahp/YkeAWLs9w5RE1qynoXGcQtP/76Cq
 mydsVOEgCsD3qB0QqrrNju0uX6S+pOO37yHjItd0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:56 +0300
Subject: [PATCH v4 09/12] drm/bridge: tc358768: Rename dsibclk to hsbyteclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-9-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7486;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=iIhP4OBd9bTNKWQ7Dv6rkC8lGjA6raktXGPsD/PxquE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFqfJnega8N2KRKSnfKc3mz6yPI/osW0mTfR
 hP27lc1M4OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghagAKCRD6PaqMvJYe
 9bLTD/4n8VKZ1bs5nqxwDQ+I+inBVLKBrYZY0HA8RrVBSJXt5qLNYScnuKmo/db5AboqeXeeAwS
 YNkCBIJth/iQstGYm5BQGCTSvHDjS/VQKwnzMMhfDiPjCdewEvv+Kq55GehsHu7TAMHTm8hgGtA
 4o8ge4a2DOYQwhGAvJbr8B/dsiZIPI8xTNcsWTW77uuW47iHUuoU740E4wVYoQvdzt+JpGULJD4
 fIJR7DvU9NBcZ8EX7D2p1cvWHL8PPCEhT9JAAN5SRz32VxUcH4a5S2sKcZRAhXie378kjN9Hpt4
 xVaMm2O6faOXwkgV5GP71VVkG2mJbSgkOz+0jon12yDJIfwQqVnvsUz2a9pAmQ3OlAHWZxHC1Jk
 Ves+7fTaQYJlt4GI5jRuGeyhwWpwCF9We6/XPnb+D+5vbbRBFR/PVAPIFNiDBDhtdJyWYJemv+l
 GKowzWKJRRDpuVIPdRfRK13AYITDL6K8BG4xNjY4cSKU6IMVf83xFh2rdFJ061Z+5FyoQS0AnlT
 16l+Q6B+ndTDAe2cCgrQdpimQqNYNArlZSxDzj4Oqx2eYn+8AFIIuYJcyAgGc/b4yy/MBm2RE/N
 OndrRyzcgrMHiozu3RH+MJQm0wDVK19lqklF3whgX7a/l6pAS8yTkM1QobkP3Kqcclv4UgQDNmH
 NZwRrPbtu7kDcpw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Toshiba documentation talks about HSByteClk when referring to the
DSI HS byte clock, whereas the driver uses 'dsibclk' name. Also, in a
few places the driver calculates the byte clock from the DSI clock, even
if the byte clock is already available in a variable.

To align the driver with the documentation, change the 'dsibclk'
variable to 'hsbyteclk'. This also make it easier to visually separate
'dsibclk' and 'dsiclk' variables.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 6297d28250e9..0f117d673b14 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -604,7 +604,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
 
 	dev_dbg(priv->dev, "PLL: refclk %lu, fbd %u, prd %u, frs %u\n",
 		clk_get_rate(priv->refclk), fbd, prd, frs);
-	dev_dbg(priv->dev, "PLL: pll_clk: %u, DSIClk %u, DSIByteClk %u\n",
+	dev_dbg(priv->dev, "PLL: pll_clk: %u, DSIClk %u, HSByteClk %u\n",
 		priv->dsiclk * 2, priv->dsiclk, priv->dsiclk / 4);
 	dev_dbg(priv->dev, "PLL: pclk %u (panel: %u)\n",
 		tc358768_pll_to_pclk(priv, priv->dsiclk * 2),
@@ -646,8 +646,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	u32 val, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
 	const struct drm_display_mode *mode;
-	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk;
-	u32 dsiclk, dsibclk, video_start;
+	u32 hsbyteclk_nsk, dsiclk_nsk, ui_nsk;
+	u32 dsiclk, hsbyteclk, video_start;
 	const u32 internal_delay = 40;
 	int ret, i;
 	struct videomode vm;
@@ -678,7 +678,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	drm_display_mode_to_videomode(mode, &vm);
 
 	dsiclk = priv->dsiclk;
-	dsibclk = dsiclk / 4;
+	hsbyteclk = dsiclk / 4;
 
 	/* Data Format Control Register */
 	val = BIT(2) | BIT(1) | BIT(0); /* rdswap_en | dsitx_en | txdt_en */
@@ -730,67 +730,67 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		tc358768_write(priv, TC358768_D0W_CNTRL + i * 4, 0x0000);
 
 	/* DSI Timings */
-	dsibclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
-				  dsibclk);
+	hsbyteclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
+				  hsbyteclk);
 	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
 	ui_nsk = dsiclk_nsk / 2;
 	dev_dbg(dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
 	dev_dbg(dev, "ui_nsk: %u\n", ui_nsk);
-	dev_dbg(dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
+	dev_dbg(dev, "hsbyteclk_nsk: %u\n", hsbyteclk_nsk);
 
 	/* LP11 > 100us for D-PHY Rx Init */
-	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_nsk) - 1;
 	dev_dbg(dev, "LINEINITCNT: %u\n", val);
 	tc358768_write(priv, TC358768_LINEINITCNT, val);
 
 	/* LPTimeCnt > 50ns */
-	val = tc358768_ns_to_cnt(50, dsibclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(50, hsbyteclk_nsk) - 1;
 	lptxcnt = val;
 	dev_dbg(dev, "LPTXTIMECNT: %u\n", val);
 	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
 
 	/* 38ns < TCLK_PREPARE < 95ns */
-	val = tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(65, hsbyteclk_nsk) - 1;
 	dev_dbg(dev, "TCLK_PREPARECNT %u\n", val);
 	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
 	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
-				  dsibclk_nsk) - 2;
+				  hsbyteclk_nsk) - 2;
 	dev_dbg(dev, "TCLK_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
 
 	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
-	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), dsibclk_nsk) - 5;
+	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), hsbyteclk_nsk) - 5;
 	val = clamp(raw_val, 0, 127);
 	dev_dbg(dev, "TCLK_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
 
 	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
 	val = 50 + tc358768_to_ns(4 * ui_nsk);
-	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) - 1;
 	dev_dbg(dev, "THS_PREPARECNT %u\n", val);
 	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
-	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), dsibclk_nsk) - 10;
+	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), hsbyteclk_nsk) - 10;
 	val2 = clamp(raw_val, 0, 127);
 	dev_dbg(dev, "THS_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
 
 	/* TWAKEUP > 1ms in lptxcnt steps */
-	val = tc358768_ns_to_cnt(1020000, dsibclk_nsk);
+	val = tc358768_ns_to_cnt(1020000, hsbyteclk_nsk);
 	val = val / (lptxcnt + 1) - 1;
 	dev_dbg(dev, "TWAKEUP: %u\n", val);
 	tc358768_write(priv, TC358768_TWAKEUP, val);
 
 	/* TCLK_POSTCNT > 60ns + 52*UI */
 	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
-				 dsibclk_nsk) - 3;
+				 hsbyteclk_nsk) - 3;
 	dev_dbg(dev, "TCLK_POSTCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
 
 	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
 	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
-				     dsibclk_nsk) - 4;
+				     hsbyteclk_nsk) - 4;
 	val = clamp(raw_val, 0, 15);
 	dev_dbg(dev, "THS_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
@@ -804,11 +804,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
 
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
-	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
-	val = tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
+	val = tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk * 4);
+	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) / 4 - 1;
 	dev_dbg(dev, "TXTAGOCNT: %u\n", val);
-	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
-				  dsibclk_nsk) - 2;
+	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk),
+				  hsbyteclk_nsk) - 2;
 	dev_dbg(dev, "RXTASURECNT: %u\n", val2);
 	val = val << 16 | val2;
 	tc358768_write(priv, TC358768_BTACNTRL1, val);
@@ -831,13 +831,13 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 
 		/* hsw * byteclk * ndl / pclk */
 		val = (u32)div_u64(vm.hsync_len *
-				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   (u64)hsbyteclk * priv->dsi_lanes,
 				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HSW, val);
 
 		/* hbp * byteclk * ndl / pclk */
 		val = (u32)div_u64(vm.hback_porch *
-				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   (u64)hsbyteclk * priv->dsi_lanes,
 				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HBPR, val);
 	} else {
@@ -856,7 +856,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 
 		/* (hsw + hbp) * byteclk * ndl / pclk */
 		val = (u32)div_u64((vm.hsync_len + vm.hback_porch) *
-				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   (u64)hsbyteclk * priv->dsi_lanes,
 				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HSW, val);
 

-- 
2.34.1

