Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B5538C16
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E6610F47C;
	Tue, 31 May 2022 07:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10664112178
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k19so7832606wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/Dp/zG0GUpVg5pylRpz2bBeewgylQW8uvOtIHZ+kQ4=;
 b=zlpOUy+1Wox7YTbXLaYC9kanMsm7CfiuU3NFzVSErocML+qCQqqmON+78BsSU/dqRX
 gyveAXELf6YPf4bA9OsUFOyvZPbRkcH00YF4h/Y3J+M+TqWyKgA0oRDRP24tzAs4ZPlD
 XusIO9vcyCtJPkTVsrkFfmFUCLFZ5gWPIOyRkRis6CxvND+s5geN/W0oQRsDrY0wtReu
 /rsnx4WHxnzzTUjXe5RpkOtg5vavCeh7kT+dVPJEm3nicPPEUkSg7tiZvadLj0AvKx9z
 wA+nBX6B6z4WiLN+ex3MrXDPJLyImxFFBIxbWuvTsMGSeUeg8JWeDcBiLTje/egA2Ydf
 RsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/Dp/zG0GUpVg5pylRpz2bBeewgylQW8uvOtIHZ+kQ4=;
 b=LDlnZdc3xq/TRnl1M5IUTWpCuE6ay65JXYIm9Q0tJbmUnn+VLTccNXNsubfKSUz9aJ
 5bLwn0Rp+bgzNSe/+wO06woju6M8Ubwr6y3sTZugKTpU229sDxsKyHBcJCHOXPcZZ4z1
 v7W4Ix+NWzHUY1p514UndAIb4her/2vvvjZi3/lzicNScvW70Jnxf7E+EA0kURu4qTm+
 grL5juWlyAfH+wt7V6VYH8rxNHQc7Fjh/Etj0IPXA40HuXpDoLoDjkdEoL21Cbx5nf0m
 jdi63PwNONBWwkvVAqLpvbpmLx8ML/Ue520zSdbhHbDFlsul7F44RO+L9Ldq5yDdSRa3
 W7QA==
X-Gm-Message-State: AOAM530IWue9hTmYVRy+OYKbRJC8CsUZY71vBbrxxy7krI+AJSUKXqRD
 lUwv9zjYiafJsVoP6utgQdHQZvmlMbRKSw==
X-Google-Smtp-Source: ABdhPJxkrVUg6pTK4pFvQWjJ1T9F9EWD/ezcY3p8Ii1GByIQAGMYQmy7kqTOhYXAiJ1eFSg67CETkg==
X-Received: by 2002:adf:f1c3:0:b0:210:3532:eb with SMTP id
 z3-20020adff1c3000000b00210353200ebmr5244751wro.196.1653941702332; 
 Mon, 30 May 2022 13:15:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 3/7] dt-bindings: display: mediatek: add bindings for MT8365
 SoC
Date: Mon, 30 May 2022 22:14:32 +0200
Message-Id: <20220530201436.902505-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 07:41:20 +0000
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MT8365 binding documentation for all the display components that are
compatible with the compatible string from other SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml |  1 +
 .../display/mediatek/mediatek,ccorr.yaml        |  1 +
 .../display/mediatek/mediatek,color.yaml        |  1 +
 .../display/mediatek/mediatek,dither.yaml       |  1 +
 .../bindings/display/mediatek/mediatek,dsi.yaml | 17 +++++++++++------
 .../display/mediatek/mediatek,gamma.yaml        |  1 +
 .../display/mediatek/mediatek,mutex.yaml        |  1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml |  1 +
 .../display/mediatek/mediatek,rdma.yaml         |  1 +
 9 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index d4d585485e7b..d47bc72f09c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt8186-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..fc999e614718 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index d2f89ee7996f..9d081da433e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8186-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8ad8187c02d1..a7706cd65675 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8186-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index fa5bdf28668a..d17ea215960c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -22,12 +22,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dsi
-      - mediatek,mt7623-dsi
-      - mediatek,mt8167-dsi
-      - mediatek,mt8173-dsi
-      - mediatek,mt8183-dsi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+      - items:
+          - enum:
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..f54859cfc97b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 3fdad71210b4..f4a12dfae77b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -32,6 +32,7 @@ properties:
       - mediatek,mt8186-disp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8365-disp-mutex
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a2a27d0ca038..20e4ca4fc915 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 0882ae86e6c4..3bc914785976 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:
-- 
2.36.1

