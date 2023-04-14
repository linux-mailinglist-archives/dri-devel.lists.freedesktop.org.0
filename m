Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9446E2128
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24A410E13B;
	Fri, 14 Apr 2023 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF2510E13B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:42:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50672fbf83eso5736838a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681468954; x=1684060954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlR+xSiTjnc2SLlMey8CvdA1HO2rDpDlXaNoW69NFc0=;
 b=zmUd3JoFz7Tv3Vx3luqjYIZjlQtlyaeuFd+OzfpBA9c7rp/ziS2FdfeDuPsrYQtq1z
 kq7caNrwLhd08UehIxFjfRrljBj/baEVLCQ+rGlTPY6NVq/av0qfmCMvwmfVjG/Y534t
 yHl6IlLtsqJstYTzc+fFCm9T1g1/UUQF9HVIXIISfAmYYW1GZl8TcwC1YRMWetZypgkI
 qlztK+3VOTDeTrrV2/XpUuHrxhkgt7nC95w6p1w/0dn2OOrPBo8UBkjeW0y5ZgH0b37L
 P+8GAmEl/DSEHevlWAY3lMSLpPVIZEDp0MUMCpaS+XK6JdORsDpYQWrMLuUkTEFnCe/T
 dr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681468954; x=1684060954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlR+xSiTjnc2SLlMey8CvdA1HO2rDpDlXaNoW69NFc0=;
 b=drcjKAiWCGRlX+s1d4Xgc53332mmqlyAcECymzwR2aGGs1l24qtGJnzEIX5qK/LGza
 IOcmWIFNCGHWmFOYXujuQuP6QT1is0tIz/lwza/kQlTSJyVmwnWWFEI6Kxeq3Ufy3P8z
 7MHQHRgL5KsULGcAzWEZd0LDFFeQrlVeeKGTwLDM5BkrjotlTQ5Fccx80GngeLfHuj2Y
 6chH6LuJhoAVLQ+C4MJ/mNg5JfQ/rS15KT+GnwN5exw1aOTwNdVFS+ioTDtWNy+oXsn6
 l+tgnGI9H07DtCir6cOSfDIrSq/Bj38kV6FULbu5sfYhPGhL9UIewen2KI5yRYry6GGZ
 0x1w==
X-Gm-Message-State: AAQBX9fnn4UqRstaPoI9XT/T3z+/LiFuhL1o2hMaGG+NQwjJpJbnZ33z
 7itER+TQZwYGuSABDpsDQKFV1w==
X-Google-Smtp-Source: AKy350a8p/Dm34e6FTIrwnmd/FYPe6DCZ5aMSRnZbXAhFybe2SHbqsToCcm2MWHCebPZJuVwNc96pw==
X-Received: by 2002:a05:6402:114e:b0:504:9e79:e86f with SMTP id
 g14-20020a056402114e00b005049e79e86fmr5349108edw.18.1681468953929; 
 Fri, 14 Apr 2023 03:42:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
 by smtp.gmail.com with ESMTPSA id
 m24-20020aa7d358000000b00504706aa54esm1966447edr.57.2023.04.14.03.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 03:42:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Xin Ji <xji@analogixsemi.com>, Thierry Reding <treding@nvidia.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: simplify compatibles syntax
Date: Fri, 14 Apr 2023 12:42:30 +0200
Message-Id: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lists (items) with one item should be just const or enum because it is
shorter and simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rebased on next-20230406. I hope it applies cleanly...
---
 .../display/bridge/analogix,anx7625.yaml      |  3 +--
 .../display/panel/sharp,lq101r1sx01.yaml      |  4 ++--
 .../bindings/display/solomon,ssd1307fb.yaml   | 24 +++++++++----------
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 7960745a8dbe..a1ed1004651b 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -16,8 +16,7 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: analogix,anx7625
+    const: analogix,anx7625
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
index 9ec0e8aae4c6..57b44a0e763d 100644
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -34,8 +34,8 @@ properties:
       - items:
           - const: sharp,lq101r1sx03
           - const: sharp,lq101r1sx01
-      - items:
-          - const: sharp,lq101r1sx01
+      - enum:
+          - sharp,lq101r1sx01
 
   reg: true
   power-supply: true
diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 8bd58913804a..94bb5ef567c6 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -14,20 +14,18 @@ properties:
   compatible:
     oneOf:
       # Deprecated compatible strings
-      - items:
-          - enum:
-              - solomon,ssd1305fb-i2c
-              - solomon,ssd1306fb-i2c
-              - solomon,ssd1307fb-i2c
-              - solomon,ssd1309fb-i2c
+      - enum:
+          - solomon,ssd1305fb-i2c
+          - solomon,ssd1306fb-i2c
+          - solomon,ssd1307fb-i2c
+          - solomon,ssd1309fb-i2c
         deprecated: true
-      - items:
-          - enum:
-              - sinowealth,sh1106
-              - solomon,ssd1305
-              - solomon,ssd1306
-              - solomon,ssd1307
-              - solomon,ssd1309
+      - enum:
+          - sinowealth,sh1106
+          - solomon,ssd1305
+          - solomon,ssd1306
+          - solomon,ssd1307
+          - solomon,ssd1309
 
   reg:
     maxItems: 1
-- 
2.34.1

