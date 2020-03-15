Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306F185CE5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3CC6E195;
	Sun, 15 Mar 2020 13:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CE66E181
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 19so15583442ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbZs3xCKO0rPyc/A/ruz0C0c57eblsfHWM6KLaBbzu0=;
 b=mtwGW4X5xdOlrVhAc/VLwG/7ziAXS7Fkgze/TQPojsuIjfXZLH/ntsYYxHp/lCvJ9C
 wOhHy+ppL+vxbK1AtRHhOxhYk96whG1LWzV0IiHtz70P7XsID90Z10HX46v2tus2/ao2
 oYJOizypDxrXOmVWk/74qJc+h33+35i3l6zxAMCJRklWKrprsFHPK9HF15p/StvnNbU9
 RslpirwYN6sWzmK7jjgg1gsxXT5V/JDJFjF31X9tEJ9H+KYlCVBmHbnM6Owfh++rcQWQ
 xvE6KyKJd05tfzlMhhaNtOsSsrtcrN21AXUE2mazJBZCWqeYj2tav0lFPPnQaJ4uosPc
 924A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fbZs3xCKO0rPyc/A/ruz0C0c57eblsfHWM6KLaBbzu0=;
 b=JgoH1qIjoraCgdxU7z4Ocr3oYgbFoO20K4O/gvdKYSi4EQjJQ/ykCkBo6qMZJ9I6Tw
 JmUqwrY2f0tqvkNVgVU8D1gf0v7gCfyXYQLFP333w7wUWDROPiX2WDAIT31Y2/pk2Chi
 zwl5tV64lP8lvSgSUE81q3wZ5Oy31QZFL1ZtKobnLz34Dom91XKyLcNjgs+Ht88R+i1U
 jlt+62RvUgl2rw2hkiBk3SzK9xOtuKDgO2OEgg7W+cjawRg55VABog+DWausNWhnkuvn
 kiaQN6RTwDPJVeV+JD1QLZal13xEDHEX2S0qrYnCgzHACBGM24GFptKh/51oe0cct7G2
 N2qQ==
X-Gm-Message-State: ANhLgQ3/puLYev8huYjrqgxvscEhZxXE8N3ZW+i3n6gat5rfx/LUu0ds
 YqHQsazaI2zEm/n5kuBOBWriMJHpENE=
X-Google-Smtp-Source: ADFU+vtdu+RtCfOyfUD8nHISljJPTE1xUWlvIyhAv6x8i0R2hy2i9EsS4Xv3x/wGemFSN33Ad6CKfA==
X-Received: by 2002:a2e:5ce:: with SMTP id 197mr14029954ljf.234.1584279893885; 
 Sun, 15 Mar 2020 06:44:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 12/36] dt-bindings: display: convert jdi,
 lt070me05000 to DT Schema
Date: Sun, 15 Mar 2020 14:43:52 +0100
Message-Id: <20200315134416.16527-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
index 000000000000..e0abf68ecb19
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
+    dsi: qcom,mdss_dsi@4700000 {
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
