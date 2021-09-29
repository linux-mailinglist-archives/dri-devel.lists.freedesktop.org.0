Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8941C1EC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3CB6EA1B;
	Wed, 29 Sep 2021 09:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E15B6EA1B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:46:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d26so3181341wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwf1tKg1O0N4TdrAHDKMubF2cwo9nO/+84LsL8mnCUg=;
 b=EK96bY45esZeXSedAHzaXDD/97/7pEB2Ec1TlsHkD4e2go+rNg577bZ5PJAlUIs8B8
 Z4y3LZ20BMQVmfHNXRs6g0vcBiWN4UKZmhwOdo6RtykBus9rnfXCaSE9T24hiQkl1EEr
 yJgqKcJt7e7de39HZ2lYtpadF7nlHmpY3L80X6rrkKPN24WXcn/nhd2WIrTgnqr56fcM
 QK5AnjWaxg2zsBY2b9VWuqGOia+Dw5QJyMekFjYA2pkai8W+s8SaLSSaY3x/JMnTAU09
 BK/PyPJW5gXZGNkWjB2eG+1TJNOlZxYvW1YmkSPj4ceLchjcwfrdxGe5svJcVLdteN3w
 zTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mwf1tKg1O0N4TdrAHDKMubF2cwo9nO/+84LsL8mnCUg=;
 b=oUcCRCvvLNy/py5aTbLCIXyefcuhJl5IYGeFRzaCRy8TCPqDzD3XwpmdBQnQ2jlWlD
 kYXjjLOlhe02O3W3xedYkSbwqdrS9Xf1+D+KnmM5PVBtxFkJ0xjP1VuUMhwxDocKNhtN
 4BhQ3px4HsCv9/BV6ADdFMUxUuDkbjJ107qcL+ZOzJ+bnOOpWIzP69IpR+UUwAxnqRbF
 NLA/3pe2YjvsBwDqVkFcrosX1PPS7dHSx1Zzbfl3bov59Q3U44oOpQW8jfu0eXwH3bzS
 HNw+jh0iP87/4KUokB9BADRKKwLCXehdsf8vvzhUw+TB/4r3xbZIr62stL3L8ssibSgC
 H/7g==
X-Gm-Message-State: AOAM531V3IdOb9K01s3ph/kp6HPwXDf5hivEVIDFQjsxbsgNaQmj8dyI
 Ap0OqDuLWDGRClkUatzDi7is0w==
X-Google-Smtp-Source: ABdhPJxCZB5y9/24ZxId/CvDAmaWQ9JH8Sym9cvk3b1JSHbLkJIcqxj5WU+LObOEzlSfu8A5xUrM5g==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr5521254wrd.31.1632908814812; 
 Wed, 29 Sep 2021 02:46:54 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-2cf3-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6240:2cf3:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h7sm1751938wrx.14.2021.09.29.02.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:46:54 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Wed, 29 Sep 2021 11:44:23 +0200
Message-Id: <20210929094425.745-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929094425.745-1-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
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

Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 45 +++++++++
 .../mediatek/mediatek,mt8195-hdmi.yaml        | 98 +++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 0000000000000..3c80bcebe6d30
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
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
new file mode 100644
index 0000000000000..17e542809a4e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI Encoder Device Tree Bindings for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+  its parallel input.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL divider
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: PLL divider
+      - description: HDCP engine clock
+      - description: Bus clock
+      - description: Clock for splitting HDMI/DGI into two pipes
+
+  clock-names:
+    items:
+      - const: univpll_d6_d4
+      - const: msdcpll_d2
+      - const: hdmi_apb_sel
+      - const: univpll_d4_d8
+      - const: hdcp_sel
+      - const: hdcp24_sel
+      - const: split_hdmi
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ddc-i2c-bus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi0: hdmi@1c300000 {
+      compatible = "mediatek,mt8195-hdmi";
+      reg = <0 0x1c300000 0 0x1000>;
+      power-domains = <&spm 25>;
+      clocks = <&topckgen 153>,
+             <&topckgen 86>,
+             <&topckgen 78>,
+             <&topckgen 146>,
+             <&topckgen 73>,
+             <&topckgen 74>,
+             <&vppsys1 44>;
+      clock-names = "univpll_d6_d4",
+        "msdcpll_d2",
+        "hdmi_apb_sel",
+        "univpll_d4_d8",
+        "hdcp_sel",
+        "hdcp24_sel",
+        "split_hdmi";
+      interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH 0>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_pin>;
+      phys = <&hdmi_phy>;
+      phy-names = "hdmi";
+      ddc-i2c-bus = <&hdmiddc0>;
+      status = "disabled";
+    };
+
+...
-- 
2.32.0

