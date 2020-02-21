Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF349167BCD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B656F3FD;
	Fri, 21 Feb 2020 11:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3CD6EEB4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:49:14 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 6so581952pgk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9s/89tFhK8CsKwuJAyzex+lyypM4LteBbs7SvUHMAY4=;
 b=FYeq5fRl/qH/XEUZDrffiETx7mSYEoysXSDKfoCD8vugyXXzbaSVd1+NbJutdsIDFJ
 6TRvVT4c3trRe5JdG9v2FnfceZrgA1E+fgzWlQaKKLydgSE2Jxq0jRZxbc5pSswPrl0q
 kqI5ccN7TYTfChx6xQXGx7dNPwzqD1X1fPFblfem1I5UAxtmYALsjsYpkwqXUVuazDvq
 P2DEtqOVy7pNW4fVc3dBNTO+WxPswVMzQiHebeysHi2iHu8qiadOc6A1s8r4RANg3yF8
 nuf2jqREWcFkLO9xpoFj5e3EN6g0huypZW3dq6HxbjEttngfOCGDyh/ChEfHAGXuGcvF
 d5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9s/89tFhK8CsKwuJAyzex+lyypM4LteBbs7SvUHMAY4=;
 b=o/MWR7UZhcz2lJkanNjq4qk7r3Xs+W3FUPDHrNh07d02w7fMilA1YjPXp9f+GAlbYx
 b2Vyx1K4r4Ai0sIfozI3NObRO1huvB+la+YET/S/rEiZGRQ52qY6oart7pSCaMCmqxzP
 xXVJOHUJ8KIQgX+xYOVFe9YDi20PGbma1Cqh4jLpNdiiwPgF6nfczA0qW2LygYZ7TgwS
 7gDWaoCpBZrduM0DUMq9o3sx0u5TtBulFwzpm51RvQPdJB1ptte7qy/8DDZks3IPkMvU
 D1JonSLq/8tZTu7GgSHVXr7HgpZq3tEXuBRQ3i5CEv1V2d0lfxSQuyxabwBG0Q3w8Ulx
 9VsQ==
X-Gm-Message-State: APjAAAWaZY9FgOjgfBMn0fkZZgS49ZVNmi9m29yduKygh6kwoOYza97/
 xflOd1RPAqBrG7cK6AfIF69Q2H4Z
X-Google-Smtp-Source: APXvYqxKqdVRyRdtOGfIJxeRmGLjwNsFH6v00he3QSjaziEmGGmxu/92M0N39l7riAZg/3ddqVQ/GQ==
X-Received: by 2002:a62:18c9:: with SMTP id 192mr35752390pfy.117.1582271354610; 
 Thu, 20 Feb 2020 23:49:14 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id d1sm1444653pgj.79.2020.02.20.23.49.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 23:49:14 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v3 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Fri, 21 Feb 2020 15:48:53 +0800
Message-Id: <1582271336-3708-4-git-send-email-kevin3.tang@gmail.com>
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
