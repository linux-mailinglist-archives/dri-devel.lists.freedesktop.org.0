Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A863B3946
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 00:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AF76E9AE;
	Thu, 24 Jun 2021 22:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB26E9AE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 22:39:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u2so4632363ljo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DxTs9lTae46Xhf8kLhsZfUlYx/YjM18QvR3O42D40aA=;
 b=f2MwHX5VBcVkGwZgCMni3tNxJmYesEn8BhxwrYdGMgyrT7r5Deuj5ZZt/E2mL7NItH
 BsBXjrjyeF4hHqs12NhMfbbtm2veljzqVXSPAn1qxe7SyyiUhRFNUtZS6OqurxTWviI9
 8DokPhK+KFDp0QjgP6NABbwWKWwtml4P6MgKmPZ+0LwofBDNEksbWp0twSF9q84RPXsh
 UQpdzaSv4W+horsvvmsFruFL//YULoGxA9CE3w/0xbZfff16nzhZBfsR5FouYlK+0Jxu
 hmSNXBFZgS7AwSv+8MPRhQXtGYWsRyF3nQIFU5r/jtGy9Xk3GL/CGZcd0upC9foaO8fn
 wMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DxTs9lTae46Xhf8kLhsZfUlYx/YjM18QvR3O42D40aA=;
 b=lKWddZFkutm6nHoCUODvWlIPQLvlt1NSG+Qkv2k6SXKoY+2QMP8mnReta+/HGIDAgo
 PAePWJfV7i5nq1XrQQDIZ756wXQAljVtIG1qEevkLFL1ybKSoeNI16QVynOrAeckNDdm
 CVIQmB4VLQ/CRFLYGMUiprA7vJmQrG7eZZ1BE8MGzRlW8xuOge1Gk9L0M4jdvuL0sBZS
 9i9hb+hzYwkL0eq4rI7dUjmYsAuuUvPnG42ACdN57B2DfEDSZVRbEpOy66caQNDEtYdM
 RCytQpc554/OPoQi4XZjiaIU4GFZ/xTaFVw3Q0JTwXPTWTDuQa8Lkq45yXqONGOA+vis
 27ZA==
X-Gm-Message-State: AOAM531J9tsrgfkFAjuC7rB5PQb4QAiRBcMwSToSr04WI51WE+PPaskv
 jMMWiloNnMqeTykkgLs8Q7L7uA==
X-Google-Smtp-Source: ABdhPJyWfx/EAsg04pU+FiCKFTcKQS4KhRid92ZjAQ4UTsCxFf7Ko+U/IPFNv0fp9GzDmmrNZfPCBg==
X-Received: by 2002:a2e:9e18:: with SMTP id e24mr5757701ljk.336.1624574397916; 
 Thu, 24 Jun 2021 15:39:57 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id e12sm341403lfc.84.2021.06.24.15.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 15:39:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: Add DT bindings for Samsung LMS380KF01
Date: Fri, 25 Jun 2021 00:37:43 +0200
Message-Id: <20210624223743.2486302-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds device tree bindings for the Samsung Mobile Displays
LMS380KF01 RGB DPI display panel.

Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../display/panel/samsung,lms380kf01.yaml     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
new file mode 100644
index 000000000000..138be12fc509
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,lms380kf01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung LMS380KF01 display panel
+
+description: The LMS380KF01 is a 480x800 DPI display panel from Samsung Mobile
+  Displays (SMD) utilizing the WideChips WS2401 display controller. It can be
+  used with internal or external backlight control.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,lms380kf01
+
+  reg: true
+
+  interrupts:
+    description: provides an optional ESD (electrostatic discharge)
+      interrupt that signals abnormalities in the display hardware.
+      This can also be raised for other reasons like erroneous
+      configuration.
+    maxItems: 1
+
+  reset-gpios: true
+
+  vci-supply:
+    description: regulator that supplies the VCI analog voltage
+      usually around 3.0 V
+
+  vccio-supply:
+    description: regulator that supplies the VCCIO voltage usually
+      around 1.8 V
+
+  backlight: true
+
+  spi-cpha:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: inherited as a SPI client node. Must be set.
+
+  spi-cpol:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: inherited as a SPI client node. Must be set.
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: inherited as a SPI client node.
+    maximum: 1200000
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - spi-cpol
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "samsung,lms380kf01";
+        spi-max-frequency = <1200000>;
+        spi-cpha;
+        spi-cpol;
+        reg = <0>;
+        vci-supply = <&lcd_3v0_reg>;
+        vccio-supply = <&lcd_1v8_reg>;
+        reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+
+        port {
+          panel_in: endpoint {
+            remote-endpoint = <&display_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.31.1

