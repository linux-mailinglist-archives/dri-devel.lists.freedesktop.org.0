Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0D75AE99
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267CA10E139;
	Thu, 20 Jul 2023 12:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B4A10E139
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 12:40:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b701dee4bfso11206041fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856845; x=1690461645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qZpB//8lTb3ZFujZDE4bagrndu+Ju1KA0fQV7nLW6P8=;
 b=qvJZpZnSwnGhyzDAl2PcuhX/dXFvF1eqGMX9aU1XNHXJiji2BG1LBcmSzXYzVvhQ83
 iMuPmoHHPRTIjWLk6SIQ8EOjPV2q0MnX7/wE22jiAnF/lrXsAkrYGOwZzCpFg+iov03E
 0W7BXJIMRtkyXARlFhYyJn4JS4lI48a5oaJWbIpLKAHQTO+aWNfu21j4Wffn7u9hnwad
 oC6MJota+f1CKWiXtZFWOhvOig8RYRvxf1lVGGOZhhFIVwzqk7tCouL6mfSwzQ8gM8Y1
 Zh0KoW02gmDI/FrUA7ukZyG2UiuoT6jwsQbqhGPsfGyDMLKvPar8imzBum6vv/yPYFDD
 WFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856845; x=1690461645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZpB//8lTb3ZFujZDE4bagrndu+Ju1KA0fQV7nLW6P8=;
 b=hsfSvHm1EXWNxEPDNCT4qBjepAciK8Sn7OlkkpiVrkrX3aQ7cjbl/C0BHWe9Rf3qIW
 c0DRuAU4+UOPuELAuT3VASjG+X1br5w+CVILKoeF3JmRikjisSKo1+kU9fkYs6O5UzD4
 TypgsaqA9KNXQyiiMooiVbqbZslM08pgMJZGueQjhLUqp/cj1NmsCUvG0r9apsHkdS6Z
 R0Kk49oZErN07+QpoRHXszQiAXLDDkOUxftiO9GGig530CGanZcLpnxowMYTVBmf6wI0
 f7zO5EiDoLMIKHcKBt9D7gpi6igIu+fqx8HB3QxOm+d7iBn9tkygOrIMjrPUorgSpYpR
 txXQ==
X-Gm-Message-State: ABy/qLbvzEdd9mcUrG8Z+o1fyFvTWfe9pjy1IWx7frZwTBv2pugyamU3
 vdRanPQbQbsFEGR9QpIddvI=
X-Google-Smtp-Source: APBJJlGCsRv1WqRdDjmGfn+vYt0U6nAiFC5jMM+a/x0v0+O1Pr0ulNxOHZkVLvFRAI2H8dtdOXQhyA==
X-Received: by 2002:a05:651c:c7:b0:2b6:ccc7:4908 with SMTP id
 7-20020a05651c00c700b002b6ccc74908mr2063425ljr.15.1689856845260; 
 Thu, 20 Jul 2023 05:40:45 -0700 (PDT)
Received: from localhost.localdomain ([86.57.157.184])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05651c00cc00b002b94b355527sm258331ljr.32.2023.07.20.05.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:40:44 -0700 (PDT)
From: Viktar Simanenka <viteosen@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Viktar Simanenka <viteosen@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: add bindings for pcd8544 displays
Date: Thu, 20 Jul 2023 15:40:25 +0300
Message-Id: <20230720124026.356603-1-viteosen@gmail.com>
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
v3:add a little more description to the exposed vendor properties
   add commit message finally
v2 link: https://lore.kernel.org/linux-devicetree/20230719154450.620410-1-viteosen@gmail.com/

 .../bindings/display/nxp,pcd8544.yaml         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nxp,pcd8544.yaml

diff --git a/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
new file mode 100644
index 000000000000..bacdeff9776e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nxp,pcd8544.yaml
@@ -0,0 +1,95 @@
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

