Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18D7846FF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38B910E38C;
	Tue, 22 Aug 2023 16:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8250D10E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:09 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CA201211;
 Tue, 22 Aug 2023 18:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721131;
 bh=iDd9OrJ4bpmdl8qtzo/3tkFMlKMFCIwaFWqa4j8y33E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T7eUk08Ibe9wWt1sgUpKnNQvikAJC6uymUkZaYpt55bEIneH9cJQXcyA7wnSCdD4j
 ZdvQcIyuY6FMOaWIeStqiSWhsTjFVNPIRyMUpH3l0QME3S67JKU7LNIRPRlTs7aZN5
 5EAt1na5dZaWKRfnTS0Uxf3Hm4TqofX+0PiuWK1c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:40 +0300
Subject: [PATCH v3 07/12] drm/bridge: tc358768: Print logical values, not
 raw register values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-7-c82405dac0c1@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
In-Reply-To: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4217;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=iDd9OrJ4bpmdl8qtzo/3tkFMlKMFCIwaFWqa4j8y33E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAsEl6Q8ufgvMP/BxJYbWiuFtQ8WUKiNwJjJ
 wrxgcoCKdSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgLAAKCRD6PaqMvJYe
 9RjPD/97ZXakRJ9h99taRFa4/PZKCitu2IvkUHsUjHvy9ji47SYpZR1qTv2j4ynzu1UDiQQ1lh8
 fi+lx4UaPNhx66JkVI6wxqwPmdrCA4iFgSxhs61c0rp7Ygxp6AKT6UKyP3CQdjy1x4KaAymbrOF
 /YJZhW6O1LGFMjrqQH6pAsTv3/KuHZeNgMPnzA8eyU4ucFKlunf3GBb83dPUpbQdZ7ODEqa0PK0
 6vjP5Sk21klElTlktIR1APF1/GopwFhwOnuTyPAdu7mbqf25PQuPgGZwpjE+oWaE8nXcNgMy/Gz
 0959vyRiX6eNRsk5lMS5mAlV3VXIEzkOhNY4iRa98DDpX/9GkWG7+ZvtnVht8ykz/fqXnhCFdqX
 Oxx6kbFVapjQIn0NoI9rL2pAkrLi8vz4mGQ6mTDslyTLE7pnjkK8pA3Z8jUvk/3XClvRQF870CY
 VUk9LNr1hixKiYYs/mYX2dKwYTWIILY1T7qYrMwndGASK2B5jmKYzzuo5b76sugUisnuLZUz7KO
 M+7OuyGHPrYZlOYQXTFZRV8k1tOkQT5gz98PeSAhk8eiwkLFMZswYskSBsNEtnPq1QgRP5wri4g
 tgAOTdRdyLYk9I+wFX8mprkqdQNEMVrQ4v7TJ1lqEhPCb10TFZaFJUTPM5u514pzoU8KNnLEFCT
 Di4qhcJeURO7T9g==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver debug prints DSI related timings as raw register values in
hex. It is much more useful to see the "logical" value of the timing,
not the register value.

Change the prints to print the values separately, in case a single
register contains multiple values, and use %u to have it in a more human
consumable form.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index b98c517c4726..88060f961064 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -739,57 +739,59 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 
 	/* LP11 > 100us for D-PHY Rx Init */
 	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
-	dev_dbg(priv->dev, "LINEINITCNT: 0x%x\n", val);
+	dev_dbg(priv->dev, "LINEINITCNT: %u\n", val);
 	tc358768_write(priv, TC358768_LINEINITCNT, val);
 
 	/* LPTimeCnt > 50ns */
 	val = tc358768_ns_to_cnt(50, dsibclk_nsk) - 1;
 	lptxcnt = val;
-	dev_dbg(priv->dev, "LPTXTIMECNT: 0x%x\n", val);
+	dev_dbg(priv->dev, "LPTXTIMECNT: %u\n", val);
 	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
 
 	/* 38ns < TCLK_PREPARE < 95ns */
 	val = tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
+	dev_dbg(priv->dev, "TCLK_PREPARECNT %u\n", val);
 	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
 	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
 				  dsibclk_nsk) - 2;
+	dev_dbg(priv->dev, "TCLK_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
-	dev_dbg(priv->dev, "TCLK_HEADERCNT: 0x%x\n", val);
 	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
 
 	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
 	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), dsibclk_nsk) - 5;
 	val = clamp(raw_val, 0, 127);
-	dev_dbg(priv->dev, "TCLK_TRAILCNT: 0x%x\n", val);
+	dev_dbg(priv->dev, "TCLK_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
 
 	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
 	val = 50 + tc358768_to_ns(4 * ui_nsk);
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
+	dev_dbg(priv->dev, "THS_PREPARECNT %u\n", val);
 	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
 	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), dsibclk_nsk) - 10;
 	val2 = clamp(raw_val, 0, 127);
+	dev_dbg(priv->dev, "THS_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
-	dev_dbg(priv->dev, "THS_HEADERCNT: 0x%x\n", val);
 	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
 
 	/* TWAKEUP > 1ms in lptxcnt steps */
 	val = tc358768_ns_to_cnt(1020000, dsibclk_nsk);
 	val = val / (lptxcnt + 1) - 1;
-	dev_dbg(priv->dev, "TWAKEUP: 0x%x\n", val);
+	dev_dbg(priv->dev, "TWAKEUP: %u\n", val);
 	tc358768_write(priv, TC358768_TWAKEUP, val);
 
 	/* TCLK_POSTCNT > 60ns + 52*UI */
 	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
 				 dsibclk_nsk) - 3;
-	dev_dbg(priv->dev, "TCLK_POSTCNT: 0x%x\n", val);
+	dev_dbg(priv->dev, "TCLK_POSTCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
 
 	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
 	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
 				     dsibclk_nsk) - 4;
 	val = clamp(raw_val, 0, 15);
-	dev_dbg(priv->dev, "THS_TRAILCNT: 0x%x\n", val);
+	dev_dbg(priv->dev, "THS_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
 
 	val = BIT(0);
@@ -803,10 +805,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
 	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
+	dev_dbg(priv->dev, "TXTAGOCNT: %u\n", val);
 	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
 				  dsibclk_nsk) - 2;
+	dev_dbg(priv->dev, "RXTASURECNT: %u\n", val2);
 	val = val << 16 | val2;
-	dev_dbg(priv->dev, "BTACNTRL1: 0x%x\n", val);
 	tc358768_write(priv, TC358768_BTACNTRL1, val);
 
 	/* START[0] */

-- 
2.34.1

