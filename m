Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B83EB70B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAC36E842;
	Fri, 13 Aug 2021 14:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5AC6E842
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 14:53:20 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e19so12278687pla.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=W6dTLbS2kZ4IEaqFf5qQxhBorC51y4NKT0vystRq6gEP77e/wwqXPAYQhZ3Dd3PU3m
 p+/GxZgGj+07TRml06HBP/nRjzRe4TF5tnqyVZUVPQrhJh2JxQhdfVSlrH1/era6eg9+
 463RJGoWgEC+5K6SBfYWu5ahadZ9HIUQKalwSI7GamanDjiniex8QBa2EafK97WeQT5L
 C4eVTOTBCTRn8x2VAWx1wT3PDYxPC4BJfGxrLep61peGcYb3lxc4LER8ToxyZu2kunF5
 qmWix9FrCfi7MwWiJx5HQb0u/+DVUnbJkdd7V+5wviLSJvKj32bE8AFbP6lg3UIYdPyI
 rKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=tx7a5g5K+UChOMARCNHTT7xmVrZ5A+EMhh7gGDQQYwsfXudRyZZL7BLBLQpf0wroFY
 v5Zka2OSIf69gjS1WJ2XKIkGGfRVeKjoPOd1yVT9fY1SuvpJpIbAiRukqhVroPEzCOdf
 dJ008uL6CgqP63VjwBsuJLcEdJpU/cSVaL14ZqQCU6lDyZjble6TH813izJMoNcQA4lc
 AUaANvJ3MxKs5bEweeKVTEwBJWmFjvLPgkeC+sm7RoNOATJf3me9lprTUS8ZMK9R/vAL
 c5uZ9/ms5ZYfx0FS4MPWpr06gKKQS9dzH7QkUQjyDkgrcTTrzhI2R1KFkdEWqRkMAh+f
 iEjw==
X-Gm-Message-State: AOAM531KIwEKVHbbYFmJttsRzof8PPUq9wHYODlfixj4dhTb5FXwB+Ln
 pvrViyw9oGX6gyUoMnjGMqs=
X-Google-Smtp-Source: ABdhPJw6wQsj4kt+smjAQRYch99Jnio62SXoFPayntKhJQ9/+Punvjmmuy86MWArbLpblmhFkOMTxw==
X-Received: by 2002:a17:90a:7a89:: with SMTP id
 q9mr1884746pjf.122.1628866400252; 
 Fri, 13 Aug 2021 07:53:20 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id e12sm2524787pfc.214.2021.08.13.07.53.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 07:53:19 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Fri, 13 Aug 2021 22:52:59 +0800
Message-Id: <20210813145302.3933-4-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210813145302.3933-1-kevin3.tang@gmail.com>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
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

