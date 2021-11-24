Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579CE45CAFE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 18:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E506E895;
	Wed, 24 Nov 2021 17:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3CD6E895
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 17:26:12 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so3373020pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODX0ZjJmyHGUcMXQPTbTnl3S63FnL3kepW5lX1cGeNY=;
 b=DHvsXg/+r78mH1qh76abKGzlH/qF19jhs2yZOpILIqAAqOj4DDV9umjGTFITzUU7jB
 XjKw545y4dkUxA00IrhFSQuVomJn+KmswabcoCsGZglQL32CgCkQzSL3YJcWZ9lY+FGZ
 TOBnQsguh6LAy6WoQ/yCqhoKtWzmhpHqAgbeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODX0ZjJmyHGUcMXQPTbTnl3S63FnL3kepW5lX1cGeNY=;
 b=LFUuZmlsBy3CX+PxxEmneXBWW7R9TxPAgGdgd5WVCVkOzMKrAc1vAfRGt3JsBwyo0g
 og05ssiCNt8H4MVkhEjwaKmNuj3rjDqZfJGjGz5Cdunlkspug7GlriB7UCCAMczD3H1Z
 KxC1c87WuSCbSK503VYT0mVxp/7Vo6XS4Vf3zbRdPpngmkzAVcO6D1tb8KRJwdoMnePY
 FImEAAh7A/QLA2Cu6K8Pe1K48giE3qSo8l6XVKA+kVFwRGDjxBhmA/YRLRHdptAFtfQF
 1r5/PvPmEgpg+XdYKnIjCfz32B6Mp04BOf63Xt7Sxqiq7ZOpRkVSe6y9DPYETPpI3lsq
 aUog==
X-Gm-Message-State: AOAM533WJQ6Pyi1Zg2FPgC5O+fjAOUTt33N56M8oGTw8glJLLJdPC4tJ
 cJSwgIUu2i9GHMIEn6nOpIcBQw==
X-Google-Smtp-Source: ABdhPJzeqt4umbVvn7VbSHx9cMq9BUa8sVx4pV9RIIAAFXfGZ4bjhGirVGeErOuHZhddz512bRW6Zw==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id
 x16-20020a170902ec9000b0014202694691mr20396873plg.48.1637774771908; 
 Wed, 24 Nov 2021 09:26:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:d111:e958:d982:546e])
 by smtp.gmail.com with ESMTPSA id s19sm334618pfu.104.2021.11.24.09.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 09:26:11 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add TI DLPC3433 bindings
Date: Wed, 24 Nov 2021 22:55:52 +0530
Message-Id: <20211124172553.519309-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TI DLPC3433 is a MIPI DSI based display controller bridge
for processing high resolution DMD based projectors.

It has a flexible configuration of MIPI DSI signal input
produces RGB565, RGB666, RGB888 output format with maximum
of 720p resolution in 60 and 120 Hz refresh rates.

Add dt-bingings for it.

Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../bindings/display/bridge/ti,dlpc3433.yaml  | 112 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
new file mode 100644
index 000000000000..3ade3a575c3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,dlpc3433.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DLPC3433 Display Controller
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Christopher Vollo <chris@renewoutreach.org>
+
+description: |
+  The DLPC3433 or DLPC3438 controllers provide a convenient,
+  multi-functional interface between system electronics and
+  the DMD, enabling small form factor, low power, and high
+  resolution HD displays.
+
+properties:
+  compatible:
+    enum:
+      - ti,dlpc3433
+
+  reg:
+    maxItems: 1
+    description: virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: PROJ_EN pin, chip powers up PROJ_EN is high.
+
+  vcc_intf-supply:
+    description: A 1.8V/3.3V supply that power the Host I/O.
+
+  vcc_flsh-supply:
+    description: A 1.8V/3.3V supply that power the Flash I/O.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for MIPI DSI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DPI output (DMD Projector).
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
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@1d {
+            compatible = "ti,dlpc3433";
+            reg = <0x1d>;
+            enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_in_dsi: endpoint {
+                        remote-endpoint = <&dsi_out_bridge>;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_out_panel: endpoint {
+                        remote-endpoint = <&panel_out_bridge>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f32c7d733255..a3019399dec0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6198,6 +6198,12 @@ DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
 
+DRM DRIVER FOR TI DLPC3433 MIPI DSI DISPLAY CONTROLLER BRIDGE
+M:	Jagan Teki <jagan@amarulasolutions.com>
+M:	Christopher Vollo <chris@renewoutreach.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
+
 DRM DRIVER FOR TPO TPG110 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.25.1

