Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19D185D2D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697FA6E1F1;
	Sun, 15 Mar 2020 13:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94FF6E1ED
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:42 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j15so11740113lfk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0i0vgiKfLOmpvuqPVA7m37qiPqNJFhGX4H4IYa6i4ig=;
 b=lWl9RmPxxkjrxxWHn9utIetUaSmb9LWP3dVx4LimFMdzM1pk4BlRSvi1ySK/IEufn0
 sX03MMuFa9fOc7XV7XzjU44uaC2qHvytzCv/+Eec+pOEMjXwSldTW15Lw7xTl6U3EYvo
 iOlegHCxdN/qHX4wOAJj25qdQSlTLnUA3Kq0WFs9COZnKCyu6bCfQ3jZ2QjOFu59reGJ
 xm9slFbDqTG90364EIv3Blcrj1s71u4H0URzNu+uwzEBwp7oqm0ryY4zNqFXWsrZdHBA
 mQdfbgd/THjSCD/WHIE/PmPFPFgduBAcck5FZUsO5830N8egRmhNMnThEqK2WibiCBSf
 C8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0i0vgiKfLOmpvuqPVA7m37qiPqNJFhGX4H4IYa6i4ig=;
 b=R/uNEaGFz+j0k1I4BnujQqduRzS0+uJLkvuokBGvUZS/BwiEGhjiQvLU2FKkqdZMRq
 jhtCh/erGZ+Ke4GoE6gLmQca39eCp/Ha5CkZHIzoxFxgsRyterGsR1h1DpNkrR/ynNuc
 Z8m4WL5jf7H3g/R0A1hSTDildeAXRXSLeUM9cHY2TEcH2qAIicO93AOSK+l6xhJZdCdv
 EjUOtNbdli8DYXxHpn2QazeDSaYrKCPOK2uox2HO5ApXKXQlDm3nNqS891yOh1eK8vO7
 SfqvGIUqQ9RhpfOO/bGf8UcLbJPS2wFKRxb/IIfZMgc/BNwLBtms2BGU6JyKGuCLEPea
 cYSw==
X-Gm-Message-State: ANhLgQ2N/fMr8pM527ImUgYc3sonYHDksfb29tvxB+x0v8xaoc5HuiTF
 5KirsmOUu4qtTl70HSUo2Sl6lVV0S1E=
X-Google-Smtp-Source: ADFU+vus3KIMVrdLNQumK21IeQLFPAIhvE0B8wkk6LKoU2xSpSVPWgRyVc6zyWu+4lJgoeI03mbkew==
X-Received: by 2002:a19:80e:: with SMTP id 14mr13715743lfi.206.1584279940829; 
 Sun, 15 Mar 2020 06:45:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 35/36] dt-bindings: display: convert lgphilips,
 lb035q02 to DT Schema
Date: Sun, 15 Mar 2020 14:44:15 +0100
Message-Id: <20200315134416.16527-36-sam@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/lgphilips,lb035q02.txt      | 33 ------------
 .../display/panel/lgphilips,lb035q02.yaml     | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 33 deletions(-)
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
index 000000000000..09eba4090736
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgphilips,lb035q02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG.Philips LB035Q02 Panel
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: ../../spi/spi-slave.yaml#
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
