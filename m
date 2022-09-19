Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61545BD2E5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79C10E07A;
	Mon, 19 Sep 2022 17:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852910E076
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 16:59:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u9so130912ejy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=;
 b=2ZDgXmtX7kBtwoUAyxz8rI/gnLo1usAqRIcFp//WkgUEpHJhCUTPn56LV4nSD4vc96
 4ADNXslH3B5Shd0LcD3JYJ/7M2ZPxpmYvmlBYDwnciQmIb+dd8rT5emdFWvOx80yejKt
 MMM8QfLsaPoNoAkDCdmmVoQB2LnGEf+DCqPv8SpIhTDkZiFUJpu0OAbbaTMsM6wKYWVG
 lg3lGETEKJf+8OgeAlqZ+L88vbRecsFHARHMiEUM2ZXJKQC9sUEXHYWN4IGWITGu4Cvj
 f6wMQhd6qOjwNEIuq/p2LxdNHcLGhBDZkGkNOuxddNG8AASoFiH/teUXDgyW9sEztL18
 s+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=69nrv/BKayymEj9f70cbXjRoS8M413ZGsp2FP8B+6Cc=;
 b=qyokTbOGq2mRQAk07E6WFTddSC9Etwqra8lt4EAVJ/YIcksOJTfEts8PvgSDYAZxcf
 4IvGlTFccZ4yYYbsBAdBvjY/WzeaPabEEic3Dnt/lkSm40sZJqkY1YExO/1YtGXK0aER
 yP+MraycPxzdYdD//7449GX+xwaciAd7wh5ZKBSfA+gQgqyV72DV5MFxx7fDgiQ0xD5f
 LiWaSc+nK2zcK/AJjCrZuY6KUy15ljkP4/yTyQkQqVYVTZ+2TA/9IZG1Gf+SyLgF7wJB
 TGqX28lTkTAxcOXwSqUeh5HabeR05ECglKUb7LfvT9KoL8GcrnEREP4Nv69r/jqg4C0M
 4PbA==
X-Gm-Message-State: ACrzQf3GzyuPr2m/u93oiCNeUTRqWxVgwhOjPy9/0NCAlVtp//SXuvOH
 yhPB6OTmNrRzXHVpGbCoad87Lg==
X-Google-Smtp-Source: AMsMyM6XlPFlhgC04B9QuW2zwPNOCYiGRhmcbXp9t18fVx3nugtxHUNV8fsXdbf/C+/TYrDgfmHhoA==
X-Received: by 2002:a17:907:7b9a:b0:778:adc1:1b0b with SMTP id
 ne26-20020a1709077b9a00b00778adc11b0bmr13092811ejc.569.1663606791165; 
 Mon, 19 Sep 2022 09:59:51 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:50 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:02 +0200
Subject: [PATCH v1 04/17] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-4-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mt8195 SoC bindings for hdmi and hdmi-ddc

Make port1 optional for mt8195 as it only supports HDMI tx for now.
Requires a ddc-i2c-bus phandle.
Requires a power-domains phandle.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index bdaf0b51e68c..abb231a0694b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -21,6 +21,10 @@ properties:
       - mediatek,mt7623-hdmi
       - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
+      - mediatek,mt8195-hdmi
+
+  clocks: true
+  clock-names: true
 
   reg:
     maxItems: 1
@@ -28,20 +32,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Pixel Clock
-      - description: HDMI PLL
-      - description: Bit Clock
-      - description: S/PDIF Clock
-
-  clock-names:
-    items:
-      - const: pixel
-      - const: pll
-      - const: bclk
-      - const: spdif
-
   phys:
     maxItems: 1
 
@@ -58,6 +48,16 @@ properties:
     description: |
       phandle link and register offset to the system configuration registers.
 
+  ddc-i2c-bus:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: Phandle to the ddc-i2c device
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -76,7 +76,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -86,9 +85,55 @@ required:
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
+        - ddc-i2c-bus
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
+        ports:
+          required:
+            - port@1
+
+      required:
+        - mediatek,syscon-hdmi
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..3c80bcebe6d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings for mt8195
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
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: ddc_i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      clocks = <&clk26m>;
+      clock-names = "ddc-i2c";
+    };
+
+...

-- 
b4 0.10.0-dev
