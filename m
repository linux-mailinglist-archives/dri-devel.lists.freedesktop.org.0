Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED111D815
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 21:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BCE6E1E9;
	Thu, 12 Dec 2019 20:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD766E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 20:49:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDqBUd120811;
 Thu, 12 Dec 2019 07:52:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158731;
 bh=iebveN5eENepG2qkcaAtHc8Cz+P3AubKtmhx+asuWXQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=C+XKVUleMGowpdWanccx7wPOPv58iO6CAFbcMxoAVrHLDYt7djEuFQ0xkAlLOu4Xh
 dWa8RMGsZdLGSpLTf5o3MC4xh2vxWsqy1Ve8kS8YDuWDPwkJ/HQp2+rcdOWo3XsBx+
 4xdM24Q29xmJN6SwNavS1Fpe2qB3HtgezThGaCgk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDqBr0013115
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:52:11 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:52:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:52:10 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDq1hr023044;
 Thu, 12 Dec 2019 07:52:07 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 2/5] dt-bindings: display: ti,
 am65x-dss: Add dt-schema yaml binding
Date: Thu, 12 Dec 2019 15:51:58 +0200
Message-ID: <10030be376cdb7a44bc2bd762cf92f2ccf8c7ced.1576158368.git.jsarha@ti.com>
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

Add dt-schema yaml bindig for AM65x DSS, AM65x version TI Keystone
Display SubSystem.

Version history:

v2: no change

v3: - Add ports node
    - use allOf in ti,am65x-oldi-io-ctrl to add both $ref and maxItems
    - Add includes to dts example
    - reindent dts example

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
new file mode 100644
index 000000000000..d5d974828b20
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments AM65x Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The AM65x TI Keystone Display SubSystem with two output ports and
+  two video planes. The first video port supports OLDI and the second
+  supports DPI format. The fist plane is full video plane with all
+  features and the second is a "lite plane" without scaling support.
+
+properties:
+  compatible:
+    const: ti,am65x-dss
+
+  reg:
+    maxItems: 7
+    minItems: 7
+
+  reg-names:
+    items:
+      - const: common
+      - const: vidl1
+      - const: vid
+      - const: ovr1
+      - const: ovr2
+      - const: vp1
+      - const: vp2
+
+  clocks:
+    maxItems: 3
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+      - const: vp2
+
+  interrupts:
+    maxItems: 1
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
+          The DSS OLDI output port node form video port 1
+
+      port@1:
+        type: object
+        description:
+          The DSS DPI output port node from video port 2
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+  ti,am65x-oldi-io-ctrl:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+      - maxItems: 1
+    description:
+      phandle to syscon device node mapping OLDI IO_CTRL registers.
+      The mapped range should point to OLDI_DAT0_IO_CTRL, map it and
+      following OLDI_DAT1_IO_CTRL, OLDI_DAT2_IO_CTRL, OLDI_DAT3_IO_CTRL,
+      and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
+      interface to work.
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
+            compatible = "ti,am65x-dss";
+            reg =   <0x0 0x04a00000 0x0 0x1000>, /* common */
+                    <0x0 0x04a02000 0x0 0x1000>, /* vidl1 */
+                    <0x0 0x04a06000 0x0 0x1000>, /* vid */
+                    <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
+                    <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
+                    <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
+                    <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
+            reg-names = "common", "vidl1", "vid",
+                    "ovr1", "ovr2", "vp1", "vp2";
+            ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+            power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
+            clocks =        <&k3_clks 67 1>,
+                            <&k3_clks 216 1>,
+                            <&k3_clks 67 2>;
+            clock-names = "fck", "vp1", "vp2";
+            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+                            oldi_out0: endpoint {
+                                    remote-endpoint = <&lcd_in0>;
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
