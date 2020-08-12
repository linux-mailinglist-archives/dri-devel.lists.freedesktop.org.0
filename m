Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400024271D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268046E079;
	Wed, 12 Aug 2020 08:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F230C6E073
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:58:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j22so761737lfm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XR829pUP5cLChd4zqV/cH8aq566vZipy/8mJiU3FYTY=;
 b=mKuImcfjEOJa5U6e8r4Oy2S/3g8vafL/gjV+IfgGp/8JPqvEEUDaOZ0SiUip81VNwg
 +3xBN84L9ziqvJPujY2o5pBMUYAEcTCuMLYgaxjkulnLjtLX2BvvirHb4yTsjwIX1VsO
 dRLr1Agaoxh93uPOXsl0oKVMAAVDjBwW9RoQwC/A6XKWCI1ZWSgoRqheqTxfN14x7/co
 n92xE3RLiemHvtTUq42uOXq9rhFY4iBPuTowinKxanXqn5eKtRSQltgnAIv0QdYcxx1J
 ojeY9NWozkeN0R5Mm+jhlJbEJrJndAvuhBYiXuLvme0yndR0bd6qHOFIh9k8LM6cj8wU
 2L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XR829pUP5cLChd4zqV/cH8aq566vZipy/8mJiU3FYTY=;
 b=loCTbTZIdvPArmm5JR0a5viYx9FP3u1gMQow4MjufgpdBecjPhvzaADTYsi/DEj8Af
 4z8rKdwWV/3ifhQI2CG8SB2d5EDS/ICQU3tilNZEv8yWEB6GV91atVECYOEaawNrV6Wp
 /+Xg6hlXK1zVGRGSz0kKfPT1uJ408ysV82x2idz/NVrTBlo7WpAPnbWbxckxD5ngTK9P
 TF3QXPQU2lcTrQ9DJt65NHfx145p0iHS0jspTrggA5E6zFgdJEAv73lvFky8YQ6AS2tj
 wDfhyAF7Hn5IVMXHBxvd3ssuPLz1ESEXeBPyE205/vKfrjp8DEg0cZzC294fGuEdrW9x
 8IRQ==
X-Gm-Message-State: AOAM532Go8+ZIsKTWeKs41Q7edIrF5vTD+9eZ40tu1SOKat2LYPB6aXm
 1CKjswlRpw3OHvSjy3SW/o7IfymHyEk=
X-Google-Smtp-Source: ABdhPJzF4FhFZlghHCbK3ZU7Y+VshjC75Tt5gKCXubxLdvdRGZB+h+0y1ygWCnWkw1vUXqnqbKAl5g==
X-Received: by 2002:a19:814c:: with SMTP id c73mr5043801lfd.16.1597222736269; 
 Wed, 12 Aug 2020 01:58:56 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 132sm325676lfo.16.2020.08.12.01.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 01:58:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight
 properties
Date: Wed, 12 Aug 2020 10:58:48 +0200
Message-Id: <20200812085850.2643820-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- New patch as suggested by Sam.
---
 .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
new file mode 100644
index 000000000000..8ae7e3818b0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -0,0 +1,42 @@
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
+description: |
+  Backlight devices provide backlight for different types of graphical
+  displays. They are typically but not necessarilt implemented using a white
+  LED powered by a boost converter.
+
+properties:
+  default-on:
+    description:
+      The initial state of the backlight can be set to be on with this
+      property. This is a state applied by the operating system so that the
+      backlight is always turned on at boot.
+
+  default-brightness:
+    description:
+      The default brightness that should be applied to the LED by the operating
+      system on start-up. The brightness should not exceed the brightness the
+      LED can provide.
+    $ref: /schemas/types.yaml#definitions/uint32
+    minimum: 0
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/types.yaml#definitions/uint32
+    minimum: 0
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
