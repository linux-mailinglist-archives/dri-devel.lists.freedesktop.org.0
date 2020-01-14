Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1C13A161
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 08:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3F16E2CA;
	Tue, 14 Jan 2020 07:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7986E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 07:16:11 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id s7so5459286pjc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoATaCn4ot7/fRXVyyupWqTUK/J3grtKGGD0GZimmTI=;
 b=YahZMu4jUSx+kdGsktVd/kysOsca1+L1cDz6GC/y3EdchGBL4lmkZC+vd2F+RyK0A7
 cSFw3LO7hgNpta3FVyHm971uhVjHwJ2SCe+7L/g+HAE+Ip5mi3Zg2ITUK1YM0hs9vyPL
 bojXkbovYxxTJydqmr/V1/I5IiLD5C/gKkXm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoATaCn4ot7/fRXVyyupWqTUK/J3grtKGGD0GZimmTI=;
 b=FA8v77aTsERzxyS4wLtmuSL8mgfsBdtm9drLx2Rcn9pvm2iNQ/CfVKT7HCzEOr55in
 sp0vgTlIv1rUfrxovsvXut44Vwh/bJXRCAlkMxpKmcKMNp3+Qd7SBP4bgWiRWBVgOj4P
 bqyEB6Kmeo9xo2tRcnAlUy5MAcuH9uYgSxMqVaopREbDFB89upO3lg/P8Os7Hj3DRPng
 p67c7LT6Y4qdkSnOb8Kogn03WhF9MwG5PquzLgpZUglSiasOQJ5z1+0Wg54xDJ+0uRME
 euDNrtgNWtZ0HnDx1g/RcU03g1vvRLNVw9olddJ2ipG4RLRC7B8iixiRDxWjc44xXn1t
 zQnQ==
X-Gm-Message-State: APjAAAW3byEsAdXj7CRpE0RpDF2cn4/EA7/Oo051z60WJmz9hMs69iIJ
 he/72Zv+kUBg1kCUkIMN5SPOTw==
X-Google-Smtp-Source: APXvYqzQuE+WVs1Zt0wpcg6768ZyfON0VW874YYaBtjWl2nYKw4EH/znBkyBISA8PcAG89pGqwd32g==
X-Received: by 2002:a17:902:d68e:: with SMTP id
 v14mr25504465ply.36.1578986171223; 
 Mon, 13 Jan 2020 23:16:11 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:16:10 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Tue, 14 Jan 2020 15:15:56 +0800
Message-Id: <20200114071602.47627-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114071602.47627-1-drinkcat@chromium.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
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
 Matthias Brugger <matthias.bgg@gmail.com>,
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

v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4ea6a8789699709..9e095608d2d98f0 100644
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
@@ -62,6 +63,23 @@ allOf:
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
+      required:
+        - sram-supply
+        - power-domains
 
 examples:
   - |
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
