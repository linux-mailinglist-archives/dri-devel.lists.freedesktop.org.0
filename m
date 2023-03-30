Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D66D0075
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72210ED90;
	Thu, 30 Mar 2023 10:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCF010ED86
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:59:51 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 493E420F59;
 Thu, 30 Mar 2023 11:59:48 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org
Subject: [PATCH v1 2/6] dt-bindings: display: bridge: toshiba,
 tc358768: Add TC9594
Date: Thu, 30 Mar 2023 11:59:37 +0200
Message-Id: <20230330095941.428122-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330095941.428122-1-francesco@dolcini.it>
References: <20230330095941.428122-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add TC9594, from the software point of view this is identical to
TC358768 with the main difference being automotive qualified.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index d6dac186ac59..8f22093b61ae 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Toshiba TC358768/TC358778 Parallel RGB to MIPI DSI bridge
+title: Toshiba TC358768/TC358778/TC9594 Parallel RGB to MIPI DSI bridge
 
 maintainers:
   - Peter Ujfalusi <peter.ujfalusi@ti.com>
 
 description: |
-  The TC358768/TC358778 is bridge device which converts RGB to DSI.
+  The TC358768/TC358778/TC9594 is bridge device which converts RGB to DSI.
 
 properties:
   compatible:
     enum:
       - toshiba,tc358768
       - toshiba,tc358778
+      - toshiba,tc9594
 
   reg:
     maxItems: 1
-- 
2.25.1

