Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B530CD5F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 21:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0689CCB;
	Tue,  2 Feb 2021 20:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9989CCB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 20:55:53 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id g69so24274989oib.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 12:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WKE/3EQ/xJ6AJH5xmJE9YBaYDJN1xjVTBGt+kvQ65Y=;
 b=fbJgMAf0bo4m1u8bcdA+qSQ8EhwxVqowYqp8q+Xzld/yV9UzBbaVrqYRQ5TGJ+ld3m
 DBFYGEMj9RTZQSB5G4yeWqpMuQBpQI1YHpBtpMSE10xXunzYnTYrJ5QelJVuoBwps5LM
 4L3G4q2dw83GFoeqjB0cE/n5fD1E7saROUfxSW48UtHONS91TXfEBHFkVUB13PXOB5SE
 ro+tP5fQv8Re648m2merKkBvCKUMdkUpeIxud9GgI00bbMPCpQEfaLSnMC3xVQp3Z31p
 yuyZWVABXj02wVFdUuJ+ZSdhe/YPNg4cLtFfPas4QdJwqwPFMCZVogQF1OyJ362uN9gT
 Aetg==
X-Gm-Message-State: AOAM531WQ4Bu+2DUXTd+xUsCwUM06AhSgAo1w0DgcoU9jTfTqBK9Vnv7
 VSJ5O++djV9PNX4LXYGzbg==
X-Google-Smtp-Source: ABdhPJypjDN+Ts39JWA5K5FwFDZxnlgjEBltLJwzpuZeV8Gkh6PNkOJl8PkeKNKnT1CjwRFOWOyTZg==
X-Received: by 2002:aca:dc07:: with SMTP id t7mr4037098oig.15.1612299353146;
 Tue, 02 Feb 2021 12:55:53 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id k15sm4206otp.10.2021.02.02.12.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:55:52 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
Date: Tue,  2 Feb 2021 14:55:44 -0600
Message-Id: <20210202205544.24812-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Andrew Jeffery <andrew@aj.id.au>,
 Vincent Cheng <vincent.cheng.xh@renesas.com>, dri-devel@lists.freedesktop.org,
 Tali Perry <tali.perry1@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Joerg Roedel <joro@8bytes.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 linux-gpio@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properties in if/then schemas weren't getting checked by the meta-schemas.
Enabling meta-schema checks finds several errors.

The use of an 'items' schema (as opposed to the list form) is wrong in
some cases as it applies to all entries. 'contains' is the correct schema
to use in the case of multiple entries.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-crypto@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml   | 3 +--
 .../devicetree/bindings/display/brcm,bcm2835-hvs.yaml    | 2 +-
 Documentation/devicetree/bindings/leds/ti,tca6507.yaml   | 1 +
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml  | 2 +-
 Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml | 3 +--
 .../devicetree/bindings/phy/renesas,usb2-phy.yaml        | 5 ++---
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml         | 9 ++++-----
 .../bindings/timer/allwinner,sun5i-a13-hstimer.yaml      | 3 +--
 8 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
index 7a60d84289cc..6ab07eba7778 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
@@ -46,8 +46,7 @@ properties:
 if:
   properties:
     compatible:
-      items:
-        const: allwinner,sun50i-h6-crypto
+      const: allwinner,sun50i-h6-crypto
 then:
   properties:
     clocks:
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index e826ab0adb75..2e8566f47e63 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -36,7 +36,7 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs"
+        const: brcm,bcm2711-hvs
 
 then:
   required:
diff --git a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
index 94c307c98762..32c600387895 100644
--- a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
@@ -69,6 +69,7 @@ patternProperties:
 if:
   patternProperties:
     "^gpio@[0-6]$":
+      type: object
       properties:
         compatible:
           contains:
diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 6bbf29b5c239..6c13703b31db 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -123,7 +123,7 @@ required:
 if:
   properties:
     compatible:
-      items:
+      contains:
         enum:
           - renesas,sdhi-r7s72100
           - renesas,sdhi-r7s9210
diff --git a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
index 58c3ef8004ad..04edda504ab6 100644
--- a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
@@ -99,8 +99,7 @@ patternProperties:
 if:
   properties:
     compatible:
-      items:
-        const: brcm,iproc-ns2-sata-phy
+      const: brcm,iproc-ns2-sata-phy
 then:
   properties:
     reg:
diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 829e8c7e467a..0f358d5b84ef 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -81,9 +81,8 @@ properties:
 if:
   properties:
     compatible:
-      items:
-        enum:
-          - renesas,usb2-phy-r7s9210
+      contains:
+        const: renesas,usb2-phy-r7s9210
 then:
   required:
     - clock-names
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 5b5b1b9d2ec7..5d3947902f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -76,11 +76,10 @@ required:
 if:
   properties:
     compatible:
-      items:
-        enum:
-          - renesas,pfc-r8a73a4
-          - renesas,pfc-r8a7740
-          - renesas,pfc-sh73a0
+      enum:
+        - renesas,pfc-r8a73a4
+        - renesas,pfc-r8a7740
+        - renesas,pfc-sh73a0
 then:
   required:
     - interrupts-extended
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
index 40fc4bcb3145..b6a6d03a08b2 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -46,8 +46,7 @@ required:
 if:
   properties:
     compatible:
-      items:
-        const: allwinner,sun5i-a13-hstimer
+      const: allwinner,sun5i-a13-hstimer
 
 then:
   properties:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
