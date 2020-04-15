Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE51AAC3B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F376EA1E;
	Wed, 15 Apr 2020 15:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A116EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:49:48 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id v2so141241plp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NipZ0gHcLA0OIIWqIKZlc3VMj5MYxGX/fpRV8K+RKfE=;
 b=gmIc3L29Nm/J1LTHQ5Ew8IiD+7cuzBNHr4sZJnZXva/kpFcagn8+xZgcEC1I7OpZ+p
 c2Kio/4sny0PAE3dh8HV5+U0My5BSVRl+UG3I0IqdmlIAUPgnQRHorrVcmAVx9lJGiXw
 +KVaNbkSkidOjvQewho+ZIkfI+w/NyXIJD5jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NipZ0gHcLA0OIIWqIKZlc3VMj5MYxGX/fpRV8K+RKfE=;
 b=kewFAryi2Dwg4eOSG/KcNqW3hZ2mEEdFszlRaCqJmFdY3rtoJBE36u9WAiWjrmGSrJ
 n2cuEk69zuqlzVdXEAEOvVJ30CdDAPmqnpBYKpFrLsYNU7LQQ3hkQUWzApVfa7fNvdKB
 cZywaMD28+eIYTgoWwnCFFs029pAw8FcgTHGk025FzSsPH5oVk+HIZDt+OoJK9WMu/Zh
 2Y/7UBGHH8IdNOQsplUuv06WcVoOpFfeuk2DA04O+B8HYpAcUYWN6Jw3uOy4hs6LwtvY
 Rgr5rzBwy5Ivj6pWa9fjk4/LEOA8HpR0ZQvKQ0UPFGqyBACJ84jCS8nM0v2kU02s9v6e
 tAcw==
X-Gm-Message-State: AGi0PuZKaRhgvLJ8SSDUDKs1KudIc1ZDmA+vyg+x7sZmSmw4FfmCpd6H
 gUR8k9J/4hH2TpjmpOrbKH4c0A==
X-Google-Smtp-Source: APiQypKpWOoytMwFddtGig+tyQ1cQ/+/BzyjeqjuD+Yn676+RLoOm8Ss5kMQWXOS5y+mMg71oTdPxA==
X-Received: by 2002:a17:90a:a591:: with SMTP id
 b17mr7102737pjq.90.1586965788260; 
 Wed, 15 Apr 2020 08:49:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x27sm14382473pfj.74.2020.04.15.08.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:49:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Subject: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
Date: Wed, 15 Apr 2020 08:48:39 -0700
Message-Id: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This moves the bindings over, based a lot on toshiba,tc358768.yaml.
Unless there's someone known to be better, I've set the maintainer in
the yaml as the first person to submit bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 --------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 188 ++++++++++++++++++
 2 files changed, 188 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
deleted file mode 100644
index 8ec4a7f2623a..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-SN65DSI86 DSI to eDP bridge chip
---------------------------------
-
-This is the binding for Texas Instruments SN65DSI86 bridge.
-http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
-
-Required properties:
-- compatible: Must be "ti,sn65dsi86"
-- reg: i2c address of the chip, 0x2d as per datasheet
-- enable-gpios: gpio specification for bridge_en pin (active high)
-
-- vccio-supply: A 1.8V supply that powers up the digital IOs.
-- vpll-supply: A 1.8V supply that powers up the displayport PLL.
-- vcca-supply: A 1.2V supply that powers up the analog circuits.
-- vcc-supply: A 1.2V supply that powers up the digital core.
-
-Optional properties:
-- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
-
-- gpio-controller: Marks the device has a GPIO controller.
-- #gpio-cells    : Should be two. The first cell is the pin number and
-                   the second cell is used to specify flags.
-                   See ../../gpio/gpio.txt for more information.
-- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
-               the cell formats.
-
-- clock-names: should be "refclk"
-- clocks: Specification for input reference clock. The reference
-	  clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
-
-- data-lanes: See ../../media/video-interface.txt
-- lane-polarities: See ../../media/video-interface.txt
-
-- suspend-gpios: specification for GPIO1 pin on bridge (active low)
-
-Required nodes:
-This device has two video ports. Their connections are modelled using the
-OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for DSI input
-- Video port 1 for eDP output
-
-Example
--------
-
-edp-bridge@2d {
-	compatible = "ti,sn65dsi86";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x2d>;
-
-	enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
-	suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
-
-	interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
-
-	vccio-supply = <&pm8916_l17>;
-	vcca-supply = <&pm8916_l6>;
-	vpll-supply = <&pm8916_l17>;
-	vcc-supply = <&pm8916_l6>;
-
-	clock-names = "refclk";
-	clocks = <&input_refclk>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			edp_bridge_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			edp_bridge_out: endpoint {
-				data-lanes = <2 1 3 0>;
-				lane-polarities = <0 1 0 1>;
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
-}
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
new file mode 100644
index 000000000000..8cacc6db33a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI86 DSI to eDP bridge chip
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+
+description: |
+  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
+  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
+
+properties:
+  compatible:
+    const: ti,sn65dsi86
+
+  reg:
+    const: 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specification for bridge_en pin (active high).
+
+  vccio-supply:
+    description: A 1.8V supply that powers up the digital IOs.
+
+  vpll-supply:
+    description: A 1.8V supply that powers up the DisplayPort PLL.
+
+  vcca-supply:
+    description: A 1.2V supply that powers up the analog circuits.
+
+  vcc-supply:
+    description: A 1.2V supply that powers up the digital core.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Specification for input reference clock. The reference clock rate must
+      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
+
+  clock-names:
+    const: refclk
+
+  gpio-controller: true
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is pin number, second cell is flags.  GPIO pin numbers are
+      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
+      information.
+
+  '#pwm-cells':
+    const: 1
+    description: See ../../pwm/pwm.yaml for description of the cell formats.
+
+  data-lanes:
+    description: See ../../media/video-interface.txt
+
+  lane-polarities:
+    description: See ../../media/video-interface.txt
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for MIPI DSI input
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for eDP output (panel or connector).
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - vccio-supply
+  - vpll-supply
+  - vcca-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+      };
+    };
+
-- 
2.26.0.110.g2183baf09c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
