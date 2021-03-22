Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0920343DFA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BC489E43;
	Mon, 22 Mar 2021 10:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1214E89E43
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:33:46 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e14so6311814plj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXnyIiVMYouSZkWQ90s00ryOLdRsKNt+1wvSooAsuGs=;
 b=U/FYRH9cjK0YJA4Ob2lEv3co8KkXJ55eiA1vz0msL8PEA2f43kg98n68QIzqr+Vcxh
 7NAeC3vm2NAS4yaIlvZD341i9vy4nIiPg3mkKLvYiMcjFOFJF/gPQZqXLO8kDShuy1oh
 HMEkx+ecRyKrcJgbIa1SjWwdoDIYLgZbk1q9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXnyIiVMYouSZkWQ90s00ryOLdRsKNt+1wvSooAsuGs=;
 b=aFJkj5/XFhnWhIT/lUbjyfpyTpq+ETpWW6sVxPF6QtG+spfW+G1AfsxrRDMEZ/FJHH
 5re9BNQu2dDVocXmZziKvDl99in2iJuDILdi3TwWF2C7l4THfEaDQEOxUe4bATMmEvUi
 64zJWvUiLjy8ZbsE0JJu5g4gg3QLZ1IrxTStcjJMjYzG6M8fpRGX/bCbEoyrAZjoTM2H
 Fx+7unY/+as/nKWvNU0TH1Xmid5IErQE5vbHoKlUGpaSqYA/qySLnGCE9ZwLsOcj7X0R
 CjyC6Q/I33Kb5E0tY+eaZUo13sZa5+gA874RdNq5Iy7CFIPDffpf71Xcu5EXkCoqUDdu
 lFWA==
X-Gm-Message-State: AOAM533TA76020jQWwMSTPmgOrofUFRcmcxlFLpnRgCpWvxjEGrOuuZn
 /4C5vLSw3TbK7SCDldv79Qu8eQ==
X-Google-Smtp-Source: ABdhPJzlkGRSrVgAHY0k1cvQM0ccUJVDmZgoIjp9ZC02h/Bdjce00E7vO3PcuSCyoF4QerNJTj69iA==
X-Received: by 2002:a17:90a:1b08:: with SMTP id
 q8mr12254370pjq.203.1616409225597; 
 Mon, 22 Mar 2021 03:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:15c1:9a30:414f:d84b])
 by smtp.gmail.com with ESMTPSA id o13sm12812422pgv.40.2021.03.22.03.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:33:45 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Add Chipone ICN6211
 bindings
Date: Mon, 22 Mar 2021 16:03:26 +0530
Message-Id: <20210322103328.66442-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICN6211 is MIPI-DSI to RGB Converter bridge from Chipone.

It has a flexible configuration of MIPI DSI signal input and
produces RGB565, RGB666, RGB888 output format.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v5:
- rebase drm-misc-next
- collect Rob, Robert review tags
Changes for v4:
- fixed Laurent comments
- added regulators
- replace reset with EN
- fixed warnings pointed by Robert
Changes for v3:
- updated to new dt-bindings style

 .../display/bridge/chipone,icn6211.yaml       | 99 +++++++++++++++++++
 MAINTAINERS                                   |  5 +
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
new file mode 100644
index 000000000000..62c3bd4cb28d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  ICN6211 is MIPI-DSI to RGB Converter bridge from chipone.
+
+  It has a flexible configuration of MIPI DSI signal input and
+  produce RGB565, RGB666, RGB888 output format.
+
+properties:
+  compatible:
+    enum:
+      - chipone,icn6211
+
+  reg:
+    maxItems: 1
+    description: virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: Bridge EN pin, chip is reset when EN is low.
+
+  vdd1-supply:
+    description: A 1.8V/2.5V/3.3V supply that power the MIPI RX.
+
+  vdd2-supply:
+    description: A 1.8V/2.5V/3.3V supply that power the PLL.
+
+  vdd3-supply:
+    description: A 1.8V/2.5V/3.3V supply that power the RGB output.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DSI input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DPI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@0 {
+        compatible = "chipone,icn6211";
+        reg = <0>;
+        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            bridge_in_dsi: endpoint {
+              remote-endpoint = <&dsi_out_bridge>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            bridge_out_panel: endpoint {
+              remote-endpoint = <&panel_out_bridge>;
+            };
+          };
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4b705ba51c54..b9d11101d060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5568,6 +5568,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
 F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
 
+DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
+M:	Jagan Teki <jagan@amarulasolutions.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
