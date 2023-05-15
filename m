Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BE7032C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F5010E105;
	Mon, 15 May 2023 16:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209710E105
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:20:46 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 88585857D7;
 Mon, 15 May 2023 18:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684167643;
 bh=ontb/x9XZ0kw86B6BWIOYGU4b1G0OLncCYQ6sfzq2oM=;
 h=From:To:Cc:Subject:Date:From;
 b=e5/I6ZM3QKyGZ89NGohmDOZMQsh5f+bPakweKt3nhTPFjrOTMi4IsG8AlWbXYVdyG
 Id33jmoEWbUgs58ltdlwzaov8QxgIEZ0hk7EepNUV1sb9/no+GAvvMk1iEE8DhS0zz
 gFSKNdNOYpLIyuxMkd8a0RNFYIr/yG1gA8KRHRT+aavFUILj9XWAQcBSEMAHU7o01N
 aAaeVF72SDL0wfiVT2TT5+FgLw0zSVzvH6No9NaOXYUuI0kr0NzNGth67HTHkHv6vN
 5bKmQGgfWAgMQm4CLbUnpuj5WWDNtB+SY5oaXx//XZblOPCRmLdXIsNTEkk/RwlMb8
 2lD89RsL5tWJg==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: bridge: tc358867: Document
 TC358867/TC9595 compatible
Date: Mon, 15 May 2023 18:20:33 +0200
Message-Id: <20230515162033.66986-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358867/TC9595 devices are compatible with the predecessor TC358767.
Document compatible strings for the new devices, so they can be discerned
in board DTs. Update the title to match description in the process.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 .../bindings/display/bridge/toshiba,tc358767.yaml  | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index e1494b5007cba..0521261b04a9c 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -4,16 +4,24 @@
 $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358767.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Toshiba TC358767 eDP bridge
+title: Toshiba TC358767/TC358867/TC9595 DSI/DPI/eDP bridge
 
 maintainers:
   - Andrey Gusakov <andrey.gusakov@cogentembedded.com>
 
-description: The TC358767 is bridge device which converts DSI/DPI to eDP/DP
+description: |
+  The TC358767/TC358867/TC9595 is bridge device which
+  converts DSI/DPI to eDP/DP .
 
 properties:
   compatible:
-    const: toshiba,tc358767
+    oneOf:
+      - items:
+          - enum:
+              - toshiba,tc358867
+              - toshiba,tc9595
+          - const: toshiba,tc358767
+      - const: toshiba,tc358767
 
   reg:
     enum:
-- 
2.39.2

