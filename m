Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1569CA87
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB410E06D;
	Mon, 20 Feb 2023 12:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B910E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 12:13:07 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id q11so1465784plx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vxAFz2rVLxj2kv0iP8aQ04yRu+OY9bVx6kbZibMveqI=;
 b=UZBGmoL/hq/IHXODoVnESRITuITuEb3YU7ByNcwDfgcWNHM4CtHLDo6qx/rDuX8tPV
 FZfIQS5vNFojlVjKFQ9aes2UlgnNkoTHu5qLm6jxujlaTsrX4UGRsltriHTg7sTP7uSQ
 64dvYgfbU/8c3yml6lVGzvtPQD27jqV4DSgSxS3Q7aTKt2NhAaXFhmB6e0dXZmDnMlXb
 oDzN1O0BQSFjrOZ+8rYOu/oXCRWuZhn70/Q6HNx+CV3TgiXoSeJKbO9t/tjQWNXgjMO7
 mhzfQcfDgvwz9lfPG3H2CkInD5/t+JgyZtC5HVyizN8IJDqkWJtLH7rmU+W1Jg9CH8Gh
 vmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vxAFz2rVLxj2kv0iP8aQ04yRu+OY9bVx6kbZibMveqI=;
 b=Ri/R0fOLA5UjZvUdg6sFYpGJMVQd/+ky0U8bp44hHxnC2ihfb0pDfl/5/SzrSH1rVD
 MisJ3uYotPJS8MBKeYlTXZv+PSJZ+43J41ph9Ikz0IfJNU0vn2uOOlOdxP4X0iuk18ob
 kV8K/ylPgSDGfI/Gfz1zILX3qmzJUsyhZVQ4CC7+xk0TgfPMlY2JDwiw3r4WmCOyT2gi
 fXpGBnZlHntVAnq2iMhcjRNNpVDAQLspdGr4Fml6meG09kRhZO0nTaTWbmhUDMhMjLNL
 9M7scQ5WM12gNz3RSibFzmVXcTu5xgJE7rnVz5hnYO2nU374sGYsf+rtPjpJLN5S6GwT
 fC0w==
X-Gm-Message-State: AO0yUKUgVHfQpZA2vp6eUtbZ3/VQ65oM7t5SoTizjhTu7B2bab3vVeDi
 xOfh87s8qcRZ87/5+xAFDsGaNuVfOh04AFg2
X-Google-Smtp-Source: AK7set8JlZ9xeDW8rXHdBvDt22y0ZTlD8dNdfbAv9PKB6i/MR6N9zGfnENMmtZ343qaZOWXOirUeQw==
X-Received: by 2002:a17:90a:1da:b0:233:fa78:7c9e with SMTP id
 26-20020a17090a01da00b00233fa787c9emr2790288pjd.12.1676895186906; 
 Mon, 20 Feb 2023 04:13:06 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a498e00b00233790759cesm207799pjh.47.2023.02.20.04.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 04:13:06 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Date: Mon, 20 Feb 2023 20:12:57 +0800
Message-Id: <20230220121258.10727-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek NT36523 is a display driver IC used to drive DSI panels.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  - Drop unnecessary description
  - dsi0 -> dsi
  - Correct indentation

 .../display/panel/novatek,nt36523.yaml        | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
new file mode 100644
index 000000000000..544c3c6e568b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36523.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36523 based DSI display Panels
+
+maintainers:
+  - Jianhua Lu <lujianhua000@gmail.com>
+
+description: |
+  The Novatek NT36523 is a generic DSI Panel IC used to drive dsi
+  panels. Support video mode panels from China Star Optoelectronics
+  Technology (CSOT) and BOE Technology.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - xiaomi,elish-boe-nt36523
+          - xiaomi,elish-csot-nt36523
+      - const: novatek,nt36523
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  vddpos-supply:
+    description: positive boost supply regulator
+
+  vddneg-supply:
+    description: negative boost supply regulator
+
+  reg: true
+  ports: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - ports
+
+unevaluatedProperties: false
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
+            compatible = "xiaomi,elish-csot-nt36523", "novatek,nt36523";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vddpos-supply = <&lcd_vddpos_5p5>;
+            vddneg-supply = <&lcd_vddneg_5p5>;
+
+            backlight = <&backlight>;
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1{
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.39.2

