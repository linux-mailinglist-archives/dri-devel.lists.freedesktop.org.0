Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461E70F2DC
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61D10E630;
	Wed, 24 May 2023 09:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF8810E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:34:23 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BAC66602F6A;
 Wed, 24 May 2023 10:34:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684920861;
 bh=UhPYkAXn11l5HCs1IddO+VQSqgiY8B30l4baBYtD728=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mNexC93aSqJBpRp6DYVULa3o+B7m+hMQ3jSt0/oPR0RDVbV9u0CES21Nom15ed6bP
 9vNoLpGVJHJbsZ3A83ziBnLYDd4ZFAYMl/5S/yjb2EXGkFLLpCqJIqZ2SH/9d/BExx
 694NRclPSEpbEoRQlxISYRJmfv9d/KUeLKtZXlGrkoRch0q16JhKLzLG/8S4JjI6i2
 CKS5SoDACM7uSZXW/gjHkyuqOtrW5L40455nYFnAhyX7lsyOGXW8dlkgSpUqmIOg68
 Gvz1CeyfXmuWTYEh2Y5/5uYboVFeQd9e0OmPLsvkmuhxQ0enLDbz8y8eaMYV0AjzxK
 dLwhCY2THXETA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v1 1/4] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Date: Wed, 24 May 2023 11:34:09 +0200
Message-Id: <20230524093412.92211-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
References: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change magic numerical masks with usage of the GENMASK() macro
to improve readability.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 46 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b0ab38e59db9..246a3a338c1e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -58,18 +58,18 @@
 
 #define DSI_TXRX_CTRL		0x18
 #define VC_NUM				BIT(1)
-#define LANE_NUM			(0xf << 2)
+#define LANE_NUM			GENMASK(5, 2)
 #define DIS_EOT				BIT(6)
 #define NULL_EN				BIT(7)
 #define TE_FREERUN			BIT(8)
 #define EXT_TE_EN			BIT(9)
 #define EXT_TE_EDGE			BIT(10)
-#define MAX_RTN_SIZE			(0xf << 12)
+#define MAX_RTN_SIZE			GENMASK(15, 12)
 #define HSTX_CKLP_EN			BIT(16)
 
 #define DSI_PSCTRL		0x1c
-#define DSI_PS_WC			0x3fff
-#define DSI_PS_SEL			(3 << 16)
+#define DSI_PS_WC			GENMASK(14, 0)
+#define DSI_PS_SEL			GENMASK(19, 16)
 #define PACKED_PS_16BIT_RGB565		(0 << 16)
 #define LOOSELY_PS_18BIT_RGB666		(1 << 16)
 #define PACKED_PS_18BIT_RGB666		(2 << 16)
@@ -108,26 +108,27 @@
 #define LD0_WAKEUP_EN			BIT(2)
 
 #define DSI_PHY_TIMECON0	0x110
-#define LPX				(0xff << 0)
-#define HS_PREP				(0xff << 8)
-#define HS_ZERO				(0xff << 16)
-#define HS_TRAIL			(0xff << 24)
+#define LPX				GENMASK(7, 0)
+#define HS_PREP				GENMASK(15, 8)
+#define HS_ZERO				GENMASK(23, 16)
+#define HS_TRAIL			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON1	0x114
-#define TA_GO				(0xff << 0)
-#define TA_SURE				(0xff << 8)
-#define TA_GET				(0xff << 16)
-#define DA_HS_EXIT			(0xff << 24)
+#define TA_GO				GENMASK(7, 0)
+#define TA_SURE				GENMASK(15, 8)
+#define TA_GET				GENMASK(23, 16)
+#define DA_HS_EXIT			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON2	0x118
-#define CONT_DET			(0xff << 0)
-#define CLK_ZERO			(0xff << 16)
-#define CLK_TRAIL			(0xff << 24)
+#define CONT_DET			GENMASK(7, 0)
+#define DA_HS_SYNC			GENMASK(15, 8)
+#define CLK_ZERO			GENMASK(23, 16)
+#define CLK_TRAIL			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON3	0x11c
-#define CLK_HS_PREP			(0xff << 0)
-#define CLK_HS_POST			(0xff << 8)
-#define CLK_HS_EXIT			(0xff << 16)
+#define CLK_HS_PREP			GENMASK(7, 0)
+#define CLK_HS_POST			GENMASK(15, 8)
+#define CLK_HS_EXIT			GENMASK(23, 16)
 
 #define DSI_VM_CMD_CON		0x130
 #define VM_CMD_EN			BIT(0)
@@ -137,13 +138,14 @@
 #define FORCE_COMMIT			BIT(0)
 #define BYPASS_SHADOW			BIT(1)
 
-#define CONFIG				(0xff << 0)
+/* CMDQ related bits */
+#define CONFIG				GENMASK(7, 0)
 #define SHORT_PACKET			0
 #define LONG_PACKET			2
 #define BTA				BIT(2)
-#define DATA_ID				(0xff << 8)
-#define DATA_0				(0xff << 16)
-#define DATA_1				(0xff << 24)
+#define DATA_ID				GENMASK(15, 8)
+#define DATA_0				GENMASK(23, 16)
+#define DATA_1				GENMASK(31, 24)
 
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
 
-- 
2.40.1

