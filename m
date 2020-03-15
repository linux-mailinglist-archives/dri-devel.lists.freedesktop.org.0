Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F4185CDD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61426E179;
	Sun, 15 Mar 2020 13:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B96E177
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:45 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o10so15591966ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pgEXQsDcjOHsYIv9nRQRc/r4cOy9yFXdgKqPV0CnCk8=;
 b=oHWDnNCQT47agrp2O3QeiJSxC/Xin3q9XIDhN9NkD5V0vzdx5EhSYeLMHHZWqK1znH
 vR2G2kdbnxstwPI79gskId/5hTb0WpW817qpWYTsk3vd6OUdPM+NF3es9i1UdRNgHgnS
 vMzfav/4a35ffNF0z1780uLQY/dXPnDk+8gujM+3oP9pEJStYJCWH7vhJg+smmFYSnnZ
 mq5HWaLWPh9+f/kwQlz5CkYDaD0sEoRHskgWut9RABQMXaJkQR4B+DFZFahiOZaN7Hos
 /SWx6qJGiaNHwgHGp+IjwxUeAawKwEpCJN3p97fdMShWx8oWTos+enqtq0hvPMuZ4Rqx
 gs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pgEXQsDcjOHsYIv9nRQRc/r4cOy9yFXdgKqPV0CnCk8=;
 b=Mer+Hyly+AlSimhN3HlA9xa/2juU9Xc325o6tacFRC0H7M8oeDwwTPUx8KZ1F3i1mF
 2ZLtAvIZyx5dCOpFFCPoww9po1Q+ba8l7Y7kTMk6l9VeY8K0Zzgw5mCFXVPzaA7bH+Zl
 v2U8pbH6BuAwpErMCeYFEaBGXZfCSErfvay114oMQEEC9o2om4XjpUng49TXqm22rnDu
 a4S7Jgig46ztqp+5wongN+GfMMxd9DTUHcAnKRPS2Tbwhn8Ib26/iRxT5XQBOdQge5vJ
 9pi0sVXr7B8EWBX5QdN2uuF92EdFNFaGZr+KFP8JQIgRD4PvQlLxc7/vCp3KI89y6CFN
 PF1g==
X-Gm-Message-State: ANhLgQ0TNqToj7OjhBIzd3miUlD6WJbIaktpKP2VL29gH+x8UiArsLio
 jOMDS3GS3vJB/yyubMlEqDC6Xq4xLis=
X-Google-Smtp-Source: ADFU+vuCyi5ubtfFG28TZfhRyYRqzodmur8BQI0nkoClJCFFJcM5vZi+/T5l7TzlRyRKvba6IPp8uQ==
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr1256904ljh.18.1584279883480; 
 Sun, 15 Mar 2020 06:44:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:43 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 07/36] dt-bindings: display: convert ilitek,
 ili9881c to DT Schema
Date: Sun, 15 Mar 2020 14:43:47 +0100
Message-Id: <20200315134416.16527-8-sam@ravnborg.org>
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
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/ilitek,ili9881c.txt         | 20 --------
 .../display/panel/ilitek,ili9881c.yaml        | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml

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
