Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1B167BD3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D166F428;
	Fri, 21 Feb 2020 11:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376A6EEB4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:49:21 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k29so749776pfp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KRlxVHnY6xMdVsy7PcO/fCoxo903j73okxO5nZgCM18=;
 b=atHtCdxL1sgWCq/VwfyueK33mty3HzDbieNwt5EKBCyhbGy+Xy6YmoGDwQ6DVXXnUA
 1f2nupfCV5141CdThGW+1P5qDcF9TvJBMiTAcPGRzVZQT0HKyJm+QdapEAn8L3QLHI+O
 v1SCYwuJkw8cWSJnmWR15mUTru2S/+AL5epZeaDi7c6g/v/Ko6lCTK1C5ny0bqiPz6cl
 Tp3T0cj+F5AJH7OJOoyGmEFzHDeI7GyfPDVRNG6j9dLBE5HQ4Fnv2XH2GmtA0gkAW/Q5
 oyu8lEJqG2moJBTFEXCGoxxvZTV6ZqqcOmLqB1y9PHTxSYc/Dyu8slmfUJ/Htg1O116t
 C1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KRlxVHnY6xMdVsy7PcO/fCoxo903j73okxO5nZgCM18=;
 b=OUD//dZuN/hZefmqlmfmiszDTy2nfkzTuHJObSlV8WLwe0bsXPwiJdpU6b7s0bXWt9
 rm70jaOiOwkSOcWxjMcQ8SQ+ybmaP5OLnGAUr8+49mrmj3pGNzRux1R4keib2cnig+Ek
 iJkkdYtqR+u/25Ev+42aQqD4Tobsa08em3rMbxIuV3iomnS/ac2QtZyJZMlLYX5UDAs8
 212gFIHwHuK0GP/J16oGZN02xUZhpeeBSgRF/maT/xBkWJb7681wwFRH8RxpVpfkF1VO
 KMPruJIiNMbehOIvBSsW5hQFGNilmHZN7L9YNue7RG41LC3Oyz3ti/ux23SUiu9NEQd+
 FCsg==
X-Gm-Message-State: APjAAAWUnjllLcSGBwyuod8TyP+V4Ma6oNDv9heI1lYGktcNZ7HFLFGb
 KIYmMf7RptyWGmFFJWjGbpA=
X-Google-Smtp-Source: APXvYqw846R9l9ZV72ot+NZpkbbIx08Foh0EvQV/MWyWThtxrgwu/chEqjgnjK7+dueYcum6uSy9mw==
X-Received: by 2002:a65:4d0d:: with SMTP id i13mr36680996pgt.346.1582271361210; 
 Thu, 20 Feb 2020 23:49:21 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id d1sm1444653pgj.79.2020.02.20.23.49.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 23:49:20 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v3 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
Date: Fri, 21 Feb 2020 15:48:55 +0800
Message-Id: <1582271336-3708-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
index 0000000..bd7819c
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
diff --git a/Documentation/devicetree/bindings/display/sprd/dsi.yaml b/Documentation/devicetree/bindings/display/sprd/dsi.yaml
new file mode 100644
index 0000000..198ac31
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
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
