Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D848A4BBB19
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481210E3A6;
	Fri, 18 Feb 2022 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C39D10E3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u1so15004802wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8f2hof1aQ6lwVFmupuo9jzO+yiBIvX9J29TbA0gSLWY=;
 b=g5BxrjBH3TULbbsg0hXkjFu7gK33jq2Gb4PAaYmUct5j3CMtMNvfFTKLgLG6VSzQuj
 D1HyPjn8TiRIrUhKIyFVjvj0V7vIvmfBETUGA0X3CKjwlB48bZhPpVY01UQ1YyC35PzH
 fFwja52bRYhdU2AyTxVLM43JlBDYbW4Zc4nCw/hvEMjWUonqPnhJDyHbMlE3BTOLCKr4
 9EvFI186fmfi5et2vXSryQscGWaaf57p2erQolFts798qbDdxny9yql/4pgSjUCl8Gz8
 J3rCMjX8VJSsWGHZyohL1kraDRkPmdM35wmHGfpxQ7xKwmIpLfBdR4E/I6Us4EOb7x0L
 nPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8f2hof1aQ6lwVFmupuo9jzO+yiBIvX9J29TbA0gSLWY=;
 b=4uY8mw82R3vcS+yJVae80dw2TzQD07uO6n/+XiJWOQJKQSV6lD+R9LJMPWgFZa/966
 BTWrlWBSKm0/WtxrMGOTBIHjr38qtrm2U7cwxX/8z03AweJlg6kIbkK+unIYKHsionLn
 V5ALrp7YaiccuGFry1T2/6X3QBxeOTD/t1XCkYn0kuRXQlCSiznI4mKJlmPFpleytDHL
 TrWxMrYB9HVheCwgKmWWebqJgKSrFaTRWmqtpYM3r0ILzXcF047OwPOA6LBsWHr4njYj
 XDw+jX5BGmX1FLTNeX/n36Bgzs3q0cbdnWF55P+zLqXA2vSpzj+w/yPfQsO8QRlqx0yX
 FVsw==
X-Gm-Message-State: AOAM532AX/Z+sASSd31SVEksfc5mcJubU6PU6u5GLmwJuiB5L29jOwkD
 yRk2PXcv1xAtjWg+oKSm+R5QyA==
X-Google-Smtp-Source: ABdhPJyh9duhvScQ+K+GxiAh+adrwEeS9AEjb/vcfumx/8LoyXD8GON1VKujIsjJufeghUVk9wYrfw==
X-Received: by 2002:adf:e7d1:0:b0:1e6:b9ba:fa1 with SMTP id
 e17-20020adfe7d1000000b001e6b9ba0fa1mr6306132wrn.269.1645196161044; 
 Fri, 18 Feb 2022 06:56:01 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:00 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 02/19] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 18 Feb 2022 15:54:20 +0100
Message-Id: <20220218145437.18563-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 0000000000000..068b11d766e21
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
2.34.1

