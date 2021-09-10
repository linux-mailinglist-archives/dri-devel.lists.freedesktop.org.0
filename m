Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8A406FFF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 18:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E0F6EA42;
	Fri, 10 Sep 2021 16:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938456EA42;
 Fri, 10 Sep 2021 16:51:55 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 v20-20020a4a2554000000b0028f8cc17378so815911ooe.0; 
 Fri, 10 Sep 2021 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3fjHrC7rWcF9dMNWywAFcF4cWpH6lABHS4xRvn07uCE=;
 b=n0pLQC/m1h5A1fn2MzWqrUX4oQarb7I7knb3VW4HsCxe2kMxM9rGP+PkMf6kSyHydx
 bJbu7aiNg6qs2s8MGulF60T8xpksuVjtATtboNvB4wh+8jXrQg65ZvK+KKz3m1nUHiAD
 3xnNpGxISsktCzNdBuAsdHO5W7XBRivlmEg8zOt7D/tPqM1FBQmhYhnpGU2yZze0Aak4
 9p3hoK+ECAOWUXM6d/MId5N0H/HLe+r1nbjNdhlAFbQnA/hDC29ACO5bWSWmL2jhiuCI
 LRQ9/YguJBnotN0AjUNp1c9TVSwB9YYv0jennGtFTuUk+8LmL92LvtLX/MSbjnu57Hvo
 y3uQ==
X-Gm-Message-State: AOAM531HwcqjLqOf2YkSdpoRRNSdQXtvfhxL1EngERpaEe+nw3EJu118
 3vTreO2zB90fPeky9Y7F9w==
X-Google-Smtp-Source: ABdhPJyUedNY2XQSRkDXYf15LP5DG4AvPSI+WgwkX0ecJs/T2gYdw2UpbTWOv/R1eADi4gUxBwt0FQ==
X-Received: by 2002:a4a:33d6:: with SMTP id q205mr5077583ooq.83.1631292714765; 
 Fri, 10 Sep 2021 09:51:54 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id f17sm1347223otl.24.2021.09.10.09.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 09:51:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Marek <jonathan@marek.ca>,
 Aswath Govindraju <a-govindraju@ti.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH] dt-bindings: More use 'enum' instead of 'oneOf' plus 'const'
 entries
Date: Fri, 10 Sep 2021 11:51:53 -0500
Message-Id: <20210910165153.2843871-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
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

'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
is more concise and yields better error messages.

Fix a couple more cases which have appeared.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-spi@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml          |  8 ++++----
 .../devicetree/bindings/spi/omap-spi.yaml          |  6 +++---
 .../bindings/watchdog/maxim,max63xx.yaml           | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 4265399bb154..c851770bbdf2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -14,10 +14,10 @@ allOf:
 
 properties:
   compatible:
-    oneOf:
-      - const: qcom,dsi-phy-7nm
-      - const: qcom,dsi-phy-7nm-8150
-      - const: qcom,sc7280-dsi-phy-7nm
+    enum:
+      - qcom,dsi-phy-7nm
+      - qcom,dsi-phy-7nm-8150
+      - qcom,sc7280-dsi-phy-7nm
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/spi/omap-spi.yaml b/Documentation/devicetree/bindings/spi/omap-spi.yaml
index e55538186cf6..9952199cae11 100644
--- a/Documentation/devicetree/bindings/spi/omap-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/omap-spi.yaml
@@ -84,9 +84,9 @@ unevaluatedProperties: false
 if:
   properties:
     compatible:
-      oneOf:
-        - const: ti,omap2-mcspi
-        - const: ti,omap4-mcspi
+      enum:
+        - ti,omap2-mcspi
+        - ti,omap4-mcspi
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index f2105eedac2c..ab9641e845db 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -15,13 +15,13 @@ maintainers:
 
 properties:
   compatible:
-    oneOf:
-      - const: maxim,max6369
-      - const: maxim,max6370
-      - const: maxim,max6371
-      - const: maxim,max6372
-      - const: maxim,max6373
-      - const: maxim,max6374
+    enum:
+      - maxim,max6369
+      - maxim,max6370
+      - maxim,max6371
+      - maxim,max6372
+      - maxim,max6373
+      - maxim,max6374
 
   reg:
     description: This is a 1-byte memory-mapped address
-- 
2.30.2

