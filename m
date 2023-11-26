Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A17F93F2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 17:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706C10E129;
	Sun, 26 Nov 2023 16:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 329 seconds by postgrey-1.36 at gabe;
 Sun, 26 Nov 2023 16:39:15 UTC
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BDB10E130
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 16:39:15 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 19C386044A;
 Sun, 26 Nov 2023 16:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701016425;
 bh=71ibKMM9DOpdFN+a6X/3dcd9slUwLcDlPWzmSrWFgV0=;
 h=From:To:Cc:Subject:Date:From;
 b=lSnz8z8xKloMjctrV+6oAOGgUr4m6GCC2n2O9iAgoVuhbmkUd8ca/Cyykaykwjt1K
 QwLD3o8y9ekMGVIzJah5C7ummdcMULRvG90ynyTeULkJBbwZxVwTPWJnaaFBiLJa+w
 oQ03uc2ZH6G2QdSd+jZBZRUDSt+vaew/72iKJmj9+CUwaqMWU1IHcN8ZijoUgKENJd
 pSXAHX91sTLUO/IkF5sgoQA19dlL1EaRJj3SwY6QKWb4zzAFC8MCbDkcR9VzcHeH7V
 zqkNJkLMknptGhil1wYDPc5G9pjTHZ9HJsqBnosYuwskR45PifY6Wm9QVL6k6lNKXr
 j3EVN2PnuWDjA==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>
Subject: [PATCH 1/6] dt-bindings: tc358775: Add support for tc358765
Date: Sun, 26 Nov 2023 18:32:36 +0200
Message-ID: <20231126163247.10131-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358765 is similar to tc358775 except for the stdby-gpios.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../display/bridge/toshiba,tc358775.yaml        | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Vinay Simha BN <simhavcs@gmail.com>
 
 description: |
-  This binding supports DSI to LVDS bridge TC358775
+  This binding supports DSI to LVDS bridges TC358765 and TC358775
 
   MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.
   Video frame size:
@@ -21,7 +21,9 @@ description: |
 
 properties:
   compatible:
-    const: toshiba,tc358775
+    enum:
+      - toshiba,tc358765
+      - toshiba,tc358775
 
   reg:
     maxItems: 1
@@ -70,12 +72,21 @@ required:
   - reg
   - vdd-supply
   - vddio-supply
-  - stby-gpios
   - reset-gpios
   - ports
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: toshiba,tc358775
+    then:
+      required:
+        - stby-gpios
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.42.1
