Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C12144D2E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D5E6F3CF;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4A6EBF8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:51:39 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id p14so1143097pfn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ry4/ep16oNKoCc2xrlZ2XWt3hGVglx47MU7Pj1OXlYM=;
 b=k1IWE9m+k9xJWthTRraJnQzq1Rw3wkzmZNmq66aIX2Uv8T8JnILLr8i+5e6+k1JewB
 R+XJhBkmfviWpVxG4ndKNLMArnCLSnFbgi7Avc0GXxHYmtLZXIqGc4CAGB1fyg7+lThj
 +R6SD4z0HAwaHh4US76MAfjY+IoZkXdnjOIsEqiKayZBaTI53eDaBolqfw8KRiN3F9hv
 hkWcD2R4BsJNIwURGwMcsdOmr7HaLwPagyYrMW7F7pTElJ2jTpY58PZom0RjVoOkZ9ql
 1/LdVPY4HfgJM7YOv9FfZZbIG3eJDe8NqzlFcjTqyq1QhfEKeQ4e8hgD64cF1xDcL2Oa
 e/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ry4/ep16oNKoCc2xrlZ2XWt3hGVglx47MU7Pj1OXlYM=;
 b=KSvtGwrpczpzh1riC2l2trtZPtkilgCZyajiqKUON8T/hraL9ThershJhme8UWc7Np
 BuRh4N9h8AkovvJyGmItAU3afZNjwxKMNMYN2uhhhqFN6YBtR2BqT5FPJsj9ycLxTjXB
 hAzei3uLUoW9OdKASN9Vgsz6tuHNZnNlDX2YvbYAPUwgEyaF1FgbBj44vq2KH9uuLiVq
 EqLstjNGN9lVptZah281rryt3kayAuQOZBeAXMkboiR74cAeYwFLKk316zN2JtUWR/8h
 YZJIIHU38QwCQTkkSeUhroVnaM5AMuR5416Q4fpu0jDeJqZU2n5dveUTsLnGmaoxG9ZD
 HJIw==
X-Gm-Message-State: APjAAAXQF/nj2AFUl/KJXpwdv9f1XgkZxUwO4xY5AuRBUVNPtEXkFLpE
 4kA0FSK086MIGMVUIucBbo8=
X-Google-Smtp-Source: APXvYqyswxxK9QRmtJByIcY/Wvc2iUBp6rl8K7qZLF9df/+mqbmb6EXm+ES3IYc2NIHfXdKKr+1apw==
X-Received: by 2002:a63:cc4a:: with SMTP id q10mr4182000pgi.241.1579596699371; 
 Tue, 21 Jan 2020 00:51:39 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 80sm42820957pfw.123.2020.01.21.00.51.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jan 2020 00:51:39 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v2 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
Date: Tue, 21 Jan 2020 16:51:01 +0800
Message-Id: <1579596662-15466-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dphy.yaml     |  78 ++++++++++++++++
 .../devicetree/bindings/display/sprd/dsi.yaml      | 101 +++++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dphy.yaml b/Documentation/devicetree/bindings/display/sprd/dphy.yaml
new file mode 100644
index 0000000..c5e97c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dphy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI-PHY (D-PHY)
+
+maintainers:
+  - David Airlie <airlied@linux.ie>
+  - Daniel Vetter <daniel@ffwll.ch>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  port@0:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated panel.
+  port@1:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the input endpoint, usually coming from
+      the associated DSI controller.
+
+required:
+  - compatible
+  - reg
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dphy: dphy {
+        compatible = "sprd,sharkl3-dsi-phy";
+        reg = <0x0 0x63100000 0x0 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* input port*/
+        port@1 {
+            reg = <1>;
+            dphy_in: endpoint {
+    	          remote-endpoint = <&dsi_out>;
+            };
+        };
+
+        /* output port */
+        port@0 {
+    	      reg = <0>;
+    	      dphy_out: endpoint {
+    		        remote-endpoint = <&panel_in>;
+    	      };
+        };
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/display/sprd/dsi.yaml b/Documentation/devicetree/bindings/display/sprd/dsi.yaml
new file mode 100644
index 0000000..f38d7f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dsi.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc MIPI DSI Master
+
+maintainers:
+  - David Airlie <airlied@linux.ie>
+  - Daniel Vetter <daniel@ffwll.ch>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  port@0:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the input endpoint, usually coming from
+      the associated DPU.
+  port@1:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DPHY.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dsi: dsi@0x63100000 {
+        compatible = "sprd,sharkl3-dsi-host";
+        reg = <0 0x63100000 0 0x1000>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_96m";
+        clocks = <&pll CLK_TWPLL_96M>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+            reg = <0>;
+            dsi_in: endpoint {
+                remote-endpoint = <&dpu_out>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+            dsi_out: endpoint@1 {
+                remote-endpoint = <&dphy_in>;
+            };
+        };
+    };
\ No newline at end of file
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
