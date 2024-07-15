Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B55931B8D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 22:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769810E517;
	Mon, 15 Jul 2024 20:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fQS3Zbai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A6510E516
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 20:10:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FK9w8S003467;
 Mon, 15 Jul 2024 15:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1721074198;
 bh=UHyi6cL01lSknqMmHGFAmca9oek9TO+uJfRuqdcTrhQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fQS3Zbai/XwgYfFLZl9EI9DB/Jak3WogZl0t7E341HaRjOE7MxaHUdmPBLYeBiL2w
 1i5fKIVwnNtL2cs1klkBaa5tJLMuLqI2Mng37iFFibBPni7rVaZWsnLPugPEUF7M2m
 MEiINLvU22R5vGHGEUHOFORLm3vRErd4H4/dsKQo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FK9wpc073586
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Jul 2024 15:09:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 15:09:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 15:09:57 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FK9uE1034960;
 Mon, 15 Jul 2024 15:09:57 -0500
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
Subject: [PATCH v2 2/4] dt-bindings: display: ti: Add schema for AM625 OLDI
 Transmitter
Date: Tue, 16 Jul 2024 01:39:51 +0530
Message-ID: <20240715200953.1213284-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715200953.1213284-1-a-bhatia1@ti.com>
References: <20240715200953.1213284-1-a-bhatia1@ti.com>
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

The OLDI (transmitters) TXes do not have registers of their own, and are
dependent on the source video-ports from the DSS to provide
configuration data. This hardware doesn't directly sit on the internal
bus of the SoC, but does so via the DSS. Hence, the OLDI TXes are
supposed to be child nodes under the DSS, and not independent devices.

Two of the OLDI TXes can function in tandem to output dual-link OLDI
output, or cloned single-link outputs. In these cases, one OLDI will be
the primary OLDI, and the other one, a companion.

The OLDI functionality is further supported by a system-control module,
which contains a few registers to control OLDI IO power and
characteristics.

Add devicetree binding schema for AM625 OLDI TXes.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../bindings/display/ti/ti,am625-oldi.yaml    | 153 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
new file mode 100644
index 000000000000..0a96e600bc0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM625 OLDI Transmitter
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+  - Aradhya Bhatia <a-bhatia1@ti.com>
+
+description: |
+  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
+  pixel data transmission between host and flat panel display over LVDS (Low
+  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
+  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
+  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
+  padded and un-padded 18-bit RGB bus formats as input.
+
+properties:
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: serial clock input for the OLDI transmitters
+
+  clock-names:
+    const: s_clk
+
+  ti,companion-oldi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to companion OLDI transmitter. This property is mandatory for the
+      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
+      mode or in clone mode. This property should point to the secondary OLDI
+      TX.
+
+  ti,secondary-oldi:
+    type: boolean
+    description: Boolean property to mark an OLDI TX as secondary node.
+
+  ti,oldi-io-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
+      control MMR region. This property is needed for OLDI interface to work.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel RGB input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: LVDS output port
+
+    required:
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      properties:
+        ti,secondary-oldi: true
+    then:
+      properties:
+        ti,companion-oldi: false
+        ti,oldi-io-ctrl: false
+        clocks: false
+        clock-names: false
+
+    else:
+      required:
+        - ti,oldi-io-ctrl
+        - clocks
+        - clock-names
+
+required:
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    oldi_txes {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        oldi: oldi@0 {
+            reg = <0>;
+            clocks = <&k3_clks 186 0>;
+            clock-names = "s_clk";
+            ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    oldi_in: endpoint {
+                        remote-endpoint = <&dpi0_out>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    oldi_txes {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        oldi0: oldi@0 {
+            reg = <0>;
+            clocks = <&k3_clks 186 0>;
+            clock-names = "s_clk";
+            ti,companion-oldi = <&oldi1>;
+            ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    oldi0_in: endpoint {
+                        remote-endpoint = <&dpi0_out0>;
+                    };
+                };
+            };
+        };
+        oldi1: oldi@1 {
+            reg = <1>;
+            ti,secondary-oldi;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    oldi1_in: endpoint {
+                        remote-endpoint = <&dpi0_out1>;
+                    };
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fb1df8c29f5a..26b1dd3367c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7642,6 +7642,7 @@ M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
-- 
2.34.1

