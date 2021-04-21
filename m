Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560F3662F5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1CD6E927;
	Wed, 21 Apr 2021 00:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF166E927
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 00:19:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id u7so18802159plr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udOtkZZjDYxPso6eI0a9vHxz9Qn5dM9EKymdOtACQ/Y=;
 b=loH3oVgpvHTTtx+Cm+Q4516fccOHDIn3WVuFgwOzELLQGBJbxFTEfU0h7fxjh1/t7/
 pCIXvhlKcDSWzhuj6cNA7eaolw6JroiG8q657XZODQRywiWBOFMMoWlGV+KWrQ0w40e7
 p0dJrrcs+L2AU/7RmZWMu4e4BiEsFMsDE90qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udOtkZZjDYxPso6eI0a9vHxz9Qn5dM9EKymdOtACQ/Y=;
 b=A383pV6fkcUnr9nlaTKg2ixfASK9DjJy2glNxdsK1tPiMo4IfDDW0WlwVyYp62YQLX
 WMmLj5A3y9/ZLvBShCS9SLCT6DPNRemTyZgGwdAttPorvOmyvwHTvkW4lPY1p7g5FJwc
 eLu8Lc7LnhOyQcnAS1aYzhjW1OZudICWXT8AUrJTNvkKY4biVBOfWCXl1qK/UHhdAYKd
 1RsBZ5Da/iCbisfWvIrrIyhyD8AW9gV3FqWWZ0naOoSqRmYDRSrZs5kqVpklN7BQS5kp
 E7E4CMYzBjlZOpiS5q7W/jjdjItJww3MjsybYPDt8lu1+L7DLGtO3KO0jDPGmyAUm0G2
 SY1g==
X-Gm-Message-State: AOAM533n92w/uZdFe8GX4e7Y+9XqBM3hWb3tjSB1mIcONUU7hN6QB71Y
 hrvsS4EZRq07OHZTvwxdSxqvSA==
X-Google-Smtp-Source: ABdhPJw0YM5F0tNQtH8BnGQocJOVnUuo5TWPyiJSGrWay1gXYG7nneFIqPf6+Zy3J5d0TfXcX8TfxQ==
X-Received: by 2002:a17:902:8bc3:b029:e9:9639:be21 with SMTP id
 r3-20020a1709028bc3b02900e99639be21mr31370108plo.59.1618964359731; 
 Tue, 20 Apr 2021 17:19:19 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:95d2:8c89:b629:ff49])
 by smtp.gmail.com with ESMTPSA id d20sm145494pfn.166.2021.04.20.17.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:19:19 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v12 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Wed, 21 Apr 2021 08:19:05 +0800
Message-Id: <20210421081831.v12.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421001908.813625-1-drinkcat@chromium.org>
References: <20210421001908.813625-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v12:
 - binding: Fix min/maxItems logic (Rob Herring)

Changes in v11:
 - binding: power-domain-names not power-domainS-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

 .../bindings/gpu/arm,mali-bifrost.yaml        | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..b22cd8f1b015 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - amlogic,meson-g12a-mali
+          - mediatek,mt8183-mali
           - realtek,rtd1619-mali
           - rockchip,px30-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -41,10 +42,13 @@ properties:
 
   mali-supply: true
 
+  sram-supply: true
+
   operating-points-v2: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 2
@@ -87,6 +91,30 @@ allOf:
     then:
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+        sram-supply: false
 
 examples:
   - |
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
