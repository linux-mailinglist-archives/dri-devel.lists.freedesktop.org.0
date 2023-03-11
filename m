Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A56B5BBE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B3310E0B7;
	Sat, 11 Mar 2023 12:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A533510E0B7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:32:44 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id i10so8283284plr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678537964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zeBGEGBy3GzypDRtMJAMW7+H/dC0tKTZg1B8rKisPPg=;
 b=ozYBtX+oLCLwTDq0vgGPi/UV5U3VCNOx0hgd8raVBdxqET0UET+vr6lFr+Sj5DulQv
 yy6p1/GTWJD+/1j5mD9CPQHQs0dTjysHRI5EGelYq+hUSr39ExzUZ2iBdtdCjvPqGGM/
 I0lB7mJzQCzIVpGLR6jbcxIAxpDavqedDI3ITFMQQXstOo/1fmcCQVwxTUPidbkTyyBw
 i2RTCskqTCZO6LccgnhQ66HUzUgKyxZUbuBBUo5hsPEMAwSfxvlHsp3g6KtkCKfYUQc8
 mom00/wjigb4i1JOD0fo3Y1j1TUZ8W+wtnvnmXXAimdhsINpzeeHPndz7Jed8pAu+163
 PdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678537964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeBGEGBy3GzypDRtMJAMW7+H/dC0tKTZg1B8rKisPPg=;
 b=mCiwiCtT1htgtlnzwXuzffsstc7vOLBlgidINTOue4CTU/NoA4nKmVkiRIIstMejd1
 Sk9qOnzakTlUq/UGNwW1PFH3jCwk4ewh9K6A1K0c+WjeVC5/6okJVhtACEJ4UwYWfBCG
 lC0dippdqm7BmZpn9AsEFbFhBMj0kORtdZ3djrwj6beWUmp9gsu/J9fe0OQClE6f4seC
 JIcme8ex6aNitqshbchG4918xCfN2+bWYENul8ZSGIRDXc5y2B39ksrU3MSH4t19Sogb
 uCJXZ0mRH7zUvWF5wHGJcDwPDITM824Y3tt8i7Dobu54sNlzmyRfV5L+/rA1r20d5J7u
 yAiw==
X-Gm-Message-State: AO0yUKWarvN6DGEACxR2LbjpgOcYg6WfX8kP3DgVgmCgN1ukhXWO6Yf1
 MTTLlbt+FSyb4gHjJ0k74xU=
X-Google-Smtp-Source: AK7set9M6K7Ck2qJ+kyt/yPQ4Vwm1QYaDduE/QAC7LceldmLdWyR9N7INxoglPg3eg/bykJOjTe6Pw==
X-Received: by 2002:a05:6a20:440c:b0:ce:5c14:2838 with SMTP id
 ce12-20020a056a20440c00b000ce5c142838mr39315872pzb.54.1678537964189; 
 Sat, 11 Mar 2023 04:32:44 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 g4-20020a62e304000000b005a8173829d5sm1406754pfh.66.2023.03.11.04.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 04:32:43 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Date: Sat, 11 Mar 2023 20:32:30 +0800
Message-Id: <20230311123231.20771-1-lujianhua000@gmail.com>
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
No changes in v5

No changes in v4

Changes in v3:
  - pick up Krzysztof's R-b
  - remove vddpos and vddneg supply

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

