Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91836B26BC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1610E824;
	Thu,  9 Mar 2023 14:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3538D10E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p26so1260190wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jyBGY+jvCJOKXJP8ldMkSDuOdIH93pHfswBkaYg6AMg=;
 b=ooRqerabbbAmmSKiv7+GfEuHOW5HHY7ANUnilx/QxU5RMYgE8KNAUhlDllDyul1PYL
 dMJM+kcwHj2XtWwIK0E/Pp8bNfFGiH+HS4NcxF1ORpA2SsSgZj23/Uk4urMpfee14Ym2
 Ia5+osju4pxuQ0o4lVSQbb/ihW71zy8B+XbPdGQzUF/2ZKUYVe7UDDYeyqj+kHybGjFt
 DbSMkWZCvsJNX+zBbJU+Cfsn/4N1tTxKaofD5UUmjHjtnHkw8mApyaPu8UhO4ANmyLBr
 7MhJQuYXXL06ICEduUTSCJhjHwJIS09+nVtWgAL+d1njolaMW2/pXqDQhO9xgG84sstD
 F0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyBGY+jvCJOKXJP8ldMkSDuOdIH93pHfswBkaYg6AMg=;
 b=t5d9DHNwNtutNENpPUiER2UfYMk37sv3W0GiXgnN17lcD4+4XEfN8WvIFLfsMu5cG3
 SEt0Pv8pJUH2w8fxDiS2Lnef8fSKWlf0f8Fw2h0okvah19syB8tArmFyTiyvgVn4sb3J
 SCcPPJDxB0QZRrYYwGlThlbWTtKPEvj4xRsi+GUqv14ykAoieC1iztSgFdLnocrHq+uk
 DwICLvBRa61VHAcGQ0PbcmYYI9WuTk7LrxqBhAEMSi3F8h4TtM5j/TLJMPVi/lDv4eJM
 re4IEZzB0s+55PmIG5EocLgeYWcLzKWvblcHweEByBxIUwtSM9chijR2Wv+nCxAnTRVb
 dxBA==
X-Gm-Message-State: AO0yUKWM3hkHIjkLuSLCR8WKh1FpBIyQrAtXBWMaFGM8bF8gNHCG5xkw
 w2887IHruepez/q+O2rymPHITw==
X-Google-Smtp-Source: AK7set8FO5JcyNQaHX02anFtnUYwcSLi1PLmBq6lm7daIhornxQMnEtC1Zaab7o9C36y9+u0YiHk1w==
X-Received: by 2002:a05:600c:4e8c:b0:3e2:dba:7155 with SMTP id
 f12-20020a05600c4e8c00b003e20dba7155mr18514567wmq.20.1678371784719; 
 Thu, 09 Mar 2023 06:23:04 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:56 +0100
Subject: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding for
 MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-7-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2483; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=0m3zQ+CEWwgmrDXTxocKv5T5uh988OgohoP13JFGvXc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+e+5OVN4x2QxLmEE5u1X3dXSeY6CNuN0k5GVI
 QKihHiiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZKyEA
 CUB1Vr884ZhpoJG3ZZ6pM+Es90TE4OVOsyE/W9F5MZYwPYysxyUtsoakP4mp8AdxHB/CY70J09XWxm
 rAf2lHvzhuMnniDkC4t7MnpN2zWHJJ3T1i1EgTfyf97ZH8ZTIFCa1NRk4G3MEWG9R60b9/5qqP7Y7B
 LZIrtIHHfO82TNy86Ucu91SAFAl1tc/0j+NFW5fYFYjkhspr2LrJ65zB//+q1/bMxcaNLaMjs0KUYc
 IKGhyx4EHz+7o/umb4AQUUf9CnUj6DCv0mi8pxe10G2VlvuuMB7IqfQwPuq/q8SmXPcuyx9Ci+/pq/
 Lmk79E89NH8dAIsfbLG5Wp3o088KlYsVuV1X+Rn9YFkqldc1J/3nEkD6ZQnwhHUC5n4Q2XSN90BN6z
 ox6glkhvOCrC09T6tTD5YImQh9G5h+ljy3Wvu7M1DF0FP2eXnB0JreoP9XcgiFqZSGn3RY7R0+rRKt
 wQ+tctTbK587mXRuQbDIhIJT5TxdE4LckU7HnALxRycvHQ2NwjY4DwNRvoTgFYJI0L0LQM4ORVr3+d
 MmIlteaG1/UekLWNWSv7UWO+Y/APA8E75ICfOWd2sdo5NMMgP6IZ4y8PRbErxmrlH3+mGXkjbpuC5s
 4LI8tZvMrwUvVM+P9xeTd63t1H7r8XDr1nQxW5DHd8oN+ytBdL0I4gERH8PA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

DPI for MT8365 is compatible with MT8192 but requires an additional
clock. Modify the documentation to requires this clock only on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 48 ++++++++++++++++++----
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 56511c4d4b9b..3f6cca81340c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -17,15 +17,20 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dpi
-      - mediatek,mt7623-dpi
-      - mediatek,mt8173-dpi
-      - mediatek,mt8183-dpi
-      - mediatek,mt8186-dpi
-      - mediatek,mt8188-dp-intf
-      - mediatek,mt8192-dpi
-      - mediatek,mt8195-dp-intf
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8188-dp-intf
+          - mediatek,mt8192-dpi
+          - mediatek,mt8195-dp-intf
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1
@@ -34,16 +39,20 @@ properties:
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
@@ -72,6 +81,27 @@ required:
 
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
b4 0.10.1
