Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFD37C3B6
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF16EC33;
	Wed, 12 May 2021 15:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E17A6EC33
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:21:57 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id t4so12694100plc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tVgAkGBFVimZZBUracvErIwvpUEHqs66nyqdBflm5/U=;
 b=FiOiW1/5F8Tv5RnGj+rHwDk1+p20TPFSFAehCRyPxI9/81bRBgMUBOmlvJxKZNRm6n
 c9ID7I9wp7I/x6bwwBYIh/PT5Fcij5Zoue9Shqd1CfPzQWFtbXHvLla2LC05+p1EfSr1
 10i24Isemv4n3WVD5h7YEqZ+NZIYTfjHImdp+BHFhG/rT3pCa6XV0e5KLO5BbUMnQbGd
 k69CRcGIdn2hfpMcMBqUrqZJVzk/gvBi/CC6SsAtyPYX18AUj4lprOXN+vS3rEC+erRC
 VRAO8V8/Cmbi8qRMzkJ1dtzap37PjezpXylVIFbx4rMD/cwcV9dEoA5G/5mzygJjVJVd
 HpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tVgAkGBFVimZZBUracvErIwvpUEHqs66nyqdBflm5/U=;
 b=tKnKmgQsWU3t7kRfbWiZ1/6jYaDisuos+ITz14D5LiaEAetlO6HRwwiI58uoEZFGma
 iJ2XqV0sSpfTcZDhIpF/IG2WpUdU5iNZ+HOsCUfwYaOdez/3SBv2ChT1PGAqYdKCAWCe
 +0xky9BUiTmnwKDdvME6RkAV5k+XdYcm3wlJtbhPOToWZrN5otdaY1F1ONwWNW+XXO6g
 0ukcVjW3JrWQra6zw/t4MJsI10pGAybXYWudTJ91SfA612bfeBQ+rDfG0jwMw0XG9ihw
 TcpbTV1QiYTqHJO48o/C4eG7kS7NBNa6kv8hKAK9ToexVQz5Q966Zhf60Fbusj0Oc4aU
 IIEA==
X-Gm-Message-State: AOAM533E48hT1AC+mO+nnkhjAaESmFVZmL9zEMMYzx8vKcDZS0MOxs1y
 /JIIJdS439fUfAv5wKGPRg8=
X-Google-Smtp-Source: ABdhPJwQh6KTizOSzT5reuY78FXiWUzhLhyiRGLcw/LjHS0z/CiqoR9yKJ7MtEWrp7ToClkc+3TX3w==
X-Received: by 2002:a17:90b:300e:: with SMTP id
 hg14mr39484848pjb.149.1620832917021; 
 Wed, 12 May 2021 08:21:57 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net.
 [1.171.3.209])
 by smtp.gmail.com with ESMTPSA id t133sm228633pgb.0.2021.05.12.08.21.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 08:21:56 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [PATCH v7 3/4] mfd: rt4831: Adds DT binding document for Richtek
 RT4831
Date: Wed, 12 May 2021 23:21:39 +0800
Message-Id: <1620832900-8347-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
References: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml

diff --git a/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
new file mode 100644
index 00000000..4762eb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/richtek,rt4831.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 DSV and Backlight Integrated IC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a multifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For Display Bias Voltage DSVP and DSVN, the output range is about 4V to 6.5V.
+  It's sufficient to meet the current LCD power requirement.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4831
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  enable-gpios:
+    description: |
+      GPIO to enable/disable the chip. It is optional.
+      Some usage directly tied this pin to follow VIO 1.8V power on sequence.
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/richtek,rt4831-regulator.yaml
+
+  backlight:
+    $ref: ../leds/backlight/richtek,rt4831-backlight.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/rt4831-backlight.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rt4831@11 {
+        compatible = "richtek,rt4831";
+        reg = <0x11>;
+
+        regulators {
+          DSVLCM {
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <7150000>;
+            regulator-allow-bypass;
+          };
+          DSVP {
+            regulator-name = "rt4831-dsvp";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+          DSVN {
+            regulator-name = "rt4831-dsvn";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6500000>;
+            regulator-boot-on;
+          };
+        };
+
+        backlight {
+          compatible = "richtek,rt4831-backlight";
+          default-brightness = <1024>;
+          max-brightness = <2048>;
+          richtek,bled-ovp-sel = /bits/ 8 <RT4831_BLOVPLVL_21V>;
+          richtek,channel-use = /bits/ 8 <RT4831_BLED_ALLCHEN>;
+        };
+      };
+    };
-- 
2.7.4

