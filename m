Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F931B1AB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 18:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09146E062;
	Sun, 14 Feb 2021 17:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62B36E062
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 17:53:39 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id x136so2840057pfc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 09:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pwXbJYXJ/XEybu75dwMk2OD1xq/y6MntgB8eUFgtCM=;
 b=Ke27OPgqd7Xm+2DvA6biiNBQqcB7WOB1Pf1acOXZZffpCWn2ZP+qJcXh9ksmIPNiI8
 0YzBEqDP40R0edRJQWbMtX7+JcDhtlU7oSs0NiQOvoROCILKOf7iqQ6xdJAPwS6KnNnT
 b5tdvxLFJHwh2nAf+0I197VKBJDW7uxR58LI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pwXbJYXJ/XEybu75dwMk2OD1xq/y6MntgB8eUFgtCM=;
 b=DV7nM48Xa7nMOQed0ldHA7UqZLlzt0BBYe04am/buxMXloKlK0ST/V9miVg4CnBRyI
 Blu5X+j4+nMlUBtC0IEbbgeKinhVpiHu8RVoI53YiIQFPNKhc+/eu1zGo/HGVEuNmTct
 gnN9dBFnkofZhxt3nIX8qIE/Unzw3I8DIfbHct9VnMTJUazlVltzknH6Jb5JmrE0MAzF
 B8CzFsVSyfMY7Z1VSFXLwcVpah1D0Y6jDw9IqIxLBGBjCzvGNY5nhUvGQxoDJ7yUFiCK
 sq31KR2rimqqyjgoWPQ1al91YO33Ynz0QgNzxmqujPIrL8MLhV50EbIqnWSm+ReRZsbb
 jglw==
X-Gm-Message-State: AOAM532m1pPEeMG0UOiT61Nb83Fz43K6+5oDm1nrQz0LCBQdItVbZD96
 XntWcyFuYDGmhpCQ3eYz15xXtA==
X-Google-Smtp-Source: ABdhPJxPpuCp8VeWMJFfHNYkSYT/BDlow0ANd3LBdQeBXx9d/b6U2FYcI1KwPG27rotwu9YDzN/BNA==
X-Received: by 2002:aa7:9549:0:b029:1df:14f8:1e2d with SMTP id
 w9-20020aa795490000b02901df14f81e2dmr12043592pfq.55.1613325219228; 
 Sun, 14 Feb 2021 09:53:39 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id h17sm15094443pfr.200.2021.02.14.09.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:53:38 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for Chipone
 ICN6211
Date: Sun, 14 Feb 2021 23:22:10 +0530
Message-Id: <20210214175211.105107-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.

It has a flexible configuration of MIPI DSI signal input and
produce RGB565, RGB666, RGB888 output format.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- updated to new dt-bindings style

 .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
new file mode 100644
index 000000000000..13764f13fe46
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -0,0 +1,90 @@
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
+  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
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
+  reset-gpios:
+    description: GPIO connected for the reset pin
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
+  - reset-gpios
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
+        reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          bridge_in: port@0 {
+            reg = <0>;
+
+            bridge_out_dsi: endpoint {
+              remote-endpoint = <&dsi_out_bridge>;
+            };
+          };
+
+          bridge_out: port@1 {
+            reg = <1>;
+
+            bridge_out_panel: endpoint {
+              remote-endpoint = <&panel_out_bridge>;
+            };
+          };
+        };
+      };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
