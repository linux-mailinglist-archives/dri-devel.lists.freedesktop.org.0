Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703AAB4850E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B810E1D3;
	Mon,  8 Sep 2025 07:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="aC4h2Z1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Sun, 07 Sep 2025 23:24:22 UTC
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F248310E249
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757287099; x=1757546299;
 bh=m8uu3f2om0ehU8+WF4ls+SioKYV8FyIDb8bJA/kvdf4=;
 h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=aC4h2Z1Dhyz3ecbn62NbT4efSAyZgPUA7nGKYjCM/MHCubPuc8ZgvNdgD7AmdrXvN
 nox1qVmCLGYnpfQ7hg3quQUTFquRuIR863T22O/cpgJIuZ4ugtuYRbUiTSvWwP7dzu
 Ur0eJpDGLG8LMA10p7DvnP7bRobpAoWSLw0P8DQCaeJJ9zdoRlqFyQ+iFvfYiGgmxq
 RjO+Gr73zS9ru87z7l/mcBswEWXzI/Ra+yhU/TWXdXa700Z9vOxTTXEfpb/lnYs+Lo
 1c52bmkP4aZUAS6BJLPEF22z3UHAmgMfYt0G4YYHwcOykQNQsdMTuuM6pvXE6Nzy1P
 0P4oIT/fx6HkA==
X-Pm-Submission-Id: 4cKmGf2ggLz1DF4H
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 01:18:04 +0200
Subject: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-leds-v3-2-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
In-Reply-To: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=s+EPK0JKM0Hb9Ko/RlfZn+9aGDfCgguChkOaX7vEQXs=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7hLY23RD0f8ebnTXhvB5rrsre3TLWnEmfmV6vOlsSd
 CdOqGlqRykLgxgXg6yYIkv3n69pXYvmrmW4rvENZg4rE8gQBi5OAZhI5kuG//Ee2lOfXead0X7l
 YtTP+O8M85vZmC9tehRzTtuBy0ty5yNGhr3LHplv/bhr41e5OcZBc040sTWf+WtgYOq85O7k5Ok
 TH7ECAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Mailman-Approved-At: Mon, 08 Sep 2025 07:25:13 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of existing schemas use 'leds' property to provide
phandle-array of LED(s) to the consumer. Additionally, with the
upcoming privacy-led support in device-tree, v4l2 subnode could be a
LED consumer, meaning that all camera sensors should support 'leds'
and 'led-names' property via common 'video-interface-devices.yaml'.

To avoid dublication, commonize 'leds' property from existing schemas
to newly introduced 'led-consumer.yaml'.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/backlight/led-backlight.yaml         | 6 +-----
 Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 5 +----
 .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
index f5554da6bc6c73e94c4a2c32b150b28351b25f16..8fc5af8f27f9eb95b88eeeee32ad4774f5f21106 100644
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -23,11 +23,7 @@ properties:
   compatible:
     const: led-backlight
 
-  leds:
-    description: A list of LED nodes
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
+  leds: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..5c9cfa39396b0ba89830e520ade108bfd1a3f12e 100644
--- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -17,10 +17,7 @@ properties:
   compatible:
     const: leds-group-multicolor
 
-  leds:
-    description:
-      An aray of monochromatic leds
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+  leds: true
 
 required:
   - leds
diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index cf7712ad297c01c946fa4dfdaf9a21646e125099..703bbc9960dd6bc68baff4f300c77813f5ccd37f 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -17,6 +17,14 @@ properties:
       An array of phandles, each referring to a flash LED, a sub-node of the LED
       driver device node.
 
+  leds:
+    minItems: 1
+    maxItems: 1
+
+  led-names:
+    enum:
+      - privacy-led
+
   lens-focus:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.48.1

