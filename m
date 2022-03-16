Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518E4DA9EC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 06:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA6910E562;
	Wed, 16 Mar 2022 05:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54B810E562
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 05:36:30 +0000 (UTC)
X-UUID: 545e376079ec40dcaa18c79c1e4a54a3-20220316
X-UUID: 545e376079ec40dcaa18c79c1e4a54a3-20220316
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 199440079; Wed, 16 Mar 2022 13:35:43 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Mar 2022 13:35:42 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Mar 2022 13:35:41 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 16 Mar 2022 13:35:40 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3,
 1/3] dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to
 .yaml
Date: Wed, 16 Mar 2022 13:35:32 +0800
Message-ID: <1647408934-15775-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1647408934-15775-1-git-send-email-xinlei.lee@mediatek.com>
References: <1647408934-15775-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Convert mediatek,dsi.txt to mediatek,dsi.yaml format

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 .../display/mediatek/mediatek,dsi.txt         | 62 ------------
 .../display/mediatek/mediatek,dsi.yaml        | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
deleted file mode 100644
index 36b01458f45c..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Mediatek DSI Device
-===================
-
-The Mediatek DSI function block is a sink of the display subsystem and can
-drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
-channel output.
-
-Required properties:
-- compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "engine", "digital", and "hs"
-- phys: phandle link to the MIPI D-PHY controller.
-- phy-names: must contain "dphy"
-- port: Output port node with endpoint definitions as described in
-  Documentation/devicetree/bindings/graph.txt. This port should be connected
-  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
-
-Optional properties:
-- resets: list of phandle + reset specifier pair, as described in [1].
-
-[1] Documentation/devicetree/bindings/reset/reset.txt
-
-MIPI TX Configuration Module
-============================
-
-See phy/mediatek,dsi-phy.yaml
-
-Example:
-
-mipi_tx0: mipi-dphy@10215000 {
-	compatible = "mediatek,mt8173-mipi-tx";
-	reg = <0 0x10215000 0 0x1000>;
-	clocks = <&clk26m>;
-	clock-output-names = "mipi_tx0_pll";
-	#clock-cells = <0>;
-	#phy-cells = <0>;
-	drive-strength-microamp = <4600>;
-	nvmem-cells= <&mipi_tx_calibration>;
-	nvmem-cell-names = "calibration-data";
-};
-
-dsi0: dsi@1401b000 {
-	compatible = "mediatek,mt8173-dsi";
-	reg = <0 0x1401b000 0 0x1000>;
-	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
-		 <&mipi_tx0>;
-	clock-names = "engine", "digital", "hs";
-	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
-	phys = <&mipi_tx0>;
-	phy-names = "dphy";
-
-	port {
-		dsi0_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
new file mode 100644
index 000000000000..eb49a7bb6a74
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek DSI Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao Shi <jitao.shi@mediatek.com>
+  - Xinlei Lee <xinlei.lee@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-dsi
+      - mediatek,mt8173-dsi
+      - mediatek,mt8183-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Engine Clock
+      - description: Digital Clock
+      - description: HS Clock
+
+  clock-names:
+    items:
+      - const: engine
+      - const: digital
+      - const: hs
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/mt8183-resets.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsi0: dsi@14014000 {
+            compatible = "mediatek,mt8183-dsi";
+            reg = <0 0x14014000 0 0x1000>;
+            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DSI0_MM>,
+                <&mmsys CLK_MM_DSI0_IF>,
+                <&mipi_tx0>;
+            clock-names = "engine", "digital", "hs";
+            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
+            phys = <&mipi_tx0>;
+            phy-names = "dphy";
+        };
+    };
-- 
2.18.0

