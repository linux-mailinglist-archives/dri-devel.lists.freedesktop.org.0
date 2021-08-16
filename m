Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541913EDDDD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DF36E047;
	Mon, 16 Aug 2021 19:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FDE6E045
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u16so7980925wrn.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuwv4CvAhC05XO/EvjJwqQIYC9i7gmGCUO5hp62Mr0c=;
 b=CPlb/rsrvzBG23rv3SzKewzwWwNQQQzgWeP1HSmiCOTkXST7xpnMXkde39Vdx2WHW3
 P7GKNsJ6Q6WqB8edC93S0hQISFDowL1PW2EoLturEvfBtbsONxNH/R04V3qPNmmMv4UX
 h2u5MKhV2Tj0EpfRQQW5zmvRX38eG8d5kyFZu8FIKl8z2z3Mt008e0WVf577nGhAnA0X
 HJ+lTJ0zJC9NbjB2N2LFYJM1g2HBX3OYIhYeHxwzGl52Rs5oluRmFFq3Kc736geWmgtE
 MnfDcm4Hkk73cWKgJ6BoTtRndgetz8Toe+t+aU29J3TsJdgdLUQHdYXsM+f4XbUSE3ZF
 lqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuwv4CvAhC05XO/EvjJwqQIYC9i7gmGCUO5hp62Mr0c=;
 b=XDI0+bF/p3Cb94icBYUD5SPKo0C0QK4Bzfo77wIiQkOMDxPrRQphTd6tMWp+E/ElpK
 AL+FBvT67+KtJ/+Zg9RemohcciZ2Uo1FxiFi0PG/PyeiGqNryI3mX0XTN7nriVi/8A9g
 TsoMro7Oa9SSq37DMZDm//lB8fFNJFbAfPNPDRLelZZ1w0AzjuIZpkRilFuGYPt/qBEg
 I8PL3bwd9p28sWDS6jA1MgfNJbZIjoSD829UZnHAuhl2HFxhwvIfEGQwP2wjeXSy6uTU
 1BFGwrqa/F0IozxY+rgYJswsfslMLmN87IlaYiHLy96gDrHfjakx0nS5sU29lGJ/voo4
 mbTQ==
X-Gm-Message-State: AOAM533Ydi0PLoGdeEZ1qSbVMgJZbRcNr1mf/cICAYGoNRxFSd6Bnuzb
 b6a1n5bmhjUqRGPdz44Xf/dUsw==
X-Google-Smtp-Source: ABdhPJyMWlB5Xjlg2TVVeZf98LQxRuHOrhJGqrDGXl3FSZ5HPt+73twdtLFI+5rzbw89BirDZTSthQ==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr38039wrv.221.1629141947284;
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Date: Mon, 16 Aug 2021 21:25:19 +0200
Message-Id: <20210816192523.1739365-2-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
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

DP_INTF is similar to the actual dpi. They differ in some points
regarding registers and what needs to be set but the function blocks
itself are similar in design.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..de4bdacd83ac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DP_INTF Controller Device Tree Bindings
 
 maintainers:
   - CK Hu <ck.hu@mediatek.com>
@@ -13,7 +13,8 @@ maintainers:
 description: |
   The Mediatek DPI function block is a sink of the display subsystem and
   provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-  output bus.
+  output bus. The Mediatek DP_INTF is a similar function block that is
+  connected to the (embedded) display port function block.
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpintf
 
   reg:
     maxItems: 1
@@ -37,10 +39,11 @@ properties:
       - description: DPI PLL
 
   clock-names:
-    items:
-      - const: pixel
-      - const: engine
-      - const: pll
+    description:
+      For dpi clocks pixel, engine and pll are required. For dpintf pixel, pll,
+      pll_d2, pll_d4, pll_d8, pll_d16, hf_fmm, hf_fdp are required.
+    minItems: 3
+    maxItems: 8
 
   pinctrl-0: true
   pinctrl-1: true
@@ -64,6 +67,39 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-dpintf
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: pixel
+            - const: pll
+            - const: pll_d2
+            - const: pll_d4
+            - const: pll_d8
+            - const: pll_d16
+            - const: hf_fmm
+            - const: hf_fdp
+    else:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: pixel
+            - const: engine
+            - const: pll
+
 additionalProperties: false
 
 examples:
-- 
2.32.0

