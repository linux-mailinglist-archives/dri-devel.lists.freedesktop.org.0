Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766BD41EA05
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C546ED94;
	Fri,  1 Oct 2021 09:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB096ED84
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:44:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so10736256wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=jExCUMzU7hAdOlUFBrdoeVb86nCh/Uj+lX/7G7s5uWKszC8CkoslwlyT5izIcvfEsB
 uvZvqwbDVWtXS6IvQUo+dVu16w26iJCDZsBn/+Rr65rLl1bX7SYgzadnMf1U+YdwlOlA
 +rjAPDFwiM04JpMIaKmDr5rujt2C8bB+T3kIumpI05FpEwuRZjtEkv5QaA9EbQSG4nUl
 cX0OavcikC81jNaUdIPXitDurwZ97stvnlvkPjHHIKCzptNI4gs+iR63ZcMOzDCaqehX
 TtHjsS1Tdu/J16+c0gTG46Q8BAYNNZvPBTIDi9tKtWkniI3bgNCRxcsr1trfcjNbWtpa
 Iw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EEEytKyiHl9MpK92vctIYCtuI6jVdoVhBUl4pU7DhM=;
 b=2UWLsYtxsGFdSU/w1ZD1cVT1a5opynBstt1zqO4XdVtf7jcBlxMtF615/atLbMGfk3
 T3iv7ZjmHGkJMhJRiEezAOVqRRA0wRtgRV6RoQlKc9AxgnnjwLA+RyciqDlNs/KWiMDl
 p6FPZRsvaEn87YKqBiCE1Qde9/i2yu4e0cy5z/mO1OfMShczHJ1QeOv25TcxkH/3gVLR
 8hYSusTtaRjxLSLCc7k388LM3gsChTsyxOCms48mvNmEoQR1vFMMva+8ww55n0e6KM3N
 ZlBFnghJ9VpBaQgs0hRr8QkbNObuNcba3sDLma8wZxImsArkhIW2v2xtVYvZhvNi+vgN
 x2bA==
X-Gm-Message-State: AOAM530VH0rEj90F4Lzv/mktgE/kA2nb1AY/oocVNjGxoziSFiYUxKPT
 mmbUahk1XVjionRr+UP1KwSPTQ==
X-Google-Smtp-Source: ABdhPJynhJ5tvWNcwbrDCLTEh/2isdLd4PaOeQlLkhAGw9TtmoRnGZYBFiXqXYka8TDjNgi8/sRXXg==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr3542115wmq.5.1633081493519; 
 Fri, 01 Oct 2021 02:44:53 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:53 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 2/6] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri,  1 Oct 2021 11:44:39 +0200
Message-Id: <20211001094443.2770169-3-msp@baylibre.com>
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

