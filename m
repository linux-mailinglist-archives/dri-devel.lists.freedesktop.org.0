Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9A565B5F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291AA10EC15;
	Mon,  4 Jul 2022 16:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431D110E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:40:05 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id f85so4177197pfa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 22:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3XOi0cmBkPSSpkuiRsnvThhbATi2+xXtks9vAN00ko=;
 b=Yi5c4J/lgf9uJPErVw3YjRWeH/15YOiBZhfMRdcUQ2YWXxVN6Fe/DKVshUEdZgKW8a
 XBuxWIhDWtaPgezWN7ypU9EGmmByAsPFzktKPEP8ae2REAnz1UBMS7zi4PalPXHtxiu5
 tf4AmPif3vJLPay/ZJwyesFH4ob1A1XVziZHTfkU3w1S0pu8jyHmLVMZLzToeMqvtlu9
 LOrRjZSXY7A5O/izgFZGGzsFKasQ0XLJL2028k+eyIQbg0ZiPWx5i87vOfAeiDsQn300
 yFBa6QHI0CW7t0EVo5sN6LF/f3W0m3ocnaIY9VqcMg1Q1RArYwHsAdDQ4dJmjg4sFuWs
 7yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3XOi0cmBkPSSpkuiRsnvThhbATi2+xXtks9vAN00ko=;
 b=ElRUUsm/lGv0RahAd7FDVN49cVFIMTtrP+BOUlxt/tnucg1SXczv2qtXMoHBghT3qG
 OakpUOfSbwVpLzYJX1AqBp7WxxICbO+3WnJRBOYN3qPy7TJo2NiKPxYaH+YMA8gyIKLq
 XEx93kWzw1VrELuAzf2OoF3WP1L/cHvXcwZ5DBKIujGsTgSd5yPKYceGoUHrNkxT1jr9
 8WQ1c7SEFtWonwD9gbhbYfgASMBDouhoJSQjkkUV4WrSPImPM7OiyiTuVyozp7AHAAFu
 nHoly8l7DqH/aD4xnGhoCaR9sK8aNBahHiLa1UiHNgQxdHby1HLBOfdYNVpZIzG+8S0z
 o9oA==
X-Gm-Message-State: AJIora/1A8jCpVSxaY+SEG1hwlvWbYM8XVSOElxDK86lR8mgAYcU1ZhO
 OcM8zYGkFmIcA/DVRvd+XCY=
X-Google-Smtp-Source: AGRyM1vG/LP70xaFBIwi5I9Khmc2oOOORNUFqTBysIkNhFDJUkI5n+IXWKXw0HNcnV1GMdwcwnFLDA==
X-Received: by 2002:a05:6a00:18a4:b0:525:532e:76de with SMTP id
 x36-20020a056a0018a400b00525532e76demr34685590pfh.18.1656913204809; 
 Sun, 03 Jul 2022 22:40:04 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net.
 [42.72.4.255]) by smtp.gmail.com with ESMTPSA id
 h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:40:04 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v4 06/13] dt-bindings: mfd: Add Mediatek MT6370
Date: Mon,  4 Jul 2022 13:38:54 +0800
Message-Id: <20220704053901.728-7-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v4
- Roll back all "$ref: " to v2 patch style (using
  "/schemas/...")
---
 .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
 2 files changed, 298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
new file mode 100644
index 0000000..410e2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -0,0 +1,280 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 SubPMIC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MT6370 is a highly-integrated smart power management IC, which includes a
+  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
+  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
+  driver, a backlight WLED driver, a display bias driver and a general LDO for
+  portable devices.
+
+properties:
+  compatible:
+    const: mediatek,mt6370
+
+  reg:
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  adc:
+    type: object
+    description: |
+      Provides 9 channels for system monitoring, including VBUSDIV5 (lower
+      accuracy, higher measure range), VBUSDIV2 (higher accuracy, lower
+      measure range), VBAT, VSYS, CHG_VDDP, TS_BAT, IBUS, IBAT, and TEMP_JC.
+
+    properties:
+      compatible:
+        const: mediatek,mt6370-adc
+
+      "#io-channel-cells":
+        const: 1
+
+    required:
+      - compatible
+      - "#io-channel-cells"
+
+  backlight:
+    type: object
+    $ref: /schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+
+  charger:
+    type: object
+    $ref: /schemas/power/supply/mediatek,mt6370-charger.yaml#
+
+  tcpc:
+    type: object
+    $ref: /schemas/usb/mediatek,mt6370-tcpc.yaml#
+
+  indicator:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-indicator.yaml#
+
+  flashlight:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-flashlight.yaml#
+
+  regulators:
+    type: object
+    description: |
+      List all supported regulators, which support the control for DisplayBias
+      voltages and one general purpose LDO which commonly used to drive the
+      vibrator.
+
+    patternProperties:
+      "^(dsvbst|vibldo)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      "^(dsvpos|dsvneg)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          enable-gpios:
+            maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - regulators
+  - adc
+  - backlight
+  - indicator
+  - tcpc
+  - charger
+  - flashlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+        pmic@34 {
+        compatible = "mediatek,mt6370";
+        reg = <0x34>;
+        wakeup-source;
+        interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        mt6370_adc: adc {
+          compatible = "mediatek,mt6370-adc";
+          #io-channel-cells = <1>;
+        };
+
+        backlight {
+          compatible = "mediatek,mt6370-backlight";
+          mediatek,bled-channel-use = /bits/ 8 <15>;
+        };
+
+        charger {
+          compatible = "mediatek,mt6370-charger";
+          interrupts = <48>, <68>, <6>;
+          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
+
+          mt6370_otg_vbus: usb-otg-vbus-regulator {
+            regulator-name = "mt6370-usb-otg-vbus";
+            regulator-min-microvolt = <4350000>;
+            regulator-max-microvolt = <5800000>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
+          };
+        };
+
+        indicator {
+          compatible = "mediatek,mt6370-indicator";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          multi-led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_RGB>;
+            led-max-microamp = <24000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            led@0 {
+              reg = <0>;
+              color = <LED_COLOR_ID_RED>;
+            };
+            led@1 {
+              reg = <1>;
+              color = <LED_COLOR_ID_GREEN>;
+            };
+            led@2 {
+              reg = <2>;
+              color = <LED_COLOR_ID_BLUE>;
+            };
+          };
+          led@3 {
+            reg = <3>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <6000>;
+          };
+        };
+
+        flashlight {
+          compatible = "mediatek,mt6370-flashlight";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          led@0 {
+            reg = <0>;
+            led-sources = <0>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+          led@1 {
+            reg = <1>;
+            led-sources = <1>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+        };
+
+        tcpc {
+          compatible = "mediatek,mt6370-tcpc";
+          interrupts-extended = <&gpio26 4 IRQ_TYPE_LEVEL_LOW>;
+
+          connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            vbus-supply = <&mt6370_otg_vbus>;
+            data-role = "dual";
+            power-role = "dual";
+            try-power-role = "sink";
+            source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            op-sink-microwatt = <10000000>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                endpoint {
+                  remote-endpoint = <&usb_hs>;
+                };
+              };
+              port@1 {
+                reg = <1>;
+                endpoint {
+                  remote-endpoint = <&usb_ss>;
+                };
+              };
+              port@2 {
+                reg = <2>;
+                endpoint {
+                  remote-endpoint = <&dp_aux>;
+                };
+              };
+            };
+          };
+        };
+
+        regulators {
+          dsvbst {
+            regulator-name = "mt6370-dsv-vbst";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6200000>;
+          };
+          dsvpos {
+            regulator-name = "mt6370-dsv-vpos";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          dsvneg {
+            regulator-name = "mt6370-dsv-vneg";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          vibldo {
+            regulator-name = "mt6370-vib-ldo";
+            regulator-min-microvolt = <1600000>;
+            regulator-max-microvolt = <4000000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
new file mode 100644
index 0000000..6ee7255
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+#define __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+
+/* ADC Channel Index */
+#define MT6370_CHAN_VBUSDIV5	0
+#define MT6370_CHAN_VBUSDIV2	1
+#define MT6370_CHAN_VSYS	2
+#define MT6370_CHAN_VBAT	3
+#define MT6370_CHAN_TS_BAT	4
+#define MT6370_CHAN_IBUS	5
+#define MT6370_CHAN_IBAT	6
+#define MT6370_CHAN_CHG_VDDP	7
+#define MT6370_CHAN_TEMP_JC	8
+#define MT6370_CHAN_MAX		9
+
+#endif
-- 
2.7.4

