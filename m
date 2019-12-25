Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CED12A7C0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 12:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D8C89F99;
	Wed, 25 Dec 2019 11:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C134B89F99
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 11:56:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 203so16713054lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 03:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5mol6HJrMqqa1NJdam/PhpUhWyScfd+EBsQoCUp51Ik=;
 b=WTk1X7pxTyAFammbLNK7vRIMYYVvfw2Eotomu0eqpjnsMjM6g4FkkLRl4IxXW8ZpYR
 fK9mC6m6vj+Zg0SSU0vc10/4HHMzIRVynhqg5xy7lo2sTGztVriSHbEOSxi0BQZzZ9ui
 J1zC5SbiH2jVooIrPLRpLazyUpTeJ2zJho5KmqhuOc555fPlEz20jYN6a3fmNubU8dGT
 G4hN36M/p1pF+1ecdDwRrO9Mm4JSYSDs89wvm+i/+k66eV5uFvQBHp1GTyl1BxPIDFeB
 qV600Xn8gcOKap9ze+D82ZENpg25e0KHWQ09Ma6HSLmfJEBtZ3Vj1/GDpmfcD+VqP8KH
 JKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5mol6HJrMqqa1NJdam/PhpUhWyScfd+EBsQoCUp51Ik=;
 b=f0agyHQf/mir67mYeSVdLT6v89A1s6WD+F9Z1BuOH/2XGBg96mIobOXITaDc+0Kifp
 eC7fniGyz2B7oHM8CPARC691OdJJUVwiMvnAMj3Q+r0nD3V2QZtT32IbdwtOTo7ZvydU
 jEGvhwYVV0HogXuvM+v1RsZr2/bspShkQ3vNHjQBYRq+k7dW87eveGUcfDNO6TAiXzvs
 JAD/z1z0MexGFHMHltqHYf4qnUXGqjQAMTKmy5f6yS2yy0KVlN1SCrZ8IeAuhNfRhJ0X
 8aaZZvJUqOvswEy0xRA1yGCbJG45533EFw0bwrecShZguHrALFW6fEPgkyR8WKVGx+QB
 Shyw==
X-Gm-Message-State: APjAAAXLZqx8JvHy9YC7owHtL99/npkyh1rcxvCavxZKeL49exsfcpKz
 e9bNT8Wfg+gLD4nTcox2yFFap8bhscU=
X-Google-Smtp-Source: APXvYqxsFWA2taLpUG5L1Aq/k8Pfzo9J+USCKy6bqVt61nncQ1kFP0NTXJYLubmK+nxbJwNTqEfwCQ==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr22945983lfg.47.1577274976625; 
 Wed, 25 Dec 2019 03:56:16 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
 by smtp.gmail.com with ESMTPSA id o19sm13544465lji.54.2019.12.25.03.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Dec 2019 03:56:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm/panel: Add DT bindings for Novatek NT35510-based
 panels
Date: Wed, 25 Dec 2019 12:56:09 +0100
Message-Id: <20191225115610.14518-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds device tree bindings for the Novatek NT35510-based
family of panels. Since several such panels are in existence
we define bindings common for all, and define the compatible
string for one certain panel (Hydis HVA40WV1).

As other panels are discovered and investigated, we can add
more compatibles to the binding.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../display/panel/novatek-nt35510.yaml        | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
new file mode 100644
index 000000000000..a4a6b5adf15b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek-nt35510.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35510-based display panels
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: hydis,hva40wv1
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35510 panel driver. The compatible
+      string determines how the NT35510 panel driver shall be configured
+      to work with the indicated panel.
+  reg: true
+  reset-gpios: true
+  vdd-supply:
+     description: regulator that supplies the vdd voltage
+  vddi-supply:
+     description: regulator that supplies the vddi voltage
+  backlight: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi@a0351000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel {
+            compatible = "hydis,hva40wv1";
+            reg = <0>;
+            vdd-supply = <&ab8500_ldo_aux4_reg>;
+            vddi-supply = <&ab8500_ldo_aux6_reg>;
+            reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+            backlight = <&gpio_bl>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
