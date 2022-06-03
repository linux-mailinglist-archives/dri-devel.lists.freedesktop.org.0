Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED9553CB49
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AC710E093;
	Fri,  3 Jun 2022 14:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752810E093
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:04:47 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id i1so6906381plg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VFYLNsNT7RLI558EnjAePReuPZvewMRdNogIkoXHGkk=;
 b=gYavTQEl65z/19Lk38kZAaQItQor3wW419r9GWMXJ/fGDBT5nFI4uMdd4PseY0ss9f
 aal4c9vcGfLb6UiWfpafVcagZYiocR1ZC392S16EFZv0i6L8LDoYD2jdk9WQ3+agwekO
 S8BcWc0Sz8Q0oaLE0E12MVmtSst54165/hnzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VFYLNsNT7RLI558EnjAePReuPZvewMRdNogIkoXHGkk=;
 b=qHwMrYntmLha3NjwyUsE5pHoanl6y5fXX6vsMzbK6A/Hr7sBRGNImroF0cDzxsVRJw
 W1YZt2ZJpraYmiLfoz9QWQCuejuWTrhN0aQRuk5HPNLzMsBbfLyu2GPtsVzDXskd5l6f
 cQk8iR9kvFPyu9tMCsRXWiRgC9wyhEeYTXd6Zvx0/+MNTTILco2yyPvdnNbE9v/Ud39/
 c9dEswgjxTSCprEOqQNwBCXGi8SPE1ye84s5befmriP053veiN/q5HMe63Zi/vnP8kiX
 xvkZrmt4o4S/WTxFkReaZxNRtg2+A8sDOU1Hd/upe1EKkmiEGfJhDf9y5JgOPJ4qZIZM
 anxQ==
X-Gm-Message-State: AOAM532HI4/6KCBVhl3aJfF9YFYdIu2fSbIG+J2vhJdzgSUp+ZJ9ANrx
 YLa8gSPcbPsq0Awenx6l3rPp6Q==
X-Google-Smtp-Source: ABdhPJwYpHp4xO80k8ZwZ4Wui9ZmMLdJFLqLVNlWgCTIJyFtjef8CmleDGSZEHIgPV2JqEjOYxuoxw==
X-Received: by 2002:a17:902:ef47:b0:156:646b:58e7 with SMTP id
 e7-20020a170902ef4700b00156646b58e7mr10285825plx.57.1654265086627; 
 Fri, 03 Jun 2022 07:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a190:29ee:e543:950e:2acb])
 by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b005189f7ab7aesm5736487pfq.19.2022.06.03.07.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 07:04:46 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Add TI DLPC3433 DSI to
 DMD
Date: Fri,  3 Jun 2022 19:33:48 +0530
Message-Id: <20220603140349.3563612-1-jagan@amarulasolutions.com>
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

It has a flexible configuration of MIPI DSI and DPI signal
input that produces a DMD output in RGB565, RGB666, RGB888
formats.

It supports upto 720p resolution with 60 and 120 Hz refresh
rates.

Add dt-bingings for it.

Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v3:
- collect Rob r-b
Changes for v2:
- fix compatible
- drop reg description
- fix enable_gpio description
- fix port@2

 .../bindings/display/bridge/ti,dlpc3433.yaml  | 117 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
new file mode 100644
index 000000000000..542193d77cdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,dlpc3433.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DLPC3433 MIPI DSI to DMD bridge
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Christopher Vollo <chris@renewoutreach.org>
+
+description: |
+  TI DLPC3433 is a MIPI DSI based display controller bridge
+  for processing high resolution DMD based projectors.
+
+  It has a flexible configuration of MIPI DSI and DPI signal
+  input that produces a DMD output in RGB565, RGB666, RGB888
+  formats.
+
+  It supports upto 720p resolution with 60 and 120 Hz refresh
+  rates.
+
+properties:
+  compatible:
+    const: ti,dlpc3433
+
+  reg:
+    enum:
+      - 0x1b
+      - 0x1d
+
+  enable-gpios:
+    description: PROJ_ON pin, chip powers up PROJ_ON is high.
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
+        description: Video port for DMD output.
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
+        bridge@1b {
+            compatible = "ti,dlpc3433";
+            reg = <0x1b>;
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
index 11da16bfa123..aea0fe5156af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6431,6 +6431,11 @@ DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
 
+DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
+M:	Jagan Teki <jagan@amarulasolutions.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
+
 DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
 F:	Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
-- 
2.25.1

