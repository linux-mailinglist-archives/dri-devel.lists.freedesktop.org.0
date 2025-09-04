Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BEB435F4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C389A10E10A;
	Thu,  4 Sep 2025 08:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aRVsdFii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A30710E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:38:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-61ea08e565bso107559a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756975104; x=1757579904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+0YmNJVAET3+OflVoIsL4GF7qJmrukrYX1EfuWUl2Hk=;
 b=aRVsdFiidsYTGW+dSK+NBFHQAh6Gqthf/SErxiEQNh2LWw7jXH1BGNiP7Jc05yDf5c
 8SAM63T4uCQAB4rdubnbLOH0EToidvLOwPjSMWbxUTUvGrcNZiq9aPW0N3u5u1XXzcJI
 dxAmQbr/RtR2CeOCSzbS/1uINk/ftnCL28LCn8SnXKNhaLaUzWveH3goatJjJRS+k5do
 XXlma1kytqYK7Q6atQ5oZMJOt3pO9KwFrUpfx9/wfGl3lAlLinIYFWHL2j17+LU3flrx
 i8ltMu+bHrul76TTJD/bDn9Z9MOXhvyaSgz52d5+jXVvLLVNeER/imLAzXmLRT3LtvQq
 wdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756975104; x=1757579904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+0YmNJVAET3+OflVoIsL4GF7qJmrukrYX1EfuWUl2Hk=;
 b=vBsH1B1IBWdtWNnfR5hn0NR7cHDDG7aDHk/XnzKrzvgiY2umsV/lO0s+Aur5RedW/Y
 OdmC15+3Yyo5vaNQmDUSTXbNzRtXIzQz/e5rmfF+pUcL2716jA0FWPwa2QmndHVmlkYr
 Zyns5jQnARt2EPlDE4PruytcvKEYpNhVtmOLn5UmL0PUV8++gyOuuH4SBRYP0Wq2AOjy
 VBcbAJ1KrxNsoRI7lqzpeRfMuAiJx+KZbh9010Nv5WXOidotEIfFJZJ2DNKgmVjCUXuN
 ERB7mDEyPlOxRfQuA+eWJ86/+a9jqpSV4+P3DSQB70hQrn+ukMjiDdEnfrOS2DqxRXGm
 DbvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9XJP2rUf/l9oMmSJrmq1XPGnFSBmBHObwpMQSvgr0Pjp8lkLIchm7zNK6ZL7lmK2iPSEXPttSL7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxobLW+MqhSoLgE7gM3U2+/4Ac2GaPdMJltPcrHtMnVd39pbypF
 GF0qb1Xz8va5nAX0K5r86JpnFldIi8/R9CJZXy5ydbpA9Eu4u19oPD+blmXhCLDFjvA=
X-Gm-Gg: ASbGncuwn9OjoHGlPzpzRb7QY35ZFDCYQxUg/LMyYPZL1t8E/hTdE83z34yg+i9syJV
 lzSNVMGXEFAA6Dk0c7h38letigsh0SroP5N1W0TnedKdzAVLwdDpMRELEENfRtxTe+P/sRI4eAr
 2HPCSx43TyrCx5ylaaDkx0Wn6cKxbH9TWOgnwcjFgyVyC1n05nfcmgeTkbOOFjqtfaPOhb3knq4
 G0MSVcni7AgcalgEJU+uaF42rubYfZ9f+LZN5kujvK2eSpJ/fXXVWHO8PLQHmKkQG+MrXU2sfXH
 c0fIQWfGTRVcGJBZbd1tsMKsxbAfHTSzVcNlfwAvYEsrEBOzNSG1M6w4CG/jlz6B/z3dOQZ7qrh
 0kOgHhsbM6NhtLghXp+FDurNIqBoOp6jrqrEJJe6VV9NW
X-Google-Smtp-Source: AGHT+IGiuAyaA/2yA0XVcQXMJVV6L/Bp1Cp+hmK1z0mXJ6UNW1X+/VIQU2+RMFJ1FmJ+Gu3Uv17A4A==
X-Received: by 2002:a05:6402:34c5:b0:61c:bc96:7164 with SMTP id
 4fb4d7f45d1cf-61d0d5e36d2mr9710731a12.5.1756975104324; 
 Thu, 04 Sep 2025 01:38:24 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52a886sm13604112a12.43.2025.09.04.01.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:38:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Phong LE <ple@baylibre.com>,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: bridge: Reference DAI common schema
Date: Thu,  4 Sep 2025 10:38:17 +0200
Message-ID: <20250904083816.48076-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3398;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=O0lSnAE58yTaXBoJZbkip6clrguTKaMFShBxxY9I5Q4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouU/4D3SNOO44f23qJy56IqSNGmeWqC+//Jjg3
 e62JUfERqaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlP+AAKCRDBN2bmhouD
 1yKlD/93EuRKARAPjVDgCg7Tz6BhTY+bhxc7nEytNAI4vZ4OtJ1GlqJ2Gpls4DAw/cLG+NJu1Uj
 HiIuVFLb39NpB8NUiQ57nD/pyYrsN/q/OTm/Kx0nMWDPdBr8nk0M7es8wzO6qWuyx5+fGo/LU0r
 Qz4/vC1gexiK84mPLDSKgTb2SPGg6Bru5qTJ2PErXdfXGfsSW8dvWvKGaB0FTN6+kFEICFuL3Wb
 y+eEZvgXCp5BPros5GAYv5sHy2MiIliaH/lmYVbZLO56SEbFFuFjO4Dd7BpeqRN9Jh4mgjOLQNN
 M4FZ7CLf6P15dbQJHfdaJFPKKMw1E3Qg9kV0vYDy6RNWv8m6W+5I1VtFMzVvQOZlUZ2TLUwQ1Gl
 PpOdg7qKgdKZZjBt8N+2N//PORXjsXivFSl4qZlembiyf4GrMjJJMbqDA1erqLBPKCm3Uionqnn
 +BKmNPQNxd11+oL0XcmisHn7hNuDSFUoChjQGsogUAQTNdX4XfPFuRjn7Zbghzv+eYKfKpmIKf2
 TJS555OhH9qcF0NmvIQQnGSLpnFjeSEapja51Q4h8MT/yxascjqHwwRNCVlPZ2KPVeMTSbJvhNV
 VCwl+iULO7/IPxKR8g5iPJcKpSPPh2/6Q8RE8e0Z9wx6RwsWwOc36Q9nuek1NdhARs+3HqVDsiO
 fyXzkAFdIBLmNmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Several display bridges (e.g. LVDS to HDMI converters) are used as sound
Digital Audio Interface (DAI) and have '#sound-dai-cells', thus they
should reference dai-common.yaml schema to allow common properties, like
DAI name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/ite,it6263.yaml       | 1 +
 .../devicetree/bindings/display/bridge/ite,it66121.yaml      | 5 ++++-
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 ++++-
 .../devicetree/bindings/display/bridge/nxp,tda998x.yaml      | 5 ++++-
 .../devicetree/bindings/display/bridge/sil,sii9022.yaml      | 5 ++++-
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
index 0a10e10d80ff..b98d942bbe19 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
@@ -28,6 +28,7 @@ description: |
 
 allOf:
   - $ref: /schemas/display/lvds-dual-ports.yaml#
+  - $ref: /schemas/sound/dai-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
index a7eb2603691f..ba644c30dcf4 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -84,7 +84,10 @@ required:
   - interrupts
   - ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 5b9d36f7af30..655db8cfdc25 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -69,7 +69,10 @@ required:
   - vcc-supply
   - ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
index b8e9cf6ce4e6..3fce9e698ea1 100644
--- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -81,7 +81,10 @@ oneOf:
   - required:
       - ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
index 1509c4535e53..17ea06719b56 100644
--- a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
@@ -109,7 +109,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1

