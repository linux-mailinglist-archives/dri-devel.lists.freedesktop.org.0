Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51530310F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 02:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94F36E3CE;
	Tue, 26 Jan 2021 01:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F906E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 01:18:13 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id jx18so762120pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BZifB+iVMGmxp83gSV8xBJi4ZuHE+jJzS5b46pYB0A=;
 b=buRZJlIfAEszu7DTDxrGpStS4yJ+JlArTcXt0x76ycaU2bjFQCHidprSrOBF3N1xve
 e2RNFHNjUFXkRgFexKzldGH0QtYp6XGsa/hwV2THVKhJrBrbOYGfciG0gbWd3kkjhV6l
 hJasfeZTmZ6+c6txPNSZExg1rsZfom+QZAd74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BZifB+iVMGmxp83gSV8xBJi4ZuHE+jJzS5b46pYB0A=;
 b=nqPEv6lTTjoPe0da8RZB9btnOmhUHptxzsixP3sqcSxYkwBcnPHGgCZIUST6iVzNgI
 6IOpw/QXD0Wp6r2Sptmy6cs3qYIfh9Rc0Tebzt8NrFd37sgEUibEhhQKbdaEuFbbnPn3
 CmyHGd+OQ26fe1tOB1H5Nl5hRNYm2ssrQF7Rp8eaxZOmLgzjuLVpMi0P2jZOrGg4ftxM
 ueRqZdAUeS7AzldK1ZHm+Jtu2ZQZvy84DYaHNSko0N0I0M91idcBU/5dhCbgf9AUP2q5
 U1vIcAMTzjCuxzsA5dmcXG4+uNphyDNgSaX78ITQzV9Y0ljmxmCQcBeS10f8HmNjx+ek
 53fA==
X-Gm-Message-State: AOAM531iF3FSiMYwGYddaZlR/QHtxLZIQKEFBZwzbeICIsY2/h6VErL2
 +cdk7h8v5+wp0nYaQjf6lDVqLg==
X-Google-Smtp-Source: ABdhPJzq03UOZA3rzW/Jku1UL/Q9+LLv9sYit5RxxJUopLFrSfRQH8oSRCQ/AdGoGrss8ksnQD4EKg==
X-Received: by 2002:a17:90a:77c1:: with SMTP id
 e1mr3157796pjs.141.1611623893652; 
 Mon, 25 Jan 2021 17:18:13 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:12 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Tue, 26 Jan 2021 09:17:56 +0800
Message-Id: <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
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

Changes in v11:
 - binding: power-domain-names not power-domainS-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v3: None
Changes in v2: None

 .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..3e758f88e2cd 100644
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
@@ -41,6 +42,8 @@ properties:
 
   mali-supply: true
 
+  sram-supply: true
+
   operating-points-v2: true
 
   power-domains:
@@ -87,6 +90,31 @@ allOf:
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
+      required:
+        - sram-supply
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        sram-supply: false
 
 examples:
   - |
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
