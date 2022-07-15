Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD6576004
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2A14BFB7;
	Fri, 15 Jul 2022 11:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66CF14BFB7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:26:41 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b8so5371382pjo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxQGn4iIVyQgO4sCNH7+LFX9XzovM/Q2pkwFCARsvl8=;
 b=Mgv/uMAS6quJW6YOZJXpMrDjRfPkFpN+lUMCrij5TBWPh0sRprsv1vbBDjKB3yyw+2
 2R5YnmXIe/LBE2jM97adfXCANPNts4ZSLncX3BhmojlH6iJB4B9fPJNdHe2pKNN9oytd
 u62zCqRFFeFhM9pcOxcs6unc0wEmMbyI6pKZY1FRUU18doVFIHRsJEVlNVin2BBRgaAh
 8FWBSrqiYL4BsoR3E6tSKYQK9LpGXBALXysPOw1quULxO7mxCGPmyvnr5yUev6asjhrH
 wTud6mjKTQu6+640YM/rWz7AK/cKlRMyoADJCuFRKViULuePnuLVKaDKPbSfyhvRDtfa
 nd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxQGn4iIVyQgO4sCNH7+LFX9XzovM/Q2pkwFCARsvl8=;
 b=tIANETCruMjsqv5KKQ2rVZQDpiHaq+Ieo7qr3Q3ks73ckqChTRShhNB0eJxrsucHFa
 BFP5tucpWE6R4gcMx5oNLKw1U4oqa+uXVeCOrti5MfMLckfbGja3Ph48aMHs9f6qIgsV
 R3y0nhTn2BK8qISIY2P6BRzaHAOPaprPj33SgDRCH/q1NGZ88zeRTdDI/aMz2dKGRP2g
 oekZ2JsS33dJu9CzZuiRoKxb2FltWwIHIkTxE61MmrysvYBVwOgYDXmd8t95eOO6Cddv
 X9L5KdZ69NeGQ4aK0CZ3VCGPdAIb3EzDZy45wgDleR7Fo8PZjgh/x1wS+WHI+q21PUhv
 MqEA==
X-Gm-Message-State: AJIora+CMOldd+0Y1kE52yb2VDPI4yAhUlmzYIjPskDhVdjLSlN3MNml
 xcNEJQLUuxUphunBZKztjIg=
X-Google-Smtp-Source: AGRyM1s3nsMjuXz7+TjcArNnQ5dHqg+xYnlDeUbRjeQaq2MhYrhBmlzeb//JROOfLXHQe+5HiF+Isw==
X-Received: by 2002:a17:90b:3811:b0:1ef:d704:24cf with SMTP id
 mq17-20020a17090b381100b001efd70424cfmr14962651pjb.14.1657884401220; 
 Fri, 15 Jul 2022 04:26:41 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:26:40 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 03/13] dt-bindings: leds: mt6370: Add MediaTek MT6370
 current sink type LED indicator
Date: Fri, 15 Jul 2022 19:25:57 +0800
Message-Id: <20220715112607.591-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
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
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

