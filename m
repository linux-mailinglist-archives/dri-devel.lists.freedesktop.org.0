Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912E26D4CA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2FE6E184;
	Thu, 17 Sep 2020 07:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 284A16E184
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:33:52 +0000 (UTC)
X-UUID: 6bf3f0a16c3a426f8b290967d0360315-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6NUUedpXNQ5jCOHG+M6D9uQsy5p+hcL39YSoVGePx3c=; 
 b=bFZnH+PglSm8fz8D0GqgaK2VrI4v9JOn6PU3NRas99SuV9A3vlV8VaX8p5F4acVpIN8x+ZDl/eqjc8NO1IW/YI4KoSOcOMSMnZOIe17dwNUvDKsqTTETXS7P7D2dDxCl7OHhhAvj3CdBKBuKzrHbjjt1NDiisbCQUwBFpeI1KV0=;
X-UUID: 6bf3f0a16c3a426f8b290967d0360315-20200917
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 18555539; Thu, 17 Sep 2020 15:33:45 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Sep 2020 15:33:41 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 17 Sep 2020 15:33:41 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v2 PATCH] dt-bindings: display: mediatek: convert the dpi bindings
 to yaml
Date: Thu, 17 Sep 2020 15:33:05 +0800
Message-ID: <20200917073305.25738-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: C44404ACF078DEF47CC277602C88AD09DC917700FE540F3FA3845207F68AE0262000:8
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

Convert display/mediatek/mediatek,dpi.txt to display/mediatek/mediatek,dpi.yaml
and remove the old text bindings.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
deleted file mode 100644
index 77def4456706..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ /dev/null
@@ -1,42 +0,0 @@
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
-- pinctrl-names: Contain "default" and "sleep".
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
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&dpi_pin_func>;
-	pinctrl-1 = <&dpi_pin_idle>;
-
-	port {
-		dpi0_out: endpoint {
-			remote-endpoint = <&hdmi0_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
new file mode 100644
index 000000000000..4de08bc46fb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
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
+  pinctrl-0: true
+  pinctrl-1: true
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
+      endpoint:
+        type: object
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    dpi0: dpi@1401d000 {
+        compatible = "mediatek,mt8173-dpi";
+        reg = <0x1401d000 0x1000>;
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
+            dpi0_out: endpoint {
+                remote-endpoint = <&hdmi0_in>;
+            };
+        };
+    };
+
+...
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
