Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F7402074
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 21:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA14B89C16;
	Mon,  6 Sep 2021 19:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9414689AE6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:37:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d6so10548234wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rhksTvVQ+Nq8KlfrbrTGziwnDodu5qGkrE8LAP3ErI=;
 b=qBXwqS4/FpUi8QmqOiyukUT2bdkyXa1o1yXUbFr/856oeRKngEb5EbGLQ4yu8J24MG
 +MOgpC0A+6BkEUKLBv06l70+6J16wiiEE8hB341v3qmk4NrARtC/Z5VaudenxVc+s7YV
 vBPCmk2S1czX6gkR+iBFGBXStUjPuR1Pm8jSBzktLIWBZP6usq6rBI0hHGYc7jogE+IH
 3zPVO6linsBCpj7TM/VUyxDKdT6un61DO+Y5JwaFuJPcWC75o/rJiFyDW/EbHbLOL2Jl
 XnmrqxkPFbO92mjZEZmQDLHRKKyi9kNR4z6vHWV+2qJl67o70KRuFuCBaEd5s3HUK/VE
 uwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rhksTvVQ+Nq8KlfrbrTGziwnDodu5qGkrE8LAP3ErI=;
 b=GthnzbDjwLocFH0ijNgc71ftxA6Dr3pdBIICedREpxWNuSo1BqItywA86xmgWbzf2d
 wEgjGwkG+d6HWgcDlzYIa2o5ys9olD1kEpS+vMMCGCSdN5XhKNOOhZ3cB9Wmw/RQJQ6r
 h2DYcaNAUw6yKrlSBagr8n03PIFZvM1ccnV5pa7hVHgHLtTQZ20G56M5CiY+ZdU4rDmI
 gbKi4Yxz/KNuXBEBFqgEvO+GENmO3Z1UTrsAtVtdTG1OxYa4DHIFcmgpWgP5r5ogmRtb
 k6ftNfZV1gl/qAdiKFY5Gl5PfNORPvzRIj03BJYiCKZi9UiwA0Jjj10JicjUW2DJqQDm
 J7Zg==
X-Gm-Message-State: AOAM532T4Hj0u7qyab0Tck82byV9oaR6HtVj7abP+QhrU7Ol8AZ2yBQD
 Xyn3vUlWpuPY0eM/73aMJQCjvw==
X-Google-Smtp-Source: ABdhPJzP/DgsaBhy8hur2RweyMqFSFuzzpR0YUhyV79uSocm2gYrr3FEinvIh+6trQpHvfmzxoRiDg==
X-Received: by 2002:adf:c44b:: with SMTP id a11mr15049199wrg.416.1630957022035; 
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Date: Mon,  6 Sep 2021 21:35:24 +0200
Message-Id: <20210906193529.718845-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
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
 .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..1a158b719ce6 100644
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
+      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
+      hf_fmm and hf_fdp are required.
+    minItems: 3
+    maxItems: 3
 
   pinctrl-0: true
   pinctrl-1: true
@@ -64,6 +67,34 @@ required:
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
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: pixel
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
2.33.0

