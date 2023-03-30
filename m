Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F246D0064
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AB010ED9A;
	Thu, 30 Mar 2023 09:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D44B10ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:59:50 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C49C320F5A;
 Thu, 30 Mar 2023 11:59:48 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: display: bridge: toshiba,
 tc358768: add parallel input mode
Date: Thu, 30 Mar 2023 11:59:38 +0200
Message-Id: <20230330095941.428122-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330095941.428122-1-francesco@dolcini.it>
References: <20230330095941.428122-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add new toshiba,input-rgb-mode property to describe the actual signal
connection on the parallel RGB input interface.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../bindings/display/bridge/toshiba,tc358768.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index 8f22093b61ae..2638121a2223 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -42,6 +42,21 @@ properties:
   clock-names:
     const: refclk
 
+  toshiba,input-rgb-mode:
+    description: |
+      Parallel Input (RGB) Mode.
+
+      RGB inputs (PD[23:0]) color arrangement as documented in the datasheet
+      and in the table below.
+
+      0 = R[7:0], G[7:0], B[7:0]
+      1 = R[1:0], G[1:0], B[1:0], R[7:2], G[7:2], B[7:2]
+      2 = 8’b0, R[4:0], G[5:0], B[4:0]
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2 ]
+    default: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.25.1

