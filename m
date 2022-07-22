Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F357DF68
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D870E9338E;
	Fri, 22 Jul 2022 10:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305569338C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:24:47 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id gq7so4020214pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
 b=qIjXERqyCxulsL7qrxC5ZZDDBbrioHFknIfqWTpItY9DnBOYdTrKjjHxJHVKgCGl/b
 qI1Bo3uVYHhVsETc34PIx5Bt5sRoC2tiuGaxCHy/jAJM0eDPTQXZeSPQFinIe+I8aq3k
 b4sxp+LsavCZEhpdo/xTXeoek2UqXswoT83RvGn19svgCZFMQWpoDvYyiXUknkV3mWGc
 j0uEqKCYVhxP+mKB9jyzIsWR4TAUOava99C6Tc8tfKqlztes7s1/XY6RtnvubtGfeZpn
 xjRuSRo549Wuo6S2lnKGNBn8iJB+KM+O2KEuPv2JYYPohP2Sw8x4qlz0WakW9LdwI4/U
 Et7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
 b=DbpGsLZZSEX8QqJ1v40KKmJ25uZYjPdQmmAQW9J9tIZ1RxcM+cAY/RLARQmI6cQ4Bc
 VoetF4oqI8PXveYtyGpislMJrhGKhzYb9Sb16oP2pvwkt5d+0DbqnvZiHov8sx+bW5l6
 X8O5YLXjPb/nSmckLNncx9QG+ssYI9tj8KyH5yJe0/NwPnM4chDP6+EinyVn9/8+03GC
 URDaed9FB2qgCRTjS+EqNJRSPGhXzCGde7PWMmeIsVb4j2PrhDxwDGEu5fxBHCc2Eyi+
 IMa+J2oP4yy0CItZ1rsLRWoTPNok/i5IO1t9JW0LS4bVDn8QKzx+UoK4Pt0zygBnMEB8
 NEig==
X-Gm-Message-State: AJIora+CtmFsJg0gBaTq2T0Vsb+6UED4uRsf4/E7hFhBcDXU6xlh9x6n
 k9l+g1PEIe4LXnW5mQCPqK0=
X-Google-Smtp-Source: AGRyM1suCduVs2OcapdKOFquLFxR9PV6851tgTGd/xvEl5/lz4vxWAHevo2+JXiFLf4k/XyyV+aWjQ==
X-Received: by 2002:a17:90b:3c49:b0:1f1:9213:e747 with SMTP id
 pm9-20020a17090b3c4900b001f19213e747mr3386233pjb.15.1658485486574; 
 Fri, 22 Jul 2022 03:24:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:24:46 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri, 22 Jul 2022 18:23:58 +0800
Message-Id: <20220722102407.2205-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
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

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

