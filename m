Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF8510935
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9F10E588;
	Tue, 26 Apr 2022 19:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1216E10E585
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:37:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E7A1383B63;
 Tue, 26 Apr 2022 21:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651001820;
 bh=DLpyodc0IH5QXZ+/4a9WOF+KrLBrMkntojqAv7H1l4U=;
 h=From:To:Cc:Subject:Date:From;
 b=np+jDBWg6xcMeYLovDbP43SdwZRF0TO57DQhrrqoa/hrVeUcFyKplGc1o7WaLBjpg
 ICZ9NbE9T4cTT4fvm54GSB+dtH9SFrnKXA/ot+2o3EtcsHOYZPdAw0zT5BqaIWrp7n
 TSzEHTb12VJMJcI9UwVfME3ucHu1qn4BcjLl2EB9ZHjSC6NPRL1P2FrEQ3YZSkS9LL
 9Y57xTvG7ACTGuwmdcv6L97vJRxMVrrJtj7OgxNVFTOnPghH+inIyARhcUxtkY1Y7T
 89g8RWWAylc2HlVZtgKbZNQbClGsrkoEZlOxac9qENoYag71CvutJontyEfOgS2Es0
 YQCDPHn43jlkQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement simple
 Freescale i.MX8MP LDB bridge
Date: Tue, 26 Apr 2022 21:36:44 +0200
Message-Id: <20220426193645.244792-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i.MX8MP contains two syscon registers which are responsible
for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
which represents this serializer as a bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Consistently use fsl,imx8mp-ldb as compatible
    - Drop items: from compatible:
    - Replace minItems with maxItems in clocks:
    - Drop quotes from clock-names const: ldb
    - Rename syscon to fsl,syscon
    - Use generic name of ldb-lvds in example
V3: - Add AB from Sam
    - Consistently use MX8MP
V4: - Rename to fsl-ldb all over the place
    - Put the LDB node under media block controller in the example
---
 .../bindings/display/bridge/fsl,ldb.yaml      | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
new file mode 100644
index 000000000000..77f174eee424
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP DPI to LVDS bridge chip
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The i.MX8MP mediamix contains two registers which are responsible
+  for configuring the on-SoC DPI-to-LVDS serializer. This describes
+  those registers as bridge within the DT.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-ldb
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ldb
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-A output (panel or bridge).
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-B output (panel or bridge).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    blk-ctrl {
+        bridge {
+            compatible = "fsl,imx8mp-ldb";
+            clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
+            clock-names = "ldb";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    ldb_from_lcdif2: endpoint {
+                        remote-endpoint = <&lcdif2_to_ldb>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    ldb_lvds_ch0: endpoint {
+                        remote-endpoint = <&ldb_to_lvdsx4panel>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    ldb_lvds_ch1: endpoint {
+                    };
+                };
+            };
+        };
+    };
-- 
2.35.1

