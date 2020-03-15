Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4F185D13
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582B76E160;
	Sun, 15 Mar 2020 13:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746686E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u12so15627738ljo.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YjUy1ADd38ONuUoZQBzdcbnlxdYpv/fTDjjTTwszQr4=;
 b=GylaU3jU+HIKMfeaQ7IeuU+xs4umCfPUVuYcOIxrPFuj/ZoaGAtx58hYWArlZA7EOT
 SDvJNDyUrfLHLajV+sz/k4RTvtE9kp3csCoYbzSLCzYW704ESkcsi0KgQ69hDoUImWgM
 EUQQEB7r/5UV1oB/iSWNd37KO5mhbW92PtfiGUheYmBP13oqryI8JOhLZP2Md3qod3+w
 4hjjEXWUNuLXk2Jd2ZXKxU/5Gu23PSR2QZGsLGI5zdZzVZ4G76ndGj3+FQTKRMys5+xF
 LFg3F+ll2IZuKvh9rSjSrmfbA4kV/gR+L9BD1nzZIWwouuK3+qP/SUD29B0gzINCHZBS
 sFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YjUy1ADd38ONuUoZQBzdcbnlxdYpv/fTDjjTTwszQr4=;
 b=nZAO6MzxV+8wdD1RpaGXCch69+LH3NHUYM1JisCaGvXJOuXMnBpQkJHkMPuCRL4Pyt
 GlBQex/SN3PQ5pqbVW/QGALW6iFE3rdK+Bxv5mYK234psf0VC+7RrVcYKp8nT2dRltDp
 ooA53QoJk2vf5SP08YHhtYdLNpsojLwYWq+3L/4035cNIi1ZjgFnhzDX/tA4A+1RJFmC
 16QbEDVQr895s7GWxogMotm8FLjtkUw5b1Z4ZMxr3+dqIibpiI0zU29eHxxPfIsg2dNV
 G46DS+yE25h+ikcIldYzl/QoF1Z4z0cm5pmDzgugKeLVtgIHTmoMth25Yp0W6Ms3uF08
 3R6Q==
X-Gm-Message-State: ANhLgQ38CndAdHOquBCZJ5Igih7iwiPKb4xt3SdsQpTu5xdp/+ZCVGeu
 OloZw9U25NQcc0FzYw0lTVnLJAclaKA=
X-Google-Smtp-Source: ADFU+vuBCcTjGBb970zhwI+lTBV4D9X+F5N29JU57gnyuBXoYAnBstRC+Mb4jD/+P4F27+Qag9SyXg==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr12506536lji.278.1584279922586; 
 Sun, 15 Mar 2020 06:45:22 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 26/36] dt-bindings: display: convert sony,
 acx565akm to DT Schema
Date: Sun, 15 Mar 2020 14:44:06 +0100
Message-Id: <20200315134416.16527-27-sam@ravnborg.org>
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
 .../bindings/display/panel/sony,acx565akm.txt | 30 -----------
 .../display/panel/sony,acx565akm.yaml         | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
deleted file mode 100644
index e12333280749..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Sony ACX565AKM SDI Panel
-========================
-
-Required properties:
-- compatible: "sony,acx565akm"
-
-Optional properties:
-- label: a symbolic name for the panel
-- reset-gpios: panel reset gpio
-
-Required nodes:
-- Video port for SDI input
-
-Example
--------
-
-acx565akm@2 {
-	compatible = "sony,acx565akm";
-	spi-max-frequency = <6000000>;
-	reg = <2>;
-
-	label = "lcd";
-	reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
-
-	port {
-		lcd_in: endpoint {
-			remote-endpoint = <&sdi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
new file mode 100644
index 000000000000..a0b1abb9f33d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx565akm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony ACX565AKM SDI Panel
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
+    const: sony,acx565akm
+
+  label: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        acx565akm@2 {
+            compatible = "sony,acx565akm";
+            spi-max-frequency = <6000000>;
+            reg = <2>;
+
+            label = "lcd";
+            reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
+
+            port {
+                lcd_in: endpoint {
+                    remote-endpoint = <&sdi_out>;
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
