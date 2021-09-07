Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80929402727
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016D589E03;
	Tue,  7 Sep 2021 10:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF589DA8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:39:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q26so12279227wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oz+Hr4rbZnT8MxqfF16y/QcdvWXwOuV/sANx8R9T0v0=;
 b=ttURaYZ3GOJrLfiRPVgP6FVt1sTn4/VjQ3JvUq4LS0dEDBsGsWxw1syT5yrRjMnusR
 ZXTp0q+DB+1ZHvy/fjom9NJV7cJBn7L8Ylqgw1rEmRCYk9Vr/pclGjEWmJNe48UmpO6F
 9Pilf3J37Uac9vF59TO/60Icd3P39suwl9BO6BfWJVRH0tXmh8/kk/6r6st0fVhySvuL
 F4rVlFtvAJxLrMO5rFu0DBikqxvljKrHI8Ia4r6FDoUoD1DJGMm7+A/M4IILsWtix8oF
 DZwIn2pd4TxcA1gjAvH0QkKcsr/5ovIJHsVgK35NoqpYrBp+6eJ6qbCHYSoykacMlB6D
 paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oz+Hr4rbZnT8MxqfF16y/QcdvWXwOuV/sANx8R9T0v0=;
 b=S6dv/yfZmqwEKy1jM6g6XV3sicLiah+yuBbi8Fs+Q8EKYHp6OS6HNGcew43Jot5yZD
 l27rKPERENpnirybHSNnicTtwDAhBnCM5MxLDXLPhOXwfHMQTyVyoYKe3Y+g5ZLWM8tT
 CUp2XJvUR8dAEBIY9qqCMlBFG0Tt9QdWocDvb9vUwvaYx3hBwWc1k+Ysj/1jRAUNn9i0
 EONMYzhm/JG24w9oU3X7kd/lt4JIN4mjRJ2428mfiNGRURcIPPjKFRRPNc/d4E4DOXjH
 E/LvlviwoRoCbvvsbtVhU5vK/RYsfVgKSGjCrwuxfx6lXZq0LZDjwyBBi4UWkwTc9EvL
 Io6w==
X-Gm-Message-State: AOAM532pptH6Aznwt5/psVL9Nc8cniqlJpbD3+8PgqG8S9K58LK5IZSR
 z+RhPOr2w2FgMKxc9fVSBsMVOA==
X-Google-Smtp-Source: ABdhPJzoBZMmsSD6ztdMvt5juS04ZdEQi35jGlbPEby6MJaVuXCnGNXgqWHtQvmCP6Ssf+r4FgiM4Q==
X-Received: by 2002:adf:de8f:: with SMTP id w15mr17787801wrl.277.1631003975036; 
 Tue, 07 Sep 2021 01:39:35 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:34 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195 HDMI PHY
Date: Tue,  7 Sep 2021 10:37:20 +0200
Message-Id: <20210907083723.7725-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907083723.7725-1-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Sep 2021 10:28:27 +0000
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

Add bindings to describe Mediatek MT8195 HDMI PHY

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
new file mode 100644
index 000000000000..f03bd3af7fd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding for mt8195
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
+  output and drives the HDMI pads.
+
+properties:
+  $nodename:
+    pattern: "^hdmi-phy@[0-9a-f]+$"
+
+  compatible:
+    - const: mediatek,mt8195-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: hdmi_xtal_sel
+
+  clock-output-names:
+    items:
+      - const: hdmi_txpll
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    hdmi_phy: hdmi-phy@11d5f000 {
+        compatible = "mediatek,mt8195-hdmi-phy";
+        reg = <0 0x11d5f000 0 0x100>;
+        clocks = <&topckgen CLK_TOP_HDMI_XTAL>;
+        clock-names = "hdmi_xtal_sel";
+        clock-output-names = "hdmi_txpll";
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.31.1

