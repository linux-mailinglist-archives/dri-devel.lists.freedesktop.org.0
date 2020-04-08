Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33861A29B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8A989C63;
	Wed,  8 Apr 2020 19:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB466EACD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:48 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z23so6107870lfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3NIwy6DH0VrIMtQZkqmRlNU3O8nwIcRPTornYJG1h+Y=;
 b=eoApHJB9l6wRj6v7Z4WjeTe605zriNJCb5fe2jR1gDUBJ4kb8CEjrTyVDhFdvnskfy
 knEn2es9tTT00LXR1mD2D3SBiPI8MOXv1FGZiS+RM9XIXvCOo5BsC9Tuhm4ByVjLZrHt
 EgAEYiNixcUQynjEkR8dVicbXSE253j48Ny4jUncEaGaFgOAGqA8wUrqYvM0bQJKjj+y
 ix+7vf8TcjX96vnJRKGcRpiUMkx8Gn9kQByD2bFJn0nH9ebYwGORPJuLkrvRluotCIo7
 kJHJekLjOkOMYzRs1x4NQN6DHpkNMyjGaEFzo4n2gw+ksAzKndIjuxwpqaOatVDUsoAP
 Xk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3NIwy6DH0VrIMtQZkqmRlNU3O8nwIcRPTornYJG1h+Y=;
 b=A9lVlyGyxZK49UiRg40lYTyjDri9WjCksJmdQv5THX6bscg1/P3ROoopQjyFTSXpeH
 l45EWyXr8wm69xVIQVWBcop125/93DblSIVEZW8WNyv15iJw24EvjoZ822lUid+gDlGu
 dfp+gbpdWlK8EZ+CcUSC91OFpmLTE6m8JPSj6eohR0B0g4OX53Y3/OxuHeKEyBqqbR0f
 GUN3U5Dm2SjmoUgKoafUnxGt1kGg9UdWiCzqHMaAm/WsU1NHdk13Ml3fOakkpsCZ0bFE
 vytW8yiNqNGfA2PGqxa7PfGKmhTbhqZgUIovt+EuQty2nitlBJb/a9Co/QMejwd+ky0c
 ou9w==
X-Gm-Message-State: AGi0PuZHBHD6j8jdDS7OcvyJ1OAhJrPk0Qoni16EuEScjTdVkUP3vxdv
 PMu+5q0GWyZcJlrAD2A+zs1eUcxWEEU=
X-Google-Smtp-Source: APiQypJLcrrKHvO9hWsDO30ITUy60HaEorZN6HkcRibU4WCr3XXCDrQaT+FDXLlVex8Naylk7snOsQ==
X-Received: by 2002:ac2:5684:: with SMTP id 4mr5411988lfr.88.1586375506282;
 Wed, 08 Apr 2020 12:51:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 05/36] dt-bindings: display: convert arm,
 versatile-tft-panel to DT Schema
Date: Wed,  8 Apr 2020 21:50:38 +0200
Message-Id: <20200408195109.32692-6-sam@ravnborg.org>
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

v2:
  - Fix entry in MAINTAINERS

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
 .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 52 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
deleted file mode 100644
index 0601a9e34703..000000000000
--- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-ARM Versatile TFT Panels
-
-These panels are connected to the daughterboards found on the
-ARM Versatile reference designs.
-
-This device node must appear as a child to a "syscon"-compatible
-node.
-
-Required properties:
-- compatible: should be "arm,versatile-tft-panel"
-
-Required subnodes:
-- port: see display/panel/panel-common.yaml, graph.txt
-
-
-Example:
-
-sysreg@0 {
-	compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
-	reg = <0x00000 0x1000>;
-
-	panel: display@0 {
-		compatible = "arm,versatile-tft-panel";
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&foo>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
new file mode 100644
index 000000000000..68cfdb90f54b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/arm,versatile-tft-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile TFT Panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  These panels are connected to the daughterboards found on the
+  ARM Versatile reference designs.
+
+  This device node must appear as a child to a "syscon"-compatible
+  node.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: arm,versatile-tft-panel
+
+  port: true
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    sysreg {
+        compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
+        reg = <0x00000 0x1000>;
+
+        panel {
+            compatible = "arm,versatile-tft-panel";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&foo>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 50b068f3580a..2b99fa16ba08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5229,7 +5229,7 @@ M:	Linus Walleij <linus.walleij@linaro.org>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-arm-versatile.c
-F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
+F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
 
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
