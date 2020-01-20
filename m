Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB414332D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 22:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7059D6EB2C;
	Mon, 20 Jan 2020 21:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7487A6EB2C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 21:02:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2Uov087360;
 Mon, 20 Jan 2020 15:02:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579554150;
 bh=MnX+ysWBp2+9qOcS46JRIqQQnhbZqcuBPAFZfC+HrwM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mi+vSefFvxcwUDs99ZCdzkhcYPLn/36g1d654Y3y7inw7fHyM8LssdABurcX/3zks
 IyACkR6wHzHaCNatp0QA1WiVwShX4Im/3SPH20Wexb5jJw5WPC0hSpVpHwIhEWLLgH
 JRfvAON+B1HGrdrN5ZmpFBPLR7/t3mjWxDqLWRjs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KL2USV021657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jan 2020 15:02:30 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 15:02:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 15:02:30 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2PYY079658;
 Mon, 20 Jan 2020 15:02:28 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v8 1/5] dt-bindings: display: ti,
 k2g-dss: Add dt-schema yaml binding
Date: Mon, 20 Jan 2020 23:02:20 +0200
Message-ID: <048190779ef056f407e812f85e955b6eecdf6cef.1579553817.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579553817.git.jsarha@ti.com>
References: <cover.1579553817.git.jsarha@ti.com>
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

Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
Keystone Display SubSystem.

Version history:

v2: no change

v3: - Add ports node
    - Add includes to dts example
    - reindent dts example

v4: - Add descriptions to reg and clocks properties
    - Remove minItems when its value is the same as maxItems value
    - Remove ports node

v5: - itemize reg and clocks properties' descriptions

v6: - Add Reviewed-by: from Rob Herring <robh@kernel.org> and
      Benoit Parrot <bparrot@ti.com>

v7: no change

v8: no change

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 .../bindings/display/ti/ti,k2g-dss.yaml       | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
new file mode 100644
index 000000000000..532bb4794968
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments K2G Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The K2G DSS is an ultra-light version of TI Keystone Display
+  SubSystem. It has only one output port and video plane. The
+  output is DPI.
+
+properties:
+  compatible:
+    const: ti,k2g-dss
+
+  reg:
+    items:
+      - description: cfg DSS top level
+      - description: common DISPC common
+      - description: VID1 video plane 1
+      - description: OVR1 overlay manager for vp1
+      - description: VP1 video port 1
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: common
+      - const: vid1
+      - const: ovr1
+      - const: vp1
+
+  clocks:
+    items:
+      - description: fck DSS functional clock
+      - description: vp1 Video Port 1 pixel clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  port:
+    type: object
+    description:
+      Port as described in Documentation/devictree/bindings/graph.txt.
+      The DSS DPI output port node
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
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dss: dss@02540000 {
+            compatible = "ti,k2g-dss";
+            reg =   <0x02540000 0x400>,
+                    <0x02550000 0x1000>,
+                    <0x02557000 0x1000>,
+                    <0x0255a800 0x100>,
+                    <0x0255ac00 0x100>;
+            reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
+            clocks =        <&k2g_clks 0x2 0>,
+                            <&k2g_clks 0x2 1>;
+            clock-names = "fck", "vp1";
+            interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
+
+            power-domains = <&k2g_pds 0x2>;
+
+            max-memory-bandwidth = <230000000>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            dpi_out: endpoint {
+                                    remote-endpoint = <&sii9022_in>;
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
