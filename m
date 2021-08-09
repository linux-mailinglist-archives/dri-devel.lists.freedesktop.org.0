Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19153E3F40
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 07:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1384D89B9E;
	Mon,  9 Aug 2021 05:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55989B57
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 05:10:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c16so15104580plh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 22:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mzB5rukDdQ28T9D/iN7XrHADrrMb0C395X8edJsat90=;
 b=ZgtmhBdcYOqOj/+92KMz6b4Fh1E4950jVPK0MDSxi1k4f2PEqutWBMtIDVVaoxNffb
 avHFUoCKli6f7byYv6O+Hbk5aybJZiMmhdR8ebvgOR02Tw5zdhXs7DzjgFBjMO39VZxS
 FapPFbPHP23M7VEWjwjuYE4e+dy3X93e/7nD6cjTHqu2szyO5y+kwMaWYiu3D7Lp2nFL
 7o/0zF0y3zSQyQMLQ9/WH0BWJKhzWvRtocQ7+jC2W1UmaXZbk6EVHPhNGJgO0VuL3J+j
 rNonX1MV27XvoBSmTGnuCkOoxgLXCFqetllSQC2mInsd1oT0ZEkBhm7bkphnwvf3fIVA
 1QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mzB5rukDdQ28T9D/iN7XrHADrrMb0C395X8edJsat90=;
 b=Y9GSYPk9y0tV63q8WVPiSYHfhfTAXHsZG7LA7bKIl9L25JiJzAlbuZALb9CjvdwQ1K
 kURdHXzW5cEBKEALIHPV6/mfgcljdimCIsQRkPhxDf0nQ51sK6rkgLUXq3UMBQi6CbnB
 VX6iBj2O/bvuEAp+eZqCOlFqHa/6d65FAQLwzSucb1dKjWyZcGkkURdy17iEyLuqO7dX
 GnU00Gt5z9w414XkBoHZ4VReOseJ8eFy19CpY/OiBd4F/qG4DTQd5IQhk016mThe9lj8
 AaRgZG4EZDLskV/38eG52di/Jx3cjhGq5CuJjdii9gMc7v32FqUFyfmNkCro1/HV2kHP
 O4Lg==
X-Gm-Message-State: AOAM532CFiu0fZssIjf27bNw/Zct8yQC7xyAocbAUypev1IkBEdlfHqi
 u49XUTksSnFFmp/Ej7r521xDag==
X-Google-Smtp-Source: ABdhPJzwi+9ZQ7HmhjDWczc1PgAAzuaWyMlQKH609fsjupjHKCMGUf+/nbjA/6ocUHux/bOXk07C5Q==
X-Received: by 2002:a65:63d7:: with SMTP id n23mr291656pgv.46.1628485837946;
 Sun, 08 Aug 2021 22:10:37 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id e35sm20420219pjk.28.2021.08.08.22.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 22:10:37 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: Add Sony Tulip Truly NT35521
 panel support
Date: Mon,  9 Aug 2021 13:10:07 +0800
Message-Id: <20210809051008.6172-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809051008.6172-1-shawn.guo@linaro.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sony Tulip Truly NT35521 is a 5.24" 1280x720 DSI panel, which can
be found on Sony Xperia M4 Aqua phone.  The backlight is managed
through DSI link.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../panel/sony,tulip-truly-nt35521.yaml       | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
new file mode 100644
index 000000000000..967972939598
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,tulip-truly-nt35521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony Tulip Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description: |
+  The Sony Tulip Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel, which
+  can be found no Sony Xperia M4 phone.  The panel backlight is managed
+  through DSI link.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,tulip-truly-nt35521
+
+  reg: true
+
+  positive5-supply:
+    description: Positive 5V supply
+
+  negative5-supply:
+    description: Negative 5V supply
+
+  reset-gpios: true
+
+  enable-gpios: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - positive5-supply
+  - negative5-supply
+  - reset-gpios
+  - enable-gpios
+  - port
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
+            compatible = "sony,tulip-truly-nt35521";
+            reg = <0>;
+            positive5-supply = <&positive5_reg>;
+            negative5-supply = <&negative5_reg>;
+            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.17.1

