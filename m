Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0594BB65F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4370310F04B;
	Fri, 18 Feb 2022 10:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132610F04B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:08:07 +0000 (UTC)
X-UUID: 4b27a5d911474e6fa7987c69523819f7-20220218
X-UUID: 4b27a5d911474e6fa7987c69523819f7-20220218
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 971303730; Fri, 18 Feb 2022 18:08:03 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 18:08:02 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Feb 2022 18:08:01 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 18 Feb 2022 18:07:58 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 1/3] dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to
 .yaml
Date: Fri, 18 Feb 2022 18:07:47 +0800
Message-ID: <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
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
 .../display/mediatek/mediatek,dsi.txt         | 62 --------------
 .../display/mediatek/mediatek,dsi.yaml        | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 62 deletions(-)
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
index 000000000000..552a013786fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek DSI Controller Device Tree Bindings
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
+      - description: Hs Clock
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
+    dsi0: dsi@14014000 {
+        compatible = "mediatek,mt8183-dsi";
+        reg = <0x14014000 0x1000>;
+        interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DSI0_MM>,
+            <&mmsys CLK_MM_DSI0_IF>,
+            <&mipi_tx0>;
+        clock-names = "engine", "digital", "hs";
+        resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
+        phys = <&mipi_tx0>;
+        phy-names = "dphy";
+    };
-- 
2.18.0

