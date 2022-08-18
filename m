Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E8597E71
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C29BB4E2;
	Thu, 18 Aug 2022 06:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDFBB7B3E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u1so874912lfq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3lKvSLctByK0zaQtA6Zi8eoMtQj42Hrxz02cVPPHF9Y=;
 b=WdtbeKlQvJsYj2WMvztp7RbB2d27anQdkC/S8ppbLUke62xlXRV6AL70R59/rktGaD
 aMriqETm0kF/5YRl0jMh7Fmj+udKG73AevbuWz1ounWn4GFPTSrNV4gKVz0iTFp5QZlC
 E5MWyvADKw2du/r86rc6W+IsvgdKIS6IC+MpOKHi+9SieWDtOBYWtF7x2cqidmnRxqsV
 a4zJyFcrcSF70SZu1Xe0e38qk8opfjxzhKv9MYbtlcMMiiFnA4Eo1bOqj+LVb3mXgRfP
 zM7aQPpRSxoOLpVkxwCx8pkUKXOyexhWoeD4KYQNbeXALzUgqyQ46Qe4O+F13tqzLzOO
 c5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3lKvSLctByK0zaQtA6Zi8eoMtQj42Hrxz02cVPPHF9Y=;
 b=Ysa2rYpV8TYm+Lt7sUuHtWd7bR11QroC9N77Rcv2G31IhHyX4kExXbFHhvH2c2YQdE
 kEcBiOeFC9hWrFwbUfJo9ca17eXHaDrphSclfSmnF7FJjHhQwiRTkigtUjl1zF24RPqy
 panVAPO3751ZpCa9Q98Qc0Cka+pUJiKcbzR7XMVPvfiZZp0N+sjU2j1R2+n179fX+GlH
 SFSIKlRHsXmrLZTUCrS+rV+uXoaf7kjP9VuC472cEuHT8dlAkbDcwwU3CvI5/GupEzNL
 kJsljj3N8EZEzr5GboFlYRMawBaOrUrhywaWxbwvlQYQ0VRyuKRrbt/iLwUpIZUMTs6O
 zvAQ==
X-Gm-Message-State: ACgBeo3NM3t++07M2nMjJr3Z7pM48zXbmaiVbuGvj5dUK1+QJqCoQ4MC
 5Vdo8csKtHg4qFyuW8Bp85DDtA==
X-Google-Smtp-Source: AA6agR4rPJNr1Z23bdYVXjYbH/epwMhSaP+1kE6as9hyHWK9eejt9hdliKqVf3C3FTtv751W8tpIrA==
X-Received: by 2002:a05:6512:3b88:b0:492:ae89:d6d0 with SMTP id
 g8-20020a0565123b8800b00492ae89d6d0mr455491lfv.381.1660803435694; 
 Wed, 17 Aug 2022 23:17:15 -0700 (PDT)
Received: from krzk-bin.. (d15l54bxv1k5c31plwt-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:671:aa32:2bd5:8994])
 by smtp.gmail.com with ESMTPSA id
 t11-20020ac243ab000000b0048b2ba11520sm92734lfl.165.2022.08.17.23.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 23:17:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: gpu: arm,mali: restrict opp-table to objects
Date: Thu, 18 Aug 2022 09:17:13 +0300
Message-Id: <20220818061713.9611-1-krzysztof.kozlowski@linaro.org>
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

Simple 'opp-table:true' accepts a boolean property as opp-table, so
restrict it to object to properly enforce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct typo in msg.
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 3 ++-
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index d209f272625d..2a25384ca3ef 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -74,7 +74,8 @@ properties:
       - const: bus
 
   mali-supply: true
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index eceaa176bd57..318122d95eb5 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -101,7 +101,8 @@ properties:
 
   mali-supply: true
 
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
-- 
2.34.1

