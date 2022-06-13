Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279145484B6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314310E408;
	Mon, 13 Jun 2022 11:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03E10E416
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:12:58 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id j6so5415988pfe.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0uTDh6aYM5COnk2LVf+hv3AKvxMR4j6qZouxZ1ZW08=;
 b=oMtXDMaL+3K41xX3wOjL+4cJPZPdia8pK0tBsbVNhsHMmgvlY2yDecUqMCbiNaC+Hn
 8cE8h6SDOvEYWn/WwmLZ7sMRWZcuF9sdzlzyVE8GzzvRuSA1/RBlFOfELSjinK69NNdo
 0RDq6mLN6SnRWd2YXZ3BS8V15ynLULjLSzLfjj62me3lSsdxEdTxpcK9sLqdtAL18ikn
 10+cvHGXBMsVmzKBDU7JNlm+oBJ2PwkYMBbXwe4ddFKqZ4oTzjFc8C/lw0j/6fCvtch2
 /PH0f1TQoGivWlVyZKddDusoDyGdaC3bO0lueeCM1l2VrOtE2glqpbHGcaZb9gaPcN3s
 3QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0uTDh6aYM5COnk2LVf+hv3AKvxMR4j6qZouxZ1ZW08=;
 b=Edf7N0mQiMKcOEfFTrxVYmK7eiBInBRl4d924VEqXiQdaE+Hz/w2yXXGca71Y+8yQe
 f8cv+jPPTkNtLndMCdldBYNfYlDZn5JQrnliIAZz2oadGhc1u/teqNaqFPOLNHTsH7EO
 rSLajuQBYeOnRtoSK2ltiBp8Sr3TCU4wWGOfBNILtMUga0c3v5Xd6ATSOBNQF1GbT4G8
 X3YWq6nPERYDiS/4FWCtsZp6qvIuKdHClEl4AbMjFxf7/hyCg7JlE4GTGUM9LL9N47ND
 aZ11saTiuUu8H8wqXapUS4k6+gaMHFVAg+fQ7toVSbHkVD9hb+f9AJmAW4vLP2E/GtnS
 nOIw==
X-Gm-Message-State: AOAM530ehUBGEMO2tTjDcQI68XUQDPgSRonx3l3dNiJXD1YAiq8Y3ouv
 Ukb73AQpNUB37FWt6SNJXpU=
X-Google-Smtp-Source: ABdhPJzUET+kWcvRpxcgqFcYe7H7yEtugI2dhw2yXyAzpnbUyW0Jye1NyMKd3NCLfMtc5qXAlEC96g==
X-Received: by 2002:a63:2f84:0:b0:408:9c77:7a7e with SMTP id
 v126-20020a632f84000000b004089c777a7emr68350pgv.191.1655118778405; 
 Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Date: Mon, 13 Jun 2022 19:11:34 +0800
Message-Id: <20220613111146.25221-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..42b96c8047a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,48 @@
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
+  "^(multi-)?led@[0-3]$":
+    $ref: common.yaml#
+    type: object
+
+    properties:
+      reg:
+        description: |
+          Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINK4
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1

