Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDD2C9964
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5586E550;
	Tue,  1 Dec 2020 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67DB6E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:58 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id t21so1472243pjw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EpEME209mz5k6FTxbvqck9duuxyhczoNP4apmpkRY5E=;
 b=VU91h9AImpvhGCnnvsr49JxL8FfrvBsLs4EcTzjNT2/qySaAiuf4EHYapUGDUEXjou
 YsfPEY9c+Mmgxx+LE2R0rILoGGJ/VS5DV8N5cx994q9NV6vDA+lipaYzuk/oeQuVqIQW
 ZPrfOEGvqVFHb8TIh2T/8b1k4ReclWHG3pRafgk+PhpQuP8yg6Oz1bktqE1tptLlP+l6
 USLeArSp0z6uhtQrDYZEBrxpD1d0EN1OgsAM4oPQaSU/CK1XowdADCyPg6za2QpDKM8v
 DcTx1rdH2PaWSLvzY2kOkuRNw5Jms5uuk4wucqATgBCRr/sLJInXL2Y15v4dgMiqWCsH
 ZNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EpEME209mz5k6FTxbvqck9duuxyhczoNP4apmpkRY5E=;
 b=s3bkv9ivOPxBvSIuyKP0lwCjoteneMetE8sAK3nOZ25aI+HX2Tk9SY5ZHi16aMbX+Q
 t/KoZ5ikcoRpQhtLndg4CpD7MwVV9SdK43qJXcFpjJ0rj6N7X7nJN7m+p+NXZULLwUIC
 fpA6DOprT//pGpQH5X2dLCHsgeVbjixs18FI6wlqNxHLlvx+bFfJSjQuNqwa839dGOyY
 YmVusW29zykCnwfR+77NNP5W8Sa75lw3Rx9uMOQYtBu4RK9CGKR6oJB/2UswXcVP3cO0
 eGTGGMgB6lxONT0ezD9aw3rIiEa3mfJni2HEHTtEIY9wzPdE67Sk+4oRhp4GEejScpYZ
 j50w==
X-Gm-Message-State: AOAM5323JBgGvR6n8MDdukbo+V3rm4HtbV2X705U4grYaEbcuWdkAf7T
 PiarV6KZq9+/942xPiEVIPM=
X-Google-Smtp-Source: ABdhPJz/EO917ORFpZWL819ftPBlTYHNLLh0U42PTMgJ7dxVEIJapgjsKIHHSMwpafin6vtFvbWWOQ==
X-Received: by 2002:a17:902:8309:b029:da:3239:db54 with SMTP id
 bd9-20020a1709028309b02900da3239db54mr19222324plb.31.1606746538307; 
 Mon, 30 Nov 2020 06:28:58 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 17sm15580479pfh.173.2020.11.30.06.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:28:57 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
Date: Mon, 30 Nov 2020 22:28:32 +0800
Message-Id: <1606746513-30909-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 107 +++++++++++++++++++++
 .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |  84 ++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
new file mode 100644
index 0000000..fe0e89d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI Controller
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dsi-host
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address and length of the registers set for the device.
+
+  interrupts:
+    maxItems: 2
+    description:
+      Should contain DSI interrupt.
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: clk_src_96m
+
+  power-domains:
+    maxItems: 1
+    description: A phandle to DSIM power domain node
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the input endpoint, usually coming from
+          the associated DPU.
+      port@1:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the output endpoint, usually output to
+          the associated DPHY.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dsi: dsi@63100000 {
+        compatible = "sprd,sharkl3-dsi-host";
+        reg = <0x63100000 0x1000>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_96m";
+        clocks = <&pll CLK_TWPLL_96M>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                dsi_in: endpoint {
+                    remote-endpoint = <&dpu_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&dphy_in>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
new file mode 100644
index 0000000..b4715d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI-PHY (D-PHY)
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dsi-phy
+
+  reg:
+    maxItems: 1
+    description:
+      Must be the dsi controller base address.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the output endpoint, usually output to
+          the associated panel.
+      port@1:
+        type: object
+        description:
+          A port node with endpoint definitions as defined in
+          Documentation/devicetree/bindings/media/video-interfaces.txt.
+          That port should be the input endpoint, usually coming from
+          the associated DSI controller.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dphy: dphy@63100000 {
+        compatible = "sprd,sharkl3-dsi-phy";
+        reg = <0x63100000 0x1000>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* input port*/
+            port@1 {
+                reg = <1>;
+                dphy_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+            /* output port */
+            port@0 {
+                reg = <0>;
+                dphy_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
