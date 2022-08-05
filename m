Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDB58A722
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B588B1F82;
	Fri,  5 Aug 2022 07:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94626B2C6A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:06:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x23so1897298pll.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
 b=gaurTMxUlwEhrVMybVRK+Y2mqgitmjhaNHaV8u4G/7lgdrULPEa6++uuBXU3DoXK3w
 NkhVMwDRYlZU2XlF8ccBcuLa+qlYDpUpaCYmVqJfK+8+Ol+T0QWUhEllsNnzP+/4x7ir
 6meZx03mjHv5SAAWedGqQMrP7RqqyU+nQDXdeXvupowxN++UvImLVPZYwT/f73866CeM
 s66+mkhRe/Z3OUCzSiWiHjggTvYozjYg69aajTeQKjX3q8BBAc5Qr1/Mv9784dAczKHK
 zNrHBOi2F8rfWAIzllurUcBURETAOFVPwQLpzBQu++HAcCKorYwJ0uqrOch35mn0S4Sm
 fV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
 b=zu7krQyq3SfbrjdLl7fhmDNbzKYou5hMot3W6A8b91/O6UexBu2ImsQBxY73pwb5mU
 R/uKSYro2we7RKZxL6NSAlrOTmsgwl/S1X/Njc5z1qKGiOo5u4SJKjTD7T1aXGKprB0N
 TUuU5U8d87EzC7/HPwALSyukcki3DhJPp517w+mzgdm9jjKizSQvlmHE2sqUbdGzqCNx
 EPpHI3Dv2E8VzoCDnHq4idJ8mF0mORaXZ28KS9xGvSFwCirJZes2tNHDIcoDvHdkmdh0
 ZVZxUPwU7nwUu/sUH7X4L8U3Ix6ETNnlZSIP7IUp6HhqZ+IHf0D7ibY4rHNiQn6Mtldp
 ozcQ==
X-Gm-Message-State: ACgBeo3M7fIJYN1cexkPMrJovXkiZO0wLIG8dFE7mO/98YYwy3LyNx2Y
 6JAu5qcoYTYlcxYu7GVDWaI=
X-Google-Smtp-Source: AA6agR69JNirhMZg0pIILXPN55zHDUHG+8kr2E0OgDZ2KcU3fs5VHlPXF4oYXepFdubBURh054sXuQ==
X-Received: by 2002:a17:903:449:b0:16d:d781:313a with SMTP id
 iw9-20020a170903044900b0016dd781313amr5599211plb.75.1659683209089; 
 Fri, 05 Aug 2022 00:06:49 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net.
 [42.72.229.62]) by smtp.gmail.com with ESMTPSA id
 i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:06:48 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v7 03/13] dt-bindings: leds: mt6370: Add MediaTek MT6370
 current sink type LED indicator
Date: Fri,  5 Aug 2022 15:06:00 +0800
Message-Id: <20220805070610.3516-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070610.3516-1-peterwu.pub@gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
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
+        properties:
+          reg:
+            enum: [0, 1, 2]
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

