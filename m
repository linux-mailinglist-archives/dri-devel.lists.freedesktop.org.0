Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A46932217
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95210E5D8;
	Tue, 16 Jul 2024 08:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="e30QtP4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2610E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:43:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G8gsGa088650;
 Tue, 16 Jul 2024 03:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1721119374;
 bh=qS/+fArRdaZxireGWQlgcyboAk2UhxUdlv/AjcgNkbI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=e30QtP4HTK+zfgkmTNZfg5kK7+nQ5sERORgZ5xa+IwCbHwBkZpcrjfrtKOr1x+rHJ
 NQbobRXXYyR7dn5S6TuVYAVh5kSpjel4P4I0fiJaMf5kUXubDN09b2/aWLv1ygUCXv
 2IlttIwszlUeUz35rPYchuiV/bpCi5jGtlBtiNdI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G8gsKA015759
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jul 2024 03:42:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 03:42:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 03:42:54 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G8grPh118721;
 Tue, 16 Jul 2024 03:42:53 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 3/4] dt-bindings: display: ti,
 am65x-dss: Add OLDI properties for AM625 DSS
Date: Tue, 16 Jul 2024 14:12:47 +0530
Message-ID: <20240716084248.1393666-4-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716084248.1393666-1-a-bhatia1@ti.com>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSS in AM625 SoC has 2 OLDI TXes. Refer the OLDI schema to add the
support for the OLDI TXes.

The AM625 DSS VP1 (port@0) can connect and control 2 OLDI TXes, to use
them in dual-link or cloned single-link OLDI modes. Add support for an
additional endpoint under the port@0 to accurately depict the data flow
path.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 399d68986326..249597455d34 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -91,6 +91,24 @@ properties:
           For AM625 DSS, the internal DPI output port node from video
           port 1.
           For AM62A7 DSS, the port is tied off inside the SoC.
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description:
+              For AM625 DSS, VP Connection to OLDI0.
+              For AM65X DSS, OLDI output from the SoC.
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description:
+              For AM625 DSS, VP Connection to OLDI1.
+
+        anyOf:
+          - required:
+              - endpoint
+          - required:
+              - endpoint@0
+              - endpoint@1
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -112,6 +130,23 @@ properties:
       Input memory (from main memory to dispc) bandwidth limit in
       bytes per second
 
+  oldi-txes:
+    type: object
+    additionalProperties: true
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      '^oldi_tx@[0-1]$':
+        type: object
+        $ref: ti,am625-oldi.yaml#
+        unevaluatedProperties: false
+        description: OLDI transmitters connected to the DSS VPs
+
 allOf:
   - if:
       properties:
@@ -123,6 +158,19 @@ allOf:
         ports:
           properties:
             port@0: false
+            oldi_txes: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am65x-dss
+    then:
+      properties:
+        oldi_txes: false
+        port@0:
+          properties:
+            endpoint@1: false
 
 required:
   - compatible
@@ -171,3 +219,90 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dss1: dss@30200000 {
+            compatible = "ti,am625-dss";
+            reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+                  <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+                  <0x00 0x30206000 0x00 0x1000>, /* vid */
+                  <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+                  <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
+                  <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+                  <0x00 0x3020b000 0x00 0x1000>, /* vp2 */
+                  <0x00 0x30201000 0x00 0x1000>; /* common1 */
+            reg-names = "common", "vidl1", "vid",
+                        "ovr1", "ovr2", "vp1", "vp2", "common1";
+            power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
+            clocks =        <&k3_clks 186 6>,
+                            <&vp1_clock>,
+                            <&k3_clks 186 2>;
+            clock-names = "fck", "vp1", "vp2";
+            interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+            oldi-txes {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                oldi0: oldi@0 {
+                    reg = <0>;
+                    clocks = <&k3_clks 186 0>;
+                    clock-names = "s_clk";
+                    ti,companion-oldi = <&oldi1>;
+                    ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            oldi0_in: endpoint {
+                                remote-endpoint = <&dpi0_out0>;
+                            };
+                        };
+                    };
+                };
+                oldi1: oldi@1 {
+                    reg = <1>;
+                    ti,secondary-oldi;
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            oldi1_in: endpoint {
+                                remote-endpoint = <&dpi0_out1>;
+                            };
+                        };
+                    };
+                };
+            };
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+                    dpi0_out0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&oldi0_in>;
+                    };
+                    dpi0_out1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&oldi1_in>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    dpi1_out: endpoint {
+                        remote-endpoint = <&hdmi_bridge>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

