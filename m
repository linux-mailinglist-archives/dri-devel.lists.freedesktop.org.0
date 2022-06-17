Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14954F1E6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771D011A9F0;
	Fri, 17 Jun 2022 07:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF8C11A9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id me5so7138506ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhUmQjlVEm98FuejkV49ied/cxReTiKl0adLMVVp/04=;
 b=Fwy6VFGlfabLlQay+AyWPbhL+ymPIcSSw58I4ati4Gu0SX90FZZKiGyRY5UnAcOseE
 Y3xhGsNfU1XWjeGEnkOeCvGy/apeySedKcr9vJN8aZiwgr2uLYVnmMexlPpBihkQg5hd
 FrBxkl+1NsMB326LOIBSFwqXnnYIUqiLXUW0ztajyB2NbM18KVmxAzdaagHfjjjzxr12
 zoBq0x3czBzLLcR3X8YtRJaiunBvRQxe+B/o8cSP9qFXVJ5s8DsBsINfLTOn5u5fTzAo
 ldfOfMYNHM+KpTLP7vSOmCezgWlLpERpCvHziL82YSvjUl5YiJuY2LzqdNF7rTP0WHmq
 fnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhUmQjlVEm98FuejkV49ied/cxReTiKl0adLMVVp/04=;
 b=REHQAxi2YGUsxsGv6wX3mZYdkx4rFWuJyNDoC2cR1sOkq3Goya6XTlucVOndz5XVI8
 GWdJjk9kxLVTBDEJuuUTfR9RWv2Dlj8nwLbd07jYBMBP0570Xg6BvgLZCjEzytPK5Pwd
 QCWcw9nSAZe+C93DqlcfBBchNO3F1gOtH//GMaffLPHaa/IZlaWw1mlqWX76D6tKmUan
 fHv0Srsrx3PbsGe28fEF3UV016im+03L2roRjvLvxMCOwxFM4dPkYebDSMoJoFOdhylK
 PWiD5cP1p87GVmhtIpByTQV8VqQde3DboVjZkztp5rETbwT/n/1RFruwtJpe6H+s2qXq
 f61g==
X-Gm-Message-State: AJIora+0XC2aEHMFCQ9jEZteGwq5kv+XWKLClSr8NvfrIBN0/vYg5fbm
 3oOAhCXUpWcw1JckmDXT5R/MGw0DWn/1dg==
X-Google-Smtp-Source: AGRyM1sHnxSHzWDAa3DPinyDjLvfprasBj5z+3vPJoKmBnT+Zar+MTgF0gDYVJTREtggVIPIp4jIJw==
X-Received: by 2002:a17:907:a427:b0:71b:6f0b:8beb with SMTP id
 sg39-20020a170907a42700b0071b6f0b8bebmr5651272ejc.496.1655450852661; 
 Fri, 17 Jun 2022 00:27:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Date: Fri, 17 Jun 2022 09:27:18 +0200
Message-Id: <20220617072723.1742668-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532; h=from:subject;
 bh=nfzFDo4vSJe6xj0FTwEJ/U/lIAnr1DaEgJJpcHdVaxw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyqY5ZuFCHuvgCYy0WNIdOndZlC1wP7beVGnIlw
 N220U86JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqgAKCRB33NvayMhJ0ZnOD/
 448XF+A0HBYCR8G5hsszIj07/nBsQTDfXg2FAGCrmM5l6izU4QwCKijtYxwRJcQUAeI+n2/F3bkehj
 fuLHK4tfiXXGDNIYISm6fuo3b4OjI5uTJ7TK03SF+kRszl2OACvBIkK91dvD30r9Vt3ukMxOkbP7bR
 qtDueOf0BcQnXOx+cZ6RAY9LbqdEbmKkTYUIQn+CsVYZ6OSUD57FiN2BILOltKIhdoINejZUnvQbso
 Nrko/HA5QbZ/6nCqXFmxaGERRxuP/wofeRCdvX1aZXamS2/+7jRPAYZ+hUHIF3EwRTHENxT5FdOsXL
 04hdOPjYXQEFWRFQrBnzgQs3uwKruSsG0OIB3Xbug4kUmX8HXSERS1ZnSgV5XOlQBRbQJho9y1a6Lc
 tsqxbFPHI7sfy/FsgaJhgbqoIF5T5kaI/Wf8+8p3luA+0U28tRkwGad6252bLdjyHxtjSYUIbZ9Bcn
 dmhwxY36KKto7GqwdbHmyeK2r08GCrSmhfkKuJKS68RPkLG/DWbfPOBHU8b72GFJHaI4QKz5qta8n+
 8ddmyn1Nrgk8NkOGKRqnQEgxqO4qhvLbIGyha4tRf5owRWD9UlhPbS0SFR3/KOx92iZAD5a2QxHLNh
 RnGc64vBzoOuhrJkCdRvoqCVClQB+8YhKSTGFdRVn25OVDMwH/O91clAu6Fw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
on the same Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..e057659545a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
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
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pclk
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
+          clocks = <&clk_pclk>, <&clk_px>;
+          clock-names = "pclk", "px_clk";
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
2.25.1

