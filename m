Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22F6AFDF2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 05:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBE810E0ED;
	Wed,  8 Mar 2023 04:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206A210E0ED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 04:37:16 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s17so8945518pgv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 20:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678250235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gnMf/i3TlL6S5YVPOH4S4B14wxLlA4nM+QSKzTGWPAc=;
 b=ayqm8K+BoGBFmvsnebMCxbZl+hPHhT7YsAFaFMUX4RPDqP/K0LQvXyY0VuowAEqPXC
 07acv1biOJZvz+C/fH6lj7zZRHU2lUtsErNhedvjP8Jp3sDkus64lJMiuDFePunMiLOw
 TKLRZ99q8Kd96VZ23rYCCkfsRu8uCQwtIThVpruAuBHjmsMw3wmRzsia/TCuvqmh2jrw
 4jFp1VcY+ufsRitT1pe5RlY9guhfzot3UqsUveATl+h70aIjEgxWw448OF8ZV6Iirurx
 556kKakv50u5CVrjZrpTAfQpZp3evooyhMDnzYq5hqpfcO2qJUhDZIuGhAP/BiQ8uA4+
 45EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678250235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gnMf/i3TlL6S5YVPOH4S4B14wxLlA4nM+QSKzTGWPAc=;
 b=U4wHRliCFgXLZhMzTvsM8DdJrCAMwYEciUy1AHjPu9w1jS4PgE+GHTEv9KjW+U067Z
 QEmoIuA1iQ382hWNgjwPGIlwoCsJuM7p8W5u7+rjWu/PpIGknPW34sngTNRFlyP+CqLv
 kUz5DPYpEqqkVhEfjjwKr74mC1FHl8TVePgflguJ9G3+XE8fQcVHOu7tdkR1uYUzMlf+
 LUNwNjoaSryoK1rgSTODwWDuVZXJzYbtGR4UIIlNnBQDcFaIt6atDDfDQoWExk6wEtZM
 GOxSUdohohiGHU2MAMwMY6/Zq4ZlGFF3TcZu60iT8pn7eQpE/Uh/4tc+BRXuF+gja/7P
 ZTqQ==
X-Gm-Message-State: AO0yUKUL3GKSoDhV26tWeTaV89Ki54GYofCDJgibfnQzyr7szZxJWJOo
 9XflLMq7yfODUa6PrLjW7zw=
X-Google-Smtp-Source: AK7set8Lyowx9lwv0uq5oer8od4eZgTfTRFSr3qVMtH2tfCe4aLbTMeclyt/nSKkGIe+J/sn+d+Lsw==
X-Received: by 2002:aa7:9434:0:b0:5aa:9ef7:4f7f with SMTP id
 y20-20020aa79434000000b005aa9ef74f7fmr14256423pfo.9.1678250235690; 
 Tue, 07 Mar 2023 20:37:15 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 j14-20020a62e90e000000b005a8de0f4c76sm8909257pfh.17.2023.03.07.20.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 20:37:15 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Date: Wed,  8 Mar 2023 12:37:05 +0800
Message-Id: <20230308043706.16318-1-lujianhua000@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Novatek NT36523 is a display driver IC used to drive DSI panels.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
  - pick up Krzysztof's R-b

Changes in v2:
  - Drop unnecessary description
  - dsi0 -> dsi
  - Correct indentation

 .../display/panel/novatek,nt36523.yaml        | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
new file mode 100644
index 000000000000..0039561ef04c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -0,0 +1,85 @@
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
+  reg: true
+  ports: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
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
+
+            vddio-supply = <&vreg_l14a_1p88>;
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
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

