Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DC538C0F
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948C410F454;
	Tue, 31 May 2022 07:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9672A11217D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id p10so15994002wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68IUzThINQHS9c64e/2mypyGj3LqFegF7aUXUpeQSII=;
 b=u2d8p4QAEi3ctSajLm45PHcAdGNb4dc77i74TOisR6B9VoH4w4onMoONsDGc3+PD+H
 +CrhEa4dqWqz9Ox/kXTWVRT8E7CQbbf7aihiXS2nwKfsF7QdmyITkvGLWshI6CBe8T3o
 w+MZ3qyL9qilLXMp73nAWWB+Wf7+LKB0j1tLpB4aiA6DfeiwUpupRWzLyf2NdaFVwFhp
 06XaOJrlzigu+lK98u0RqdZ4636R+6b0oGqiR/Rv9Wpdw2nS8VyJTiojxul5B+VTONR3
 8g+oeqgqR/+0BrG0MjTMrWqf6A0PMwEMqEuRVaqq+3TNoBTalrcrKHPHGw0XGUawcdLW
 kgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68IUzThINQHS9c64e/2mypyGj3LqFegF7aUXUpeQSII=;
 b=Ax5AyzLuux5TB650MKXpi2feKezKQMWaDF4bJKTVkgNNz/DzBQCuAxt/shGZfVH2+N
 DZRgravOoiLT3c3zf5XrnSg773EBkVmG5U5yoPrHcWBGjGXiEHxZtX/HYuelkdrTr0Gb
 aYBsEQSDuJjvQ9FUquoOI3H3KY2lRWBGSoxmkJxLW0J2WMvdx6rFVueTt1RE0giA8SvE
 lfPCQqOaqp715DhAIu2IBYZW35mPwRhxcpOdlPJn+Iqkrsl5iPdHQ3o6D+W1bSZ21Mno
 g7++ky0JMEilL5u+9HEKBWZQBck2XtOVxv3hJuQX9cPEu8W90nsY5LtOs68DP/O5EjnB
 Q2bg==
X-Gm-Message-State: AOAM531tJQKhw9ASLZhhDERTG6Bd06YCsb8y9rG5TnVCozeYhn/kWN5x
 /tWI/TlHw2L5QzIh7uLuB+1HzQ==
X-Google-Smtp-Source: ABdhPJyV//TAUQKJXHBmXItC+7NmI594G8rIKaBMVmslTUXdIAFnw+TnofqHost0A6YrIMpMLuB/pw==
X-Received: by 2002:a05:6000:2ab:b0:210:12ab:76e6 with SMTP id
 l11-20020a05600002ab00b0021012ab76e6mr17162232wry.120.1653941700978; 
 Mon, 30 May 2022 13:15:00 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 2/7] dt-bindings: display: mediatek: dpi: add binding for
 MT8365
Date: Mon, 30 May 2022 22:14:31 +0200
Message-Id: <20220530201436.902505-2-fparent@baylibre.com>
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

DPI for MT8365 is compatible with MT8192 but requires an additional
clock. Modify the documentation to requires this clock only on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 44 ++++++++++++++++---
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index caf4c88708f4..c9c9f4d5ebe7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -17,13 +17,18 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dpi
-      - mediatek,mt7623-dpi
-      - mediatek,mt8173-dpi
-      - mediatek,mt8183-dpi
-      - mediatek,mt8186-dpi
-      - mediatek,mt8192-dpi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8192-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1
@@ -32,16 +37,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Pixel Clock
       - description: Engine Clock
       - description: DPI PLL
+      - description: DPI Clock
 
   clock-names:
+    minItems: 3
     items:
       - const: pixel
       - const: engine
       - const: pll
+      - const: dpi
 
   pinctrl-0: true
   pinctrl-1: true
@@ -71,6 +80,27 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-dpi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.36.1

