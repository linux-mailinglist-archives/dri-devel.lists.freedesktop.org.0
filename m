Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313F1A29CA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC326EAD2;
	Wed,  8 Apr 2020 19:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8436EAD4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z26so4883627ljz.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYrJF3e3mbjgA2vboUYUSfmWZgwbVtyg97lpyl5MNOk=;
 b=Y4QY9PlzEU8bKwgDXL4k//gLi61hy+UdFpBsQNpdj4tmmKkkLWOhAc/NWh1XdFnn8l
 IY8hG28rHPAVuUgY372H3ISJBoCr4FepMZjOB4xi8uL9N3JlSvGaI1HBxvS23T+43u2S
 r/qGG/MBsjGVCKUHJSZPlLCJLrcSGj2U5q3NyvjBya4qbdEVVTWrLSRGnrk0XXApK4mB
 /4/VabLI5yK+fwx9XHwgQZMLNHLlrF1s4hnj94lfGjBIwPc4TugcLEFH7oIAodA21Eth
 RKalbNTrRDIeDqhyd6nN8N0acUlnGjymoI5Qaoe1TrkJwA2F/70vS7OUuZmWX/T0k7+i
 H5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WYrJF3e3mbjgA2vboUYUSfmWZgwbVtyg97lpyl5MNOk=;
 b=MrYxCgKizYC+u4tFREh7G8fBM4xTfyB9cTPt2n5L9Qo/1bQklZGJyv7qznGgaU21g9
 +MLq7s1t2/4nrEmtMoQOWqoGMOna0YsLZIXdmQmzJnPF+Dwoj2jYr5Ti4AMF6Eql12an
 bzezh/94Hva1pu0wnlsZS6xEFvOX8y2Hhl5+m6utj/GR7Qo6r9XgBXVbxh2PbqPt06zB
 7RyWB76MkxtWIjj0WVgbCS4xs0BMmPAbpl2N6tlBGOv9y+qYPY/nS6m794cCVa6ajJHd
 w6/vTKPFRHQFIC0HFDHAP8d13yPmCEaNngLhIZcHWNCH5+PsSei+YgFCAIMla6K+qfmZ
 JwZw==
X-Gm-Message-State: AGi0PuZHnSRMVRShapCIc4cP15se2IfknI35WZ2N0dihaOWY/JNzmLwJ
 KwqOX41EAx3dUWbSSKW3uz+9yOmtZKo=
X-Google-Smtp-Source: APiQypLzGKldww2n+Vwp7AHRsEz47XrLIb/udKNAA5/wh2B9FGEsWgQFZkKgXU3CiNndY2FqrQCaSw==
X-Received: by 2002:a05:651c:50a:: with SMTP id
 o10mr5636420ljp.163.1586375514023; 
 Wed, 08 Apr 2020 12:51:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 12/36] dt-bindings: display: convert jdi,
 lt070me05000 to DT Schema
Date: Wed,  8 Apr 2020 21:50:45 +0200
Message-Id: <20200408195109.32692-13-sam@ravnborg.org>
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
Cc: Vinay Simha BN <simhavcs@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - drop address in dsi node in example (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/jdi,lt070me05000.txt        | 31 ---------
 .../display/panel/jdi,lt070me05000.yaml       | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
deleted file mode 100644
index 4989c91d505f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-JDI model LT070ME05000 1200x1920 7" DSI Panel
-
-Required properties:
-- compatible: should be "jdi,lt070me05000"
-- vddp-supply: phandle of the regulator that provides the supply voltage
-  Power IC supply (3-5V)
-- iovcc-supply: phandle of the regulator that provides the supply voltage
-  IOVCC , power supply for LCM (1.8V)
-- enable-gpios: phandle of gpio for enable line
-  LED_EN, LED backlight enable, High active
-- reset-gpios: phandle of gpio for reset line
-  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
-  XRES, Reset, Low active
-- dcdc-en-gpios: phandle of the gpio for power ic line
-  Power IC supply enable, High active
-
-Example:
-
-	dsi0: qcom,mdss_dsi@4700000 {
-		panel@0 {
-			compatible = "jdi,lt070me05000";
-			reg = <0>;
-
-			vddp-supply = <&pm8921_l17>;
-			iovcc-supply = <&pm8921_lvs7>;
-
-			enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
-			dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
new file mode 100644
index 000000000000..b8b9435e464c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jdi,lt070me05000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JDI model LT070ME05000 1200x1920 7" DSI Panel
+
+maintainers:
+  - Vinay Simha BN <simhavcs@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: jdi,lt070me05000
+
+  enable-gpios: true
+  reg: true
+  reset-gpios: true
+
+  vddp-supply:
+    description: |
+      The regulator that provides the supply voltage Power IC supply (3-5V)
+
+  iovcc-supply:
+    description: |
+      The regulator that provides the supply voltage IOVCC,
+      power supply for LCM (1.8V)
+
+  dcdc-en-gpios:
+    description: |
+      phandle of the gpio for power ic line
+      Power IC supply enable, High active
+
+required:
+  - compatible
+  - reg
+  - vddp-supply
+  - iovcc-supply
+  - enable-gpios
+  - reset-gpios
+  - dcdc-en-gpios
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
+            compatible = "jdi,lt070me05000";
+            reg = <0>;
+
+            vddp-supply = <&pm8921_l17>;
+            iovcc-supply = <&pm8921_lvs7>;
+
+            enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
+            dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
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
