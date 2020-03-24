Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E906D192273
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCDF6E5BF;
	Wed, 25 Mar 2020 08:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Tue, 24 Mar 2020 17:26:54 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C45F6E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 647C34050B;
 Tue, 24 Mar 2020 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585070358; bh=Lnf47MxQajmRGWZQ3mzk9iAeP2PlKL9Y23bhISLZFxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=i/89LTVni6XgdJTJbpu+5KIPXIJobVxzveuQuD8J2khLGgfY6oulxnp1nkaPbvrUI
 qPRJ4Av2fJCg9pkqd7cV2x1SLH3jFeox5TqU8hkXMN6HWOl1rPre21uHJK1ceOs6wQ
 iBEJfC07rSyaIR8T+JgBO5KF8A7ZDaxE2SpRm18zvepxPuy9J7aGdUvfVui+EF9jP3
 DKxd6kKpR+l3t8+y8Im15l4sR0QjVqYt2Qll5aiOshb5biVMwNomMsHeicHHdHmdGz
 pyUy6Doio5X9eZPh2UOVFUlsyYX5Hoq5UEedVKOLlqoXJW1nI8cwax40E0ojFB0cCK
 lFMjsq164v1Mg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8D3ADA005C;
 Tue, 24 Mar 2020 17:19:15 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: Add IPK DSI subsystem bindings
Date: Tue, 24 Mar 2020 18:18:19 +0100
Message-Id: <0bc20739facfa519296defe2a367774a7b5a355d.1585067507.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
References: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
References: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for Synopsys DesignWare MIPI DSI Host and VPG (Video
Pattern Generator) support in the IPK display subsystem.

The Synopsys DesignWare IPK display video pipeline is composed by a DSI
controller (snps,dw-ipk-dsi) and a VPG (snps,dw-ipk-vpg) as DPI
stimulus. Typically is used the Raspberry Pi
(raspberrypi,7inch-touchscreen-panel) as DSI panel that requires a
I2C controller (snps,designware-i2c).

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
 .../bindings/display/snps,dw-ipk-dsi.yaml          | 163 +++++++++++++++++++++
 .../bindings/display/snps,dw-ipk-vpg.yaml          |  77 ++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml

diff --git a/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml b/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
new file mode 100644
index 0000000..75e65ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/snps,dw-ipk-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare IPK specific extensions for the Synopsys DSI host
+       controller.
+
+maintainers:
+  - Angelo Ribeiro <angelo.ribeiro@synopsys.com>
+
+description:
+  The Synopsys DesignWare IPK DSI controller uses the Synopsys DesignWare MIPI
+  DSI host controller.
+  For more info please refer to
+  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt.
+
+properties:
+  compatible:
+    const: snps,dw-ipk-dsi
+
+  reg:
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: DW MIPI DSI Host registers
+      - description: DW Phy registers
+
+  reg-names:
+    items:
+     - const: dsi
+     - const: phy
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: Peripheral clock
+      - description: PLL clock
+      - description: Pixel clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+      - const: px_clk
+
+  resets:
+    maxItems: 1
+    items:
+      - description: APB reset line
+
+  reset-names:
+    items:
+      - const: apb
+
+  ports:
+    type: object
+    description:
+      A port node as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt and
+      Documentation/devicetree/bindings/graph.txt.
+    properties:
+      port@0:
+        type: object
+        description:
+          Input endpoint of the controller, connects to a DPI source.
+
+      port@1:
+        type: object
+        description:
+          Output endpoint of the controller, connects to a panel or a bridge
+          input port.
+
+patternProperties:
+  "^(panel|panel-dsi)@[0-9]$":
+    type: object
+    description:
+      A node containing the panel or bridge description as defined in
+      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt.
+    properties:
+      port:
+        type: object
+        description:
+          Panel or bridge port node connected to the DSI output port (port@1).
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - reset
+  - reset-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi1: dw-ipk-dsi@0x02000 {
+        compatible = "snps,dw-ipk-dsi";
+        reg = <0x02000 0xfff>, <0x05000 0xfff>;
+        reg-names = "dsi", "phy";
+        clocks = <&apb_clk>, <&pll_clk>;
+        clock-names = "pclk", "ref";
+        resets = <&ipk_rst 1>;
+        reset-names = "apb";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsi1_in: endpoint@0 {
+                    remote-endpoint = <&vbridge_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi_out_port: endpoint {
+                    remote-endpoint = <&panel_dsi_port>;
+                };
+            };
+        };
+    };
+
+    i2c@0x01000 {
+        compatible = "snps,designware-i2c";
+        reg = <0x01000 0x100>;
+        clock-frequency = <400000>;
+        clocks = <&i2cclk>;
+        interrupts = <0>;
+        resets = <&ipk_rst 0>;
+        reset-names = "i2c";
+
+        lcd@45 {
+            compatible = "raspberrypi,7inch-touchscreen-panel";
+            reg = <0x45>;
+
+            port {
+                panel_dsi_port: endpoint {
+                    remote-endpoint = <&dsi_out_port>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml b/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
new file mode 100644
index 0000000..60f2f36
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/snps,dw-ipk-vpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Video Pattern Generator (VPG) for MIPI DSI HOST
+
+maintainers:
+  - Angelo Ribeiro <angelo.ribeiro@synopsys.com>
+
+properties:
+  compatible:
+    const: snps,dw-ipk-vpg
+
+  reg:
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: Video Pattern Generator registers
+      - description: Clock generator (MMCM) registers
+
+  reg-names:
+   items:
+     - const: vpg
+     - const: mmcm
+
+  resets:
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: The VPG reset line
+      - description: The MMCM reset line
+
+  reset-names:
+    items:
+      - const: vpg
+      - const: mmcm
+
+  port:
+    type: object
+    description:
+      Video port for DPI output.
+      The VPG has one video port for internal DPI stimulus over the MIPI
+      DSI host controller.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi_vpg: dw-dsi-vpg@0x03000 {
+        compatible = "snps,dw-ipk-vpg";
+        reg = <0x03000 0xfff>, <0x07000 0xfff>;
+        reg-names = "vpg", "mmcm";
+        resets = <&ipk_rst 2>, <&ipk_rst 3>;
+        reset-names = "vpg", "mmcm";
+        status = "okay";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port {
+            vpg_out: endpoint {
+                remote-endpoint = <&dsi1_in>;
+            };
+        };
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
