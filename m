Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776F2E2AF5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B1E89C9A;
	Fri, 25 Dec 2020 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AFEF89B48
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 07:53:10 +0000 (UTC)
X-UUID: 443bc3d00bd7429e8ae3be0f08c8c8e1-20201225
X-UUID: 443bc3d00bd7429e8ae3be0f08c8c8e1-20201225
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1270548655; Fri, 25 Dec 2020 15:53:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:52:58 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Dec 2020 15:52:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 08/11] dt-bindings: usb: convert mediatek,
 musb.txt to YAML schema
Date: Fri, 25 Dec 2020 15:52:55 +0800
Message-ID: <20201225075258.33352-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C2BD39F7A06B8839203EFF13CF1EADF850EF30D9AD7561566933D51B300AF3E2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

Convert mediatek,musb.txt to YAML schema mediatek,musb.yaml

Cc: Min Guo <min.guo@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4~v5: no changes
v3: add Reviewed-by Rob
v2: new patch
---
 .../devicetree/bindings/usb/mediatek,musb.txt |  57 ---------
 .../bindings/usb/mediatek,musb.yaml           | 113 ++++++++++++++++++
 2 files changed, 113 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
deleted file mode 100644
index 5eedb0296562..000000000000
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-MediaTek musb DRD/OTG controller
--------------------------------------------
-
-Required properties:
- - compatible      : should be one of:
-                     "mediatek,mt2701-musb"
-                     ...
-                     followed by "mediatek,mtk-musb"
- - reg             : specifies physical base address and size of
-                     the registers
- - interrupts      : interrupt used by musb controller
- - interrupt-names : must be "mc"
- - phys            : PHY specifier for the OTG phy
- - dr_mode         : should be one of "host", "peripheral" or "otg",
-                     refer to usb/generic.txt
- - clocks          : a list of phandle + clock-specifier pairs, one for
-                     each entry in clock-names
- - clock-names     : must contain "main", "mcu", "univpll"
-                     for clocks of controller
-
-Optional properties:
- - power-domains   : a phandle to USB power domain node to control USB's
-                     MTCMOS
-
-Required child nodes:
- usb connector node as defined in bindings/connector/usb-connector.yaml
-Optional properties:
- - id-gpios        : input GPIO for USB ID pin.
- - vbus-gpios      : input GPIO for USB VBUS pin.
- - vbus-supply     : reference to the VBUS regulator, needed when supports
-                     dual-role mode
- - usb-role-switch : use USB Role Switch to support dual-role switch, see
-                     usb/generic.txt.
-
-Example:
-
-usb2: usb@11200000 {
-	compatible = "mediatek,mt2701-musb",
-		     "mediatek,mtk-musb";
-	reg = <0 0x11200000 0 0x1000>;
-	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
-	interrupt-names = "mc";
-	phys = <&u2port2 PHY_TYPE_USB2>;
-	dr_mode = "otg";
-	clocks = <&pericfg CLK_PERI_USB0>,
-		 <&pericfg CLK_PERI_USB0_MCU>,
-		 <&pericfg CLK_PERI_USB_SLV>;
-	clock-names = "main","mcu","univpll";
-	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
-	usb-role-switch;
-	connector{
-		compatible = "gpio-usb-b-connector", "usb-b-connector";
-		type = "micro";
-		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
-		vbus-supply = <&usb_vbus>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
new file mode 100644
index 000000000000..790efe8b6274
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/mediatek,musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MUSB DRD/OTG Controller Device Tree Bindings
+
+maintainers:
+  - Min Guo <min.guo@mediatek.com>
+
+properties:
+  $nodename:
+    pattern: '^usb@[0-9a-f]+$'
+
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2701-musb
+      - const: mediatek,mtk-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: mc
+
+  clocks:
+    items:
+      - description: The main/core clock
+      - description: The system bus clock
+      - description: The 48Mhz clock
+
+  clock-names:
+    items:
+      - const: main
+      - const: mcu
+      - const: univpll
+
+  phys:
+    maxItems: 1
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch. See usb/generic.txt
+    type: boolean
+
+  dr_mode:
+    enum:
+      - host
+      - otg
+      - peripheral
+
+  power-domains:
+    description: A phandle to USB power domain node to control USB's MTCMOS
+    maxItems: 1
+
+  connector:
+    $ref: /connector/usb-connector.yaml#
+    description: Connector for dual role switch
+    type: object
+
+dependencies:
+  usb-role-switch: [ 'connector' ]
+  connector: [ 'usb-role-switch' ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - phys
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt2701-power.h>
+
+    usb@11200000 {
+        compatible = "mediatek,mt2701-musb", "mediatek,mtk-musb";
+        reg = <0x11200000 0x1000>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "mc";
+        phys = <&u2port2 PHY_TYPE_USB2>;
+        dr_mode = "otg";
+        clocks = <&pericfg CLK_PERI_USB0>,
+                 <&pericfg CLK_PERI_USB0_MCU>,
+                 <&pericfg CLK_PERI_USB_SLV>;
+        clock-names = "main","mcu","univpll";
+        power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+        usb-role-switch;
+
+        connector {
+            compatible = "gpio-usb-b-connector", "usb-b-connector";
+            type = "micro";
+            id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+            vbus-supply = <&usb_vbus>;
+        };
+    };
+...
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
