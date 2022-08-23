Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0159E57E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD2410F610;
	Tue, 23 Aug 2022 14:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497A710E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:57:35 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so9953426otq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SoxR8vPzLaBakuJXKDdianHW1mSlEURniSqJ7NDAlUg=;
 b=aNIQOEHIExjCuh+owCTgMZIbyjDR7cT3eLJBl68GAme+Ba5acx3SxPgpaqsYd4e6wD
 DEFjhwXcxJ+uevrovVpUVWtRjCa0Hoc/oFponHU3Bn+5FcHDuJ6o0+XSXlWtwxFLh3m5
 Ab+Q3I9obLpdyizArB3cfARrw2P4zz6CUULnu4US+dfmHT1lju+LpHLgvoq1N687AW0z
 ytAIQhPGbxITivEqK7aR62Bz8akyWzK+z23g1xwatUFRQvf0RaZ3Ud4lR4qXIfYECC+q
 Cqec7XNlS4ih0M6vfTo155sGrDBaoVo9VbPueBsn+g4/KO85/geJNgyMMHJ+/taFZ//B
 PSFQ==
X-Gm-Message-State: ACgBeo0WhNqy1H95XP2Z9wW5U5YeYgWOHlT3ciF6daUyMuBYys/Aiaqv
 9Akjcim5dBiX7Dt9TyOfMA==
X-Google-Smtp-Source: AA6agR5N7GHMyhg7l4FvWbI4JGFC1eej18e7AwJEywr4KeELvJ0Jqd/978BcWS1D2O0v3c+0E/EU2w==
X-Received: by 2002:a05:6830:2646:b0:638:b172:92d5 with SMTP id
 f6-20020a056830264600b00638b17292d5mr9226824otu.75.1661266654515; 
 Tue, 23 Aug 2022 07:57:34 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display: adi,
 adv75xx: Add missing graph schema references
Date: Tue, 23 Aug 2022 09:56:43 -0500
Message-Id: <20220823145649.3118479-12-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DT bindings using the graph binding must have references to the graph
binding schema. These are missing from the adi,adv7511 and adi,adv7533
bindings, so add them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/adi,adv7511.yaml       | 14 ++++++--------
 .../bindings/display/bridge/adi,adv7533.yaml       | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
index f08a01dfedf3..5bbe81862c8f 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
@@ -117,23 +117,21 @@ properties:
 
   ports:
     description:
-      The ADV7511(W)/13 has two video ports and one audio port. This node
-      models their connections as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-      Documentation/devicetree/bindings/graph.txt
-    type: object
+      The ADV7511(W)/13 has two video ports and one audio port.
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
         description: Video port for the RGB or YUV input.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
       port@1:
         description: Video port for the HDMI output.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
       port@2:
         description: Audio port for the HDMI output.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
 # adi,input-colorspace and adi,input-clock are required except in
 # "rgb 1x" and "yuv444 1x" modes, in which case they must not be
diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index f36209137c8a..987aa83c2649 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -91,25 +91,23 @@ properties:
 
   ports:
     description:
-      The ADV7533/35 has two video ports and one audio port. This node
-      models their connections as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-      Documentation/devicetree/bindings/graph.txt
-    type: object
+      The ADV7533/35 has two video ports and one audio port.
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
         description:
           Video port for the DSI input. The remote endpoint phandle
           should be a reference to a valid mipi_dsi_host_device.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
       port@1:
         description: Video port for the HDMI output.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
       port@2:
         description: Audio port for the HDMI output.
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
 
 required:
   - compatible
-- 
2.34.1

