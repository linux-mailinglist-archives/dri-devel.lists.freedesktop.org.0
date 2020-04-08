Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFA1A29C5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6C6EAD5;
	Wed,  8 Apr 2020 19:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB306EACD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t11so6124145lfe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZKT7JkrbeBe76Ve38Y5DpAsdq4DLeWVuQYfutOWAJM=;
 b=URahBBG9uTjbmyo//FFPxYRdWnD+o95TfL+CP9E/7AZh9mvnudlsHFuDc1TUHl0hLk
 ggyBbGmCO8oeB6kq/gtkD1mKMpZt0xp03yF69aNPCiheVFAI0BDJ5GG4iXe05xAYS6uj
 rprzsGQGnso64n2vsisazZZqGJJ1v2YE4UXfJh2DT3/jBozbxOWsnHC33QZ6IPzpBW7X
 ZKDFST8r8uDg88A+LfaqXXjZcW6Sf57Kg7A3yjsTFlcahh7uyalTLqd9tt4r37lDj+Lt
 CW6KAGf/bUWaPPph9pmop0uLtTWd/d7yBUP38dJxIxlpoB2IVtSW5476aZSuzBBw9KHL
 qwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fZKT7JkrbeBe76Ve38Y5DpAsdq4DLeWVuQYfutOWAJM=;
 b=INDNDj7Mjk6+R5aLU7qi6mLfEnVwd0P/QgoL9A8dBdbQDVqXA1c+r8l3qoC8BPggn7
 1sDzaTtacWfGh3hbhcm82QJ0xneTzjg6fcEcO3UIxwmVYdXbZ2iPb0ko3lUDsf6xiJFh
 HJcfEjqbgmmfZwFqvqCh5EUhNHkP/JARu3zqhWv6pmCVj/jUh0nhg8ZQuvFq2FgS3ppL
 FC3db1yKwL2gjj0M8m90vS08XuCe64fJGourT+mDSA79TikBn9GhT9eRLoc3dvaIaGAU
 yiOcF+zTCfB76nwoBOI39NPGM4kW+q6HQXc+s7RCytn8Lh9pKZlJ4WXeKalvWkV1rvxD
 TOQw==
X-Gm-Message-State: AGi0PuYnHtlefeAoDMLRCtDlBcj6vDyGcoC0S6aJXkxVbofEbjiHQCWJ
 rWhC/BrsafRRe072rrL19idLXFzeKQI=
X-Google-Smtp-Source: APiQypJ1QMHvaBeudTgdwstq727Ayqc/njis4k7wye7jYxfGodVZPr9hlCf8UfhdXzDPyMbtHdr3Hg==
X-Received: by 2002:a05:6512:3189:: with SMTP id
 i9mr5499182lfe.178.1586375509805; 
 Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 08/36] dt-bindings: display: convert ilitek,
 ili9881c to DT Schema
Date: Wed,  8 Apr 2020 21:50:41 +0200
Message-Id: <20200408195109.32692-9-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updating this binding identified an issue in the example in
the allwinner,sun6i-a31-mipi-dsi binding.
Fix the example so no new warnings are introduced.

v2:
  - fix example in allwinner,sun6i-a31-mipi-dsi (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  2 +-
 .../display/panel/ilitek,ili9881c.txt         | 20 --------
 .../display/panel/ilitek,ili9881c.yaml        | 50 +++++++++++++++++++
 3 files changed, 51 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index 9e90c2b00960..e73662c8d339 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -119,7 +119,7 @@ examples:
         panel@0 {
                 compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
                 reg = <0>;
-                power-gpios = <&pio 1 7 0>; /* PB07 */
+                power-supply = <&reg_display>;
                 reset-gpios = <&r_pio 0 5 1>; /* PL05 */
                 backlight = <&pwm_bl>;
         };
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
deleted file mode 100644
index 4a041acb4e18..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ilitek ILI9881c based MIPI-DSI panels
-
-Required properties:
-  - compatible: must be "ilitek,ili9881c" and one of:
-    * "bananapi,lhr050h41"
-  - reg: DSI virtual channel used by that screen
-  - power-supply: phandle to the power regulator
-  - reset-gpios: a GPIO phandle for the reset pin
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-Example:
-panel@0 {
-	compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
-	reg = <0>;
-	power-supply = <&reg_display>;
-	reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
-	backlight = <&pwm_bl>;
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
new file mode 100644
index 000000000000..a39332276bab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9881c based MIPI-DSI panels
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - bananapi,lhr050h41
+
+      - const: ilitek,ili9881c
+
+  backlight: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reg
+  - reset-gpios
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
+            compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
+            reg = <0>;
+            power-supply = <&reg_display>;
+            reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
+            backlight = <&pwm_bl>;
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
