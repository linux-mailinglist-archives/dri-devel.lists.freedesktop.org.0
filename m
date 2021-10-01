Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1641EA04
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9E46ED84;
	Fri,  1 Oct 2021 09:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3E6ED83
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:44:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6340674wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=lXwykb1Xk3s4b8etdfX3WIi7GxCXgHQ/b6wf4w3CzP8zFf7GXe9h/Z3USg97ZKIOSW
 xNFDtLbzXFsXHsdUwuRKpdhdLv8WOydkcRsn+5VCQ6iFPLxR1ltzB6CCyO5QLeRdnYXL
 jVxiqJ/DJGgVLUK+X2cLnYqMBp2G2kekylp1YnnD6HjhYvlgeXy13dEAeHFgpx5zMgt8
 F9fTxCP8p2X9fZoXWKlnqRJDXayMGOZ1/NYOYAX3CregQNtS5xPxE1ZXOw1vj5DWHZzv
 5dSLP8Rd+AvWci+nbR1dXeFBUIVTlisuS5kTmw8CJHmYQHBfUNs/XceWF7KqlB2UcY9O
 aqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Ai4aE0vpjZQ8LaJpD0/8wjaaXgB3Qvc+4FA2afzs4=;
 b=xTkpw7XhSchfP5YDJmj/mFxk/5zczcKk/rzEkwPS/14ks+CgXg5yNliCUs8NmhdRkq
 M9ih6pmwXMeWAeSatnt/Z2TqnJbcvpef5pMPrfnR3QdnjEiT9C975t0BgwCIT2SQkqn6
 /pAEpr9MhHrYN4jfZCaf5I6XS0ZDf/GFMaVyc6dcuXzRATjyujxd8ZZTYw1Rzhwbv8F5
 jgp7mvFy7LAEA356BR17OBJ9c9c9P2+VvZVA74ddxhU12X9p9bCanWsY3CpxTQmdXtyI
 uYTTAduKqLp2PeU6Ly7VR+lqK5cK0uqlKPgN47BNAHGRzljZYtjh1cTZq7VBAXh0Xjmr
 85yQ==
X-Gm-Message-State: AOAM530mPZXW0jvUPpQWy7xZbTUIuBfQVt19TdHtXy149iT09W+6cT9t
 iHijlH3dGef7aj9wNrY2dvOy3w==
X-Google-Smtp-Source: ABdhPJz1ksC2R5ut/PanYMRc8GXcB7KUTLMvQyXmKOBz3CgUITze1QD5ZsVhgUA233CLvPsbzRf5iw==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr3487374wme.22.1633081492800; 
 Fri, 01 Oct 2021 02:44:52 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 1/6] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Fri,  1 Oct 2021 11:44:38 +0200
Message-Id: <20211001094443.2770169-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001094443.2770169-1-msp@baylibre.com>
References: <20211001094443.2770169-1-msp@baylibre.com>
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

