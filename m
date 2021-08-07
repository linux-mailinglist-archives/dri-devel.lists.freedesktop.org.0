Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDADE3E358F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 15:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778589DB4;
	Sat,  7 Aug 2021 13:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F13B89DB4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 13:31:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h13so14874624wrp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kk2TIJBnBsHrY0AgCcZBpUvM/otmEEmZg6Qy6Fa8m0w=;
 b=mcZnW5oS+yRq1JQFhADJdjJ+Qm3qDs+lxYg17QHokll9uTbhTK//RiWJo+aHcMksu+
 8VWX31qHEedTdcshDWsou2q6xut1GrDetkPpVyphRKnjLbb/I04knHy4Pu2ufVmNjcJN
 zG9mx5k03gNJuzyK/p6y9/pwc7hP2a9k21pUsMavxza9N+OctSkQ4jDsL4KxkxoPm3K+
 koBlnyHfNzIrHqN6AQTfroHl9viudqj6hl56/CnhtHFVohrA9CG0jkHruMaRfyGbliPa
 eOjKI6OM3Q5R0jNQHktDE2168ug8DN+ZbUDwXkxejOEbQb/XNuaxkJ/2wDyZWiHUPlGx
 YICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kk2TIJBnBsHrY0AgCcZBpUvM/otmEEmZg6Qy6Fa8m0w=;
 b=Jov4W70qi/BP83geaQ5l6diP/KG05NC9Z2Sy+luf/C/eZOzXORJVqP+Znr/Vnf6Zma
 9OkE/PU9Ec18zGjARYS3pRTvRSqtiPiUJFDHc8M9SERYZX+rNYP933WHRldgJ4GkhD5p
 fqdvf0hFBpShYI8RnyN4O3mmW0BGr68lGnq5NBeMCXH8UTTKRIMpGPSLfS4e0JVHclNp
 Hup9AhYcLKhe/1l38MKid2N5UOmO5SbLyV8lXq0Yb4izhabdX+/IkDHjksPVPVjCgpoa
 syhNt0JTvjwQiJenECfIlFzm1+EEIeQyH25SncLTjiBEuzarivLU2fVeklW2h2MHT4zO
 KENQ==
X-Gm-Message-State: AOAM532S5k312Xe+W01LcQksY4ydIlqy7tr0vnWQPajYy+m1Gb2mW4kT
 l3DOgxn3Ek/duSQ/Q0ZdShQ=
X-Google-Smtp-Source: ABdhPJyKb3aiwWpDg94pDY+FHs78zd+4PsHG9ofn+rnRt8EnDFCf7TEcA3wtFnsf47dGAKd0uJodnw==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr15662037wrj.216.1628343084070; 
 Sat, 07 Aug 2021 06:31:24 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([62.122.67.26])
 by smtp.gmail.com with ESMTPSA id x12sm13254454wrt.35.2021.08.07.06.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 06:31:23 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 phone-devel@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH v2 1/2] drm/panel: Add DT bindings for Samsung S6D27A1 display
 panel
Date: Sat,  7 Aug 2021 16:31:10 +0300
Message-Id: <20210807133111.5935-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807133111.5935-1-markuss.broks@gmail.com>
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
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

This adds device-tree bindings for the Samsung S6D27A1 RGB
DPI display panel.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>

v1 -> v2:
changed additionalProperties to unevaluatedProperties;
added vci-supply and vccio-supply as required;
---
 .../display/panel/samsung,s6d27a1.yaml        | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
new file mode 100644
index 0000000000..26e3c820a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d27a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D27A1 display panel
+
+description: The S6D27A1 is a 480x800 DPI display panel from Samsung Mobile
+  Displays (SMD). The panel must obey the rules for a SPI slave device
+  as specified in spi/spi-controller.yaml
+
+maintainers:
+  - Markuss Broks <markuss.broks@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6d27a1
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
+  spi-cpha: true
+
+  spi-cpol: true
+
+  spi-max-frequency:
+    maximum: 1200000
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vccio-supply
+  - spi-cpha
+  - spi-cpol
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        compatible = "spi-gpio";
+        sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+        miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+        mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+        cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+        num-chipselects = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,s6d27a1";
+            spi-max-frequency = <1200000>;
+            spi-cpha;
+            spi-cpol;
+            reg = <0>;
+            vci-supply = <&lcd_3v0_reg>;
+            vccio-supply = <&lcd_1v8_reg>;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.32.0

