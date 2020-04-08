Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51C1A29E8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11F96EAE5;
	Wed,  8 Apr 2020 19:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037B6EAE0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:09 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q22so5253533ljg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+CVMxbsPicV/fwxP5mLwljkIZSzu8S5meR2w3434dc=;
 b=VUScjKUJ3sRl7kSkeR5/ppr6loUiu+5tonJIGWpPCL4kNi8kR5Zoy7JiymR25oaCA/
 nJeOn2hvFFWA5WOSMJetivEqX3v71zZx5Wa4qNi5J6Nfa7K9G5+bmsca3b6CihJf5r3F
 xqPPR8zpcvzEpN/5XcELi5QROI+ps1g8VjaC9azMRmwvCGwDMtEfJ4V/Bcvoz9gJizkU
 z1hqxliuOC+Xwyh3gqKIuPZqbJ3Dwtxe9iQB4aR1kQoaWbgmrmmlHY4Qli+xK1QA8hmH
 oEENC4oeIjQGIvp2YXQj2dyqFyjlLssBYmkXrE4aclCdclO5ZEQS3JIt8L81dehUocjK
 1BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+CVMxbsPicV/fwxP5mLwljkIZSzu8S5meR2w3434dc=;
 b=qK5Wq0wLBrJDbHi8O9cbACp7is4oSSyg8kt067f5yM5o0kXedvTS0SSHHtjHP1WyMZ
 GaTgVbDXVyEnSrdfrCQmijfPy7Z1ZgN0RSIYmrHDicxA3hyVuRwsWMxmmGqQL0crO8zX
 j4mfEBwAr5W2r0Kev019V+5k7tBBUDx0VPnxbdh75rkH+9TA7LJTerQQMXRBEWpeqNSU
 UQ7GTg8O6vQF8NNW2ASHWX6XwNz+EHF3Ro5WGFUNQS4A3eJl0dYcD492sTUw5h4mGGz1
 q/n0PqnL1kYIJzelke6po6rD0wNOSJ+j6yzFWFQpKlAiNxVjRmKRbMEmvbRmCvGtW9e3
 Zr7w==
X-Gm-Message-State: AGi0PuaOUlzoaH6RRg0k9BtNuwk8gGNM/T3TdtGdMjN80y+jaQqtkJet
 HSlme2YQvqkZUsYlKLpU/89B9SSI2DI=
X-Google-Smtp-Source: APiQypIal03E0aeSlBE0puxuSkmOeXenB82LUpmrGBHh3y9Jup2eKAtFoxcs2ML/dx2TxC9LBhctiw==
X-Received: by 2002:a2e:804a:: with SMTP id p10mr6314584ljg.289.1586375527126; 
 Wed, 08 Apr 2020 12:52:07 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:06 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to DT
 Schema
Date: Wed,  8 Apr 2020 21:50:57 +0200
Message-Id: <20200408195109.32692-25-sam@ravnborg.org>
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - dropped use of spi-slave.yaml (Maxime)
  - added unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Marek Belisko <marek@goldelico.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
 .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
 .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
 3 files changed, 65 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
new file mode 100644
index 000000000000..4aa605613445
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toppoly TD Panels
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Marek Belisko <marek@goldelico.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # Toppoly TD028TTEC1 Panel
+      - tpo,td028ttec1
+        # Toppoly TD043MTEA1 Panel
+      - tpo,td043mtea1
+
+  reg: true
+  label: true
+  reset-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
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
+            compatible = "tpo,td043mtea1";
+            reg = <0>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            label = "lcd";
+
+            reset-gpios = <&gpio7 7 0>;
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
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
deleted file mode 100644
index 898e06ecf4ef..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Toppoly TD028TTEC1 Panel
-========================
-
-Required properties:
-- compatible: "tpo,td028ttec1"
-
-Optional properties:
-- label: a symbolic name for the panel
-- backlight: phandle of the backlight device
-
-Required nodes:
-- Video port for DPI input
-
-Example
--------
-
-lcd-panel: td028ttec1@0 {
-	compatible = "tpo,td028ttec1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-	backlight = <&backlight>;
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
deleted file mode 100644
index ec6d62975162..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-TPO TD043MTEA1 Panel
-====================
-
-Required properties:
-- compatible: "tpo,td043mtea1"
-- reset-gpios: panel reset gpio
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
-	compatible = "tpo,td043mtea1";
-	reg = <0>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	label = "lcd";
-
-	reset-gpios = <&gpio7 7 0>;
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
