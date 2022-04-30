Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8275159EA
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 04:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D1510E12E;
	Sat, 30 Apr 2022 02:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818310E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 02:50:35 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1630183EFC;
 Sat, 30 Apr 2022 04:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651287033;
 bh=B6xaX8y1dcOYCVZV6NjR2WObquaUmU8l83y6p8TjybI=;
 h=From:To:Cc:Subject:Date:From;
 b=wImMvOuLjBSR35fQ9KQc1oR9xOhvMEj7InDG1IqOoGn3nR5+F8p789vZw5tynJEN/
 sFfbO5PoxtkLsYTnqKh0er4PTSpjxK4cHNDJOdcOOnD7GftoK3wGlFbIKV8bv+pf4v
 sE0hQMeAkIf3bO9TJkN44HXsg9pIp68eBRB15WGxRZIfDdu7rDCLMsLbLxFmR07nNI
 Pye4jqpupDFf0le09tXN8LGSabNd1Fs5avbNw2h6NXujpjBGf0DfIJdKNid+4oku0u
 puinA+AV3Hz0WL8BgBfebSHIgDARmt4Ua7nqF2Jrs9NQGzzjtDIBSniMe6scfB9YTc
 o9f66+pjQPPog==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Register macro clean up
Date: Sat, 30 Apr 2022 04:50:20 +0200
Message-Id: <20220430025020.640277-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Mark Brown <broonie@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop two unused register macros, ICN6211_MAX_REGISTER and MIPI_ATE_STATUS_1,
neither of which is used and where the later should be specified using macro
MIPI_ATE_STATUS(1) instead. Drop the _(n) underscore and keep only the (n)
part of register macros. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 5a9e7eb5dc8e..45bb89ac3fff 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -100,7 +100,7 @@
 #define MIPI_PN_SWAP		0x87
 #define MIPI_PN_SWAP_CLK		BIT(4)
 #define MIPI_PN_SWAP_D(n)		BIT((n) & 0x3)
-#define MIPI_SOT_SYNC_BIT_(n)	(0x88 + ((n) & 0x1)) /* 0..1 */
+#define MIPI_SOT_SYNC_BIT(n)	(0x88 + ((n) & 0x1)) /* 0..1 */
 #define MIPI_ULPS_CTRL		0x8a
 #define MIPI_CLK_CHK_VAR	0x8e
 #define MIPI_CLK_CHK_INI	0x8f
@@ -115,7 +115,7 @@
 #define MIPI_T_CLK_SETTLE	0x9a
 #define MIPI_TO_HS_RX_L		0x9e
 #define MIPI_TO_HS_RX_H		0x9f
-#define MIPI_PHY_(n)		(0xa0 + ((n) & 0x7)) /* 0..5 */
+#define MIPI_PHY(n)		(0xa0 + ((n) & 0x7)) /* 0..5 */
 #define MIPI_PD_RX		0xb0
 #define MIPI_PD_TERM		0xb1
 #define MIPI_PD_HSRX		0xb2
@@ -125,13 +125,11 @@
 #define MIPI_FORCE_0		0xb6
 #define MIPI_RST_CTRL		0xb7
 #define MIPI_RST_NUM		0xb8
-#define MIPI_DBG_SET_(n)	(0xc0 + ((n) & 0xf)) /* 0..9 */
+#define MIPI_DBG_SET(n)		(0xc0 + ((n) & 0xf)) /* 0..9 */
 #define MIPI_DBG_SEL		0xe0
 #define MIPI_DBG_DATA		0xe1
 #define MIPI_ATE_TEST_SEL	0xe2
-#define MIPI_ATE_STATUS_(n)	(0xe3 + ((n) & 0x1)) /* 0..1 */
-#define MIPI_ATE_STATUS_1	0xe4
-#define ICN6211_MAX_REGISTER	MIPI_ATE_STATUS(1)
+#define MIPI_ATE_STATUS(n)	(0xe3 + ((n) & 0x1)) /* 0..1 */
 
 struct chipone {
 	struct device *dev;
@@ -155,10 +153,10 @@ static const struct regmap_range chipone_dsi_readable_ranges[] = {
 	regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
 	regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
 	regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
-	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
+	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY(5)),
 	regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
-	regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
-	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
+	regmap_reg_range(MIPI_DBG_SET(0), MIPI_DBG_SET(9)),
+	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS(1)),
 };
 
 static const struct regmap_access_table chipone_dsi_readable_table = {
@@ -172,10 +170,10 @@ static const struct regmap_range chipone_dsi_writeable_ranges[] = {
 	regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
 	regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
 	regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
-	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
+	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY(5)),
 	regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
-	regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
-	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
+	regmap_reg_range(MIPI_DBG_SET(0), MIPI_DBG_SET(9)),
+	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS(1)),
 };
 
 static const struct regmap_access_table chipone_dsi_writeable_table = {
@@ -189,7 +187,7 @@ static const struct regmap_config chipone_regmap_config = {
 	.rd_table = &chipone_dsi_readable_table,
 	.wr_table = &chipone_dsi_writeable_table,
 	.cache_type = REGCACHE_RBTREE,
-	.max_register = MIPI_ATE_STATUS_(1),
+	.max_register = MIPI_ATE_STATUS(1),
 };
 
 static int chipone_dsi_read(void *context,
-- 
2.35.1

