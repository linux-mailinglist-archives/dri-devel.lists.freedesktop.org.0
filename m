Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212C927209
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976CC10EA3E;
	Thu,  4 Jul 2024 08:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="mO4E1Srw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7830D10EA3E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1720082968; x=1751618968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1HjxPqypgsve3fGZqqNIgilI5FsrzhZKY0WXWsKK6IQ=;
 b=mO4E1Srw+k1u/YqtdN7a9bULnpdd71+jRkPM2OdsPjrcUiszK58EmeAt
 j91XnYaDBAVEM70RARjfVQZsg7urvJq4GbvxXgJJtB9mv0mhCfWkCUSje
 BZQiZGvzFCfqiSCkr9DxgMXC2fh8/2PAzdMsJJOpkrtx4TDJoXtVlxfji
 h277FrCp++LcarMKvcCm+qIJRal1wisjdWKHMHcrPlnRWazZxn40GCunN
 qjlteqQfqI6Pz4TTdRR3KyoOsGhGaR7g/HbhahSO3yJKG/oAryNeCdP+r
 lnzEJBdpTtaMZ3eeIuaonQ1Qkj7DCfdLJ2jkN9xOii7ool/Qu1Lii55/5 Q==;
X-CSE-ConnectionGUID: QwADFB6LR8OoRGaGmTWhqQ==
X-CSE-MsgGUID: iVsUngpoRVias0yp19+3Xw==
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="259727486"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2024 01:49:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jul 2024 01:48:46 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jul 2024 01:48:36 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <Jason@zx2c4.com>,
 <palmer@rivosinc.com>, <mpe@ellerman.id.au>, <rdunlap@infradead.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>, <Hari.PrasathGE@microchip.com>,
 <Nicolas.Ferre@microchip.com>
Subject: [PATCH 1/4] dt-bindings: display: bridge: add sam9x75-mipi-dsi binding
Date: Thu, 4 Jul 2024 14:18:34 +0530
Message-ID: <20240704084837.168075-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704084837.168075-1-manikandan.m@microchip.com>
References: <20240704084837.168075-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add the 'sam9x75-mipi-dsi' compatible binding, which describes the
Microchip's specific wrapper for the Synopsys DesignWare MIPI DSI HOST
Controller for the sam9x75 series System-on-Chip (SoC) devices.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
new file mode 100644
index 000000000000..87aaf9c929e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip SAM9X75 MIPI DSI Controller
+
+maintainers:
+  - Manikandan Muralidharan <manikandan.m@microchip.com>
+
+description:
+  Microchip specific extensions or wrapper to the Synopsys Designware MIPI DSI.
+  The MIPI Display Serial Interface (DSI) Host Controller implements all
+  protocol functions defined in the MIPI DSI Specification. The DSI Host
+  provides an interface between the LCD Controller (LCDC) and the MIPI D-PHY,
+  allowing communication with a DSI-compliant display.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,sam9x75-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      MIPI DSI must have two clocks to function correctly.Peripheral clock
+      'pclk' for the hardware block functionality and Generic clock 'refclk' to
+      drive the D-PHY PLL block.
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: refclk
+
+  microchip,sfr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Special Function Register (SFR) node.To enable the DSI/CSI
+      selection bit in SFR's ISS Configuration Register.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          DSI Input port node, connected to the LCDC RGB output port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          DSI Output port node, connected to a panel or a bridge input port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi: dsi@f8054000 {
+         compatible = "microchip,sam9x75-mipi-dsi";
+         reg = <0xf8054000 0x200>;
+         clocks = <&pmc PMC_TYPE_PERIPHERAL 54>, <&pmc PMC_TYPE_GCK 55>;
+         clock-names = "pclk", "refclk";
+         microchip,sfr = <&sfr>;
+
+         #address-cells = <1>;
+         #size-cells = <0>;
+
+         ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                        reg = <0>;
+                        dsi_in: endpoint {
+                            remote-endpoint = <&hlcdc_panel_output>;
+                        };
+                };
+
+                port@1 {
+                        reg = <1>;
+                        dsi_out: endpoint {
+                            remote-endpoint = <&mipi_in_panel>;
+                        };
+                };
+         };
+
+         panel@0 {
+              compatible = "hannstar,hsd060bhw4", "himax,hx8394";
+              reg = <0>;
+              vcc-supply = <&mic23150_reg>;
+              iovcc-supply = <&mic23150_reg>;
+              reset-gpios = <&pioC 24 GPIO_ACTIVE_LOW>;
+              backlight = <&backlight>;
+
+              port {
+                   mipi_in_panel: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                   };
+              };
+         };
+    };
+...
-- 
2.25.1

