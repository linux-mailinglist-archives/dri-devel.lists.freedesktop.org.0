Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1685395B0
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233C7112824;
	Tue, 31 May 2022 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x44.google.com (mail-oa1-x44.google.com
 [IPv6:2001:4860:4864:20::44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E825112B2B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 12:51:03 +0000 (UTC)
Received: by mail-oa1-x44.google.com with SMTP id
 586e51a60fabf-e5e433d66dso18181803fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JSIsAVF9fVkTehhsFum2qIaOiKUkDyLxbABQD3He3l0=;
 b=hKih9lAOW8MRbbBGfOx7kiRTjz9QfEd3eSIsmozQoYetBrC+t6l22jSihqFRc12+Xm
 vm7gh7oP1PcUjMLC+CnfQsZGCRDHQzpDYCVe4SM1p5AKYCAg5+kuYV4IfOv3NmsBxCss
 7YG0ROpBieoxvaS2AVVkWoMEgzSjP8Q4MHJtD90Su22yuchHnMBHN2kYeHQjcAKUqPh+
 fcX1MaYIdZzOtul5ziWofq+/Kiip9n3rw51FxR1QAqdrDC5veq6VVK/6j9X92G9Hm8mp
 0N4LfQ2aWVG+WFVKCJfp1DpxXQSHB4/w8Ri2BU+4MT7fum/8hgvDqYI07FZLkP9abiy8
 yujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSIsAVF9fVkTehhsFum2qIaOiKUkDyLxbABQD3He3l0=;
 b=5EkbkYcf3hsNVNgIjMC2B2G64tzWEyDyELypAkxEDTEZg0qnTrJ9000uzxo4r7UuL2
 C+n0ti7mxKR5hNSVVVp3ajd60W8Q9NOZUVWX490A/PsCkARtdqz0udSbEcit55KDh7LA
 ZmyKANXZQMEESuLVRuWGv1C5KnXxFp069EB594SD6JrAcxQI9AB8AXBUTvvX05QY7ZH7
 1lcjntLNPelJZiYhIpkyTc+wYccdMg5hgHvAzgq7caQPxd2P4Ompjh0vbRH28ZiJlksb
 XWqFozcxpFYJsHeETUriu3OLZUrehttUWjb5hEYBDU/j4ijip4Nw+aCWSOtgmdgg3TVg
 i4HQ==
X-Gm-Message-State: AOAM532Lj4dAJpVNYAmf9Ultu8s01av6QHSLSVVFIkTtsiSX+wTq+U1c
 cCABvBT3UJ+q1/UtvULcSuIZmDvQpD4=
X-Google-Smtp-Source: ABdhPJzuEbDwbQWGn3CV/zE1vb9aceaeVtHBN5Ja0Ci/sA7YgIw7LlW8QzYq/gP7Sxq9ui9vU3D1gg==
X-Received: by 2002:a17:90b:17c6:b0:1e2:ab17:a8f9 with SMTP id
 me6-20020a17090b17c600b001e2ab17a8f9mr17018922pjb.68.1653995978760; 
 Tue, 31 May 2022 04:19:38 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:38 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 05/14] dt-bindings: backlight: Add Mediatek MT6370 backlight
 binding
Date: Tue, 31 May 2022 19:18:51 +0800
Message-Id: <20220531111900.19422-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add mt6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../backlight/mediatek,mt6370-backlight.yaml  | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 000000000000..81d72ed44be4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Backlight
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  MT6370 is a highly-integrated smart power management IC, which includes a
+  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
+  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
+  driver, a backlight WLED driver, a display bias driver and a general LDO for
+  portable devices.
+
+  For the LCD backlight, it can provide 4 channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-backlight
+
+  default-brightness:
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    minimum: 0
+    maximum: 2048
+
+  enable-gpios:
+    description: External backlight 'enable' pin
+    maxItems: 1
+
+  mediatek,bled-pwm-enable:
+    description: |
+      Enable external PWM input for backlight dimming
+    type: boolean
+
+  mediatek,bled-pwm-hys-enable:
+    description: |
+      Enable the backlight input-hysteresis for PWM mode
+    type: boolean
+
+  mediatek,bled-pwm-hys-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight PWM hysteresis input level selection.
+      value mapping:
+        - 0: 1bit
+        - 1: 2bit
+        - 2: 4bit
+        - 3: 6bit
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-level-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OVP level selection.
+      value mapping:
+        - 0: 17V
+        - 1: 21V
+        - 2: 25V
+        - 3: 29V
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-level-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OC level selection.
+      value mapping:
+        - 0: 900mA
+        - 1: 1200mA
+        - 2: 1500mA
+        - 3: 1800mA
+
+  mediatek,bled-channel-use:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Backlight LED channel to be used.
+      Each bit mapping to:
+        - 0: CH4
+        - 1: CH3
+        - 2: CH2
+        - 3: CH1
+    minimum: 1
+    maximum: 15
+
+required:
+  - compatible
+  - mediatek,bled-channel-use
+
+additionalProperties: false
-- 
2.25.1

