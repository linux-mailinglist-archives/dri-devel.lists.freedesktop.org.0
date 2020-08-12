Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02924271E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365836E0EB;
	Wed, 12 Aug 2020 08:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD6A6E0EB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:59:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v9so1369645ljk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r3OkcCRL7MqoBL5xlT//nFVOTrvwkEqxrrABannpZUk=;
 b=viBOK34vTfDKsrR+xt3ygb+l9eq6m1AdCnrWwi6eVuJtpRgu3PZx2QLv2oh3vpDuLY
 m6o7ISyRqr3b8U/phrDB11xintLMnuYwkcfiV6HOoXxX+9AB+sRHgQiVL/GoLGVauGuV
 eMojLcq3AwEbmJVkEgM6WbgzVsJjpzocYSm1e6PlXWpTJgIY0+sTSPBgqDn5mv7nSa2t
 KOLQH71Zem5nq5UHvCrIWWoquss/cU3MovJHLwijnrW7Og38TSyjXgbKb1n1oyMxHcFN
 Y5Px1rfKFKFE5bXniCz5sn9ksCoPr01UwJfApeCFFqElUIJ3L83FLb3b4FAcOptSdu3d
 rPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3OkcCRL7MqoBL5xlT//nFVOTrvwkEqxrrABannpZUk=;
 b=hKUC5WizqkqJb18D8itoNsS8EzWmXLno1YDiPWtH37jhz5DpJ4mNEqSsfh9BgltnA6
 kZs2UJ0a4hp1HN/cpDkT7oY2+GcKncd/k5x3njIg38RkF/0EwDa7Xf0ec0m81GVPBKs1
 L1frlSr9nDihkUHCze5JBiT5rSlzq4gVV14DerLXZFgdaYmkGaDZBj5ihgAD3uq7QjTH
 ndysXRxCXz4tp0JjGoNob/RtxbNL1alSw2atGwte/oumlofCNvSCbX237fV/FKwD6yKo
 oWeQQFQMSMvgYbMZJBfJe6/k1SOVu35qHOvqFSnwXyhfnAg/18Od9Hzn8pED/haGSH0X
 Y9jw==
X-Gm-Message-State: AOAM530pUEQ0tWcgWu/7DEKJnkQi/81reqjy/R5GILx9u49scHdxMGSQ
 UBK0tqHSDA7y+ApdEmvnlvtYKA==
X-Google-Smtp-Source: ABdhPJylmCLkSU4B+1axzBLT+omZduMnxFTxK6z1UpJm5jeIGGXgoNolQRVC4TPIwNP1vM30nO0JRw==
X-Received: by 2002:a05:651c:2007:: with SMTP id
 s7mr4581626ljo.74.1597222739347; 
 Wed, 12 Aug 2020 01:58:59 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 132sm325676lfo.16.2020.08.12.01.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 01:58:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3 v2] dt-bindings: backlight: Add Kinetic KTD253 bindings
Date: Wed, 12 Aug 2020 10:58:49 +0200
Message-Id: <20200812085850.2643820-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
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

This adds device tree bindings for the Kinetic KTD253
white LED backlight driver.

Cc: devicetree@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Create common.yaml for backlight as suggested by Sam and
  use that.
- Rename the GPIO line "enable-gpios"
---
 .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
new file mode 100644
index 000000000000..e17f45a2a6bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD253 one-wire backlight
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Kinetic Technologies KTD253 is a white LED backlight that is
+  controlled by a single GPIO line. If you just turn on the backlight
+  it goes to maximum backlight then you can set the level of backlight
+  using pulses on the enable wire. This is sometimes referred to as
+  "expresswire".
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktd253
+
+  enable-gpios:
+    description: GPIO to use to enable/disable and dim the backlight.
+    maxItems: 1
+
+  default-on: true
+  default-brightness: true
+  max-brightness: true
+
+required:
+  - compatible
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+        compatible = "kinetic,ktd253";
+        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+        default-on;
+        default-brightness = <160>;
+    };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
