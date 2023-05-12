Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93A7008BE
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E46B10E6B0;
	Fri, 12 May 2023 13:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA810E69D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:11:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso9142699f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897117; x=1686489117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h5CBW3kP2kGkkwXUgvUKDH94eutksEhBTi5lS/gp2Ag=;
 b=jI8+vLf6WkwRF5A+lUQc3hQYHJpGSDd0RbULbiPdoqTLQCpbUF5su9FAbPerXdwNhm
 3IBj0Ie3gPaS402gPDR2Or+tPsLjmeI5NOCHjjADzZdX7lEvDDEkXjKYmu1IeHYdKYJm
 SpV8SmzPUVIzQJjDfuK8Bmk++vLDfQNt0cHvblI/492ea6zRid0MA5k322NeKeZ5NdR1
 820dNd+XMHm8+WK4RoOvhRYao9v9b7DyMaEulz2pmL24P/0YkVmLNfTN1JXFmEcLGWGg
 SzS21ZmEjLbNfUbTmLC+PgJ8CmMuEJWhv1npeqFClr9xvkrtWmopb6mfyCmtZOv7t4Xn
 PL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897117; x=1686489117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5CBW3kP2kGkkwXUgvUKDH94eutksEhBTi5lS/gp2Ag=;
 b=gDeKMKI8qhqMM7IHGvGfnGcEDl3cdrSfQVNalaJ2cAUHB5w3WX8mtysZerGVnxYq4F
 7JN8SovSlsM6NxF0/SBcnG9+aETwuRpN6PYB8OI+S5b1tEwrQ9ycb3NhtRBqFuORAxtw
 gL9Wo5jWS20uVCq9ZNUDdWrCCO8Gk1t65/7HS5oPldj7pCvsFf93l9h5LoqYlCwwKCwM
 X5JOQDHCu6kaoTR9jilo7opoz6gyOC4emv4UHeHBIMR7Ah2GZmQEaHVVHwjkEMQk0d/b
 rE58cKjAGndSyfiLayXJfNOuDUYz8okD9qr5HxsF41fz4LEXL3FL4qy+/uZ92Je/wUM4
 9gvQ==
X-Gm-Message-State: AC+VfDzb9U/S9BrkMIpwIFJPJYjyc38WA0v/A9XqmLb4OlZ6mJFaozhH
 SLeGsCbx5F0nfvMaAqbQGjUIgA==
X-Google-Smtp-Source: ACHHUZ454f/mVXxdSFVxLKRDWzBkb6FmtRDQxY0O+rBeRDrU16trHg6OjIT1+y3iOvZSWRnUQ/EluA==
X-Received: by 2002:a5d:510c:0:b0:306:41d3:fcb9 with SMTP id
 s12-20020a5d510c000000b0030641d3fcb9mr17050014wrt.27.1683897117307; 
 Fri, 12 May 2023 06:11:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:35 +0200
Subject: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3529;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3MDhT7q/WcievpQjDDNOoPwupOVRmxDglFnaq0Qxji0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsTc+2KWxxsNC+gphTBNqaqjfizuK6hMljA2xoE
 Z/aoWqyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EwAKCRB33NvayMhJ0ZUUD/
 wNt+EVWvoMIIiD/p/Rv+tgsc/WgfOc/z75FQsHR+5VQ589t+rFNjeDyTKlJ5O5aJobCrdacSqnLpEq
 bzyLjlq3HKfA4YjnrOLeFmXa25+jsk/ST4Mfndym3UMtGBbUI1vParUsklWyZTxgFBFCfE5ttuPxcL
 EsehJagcpU/hORi76dRYwWnuYlk6ATXtedL41GVddLwOSz91l9jtne12ASBD96UeqvZn1Ef5IqMECO
 tbYbFy+Ce9jaP2w9NmGw+JoFfLwFvsiwcMCcoI9IhdtrIgtS+2lkN9yQdC4C/iWK19nag1IEtaIjiV
 Jlfe3o1ARZGG9IPOQkNNPL6U122YKZ4qQbmwDPjmo5nH0k/AIRIdZo6DkOHF/z1jTeC+Wu7C9LmLAY
 ZMXLtxilBdPpvHug3lk3XFd34OQlQNGtsmc5b8PhMy15O2J4U/UcChcnmie9AoraeI9P62QFu8ObFc
 Jvz7VL7dw84edBMAWac+wIJiXYnOHGwolkhXC5E3qzzkVR6fntQRiwoqYrtrCPDKGWjSq62k53t+vp
 HwQZ33cXpi9r2kTZn+XtUIpYYNpClXcKkbl/k28BJ95ATnA+JXcMSbWnvJZnuhyTc7RM7B2W0+3FMD
 zr9J6GwqEaWyZGSZEqOP1L2HTz797qI/OBWw7hVJDn6OTtPZNd1LIGa4f5FQ==
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
on the same Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..8169c7e93ff5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.yaml
@@ -0,0 +1,117 @@
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
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: pclk
+      - const: bit_clk
+      - const: px_clk
+      - const: meas_clk
+
+  resets:
+    minItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    minItems: 1
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
+    dsi@7000 {
+          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&bit_clk>, <&clk_px>;
+          clock-names = "pclk", "bit_clk", "px_clk";
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

