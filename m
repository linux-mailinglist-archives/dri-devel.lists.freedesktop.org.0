Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE085087A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 10:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AC610E562;
	Sun, 11 Feb 2024 09:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="Tn5UW8bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885B410E562
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 09:55:10 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id B1C176049B;
 Sun, 11 Feb 2024 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707645310;
 bh=CwqiIpG7rYPYfbTg8tnzX5Qs6UopiwlyCwou8+sg1r4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tn5UW8bMULvWRDxQoJ2jOi9+uKinFkd8TGAOYZeT1PW57AqMNV6HZ5QUbuGz5wTD5
 FErrgHYyRB2UI5BhsoLwcy01yYgSrMPuI1QNi6eqHbSKtuENPpmSFuBA6Njuk0KmIr
 z3FZymu7Yd5ORc4sHnMBN85IEinCz2xxTQkShEwWRROBDjWlB766Q1I5PX/LQ53fja
 6r3cB2H53NJrAYHZG9c5h5K/Kud+b8bDbSH/bbhm6bYDLzsvp8PYd5LrzkiE0uHqlC
 AY0JUQrhhUs6q4zjqAiYsKSlh/wfgeQ8aSsJD30CCZO0s5PmA277PahpYDjr6KNSAX
 NMpT+qNaIFZ/A==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add support
 for tc358765
Date: Sun, 11 Feb 2024 11:51:08 +0200
Message-ID: <20240211095144.2589-4-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240211095144.2589-1-tony@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../bindings/display/bridge/toshiba,tc358775.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

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
@@ -81,6 +83,15 @@ properties:
       - port@0
       - port@1
 
+allOf:
+  - if:
+    properties:
+      compatible:
+        contains:
+          const: toshiba,tc358765
+    then:
+      stby-gpios: false
+
 required:
   - compatible
   - reg
-- 
2.43.0
