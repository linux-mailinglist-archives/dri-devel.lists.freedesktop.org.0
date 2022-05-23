Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B2530E60
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006DF10E9A7;
	Mon, 23 May 2022 10:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3710E9A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:50:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so11035532wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RBdwv8C2zWSCXm9kFqdZLTYTeRupN3jSjblct2gox8s=;
 b=Z/xyqPorLXxjtX45nJY9HoVzJk17XbNfLYrKQzUC5oUtkKMtSoV+kWJ/W9h2UwUdlN
 1izRYQ+g5TLX3hghia4MPgYalf8vdyabNOS2DaGlsAhoEGt/s+/KnelQ0vZbZtihbBMg
 21Pyw395K/H6hYe1NjG4mAI/mc+ABytCuV7klYgDvq9vZJ7hsPVtmwjWKYUbF/bp/EcC
 Oilliy3/kq69ohuRdHDHt1sN0WqllfmeBK0PA3bmOt33PYByl5DZkyGxt3aG8JeVrdma
 MXLeIGVJyxZJTBpjD3ztKpUSnkvsiwIvClmunyObwRYCXJLItn7H8y/fT/NKL+YLfjaE
 ppkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBdwv8C2zWSCXm9kFqdZLTYTeRupN3jSjblct2gox8s=;
 b=PqKIQad/ENlmv74qy9mS7OuS8VHEEQrccJL5CP3MznD+uubzkxThvdcSRlD54lH+sd
 BsCKz0AJ5KoCInyGtBJtTM+WGkXuZrE+uWwV0NEJuc0eg5vhLwkH/pgNHn5IlBvrJZK1
 W8IOw9UYFwZsYbCO9wlVXN5QQbppUBjULWias/KPXJKiDU3hnezGOJkz2/QcFiFCSrF1
 6DsVHEpm1G7ygHKfF/0GnuZPDKEk9BXMteidEfb+SlHScFOyVu48DEnTYb5IPOTlW/oE
 jGXjWfOb1doHJ6vC93oOVTA46+XwNjqg+b7ykT1tychBhInDRGk7QFU4S1s5D0zNqITb
 vaEA==
X-Gm-Message-State: AOAM532tty66zi9RXW28mIPvzZiqJVF5m3+fhsivyPMgYGugveeAIx3R
 no2GtWZtbXWBfRBdbZzLVL0uLQ==
X-Google-Smtp-Source: ABdhPJxU86O9OrfPSwDpzF5vc+DzPzD1gUymNmku2eiSYHqSUNEzJviyarRmUCu72kW//QWtrovSTg==
X-Received: by 2002:a05:600c:42d3:b0:397:47ae:188c with SMTP id
 j19-20020a05600c42d300b0039747ae188cmr6376412wme.150.1653303018361; 
 Mon, 23 May 2022 03:50:18 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon, 23 May 2022 12:47:35 +0200
Message-Id: <20220523104758.29531-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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
---
 .../display/mediatek/mediatek,dp.yaml         | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..36ae0a6df299
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the MediaTek (embedded) Display Port controller
+  present on some MediaTek SoCs.
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
+  max-lanes:
+    maxItems: 1
+    description: maximum number of lanes supported by the hardware
+
+  max-linkrate:
+    maxItems: 1
+    description: maximum link rate supported by the hardware
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+  - max-lanes
+  - max-linkrate
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
+        max-lanes = /bits/ 8 <4>;
+        max-linkrate = /bits/ 8 <0x1e>;
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
2.35.1

