Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A81A29C0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1D6EAD3;
	Wed,  8 Apr 2020 19:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F5D6EAD0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t17so8963527ljc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
 b=CkcHjNsQ20m+yqfOzKHjMytfQoQkJG2wXH71UADD/ktN2zoVZeZ96XX0heMGOm//6t
 8K8huxzPx4uSJmqo70qEASm66u4HPllzSthMpTXQL4L+v+NFYblZLscv90xPt1BMPdxF
 wUYq3lS/wGAHjKteAaFK0e1DYemmbfldXefSO81xKMQVyaIksDe//blzgSR+RjJM3UBs
 CuC3OEeSqTMB2HNur6tG4z4WRmcgBoWXqiUU35daO7178UmQ6y0KHdEc79xS/JP7EezZ
 0iUAnJ+3iWMYd3u5/0+dacgP8FAAbnOy6QSfL5f3jAhE1SOd2El9KP1NDfoPoEaQB3zv
 1dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DKFWNzm+inHvUnuFaBbTyPTrAd4h6YpCxucuZ+VVDvg=;
 b=K5WgNqjtEWxJjjtfWn/Xz5q2EEgR9wPQGFYuUDu3ngK5bNZiHEXESwI9OzGo4V+H92
 dKyPG4biPdZHVAFeneGxmbTjWQju7+FqgMyvcHCxMw5Jbfd0pKdok/3tBUPudbLW9xN2
 DkJBzYPdtzIN0hfA4kxBXNI1Sar5czROkcLQH6P/MGvnzbS8Uk8yXGK4cjc/aCeM8Y43
 cCRuPe99T8sGit78VH5OuxQTvCGyncs2T1yf4itpW41/MnDipm4HeeJJIgAgHmEqB77u
 1rxSZZhYTm77ZFMAQEsJTydqeshMF1yLa5Zcy+Ezz2nBWQjViy0HnEOj6OUHRW32Iztq
 +gPA==
X-Gm-Message-State: AGi0Pub6vMZ/264shWBgYBTPMCRxKwVVUIwsm2+44oOvZGVthMtLxfhS
 D0PnGqGCl3aWH0UODVGFNRHvG/ZIuFs=
X-Google-Smtp-Source: APiQypJVKiKV3cQwYN7WSMqnPehfuKwlFS/3MwFscNM08RSykhQTIIaKCjs+GhUyHKjtquZVJhNjOA==
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr5583286ljc.285.1586375512022; 
 Wed, 08 Apr 2020 12:51:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 10/36] dt-bindings: display: convert innolux,
 p097pfg to DT Schema
Date: Wed,  8 Apr 2020 21:50:43 +0200
Message-Id: <20200408195109.32692-11-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Lin Huang <hl@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lin Huang <hl@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p097pfg.txt         | 24 --------
 .../display/panel/innolux,p097pfg.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
deleted file mode 100644
index d1cab3a8f0fb..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p097pfg"
-- reg: DSI virtual channel of the peripheral
-- avdd-supply: phandle of the regulator that provides positive voltage
-- avee-supply: phandle of the regulator that provides negative voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			avdd-supply = <...>;
-			avee-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
new file mode 100644
index 000000000000..5a5f071627fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P097PFG 9.7" 1536x2048 TFT LCD panel
+
+maintainers:
+  - Lin Huang <hl@rock-chips.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p097pfg
+
+  backlight: true
+  enable-gpios: true
+  reg: true
+
+  avdd-supply:
+    description: The regulator that provides positive voltage
+
+  avee-supply:
+    description: The regulator that provides negative voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - avee-supply
+  - enable-gpios
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
+            compatible = "innolux,p097pfg";
+            reg = <0>;
+            avdd-supply = <&avdd>;
+            avee-supply = <&avee>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
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
