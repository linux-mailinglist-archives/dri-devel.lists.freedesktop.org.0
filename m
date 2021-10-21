Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D21435DED
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4586EA1C;
	Thu, 21 Oct 2021 09:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492296E428
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:27:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g39so18088076wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHEDIhS7d+5sM1yG3p7LLvTgb3WIu2jXt+RBb0xlASQ=;
 b=suBCQYcolAMiamEKklNw9fxTBgPAmFMotspeeFnbt+Z4XGzKvJt4sQZTa3p8/ni6eW
 BOJtY3MahjWyuYgmfFedP95W7Q/cgesyiXY1FuEy1Q3NLPfegO1Z3xPg7fRBmvYRUelk
 bpphtoRk5KCu8Kuxd8Ic2X+FU1eUli9eE1cdV4p1viwyYP8iQM2pTjxcYmVhnDx9Ngh9
 d1rPcAmMAmymRTglNqcSWXNfewgtwPgLwsHqeQGjFeiMTmrWnXfwIZO0cvBTmi8xaM30
 NT1ie9sFJ8p/qNBUK2Ae6eiiNbFy4eNSHJTgB+qA6sOUNKOCFPUaYqXpOGyIG2Jj693n
 FAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHEDIhS7d+5sM1yG3p7LLvTgb3WIu2jXt+RBb0xlASQ=;
 b=5tg/ZldcdPwaQA7pLED4H4nEJO+Rhu3JvhpWgXdjfXw59fJSVJReYE0DaPtH70B5tD
 vgoDlmHmUkN6ZfAjjChjPTbiBGtXob75UjajBlllj0t56EcGw+BIEq4jWzRnsKBr3Cp8
 4CgmxeHTd58188Qjkpa7RBREacSQObQBJ9gU+7eQ05SS8ypCIvy4uCbtEoYktU8+W/fL
 qua//iYxmPgzo1hcU8RyBEUqGzsYiiV6k3vmWP7qwnmf7EADnqNlOPM1+aa0dzYwm8Jm
 fva+bIqc5lHy373VhzMkcFMXlpSidTSxDwf5STHIJDg7//82seU7TssuN2+vjX5eyGII
 mZVA==
X-Gm-Message-State: AOAM5326n1VyAR0xpUueG6MQP24iPRz3qSzuZEnetDC5rNALl9Mh+fwd
 Wb/ew8m/9P+PiXBH6sL8d4Lb8Q==
X-Google-Smtp-Source: ABdhPJxsU39aMKJTYEdpIYWuk95pmYltvZ1+5U+rjQtV/hGfMNChjMIVWlwgXwnzaSYjbMJbH9LKrg==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr5445941wmk.83.1634808446897; 
 Thu, 21 Oct 2021 02:27:26 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id d3sm4538468wrb.36.2021.10.21.02.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:27:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v5 2/7] dt-bindings: mediatek,dp: Add Display Port binding
Date: Thu, 21 Oct 2021 11:27:02 +0200
Message-Id: <20211021092707.3562523-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021092707.3562523-1-msp@baylibre.com>
References: <20211021092707.3562523-1-msp@baylibre.com>
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

Notes:
    Changes v4 -> v5:
    - Removed "status" in the example
    - Remove edp_tx compatible.
    - Rename dp_tx compatible to dp-tx.

 .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..068b11d766e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,87 @@
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
+      - mediatek,mt8195-dp-tx
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
+    edp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
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

