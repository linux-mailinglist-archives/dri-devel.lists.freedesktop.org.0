Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D4428A13
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 11:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143A06E454;
	Mon, 11 Oct 2021 09:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A291A89FE8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 09:46:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t2so54180906wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=7QmUw9oUjeAXQ+N4EGb7qUEi7igSPAWW7qJ42AeU3ZI8za+ANUSgJh3Xv1hfT4IXT4
 5pP/KUCQYJF543uBLE2kDaMGxjkLyDn21Okir7Q/O2tQNWdvFDAL7tWKk9ixihm6ie/a
 +uwsStaPyh2DbVnn5FzFE4YxYAWNEPMIr/Drr+o/UICJVlo0iCDp5v8RlF1tmCn2I/Ip
 y6fXyfIpliplrJrnSwG+NcGHbn53x9L8YBCygcwEBpFEFOKyC3/SB9BjmjSEt49Nm04h
 27vxc9r7BRfhAKVy3QeJcYBv2TD7KksKYwcweVu0iffHTIh0nHTMZEgFOQg1bIqCh2f7
 5ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=rKESEveOt4v97tkSGCNyG4GHsPr/YHXxC7kO9f1cw4v5uAJgAIWkisjJrbAWanAk+E
 lQEDVkdQWoxPNPNW+TyD0Pkk/+ldoxqK1NdkDLMBGdCo3hfcPOcoAPbCISWLIgPRwvUk
 sx4yb7uGfnnuWmrdAm2KOO8k14pemBqIE8o5QdgNJR9MJSTAop6WPNTvh2R0TZjZE0oJ
 g0ixRET6jxxvzcEyo0ULP1M1Imeg05JexycpVnQx+qdWnqNUVd+RfpKMUCPNETs7gYCy
 LlhzpmdidZ5VwNUAeP3lV4Ya1QNzMyd7/BXZKbZnl5lhKRF5rK9k6PruoRIUmI4kheSR
 zTZg==
X-Gm-Message-State: AOAM5310wa4OQLD5hb3Uujmf/2SPYTASKbOJBGxCMKr3AdoEbO7kBOk4
 fnTBFmKBvUDeksp4v93qH4K0WA==
X-Google-Smtp-Source: ABdhPJy49jJmzwFQTvOOSCXErrx4sl47Ylj9R8HPx2KuflIOgsK25MWAhOfYiIYYCyLv+vTPAMKitg==
X-Received: by 2002:a05:6000:1689:: with SMTP id
 y9mr23685780wrd.52.1633945591821; 
 Mon, 11 Oct 2021 02:46:31 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id o8sm21349291wme.38.2021.10.11.02.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:46:31 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 2/7] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon, 11 Oct 2021 11:46:19 +0200
Message-Id: <20211011094624.3416029-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011094624.3416029-1-msp@baylibre.com>
References: <20211011094624.3416029-1-msp@baylibre.com>
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

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..f7a35962c23b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port controller
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-edp_tx
+      - mediatek,mt8195-dp_tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: faxi clock
+
+  clock-names:
+    items:
+      - const: faxi
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the controller, usually dp_intf
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    dp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-edp_tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
+        status = "okay";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                edp_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                edp_out: endpoint {
+                	remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.33.0

