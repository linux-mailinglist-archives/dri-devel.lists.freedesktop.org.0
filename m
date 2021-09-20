Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD215411130
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB66E44D;
	Mon, 20 Sep 2021 08:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACC26E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:44:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w17so19294170wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=A4d/I44K6lQ6dPZEnJvXJKA1Z3hxMVVIFQcJThznHU31hRTdglsoln/Cc/mKRkkkZk
 CLWYXAGJ42glBBh9KHCvt4oZT/3UNbhPbubTZ1vbjFhVG7iUx30tv1/NK1okqLExFMCw
 b5UgibW/li5i0UVxqXRAHP0xsOs+rHiZt3ECN+KfLYGqpyGXYKG2RVVdyMwfBHU9CwLj
 1yamxcgub3sIbbBYJNXsBD/DsPwXBTbt1RhvNccAAPnxFwm2kcgm2VkfrjLmpAzwgewk
 weXHgYwfvZ4cn/QySHbSxnVDQB1WmhKhJnCniXYKqlNLdygfdu3VF9KteWp7QQDjNsEm
 Jsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=zVB2Z0XRsrYfS6dmQxF5vDGx5jfJ1DiHFgbftOfsJs+BbtRD02lJybh+U5F1iCkkH1
 2n7p6tyT0RMmUGejqyQuHJElZYDSYdp4RYdDMEFsjekoDu9dZ7RZj69lklmyr77EZQqG
 HYlbOuCWLjmbdxCklJPxbHw0qrpKBwxN9sJN+AaloXi6UulpZdl4xgcnYdo8I2EMRtT1
 6GdIWQop7bb2TMLpUSFhD76V+jS05YZutB+bcd2zz/XZkhIrMSW8dLYcgi3VGyJ3SEB2
 NANU7DD7ILflXZ0/o/H4J/vVEpUWmNA3AdRfiCcXR71yDQI8iQLDg3gVpy+oF3wgwBJr
 +E4A==
X-Gm-Message-State: AOAM531bYWVIkECzElLuSFVpcOT5j5QZ5C2pJ1Ox4UYJfudFBwYZPXfB
 JWz7CC5dyIbXYRBBuGIbpDwXExL25POcQQ==
X-Google-Smtp-Source: ABdhPJxEjT/FkHYZDr/KKJS0+xo13JuDyY3JItw9t1b4157gltxSWW/8wLcz5iaSs7PLtSl+Ztvqwg==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr26881846wrx.244.1632127473574; 
 Mon, 20 Sep 2021 01:44:33 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:33 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 1/6] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Mon, 20 Sep 2021 10:44:19 +0200
Message-Id: <20210920084424.231825-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920084424.231825-1-msp@baylibre.com>
References: <20210920084424.231825-1-msp@baylibre.com>
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

DP_INTF is a similar functional block to mediatek,dpi but is different
in that it serves the DisplayPort controller on mediatek SoCs and uses
different clocks. Therefore this patch creates a new binding file for
this functional block.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes v1 -> v2:
    - Move the devicetree binding from mediatek,dpi into its own binding file.

 .../display/mediatek/mediatek,dpintf.yaml     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
new file mode 100644
index 000000000000..ac1fd93327e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpintf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek DP_INTF Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek DP_INTF function block is a sink of the display subsystem
+  connected to the display port controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dpintf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: hf_fmm Clock
+      - description: hf_fdp Clock
+      - description: Pixel Clock
+      - description: DP_INTF PLL
+
+  clock-names:
+    items:
+      - const: hf_fmm
+      - const: hf_fdp
+      - const: pixel
+      - const: pll
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input port of an
+      attached display port controller.
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+
+	dp_intf1: dp_intf1@1c113000 {
+		compatible = "mediatek,mt8195-dpintf";
+		reg = <0 0x1c113000 0 0x1000>;
+		interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
+			 <&vdosys1 CLK_VDO1_DPINTF>,
+			 <&topckgen CLK_TOP_DP_SEL>,
+			 <&topckgen CLK_TOP_TVDPLL2>;
+		clock-names = "hf_fmm",
+			      "hf_fdp",
+			      "pixel",
+			      "pll";
+	};
+
+...
-- 
2.33.0

