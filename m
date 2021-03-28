Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D071334BCDE
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 17:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11406E10E;
	Sun, 28 Mar 2021 15:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710186E10E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:24:34 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id q5so8215053pfh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xNXtry2Hu3JdjVXeffx4v7Aev22e7UumqFVP1K8btoQ=;
 b=aAuR5+mdzcpvzR1mMmjxciZ/2g/D1qb9ZNVUMHd/tF+pLw2UJ1dYlX2vMCiO3KWQb7
 hCmEJglsNMpe58Ddwlvj9AOVqRLfBbodDiAeAyJVM+TilT9EVsjRGhLq2jcJ7EB+ULyZ
 oF8E8oVL0o4OSIr+ccQH98enIrDMJVGDBPeeQ7n/6E72TI4dw1rlQAW2eujfaBhKPk91
 rgOu+oUS9EjrAWKN1iSXnec8v2Que6meUrX+EmbRbhh5Xh/4nBiGZr1l4AxRd7cWUlPa
 z46EygnDfoH6f+SE/aWECPAKQZN4LUVWKpUnKfXYKcEQ6JaQysdCo//A6EyPVgnlk3Qd
 4mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xNXtry2Hu3JdjVXeffx4v7Aev22e7UumqFVP1K8btoQ=;
 b=idGmpoZyJyGP2jxtHcH94NK+XKAAzKmR2SyAb/QW4afAixvq7mYSaq4kZYumLakloQ
 QhuwPg6KcHOq18q4cT+tUn55UXx0TKBd8M+pLxBFWfiYqTSdNi7LDC3B6IHsBA9JTZma
 i360JxNhlNzy+7ihlpRIMHGlmO0G2qeAHRIySyCEXcExMG/9PGUhXlJp/c77PtF5x575
 KE3iA2jpkNdK9wdpZkYx8UeqEddMDO7sxZxsT00Dbyd9U7xx8xClwj5PkayUiBdD/r8G
 t4JG4fHO9C1thrFMZZ3yQnTBdLmBqattlZHmmBbrfR8yxD5eIgeLGZGJKOpmRG41M8W7
 m3Sg==
X-Gm-Message-State: AOAM532EGm/l39CnhGk8XCoRe8mcdG2XcGwSzqSXURRu48jgLaVNYkS9
 QBFocvM9syIl/kzVu0M4sh73kexhf5Hqog==
X-Google-Smtp-Source: ABdhPJwYbDf8tHmqG84H5IlUb9qidIM0U3hQCarKNIOKObdhjyWzAXcau4Gt0lCykLYmp7Zse0WVDw==
X-Received: by 2002:a65:640d:: with SMTP id a13mr20052658pgv.272.1616945073786; 
 Sun, 28 Mar 2021 08:24:33 -0700 (PDT)
Received: from localhost.localdomain (1-171-1-114.dynamic-ip.hinet.net.
 [1.171.1.114])
 by smtp.gmail.com with ESMTPSA id j188sm14651174pfd.64.2021.03.28.08.24.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:24:33 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Subject: [PATCH v6 3/4] mfd: rt4831: Adds DT binding document for Richtek
 RT4831
Date: Sun, 28 Mar 2021 23:24:18 +0800
Message-Id: <1616945059-8718-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
