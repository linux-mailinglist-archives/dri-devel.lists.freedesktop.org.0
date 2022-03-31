Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FA4EDCA4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6304B10EF2D;
	Thu, 31 Mar 2022 15:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442310E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:20:30 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3287B84209;
 Thu, 31 Mar 2022 17:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648740028;
 bh=XymdZgX3emEDbPcK4wVbbrzz9EvWDkqbUXRJyyvTkGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IHglLxJm9FpK/NIYG8hJsSjtglDEzc32ZGB4szoSs5cDyLOGHi9SQcqJavjvsjbql
 teR9GPRqL94gbA3NuMS8xP0Kgr/ayeb43Exf+WZoyOVo1GHKEAf1s4m6pElR0EQDFK
 l93LA+PsTYTGdna/5+zYm/iBDbiDOhEKL8mL1mQXILuuqL/5lR8wy+grZucA8WkHN9
 oQH4vCXS8pMKizDL+We+HB6rFJyRPax3OEoonwpGUpWlm60QMFGExRb1DqtmqyUaJJ
 KveL8VQKkFobnHhJA+5saeH3NhoYwnZLyuk3xH53gtThp2IgpzLLi/FKPf0sMpjh0j
 MObeEbIQKzx+Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 02/11] dt-bindings: display: bridge: tc358867: Document DSI
 data-lanes property
Date: Thu, 31 Mar 2022 17:19:43 +0200
Message-Id: <20220331151952.13221-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331151952.13221-1-marex@denx.de>
References: <20220331151952.13221-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is necessary to specify the number of connected/used DSI data lanes when
using the DSI input port of this bridge. Document the 'data-lanes' property
of the DSI input port.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V3: - New patch
V4: - Add RB by Rob, AB/TB by Lucas
V5: - No change
V6: - No change
---
 .../display/bridge/toshiba,tc358767.yaml       | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index 5cfda6f2ba69..ed280053ec62 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -53,11 +53,27 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: |
             DSI input port. The remote endpoint phandle should be a
             reference to a valid DSI output endpoint node
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: |
-- 
2.35.1

