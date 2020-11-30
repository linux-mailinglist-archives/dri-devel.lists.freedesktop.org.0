Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041102C9946
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4770E6E4CF;
	Tue,  1 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AA16E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:51 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b10so9101028pfo.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q+XDWKoV9MHFRTeqn/T5sJtop0zObfyxbDEIDUOub8M=;
 b=ehIkPDvR3VgtMgIKZL8RVxU9U8jNyx0krGMxMEJacUsEuNgJcWjLwH1yRcDOU+KqaL
 zHf0BwBuJhgmEHjrJESBvMRLxxMAOUu9nqlwqEkftxDK0CxAkEaPbktpjK78vehIy+51
 AOisfeJD1zgIkFuphvbmuGkRZBAJ2E1sKHBuZc9xaHg0UQN6uTNhjku5kRJFIeMrvgqx
 EhC3oq5bYz0hdB9AZyiQgn0JF+rBnKPC90Ed/uCIkn9QJt+8sqzHzJ+HwGKET4jT2jkb
 nHFwrBwdX3XG2gUmGTpdbjWnxdNI+02RmqGsq1yVdkVCanto2fHouoGTh4C9E0xW1Xs8
 Na4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q+XDWKoV9MHFRTeqn/T5sJtop0zObfyxbDEIDUOub8M=;
 b=El2LHmuGr3gs21DGWR8tB5m5iiNpIDS+FxWJbk+OFvXP7CWITYuSVXsMyYzOrUWANF
 QzQYF/dMgnQ8TT/tpkwvWKR+PvSRwdHs4hNXWegAK8Pe5ESxQuYVYEy8ms1pfWG3xCNR
 qdP7NN8xYlD/zcxS7t9/yydo9WY39S0ubmwn7FdbIw+bOBmMfwtP0omYXBPCJMsmZf09
 WVVOpmh/VRY5KL9V5L3H0NTqQn5HhCI0ySmQ3B4+P+sbu+BvhZpYW9LIwH93ZgFNDEKa
 KjGeYT4jE5AFrl/aWHnWlUGbjvowKFICI2KEXK79end61WR2WUm4mtpsbGjm2zsJNYqi
 MWKQ==
X-Gm-Message-State: AOAM532zisJGEFFeOerBm36nuppuAfsKrItCgKCJhOQYVb3yRB15h5Ed
 0zjaBJKRD9VT7TtWxW27ikw=
X-Google-Smtp-Source: ABdhPJzNEFG3Z5LTCpEJFYTrjXyIJr3N5JnpCJG8vPCncSukIAMX4+GdH5Ki05Dl1aj+mI/xqyX8ug==
X-Received: by 2002:a63:5656:: with SMTP id g22mr17811454pgm.262.1606746531075; 
 Mon, 30 Nov 2020 06:28:51 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 17sm15580479pfh.173.2020.11.30.06.28.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:28:50 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 30 Nov 2020 22:28:30 +0800
Message-Id: <1606746513-30909-4-git-send-email-kevin3.tang@gmail.com>
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

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 0000000..a9052e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc Sharkl3 Display Processor Unit (DPU)
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+description: |
+  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+  which transfers the image data from a video memory buffer to an internal
+  LCD interface.
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dpu
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address and length of the DPU registers set
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt signal from DPU
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: clk_src_128m
+      - const: clk_src_384m
+
+  power-domains:
+    maxItems: 1
+    description: A phandle to DPU power domain node.
+
+  iommus:
+    maxItems: 1
+    description: A phandle to DPU iommu node.
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DSI.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dpu: dpu@63000000 {
+        compatible = "sprd,sharkl3-dpu";
+        reg = <0x63000000 0x1000>;
+        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_128m", "clk_src_384m";
+
+        clocks = <&pll CLK_TWPLL_128M>,
+          <&pll CLK_TWPLL_384M>;
+
+        dpu_port: port {
+            dpu_out: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
