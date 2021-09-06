Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D13402075
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 21:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA2A89C21;
	Mon,  6 Sep 2021 19:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9889BFD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:37:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d6so10548264wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OpJK4P2F3fcoe9OUOgVh8n9rJy2vMiHA7cI1y8LkZwM=;
 b=or6fRqEk6kiYRl3xh3nfEzFiDQvnkOg5aZHN2AYaf4vCPVYLl9U3enQ48XqCZ5CWPr
 Ge6S/NTA6k/ZFNPOVHq41qcmNtx67hUz8llVFYYOKoJRdN6Feg675Z5llx6dKwgrnNS2
 79VABtBpK1cIfSY06E/WEwir0ykERmwwkk5J3VSrkUQVbOAiaRrTIFq/ajAQQFuuU9cY
 Dmjo83RiLmGEJmFdyDVt9raqaBDXsJu3+EkS7do8vI5Prs3W3ntoava1FHAkjZjAcL5S
 W1Ih5zG5TFbak9hnW81tl8E7bpHSQd7E2kaBHhx7PnhW9em4yklqPpMBRuPQwmqkt9wI
 H/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpJK4P2F3fcoe9OUOgVh8n9rJy2vMiHA7cI1y8LkZwM=;
 b=DtYEjiIfAD3QLjMuY+kG+NC3HPnwSGaRoZSfdCoY4eXY9rlfGFt/hzd126ubPtxzvM
 sXEGyIR0iK+1LY7SQBhWStAShvpCJp8UZiA1Zpywf4v1ZBu4KWxJzSawRwu5oE8+LKE0
 EaAcZgsAhHb195s1M1yOIzhZ6AKjyYdCbT7QGqHWczIrEtVyH9AgBrEt1T5uS6moUYhQ
 Kjx1QSt/V0M4Y1mJADgRNnnT0WbdYU6K86B43LV2QNH8C3BZc6dzbcLx2HyPa2tGxBP8
 +ckb91R3V1Jkx6mvUpl0IUjv+pdR8CBmj5D7adSyVPRag5b9uRpbyTx+90u/qCkBDsma
 l6ew==
X-Gm-Message-State: AOAM530pzdbGvdIfB2U8CdycYvAzpPFsDxcC/uRkE17Raep4WZ9zhay5
 lc4qqFnhjc4DbXD9C1lg+9jozg==
X-Google-Smtp-Source: ABdhPJzIj6weOsG+HIDX0gJGaRslrN9Np5qExRczRcLdgQKklHzufSw5S8GQ2hwA3i6uUGpLOgtFAw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr14855254wrg.143.1630957022647; 
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 2/6] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon,  6 Sep 2021 21:35:25 +0200
Message-Id: <20210906193529.718845-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
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

This controller is present on different mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible is added.

The controller can be in two forms, for a normal display port and for
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    I added the mediatek maintainers in the list of maintainers as I wasn't sure
    whom I should put there. Please let me know if I am supposed to add my mail
    there.

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

