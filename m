Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3AF1A29BC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3076EAD1;
	Wed,  8 Apr 2020 19:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199C6EACF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f8so6075286lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qc1djU1Q06MzocO0vj8yJYnsVz6qQEHWX4cQfpHpC4I=;
 b=X2ochy84yzXA/0+fvtag6VW/IgKSnj9XG+n+oL3ULehMMcy/9cmybQe9YCvqhTVXvu
 3RcXMR7NYE0O0KJr0HUxLRpRh0LTLjbn/k8rjM4GBIFXECnMA/calvcRHRBiamxkiEOG
 kZbipGNnGnXG6LKD12oNghy5DvnBnZPJ7E+hf8kuk9eo6N8eP6pTnBwHGlSJrlcwbQi/
 FC2XWQmiw3JH9qOhoyG6BwcqloO48RXfRNAvNaQ4z9keu9LQ2foCLcmr4XoE/VSdM636
 twb0l+7nFD/VOKxN2k6GDZNXnY5Cd0QHYX0V4upCJIPtc4Kl3JvSLLitI7Jkir6tT6cY
 cGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qc1djU1Q06MzocO0vj8yJYnsVz6qQEHWX4cQfpHpC4I=;
 b=mJJ6o9mZ1+jWaWVlbi6SNi090s2Us6LJN0aAgoLYefC4aX565nEiK9Cty1yYZWMsNg
 KDp5ZY2hwP0lQLCrPaB+tE7GlMLbvAjj6r9bR3GVDZhIqwlO5XOKlHV52DpjgSiHAmBo
 qwDs/sPbqlWXJXrsul1Z5bT42ZKDifMtEVoTO0PZDqxwBUktaMWsY2l1cGaafR1noiVk
 e5Rh31L3+I5EZA6eCoowywfE4XcV4Ryn2Z2fhX5+iGXblZ6l/NHj0l2RMK01Lv376Tpi
 qe6GA+VMdLBiSVLFwCD86ZSPqr0Fz1f3gqPqkSf6FsuI3TX/RZ9dLSvq3Hfk1Uyau90U
 tAcQ==
X-Gm-Message-State: AGi0PubhTXpCu3+QzdVIRyVLgrfjn58izJWPcFPM4n9YEULoVRWvvaEQ
 GqVdmrA9m2ye1wAK7ZKnct/olRel9Eo=
X-Google-Smtp-Source: APiQypJU/Kc5lMAE3LvrjQh8i7yMWN0pT25HAtOibX6nz7j2qvI09UFCXQY+wJQkpFQzFWGC52jezg==
X-Received: by 2002:a19:700a:: with SMTP id h10mr5770154lfc.184.1586375507684; 
 Wed, 08 Apr 2020 12:51:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 06/36] dt-bindings: display: convert boe,
 himax8279d to DT Schema
Date: Wed,  8 Apr 2020 21:50:39 +0200
Message-Id: <20200408195109.32692-7-sam@ravnborg.org>
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - Fix entry in MAINTAINERS

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/boe,himax8279d.txt | 24 --------
 .../display/panel/boe,himax8279d.yaml         | 59 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 60 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
deleted file mode 100644
index 3caea2172b1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Boe Himax8279d 1200x1920 TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,himax8279d8p" and one of: "boe,himax8279d10p"
-- reg: DSI virtual channel of the peripheral
-- enable-gpios: panel enable gpio
-- pp33-gpios: a GPIO phandle for the 3.3v pin that provides the supply voltage
-- pp18-gpios: a GPIO phandle for the 1.8v pin that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel {
-			compatible = "boe,himax8279d8p", "boe,himax8279d10p";
-			reg = <0>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
-			pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
-			pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
new file mode 100644
index 000000000000..e42b6a8ae176
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boe Himax8279d 1200x1920 TFT LCD panel
+
+maintainers:
+  - Jerry Han <jerry.han.hq@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: boe,himax8279d8p
+      - const: boe,himax8279d10p
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  pp33-gpios:
+    maxItems: 1
+    description: GPIO for the 3.3v pin that provides the supply voltage
+
+  pp18-gpios:
+    maxItems: 1
+    description: GPIO for the 1.8v pin that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp33-gpios
+  - pp18-gpios
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
+        panel {
+            compatible = "boe,himax8279d8p", "boe,himax8279d10p";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
+            pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
+            pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b99fa16ba08..dba84e7726b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5255,7 +5255,7 @@ DRM DRIVER FOR BOE HIMAX8279D PANELS
 M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
-F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
+F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
