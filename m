Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF1576011
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99414BFD3;
	Fri, 15 Jul 2022 11:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB51714BFE9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:26:53 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id s206so4159966pgs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
 b=qF6pWmeF0M4udMy4fnaDKGqlHpvWfnrSleUsZ1R3LvzAA164EL4eUuh21No19uTWwA
 4Ncn12fEmplqmDy7Y1eNhwl3wGCNNNm2SdH6vTqBLEJ82FVKIhkbr2dJyuMLjYkk4AzC
 3+iqQmtO9Aubo0Xz6rxLxPZ/g10BuYSZdOwPIOykslr7B2bNNhQhS2jvfU7rYgeNxka7
 bbYB0AybPKmVCU2ZmVhxLoFB9J/GHwYRsfEeTmk0OpBlC8FAu+4EwMb7iHLyEHxJYcqu
 pIWkmCmfOIT2Fl0CvVjXYS7kjUcs+GbIFM1wdSRMcPXxDhiIhG6d3PLs0HfXut5ZbjFH
 KdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
 b=4jKt7u0xkZTUqpHsOBrWrr9QEY0seFjfHVMqpjv/8XxLAr2r2zir+/rNOn2fhtr/1n
 RHNbgU1v/LVy1GbkwLYw5Y9EMN+7Sb2fQN+YUEivmKSZjATPogKCSEJO2bU1xtDwwheY
 qsE1bwIZAa5m0DtzGjyq0Ifzbb+II6cs7bfStS40sxWiadL4YZ2X8WY/otziZAzgT75V
 CD8NrjH6ZVTt3mF2ExVEnJbD+AvK5Udd9TaF5pTMlcOic0lV1bT21M1avrvSxHTMJvhM
 EQmcG0Ob6CimWin/gn7+SRX155OLHzqK4ugf5UJ9+Z5VX8U0QtfhMhNq+XkngloPN473
 t0jg==
X-Gm-Message-State: AJIora8b+ecf+3humwV+SaMvIfRGljeCekc88rq1a2JFrLeTf+UAuzcZ
 Pmdq5DQ02OWe1UlF4m8IcNo=
X-Google-Smtp-Source: AGRyM1tn+1VSM0nJrDcicImUQfV+BJwlknSwvv/sZpqhQ8QXScW6TUatzKl62b43uUmVmtXsdqu/qQ==
X-Received: by 2002:a62:4e04:0:b0:52b:30f5:59b8 with SMTP id
 c4-20020a624e04000000b0052b30f559b8mr5028844pfb.37.1657884412477; 
 Fri, 15 Jul 2022 04:26:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:26:52 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 05/13] dt-bindings: backlight: Add MediaTek MT6370 backlight
Date: Fri, 15 Jul 2022 19:25:59 +0800
Message-Id: <20220715112607.591-6-peterwu.pub@gmail.com>
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
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add MT6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..d674212
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Backlight
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
+      resolution needs more than 64 steps.
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

