Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F074C321896
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F076E959;
	Mon, 22 Feb 2021 13:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587ED6E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 13:28:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id kr16so8532378pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=er7QipuzV1kGXLJbt0WnSPoGBLoc+dy8hIf61be+yRHqSqJBtcVzqjyUSFHvF5vzH7
 1vq58w42MuUeHrrTAB8sDSaSt3wC0ZWTlgT5l8q8EyGVBY1A/TCFnWalL4so6Wdxb0Pv
 ZXr/E3GhCBsVte6AuoMnCsUGqIRx7gvkEXTzpffSy3BwmHsDg1OvSAX/dKe0iPRKQ6nq
 BYl9EyOe2FdzPfUjv7pK5E4yMuA57PL9Hm2XDGn81Ta6EevZoEr8ACzbSlAlDx3wV7L3
 yRcwof0TgsjH/sHo9Ifxo+vkhKr1E4YNulz6BnCSZ89EdopxF+AqlB1+AMc6kgWqrnU/
 ZYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=F+kgeDqa9rASL+ouMQV1HQm0HIL+gNbSSxtiaa5PKqHUtCZQFYzAYOyMESC9qblBxP
 z/ioBHzUrSJrVPe0t1prmNBO7Nh1+HfqvI2GRJhrJ0sUOhvmHDrdWOPwBr2Dw436ZDdf
 3mWH8W7fSqRTbzLuMbPGjhzb+zUhXEBHH15PQUPGBcZfJHtbyIof/Y5FU+VfYQed+mRi
 J9yMIdBlZdAHH/URcgnBaoeaoIAA0xUl3JiKzDXobgU3A7nF+umnruyOsvTtzojLb5ow
 ywJurtf69DAYI4Quyhxtx9tEfEDFxlBl4YSYBAaCg0IAMz8ZFmwW5+lNZSEctfyxXlLU
 QCPg==
X-Gm-Message-State: AOAM533ZT0gmkRPm3oxcsJqiCjBZdAT9j+H0ztSFqMQl3o1Gzu7ygqYz
 F8dqISqSJ2YaXVcB7CeAGUM=
X-Google-Smtp-Source: ABdhPJyKRSTjmK3XgYgSlQ+qupc0eNrTdETYjXZ0ltDYsNTXu5mpDCFpFOhfvBkQ7AmNeeAHBoQmMA==
X-Received: by 2002:a17:902:7847:b029:df:d889:252c with SMTP id
 e7-20020a1709027847b02900dfd889252cmr22176067pln.76.1614000520020; 
 Mon, 22 Feb 2021 05:28:40 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 141sm19585334pfa.65.2021.02.22.05.28.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:28:39 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v4 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 22 Feb 2021 21:28:19 +0800
Message-Id: <20210222132822.7830-4-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210222132822.7830-1-kevin3.tang@gmail.com>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
MIME-Version: 1.0
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,sharkl3-dpu.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 000000000..4ebea60b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -0,0 +1,77 @@
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
+
+  interrupts:
+    maxItems: 1
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
+
+  iommus:
+    maxItems: 1
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
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
