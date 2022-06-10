Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D21546E8B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8EE113DFA;
	Fri, 10 Jun 2022 20:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158F1113DFA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:40:49 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id v7so189267ilo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 13:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nAvb3P2a4wY9hENy4s31EHxLoq20t7wJfzc0k0RgVzg=;
 b=CSoxc3W1NTSv6bUx812mrgPPzgpihnFLoNctn9fgEjKiwr+ZNL3vNScT7F6YpFI9ky
 6SfnPadUlTNsKmYibagNUJjL7GQS4vVtVUA17LKg3EViaxcPu245z4QFEiJyFTJiLamq
 rU5TIDDmWozA5zZBxlqgiwMx5cVHUc0zXLxUrFJGbOPbO4hH1RWnpH9ejzIVZqu9yaMe
 zBOFS5jcbnikU70FevFpfzW1QRVRntuTobiCUK7wUlAlsdzq7O1FhzuKUG44UwYxj7lE
 7kVdkyaz3OBooKtEzkNERCC2poJT/rnUG5Nx64dGgHA8tndjn2Eil+7z2WeWZ9ErK4Ao
 UlTA==
X-Gm-Message-State: AOAM530AsJY3aaP9zjCNySc8+D8j3BmLbATqUjEyiS3TGGaYdxN9C56V
 rLZ9EXD5WpG9OAUrEaN79g==
X-Google-Smtp-Source: ABdhPJwZ9K+rp8XDD+tCC6aqdUSu0IC1lm7lUFxEz2sIOi9p74vhZUp78IrbD4m/aSzN6nklbR8iMw==
X-Received: by 2002:a05:6e02:1c88:b0:2d1:87ea:18c with SMTP id
 w8-20020a056e021c8800b002d187ea018cmr26193110ill.321.1654893648351; 
 Fri, 10 Jun 2022 13:40:48 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
 by smtp.googlemail.com with ESMTPSA id
 x15-20020a02908f000000b0032e8c565e12sm23772jaf.109.2022.06.10.13.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 13:40:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] dt-bindings: display: panel-simple: Add Arm virtual platforms
 display
Date: Fri, 10 Jun 2022 14:38:18 -0600
Message-Id: <20220610203818.2193593-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
The binding has been in use for a long time, but was never documented.

Some users and an example have a 'panel-dpi' compatible, but that's not
needed without a 'panel-timing' node which none of the users have since
commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
example does have a 'panel-timing' node, but it should not for the
same reasons the node was removed in the dts files. So update the
example in arm,pl11x.yaml to match the schema.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/arm,pl11x.yaml           | 15 +-------------
 .../bindings/display/panel/panel-simple.yaml  | 20 +++++++++++++------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.yaml b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
index b545c6d20325..6cc9045e5c68 100644
--- a/Documentation/devicetree/bindings/display/arm,pl11x.yaml
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
@@ -159,25 +159,12 @@ examples:
     };
 
     panel {
-        compatible = "arm,rtsm-display", "panel-dpi";
-        power-supply = <&vcc_supply>;
+        compatible = "arm,rtsm-display";
 
         port {
             clcd_panel: endpoint {
                 remote-endpoint = <&clcd_pads>;
             };
         };
-
-        panel-timing {
-            clock-frequency = <25175000>;
-            hactive = <640>;
-            hback-porch = <40>;
-            hfront-porch = <24>;
-            hsync-len = <96>;
-            vactive = <480>;
-            vback-porch = <32>;
-            vfront-porch = <11>;
-            vsync-len = <2>;
-        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 21ba90c9fe33..97afd276c54a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -19,9 +19,6 @@ description: |
 
   If the panel is more advanced a dedicated binding file is required.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
 
   compatible:
@@ -35,6 +32,8 @@ properties:
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
       - ampire,am800480r3tmqwa1h
+        # Arm, Ltd. Virtual Platforms Display
+      - arm,rtsm-display
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
       - auo,b101aw03
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
@@ -340,9 +339,18 @@ properties:
 
 additionalProperties: false
 
-required:
-  - compatible
-  - power-supply
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      # Most 'simple' panels must have a single supply, but a virtual display does not
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,rtsm-display
+    then:
+      required:
+        - power-supply
 
 examples:
   - |
-- 
2.34.1

