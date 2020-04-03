Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3019D1AC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 10:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8576EB1E;
	Fri,  3 Apr 2020 08:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4ED56EB1F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 08:04:08 +0000 (UTC)
X-UUID: e759dedfbcbf4cfb8c4fb1d72de4eab1-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bYMc9OznLPrGLr6gJF9UOCWwJMxzT0GifD+9RfEVLu4=; 
 b=FAxAeBINdzhMA9BzMWX8Chf2H1i6XTbRt7WdO6zql7Q4y1J5cF35JslS+p7BGPKQTSl2FJUjCc4jPGfjMg1fBQod4PzxYOOR9nbKsolzsLm8us1vtNWOb7S7AscTv2vcn84iEzVCVzTiP53Oj0InxxlYBMyNQ3cplua8yUyqqsg=;
X-UUID: e759dedfbcbf4cfb8c4fb1d72de4eab1-20200403
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 641879745; Fri, 03 Apr 2020 16:03:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 3 Apr 2020 16:03:58 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 3 Apr 2020 16:03:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 2/3] dt-bindings: display: mediatek: convert the document
 format from txt to yaml
Date: Fri, 3 Apr 2020 16:03:49 +0800
Message-ID: <20200403080350.95826-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200403080350.95826-1-jitao.shi@mediatek.com>
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5FFD7C2E38A0D8BED24F226F9270500E1172E398269E27C6C5B807142774C3C2000:8
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
 .../display/mediatek/mediatek,dpi.txt         | 42 --------
 .../display/mediatek/mediatek,dpi.yaml        | 97 +++++++++++++++++++
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
index 000000000000..effdaa96aec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0
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
+  port@0:
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
+  - port@0
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
+        port@0 {
+            dpi0_out: endpoint {
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
