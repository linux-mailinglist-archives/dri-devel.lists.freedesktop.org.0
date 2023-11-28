Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C997FB892
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146D10E4D0;
	Tue, 28 Nov 2023 10:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12F5810E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:51:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; d="scan'208";a="188375835"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 28 Nov 2023 19:51:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.91])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29B7741DFE5D;
 Tue, 28 Nov 2023 19:51:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 1/5] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Date: Tue, 28 Nov 2023 10:51:25 +0000
Message-Id: <20231128105129.161121-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RZ/G2L LCD controller is composed of Frame Compression Processor
(FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).

The DU module supports the following hardware features
− Display Parallel Interface (DPI) and MIPI LINK Video Interface
− Display timing master
− Generates video timings
− Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
− Supports Progressive
− Input data format (from VSPD): RGB888, RGB666
− Output data format: same as Input data format
− Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
− Supporting WXGA (1280 pixels x 800 lines) for Parallel Output

This patch documents the DU module found on RZ/G2L LCDC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v14->v15:
 * No change.
v13->v14:
 * No change.
v12->v13:
 * No change.
v11->v12:
 * Dropped quotes in ref handle for renesas,vsps property.
 * Retained tags as it is trivial change.
v10->v11:
 * No change
v9->v10:
 * Added Rb tag from Laurent
 * Updated the commit description.
 * Updated description of the port by dropping the text "specified in
   Documentation/devicetree/bindings/graph.txt."
 * Dropped empty endpoint from example.
v8->v9:
 * No change
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change.
v4->v5:
 * Added Rb tag from Rob.
v3->v4:
 * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
 * started using same compatible for RZ/G2{L,LC}
v3: New patch
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
new file mode 100644
index 000000000000..c0ad194c538d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Display Unit (DU)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  These DT bindings describe the Display Unit embedded in the Renesas RZ/G2L
+  and RZ/V2L SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a07g044-du # RZ/G2{L,LC}
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      The connections to the DU output video ports are modeled using the OF
+      graph bindings. The number of ports and their assignment are
+      model-dependent. Each port shall have a single endpoint.
+
+    patternProperties:
+      "^port@[0-1]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+
+    required:
+      - port@0
+
+    unevaluatedProperties: false
+
+  renesas,vsps:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to VSP instance that serves the DU channel
+        - description: Channel index identifying the LIF instance in that VSP
+    description:
+      A list of phandle and channel index tuples to the VSPs that handle the
+      memory interfaces for the DU channels.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - ports
+  - renesas,vsps
+
+additionalProperties: false
+
+examples:
+  # RZ/G2L DU
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@10890000 {
+        compatible = "renesas,r9a07g044-du";
+        reg = <0x10890000 0x10000>;
+        interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+        clock-names = "aclk", "pclk", "vclk";
+        resets = <&cpg R9A07G044_LCDC_RESET_N>;
+        power-domains = <&cpg>;
+
+        renesas,vsps = <&vspd0 0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

