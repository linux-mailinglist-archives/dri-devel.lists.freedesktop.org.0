Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2C9735C1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029710E78A;
	Tue, 10 Sep 2024 10:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SutjhiN7";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="QIbNCvyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 10:58:21 UTC
Received: from a7-32.smtp-out.eu-west-1.amazonses.com
 (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4DC10E78A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725965473;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=+8ct+r5QlzaRMFN24aR15xP1dz+FIB8x3oCpgibvxIg=;
 b=SutjhiN7dxhlydN91ecIwd4S20HB3o8QVLYUQ37+UegdRX3AGk9lgTW54mDg8WqG
 uaXcjA2zp3aQIBFe1OrCmP3F0BI+ZcQMcPiExj25NdNfus/a8qg2M5EFQXFfWNbduK2
 ibAdG5rA0/jJTaaZgxdPvYSzc1UYrrgUBFrRrEqFwSHiJDiPOaZaucCh2/PI82n7rVy
 +RJ8yPwa9QqkU/tDihEll2S5gl93qoPRuqQ8zuBaLDgUniPTaOo+oglRzqcTtNZmw2J
 doZhImNejRcJT97k2ZxXUxxwKXPFq5ei93I9kHqHrUqRjx4/2uGWiTGxPzH1/8bayqY
 TsLurBoNKg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725965473;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=+8ct+r5QlzaRMFN24aR15xP1dz+FIB8x3oCpgibvxIg=;
 b=QIbNCvyj/POLi5cbAmIwPLSlX8vB1KWk765ljohKmSBwlfg8a4546Cp/Ya+dWvu8
 /f/4sYb14zJbcJAqGN7V8d/Wxix2mLKeYJObmc+rnu3qKE8SyY+LxapdabmGmR8PSHs
 wNjh30qNYvnSbcyGKCMZNoIi2NCxstG+My3uXFAs=
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com, 
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc, 
 sjoerd@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>, 
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH v10 1/3] dt-bindings: display: mediatek: Add OF graph support
 for board path
Date: Tue, 10 Sep 2024 10:51:13 +0000
Message-ID: <01020191db8f15b7-e522d284-2ecf-4623-b6f7-4694b8703294-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910105054.125005-1-angelogioacchino.delregno@collabora.com>
References: <20240910105054.125005-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.32
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display IPs in MediaTek SoCs support being interconnected with
different instances of DDP IPs (for example, merge0 or merge1) and/or
with different DDP IPs (for example, rdma can be connected with either
color, dpi, dsi, merge, etc), forming a full Display Data Path that
ends with an actual display.

The final display pipeline is effectively board specific, as it does
depend on the display that is attached to it, and eventually on the
sensors supported by the board (for example, Adaptive Ambient Light
would need an Ambient Light Sensor, otherwise it's pointless!), other
than the output type.

Add support for OF graphs to most of the MediaTek DDP (display) bindings
to add flexibility to build custom hardware paths, hence enabling board
specific configuration of the display pipeline and allowing to finally
migrate away from using hardcoded paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
 .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
 .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
 .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
 .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
 .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
 .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
 .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
 .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
 .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
 .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
 .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
 .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
 .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
 .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
 .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
 16 files changed, 372 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cf24434854ff..47ddba5c41af 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -62,6 +62,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: AAL input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          AAL output to the next component's input, for example could be one
+          of many gamma, overdrive or other blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
@@ -89,5 +110,24 @@ examples:
            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
            clocks = <&mmsys CLK_MM_DISP_AAL>;
            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                   reg = <0>;
+                   aal0_in: endpoint {
+                       remote-endpoint = <&ccorr0_out>;
+                   };
+               };
+
+               port@1 {
+                   reg = <1>;
+                   aal0_out: endpoint {
+                       remote-endpoint = <&gamma0_in>;
+                   };
+               };
+           };
        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 9f8366763831..fca8e7bb0cbc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -57,6 +57,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CCORR input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          CCORR output to the input of the next desired component in the
+          display pipeline, usually only one of the available AAL blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 7df786bbad20..6160439ce4d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -65,6 +65,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: COLOR input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          COLOR output to the input of the next desired component in the
+          display pipeline, for example one of the available CCORR or AAL
+          blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 6fceb1f95d2a..abaf27916d13 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -56,6 +56,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DITHER input, usually from a POSTMASK or GAMMA block.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DITHER output to the input of the next desired component in the
+          display pipeline, for example one of the available DSC compressors,
+          DP_INTF, DSI, LVDS or others.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..b567e3d58aa1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -71,13 +71,34 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPI input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPI output to an HDMI, LVDS or DisplayPort encoder input
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 allOf:
   - if:
@@ -100,7 +121,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
 
-    dpi0: dpi@1401d000 {
+    dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 2cbdd9ee449d..846de6c17d93 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -49,6 +49,30 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Display Stream Compression input, usually from one of the DITHER
+          or MERGE blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Display Stream Compression output to the input of the next desired
+          component in the display pipeline, for example to MERGE, DP_INTF,
+          DPI or DSI.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index a7aa8fcb0dd1..27ffbccc2a08 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -77,6 +77,26 @@ properties:
       Output port node. This port should be connected to the input
       port of an attached DSI panel or DSI-to-eDP encoder chip.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input ports can have multiple endpoints, each of those connects
+      to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI input port, usually from DITHER, DSC or MERGE
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output to an attached DSI panel, or a DSI-to-X encoder chip
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
@@ -86,7 +106,12 @@ required:
   - clock-names
   - phys
   - phy-names
-  - port
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 677882348ede..98db47894eeb 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -110,6 +110,28 @@ properties:
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: ETHDR input, usually from one of the MERGE blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          ETHDR output to the input of the next desired component in the
+          display pipeline, for example one of the available MERGE blocks,
+          or others.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 6823d3ce5049..48542dc7e784 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -65,6 +65,25 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GAMMA input, usually from one of the AAL blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          GAMMA output to the input of the next desired component in the
+          display pipeline, for example one of the available DITHER or
+          POSTMASK blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index dae839279950..0de9f64f3f84 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -77,6 +77,29 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MERGE input port, usually from DITHER, DPI, DSC, DSI, MDP_RDMA,
+          ETHDR or even from a different MERGE block
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MERGE output to a DSC, DPI, DP_INTF, DSI, ETHDR, Write DMA, or
+          a different MERGE block, or others.
+
+    required:
+      - port@0
+      - port@1
+
   resets:
     description: reset controller
       See Documentation/devicetree/bindings/reset/reset.txt for details.
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 831c653caffd..71534febd49c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -38,6 +38,28 @@ properties:
     items:
       - description: OD Clock
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OD input port, usually from an AAL block
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OD output to the input of the next desired component in the
+          display pipeline, for example one of the available RDMA or
+          other blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index c7dd0ef02dcf..bacdfe7d08a6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -57,6 +57,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OVL input port from MMSYS, VDOSYS or other OVLs
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OVL output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, RDMA
+          or WDMA blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index d55611c7ce5e..9ea796a033b2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -75,6 +75,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: OVL input port from MMSYS or one of multiple VDOSYS
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          OVL output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, RDMA
+          or WDMA blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 11fe32e50a59..fb6fe4742624 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -52,6 +52,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: POSTMASK input port, usually from GAMMA
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          POSTMASK output to the input of the next desired component in the
+          display pipeline, for example one of the available DITHER blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 4cadb245d028..878f676b581f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -87,6 +87,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: RDMA input port, usually from MMSYS, OD or OVL
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          RDMA output to the input of the next desired component in the
+          display pipeline, for example one of the available COLOR, DPI,
+          DSI, MERGE or UFOE blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 39e3e2d4a0db..61a5e22effbf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -43,6 +43,27 @@ properties:
     items:
       - description: UFOe Clock
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Input and output ports can have multiple endpoints, each of those
+      connects to either the primary, secondary, etc, display pipeline.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: UFOE input, usually from one of the RDMA blocks.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          UFOE output to the input of the next desired component in the
+          display pipeline, usually one of the available DSI blocks.
+
+    required:
+      - port@0
+      - port@1
+
 required:
   - compatible
   - reg
-- 
2.46.0

