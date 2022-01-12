Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525448CA39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0264C10E74E;
	Wed, 12 Jan 2022 17:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id C419D10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:47:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106270412"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:47:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB2244005E1F;
 Thu, 13 Jan 2022 02:47:12 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX
 bindings
Date: Wed, 12 Jan 2022 17:46:05 +0000
Message-Id: <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
can operate in DSI mode, with up to four data lanes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
new file mode 100644
index 000000000000..8e56a9c53cc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car MIPI DSI Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This binding describes the MIPI DSI encoder embedded in the Renesas
+  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
+  to four data lanes.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a07g044-mipi-dsi    # for RZ/G2L
+
+  reg:
+    items:
+      - description: Link register
+      - description: D-PHY register
+
+  clocks:
+    items:
+      - description: DSI D-PHY PLL multiplied clock
+      - description: DSI D-PHY system clock
+      - description: DSI AXI bus clock
+      - description: DSI Register access clock
+      - description: DSI Video clock
+      - description: DSI D_PHY Escape mode Receive clock
+
+  clock-names:
+    items:
+      - const: pllclk
+      - const: sysclk
+      - const: aclk
+      - const: pclk
+      - const: vclk
+      - const: lpclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+      - description: MIPI_DSI_PRESET_N
+
+  reset-names:
+    items:
+      - const: rst
+      - const: arst
+      - const: prst
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
+        description: DSI output port
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
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    dsi0: dsi@10860000 {
+        compatible = "renesas,r9a07g044-mipi-dsi";
+        reg = <0x10860000 0x10000>,
+              <0x10850000 0x10000>;
+        power-domains = <&cpg>;
+        clocks = <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
+        clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+        resets = <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
+                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
+        reset-names = "rst", "arst", "prst";
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
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&adv7535_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.17.1

