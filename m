Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BAA5EB5F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 01:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5410E1A2;
	Mon, 26 Sep 2022 23:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F61310E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 23:45:16 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9686E84BEF;
 Tue, 27 Sep 2022 01:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664235914;
 bh=C8gWIDs4Jz5cItlEC5PdGI7V8drgK9GC2bW5sHDcyZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=v1Z6T9uaBNPppQ/epfPscPQTDY0JANoqvraXOQRxfFfjeegZqOUAjIf8F7kC6BsVk
 x+vN94AmrhB+JB47OEz+/w/dBuGfCATnmOxQoN+Zfub8T1zYoOvSu2krYnYiA5WfCo
 76ZhezfE4prgnxANWhOmBYg3RcVsmhqZ1lMXgQK7dvHy4Sjd0RHO1ojx7KPrY0nOMt
 +jtksQYd0pYEB0DyWfGW1eRyGMZTaoWs6Xve0lRNQGkPwkIVBaoI/FiTwhm2g4OQ+a
 lZxcVYAp0pOiRYMfa+Df2FwrvtQpKDbk4TAnU2/GQW8qAWxJgpnnwvpR8il2gs1Ih0
 HYFIWt8pa0v9g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: display: st,
 stm32-dsi: Handle data-lanes in DSI port node
Date: Tue, 27 Sep 2022 01:45:01 +0200
Message-Id: <20220926234501.583115-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle 'data-lanes' property of the DSI output endpoint, it is possible
to describe DSI link with 1 or 2 data lanes this way.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../bindings/display/st,stm32-dsi.yaml          | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index 54f67cb510401..c488308d7be13 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -58,9 +58,20 @@ properties:
           DSI input port node, connected to the ltdc rgb output port.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          DSI output port node, connected to a panel or a bridge input port"
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          DSI output port node, connected to a panel or a bridge input port.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
 
 required:
   - "#address-cells"
-- 
2.35.1

