Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A697BADA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 12:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494410E21E;
	Wed, 18 Sep 2024 10:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="dfGEDLv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AE910E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1726655538; x=1758191538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1GQ2X+PfHjUUDXvBF8gSdZ5xiz1q73Q4EIgtBzLTMM4=;
 b=dfGEDLv5MDXYaxPmWgH6N9bfSH5+eatOYNZLpL9ZoUdSJ5Z91ZU9IM7c
 EzZynPMwjUsiKvt3v1jZIJ1FiNe3sDGHIJi54IC+ndWcg9Y0ubPJG0yNx
 w9eynVIvJHhQhSGovUlRI6f0hSWjrreFGDvZsk1ojoUooHI2696kQzyGz
 IezVfhnlyaptsJBFnYnGPSva1SspydRx49V7ZXRLV6YbJc8puZIKk4JNk
 j/6SuMXoCn2JlwTCuQiRiNoZfRPcjsSrmPSDWNyDUGRtayOgc7Wk/PpnO
 vcJgT4r/P1jKBS90f6kCwfRuqrn9+0JbvjdG2nWAwcz3YZZE/dU8VIHwE Q==;
X-CSE-ConnectionGUID: u1rM2jTbQye/0AWlcIXYhg==
X-CSE-MsgGUID: CikK7dCnTQufuMeE0ZgtPA==
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="32558782"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2024 03:32:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Sep 2024 03:31:37 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 18 Sep 2024 03:31:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dharma.b@microchip.com>, <arnd@arndb.de>,
 <hari.prasathge@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: display: bridge: add sam9x75-mipi-dsi
 binding
Date: Wed, 18 Sep 2024 16:01:16 +0530
Message-ID: <20240918103119.385597-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918103119.385597-1-manikandan.m@microchip.com>
References: <20240918103119.385597-1-manikandan.m@microchip.com>
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
changes in v4:
- Removed 'microchip,sfr' phandle property since
regmap to SFR node can be obtained using its compatible
string

changes in v3:
- Describe the clocks used

changes in v2:
- List the clocks with description
- remove describing 'remove-endpoint' properties
- remove unused label, node and fix example DT indentation
- cosmetic fixes
---
 .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
new file mode 100644
index 000000000000..d2ae6250e1f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
@@ -0,0 +1,109 @@
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
+  protocol functions defined in the MIPI DSI Specification.The DSI Host
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
+    items:
+      - description:
+          Peripheral Bus Clock between LCDC and MIPI DPHY
+      - description:
+          MIPI DPHY Interface reference clock for PLL block
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: refclk
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
+     #include <dt-bindings/clock/at91.h>
+     #include <dt-bindings/gpio/gpio.h>
+
+     dsi@f8054000 {
+       compatible = "microchip,sam9x75-mipi-dsi";
+       reg = <0xf8054000 0x200>;
+       clocks = <&pmc PMC_TYPE_PERIPHERAL 54>, <&pmc PMC_TYPE_GCK 55>;
+       clock-names = "pclk", "refclk";
+
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       ports {
+         #address-cells = <1>;
+         #size-cells = <0>;
+
+         port@0 {
+           reg = <0>;
+           dsi_in: endpoint {
+             remote-endpoint = <&hlcdc_panel_output>;
+           };
+         };
+
+         port@1 {
+           reg = <1>;
+           dsi_out: endpoint {
+             remote-endpoint = <&mipi_in_panel>;
+           };
+         };
+       };
+     };
+...
-- 
2.25.1

