Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586B557933
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83410F45E;
	Thu, 23 Jun 2022 11:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C552E10F4FE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:23 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c205so12166099pfc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5oBLDeH2TFPPE1qW+095x6ar1U98gaW60A2FSoyamQ=;
 b=PcxhtUBnyPDnzbGcjPOH22wXUg64coBDrbIKm55BA3uBCZt/v0IKz/meTcap2SGjfB
 OAcyzRkqDFgj4gT5v9h8X67lB1yjdI9ZAyixj1KSxpOIjrnSZ1e1c9ZzXQxo9DrgvgLa
 EPp1YijsJXMTxKlaJO2mkfyWZfyydkymswth5pdzC1bR2GVbnonCWv5RlGypNuNly0pT
 9dZotbzBxyhN/3Q81oUMzbBRJ+w2n8GyXCz4SQJRfnCREQ8qXmvhiTCOt4UzrPhNIqtT
 hjCEfw3BwBKpMvGZGDhfyXBpK6vYDap9fFAbWjHb1Kq1q2Pl5jVEGRtxPnCy5gwo61/O
 BxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5oBLDeH2TFPPE1qW+095x6ar1U98gaW60A2FSoyamQ=;
 b=z+a4IZcwq5ulDkUALHjzyEMb/xD5SkKdGT6s8XKBckPifpMp7p4cUJ1Bae0bSEDP6a
 FcEjMhUb16X+LB+4e7wA3/nWezaKDfHNUWmJEc4A8kAN1Gh7ynXu9daPHnUsKtULWim7
 hwwz03cUVUycHZ4zOXch6gDobPd/v0ZRqcOABNeY058o0l28UzW0BE7yXQDyP8KHtUpF
 WSG1i3iWalD6X2yTx3MNZYfeNW3W7Dtm/Ew6wsvCBFy85nB0Tn9yZbkV4xDmim8WMZua
 M6HP7Lfl7O/1h75AWAzAfWV2OwPD2wQq10Ghm+72wxIxX05hAQCNY0TRmsDAf1xVcnps
 p5LA==
X-Gm-Message-State: AJIora+pSYM5VW27qvvQU+uLNdg3fbNVycs2nfKHfCnBKuQQs0SMWHbq
 vE3WmtkrifSS1DW5rY1faf8=
X-Google-Smtp-Source: AGRyM1v2dS8GCsHCr6bAYJn0dJ8H5c9Q7wS9pSlJJ8PZKZKq3RJ5NeGGUM/SZNXaholm+I9PvXwMjw==
X-Received: by 2002:a05:6a00:22ce:b0:51c:15ac:3977 with SMTP id
 f14-20020a056a0022ce00b0051c15ac3977mr40443294pfj.3.1655985443535; 
 Thu, 23 Jun 2022 04:57:23 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:23 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Date: Thu, 23 Jun 2022 19:56:20 +0800
Message-Id: <20220623115631.22209-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v3
- Use leds-class-multicolor.yaml instead of common.yaml.
- Split multi-led and led node.
- Add subdevice "led" in "multi-led".
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..45030f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

