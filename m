Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD177238F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9AE89B48;
	Mon,  7 Aug 2023 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111F10E288
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 12:15:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso70238101fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691410505; x=1692015305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PKePUWsqqPfdyKnC+nOZ4wJ8jqFpMDU8BF27PxoqbU0=;
 b=nn/v1ffZy6I2WKHKTqe3ekcuVHAg6+sC+A+r1Qr2bAjuxI+cdSe7i4tybkRHG2t/J5
 Y4qeH08exJLdyJfet9zh8kSFluNGP6K/IQ134xLklqENF757SAPsFUPc06hdXDVK0g2B
 fXEZUTflA8AxKcvWi9grzz0eBQNm3ahOubHKsW/eqtgh7SYzEDD7PsVSAW5kcX/9o54c
 Uurgb1m3Ae2tIznX0DSqlLqRLDEkyaraNmsaXD24uPGIbkCu6ojJhe08zYVCSxBkqFHJ
 ZscobIKvth/rddrkm1EfqxiHmn7MAqI4e9Q9sx3cTFcwJcGVDz6Mq2fa+BiWdlGqpBsF
 8NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691410505; x=1692015305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PKePUWsqqPfdyKnC+nOZ4wJ8jqFpMDU8BF27PxoqbU0=;
 b=KTY4JYRw3djA7//+K8jHfjWyg5zPGgmL2Tl5GC5u8J4k85FeLAouofrtRZikC25THL
 4c/3oyas2pprpcSVuBRJoEGNoZI6yDQAdYJ7VoHrRod5u63ns4JyzB185NFULZwr38X2
 2wQEiiJrOQKMkyrvGgI8yA+3/rv97/X84c0MMQOG7E8eKeYnGCxhjHjJ1FNfpL+lQcXy
 9d6abwqAIet7Fz7rldOERkiCoF3vJQkrVyiUbMHAMkAjxVWT87IOG9QmEef65KibwS5K
 s1IMDHR7L/UWpjXYIMlb+HjIAHViQWMa6R2FtY9Y6j7MQfitXDBVhVn9z+caNRG9IYea
 1PRw==
X-Gm-Message-State: AOJu0YwiKtYj904rc4v9Jg47BZc2TyMS8CZW753tIFVTyC6zoCa0VAt4
 7MCv8QFSTr3mQkfsqndcLxE=
X-Google-Smtp-Source: AGHT+IFf0qzcd8z5ADfWey3UpVtgneit/0BbLUhaxx9KIoJtbF7Oa62SuXUNgrYgyHGV6sWYFrUlDw==
X-Received: by 2002:a19:5007:0:b0:4fb:821e:2241 with SMTP id
 e7-20020a195007000000b004fb821e2241mr5279043lfb.23.1691410504848; 
 Mon, 07 Aug 2023 05:15:04 -0700 (PDT)
Received: from localhost.localdomain (mm-94-245-57-86.leased.line.mgts.by.
 [86.57.245.94]) by smtp.gmail.com with ESMTPSA id
 g20-20020a19ee14000000b004fe3212fefcsm1477868lfb.282.2023.08.07.05.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 05:15:04 -0700 (PDT)
From: Viktar Simanenka <viteosen@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Viktar Simanenka <viteosen@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2 RESEND] dt-bindings: display: add bindings for pcd8544
 displays
Date: Mon,  7 Aug 2023 15:10:21 +0300
Message-Id: <20230807121022.1871-1-viteosen@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree binding documentation for PCD8544 LCD display controller.

Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4:remove reference to panel/panel-common.yaml
add optional backlight property
v3 link: https://lore.kernel.org/linux-devicetree/20230720124026.356603-1-viteosen@gmail.com/
 .../bindings/display/nxp,pcd8544.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nxp,pcd8544.yaml

diff --git a/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
new file mode 100644
index 000000000000..236eb4f4b3a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nxp,pcd8544.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Philips Semiconductors PCD8544 LCD Display Controller
+
+maintainers:
+  - Viktar Simanenka <viteosen@gmail.com>
+
+description: |
+  Philips Semiconductors PCD8544 LCD Display Controller with SPI control bus.
+  Designed to drive a graphic display of 48 rows and 84 columns,
+  such as Nokia 5110/3310 LCDs.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcd8544
+
+  dc-gpios:
+    maxItems: 1
+    description: Data/Command selection pin (D/CX).
+
+  reset-gpios:
+    maxItems: 1
+    description: Display Reset pin (RST).
+
+  backlight:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle of the backlight device. The display may have an LED pin that
+      controls the backlight through GPIO or PWM.
+
+  nxp,inverted:
+    type: boolean
+    description: Display color inversion.
+
+  nxp,voltage-op:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    description: |
+      Liquid crystall voltage operation coefficient. Determines the LCD
+      controlling voltage on display segments. Should be adjusted according
+      to the ambient temperature. Adjusts the contrast of the display.
+
+  nxp,temperature-coeff:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    description: |
+      Display temperature compensation coefficient. Increases LCD controlling
+      voltage at lower temperatures to maintain optimum contrast.
+
+  nxp,bias:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description: |
+      Display bias system coefficient. Should only be changed if an external
+      oscillator is used for the display.
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "nxp,pcd8544";
+            reg = <0>;
+            spi-max-frequency = <8000000>;
+
+            dc-gpios = <&pio 0 3 GPIO_ACTIVE_HIGH>; /* DC=PA3 */
+            reset-gpios = <&pio 0 1 GPIO_ACTIVE_HIGH>; /* RESET=PA1 */
+            backlight = <&backlight>;
+
+            nxp,inverted;
+            nxp,voltage-op = <0>;
+            nxp,bias = <4>;
+            nxp,temperature-coeff = <0>;
+        };
+    };
+
+...
-- 
2.34.1

