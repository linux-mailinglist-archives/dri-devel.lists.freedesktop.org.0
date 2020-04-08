Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62221A29EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A906EAEC;
	Wed,  8 Apr 2020 19:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5926EAE3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:14 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s13so6102926lfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
 b=Wcyly17xbNloQHRr3gJ1Ewo80JQgqvyC16Teu59a9OL4uWC9pb2LvxXD8VL5Qu5Nnp
 Nzv9yu9GSTjnHVQT/33P5xVr2d7FEKBCuzZQv5Wj8V7H5r2TfGVFVItBmbfmm4RRzpfX
 rVOzVdK5FIvgihaMttBf3FIKAL065klTZ/ayHg3MkfLg8SBHz8p3OYpfClosojeXaqm5
 A0wE73PgqWp/Chbv9iI+A3FWyDAPPkmDcDRalbiYpRB0inc1GBh2f9EQ3juh1UuiooLQ
 WT0POz957Jf8amAFare1gdJ5SSSKKEAhG8DiZNjjBIHCRRJ0kEHAAmLaZ7Kd0WSo2z5l
 cAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=azOZ7kPdKDKE87CbcQj8S1GR4y4K/OoMeP9jpkMqrjY=;
 b=ZHWnObmCJc7rw4cIbLaOOVYollMFnjT5RPN0kx+Azbnso0jbfIHkjkXsQe5ekcyseK
 ZNXnNpTh/hQ8dBnUWptK/zx9TF8OKFoIEMUPgzDbaeMljU9Ay08HrBEA9Jrw0ML4tqkA
 6EcA+or9j5z0xmuJX24tnyhFp7QLgXiG3SQaJcCBr/vCiS3J6M4Ci0VdMhh9npduGI7x
 eVMMgvPKzQ8h1/znKcAUUmjiO5Bo4kJKQIsSnp0KkS/pUhF9v3DCIjjlP8YXYQxTVK5q
 oLEoV0hecAH4UMFReL3jo9F86oPhxVjuNZTmoWIfp02R6YKc2is73d241Z6OhJHRBwFG
 zE+Q==
X-Gm-Message-State: AGi0PuZtZO2ZQ/bBAF6Kwg4SPSEyLiWKqBmJitQxNeX2r+0WAJrMlOA7
 ECjn2kVqacRP7y/LQZT1p3Uxh8qawDY=
X-Google-Smtp-Source: APiQypLO+c4OXBSTHGpgaACmk6IGVQPJyFCaU+CRJeR0O5n7ofrpY+O9NkbTWmTaG/uewke3JHvs+A==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr2288925lfm.133.1586375532330; 
 Wed, 08 Apr 2020 12:52:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 29/36] dt-bindings: display: convert sharp,
 ls043t1le01 to DT Schema
Date: Wed,  8 Apr 2020 21:51:02 +0200
Message-Id: <20200408195109.32692-30-sam@ravnborg.org>
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
Cc: Werner Johansson <werner.johansson@sonymobile.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The txt binding specified the property "power-supply".
But the example and the actual implementation in the linux-kernel
uses "avdd-supply".
So the binding is adjusted to use avdd-supply as this seems
to be the correct choice.
There are no DT files in the linux kernel to check.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ls043t1le01.txt       | 22 --------
 .../display/panel/sharp,ls043t1le01.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
deleted file mode 100644
index 3770a111968b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sharp Microelectronics 4.3" qHD TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls043t1le01-qhd"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- reset-gpios: a GPIO spec for the reset pin
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "sharp,ls043t1le01-qhd";
-			reg = <0>;
-			avdd-supply = <&pm8941_l22>;
-			backlight = <&pm8941_wled>;
-			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
new file mode 100644
index 000000000000..a90d0d8bf7c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+maintainers:
+  - Werner Johansson <werner.johansson@sonymobile.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls043t1le01-qhd
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls043t1le01-qhd";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&pm8941_wled>;
+            reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
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
