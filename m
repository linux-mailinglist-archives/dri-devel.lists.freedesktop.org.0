Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7266BC6D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA2510E3C7;
	Mon, 16 Jan 2023 11:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4FF10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:08:33 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k18so5953132pll.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erd07UtB/CaRm8VAcdFsHqz5BD6J0Uh9OeVqXzbjdoQ=;
 b=We2Nv/y1kzqc22WfmseNr651ji5otvZ5dRPvn3MVPNPxzpwrQiX8W+CbgI2ggX9eDN
 IijlPSbDLYgdw5rtt9RXJBREJfk1JaJPpcsMiAJs64NhTr3NWbbEKKxwQuyGlX/o9Fdq
 fcw9jaQWUy0ODz/rFTdFyBZmd2/ZmmvcU/43E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erd07UtB/CaRm8VAcdFsHqz5BD6J0Uh9OeVqXzbjdoQ=;
 b=E1jFcrstSLEWXr5ps3bpJKfWy1XGrXTAfXjZZxvYcsjLETiOWmW/ECqiOUmntVaBPW
 WB/KjrWDUpd4VYnx2hyOCt1NSdqj8kijA+8KCU3jUTpJbG+JEa2JH2hbD+s1p8u04+u3
 tYhqjXgpKLf0HUBtWGe04vhDZaUrPXZQpZq4joOU+4Vh9Ev0oL/wmuzPztB62SNy1m3j
 ba6AzXRofO1v1OTACsIkTbhpP1sHD1wa5sKsDQnHibQ8wqw94WiE7/VfEbiTFXyFx07p
 HjVpUscamUGY20yA39W+h/PSQhwrh15mw6CA4Vz0PrK77RTFTfXNBgDU13lFmGBRmegZ
 oYEg==
X-Gm-Message-State: AFqh2krHtqu9h9MOBi+MAcfZVL+xsvoA75FOgmA+PJe0Tvb5ZhXfY1r5
 2vQy8uRtz+mi5gNvLKEQtUAU2Q==
X-Google-Smtp-Source: AMrXdXuq+XEkjBV2F0TfS2QJ0JI1gIcLgpsZ1zLbf+nvAZJ8IJOaPuaSO88JzGD+CnIl2ceode0kfw==
X-Received: by 2002:a17:90b:4ccf:b0:229:a39:2ad8 with SMTP id
 nd15-20020a17090b4ccf00b002290a392ad8mr14437596pjb.37.1673867313326; 
 Mon, 16 Jan 2023 03:08:33 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a3f3:9ba9:fe36:fbcb])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm17993686pja.21.2023.01.16.03.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:08:32 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display mux
 binding
Date: Mon, 16 Jan 2023 19:08:19 +0800
Message-Id: <20230116110820.2615650-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230116110820.2615650-1-treapking@chromium.org>
References: <20230116110820.2615650-1-treapking@chromium.org>
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

Add bindings for Generic GPIO mux driver.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings

 .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
new file mode 100644
index 000000000000..da29ba078f05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic display mux (1 input, 2 outputs)
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+
+description: |
+  This bindings describes a simple display (e.g. HDMI) mux, that has 1
+  input, and 2 outputs. The mux status is controlled by hardware, and
+  its status is read back using a GPIO.
+
+properties:
+  compatible:
+    const: gpio-display-mux
+
+  detect-gpios:
+    maxItems: 1
+    description: GPIO that indicates the active output
+
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Video port for input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          2 video ports for output.
+          The reg value in the endpoints matches the GPIO status: when
+          GPIO is asserted, endpoint with reg value <1> is selected.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - detect-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    hdmi_mux: hdmi_mux {
+      compatible = "gpio-display-mux";
+      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_mux_pins>;
+      ddc-i2c-bus = <&hdmiddc0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 { /* input */
+          reg = <0>;
+
+          hdmi_mux_in: endpoint {
+            remote-endpoint = <&hdmi0_out>;
+          };
+        };
+
+        port@1 { /* output */
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          hdmi_mux_out_anx: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&dp_bridge_in>;
+          };
+
+          hdmi_mux_out_hdmi: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&hdmi_connector_in>;
+          };
+        };
+      };
+    };
-- 
2.39.0.314.g84b9a713c41-goog

