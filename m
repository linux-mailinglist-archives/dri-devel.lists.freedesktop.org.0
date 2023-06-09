Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF36729C45
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA0310E6A7;
	Fri,  9 Jun 2023 14:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EA910E6A7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:07:45 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9786c67ec32so312181966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686319660; x=1688911660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PM1+SjJYojGEjAWqB7qXG+oGVKE+NT1y/yCIj8gw4kI=;
 b=B9bzP8KHaUay+nKM3UhpdU30byyDgOxqktPySg+JSTCL4C1fZ+33YCdhu1sXZfo2q8
 PHYAh1+j7wG6yyNYIqXywA565XlxqP4TO4W+JcvSZ6J8tM/+4JYBdHvFhOLpLyZPWdI+
 DJSp8dc1v3Y3xYhotel4J51+o5THfjoq+fHuVk8byexhvxcWi+Iz5TuO2ycLQqZL2ZPy
 u2xwzdylMjLRNDfel+LvyEMWQLqYA2A8F19ldiAAEGpRnIN+pFVwC0SmuQSONhQztcmm
 bp5C3yRKqObjut5cQlnGsQ/hQhkR+RCWVuOzKnX4UCQu1aXKUHnkT/AViRbMrSutxo2L
 A90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686319660; x=1688911660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PM1+SjJYojGEjAWqB7qXG+oGVKE+NT1y/yCIj8gw4kI=;
 b=LN1wQbMwBP5l5xUDwA2WXTM1/01SNJYqCjDhGYdkqU7vYqlk3tmpjOvRoj9AQq6GVQ
 +X4B1SE1L+CkQnY4DVU5mw7aODkBNktPRp9GDoc670MIxq7MiYMGF78uDmxwu6TwzOD8
 h2Swz1DvNmU+tHi1MTxXDZKlecMl/MkUEhrkz+pEQ5fKeU/7aCmK5L69ZK+OeByldcz3
 xvkk+DhjoAT4JRLWiEo8WHK1VmX1SttQhoo5LU58qOXYT7UVyd8CXze6Pbawr8KUzIdx
 mp/asiJxE5pxSZ17FNSWlP1eoMSgUeYjBDT9nFDlQutHKqleTKoeS628MigRH4XjhiKo
 3f3Q==
X-Gm-Message-State: AC+VfDwizPfFQR+cN9+47vGAe6A+9k+CJUJNSUfCwc2/gWTkdtzMli7M
 91KdgbFuj9agwi+TUiTMhO9kYg==
X-Google-Smtp-Source: ACHHUZ4rZbL6GyNl0wF0oxUXCCTFkxuMP5kmQvcmb210bJV7Mbm05+0wKT84SKIN6RigtsrymRZfPg==
X-Received: by 2002:a17:907:980d:b0:969:e9ec:9a0 with SMTP id
 ji13-20020a170907980d00b00969e9ec09a0mr1874567ejc.77.1686319659931; 
 Fri, 09 Jun 2023 07:07:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26]) by smtp.gmail.com with ESMTPSA id
 y21-20020a170906471500b00974564fa7easm1370518ejq.5.2023.06.09.07.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 07:07:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: drop unneeded quotes
Date: Fri,  9 Jun 2023 16:07:38 +0200
Message-Id: <20230609140738.64958-1-krzysztof.kozlowski@linaro.org>
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 +-
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 0400a361875d..e796a1ff8c82 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -86,7 +86,7 @@ properties:
     const: 2
 
   dynamic-power-coefficient:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       A u32 value that represents the running time dynamic
       power coefficient in units of uW/MHz/V^2. The
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 2a25384ca3ef..ca02baba5526 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -92,7 +92,7 @@ properties:
   dma-coherent: true
 
   dynamic-power-coefficient:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       A u32 value that represents the running time dynamic
       power coefficient in units of uW/MHz/V^2. The
-- 
2.34.1

