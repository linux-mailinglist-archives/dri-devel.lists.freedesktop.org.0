Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD61A08FC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56F56E5BE;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618776E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:24:31 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EE867404B8;
 Mon,  6 Apr 2020 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586179470; bh=kt8evzJkOaxQDaYu4nFK9ua9wL2bvCfFsHU7SFJRk2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Utfh/hGaTGR/ZvuXsODj/Z2c2frvQwPmprQRehI+JxyB8xDLobXD2y2CWWvWxLMAq
 unj9msBjQrJZh11w881cFY3NeXrPR8a1DJ1IErKIS7K/0QP9DYHPai6IfWvNTzlRjO
 vezMWo1BDdAMTn8lz36/VJ90wTrsBC3Q6OQI3PGOjCHVyv8u2p1hQAQH3nZVBv9/22
 xqpEZy3uqtWxj4ekMd3M+rP+rWi4DnZtA1yyKehN39MBdur7iX/VcZw8eDyMYWeQE9
 VqWdEZXlBv24yspK5lMSytGwk7kohYIcDuSW0yaBxi+RN4OSnZJkssyweUZeh0zTgG
 fHZ/0YHwEeJFA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 67430A005D;
 Mon,  6 Apr 2020 13:24:28 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, Gustavo.Pimentel@synopsys.com,
 Joao.Pinto@synopsys.com
Subject: [PATCH v2 1/4] dt-bindings: display: Add IPK DSI subsystem bindings
Date: Mon,  6 Apr 2020 15:24:11 +0200
Message-Id: <e32fdd83d135da8617ba46d53eb95329589ae07d.1586174459.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
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

Reported-by: Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
 .../bindings/display/snps,dw-ipk-dsi.yaml          | 162 +++++++++++++++++++++
 .../bindings/display/snps,dw-ipk-vpg.yaml          |  75 ++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml

diff --git a/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml b/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
new file mode 100644
index 0000000..92b313c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
@@ -0,0 +1,162 @@
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
+    minItems: 1
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
index 0000000..b74b02e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
@@ -0,0 +1,75 @@
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
