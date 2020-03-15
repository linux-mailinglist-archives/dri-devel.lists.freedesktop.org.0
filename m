Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97D185CE3
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C545C6E18F;
	Sun, 15 Mar 2020 13:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740B6E181
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w4so890156lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85+JPdL0riE6y9vKE6MRhU8yOWIkV4ii4OdHXgpGAjY=;
 b=iQA17Ulo+My4nZO1xTunXJ/1o8QZU5pyq+Jatgtep5c1GDb/OVWO9pxqOeCI6+kQFM
 8qNt9KvDpO0B1n/luViP2nBRN/mjstvu1YU+nol/eCvDjlxh1RruBN0fEBHFJRBMIHUx
 w8/mS0Qq2f6nrNBc2QLfkxFBWhewJyyg9h5jC9qoQp5jz+P7fwdarLVEEDvTtXsZpm45
 SRuZaVWvVSQ6w3jtViQsNbmwUivJjPamVPlpVGcxLubwNe2+5mmJ26kG1uEiIEHpKfVf
 p5rr3p1Zz3AlIrRLjfKR8aC5DaCqu5kR2uMWF51QbTyfuIIAtAMXhGOqvGLQTLJM1GEe
 CNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=85+JPdL0riE6y9vKE6MRhU8yOWIkV4ii4OdHXgpGAjY=;
 b=GCTxgeZdeALrnAZhXHb1i6W26yUp5pF1ppFo9gc2HK+sGULOxjktObUWZyMrwCE+YA
 0NJKLvArhuVULwZ3WpRuXWuiT+ta4n28WSDO/oDEI+5jALqxaKDJ2RcwMvjACkxlsnvU
 j0zbYMxQfG6KC1u9l4ksFhcYrU9UlnWuutaJ6IPh9KHMa7tSWyAoLEj+5cOvp1gduYoh
 HqFRl3EScqWWW301ubyvSiPCRlLsN06bz0/aD2cDj4zbxvznphlU4Iza6ZtnjLXXGyIV
 xjffzok99JaFXCpIJUYzRapWdfCcg5GFQ6wv8L6lESisdXdsOUiP4SjT87yE87q3bnGR
 Yezg==
X-Gm-Message-State: ANhLgQ1bw4G6bwU4cWYY+F0H8i+rRNMlR6S+fQYfwbfOZk31o2CLHXB6
 hotThdruSVbJMifr60XR42CdzHkcvNg=
X-Google-Smtp-Source: ADFU+vsxRHkh8Taf7X9qBubBFsYa1RVHoV8i/HWKAno4brv64JuVSrPLYD3RFxAPK17fcRd3Yw9fmA==
X-Received: by 2002:a2e:b602:: with SMTP id r2mr14217474ljn.45.1584279891718; 
 Sun, 15 Mar 2020 06:44:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 11/36] dt-bindings: display: convert innolux,
 p120zdg-bf1 to DT Schema
Date: Sun, 15 Mar 2020 14:43:51 +0100
Message-Id: <20200315134416.16527-12-sam@ravnborg.org>
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
Cc: Sandeep Panda <spanda@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
 .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
deleted file mode 100644
index 513f03466aba..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "innolux,p120zdg-bf1"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- no-hpd: If HPD isn't hooked up; add this property.
-
-Example:
-	panel_edp: panel-edp {
-		compatible = "innolux,p120zdg-bf1";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
-		power-supply = <&pm8916_l2>;
-		backlight = <&backlight>;
-		no-hpd;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
new file mode 100644
index 000000000000..42f97b7b86b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p120zdg-bf1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+  - Douglas Anderson <dianders@chromium.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p120zdg-bf1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  no-hpd: true
+
+required:
+  - compatible
+  - power-supply
+        
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel_edp: panel-edp {
+        compatible = "innolux,p120zdg-bf1";
+        enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
+        power-supply = <&pm8916_l2>;
+        backlight = <&backlight>;
+        no-hpd;
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
