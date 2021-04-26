Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797036ACD0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B9989B49;
	Mon, 26 Apr 2021 07:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA85289B49
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:18:29 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso7271457pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6RWbIvonEByJpfvCiy66ZaoSzZ4OjH7yQjNFQ9CvawY=;
 b=bRxMljdwsCQS7y6jWqX1ASjdJ/EaPibEQOfYE9HBYNOBnvdtXMC+vAjgzTeyNaLTuc
 jMCPuzAIVFp49Y0BbQTP8g117k69hHOM8PpqNQwFML1cr2DE0FffE7TKByjAyaDC0NSH
 z46+arR16GMbBE22FnfNmeDAPmnwZM+cQJVDv5sESlHsPeNxM7hQ+CHqsRsJ7OlzrZ7U
 IKn+oQAXTCKYcw1okQYtSiDXvqcjLKfj4ICZgWeWdWeua5asVPoi/P/Fjsv8hLfYc44P
 bJyMhl3D8mSp07EfRG6aKoiBiZI5zHLJTE4O5npD+MihOjMArODjumwybiHlCpsxwaJh
 9WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6RWbIvonEByJpfvCiy66ZaoSzZ4OjH7yQjNFQ9CvawY=;
 b=QJyhX9mBhVcY6R/5SxMZp7rX/YHj7BdOHbzBhOWKkZ9n77n+sVA9BDmuzfojIKGc6x
 YeXRweti3t92WPPUWSnNQASCClmMyyry+KJBnNAP7e8KCtdGQ+yPELPk8BJ4qNS+FIhe
 f4N73Ydh+JDt5JL5cpFH1CPM25lEzUfCo2JUEyB8TwKA6BxlgTquUqawZPjl0MuoKn7S
 PU3yf6jbjByEB6PAFiC5WU33rkF1fW1S7ltPfvKGbZ5DD03K/jNjPOyHwut80OLvu4NC
 BPYBzg2tXjGAaqMDMrq3uc98+gheUhI56iASeYnxnxHGcRqudia87C1YbDjzol3vcZth
 JNLA==
X-Gm-Message-State: AOAM533vim8b/IEeryWmMAxGJySMnrk4MxNbq0V9VK2rNKnaxhpGZDKr
 1XuBIHPkWcwu2JahT3VcyqDkXx2C9PSQNg==
X-Google-Smtp-Source: ABdhPJz9oU/l7nsklYCyOUk8PRxry7EV053Hh6tqqIUf/PcLLqIJJPzHxQ+RApOHOe7KA/oLknQCmg==
X-Received: by 2002:a17:902:6b0a:b029:ec:9899:6a2 with SMTP id
 o10-20020a1709026b0ab02900ec989906a2mr17304616plk.31.1619421509387; 
 Mon, 26 Apr 2021 00:18:29 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:492:3af5:75cd:677a:81f7:a9fe])
 by smtp.gmail.com with ESMTPSA id u21sm9848952pfm.89.2021.04.26.00.18.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 00:18:28 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for
 Richtek RT4831
Date: Mon, 26 Apr 2021 15:18:10 +0800
Message-Id: <1619421491-31494-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Resend this v6 patch series to loop devicetree reviewers.
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
