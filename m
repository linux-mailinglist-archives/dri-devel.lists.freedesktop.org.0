Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFB6B4029
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B854110E1F1;
	Fri, 10 Mar 2023 13:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076BA10E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 13:21:55 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id i5so5528375pla.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678454514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OfHCteNV7q+dsb4Bbdwo2yP63fJ16IUesnNAhcskNRU=;
 b=KzoY5clJwBNute/PoW2MQ6oouocVxaydnQP7158oMa776/X3aRPhiTNkSB8lMxnzj4
 DtVmyK9GibAPj9fImIEinHv4LbGohSYZgkq/WnghAlkhZfpMv/Vv/1bVQStzwiKFNgIC
 MdkJyaT8KcQ8P1UtvNaXwxulnHN5afDecv3Zi0r7xFYlVfI/Eo9sRGlTWSK7x9zGOXuy
 SCT7TwjU+oXvUjPwytDrRJjvB5rRsmiOQAZirKb6jAEHhwEYuXQditq6LB2emrxMw/D3
 S1dkW1nt2jUC4+/Lc1/1qT4NCdnZ1fmO3nYQaWF6/4dlN3xYneRBZG+y6ixARyyMEVim
 a2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678454514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfHCteNV7q+dsb4Bbdwo2yP63fJ16IUesnNAhcskNRU=;
 b=cCKMZ3x4lfsrwVf5dqKSgSS+vyZqq5MK7KE1tHXCI1OEvxO8lhpIO++U6Re/njhJqu
 91FznHEPsXDX6lXVybm/5P0Y1k85vd1GoUQD8LRLPAxpYQvPXALg/bO0zLwzWGHMDc7w
 UtGcnBlMonm5kMx7N5MOo4pQRDmpdaWSE/3XG33KNXBMUIV33sYMhaIam1/1ylWtqYNv
 BtKtqb6fVd9Eo5dY/PpDiuL/Nt0IkmRP1FYpgemoj8lEOSEUMTCs2EojGP5E+DwVduiv
 bZcGPMUzdRRxmgajz7hWJdCvtPPVMdwjrntDmmm4f9AmM5mSf7XDgQVNxwyRNqvIcFBj
 DyCA==
X-Gm-Message-State: AO0yUKUfbWOyzlkPqZ2DZIac5pGDi00AJ07pqEZbfhiYhh5OqUvzzajW
 1jMQFry2oqBTQyqgcR3z2H0=
X-Google-Smtp-Source: AK7set98iPwBwFkq5myreeZkbP0DGiyTHoZ2q34nC3mEd9GMRiAi+I6LYrXirgJ0+rMnqa8ClZTqWg==
X-Received: by 2002:a17:902:c40d:b0:19e:6760:3a5d with SMTP id
 k13-20020a170902c40d00b0019e67603a5dmr30054230plk.18.1678454514624; 
 Fri, 10 Mar 2023 05:21:54 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 e6-20020a170902b78600b0019a95baaaa6sm1421711pls.222.2023.03.10.05.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 05:21:54 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Date: Fri, 10 Mar 2023 21:21:43 +0800
Message-Id: <20230310132144.2241-1-lujianhua000@gmail.com>
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

