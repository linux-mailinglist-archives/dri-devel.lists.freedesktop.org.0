Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6111D2D6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 17:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48376E0DA;
	Thu, 12 Dec 2019 16:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with SMTP id 077FC6E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 16:54:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDqDrw007082;
 Thu, 12 Dec 2019 07:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158733;
 bh=EswR0BmWkw/8/pKC73xv9M/1eZg9ErLA7+WNQL2k23E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=AvM2rsGi52/I19CxqAMFTIvxzdRopkCcrI8FFlBbSiwFUcIdfJSRnEYWsS554GU+j
 Xelh6SAweFfcVznd17vYN53jfpWpDf6uoExUmX3nqXX3A1ZLdBaAMgFNN3MsMn4OYP
 CcpHhdQVXD5Cr819zcBjzqefuknk90UR6F9qlIYQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDqDUg013181
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:52:13 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:52:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:52:13 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDq1hs023044;
 Thu, 12 Dec 2019 07:52:10 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 3/5] dt-bindings: display: ti,
 j721e-dss: Add dt-schema yaml binding
Date: Thu, 12 Dec 2019 15:51:59 +0200
Message-ID: <113b6d0e42f1959b77294be5dc71543cc2498a13.1576158368.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1576158368.git.jsarha@ti.com>
References: <cover.1576158368.git.jsarha@ti.com>
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 robh+dt@kernel.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
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

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/ti/ti,j721e-dss.yaml     | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
new file mode 100644
index 000000000000..a8a9b35fb9d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -0,0 +1,184 @@
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
+    maxItems: 17
+    minItems: 17
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
+    maxItems: 5
+    minItems: 5
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
+    maxItems: 4
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
