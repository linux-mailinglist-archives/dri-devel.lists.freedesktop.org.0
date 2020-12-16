Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E392DCDC4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B080C6E1B4;
	Thu, 17 Dec 2020 08:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5932896A5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 09:30:40 +0000 (UTC)
X-UUID: 461a26c33c184d9a99b2bb02568526a5-20201216
X-UUID: 461a26c33c184d9a99b2bb02568526a5-20201216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1052347228; Wed, 16 Dec 2020 17:30:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 17:30:36 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 17:30:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 07/11] dt-bindings: phy: convert MIPI DSI PHY binding to
 YAML schema
Date: Wed, 16 Dec 2020 17:30:08 +0800
Message-ID: <20201216093012.24406-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4:
  1. add maintainer Philipp add support mt8183 suggested by Chun-Kuang
  2. use keyword multipleOf suggested by Rob
  3. fix typo of 'MIPI' in title

v3: new patch
---
 .../display/mediatek/mediatek,dsi.txt         | 18 +---
 .../bindings/phy/mediatek,dsi-phy.yaml        | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..8238a86686be 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -22,23 +22,7 @@ Required properties:
 MIPI TX Configuration Module
 ============================
 
-The MIPI TX configuration module controls the MIPI D-PHY.
-
-Required properties:
-- compatible: "mediatek,<chip>-mipi-tx"
-- the supported chips are mt2701, 7623, mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- clocks: PLL reference clock
-- clock-output-names: name of the output clock line to the DSI encoder
-- #clock-cells: must be <0>;
-- #phy-cells: must be <0>.
-
-Optional properties:
-- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
-						   the step is 200.
-- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
-               unspecified default values shall be used.
-- nvmem-cell-names: Should be "calibration-data"
+See phy/mediatek,dsi-phy.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
new file mode 100644
index 000000000000..71d4acea1f66
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: The MIPI DSI PHY supports up to 4-lane output.
+
+properties:
+  $nodename:
+    pattern: "^dsi-phy@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - mediatek,mt2701-mipi-tx
+      - mediatek,mt7623-mipi-tx
+      - mediatek,mt8173-mipi-tx
+      - mediatek,mt8183-mipi-tx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL reference clock
+
+  clock-output-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  nvmem-cells:
+    maxItems: 1
+    description: A phandle to the calibration data provided by a nvmem device,
+      if unspecified, default values shall be used.
+
+  nvmem-cell-names:
+    items:
+      - const: calibration-data
+
+  drive-strength-microamp:
+    description: adjust driving current
+    multipleOf: 200
+    minimum: 2000
+    maximum: 6000
+    default: 4600
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-output-names
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    dsi-phy@10215000 {
+        compatible = "mediatek,mt8173-mipi-tx";
+        reg = <0x10215000 0x1000>;
+        clocks = <&clk26m>;
+        clock-output-names = "mipi_tx0_pll";
+        drive-strength-microamp = <4000>;
+        nvmem-cells= <&mipi_tx_calibration>;
+        nvmem-cell-names = "calibration-data";
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
