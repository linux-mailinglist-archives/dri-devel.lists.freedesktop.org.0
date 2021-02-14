Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204E31B19B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 18:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE8F6E06D;
	Sun, 14 Feb 2021 17:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803B76E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 17:45:16 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id m2so2949238pgq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yf033zbvp9pxo0s9URPAho62aiEWTfxuw67OJFPXTEA=;
 b=PuAAqVaJh5jAn0NamzSuv82QYpI0zmuAO3SMkuF9aOwqyL6Cih2DxG+g1Y2DJpTaEL
 tqyAJP5/Ak0qUzw8zJNTcq/D8WIfDsniRgNVX1WjQFzh6XQ7JQF+GoYg1AiaIpFY1Ynh
 hYRwF20v658pXJihgJqyN5cRf9Yk2nVAqf+nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yf033zbvp9pxo0s9URPAho62aiEWTfxuw67OJFPXTEA=;
 b=JPKcmmrXz9yU5ruPXHmeomrfSkm2ahk+aR/GlH37RsADQPCKlYfvZ0zDY3nvRXft8c
 Th80nh9YeeERth+AuUObEk51RrIFBE7W0IDlWIkKdY//M4BLFgRpKyddhflOsVQA8Wx+
 rBS+SpQT7R88ngyfkE4Wuj+Sf6xoPU1akGqOQ28rgJZOxtgteGOVXb9SvHnvkpRIg0vR
 pZpW3YBVRFnkTDWat3bqEJQt4+6kj52OE6LV1Z2Kkar01XNAiUcatm53R4a/usDt/PQN
 v1Yd4gsSUiA45uswM3s8c9kqC/4SWQ7Z+4rMuNp7ty1hSIZWFcNtk7MHmckD7zGXtpNS
 Rz6g==
X-Gm-Message-State: AOAM531MHdFFbgnqIE3bI22FaxT0AE7//NZOM61hydvlc+wF1y1zfhow
 /kVE+s1d6hwWy2mWyiPW9slt0A==
X-Google-Smtp-Source: ABdhPJyHUQGyBnnPXCBvYOS14gWTLx7BW3BHq55wj63qQ+hemI+ja+3iq8ue8PjSgKlBfz5XBYFFWw==
X-Received: by 2002:a62:644f:0:b029:1d3:b559:fe7a with SMTP id
 y76-20020a62644f0000b02901d3b559fe7amr11803213pfb.21.1613324716287; 
 Sun, 14 Feb 2021 09:45:16 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id r205sm4794137pfr.128.2021.02.14.09.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:45:15 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
Date: Sun, 14 Feb 2021 23:14:52 +0530
Message-Id: <20210214174453.104616-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
controller IC's from Texas Instruments.

SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge

Right now the bridge driver is supporting Channel A with single
link, so dt-bindings documented according to it.

Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- fixed Rob comments
- updated commit message and file name to support all chip variants 
Changes for v2:
- none

 .../bindings/display/bridge/ti,sn65dsi8x.yaml | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
new file mode 100644
index 000000000000..7f9f8cd6e786
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi8x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI SN65DSI83/84/85 MIPI DSI to LVDS bridge bindings
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge controller
+  IC's from Texas Instruments.
+
+  SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
+  SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
+  SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
+
+  Bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and
+  converts the formatted video data stream to a FlatLink compatible
+  LVDS output operating at pixel clocks operating from 25 MHx to
+  154 MHz.
+
+properties:
+  compatible:
+    enum:
+      - ti,sn65dsi83
+      - ti,sn65dsi84
+
+  reg:
+    const: 0x2c
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge enable pin (active high).
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          DSI Input. The remote endpoint phandle should be a
+          reference to a valid mipi_dsi_host device node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Video port for LVDS output (panel or connector).
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
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       ports {
+           #address-cells = <1>;
+           #size-cells = <0>;
+
+           port@0 {
+               reg = <0>;
+               dsi_in: endpoint {
+                   remote-endpoint = <&ltdc_ep0_out>;
+               };
+           };
+
+           port@1 {
+               reg = <1>;
+               dsi_out: endpoint {
+                   remote-endpoint = <&bridge_in>;
+                   data-lanes = <0 1>;
+               };
+           };
+       };
+    };
+
+    i2c6 {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       bridge@2c {
+           compatible = "ti,sn65dsi84";
+           reg = <0x2c>;
+           enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                   reg = <0>;
+                   bridge_in: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                   };
+               };
+
+               port@1 {
+                   reg = <1>;
+                   bridge_out: endpoint {
+                        remote-endpoint = <&panel_in_lvds>;
+                   };
+               };
+           };
+       };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
