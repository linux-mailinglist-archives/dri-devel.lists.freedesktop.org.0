Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E469D75EEB1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669710E292;
	Mon, 24 Jul 2023 09:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7915D10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:07:28 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso5960586e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690189647; x=1690794447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GW4IPYVW8Zq83RgacffHLZpPhSAB6bm+nS5zZOv0Rrg=;
 b=Y06cROcc4tgb+taRDoEcqWhvsTgl4WBCVaMm7ygcueZwYD2OR93/MLkAjw4wengjI5
 QtVj9aHllNyWwfAnEArDZIpxcGcF6j3oodzLQ4jVNl3xCw6JtamGfqJK7a8U8IS+iJMY
 VmP8pmgTw3QOpqbeB0MOLvTpG7i+2HR10OYdNyz9E3ghFyfkLPN9qdINi3VKK14WsUGN
 3NEGD3gppPf63+4tprut9Vn7Z+zf9TeCZduciU1prQsAIhDKz3kDmAgfFXy6GKyoOAW3
 umBNTAC2mtYesW55NVMxeLGe5VNrNGLJq0EzhITVbkvwpxXuBOvSwRrg2+5PvlPfgeLK
 h5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690189647; x=1690794447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GW4IPYVW8Zq83RgacffHLZpPhSAB6bm+nS5zZOv0Rrg=;
 b=cT6dkcA+l9KDAAehlnR27G3Kix8HdKp9CxoTYxpMHbw3lHm9+Fj1anOQhjBhVmKS0u
 +835vkrhs5LeiDgGOyc2cNWokQqTaXjSkEFA+UFfU+n/JVK9ywXx3EW1JAYFiX8C6aQe
 uFC4z50uWBE3TIblNHGrc5M/p1XCmE4Slqeoj6SyQPydcTadeyiUnelsid/tivhAgZUT
 b2+svgHPeGXcQMiKgRVasPddeeBR9m4V+kDPMwvlFTwC9z3KxOtzz3+z1FhMExsQsh7V
 6tVkFj+4GNr/Z0yYVP1jQZtkodByCAvWU9SE16srIknGhaTrcxj219uh8xXqBdSHV1lt
 ekMQ==
X-Gm-Message-State: ABy/qLYYMCJCUbzheLBuujVcc4SHQQDa8UFZpUcrH5KPaq2QgFtUwaaw
 NZWiMM2f0IRbpGuRfEISXPU=
X-Google-Smtp-Source: APBJJlFz15rC9PKvoxHO9kL9YanMvNfktF9sIkGqfiEwJoZLoBD5zaOA6orVATYdTLeT76gAdlSS8w==
X-Received: by 2002:a05:6512:2345:b0:4f8:7772:3dfd with SMTP id
 p5-20020a056512234500b004f877723dfdmr4817005lfu.11.1690189646339; 
 Mon, 24 Jul 2023 02:07:26 -0700 (PDT)
Received: from localhost.localdomain ([86.57.157.184])
 by smtp.gmail.com with ESMTPSA id
 j14-20020ac2550e000000b004fc863a0bf6sm2092473lfk.223.2023.07.24.02.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:07:25 -0700 (PDT)
From: Viktar Simanenka <viteosen@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Viktar Simanenka <viteosen@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: add bindings for pcd8544 displays
Date: Mon, 24 Jul 2023 12:07:12 +0300
Message-Id: <20230724090713.1489-1-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree binding documentation for PCD8544 LCD display controller.

Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
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

