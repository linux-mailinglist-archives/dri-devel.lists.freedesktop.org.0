Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C62781CDD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 10:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F06D10E10F;
	Sun, 20 Aug 2023 08:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC0610E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 08:05:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ff8a1746e0so3422034e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692518747; x=1693123547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
 b=FHCJb70x6bgYq7af5DTY604C3eCpKukIc5sgg7haKJ4ua8rxdXJuvyocaw1yuQcugD
 0gDj8xVX2Cobul2yuq5N9QJs86IDZgiiAEJAzhND9QIr4a/6N8QL3GxbEKR2md8A3kIG
 8rEtxyNh7KNArT4z9Ec6c+B69BH+I7bYmKnFOjJ//SpYsWIwJnAkivpgv5vynzEy96KU
 0WsmLZDrWzgvPsc72k4ZqgUVBorcvCGQrUbnctVv2zXznuodrTaIgXV0H63DUHu1JbkE
 sabbZdDLBSVBv06/UJnd421Oi8mURK6cKtmhPpBcYpD1oIuI+ov/mdMCRbwDMXvYRsQR
 Q8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692518747; x=1693123547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
 b=NKPnuXATv23+0aIYV6315G5bpJ9Fk3b+014Fdu9w6OPeTiVZMIt0iN3fv8lTRa/kgA
 uxn39gYwTbnCA1GlTzLPGiZ8bvmomS31ny6Fo5KKvAgB/td4BT7Yfih6suHTwdET7sfz
 s6lkgNd0NCuvIwtlDmPkFhM9KyDAO/gs+YQsHL1Sdux3NGoHvHYW8PV4C8CwNDDTAyHb
 u/pzKOqEVXJY9UgsJVHFawdGu3pdp/i3ZLVrlppeD3uRiD3URdur1r99hgGKS0jGt0Ca
 4hEjC0VTeRURbXWWipFQ0zPND63LAEIm1Ve8+AQu+mwr+0x+iFN9wClioq4KOQq0v0Rn
 UQNw==
X-Gm-Message-State: AOJu0YybJso9VeSI0AfWOqisFh79uJMoYbv/8NqSoLmcGs9WQm8L6nMw
 E56BaK1QgoEX0JZwNo/xx1vlxQ==
X-Google-Smtp-Source: AGHT+IHVSKGunxzyjKs8EiRSL/Ef32A4iymXe6Uj4pISjyjeo+J1tZB61PFmnIeT4X7LrodP9G30VQ==
X-Received: by 2002:a05:6512:3196:b0:4f8:5d2f:902a with SMTP id
 i22-20020a056512319600b004f85d2f902amr3217400lfe.60.1692518747125; 
 Sun, 20 Aug 2023 01:05:47 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 b1-20020aa7df81000000b00528dc95ad4bsm3256338edy.95.2023.08.20.01.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 01:05:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: msm/dp: restrict opp-table to objects
Date: Sun, 20 Aug 2023 10:05:43 +0200
Message-Id: <20230820080543.25204-1-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a31ec9a4179f..f12558960cd8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -80,7 +80,8 @@ properties:
 
   operating-points-v2: true
 
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
-- 
2.34.1

