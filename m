Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F6176EB0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 06:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319F6E98C;
	Tue,  3 Mar 2020 05:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C35886E98C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 05:28:07 +0000 (UTC)
X-UUID: 79395d35588c4f32a77a5ebe27a7c98e-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=m2CcW1V41TM32eWWCi7FfNQYoqIdQyWhSRyF/aJpfA4=; 
 b=iL3BjG2oQ8RUXRl87N0Vi5mLolv6LduKYM7IbOQySXyoQWyFcH6xTlgXinBf6VC3N9grg/JyI2iyH4Hqje0GzFxLo70whh1V3birAfHBKMxI0jCpIJignZBXaDhKndSSrAi2ZXh18y2frHWWN1TqOtO2377RF2GwMzQg0McODFw=;
X-UUID: 79395d35588c4f32a77a5ebe27a7c98e-20200303
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 216576827; Tue, 03 Mar 2020 13:28:03 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 3 Mar 2020 13:28:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 3 Mar 2020 13:28:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 4/6] dt-bindings: display: mediatek: convert the document
 format from txt to yaml
Date: Tue, 3 Mar 2020 13:27:20 +0800
Message-ID: <20200303052722.94795-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200303052722.94795-1-jitao.shi@mediatek.com>
References: <20200303052722.94795-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4EE687C2724234A765D419272ADE765BFF1D0D518E863FE5D1C5D83969F78B132000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../display/mediatek/mediatek,dpi.txt         | 45 ---------
 .../display/mediatek/mediatek,dpi.yaml        | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
deleted file mode 100644
index 4eeead1d39db..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Mediatek DPI Device
-===================
-
-The Mediatek DPI function block is a sink of the display subsystem and
-provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-output bus.
-
-Required properties:
-- compatible: "mediatek,<chip>-dpi"
-  the supported chips are mt2701 , mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "pixel", "engine", and "pll"
-- port: Output port node with endpoint definitions as described in
-  Documentation/devicetree/bindings/graph.txt. This port should be connected
-  to the input port of an attached HDMI or LVDS encoder chip.
-
-Optional properties:
-- pinctrl-names: Contain "gpiomode" and "dpimode".
-  pinctrl-names see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-dpi0: dpi@1401d000 {
-	compatible = "mediatek,mt8173-dpi";
-	reg = <0 0x1401d000 0 0x1000>;
-	interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys CLK_MM_DPI_PIXEL>,
-		 <&mmsys CLK_MM_DPI_ENGINE>,
-		 <&apmixedsys CLK_APMIXED_TVDPLL>;
-	clock-names = "pixel", "engine", "pll";
-	pinctrl-names = "active", "idle";
-	pinctrl-0 = <&dpi_pin_func>;
-	pinctrl-1 = <&dpi_pin_idle>;
-
-	port {
-		dpi0_out: endpoint {
-			pclk-sample = <0>;
-			remote-endpoint = <&hdmi0_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
new file mode 100644
index 000000000000..eb2b0cb5eb5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek,dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek DPI Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek DPI function block is a sink of the display subsystem and
+  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
+  output bus.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-dpi
+      - mediatek,mt8173-dpi
+      - mediatek,mt8183-dpi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: Engine Clock
+      - description: DPI PLL
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: engine
+      - const: pll
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: sleep
+
+  port:
+    type: object
+    description:
+      Output port node with endpoint definitions as described in
+      Documentation/devicetree/bindings/graph.txt. This port should be connected
+      to the input port of an attached HDMI or LVDS encoder chip.
+
+    properties:
+      pclk-sample:
+      description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dpi0: dpi@1401d000 {
+        compatible = "mediatek,mt8173-dpi";
+        reg = <0 0x1401d000 0 0x1000>;
+        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+             <&mmsys CLK_MM_DPI_ENGINE>,
+             <&apmixedsys CLK_APMIXED_TVDPLL>;
+        clock-names = "pixel", "engine", "pll";
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&dpi_pin_func>;
+        pinctrl-1 = <&dpi_pin_idle>;
+
+        port {
+            reg = <0>;
+            dpi0_out: endpoint {
+                pclk-sample = <0>;
+                remote-endpoint = <&hdmi0_in>;
+            };
+        };
+    };
+
+...
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
