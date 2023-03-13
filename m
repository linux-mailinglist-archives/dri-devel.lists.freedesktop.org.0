Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C96B73AA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 11:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC410E4B2;
	Mon, 13 Mar 2023 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74210E4B2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 10:19:17 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id ix20so5853262plb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678702756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NgZncveY2O/txV/R7OP3ZoBdtRLxTenrDfGCPy6Jz1s=;
 b=av8QqSRHixcRjhUE79qpQGAhBtayUig4shkCBjrBNatklj1vswZy4RYKRj3HnJHWi/
 7oN276bUX5jLU+DHgCWSXpfH8l9ZSm+MfLsY4RmnsQgbUXAP8z57YdIKZbYBV5MKqB6E
 4I1T15vnrtfK5uZMfwRM3w9ZAMgd48TJeMMLAOu7s4GtlOlvGrkWdHGXcMI5l1jiP5SH
 sdSUpzWqOA1daG45IuqksT8q5kLfMcNS2oZ2u8qa8hFPm6ycrs2zoXPW4utjNA6xKpJV
 ZtnTrXS70BvGPv3YS7/cfAhTGbqt7HrTXYDAc1YJZ9j3KqYmgYsgpnDZ2gvbvT5bwGKh
 hM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678702756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NgZncveY2O/txV/R7OP3ZoBdtRLxTenrDfGCPy6Jz1s=;
 b=o7UsyJRgxe74hNCI/ObXRshZw+YGz6szUlCjJ4QOM7qAZ4FI97bkkNYqdi1iizBKAS
 VULWBevdaFnMWBe1LtMTqHUbBmGO1UmtRpnBHy/AWcs4/BNnP70MH+sh2pyArp/1x6Op
 9EBoGG/uk7Hgt3Stq0iOOx9BOGqhaq5GuBrJNZbdkp3ljJs4+FxPK6W05XdUByhdvNYR
 QpPCYG5XqrXNfYe89vDwiXuBgS4K9WGXcoPpuc+YC7jxVgVTr/01mJoz6Sswif41an2K
 QFyc0ZfhhzyFGvCjrMxks6fqLyWJMIA8wsNMW6mB72K2ZbkCKKve9DHldAGFJN/VreUb
 Ez6g==
X-Gm-Message-State: AO0yUKVMqaXs3gx7ABdhiXOOgYUKSdHAastBynvxwUyNGKfTfz+sXyns
 Z76uDli3XtfXRtBhu3xFUGA=
X-Google-Smtp-Source: AK7set+afB5U1j55sApwQnuVUKDwLFCeDjQ8c0UTiwdl5hDF5V5WHR9uiWmGdtLkeySb+DZVcWdr5w==
X-Received: by 2002:a17:902:e550:b0:1a0:42c0:b2a5 with SMTP id
 n16-20020a170902e55000b001a042c0b2a5mr4499185plf.24.1678702756602; 
 Mon, 13 Mar 2023 03:19:16 -0700 (PDT)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902ee4d00b0019a7c890c5asm1270652plo.263.2023.03.13.03.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 03:19:16 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Date: Mon, 13 Mar 2023 18:18:57 +0800
Message-Id: <20230313101858.14611-1-lujianhua000@gmail.com>
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
No changes in v6

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

