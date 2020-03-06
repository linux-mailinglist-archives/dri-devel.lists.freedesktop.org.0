Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A917B53A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 05:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50AE6EC5D;
	Fri,  6 Mar 2020 04:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E26F6EC5D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:13:59 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id d8so512175pje.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 20:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYo0wCuLZS6Af0DjoF3Xj17jVoInSu2OB15HTnyAsCo=;
 b=YCCN2t1CB2P2CfMaPm6rIKOPVG8t/6V3YQ2aCXAgjwQ/oXYOdBygxVA5DtyYataKSO
 8jXTgzI9ZnMO/rKDqORjVs1ktjYBpeo3sqPj4vQGQJb5Dyg3EMeOJSo5Rar1l1W4uIHX
 DB1YWKd8PndfLlPLZiNSXoYYlp+cRIkYlwyFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYo0wCuLZS6Af0DjoF3Xj17jVoInSu2OB15HTnyAsCo=;
 b=Ybl5/edm2v/Dt+jyjEgwUeo6hGQN/gLMF1TS8nurbxW/onr4AXFYJWTa1qCqrq87nJ
 CsKMfxTx7nR1+n1682KHACB/4dcPU7nTMMayyWanLzkoFtK5mz1Rv6lQcECNvAsIKOyf
 PTzRBFHSWkPe414/wvt4QsgbVOMWSWtHZLpSDQmqGolzs2SKEfrVelMpZipXwE3Xb80U
 5K4dfHnh9NmlQ5sevVGYmg9VCHHmRXETfPHKjAylgIzfVXg3eIB3o8YGGlSm5O3HzNK/
 6vnvfe79us/wWYWzI3uwgDOAVA794TYvr5TmGbIiL380eGKnFuvShtCKoyF9fcYCWunR
 DZBg==
X-Gm-Message-State: ANhLgQ3STj57MYH6Y2E0WDkkGYD74gbqSjQ/4GcUEbWRz/IHj8f8kfNH
 loC1vKdQQWcjz5YRkGd8JsDO2A==
X-Google-Smtp-Source: ADFU+vsapmfZZvpytvq8zfJi0p1aO+2auKRfer0iGIeUM9zhX2RKOVB+rq7eHpBtbvY0Yo4mFBVKTg==
X-Received: by 2002:a17:90a:b94a:: with SMTP id
 f10mr1564406pjw.1.1583468038770; 
 Thu, 05 Mar 2020 20:13:58 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:13:58 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Fri,  6 Mar 2020 12:13:42 +0800
Message-Id: <20200306041345.259332-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
References: <20200306041345.259332-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

v5:
 - Rename "2d" power domain to "core2"
v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)
v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index e8b99adcb1bd292..c5ceca513192f99 100644
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
@@ -62,6 +63,30 @@ allOf:
           minItems: 2
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
 
 examples:
   - |
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
