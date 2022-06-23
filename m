Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82C557936
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168110F4B5;
	Thu, 23 Jun 2022 11:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322AC10F4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:36 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q18so6530274pld.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9mqbhZoMmE2UGeXYY/i+9oRbxA8kCBRP28mwUFzZ1c=;
 b=qRTVC2ywxT1/qxvRJKAAT+rtvj71hyQm21AvxxJe1uv3ptO9m3pvGeREZp++I03axd
 30X4cyu3w2QD3JckP/q3Y+aB4TIXTj13WQlliKAzlE0gBQ2upW3h+cnCIwrICcsqKOMy
 8JguM9hpd8ReKzGu0CwHNwk5pptUEVfXuDnYLneCQC3HDQUaP6gFeKle7yHwLCKt7Bo8
 fX7VIBQt1pdA+Vh16LC+H0UZS5IRqZGPg9Cwmcy8nzxfDI89mrYnFg/KfuS01nTK8c1y
 k0qn3lz5Yn0AxnSCot09dQ0CvRD/ZYEMrp2oZSI1K/oV/coFmNHJNhL41LBviiijSqRz
 M8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9mqbhZoMmE2UGeXYY/i+9oRbxA8kCBRP28mwUFzZ1c=;
 b=7Tu9NKw5oym24WYTn7aU7ePGNyetfKDECfDeR5AqHy9DCIwsYJ7yyzOcVrv6RRGb9l
 tISsWRNtESI5SCARDR3jdUkhQYdqwMfjx7M9B3ogz3otFB2ucMaU/a7ES5Aei6NleXrC
 VuPTSneRQh4s3qmgNVQYx0fzWfOHBAxEqIx6nIRSDkmy422cWySQvgf4FlQ3F64cnDah
 WKYtKbDnJ1c9/HyB8ZIOW27xPiPVWBYKxYDnl6ZIIXRbMuQXtFI4Dk3J8b19hO4eahCp
 88u/JtXcdEetW4JCJphCpjuNMOqnxIcQUrf0gydWi1kE09IgPP+4vz7+vydrYjb/W3ox
 Wrsw==
X-Gm-Message-State: AJIora+cdrUndN8aCaHv8JyQXdXegJxrcKNorw9Hrx9IHaf1ZYbjM5sv
 hh7Yqy0WwSTSSWJr1TrRA+E=
X-Google-Smtp-Source: AGRyM1vkUp4DtpsTn2hg/SKsugyEWOTzH7LnpFRhRrqqEuoqcKYA/inTXAsFFb1PabSzgpqRwIY4Yw==
X-Received: by 2002:a17:902:d58a:b0:16a:3139:5ff7 with SMTP id
 k10-20020a170902d58a00b0016a31395ff7mr16262584plh.118.1655985455815; 
 Thu, 23 Jun 2022 04:57:35 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:35 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370 backlight
Date: Thu, 23 Jun 2022 19:56:22 +0800
Message-Id: <20220623115631.22209-6-peterwu.pub@gmail.com>
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

Add mt6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v3
- Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
  "mediatek,bled-pwm-hys-input-th-steps"
- Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
  "bled-ocp-microamp" enum values
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..26563ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,92 @@
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
+  This module is part of the MT6370 MFD device.
+  The MT6370 Backlight WLED driver supports up to a 29V output voltage for
+  4 channels of 8 series WLEDs. Each channel supports up to 30mA of current
+  capability with 2048 current steps (11 bits) in exponential or linear
+  mapping curves.
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
+  mediatek,bled-pwm-hys-input-th-steps:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [1, 4, 16, 64]
+    description: |
+      The selection of the upper and lower bounds threshold of backlight
+      PWM resolution. If we choose selection 64, the variation of PWM
+      resolution needs over than 64 steps.
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-microvolt:
+    enum: [17000000, 21000000, 25000000, 29000000]
+    description: |
+      Backlight OVP level selection.
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-microamp:
+    enum: [900000, 1200000, 1500000, 1800000]
+    description: |
+      Backlight OC level selection.
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
2.7.4

