Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1387185CCC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4F6E15D;
	Sun, 15 Mar 2020 13:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0036E156
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b13so11700854lfb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9SsIXb80tx1XgE4QnEZlqaCxjB5IA7rL4pD0MP0x+E=;
 b=fm/YHgYqGltGK7GE1wbGY7G8zo4Ns0vW+iU7MUUX5G2g9lBIU6erjBD9k0egBK3Qew
 fl4A1fRxvOeYzHUaevzlUjY/CHHDcfr23RYzMS8kqSNgVlzb42Nexg/R5i7SLTlPhG3i
 b6wpkipTvQupy3cSYX5bpwmfRkrOVjFQpz18z+kA/sKAj6xV2OFina1wqSALEPBHaP2Y
 CQY80hqeEHQYylOcffvPeyftA5GfosbNh1ZeSaaEdpGAQN0sZZix4uABB+p+YWR8Ev1T
 Z1VHRukdseG8fsVZbM0DRFvijkD7duIFuiCTwHM4xOP5Ec3dq/FF6MejPV9zTtjj+ZyU
 nPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C9SsIXb80tx1XgE4QnEZlqaCxjB5IA7rL4pD0MP0x+E=;
 b=o/JfWoUlSK3Yo0wk5l7jYLOzAOkqp0aUmr6xtK1j4DNZowPPCveItpsJoZKZgGL76Z
 rru32pvZ0TRg5zseoO2pqffo0rQSuMSbKBK3wPXi5EEiO8BjCh6XrmTTA/a+b4uv+egx
 y85qt3WiKBuUHG4ZQZHTeq0AUIIA7ovCsVdQjpmG7GbFgAvUnvakkdbYLl7VJOqVvJaq
 1QRdM7+m3lRE8pmzaZmUKtNygPL4p0eltmISdm91y+pjsMd2ZMqThSiJENK7XmCu7CzF
 D4BjDd4AZus06C2VsXkiQW2LfV0E33Oa0AJbbPxgixa9QhxEu9LNmWDK1ZcGdHu2y2WQ
 JDDA==
X-Gm-Message-State: ANhLgQ1Frz91pdMx6CrCoO+d2InLDsrRs0bM2MVkuOoEKiTVPgBomSpM
 M82ZlsSzY2b17vAifkq5bfuyBXz95TY=
X-Google-Smtp-Source: ADFU+vsmUIw0h+Jwxkxf146YRyd9fkTD5JMB5Hpegdo28MUyCENYV8foz/uamg8NsejFR3yfyJtcXg==
X-Received: by 2002:a19:ca46:: with SMTP id h6mr2077077lfj.108.1584279876898; 
 Sun, 15 Mar 2020 06:44:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 04/36] dt-bindings: display: convert arm,
 versatile-tft-panel to DT Schema
Date: Sun, 15 Mar 2020 14:43:44 +0100
Message-Id: <20200315134416.16527-5-sam@ravnborg.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
 .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 31 deletions(-)
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
index 000000000000..8ad7305887b4
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
+        panel: display@0 {
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
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
