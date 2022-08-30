Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C655A5A28
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D8E10E9E2;
	Tue, 30 Aug 2022 03:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67C10E9E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:41:02 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id q15so4733637pfn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 20:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
 b=oYDP/wpYKn7pzGewiKACK5FOKw8n7vLOfV7cZBxZgfMSIrsBFhQkO8l1QVhmWMI8r3
 62NBdsLQuf/GHqFU682JYnhk9lZXH9I3QIGy7JKB6FEM1EDE+ovh9qwMjCvk+YFmO5Z5
 IEoSarywLDduua/FoP6kjI2eb/QSmrmbZdJidyc1hYjI7EXQRZWs/0nauJ2A3gmzZYn7
 xUNaujrgcr8PM6YGY2Abr4FVrhgSPBeyf1IPVi9E2cRvuH8vFL8OMnmE9pmr8YvBbXOd
 0JzKUhqpRIMCir28PfI21TexDx0+69xqdEc1q3aQDHAeGZTNLXozIm4AsbBUBM6XCZ8j
 uHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
 b=I7ijxYVKjm1QL32qX1kfVFg969wpG6tSMc5Q5aAiKNj4+Z/hBnwUqe3cPY4PUNSLQ5
 gbv9iMqHyeGGK+x95BK9SJReuN3b5u9RyEbeWGujGC2/W+a0qkVCK+QmORGVNRcHzOo2
 huBT3jXGkTFjIMVi6yOuiq+AcTYAqCH2vistnYf1oDFwDWc3moVQpZof40SEp7XJJAhH
 DRVWs1IKBhlkOe2refjkoXiibSjwvXK40lqiBcGPMzDlFedF/8xlZrLlsl3FNQgXPW/F
 seH5ecnBRAr0vHx6/bYVK8K6VyU2IYPjzC21on1kZWeZFCNW2bV5WD2xtc2R118k3k+C
 VFOg==
X-Gm-Message-State: ACgBeo3CMtTL6ghJ4AcIiK0BK/+dt9e8xAL2dBEp75K9ICxFN10cwMH0
 5FDpolumokrFqS5trdxUxWA=
X-Google-Smtp-Source: AA6agR4W65aG3rwOdbOAexC/xIrC4Aa2k2yS38nDD0ciGVsBe+dmlZO2Xab8SX3NLTOzf53VDROejA==
X-Received: by 2002:a63:e74e:0:b0:42b:609d:3275 with SMTP id
 j14-20020a63e74e000000b0042b609d3275mr16198235pgk.443.1661830861964; 
 Mon, 29 Aug 2022 20:41:01 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net.
 [42.77.88.242]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 20:41:01 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, mazziesaccount@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v9 01/10] dt-bindings: power: supply: Add MediaTek MT6370
 Charger
Date: Tue, 30 Aug 2022 11:40:33 +0800
Message-Id: <20220830034042.9354-2-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add MediaTek MT6370 Charger binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..bd09a0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq
+      - description: usb plug in irq
+      - description: mivr irq
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
+    minItems: 1
+    items:
+      - description: |
+          VBUS voltage with lower accuracy (+-75mV) but higher measure
+          range (1~22V)
+      - description: |
+          VBUS voltage with higher accuracy (+-30mV) but lower measure
+          range (1~9.76V)
+      - description: the main system input voltage
+      - description: battery voltage
+      - description: battery temperature-sense input voltage
+      - description: IBUS current (required)
+      - description: battery current
+      - description: |
+          regulated output voltage to supply for the PWM low-side gate driver
+          and the bootstrap capacitor
+      - description: IC junction temperature
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: vbusdiv5
+      - const: vbusdiv2
+      - const: vsys
+      - const: vbat
+      - const: ts_bat
+      - const: ibus
+      - const: ibat
+      - const: chg_vddp
+      - const: temp_jc
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    unevaluatedProperties: false
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.7.4

