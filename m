Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2DE759969
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7BF10E4C6;
	Wed, 19 Jul 2023 15:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D010E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:20:15 +0000 (UTC)
Received: from johnny.home (unknown
 [IPv6:2a01:e0a:212:79f0:c8e5:afad:333a:7f73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: aferraris)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2680E6607077;
 Wed, 19 Jul 2023 16:20:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689780014;
 bh=o+UZAawV5YW/vKFS1gqhCqE6/EXE+vV8rUmdTLCnBso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OdlQNVCiKaKkqpBWViPt+EVLVscsk+itHhxODWqD+B/golXYVpzkQxcJePL6tDiNi
 sCiNvDawOyE+Yc2mUOenhhn9DK5ix/HwVxo6KzjPLDjr6hyn9J69ATBgDkXU4YoW1V
 Y+o6Ivb2WKhKOnhws6VUekQ0+XFiVHrOVpsoPaoESoYhVBGVmHIeqdh3fvjrl8wJVr
 0m8Km7gRKnq9McIV5Ogngd8GbSx1akXvOIMTw6P4jAIRtq3qTfCqld8fCrVahWq4a/
 5/f1EArPZd//gyggVtAPppZWdjlxRKuXRUfm+vyVq7m2ZdKs+LPqgAU/h9kwAYM1Sz
 Nh0jPGowznX3w==
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2 RESEND] dt-bindings: display: panel: Add Novatek
 NT35596S panel bindings
Date: Wed, 19 Jul 2023 17:20:06 +0200
Message-Id: <20230719152007.197710-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
References: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
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
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Molly Sophia <mollysophia379@gmail.com>

Add documentation for "novatek,nt35596s" panel.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v5:
- Move changelog out of commit message.
- Wrap header comment block lines around 80 chars.

Changes in v4:
- No change.

Changes in v3:
- Embed the support into existing driver (panel-novatek-nt36672a), as
  these two IC are similar with different initialization commands.

 .../display/panel/novatek,nt36672a.yaml       | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index ae821f465e1c..53b9e771af56 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -20,14 +20,21 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,fhd-video
-      - const: novatek,nt36672a
+    oneOf:
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a
+
     description: This indicates the panel manufacturer of the panel that is
-      in turn using the NT36672A panel driver. This compatible string
-      determines how the NT36672A panel driver is configured for the indicated
-      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+      in turn using the NT36672A or the NT35596S panel driver. This compatible
+      string determines how the panel driver is configured for the indicated
+      panel.
 
   reset-gpios:
     maxItems: 1
-- 
2.40.1
