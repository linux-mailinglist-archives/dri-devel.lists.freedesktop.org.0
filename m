Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750724EDC4B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8510E590;
	Thu, 31 Mar 2022 15:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C815010E590
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:03:16 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id s11so22277433pfu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ3Km75M4TTt2y9JsJdWBiwdvtUwu0/oIDbwD8B5Wf4=;
 b=nFSMoAlg7w9JSEmSlfY7/ULyT7r4KruC8grBtW+uXP5YXpjQ2S41kR1ZMtBjnTIysC
 wiEUoHOSXBqmidqDWtbfep+AagK6nyoqTzA42Qz5PgAm8zLV2KO8qrzYLOT4sBBnY2nU
 2Ma3ResIxhtLpCMKrewKSp/u5i0Mot3mjHv1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ3Km75M4TTt2y9JsJdWBiwdvtUwu0/oIDbwD8B5Wf4=;
 b=YjPcBbu7dAthHjybX/JmoSz261T8r6rhKG9IH5X+09nHXLuUGPF9CkQCeqerplmfg5
 haRXtg37nhxRxhAc9G9LB9f14uGJgDgcHrpqevoJhyHVS4C/J467v6AGDQFIw/Glm6Aq
 TvU0RT2AQR0EtSsn2DUpoI4n3N9X+UUTD7gDQCNMiqhl7Ytd3aru2R9Pa4dLXuqGYcyb
 cSEsR8ht3YbDBINhevOCgMggqM7OxQzqb6s5JjdibvVT9QktKgzpuvdLNpsgR3OUeO/q
 N3cUyeNQxD3zrCj3TN8H8uKngvVyzepgBcX9aySnd54fQZfpHNd4M2eLuQSRHvogPJ+X
 JxEg==
X-Gm-Message-State: AOAM533FSvNGBfyt5raymTil1wQ1mAg8K4nUsunPbOuL9HK35xRqStkR
 bbOr70B8KmOasMFb8S8l4C3GRQ==
X-Google-Smtp-Source: ABdhPJzpI0K2R58KUJrq7Bo0XT8ahaoThYllS5rO1G/qGGG+WF93iPbN67m1B1pIcLEPDywjIyFN5w==
X-Received: by 2002:a62:1c8d:0:b0:4fa:8dcb:6da2 with SMTP id
 c135-20020a621c8d000000b004fa8dcb6da2mr5817541pfc.19.1648738996109; 
 Thu, 31 Mar 2022 08:03:16 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 w79-20020a627b52000000b004fd8d1e5489sm10151058pfc.87.2022.03.31.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:03:15 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Add TI DLPC3433 DSI to
 DMD
Date: Thu, 31 Mar 2022 20:33:06 +0530
Message-Id: <20220331150307.58777-1-jagan@amarulasolutions.com>
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
---
Changes for v2:
- fix compatible
- drop reg description
- fix enable_gpio description
- fix port@2

 .../bindings/display/bridge/ti,dlpc3433.yaml  | 117 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 123 insertions(+)
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
index 70cd8a1c9495..1af52d1178be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6392,6 +6392,12 @@ DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
 
+DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
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

