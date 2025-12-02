Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1DC9B9AF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9873210E63B;
	Tue,  2 Dec 2025 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB3510E63B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:33:23 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1vQQVD-0005Gc-G5; Tue, 02 Dec 2025 14:33:11 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 02 Dec 2025 14:32:58 +0100
Subject: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
In-Reply-To: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

From: Liu Ying <victor.liu@nxp.com>

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
[m.felsch@pengutronix.de: port to v6.18-rc1]
[m.felsch@pengutronix.de: add bus-width]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -40,6 +46,60 @@ properties:
     minItems: 8
     maxItems: 10
 
+  bridge@60:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: nxp,imx93-pdfc
+
+      reg:
+        maxItems: 1
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/$defs/port-base
+            unevaluatedProperties: false
+            description: Output port node to downstream pixel data receivers.
+
+            properties:
+              endpoint:
+                $ref: /schemas/graph.yaml#/$defs/endpoint-base
+                unevaluatedProperties: false
+
+                properties:
+                  bus-width:
+                    enum: [ 16, 18, 24 ]
+                    description:
+                      Specify the physical parallel bus width.
+
+                      This property is optional if the display bus-width
+                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
+                      is connected and all 18-bit data lanes are muxed to the
+                      parallel-output pads.
+
+                      This property must be set to 18 to cut only the LSBs
+                      instead of the MSBs in case a 24-bit RGB888 display is
+                      connected and only the lower 18-bit data lanes are muxed
+                      to the parallel-output pads.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - reg
+      - ports
+
 allOf:
   - if:
       properties:
@@ -81,9 +141,12 @@ allOf:
             - const: isi
             - const: csi
             - const: dsi
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
   - power-domains
   - clocks
   - clock-names
@@ -112,4 +175,33 @@ examples:
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
       #power-domain-cells = <1>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      bridge@60 {
+        compatible = "nxp,imx93-pdfc";
+        reg = <0x60 0x4>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+              bus-width = <18>;
+            };
+          };
+        };
+      };
     };

-- 
2.47.3

