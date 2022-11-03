Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AD617EFF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2910E5F6;
	Thu,  3 Nov 2022 14:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621BC10E5FD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 14:12:36 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z26so1729720pff.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEYILcAuMrXHcTcuxad4ZK3hey99OXzX9Gy2F42P7f0=;
 b=N+tZ6cST/N3j6qEf1RY537xNJohMCZaidTEv6VJr1MH6BSI14K3qDC8uVyjC4fc7rh
 SY0j9x7zysNJL1qEo7zRW6HSGpCY4Yp2TV1ERz8l8zHD9MOoqmiGnrdOWB9UVFVU1S/O
 Eik+cOdwCB5w+H+aX1uvSD1jxFnLYXNqNXNFrsLnPyKq4IEqPZvDnouK9zDuMxkU9IaV
 o2OT5MZGJNGZ7T9AcfeQ10aJWYR5edE0m7fCMZcch3myBWfqSNZqmBpiEUcI7IcfZW15
 jyDxqwgM9WKxExEg9f2JH4qOm7JgG99wGx542o1pTLKoP4aEJ6tCPGk+kxXkwe+e+bE1
 cH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEYILcAuMrXHcTcuxad4ZK3hey99OXzX9Gy2F42P7f0=;
 b=XWOVsWt/4R+qlPxoj49t5DU2qx0AdhbzuiXB9d1p0XdO2ktkbrGtY1IwyMdlnHuGrl
 cLrRXHbYT4E4M+CkDmC8K5NbbZR0hQ0giZrFo3F7JE6Zwl/KBjO8/p+7NONauBHOCkOH
 EtSNIZVM32pRmygG6BDGVqfWyHOpXm5VS71ef/MqfOwkkOLQBkf9Bu6h+s3rr+G6A9B6
 a2fnrfPXpfuFj17ae7yGe7+w4g9UGlnkm5byfe3zr0Gcq4x3qhBWMANWSE81OxnmLxsH
 9/JBZFLk823bW7b821LvIVWB/rGOXLys5w6A0XGlX7VzNLgWvGUAbEbcQ6EQg/Em2/PV
 hK1w==
X-Gm-Message-State: ACrzQf1PIFVkOuVi2PmVNoixmL+K53f1+MSBWRCZ7YZ7MYtr+EobIjgp
 vr2eztJ+jO+QHKRVJJuOxyp4UQ==
X-Google-Smtp-Source: AMsMyM5rg76U/d7JpQks1DnAyNvyFIP9PNgMwfovanjIVzTQ9uaN55uVmfgE4TbWH4noRIDq5WAJyw==
X-Received: by 2002:a63:84c6:0:b0:46f:f8b0:ba09 with SMTP id
 k189-20020a6384c6000000b0046ff8b0ba09mr10693315pgd.192.1667484755888; 
 Thu, 03 Nov 2022 07:12:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a809:3a79:b5a5:9718:3f91])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902934400b001780a528540sm725808plp.93.2022.11.03.07.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:12:35 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: display: Document Jadard JD9365DA-H3 DSI
 panel
Date: Thu,  3 Nov 2022 19:41:54 +0530
Message-Id: <20221103141155.1105961-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103141155.1105961-1-jagan@edgeble.ai>
References: <20221103141155.1105961-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
dot matrix LCD with 800RGBx1280 dots at maximum.

Document it.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v3:
- updated title
- collect Krzysztof r-b
- rebased on drm-misc-next
Changes for v2:
- none

 .../display/panel/jadard,jd9365da-h3.yaml     | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
new file mode 100644
index 000000000000..c06902e4fe70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Jadard JD9365DA-HE WXGA DSI panel
+
+maintainers:
+  - Jagan Teki <jagan@edgeble.ai>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - chongzhou,cz101b4001
+      - const: jadard,jd9365da-h3
+
+  reg: true
+
+  vdd-supply:
+    description: supply regulator for VDD, usually 3.3V
+
+  vccio-supply:
+    description: supply regulator for VCCIO, usually 1.8V
+
+  reset-gpios: true
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vccio-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
+            reg = <0>;
+            vdd-supply = <&lcd_3v3>;
+            vccio-supply = <&vcca_1v8>;
+            reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 20554fd74596..8cd909cd34e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6530,6 +6530,11 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
 F:	include/uapi/drm/i810_drm.h
 
+DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
+M:	Jagan Teki <jagan@edgeble.ai>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 S:	Supported
-- 
2.25.1

