Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3E3715711
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061610E368;
	Tue, 30 May 2023 07:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D310E357
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso3976679f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432300; x=1688024300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILwpKSS26s6qYwQiA3AWhdCLAbEChopbtACgZFh2DVA=;
 b=FPO26JeUMctWCe0KGGcKVKj+KIao1BZ/67tYsHHpowHi9fv+F4pUBWamQGILHF+nd7
 m1YxLwzfR1E/efXHlnMvBhisfEgTjiAblOiWVgVDedzrL2ryifpZxZw8+qplOUocrJMJ
 aypdeUkUgEhBFe6SJ8ctGnt1l7cu1L7WlHX2QqvVq7+72CrLtFJ+0B/sHwJiwJTC3fbr
 sja6/t2+UHk+Jc/wLgezVoYGAhvpAflqCnXyWI09LjsZ+mhmI51maWlAetEtzJxJpRwH
 7boHftn7ty0ZHShlsw/51eKbEVHh2rbpc/WGz126huaAOQyTX3lui+U/c9xcSkbvKtwX
 NWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432300; x=1688024300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILwpKSS26s6qYwQiA3AWhdCLAbEChopbtACgZFh2DVA=;
 b=gUtHdrJXpSjTGRQ5ite63KECHrmYGg8Gjw4qFNTXeE8rdyKc9BzJqZtBP1OO0vv0D7
 OP9hCxP41u1jm4qma2tskc3xlaTKxpb8M04wM3TNQHqdmUEH3SpWqIqmaKlOxGidOYB6
 R7ypyEMfpI27PljOCrAFLJKZItUIVHZBlWtS+BuJ+EF7XJuCO1Aussin5azcnY/rscTI
 scaUfG34Y/0I/8qhFHo3mlhd2Ti/S0c9fMJoMyhvpfCQyYJXYhQU6Bcqomf8y+6MBB8S
 b1pVxyL5RMCWWkjOlVXxlL3vWw+XHScKJz0yuooW95sXe2t778NUBMpin5GzZolrtoUQ
 DAug==
X-Gm-Message-State: AC+VfDwJbl4Lv2ltEARN0irq6PrTYdbU0rAP/C/MIPZ6pa29XLKD+O3Z
 +/bMQA4s0lsJG5g1FOEinBVOYg==
X-Google-Smtp-Source: ACHHUZ7oADz4DYgBBnbiJph7j9eViF2f4A9LlBRMt5hlgYXGjtHYYwBmrS6WhVWBm9Uj/beTsRQRHA==
X-Received: by 2002:a05:6000:1003:b0:2fb:1d3a:93ff with SMTP id
 a3-20020a056000100300b002fb1d3a93ffmr736528wrx.61.1685432300469; 
 Tue, 30 May 2023 00:38:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:07 +0200
Subject: [PATCH v5 06/17] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DcR1nE4ZMJpkpX2oEe3RQlDvB5okZPNaS9Js/yOJnic=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdaffq+G+cxVoOQbtSrl/SEHGE6MG1300kjLhFz94
 et6gskiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3wAKCRB33NvayMhJ0d9GEA
 CkuB537HbJHqDkt4SUmKi6+cTkKmuRCZVQl4HXF66H6GNlELIUpDxzLFYKRZ57RzQ7eisjoen0kd67
 oIKnVvJZRpmJHPRlvzo+Zq8POWmuEjskvDVNwF5LOcYu1O2U6EN6Dk/VhSKJMPkRmy5m8z4H0REPdb
 6BSj6AgKzG0CQIiGnQs2NcSY0lUwbfMntYbpe3CKDvmMVPjY2CTI+4Vydg9lo+/x0AFH22pP1s5fTp
 6yq4XEPsF6l7Zy1ooGJt0LGuvPA1WN+dNBmzXYixyNI1ykkQQ2nxmtyngiHRUdauQe/KSN7FRJ6mWR
 aO7CLt6djQM0Fy5eOwefV9ES0Fl5W6xv/htXVF7UCTqxs5Yl6n2abXMeA2bEAleR2016wMgbKEpdK0
 8GrtW4fL2lrXZR6dPvTtaYsLRIhwwLccVan5v64qXCiQdeq2WhQRhiyrhwAY832KRIF/NkJooskNfy
 IVAF+/HV3P7TrFFHCo2FzIilgfPfEfQNhL7wBeoZMH8MYV5JGi/xRVBUMs+C8rfYPAuWXUlz4U7n3B
 5mK9qt2JiOR31nFMGW65MlRQDyZm4F9Cu346AzoDHWQ2mndld0G6q4NmfoU0nva/+8P1sasel2Eu3M
 PpDTuHBNwKCwTgqyQ1s3vC6hBIM20FKFUAIubZt5cde3q0ZVgNRAZvXUkyTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI
transceiver (ver 1.21a) with a custom glue managing the IP resets,
clock and data inputs similar to the DW-HDMI Glue on the same
Amlogic SoC families.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..a3428f012005
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/amlogic,meson-g12a-dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare MIPI DSI Host Controller IP
+  - A TOP control block controlling the Clocks & Resets of the IP
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 4
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: pclk
+      - const: bit
+      - const: px
+      - const: meas
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@6000 {
+          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&bit_clk>, <&clk_px>;
+          clock-names = "pclk", "bit", "px";
+          phys = <&mipi_dphy>;
+          phy-names = "dphy";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              /* VPU VENC Input */
+              mipi_dsi_venc_port: port@0 {
+                  reg = <0>;
+
+                  mipi_dsi_in: endpoint {
+                       remote-endpoint = <&dpi_out>;
+                  };
+              };
+
+              /* DSI Output */
+              mipi_dsi_panel_port: port@1 {
+                  reg = <1>;
+
+                  mipi_out_panel: endpoint {
+                      remote-endpoint = <&mipi_in_panel>;
+                  };
+              };
+          };
+    };

-- 
2.34.1

