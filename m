Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E014A7AF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 17:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAFD6E27F;
	Mon, 27 Jan 2020 16:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547316E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 16:00:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RG0iw4089663;
 Mon, 27 Jan 2020 10:00:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580140844;
 bh=bnPuloQjKWuewJdb3XKCAjf/rQRq5GiWro7S9oPJk6M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NHXDw0IDaFDfEBZgJI7bFMhyFVHeDkzfNXlJUri2jIJwqcoJA7HXNnIym5pyjoIGE
 WmMOSvZfQL8LhFoudTH3A0CR4u/r/Wbt74elYMlFYKSrsRJfPtEyzeTYLFi5Uum/wC
 MV8unqUBx02KC1OXwFVHqValq5SPPuKdSRNrA3FQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RG0iEh077498
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jan 2020 10:00:44 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 10:00:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 10:00:42 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RG0XSK056344;
 Mon, 27 Jan 2020 10:00:40 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 3/5] dt-bindings: display: ti,
 j721e-dss: Add dt-schema yaml binding
Date: Mon, 27 Jan 2020 18:00:30 +0200
Message-ID: <fcba52837808853a4b2bf729bd33bd986cbdadf4.1580129724.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580129724.git.jsarha@ti.com>
References: <cover.1580129724.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com, jsarha@ti.com,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
Display SubSystem.

Version history:

v2: no change

v3: - reg-names: "wp" -> "wb"
    - Add ports node
    - Add includes to dts example
    - reindent dts example

v4: - Add descriptions to reg, clocks, and interrupts properties
    - Remove minItems when its value is the same as maxItems value

v5: - itemize reg, clocks and interrupts properties' descriptions
    - there is no "vp" reg-name, only "wb" for write back

v6: - Add Reviewed-by: from Rob Herring <robh@kernel.org> and
      Benoit Parrot <bparrot@ti.com>

v7: no change

v8: no change

v9: no change

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 .../bindings/display/ti/ti,j721e-dss.yaml     | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
new file mode 100644
index 000000000000..ade9b2f513f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments J721E Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The J721E TI Keystone Display SubSystem with four output ports and
+  four video planes. There is two full video planes and two "lite
+  planes" without scaling support. The video ports can be connected to
+  the SoC's DPI pins or to integrated display bridges on the SoC.
+
+properties:
+  compatible:
+    const: ti,j721e-dss
+
+  reg:
+    items:
+      - description: common_m DSS Master common
+      - description: common_s0 DSS Shared common 0
+      - description: common_s1 DSS Shared common 1
+      - description: common_s2 DSS Shared common 2
+      - description: VIDL1 light video plane 1
+      - description: VIDL2 light video plane 2
+      - description: VID1 video plane 1
+      - description: VID1 video plane 2
+      - description: OVR1 overlay manager for vp1
+      - description: OVR2 overlay manager for vp2
+      - description: OVR3 overlay manager for vp3
+      - description: OVR4 overlay manager for vp4
+      - description: VP1 video port 1
+      - description: VP2 video port 2
+      - description: VP3 video port 3
+      - description: VP4 video port 4
+      - description: WB Write Back
+
+  reg-names:
+    items:
+      - const: common_m
+      - const: common_s0
+      - const: common_s1
+      - const: common_s2
+      - const: vidl1
+      - const: vidl2
+      - const: vid1
+      - const: vid2
+      - const: ovr1
+      - const: ovr2
+      - const: ovr3
+      - const: ovr4
+      - const: vp1
+      - const: vp2
+      - const: vp3
+      - const: vp4
+      - const: wb
+
+  clocks:
+    items:
+      - description: fck DSS functional clock
+      - description: vp1 Video Port 1 pixel clock
+      - description: vp2 Video Port 2 pixel clock
+      - description: vp3 Video Port 3 pixel clock
+      - description: vp4 Video Port 4 pixel clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+      - const: vp2
+      - const: vp3
+      - const: vp4
+
+  interrupts:
+     items:
+      - description: common_m DSS Master common
+      - description: common_s0 DSS Shared common 0
+      - description: common_s1 DSS Shared common 1
+      - description: common_s2 DSS Shared common 2
+
+  interrupt-names:
+    items:
+      - const: common_m
+      - const: common_s0
+      - const: common_s1
+      - const: common_s2
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devictree/bindings/graph.txt
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          The output port node form video port 1
+
+      port@1:
+        type: object
+        description:
+          The output port node from video port 2
+
+      port@2:
+        type: object
+        description:
+          The output port node from video port 3
+
+      port@3:
+        type: object
+        description:
+          The output port node from video port 4
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input memory (from main memory to dispc) bandwidth limit in
+      bytes per second
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    dss: dss@04a00000 {
+            compatible = "ti,j721e-dss";
+            reg =   <0x00 0x04a00000 0x00 0x10000>, /* common_m */
+                    <0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
+                    <0x00 0x04b00000 0x00 0x10000>, /* common_s1*/
+                    <0x00 0x04b10000 0x00 0x10000>, /* common_s2*/
+                    <0x00 0x04a20000 0x00 0x10000>, /* vidl1 */
+                    <0x00 0x04a30000 0x00 0x10000>, /* vidl2 */
+                    <0x00 0x04a50000 0x00 0x10000>, /* vid1 */
+                    <0x00 0x04a60000 0x00 0x10000>, /* vid2 */
+                    <0x00 0x04a70000 0x00 0x10000>, /* ovr1 */
+                    <0x00 0x04a90000 0x00 0x10000>, /* ovr2 */
+                    <0x00 0x04ab0000 0x00 0x10000>, /* ovr3 */
+                    <0x00 0x04ad0000 0x00 0x10000>, /* ovr4 */
+                    <0x00 0x04a80000 0x00 0x10000>, /* vp1 */
+                    <0x00 0x04aa0000 0x00 0x10000>, /* vp2 */
+                    <0x00 0x04ac0000 0x00 0x10000>, /* vp3 */
+                    <0x00 0x04ae0000 0x00 0x10000>, /* vp4 */
+                    <0x00 0x04af0000 0x00 0x10000>; /* wb */
+            reg-names = "common_m", "common_s0",
+                    "common_s1", "common_s2",
+                    "vidl1", "vidl2","vid1","vid2",
+                    "ovr1", "ovr2", "ovr3", "ovr4",
+                    "vp1", "vp2", "vp3", "vp4",
+                    "wb";
+            clocks =        <&k3_clks 152 0>,
+                            <&k3_clks 152 1>,
+                            <&k3_clks 152 4>,
+                            <&k3_clks 152 9>,
+                            <&k3_clks 152 13>;
+            clock-names = "fck", "vp1", "vp2", "vp3", "vp4";
+            power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
+            interrupts =    <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names =       "common_m",
+                                    "common_s0",
+                                    "common_s1",
+                                    "common_s2";
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+
+                            dpi_out_0: endpoint {
+                                    remote-endpoint = <&dp_bridge_input>;
+                            };
+                    };
+            };
+    };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
