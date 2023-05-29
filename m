Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164CB714C2C
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DF10E2A2;
	Mon, 29 May 2023 14:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEBC10E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:36:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96f7bf3cf9eso663517166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685370998; x=1687962998; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Imn+CVwrZJtyv1pmcN9LMeOD3o4qWPh5+WMlc2rK8js=;
 b=mfkgAqW6EihS8kP8YQKChzyGM1xJlZeIAmp6lE5FzcBG6BVtF4TNGRCr0oLmJPVQT4
 e7eGblhBxM/QbJCa5pIIAdjeIgfoFzqAdlelFZRT8/IAKoxdhEGRJbag4oS1VZv4YFOJ
 axLQ/Fo1l2hj6PhA3FZgOcPvt8jO3sprWPDhjsWI+gddAy9QzGj8i3ycSskytWN5x90k
 VxuIPpf1kaYnDaNwqMQYg7PMp9dtVoqTOqRUoRd7YVH2OK+g9QuoT2u3QG7cV9w4Vb7J
 KihElyPFF6u0TVaH5mXpSJLVZ3cOc3xqJpY7K8W4mLt5dP3oNbB/hievVGGY1l2aDMVp
 OzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685370998; x=1687962998;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Imn+CVwrZJtyv1pmcN9LMeOD3o4qWPh5+WMlc2rK8js=;
 b=mIWRSO7imboUKIJKjWKKUZOuhKcLiQuLY22TLVo/Xg3+8oVedE/8fnfEwJD01chSul
 9yE8w1KGJntKfRnr0sJswxetlQvGH1/XEf/LgtptmjrxRfAFDtNMy2YkU47JYtEuebwV
 eTKpyAD0JvUuIzcAUFiwL6zniYlxt5pOa/SsV2D4SOsfJjcXrJSybzRU3z4pRB+kgcOB
 f7clSWku7Hbrx9HEQRQ+StA1xnMENHhw3CQaoSXDhzkydZVagGhD+LTnTj7zfv8c0PX1
 0yLEZmzefgBpsrobjyGbl43yMMddNYWtfFa5dLTZ5o+aHJ46eN9kdQ0EDM5tNwvk7m/E
 1iUw==
X-Gm-Message-State: AC+VfDzfYbUcvFu7fePTpweccbznNNJVkEZuVvil0mPRuxqi0jTP6puf
 kqEj0cyY0WjYb2hTplYMth3LTg==
X-Google-Smtp-Source: ACHHUZ6HAi8OaiQCSTcRK5XREAVu/RA9lyqnqLEhBW3lss9xJehOUE8vu/vjAXFRGN/nRQr/mN6UVQ==
X-Received: by 2002:a17:907:1c0d:b0:96b:4ed5:a1d8 with SMTP id
 nc13-20020a1709071c0d00b0096b4ed5a1d8mr12615395ejc.36.1685370998453; 
 Mon, 29 May 2023 07:36:38 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 07:36:37 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:30:58 +0200
Subject: [PATCH v4 1/8] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-1-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mt8195 SoC bindings for hdmi and hdmi-ddc

On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
specific register range, power domain or interrupt, making it simpler
than the legacy "mediatek,hdmi-ddc" binding.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,hdmi.yaml   | 59 ++++++++++++++++++----
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 45 +++++++++++++++++
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index b90b6d18a828..4f62e6b94048 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt7623-hdmi
       - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
+      - mediatek,mt8195-hdmi
 
   reg:
     maxItems: 1
@@ -29,18 +30,10 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Pixel Clock
-      - description: HDMI PLL
-      - description: Bit Clock
-      - description: S/PDIF Clock
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: pixel
-      - const: pll
-      - const: bclk
-      - const: spdif
+    maxItems: 4
 
   phys:
     maxItems: 1
@@ -58,6 +51,9 @@ properties:
     description: |
       phandle link and register offset to the system configuration registers.
 
+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -86,9 +82,50 @@ required:
   - clock-names
   - phys
   - phy-names
-  - mediatek,syscon-hdmi
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-hdmi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: APB
+            - description: HDCP
+            - description: HDCP 24M
+            - description: Split HDMI
+        clock-names:
+          items:
+            - const: hdmi_apb_sel
+            - const: hdcp_sel
+            - const: hdcp24_sel
+            - const: split_hdmi
+
+      required:
+        - power-domains
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Pixel Clock
+            - description: HDMI PLL
+            - description: Bit Clock
+            - description: S/PDIF Clock
+
+        clock-names:
+          items:
+            - const: pixel
+            - const: pll
+            - const: bclk
+            - const: spdif
+
+      required:
+        - mediatek,syscon-hdmi
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..84c096835b47
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  mediatek,hdmi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the mt8195 hdmi controller
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      mediatek,hdmi = <&hdmi0>;
+      clocks = <&clk26m>;
+    };
+
+...

-- 
2.40.0

