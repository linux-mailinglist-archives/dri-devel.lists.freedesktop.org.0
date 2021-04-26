Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C836ACCF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602D489B0D;
	Mon, 26 Apr 2021 07:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2689B0D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:18:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4648541pjh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+7gX6Zo6CBqGA3jozLvkUWHON6EnpU+jY3DCJ9/ueBY=;
 b=GX07qPzciPb7vXofwYjGZK01RaT/UwGdT7AcXl462FMjK1C2RC1sMnFU1S3ex/h+2K
 CLzBnUzJltTnebMcDJJNgA32CMk4xvYMmdy9wd8PWfYRKJA1+hOKK/6JjTosBNyVuib3
 RGAfdwv5E9rIZe65WVbXspUZ42nT93JW/KT08IImF127YQq4WVPd1hcYdT7kI2gh4mPB
 KwrP8OGyRXPZ5GdVGMxii+9DJrnTWXJtjNNxS20i/nkCuNlE8BbydZMxfbvMgLeqzKaC
 K/pzlRcSpvIC/jHB15N46ma8+W8AfTghlLv3b4a4M6rXvrPxyCGvrffPI22VrQipcVuW
 QBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+7gX6Zo6CBqGA3jozLvkUWHON6EnpU+jY3DCJ9/ueBY=;
 b=KPJrSaAwaxsdq1jZwhCQ7DejXEcVmyC9eKq/op0YAIqlru7tpTT/7iknkhdTVI4jk7
 mbD+HuxKCmaNku96ABpRx3vAmeDd2iFIzg7yvMpte9xR1K4NBzXuxZUxipPKozan56ks
 9W/le/NXl/BvcynyJtf9roNHVNwbQaSB9Znpz4TuyOltGosjLnNC7y3doFvrucXU5z92
 p1lJWWMvs9atVkUkRO6yfNyX1ctRujGMiNUHwlMmVRduGG8N10RsFhr6uCxIt4r7hjun
 oU+nfmzV3H5MW5DrtBo+RXv57nJxYjp/+t7pg2XqT1WQVBvVp1em7ASWhInhlSFh3tfl
 iYWQ==
X-Gm-Message-State: AOAM530nj6F0y2ns62vRJIALHlux7cBVAjSAcZ21BJ9cx1Moxita0K13
 Z9kYtCn6ZhFo+OwqeFGDokM=
X-Google-Smtp-Source: ABdhPJxHSnYgBQoARJPPM33fNtoFpUaVdYrHAuseZ1I9F1FgfXF6difqvp4DJA9oBq3ofQHMf3ajVQ==
X-Received: by 2002:a17:90a:1b0b:: with SMTP id
 q11mr13000949pjq.181.1619421505150; 
 Mon, 26 Apr 2021 00:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:492:3af5:75cd:677a:81f7:a9fe])
 by smtp.gmail.com with ESMTPSA id u21sm9848952pfm.89.2021.04.26.00.18.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 00:18:24 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [RESEND PATCH v6 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Date: Mon, 26 Apr 2021 15:18:09 +0800
Message-Id: <1619421491-31494-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, linux-leds@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Resend this v6 patch series to loop devicetree reviewers.

For next, need to add the below line
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../leds/backlight/richtek,rt4831-backlight.yaml   | 65 ++++++++++++++++++++++
 include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
 create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
new file mode 100644
index 00000000..4da6a66
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/richtek,rt4831-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 Backlight
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a mutifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4831-backlight
+
+  default-brightness:
+    description: |
+      The default brightness that applied to the system on start-up.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    description: |
+      The max brightness for the H/W limit
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2048
+
+  richtek,pwm-enable:
+    description: |
+      Specify the backlight dimming following by PWM duty or by SW control.
+    type: boolean
+
+  richtek,bled-ovp-sel:
+    description: |
+      Backlight OVP level selection, currently support 17V/21V/25V/29V.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 1
+    minimum: 0
+    maximum: 3
+
+  richtek,channel-use:
+    description: |
+      Backlight LED channel to be used.
+      BIT 0/1/2/3 is used to indicate led channel 1/2/3/4 enable or disable.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+required:
+  - compatible
+  - richtek,channel-use
+
+additionalProperties: false
diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-bindings/leds/rt4831-backlight.h
new file mode 100644
index 00000000..125c635
--- /dev/null
+++ b/include/dt-bindings/leds/rt4831-backlight.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for rt4831 backlight bindings.
+ *
+ * Copyright (C) 2020, Richtek Technology Corp.
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#ifndef _DT_BINDINGS_RT4831_BACKLIGHT_H
+#define _DT_BINDINGS_RT4831_BACKLIGHT_H
+
+#define RT4831_BLOVPLVL_17V	0
+#define RT4831_BLOVPLVL_21V	1
+#define RT4831_BLOVPLVL_25V	2
+#define RT4831_BLOVPLVL_29V	3
+
+#define RT4831_BLED_CH1EN	(1 << 0)
+#define RT4831_BLED_CH2EN	(1 << 1)
+#define RT4831_BLED_CH3EN	(1 << 2)
+#define RT4831_BLED_CH4EN	(1 << 3)
+#define RT4831_BLED_ALLCHEN	((1 << 4) - 1)
+
+#endif /* _DT_BINDINGS_RT4831_BACKLIGHT_H */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
