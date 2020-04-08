Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93A61A29B2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B706EACE;
	Wed,  8 Apr 2020 19:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC9A6EACD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k28so6090920lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJEYCr5SGwVqF+Hy6/PLj+9fMT+BeuDPf85OWHTTG7w=;
 b=pjySUjaFk56A6It7X74m6UW7wQMFLT6kz3KxZdvpViNjyYAvFltzj+u1lrA8SbDGA9
 6nyaBHrwkIpWcXfdNW6UEQf+CGdZaI4NcC7f4GszBjx9/MbvHoO/aDaE9QR+g0+Qe5i8
 GuxdxvecPk/CyuvEP/+lpnmKB+M9sI8qjVwDlt82H0HbvbILDBoomsWuf9bdXWP0iL1U
 NsZTp/LPpN/Z1fnLPFdB5NZaKqLqKrNFQ/O4aLv66UjhXZcP9sKcG2+fT4tq55FEzoEm
 nVwNN/r7xx5WtBFqIiFYlNhjt8P2XPxvN6euzbB47ZcfG+EZK2tzK5JqxwNzf404CJDU
 ljow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fJEYCr5SGwVqF+Hy6/PLj+9fMT+BeuDPf85OWHTTG7w=;
 b=ckNeveD90ohPyLBLcfAQFHeE1jUhxRAaZotnmcnnbB63ZjBV38SN2oh7OC68qj44NE
 SGS6RrZhwvRhuv9Sd+Fzzrf/D1W39Q7yRonZbQPl6XXd+krKGw/77uRSKZTUf3q53fIY
 EyTScGJzEDsU4/BiCKBo+FdTanO3L+4M+lt7ntus5Fn1SJ2y4CxSpKwz7sbFaN7pxrSs
 7cCEYc6AyOeRt5rnKd34Z2jybrMV7hZMFd60vLK10ZOLESuMKkaPFQIDurxsFSscHUe5
 iy9kO/S2C2yc1jGFqE4HKcxoQumY9wur0jw1B1STgHzJzafC+MaH72f5ap7WgBybXb+r
 /l0Q==
X-Gm-Message-State: AGi0PuaK95M849pL9qxl5jXQTVlNTnouqqR1ocXIu6JzPIInzlugA1Lh
 QkyXs9yAoKch9My0orHm1DwcI90BBHQ=
X-Google-Smtp-Source: APiQypKVAVQoy4vW5//4ySRgsXIIuZhWqHZbM7YELLJI6NH9mo6bMPRjqkQPo3a3Qw4DXQlw7XC9IQ==
X-Received: by 2002:a19:c356:: with SMTP id t83mr818003lff.186.1586375504879; 
 Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 04/36] dt-bindings: display: convert samsung,
 s6e63m0 to DT Schema
Date: Wed,  8 Apr 2020 21:50:37 +0200
Message-Id: <20200408195109.32692-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jonathan Bakker <xc-racer2@live.ca>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The binding for this panel is a SPI slave.

v2:
  - Drop use of spi-slave (Maxime)
  - Introude unevaluatedProperties (Maxime)
  - Drop reg entry in example (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6e63m0.txt         | 33 ----------
 .../display/panel/samsung,s6e63m0.yaml        | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
deleted file mode 100644
index 9fb9ebeef8e4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Samsung s6e63m0 AMOLED LCD panel
-
-Required properties:
-  - compatible: "samsung,s6e63m0"
-  - reset-gpios: GPIO spec for reset pin
-  - vdd3-supply: VDD regulator
-  - vci-supply: VCI regulator
-
-The panel must obey rules for SPI slave device specified in document [1].
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-		s6e63m0: display@0 {
-			compatible = "samsung,s6e63m0";
-			reg = <0>;
-			reset-gpio = <&mp05 5 1>;
-			vdd3-supply = <&ldo12_reg>;
-			vci-supply = <&ldo11_reg>;
-			spi-max-frequency = <1200000>;
-
-			port {
-				lcd_ep: endpoint {
-					remote-endpoint = <&fimd_ep>;
-				};
-			};
-		};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
new file mode 100644
index 000000000000..1dab80ae1d0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e63m0 AMOLED LCD panel
+
+maintainers:
+  - Jonathan Bakker <xc-racer2@live.ca>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e63m0
+
+  reg: true
+  reset-gpios: true
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "samsung,s6e63m0";
+            reg = <0>;
+            reset-gpios = <&mp05 5 1>;
+            vdd3-supply = <&ldo12_reg>;
+            vci-supply = <&ldo11_reg>;
+            spi-max-frequency = <1200000>;
+
+            port {
+                lcd_ep: endpoint {
+                    remote-endpoint = <&fimd_ep>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
