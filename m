Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F20503241
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 04:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED010E36D;
	Sat, 16 Apr 2022 02:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6186C10E36D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 02:07:59 +0000 (UTC)
X-UUID: b1e805a911bb4182bd407a51d296e929-20220416
X-UUID: b1e805a911bb4182bd407a51d296e929-20220416
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 641341042; Sat, 16 Apr 2022 10:07:54 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Apr 2022 10:07:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Apr 2022 10:07:53 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v17 02/21] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Date: Sat, 16 Apr 2022 10:07:30 +0800
Message-ID: <20220416020749.29010-3-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220416020749.29010-1-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vdosys1 reset control bit for MT8195 platform.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index a26bccc8b957..aab8d74496a6 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -26,4 +26,16 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* VDOSYS1 */
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC          25
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC          26
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC          27
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC          28
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC          29
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC     51
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC     52
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC     53
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC     54
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC      55
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0

