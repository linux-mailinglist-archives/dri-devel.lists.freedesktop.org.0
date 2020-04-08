Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B71A29F0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456796EAED;
	Wed,  8 Apr 2020 19:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B07C6EAED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q22so5254030ljg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=glF1/rVfsCqrnm2QIZUd5FUTcYcMxvbPO7G9VlD0g4o=;
 b=TXoGtZr+nOtgB4VYGHxmb1dac8cIditt0jI3CI66PoqGALYR0EUPgcdkMG6+2+M4+J
 3WlTyLSL0z+kidOINhHYirgfHe+zZmaVoVraqDorCICi48DE4hB/XVwmM/SGmP2qQsBp
 4aJYupEbERILN8JBTfBdnvJUIJMEc4XlAAzxC+HTu/uU1p0wn5UuLPUbNyhhnpxtM9sC
 PPaJ+U81+HTYa1RyklZQ5EnBiiZ+TbLFX4muBDB6LWL+bnH0P5Cc5k8BrKBzD7hS5QtC
 b6rfukPO9Jt/ix6KSRBODx8Fr4hzgbKEksq7C1aS+MpiQAAtPG+ucKOUrEkO4SGYyXiz
 Mmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=glF1/rVfsCqrnm2QIZUd5FUTcYcMxvbPO7G9VlD0g4o=;
 b=MFVIC0mCdYucjVUdv7RcVKWX1Qrmse6oX2y/CQBD0vGcFVv5jeFe42YPUHzv93bpF1
 qTtFpFxc4y0Hzi0420DPiTr/qtyoXvp0paBk1KkgDuEIZtIO5/uN2eX/lUaIpT+qnpM9
 5BjA10P4RYv5QkgE4pMiWgHPF3fFd5yaav4j17D3+quTqLbcXFP5h95znjKJ9Qoc+ldX
 0hcizqniwA65k6k4rxyFP1RHvMG89wAQKlGV8usK1WT67DZLCu3Cm+lb5PE1y4NxHhW0
 7MJT1UcF5EMe3p2TJEGu/ZsG5fUOnDwmErmpjR5aj2D+nAO2Sy+bhQ9x/iQZ2FF/8RkY
 ptIw==
X-Gm-Message-State: AGi0PubgLElPdiINv4AJShViQCG0Bh+r7OxN0NiYByTzbLjheYVEG0Xo
 0p0WRR57Q3QRdxAvsoM9uswKWNadamU=
X-Google-Smtp-Source: APiQypJnTzh3Rj9Tbc9V7SJA2WdEqENi7hFVY0Mw/3rDIyFcahVAgmxEafb6PRDsyIx8x0U6Fe5MpA==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr845431ljn.28.1586375537466;
 Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 34/36] dt-bindings: display: convert lgphilips,
 lb035q02 to DT Schema
Date: Wed,  8 Apr 2020 21:51:07 +0200
Message-Id: <20200408195109.32692-35-sam@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - drop use of spi-slave.yaml (Maxime)
  - added unevaluatedProperties (maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/lgphilips,lb035q02.txt      | 33 -----------
 .../display/panel/lgphilips,lb035q02.yaml     | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
deleted file mode 100644
index 1a1e653e5407..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-LG.Philips LB035Q02 Panel
-=========================
-
-Required properties:
-- compatible: "lgphilips,lb035q02"
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- label: a symbolic name for the panel
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: panel@0 {
-	compatible = "lgphilips,lb035q02";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-
-	enable-gpios = <&gpio7 7 0>;
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
new file mode 100644
index 000000000000..830e335ddb53
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgphilips,lb035q02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG.Philips LB035Q02 Panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lgphilips,lb035q02
+
+  label: true
+  enable-gpios: true
+  port: true
+
+required:
+  - compatible
+  - enable-gpios
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
+        panel: panel@0 {
+            compatible = "lgphilips,lb035q02";
+            reg = <0>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            label = "lcd";
+
+            enable-gpios = <&gpio7 7 0>;
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
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
