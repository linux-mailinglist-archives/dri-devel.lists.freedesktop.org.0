Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A894A701D1F
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 13:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F77310E0BB;
	Sun, 14 May 2023 11:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD2910E0BB
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 11:46:47 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19175d270b4so2674100fac.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684064804; x=1686656804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YYMgM1UG9vHyy8j7GTdo+T8BZbiGNcbzAlQuk3viKtY=;
 b=pm5mCdaHvhWHkkE4KuQx3zc40GrEVka+HnFlOY2pcBqBYVBzWZBZCM3b2JA8QmJXQ8
 WtyfWC2zLbSmY2ClFvfm+bqFT3V+rrVjKVEwu8fvz3Rn8eujrYbYV8osf799wXxFu96J
 I7n0gDifAf1oexRfM/gPz8R346ZU8Oo25aCHpeSKePPirSiTM9tXOcmpVnMaZ5DXKFc5
 W5xHJQqec7g83scTgixR7ZaCnG/SBgSf+xuz0kCOs/LIuUvVJAvJECpbmzmbkD4l7B3D
 c297OUr8mKvgzrLqGeXiO4fRNWnHiGJsih1QXM7Li5CWyNh9glgnbIuyXvF54DVTm18A
 CHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684064804; x=1686656804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYMgM1UG9vHyy8j7GTdo+T8BZbiGNcbzAlQuk3viKtY=;
 b=HYMvXNZHmw97S7Eu0H74qXvQKBcxp/lpIP6dbiZQwAMXMN/Rp6I+LMNpTg9HZNnoiH
 mxMdCoqZ8SR8tK4b5YJzOLyT3iGqRukhke6MdwPW/vjc6vS2u1wsa/A7hSeNJl54jUuC
 rjkj6P8u8ZCGJmR/sCdCUXthAT5AjXOV1AfaLMS7M2+2620SS/kfLxocOuF8lY8b9QTs
 9EHfqnYjKhPy9zwjX11ic5Pz74SRCzlqcQ97nLATKQxs72lHWombnA5f36nnrsGWrS1n
 JhCmiQmG/v8ruUajw/eNJbUNQwWzKKTXxUjXJQOxTQC+zmPs3KVLb6DqtOaUwk3JnrPP
 4q7w==
X-Gm-Message-State: AC+VfDyRCZNiYjpIhXX+co4W4/u3+sE3Z4bOUv2erR9HQXhWL1tqzpp7
 Fm0U9M0f51Ixl7l7cOEQevc=
X-Google-Smtp-Source: ACHHUZ7cS0FBBYrkayKeycO/W1M41xYZI4loqjVINJGFLdLRYonAPrzQ9JM9x/0hNSBa1APOXykHgw==
X-Received: by 2002:a4a:b4c1:0:b0:54f:d702:a405 with SMTP id
 g1-20020a4ab4c1000000b0054fd702a405mr6286372ooo.1.1684064804544; 
 Sun, 14 May 2023 04:46:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:804:1822:9c47:e4e6])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a4ae559000000b0051134f333d3sm9961242oot.16.2023.05.14.04.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 04:46:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v4 1/2] dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'
Date: Sun, 14 May 2023 08:46:24 -0300
Message-Id: <20230514114625.98372-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The Samsung DSIM IP block allows the inversion of the clock and
data lanes.

Add an optional property called 'lane-polarities' that describes the
polarities of the MIPI DSI clock and data lanes.

This property is useful for properly describing the hardware when the
board designer decided to switch the polarities of the MIPI DSI
clock and/or data lanes.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Dropped oneOf, no need for it. (Krzysztof)
- Dropped description as it is obvious. (Krzysztof)
- Dropped items, as it is already in video-interfaces. (Krzysztof)
- Dropped "See ../../media/video-interfaces.yaml". (Krzysztof)

 .../display/bridge/samsung,mipi-dsim.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index e841659e20cd..9f61ebdfefa8 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -105,6 +105,29 @@ properties:
           DSI output port node to the panel or the next bridge
           in the chain.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                uniqueItems: true
+                items:
+                  enum: [ 1, 2, 3, 4 ]
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+                description:
+                  The Samsung MIPI DSI IP requires that all the data lanes have
+                  the same polarity.
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
 required:
   - clock-names
   - clocks
-- 
2.34.1

