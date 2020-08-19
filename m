Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F124A804
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCA26E81C;
	Wed, 19 Aug 2020 20:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B806E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:52:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i80so12758920lfi.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrnAOfNeMY45Zc2VAynDzTk+Pika+bbdhzqu0uIz8TM=;
 b=LXqQ/fx4gASCmZtcHjHDguMZZ92GvjofBVvXPDlt6vO7HSmPDQfvI/a/1vyZzNRgCX
 jZ12bFn+2i3bNm8Vwhp2CRp3Kf4137UrglxaGOSBJrPBn4EoOKc5erpsRjErMoF/aOK0
 4mbTxt6DBylQ2k0lHNyEEDV/K9XjHFG7X27bDQoflaUbym7Zrb6zTkrPHbkyk+q/AWiw
 NpxZzk75/qrynlhb8vXjuStzilomVCS4k1FHz1/ImOxhlq2jY/vkv8eDYBpoIr3wXeKp
 BXY5Cd36msSs24beVkJdlDqGRkl+r2B5Tk2obFnE+Siy0Qmdz0M5aXogdXgPOhG3hOvX
 Pi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DrnAOfNeMY45Zc2VAynDzTk+Pika+bbdhzqu0uIz8TM=;
 b=DpObvJIEPusWn3tIEFbxtoagDx9TZ1Wih/HPF70case3yQlWmn/nkJyVco/bbh6hrH
 rcMsiTTl6JehJ7eSpTwBDb9N5+ej/kPIKhYxWl+TvlrlmC0y/6tAnxMibsfb2PMx/WcD
 s4aNONpQ62diS9GVrJG9F+Qyt+abjB9Y1Uu4Xio2gcVbhtkjGM6d478Ru4EqBhZ5RjKn
 E2qYkEGZIkkj+pk+l9EBnco3oiQ6WxahtatAAL5L1lvAq5Z8rTI+m2tAWe55m8qGe0GG
 QYDWZuZUqCZxlBTeDNrTGB8F5hxAgPjv7/wtXEaP8pI+j7IvUJ7LrTXp18fl2IJey77I
 KrTg==
X-Gm-Message-State: AOAM533OvaHfEVtOnGzhZfhCDEijghos1nlOdcbP9h1KeCVh6qDOafR8
 ZQKSwjJM43Hytm09bBOsfRQhzw==
X-Google-Smtp-Source: ABdhPJyz+ohEqmEM1RkxQtUpRLw6wTd+k/jtb3NLYO4vG+UVH3YylURSMNIz97RIaO7LeQ91qbxsZw==
X-Received: by 2002:a19:3f57:: with SMTP id m84mr1052364lfa.128.1597870320184; 
 Wed, 19 Aug 2020 13:52:00 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id u10sm8188lfo.39.2020.08.19.13.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 13:51:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Date: Wed, 19 Aug 2020 22:51:48 +0200
Message-Id: <20200819205150.164403-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's use a common.yaml include for the backlight like we do with
the LEDs. The LEDs are inherently incompatible so their bindings
cannot be reused for backlight.

Cc: devicetree@vger.kernel.org
Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Drop the | for the description
- Drop the "default-on" property, we're not using it.
- Drop the minimum 0 for unsigned u32:s
ChangeLog v1->v2:
- New patch as suggested by Sam.
---
 .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
new file mode 100644
index 000000000000..4e7e95e331a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common backlight properties
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+  - Daniel Thompson <daniel.thompson@linaro.org>
+  - Jingoo Han <jingoohan1@gmail.com>
+
+description:
+  Backlight devices provide backlight for different types of graphical
+  displays. They are typically but not necessarily implemented using a white
+  LED powered by a boost converter.
+
+properties:
+  default-brightness:
+    description:
+      The default brightness that should be applied to the LED by the operating
+      system on start-up. The brightness should not exceed the brightness the
+      LED can provide.
+    $ref: /schemas/types.yaml#definitions/uint32
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/types.yaml#definitions/uint32
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
