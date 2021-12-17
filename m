Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6C478F23
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274FE112AE9;
	Fri, 17 Dec 2021 15:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91889112AE4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 15:09:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v11so4598900wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=toL2v1mg/OkMSznV2NPL+e6xhb1dTHXYjRr/KURTTyUhKGpWlGy4psR4aVyUZ6TR4/
 HNXEur/I9Xev153quDM4MQq8RtmSmF8YDw7pGBPz/OjEsiyoOI+BHoZBgx/YCZBB25xE
 01BSlpSB4+3ndaRsjlYMZz7FYUY9lfZDftPLJSK11BLauq6ZsMs3VBh8xFRYz5zc+s8K
 nrAQkfRWSVfJYGqpZTV11mU7RsfB0+AzYlCdVWZyT9JTQtHv1cl5D/OO2PCVa36winm6
 lFsxMXVmhYA4+x8xuZKijkbmNX/LZA14U5SkWYVkYyT/HiC5vPaJX/bXZt/v6w0qRbEJ
 MRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA5Bx+I+AGs2RfGY4hpgrqrPI8r6zTFIuO5ZwQf2Zak=;
 b=pgyNeqxheYTNejXABldV+xdNQXEmUpDDpT3xvxR9BQ3srjKOnIirXMTllnc2blWuNk
 +xwbk2O9fm+CnHMM+Aqiu5UB1qvAuNoZps4w9dNUoR4xGoPG5xynfl0aps9+LkwQBpyI
 KmU/RQSq7KoPbdzuz0YImHsDGSo/fdzpEPuVj+hVSjGUbBilKbmnxt6DvpLvPpkAr7Rb
 t/xjA7opZ1045dra1Vo9EWdKBPMs3woSmxMJDXO8E7SaLUEMia1uKxYBKN6gzcI7gJKf
 unx0ZW2ltN1jSFm5mZw85CzYOOt67FBMm69I49K37LgS02YLAdDRQXdFiyPo/UuW8cFl
 9yow==
X-Gm-Message-State: AOAM5337ZoU5PM2g1hUQAaHASAlAd3n/yJ9Dfbv+5U/qLsxns6GRRHWS
 jZnBdgV1kC15bht8hAwBBGNXSw==
X-Google-Smtp-Source: ABdhPJw2QIwL+JN1BE/ytNuThS3hvqjbyhJk1gG3get4Uk4bFSMW9drCtD5/xxhsEnmjYhGJnW27og==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr2832923wrx.569.1639753761014; 
 Fri, 17 Dec 2021 07:09:21 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:20 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 2/8] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 17 Dec 2021 16:08:48 +0100
Message-Id: <20211217150854.2081-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
2.32.0

