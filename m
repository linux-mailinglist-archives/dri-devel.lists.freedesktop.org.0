Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94A464681
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 06:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A556EAA4;
	Wed,  1 Dec 2021 05:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DD16EA9F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 05:24:39 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB57ADEE;
 Wed,  1 Dec 2021 06:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638336278;
 bh=YbxmCCu6ojK3xz/51HcvwWOkL+O6wJk+ekyjkAR67GI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCAeJVguL/gNVIpd2QXLRCY6i0QW9ER+6VMsIdAqSaMvsRn4WpCTEQ1CN07xqT2iz
 o4cpuKjgcCxa/ccEr9DOX7gEN/HO6qvLBYJPtGFibXXhsMw3n0iZLL4Aim2tfmj92y
 Lgb3XCUHQVegK6F6fY3c3vcE5PGRj1kimrB1Pkec=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add binding for R-Car
 MIPI DSI/CSI-2 TX
Date: Wed,  1 Dec 2021 07:24:05 +0200
Message-Id: <20211201052406.13074-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201052406.13074-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211201052406.13074-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
can operate in either DSI or CSI-2 mode, with up to four data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
new file mode 100644
index 000000000000..afeeb967393d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car MIPI DSI/CSI-2 Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
+  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
+  to four data lanes.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: DSI (and CSI-2) functional clock
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: dsi
+      - const: pll
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: DSI/CSI-2 output port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    dsi0: dsi-encoder@fed80000 {
+        compatible = "renesas,r8a779a0-dsi-csi2-tx";
+        reg = <0xfed80000 0x10000>;
+        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+        clocks = <&cpg CPG_MOD 415>,
+                 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+                 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+        clock-names = "fck", "dsi", "pll";
+        resets = <&cpg 415>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsi0_in: endpoint {
+                    remote-endpoint = <&du_out_dsi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi0_out: endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&sn65dsi86_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 53b859d10de6..caf359403a97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6413,6 +6413,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/pinchartl/media drm/du/next
+F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
-- 
Regards,

Laurent Pinchart

