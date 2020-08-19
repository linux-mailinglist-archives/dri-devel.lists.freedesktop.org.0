Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA524A806
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2B16E81E;
	Wed, 19 Aug 2020 20:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1B16E81E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:52:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v12so26899492ljc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klnwjmccKXa83diz/UPM1wfkPLBuKxflt6KGqDpoJIA=;
 b=iqx9MNXuK9IoffrzNcqTU41PFdUMB91XH71inx1n2Tiz4S5KKqLMmBMh2CkqU+HxTK
 2NodYjaUeQBcdmgPNeWEwyUgePGIoo5qWkdmI7x0ITRwV6yUIEGHVWLHPYm62g1ZfgLe
 06BETNmHkSkmN1fZ6q8o4fzGgUNIZJAy1/dXU64TqjyuQrZsTsYxx8ivEJzwYQ+IKi7W
 1U/sU1KgFu84MyeJkOJN/3VzwhW2LKAKn5Pm/Gv/2HN9RkMAPa7KApzb6AN0I3yx760B
 D9YYJByO495l8YChELhS10ikO2fb6z5pFV1FbppTFHLDj6Cfqk5nW0CeZu7QqcwaClmK
 DveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klnwjmccKXa83diz/UPM1wfkPLBuKxflt6KGqDpoJIA=;
 b=P9vL4rdLdNjSq56f0ju1v+O41OoCWOVcETGDu/WzCKxQolzDfjcJXVlFxc7hE/INqF
 rEpuFasc1iyUZm59TJ3W7ewBiWPlHwtXU/cT7cQIAN3HqyndOVD2HsmggmLjqzZ+uwnE
 Qs1mjhI+jbphYu+2uhHjqBGrrayrl64UjOL1EUXnZmeUmDbABMybhz3e4bJOQ2uh0iLP
 nrSxYnwIvgGW3oeXuM8cPHkbdk+g0m8tPheqP0Gfas9CN4iJ3COGMvpjygYyLRHGeeHZ
 YuHrrW/vEGj+MP/Y50CGsml9YaQ+plS+TwN0NVuL9jI1cn3s4+K+NM0Vb8/VJwDgSZs9
 /u7A==
X-Gm-Message-State: AOAM533VvQBs+x/OPqs5rfTOr8G2Tf7q/P9EQBGIJpIOj7fgtuTI3Lij
 IXYJSTST6msTVo2kNS6FVWO7u0belKNryw==
X-Google-Smtp-Source: ABdhPJzuqHZGPimvmmxbFVWte7D1lk3H6Rdx+S0uh8xMtn50T9AblBCDe5+0zwHi+dkUD38DwYY2ew==
X-Received: by 2002:a2e:531c:: with SMTP id h28mr33256ljb.322.1597870322914;
 Wed, 19 Aug 2020 13:52:02 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id u10sm8188lfo.39.2020.08.19.13.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 13:52:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253 bindings
Date: Wed, 19 Aug 2020 22:51:49 +0200
Message-Id: <20200819205150.164403-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
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
ChangeLog v2->v3:
- Drop the pointless cargo-culted "default-on" property that
  we were not using
- Correct the brightness in the example to something legal (13)
ChangeLog v1->v2:
- Create common.yaml for backlight as suggested by Sam and
  use that.
- Rename the GPIO line "enable-gpios"
---
 .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
new file mode 100644
index 000000000000..7a6ec1f8c0f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
@@ -0,0 +1,46 @@
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
+        default-brightness = <13>;
+    };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
