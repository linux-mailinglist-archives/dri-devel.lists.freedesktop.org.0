Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CE759A18
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B4D10E4D0;
	Wed, 19 Jul 2023 15:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE7210E4CE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:45:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so11792736e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689781513; x=1692373513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/eSE5PufSbPTUsRNAeK5Nlopm2AA9GyCjqeYSlulI3A=;
 b=LjbyP/phFapwDihnGcU1TM699njxE3gU8W+o6nuquMg3Gbinz8PMCvZ991U+T5gGu9
 k2kBhGtMNu1UDFS2did5j0QH85W2M6GlP/ThTq2CtBK0G9WpV5lPqKk9bhgrraUxsdYq
 TS7VuYxJ5M5VN7f0+5Ou9BFeH6kTpOeh6Fdp0iMxOGpoZaWxL98PH6+ryUWTmh++3ojt
 D1NEpzN0hIN5c1bywouCwx04dsUG/BF/xAmOHJh9nDMvuv738Deu9SjQVh02rxOfm4fq
 880YeCCR8fAf8c3ry+X+YYaR+EN2cwIO5xcY+jtiyyw7KcxOHeLD2fpwsy1rPtFpLWAC
 OE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689781513; x=1692373513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/eSE5PufSbPTUsRNAeK5Nlopm2AA9GyCjqeYSlulI3A=;
 b=UJWfKUuyn6TnV5PmwvrvUWLn9zNAviHwIPwwR7F6U2CKKxbEdYRKM4hHnVwyrg3LQD
 TESPMigVobBtd+gJLN6BPssF3LSdNe3mS6Lrh/I7o5+DUvJf3XqpKuUK8bIh5uXYJaEz
 E4pjEO36+cC9oaH56h/14MzT4vsE16SwIyWiOSJE8+q2YEEdkHpgzIlJa70tmM12Y/04
 TJjYALmKNe3YBjm4DFOw0Mo9Y/mInQ1k+iB+ym5BV+bqZhiFLYUnr8XLi7eb15h1Rl+p
 0quvvvD1XN3Y89v5a4Bvq3C/S6fW9TeuB3xYfq6K5EOJL/miTxHGUwKqeboy6/BjWeN3
 pk4g==
X-Gm-Message-State: ABy/qLa6HA+fvt8hl07jgC3HZjpydajr52yqJqzze0KwRpz8H4u74Ui+
 cdZW7UZZZ53kDfvhsmzyg5Q=
X-Google-Smtp-Source: APBJJlFGNXbDbnAA9ArUgh05ey8iUBjzciSFQItiJjzD0Vsx2FKi172A3dqMVfN9FdeSK2KtTt+9Yg==
X-Received: by 2002:a05:6512:36c5:b0:4f8:6d53:a692 with SMTP id
 e5-20020a05651236c500b004f86d53a692mr154702lfs.61.1689781512689; 
 Wed, 19 Jul 2023 08:45:12 -0700 (PDT)
Received: from localhost.localdomain ([86.57.157.184])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25593000000b004fb78959218sm996075lfg.200.2023.07.19.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:45:12 -0700 (PDT)
From: Viktar Simanenka <viteosen@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Viktar Simanenka <viteosen@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: add bindings for pcd8544 displays
Date: Wed, 19 Jul 2023 18:44:49 +0300
Message-Id: <20230719154450.620410-1-viteosen@gmail.com>
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

Signed-off-by: Viktar Simanenka <viteosen@gmail.com>

V2: deleted oneOf property from compatible
changed prefix from 'philips' to existing vendor prefix 'nxp'
placed `reg = <0>` right after `compatible`

About parameters exposed for controller:
inverted - I had an unbranded display that after reset had all pixels black,
while register was in 'normal operation'. The display I have now is opposite:
all white after reset in normal mode. This parameter should help user keep
same settings in KMS(?) for diverse displays;
voltage-op & temperature-coeff - adjusts contrast for display. voltage-op
cannot be expressed in real units, because resulting equation looks like
V = a + Vop * b, where a and b varies with ambient temperature. Vop is a
coefficient. same story for temperature-coeff - it shifts resulting voltage
curve depending on display usage invironment;
bias - relates to waveforms for LCD segments. default is 4 and should be
changed only if you use external oscillator for display.

v1 link: https://lore.kernel.org/linux-devicetree/20230719092903.316452-1-viteosen@gmail.com/

---
 .../bindings/display/nxp,pcd8544.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nxp,pcd8544.yaml

diff --git a/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
new file mode 100644
index 000000000000..52e40fd0eacb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
@@ -0,0 +1,94 @@
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
+  - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcd8544
+
+  dc-gpios:
+    maxItems: 1
+    description: Data/Command selection pin (D/CX)
+
+  reset-gpios:
+    maxItems: 1
+    description: Display Reset pin (RST)
+
+  nxp,inverted:
+    type: boolean
+    description: Display color inversion
+
+  nxp,voltage-op:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    description: |
+      Liquid crystall voltage operation coefficient. Determines the LCD
+      controlling voltage on the display segments. Should be adjusted
+      depending on the ambient temperature.
+
+  nxp,temperature-coeff:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    description: |
+      Display temperature compensation coefficient. Increases LCD
+      controlling voltage at lower temperatures to maintain optimum
+      contrast.
+
+  nxp,bias:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description: Display bias system coefficient.
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

