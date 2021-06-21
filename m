Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE123AE40F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691689DA6;
	Mon, 21 Jun 2021 07:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D80989DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:24:47 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so11647030pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJX1UFosdGgtQiivB9jicucdS1I6wv967TxVmwHSdxs=;
 b=V71Ch/PoqunpqXNk2/DoavvTbggIYZldcnabdHtFy1UiLBMjHIrOmIoMNQxCaDTm5c
 +3KxqNIZZO+knQOcz1JRXGFCJJ438OjCADQ9pTf4aNCbVuVny8KyLPLlAqTazVySGaN/
 EwK0UGohgNug02bYbuADf0FVuQWHASoWe/MjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJX1UFosdGgtQiivB9jicucdS1I6wv967TxVmwHSdxs=;
 b=Dd/Wq+KBYNwhINd7PB3MPYnABGGKAjkwwLHg1JcQ8fSXejS0G32dYJsXIBsSoJ15a3
 Dt6h9k7peLQVLw6fMuGNRY+h0cUGGw2V6olLUvruXQsJoXCALEJ3oTplOcuXxalZejYl
 1P7LGd3Vgu+igUc9Ge/6at51yJi7IiEwDpjjG7FyvOY21+A0nUG9uNR6jHnfKqa1lkBR
 lXycjPaRk4eleKkmqYh7h28iMhTHWQ//deFmNKvvkOq2Wh6B6TA/X09EBe6YqHSAkDeB
 i9XF0nYeNmbISEZB4TgPy+mj+IGIi+OT27GX6rxQ8CsO45+2T1dPqzQu2T1jX8iicfPh
 lwqg==
X-Gm-Message-State: AOAM531ZFoNzA91XF0F5TGyn/t1Mut42KtytgilWv1dVpEAvY3eVgIrs
 LU/DA5Y1aQwRS6O3LBxowMcTtg==
X-Google-Smtp-Source: ABdhPJwU1bWmmohuzHzeMlHexUvRRwFgo3iijG24rag/pcc6xo/yhAOBfU/HkQeeafJbe9suXTD2cA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr37357200pja.181.1624260286358; 
 Mon, 21 Jun 2021 00:24:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:24:45 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 1/9] dt-bindings: display: bridge: Add Samsung SEC MIPI
 DSIM bindings
Date: Mon, 21 Jun 2021 12:54:16 +0530
Message-Id: <20210621072424.111733-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung SEC MIPI DSIM Bridge controller is MIPI DSI bridge
available in NXP's i.MX8M Mini and Nano Processors.

Add dt-bingings for it.

Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/bridge/samsung,sec-dsim.yaml      | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
new file mode 100644
index 000000000000..32f67f313dfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/samsung,sec-dsim.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SEC MIPI DSIM Bridge controller on i.MX8M Mini and Nano SoCs
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi bridge for
+  the SOCs NWL MIPI-DSI host controller.
+
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mm-sec-dsim
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+  assigned-clocks: true
+
+  clocks:
+    items:
+      - description: DSI bus clock
+      - description: PHY_REF clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: phy_ref
+
+  phys:
+    maxItems: 1
+    description: phandle to the phy module representing the DPHY
+
+  phy-names:
+    items:
+      - const: dphy
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  samsung,burst-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM high speed burst mode frequency.
+
+  samsung,esc-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM escape mode frequency.
+
+  samsung,pll-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      DSIM oscillator clock frequency.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port node to receive pixel data from the
+          display controller. Exactly one endpoint must be
+          specified.
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: sub-node describing the input from LCDIF
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: sub-node describing the input from DCSS
+
+        oneOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+
+        unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output port node to the panel or the next bridge
+          in the chain
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
+  - phy-names
+  - phys
+  - ports
+  - reg
+  - samsung,burst-clock-frequency
+  - samsung,esc-clock-frequency
+  - samsung,pll-clock-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    #include <dt-bindings/power/imx8mm-power.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dsi: dsi@32e10000 {
+      compatible = "fsl,imx8mm-sec-dsim";
+      reg = <0x32e10000 0xa0>;
+      clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+               <&clk IMX8MM_CLK_DSI_PHY_REF>;
+      clock-names = "bus", "phy_ref";
+      assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+                        <&clk IMX8MM_VIDEO_PLL1_OUT>,
+                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
+      assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+                               <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+                               <&clk IMX8MM_VIDEO_PLL1_OUT>;
+      assigned-clock-rates = <266000000>, <594000000>, <27000000>;
+      interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+      phys = <&dphy>;
+      phy-names = "dphy";
+      power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
+      samsung,burst-clock-frequency = <891000000>;
+      samsung,esc-clock-frequency = <54000000>;
+      samsung,pll-clock-frequency = <27000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          #size-cells = <0>;
+          #address-cells = <1>;
+
+          dsi_in_lcdif: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&lcdif_out_dsi>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          dsi_out_panel: endpoint {
+            remote-endpoint = <&panel_in_dsi>;
+          };
+        };
+      };
+    };
-- 
2.25.1

