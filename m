Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A58144D32
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5036F3DD;
	Wed, 22 Jan 2020 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DA26EBF3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:51:31 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id p14so1142911pfn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9s/89tFhK8CsKwuJAyzex+lyypM4LteBbs7SvUHMAY4=;
 b=tt8utxlivBi46vyypQ0AjDfDNHASYlVHLEyQcJgCFQSxOaF/IGDxV1LRkt01PA94Md
 0puZzgmn3/LFmAsdUmGqYVzAxl7CcHewfOB9ymG6nRJ9BwGI6t8HPYVBEfHZk8nRWiL1
 ph2rdhKVTwbd9thyF+8D1Wsxfq9XNKFvFiG//DZj1bbT7l84HqhLcMuwpiEPHBlv2mjR
 LV3Q1e/Np98JnNa5o0rcVtnL/AXFKHmVonHZ/AK5tw0RfdBSmrCnoYXhAmM3PuVy8Yd2
 RfnLw4gRxz9QzJGjAojzsLuW4V0i67+RGupWlCbFBjRhjcEPYSP1Bqv5ZNiiUf+CUmNT
 fw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9s/89tFhK8CsKwuJAyzex+lyypM4LteBbs7SvUHMAY4=;
 b=b92J5W5nJHmNvBlreRKqiB9zGJnjofPiMApPBRWXzGegPjDNF8hP9guPfafapz0cXr
 llAl3eehEH5h+aWn+2MG6/nCYukNrYCFlPFBq3tQzheayJQeNAF7GQWT4DG+Ex6iC7lv
 Gl/CmR+lJkoWE+QG8gnyBNM9bl0bDvReR4WzOgZ8/dclrJBJfjAnBZrwF4bxbtcfiOR8
 btPAAYscc3F3YWHwniKXDpPZLHPMjMMX8TxwX/GG0YfwVaKQ+ipXuCqkRlgtpyFp1eS8
 LYcKazS4jhVzWt2BnKnGAdYE54ObtDdOkMGrQqpDrb3jbyKviEvqkXkRzrdeyZeBQGRX
 FSWg==
X-Gm-Message-State: APjAAAXQpiHx61SK6AZvYqz1Ey+XxeIbrYfoBYXimh+LJQnuCbMxYnHE
 f+CJPBSbsli9n43JaX70nn0=
X-Google-Smtp-Source: APXvYqy13RiY1TBvmIvqMlcCN6QslDD5Y7O40UJOSKLL8wAy+5n8it2ql98MYZhxBMkLRVv7TmaFxw==
X-Received: by 2002:a62:e80a:: with SMTP id c10mr3438207pfi.91.1579596691547; 
 Tue, 21 Jan 2020 00:51:31 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 80sm42820957pfw.123.2020.01.21.00.51.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jan 2020 00:51:31 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v2 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Tue, 21 Jan 2020 16:50:59 +0800
Message-Id: <1579596662-15466-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:09 +0000
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

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dpu.yaml      | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
new file mode 100644
index 0000000..7695d94
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SoC Display Processor Unit (DPU)
+
+maintainers:
+  - David Airlie <airlied@linux.ie>
+  - Daniel Vetter <daniel@ffwll.ch>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
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
+    description: A phandle to DPU power domain node.
+
+  iommus:
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
+    dpu: dpu@0x63000000 {
+          compatible = "sprd,sharkl3-dpu";
+          reg = <0x0 0x63000000 0x0 0x1000>;
+          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+          clock-names = "clk_src_128m",
+      	        "clk_src_384m";
+
+          clocks = <&pll CLK_TWPLL_128M>,
+                <&pll CLK_TWPLL_384M>;
+
+          dpu_port: port {
+                  dpu_out: endpoint {
+                          remote-endpoint = <&dsi_in>;
+                  };
+          };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
