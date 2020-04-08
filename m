Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C31A29E7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23ED6EADF;
	Wed,  8 Apr 2020 19:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4F6EADE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r24so9016166ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aenQ+058iB0Lc8M+2E4UVh0+xwRdWKCjLRHP0fNdtw0=;
 b=kOyPs4QGl/rc9TCaQH7buO7wR0c7Pp5/F+Omzd5sidOfpnv7aQKjdvQukkiXXv8Ot4
 f6Hv7diTMA7GkrUXB4vlr7BM4QELbKi7ftBNf63CoJVi1rJfu/aOR/qp9sunDLyez8HU
 EdV9bo1EDwFp+/A6WAYKIvOe6qLCqSqnhIBj7GAdZDWcCoV7FXzeW14JZEYTET8Uujol
 /stCobkEr1T22GLe6i3ME5+HMPJGR+aCa11aODYWa6oSIgLoJhYC2pmWSnXyh61kdjd+
 dli0PyreKrCA34z1xRX3WrPJ1cW+6/JiFt6W3UMA1lh2a2vqEGU9lGC0OpfNTB0SmAMN
 861g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aenQ+058iB0Lc8M+2E4UVh0+xwRdWKCjLRHP0fNdtw0=;
 b=KACzPXf45AqabiA7tIQ5Ki4LnH6zY11aIxscbaGdUCd5eG9nRdwnTy699il5ldRHUw
 mdqk2IUVXXAYCJbYxNEzztlCgAWWBt1tLiX2PKG+MS9NiC9wHISn4FWAGlT6wACr+ewg
 gfCoQcPz1OLW+xRTHWoizZAoWWtHT3ZPExMw0mqxL66r5wNsZewg4JlLZQOzIv+Kj0a3
 fdHdnPmBXHkuP2E+dtLBTsgHETlczB2DOOs9uJ3Zdg26kawb7rJzwN3OoedRxKeusGWm
 CLvWiZd9oNxatzW93h43zEA+WVX5ATgH3HrgnZBMFYg3/xgw+Ckz3D5pSDLuau+1io8N
 N+RQ==
X-Gm-Message-State: AGi0PuY5liqf2tI0v4NJnk+bxqGrXrfgTTHwulT3HGuf9Sva8zvnjuKE
 YeaES2C6wu3KTOvbaPrQHPjgKZzpd6Y=
X-Google-Smtp-Source: APiQypJVQzOppHYZnedGac8/EzmOFEhtvjdeehlf8bRY45f0HTfWbTcoJs3hO/5LnVou/1csqRHBPw==
X-Received: by 2002:a2e:b888:: with SMTP id r8mr6092691ljp.128.1586375524036; 
 Wed, 08 Apr 2020 12:52:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:03 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 21/36] dt-bindings: display: convert samsung,
 s6d16d0 to DT Schema
Date: Wed,  8 Apr 2020 21:50:54 +0200
Message-Id: <20200408195109.32692-22-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/samsung,s6d16d0.txt         | 30 ----------
 .../display/panel/samsung,s6d16d0.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
deleted file mode 100644
index b94e366f451b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Samsung S6D16D0 4" 864x480 AMOLED panel
-
-Required properties:
-  - compatible: should be:
-    "samsung,s6d16d0",
-  - reg: the virtual channel number of a DSI peripheral
-  - vdd1-supply: I/O voltage supply
-  - reset-gpios: a GPIO spec for the reset pin (active low)
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-&dsi {
-	...
-
-	panel@0 {
-		compatible = "samsung,s6d16d0";
-		reg = <0>;
-		vdd1-supply = <&foo>;
-		reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
new file mode 100644
index 000000000000..66d147496bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d16d0.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d16d0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D16D0 4" 864x480 AMOLED panel
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6d16d0
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+  vdd1-supply:
+    description: I/O voltage supply
+
+required:
+  - compatible
+  - reg
+  - vdd1-supply
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
+            compatible = "samsung,s6d16d0";
+            reg = <0>;
+            vdd1-supply = <&foo>;
+            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
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
