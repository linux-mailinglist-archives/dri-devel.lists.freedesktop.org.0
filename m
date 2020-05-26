Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A899519EE8D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 01:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D16D6E264;
	Sun,  5 Apr 2020 23:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7A06E214
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 23:23:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8123D11FB;
 Mon,  6 Apr 2020 01:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586129016;
 bh=MMnTyyafrHjma9T6pe1YAAHr4Ss9Oe2cgAXFU/1HJ0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OiOlf2bBUfLZYOC8E/7YIGrvonDXquTC1D7NBYziZeot3ngTdoDyeadHf0/2mC/3Q
 F9iV5SZcyQW7fNIiBrOAGI7Gos7hSvY3E9uJNLdwxrD0VfxJHPqohDeFa8KzGWjwlZ
 fdM3ns6OrMUkcxZ3LZ/dQ/2GQsJisAA607TpRIEg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: display: bridge: renesas,
 lvds: Convert binding to YAML
Date: Mon,  6 Apr 2020 02:23:18 +0300
Message-Id: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Renesas R-Car LVDS encoder text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/renesas,lvds.txt  |  85 ------
 .../bindings/display/bridge/renesas,lvds.yaml | 248 ++++++++++++++++++
 2 files changed, 248 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
deleted file mode 100644
index c62ce2494ed9..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ /dev/null
@@ -1,85 +0,0 @@
-Renesas R-Car LVDS Encoder
-==========================
-
-These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
-Gen2, R-Car Gen3 and RZ/G SoCs.
-
-Required properties:
-
-- compatible : Shall contain one of
-  - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
-  - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
-  - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders
-  - "renesas,r8a774b1-lvds" for R8A774B1 (RZ/G2N) compatible LVDS encoders
-  - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
-  - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
-  - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
-  - "renesas,r8a7793-lvds" for R8A7793 (R-Car M2-N) compatible LVDS encoders
-  - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
-  - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
-  - "renesas,r8a77965-lvds" for R8A77965 (R-Car M3-N) compatible LVDS encoders
-  - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
-  - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
-  - "renesas,r8a77990-lvds" for R8A77990 (R-Car E3) compatible LVDS encoders
-  - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
-
-- reg: Base address and length for the memory-mapped registers
-- clocks: A list of phandles + clock-specifier pairs, one for each entry in
-  the clock-names property.
-- clock-names: Name of the clocks. This property is model-dependent.
-  - The functional clock, which mandatory for all models, shall be listed
-    first, and shall be named "fck".
-  - On R8A77990, R8A77995 and R8A774C0, the LVDS encoder can use the EXTAL or
-    DU_DOTCLKINx clocks. Those clocks are optional. When supplied they must be
-    named "extal" and "dclkin.x" respectively, with "x" being the DU_DOTCLKIN
-    numerical index.
-  - When the clocks property only contains the functional clock, the
-    clock-names property may be omitted.
-- resets: A phandle + reset specifier for the module reset
-
-Required nodes:
-
-The LVDS encoder has two video ports. Their connections are modelled using the
-OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 corresponds to the parallel RGB input
-- Video port 1 corresponds to the LVDS output
-
-Each port shall have a single endpoint.
-
-Optional properties:
-
-- renesas,companion : phandle to the companion LVDS encoder. This property is
-  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-  the second encoder to be used as a companion in dual-link mode. It shall not
-  be set for any other LVDS encoder.
-
-
-Example:
-
-	lvds0: lvds@feb90000 {
-		compatible = "renesas,r8a77990-lvds";
-		reg = <0 0xfeb90000 0 0x20>;
-		clocks = <&cpg CPG_MOD 727>;
-		power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-		resets = <&cpg 727>;
-
-		renesas,companion = <&lvds1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				lvds0_in: endpoint {
-					remote-endpoint = <&du_out_lvds0>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				lvds0_out: endpoint {
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
new file mode 100644
index 000000000000..47af3dea3075
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -0,0 +1,248 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car LVDS Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
+  Gen2, R-Car Gen3 and RZ/G SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a7743-lvds # for R8A7743 (RZ/G1M) compatible LVDS encoders
+      - renesas,r8a7744-lvds # for R8A7744 (RZ/G1N) compatible LVDS encoders
+      - renesas,r8a774a1-lvds # for R8A774A1 (RZ/G2M) compatible LVDS encoders
+      - renesas,r8a774b1-lvds # for R8A774B1 (RZ/G2N) compatible LVDS encoders
+      - renesas,r8a774c0-lvds # for R8A774C0 (RZ/G2E) compatible LVDS encoders
+      - renesas,r8a7790-lvds # for R8A7790 (R-Car H2) compatible LVDS encoders
+      - renesas,r8a7791-lvds # for R8A7791 (R-Car M2-W) compatible LVDS encoders
+      - renesas,r8a7793-lvds # for R8A7793 (R-Car M2-N) compatible LVDS encoders
+      - renesas,r8a7795-lvds # for R8A7795 (R-Car H3) compatible LVDS encoders
+      - renesas,r8a7796-lvds # for R8A7796 (R-Car M3-W) compatible LVDS encoders
+      - renesas,r8a77965-lvds # for R8A77965 (R-Car M3-N) compatible LVDS encoders
+      - renesas,r8a77970-lvds # for R8A77970 (R-Car V3M) compatible LVDS encoders
+      - renesas,r8a77980-lvds # for R8A77980 (R-Car V3H) compatible LVDS encoders
+      - renesas,r8a77990-lvds # for R8A77990 (R-Car E3) compatible LVDS encoders
+      - renesas,r8a77995-lvds # for R8A77995 (R-Car D3) compatible LVDS encoders
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  resets:
+    maxItems: 1
+
+  ports:
+    type: object
+    description: |
+      This device has two video ports. Their connections are modelled using the
+      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+      Each port shall have a single endpoint.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: Parallel RGB input port
+
+      port@1:
+        type: object
+        description: LVDS output port
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+  power-domains:
+    maxItems: 1
+
+  renesas,companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the companion LVDS encoder. This property is mandatory
+      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
+      the second encoder to be used as a companion in dual-link mode. It
+      shall not be set for any other LVDS encoder.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+if:
+  properties:
+    compatible:
+      enum:
+        - renesas,r8a774c0-lvds
+        - renesas,r8a77990-lvds
+        - renesas,r8a77995-lvds
+then:
+  properties:
+    clocks:
+      minItems: 1
+      maxItems: 4
+      items:
+        - description: Functional clock
+        - description: EXTAL input clock
+        - description: DU_DOTCLKIN0 input clock
+        - description: DU_DOTCLKIN1 input clock
+
+    clock-names:
+      minItems: 1
+      maxItems: 4
+      items:
+        - const: fck
+        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
+        # These clocks are optional.
+        - enum:
+          - extal
+          - dclkin.0
+          - dclkin.1
+        - enum:
+          - extal
+          - dclkin.0
+          - dclkin.1
+        - enum:
+          - extal
+          - dclkin.0
+          - dclkin.1
+
+  required:
+    - clock-names
+
+else:
+  properties:
+    clocks:
+      maxItems: 1
+      items:
+        - description: Functional clock
+
+    clock-names:
+      maxItems: 1
+      items:
+        - const: fck
+
+    renesas,companion: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    lvds@feb90000 {
+        compatible = "renesas,r8a7795-lvds";
+        reg = <0 0xfeb90000 0 0x14>;
+        clocks = <&cpg CPG_MOD 727>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 727>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                lvds_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/power/r8a77990-sysc.h>
+
+    lvds0: lvds@feb90000 {
+        compatible = "renesas,r8a77990-lvds";
+        reg = <0 0xfeb90000 0 0x20>;
+        clocks = <&cpg CPG_MOD 727>,
+                 <&x13_clk>,
+                 <&extal_clk>;
+        clock-names = "fck", "dclkin.0", "extal";
+        power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+        resets = <&cpg 727>;
+
+        renesas,companion = <&lvds1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds0_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                lvds0_out: endpoint {
+                    remote-endpoint = <&panel_in1>;
+                };
+            };
+        };
+    };
+
+    lvds1: lvds@feb90100 {
+        compatible = "renesas,r8a77990-lvds";
+        reg = <0 0xfeb90100 0 0x20>;
+        clocks = <&cpg CPG_MOD 727>,
+                 <&x13_clk>,
+                 <&extal_clk>;
+        clock-names = "fck", "dclkin.0", "extal";
+        power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+        resets = <&cpg 726>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds1_in: endpoint {
+                    remote-endpoint = <&du_out_lvds1>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                lvds1_out: endpoint {
+                    remote-endpoint = <&panel_in2>;
+                };
+            };
+        };
+    };
+
+...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
