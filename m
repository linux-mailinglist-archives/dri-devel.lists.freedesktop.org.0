Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B57E9203
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E51910E14B;
	Sun, 12 Nov 2023 18:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C7F10E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:44:11 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5b31c5143a0so42985377b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 10:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699814650; x=1700419450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3sqqPllgETnwwQvfwmEwhxp6/p5QdcAaEjx6oKJg44Y=;
 b=q/49C78WdH8ET8zhtSgFDZIDjGpgKveao3t8PgNGnk/ZDtPZMcHQK1ZLthxc3+vyzh
 QWREQPO6t0pduz4f6sip+8daGMHqhyNjPM2XhlyNlvhVx3Q9pPRrAL5bYGzAMA2FFJu9
 J7cCmg8OJWKBYX93j7zTYyevkeJS3QYF86hva32LpjREZvWQU2tg98ftTka8U0LH3zVg
 7YR3HMC3XKjOhZFvIpchjezuz1c+zUzM/SjFxRRsFeJpX8TpE3qRIqQZIxWh4JKDswXi
 XkCwKZWzVvrhgQzvIkhNoKxkM76uokJf95qH/xrazKXIG0cAsTZAJjZNMwMP/8sgLqe9
 zCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699814650; x=1700419450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sqqPllgETnwwQvfwmEwhxp6/p5QdcAaEjx6oKJg44Y=;
 b=BqKo2/PH+SGV92sw7E4VpeiBucEI5ZmlC2l8V5Tq7iLaJ65L4M/TfbxhOeOsai+boL
 V2FO4hFkWilpLNndJCWvfYTuDUpuPqJDQ60DrUNsc5n0TXefldrOJC9cxnMiv4oTqIXF
 ne8EPreFU9wKRS5fDk+Ke0WxE+pKBvwTTxIs6cOo4+LpaykbfsydorzMQkwSCwvdCeMg
 EazezrQIC+aa+rSrM0mY5ibQtyBonFHMQ/IoJZdIJdIFmHybx+5G+qDRnvwrZXUeSdfQ
 75GUVG5Bi4hr0UFZrHT9i4Gc+Z5xr2uMQHB23Qv4HPS0/p8iUjbcvfz3uY0IXSiq4ahb
 Ed3A==
X-Gm-Message-State: AOJu0YzkAjvbmel7MIv31whWBpJSfvkJXwMETgczD8pu/v209OD0qH3s
 8xBeoLJi8hezf/kWfClHZmyl/A==
X-Google-Smtp-Source: AGHT+IGGlUk61F4BEzF1VDsWt9xVT4gMPv8utBpaeVZEcfGMjrCm0u4YtgErk53VC2pVhXrV1Vku9w==
X-Received: by 2002:a81:5201:0:b0:5a7:ba09:e58b with SMTP id
 g1-20020a815201000000b005a7ba09e58bmr5191792ywb.14.1699814650481; 
 Sun, 12 Nov 2023 10:44:10 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.170]) by smtp.gmail.com with ESMTPSA id
 u63-20020a0deb42000000b005b3f6c1b5edsm1308938ywe.80.2023.11.12.10.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 10:44:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: gpu: samsung-rotator: drop redundant quotes
Date: Sun, 12 Nov 2023 19:43:59 +0100
Message-Id: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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

Compatibles should not use quotes in the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/gpu/samsung-rotator.yaml         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
index d60626ffb28e..18bf44e06e8f 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
@@ -12,10 +12,11 @@ maintainers:
 properties:
   compatible:
     enum:
-      - "samsung,s5pv210-rotator"
-      - "samsung,exynos4210-rotator"
-      - "samsung,exynos4212-rotator"
-      - "samsung,exynos5250-rotator"
+      - samsung,s5pv210-rotator
+      - samsung,exynos4210-rotator
+      - samsung,exynos4212-rotator
+      - samsung,exynos5250-rotator
+
   reg:
     maxItems: 1
 
-- 
2.34.1

