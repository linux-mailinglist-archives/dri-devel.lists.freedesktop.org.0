Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CD862951
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 07:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E3510E247;
	Sun, 25 Feb 2024 06:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="GoSIzfHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303B10E247
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:23:35 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id AA5FC6058D;
 Sun, 25 Feb 2024 06:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708842215;
 bh=bcaeFUlzEolaqkTe4eKeoi0fagdetTXYtJxwG2gBYug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GoSIzfHZB7rhE5Kkse2O5pH+lgYQqKMd2I76azhT6cGMy/CJ0XqC5soGKX2abqYJJ
 wi8Jxv3pgSRcT8wKvn4363K3Ydq4aOyG4hcw7MIJuh0y+5s9CUmRrr+ek11wUPGhTc
 NodQpv1dNv/M4uP/W1x7FITskQ4zsQiCEj8eSaGsfDrpMB0juG0pC7pPlekqKDfceg
 YsKH5L/adLbctPqpzLrPwASZuVxoIVAvI9W4WdRYEElFlfJmqvs6ixK8ew6O2Z+5lX
 DqoDOUxHH1JjK7sIm74viM6LqpQnY26Wxhlom0pI9WNItg+AE2xX8QEx/tL0yA+7/m
 T5HdkCYtK7DhA==
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
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 03/10] dt-bindings: display: bridge: tc358775: Add support
 for tc358765
Date: Sun, 25 Feb 2024 08:19:32 +0200
Message-ID: <20240225062008.33191-4-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240225062008.33191-1-tony@atomide.com>
References: <20240225062008.33191-1-tony@atomide.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358765 is similar to tc358775. The tc358765 just an earlier version
of the hardware, and it's pin and register compatible with tc358775 for
most part.

From the binding point of view the only difference is that the tc358765
does not have stdby-gpios.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../display/bridge/toshiba,tc358775.yaml         | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

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
@@ -89,6 +91,16 @@ required:
   - reset-gpios
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: toshiba,tc358765
+    then:
+      properties:
+        stby-gpios: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.1
