Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18B654ADC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECEF10E594;
	Fri, 23 Dec 2022 02:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B150310E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a17so3368726wrt.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCgXMkElDYqgdV46E7QV9LorbFrf8YId9h6ETaNIJMc=;
 b=k0ee71geSmTUJNz7yZtJvcs6S3xI3neFpVvGjoHaFIz/cDKx/NgVYB1pB2NE13N30I
 Z0bVSXyn8jl6Q9qbTAXFaV9qsyGMWmfzTrmu6+pPgnU5uMX8JHjkMEjj23WF7547Rl3e
 ZKK6vlXosRZ+Xf8DUMKyuIolgZIJmkocaLz47dJjUfcblRSkrXcweAGMSsQd0ehLIVgo
 n9Wi65xcPx5AeCj5aLaw3i7kSks4/JDLAFg3ZZlSEyKq8zVcEmNyhhLVUIh3rC0fhX+t
 V5FeJ/IJz87UJ0P+VtPKyM7SwWUuT1yMy92/KX0jpMViTjR89HlqoSmRzNkXwYU+3RMj
 imWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCgXMkElDYqgdV46E7QV9LorbFrf8YId9h6ETaNIJMc=;
 b=JEdtP6jqkNPATNIw4IfF6ah2FlL9Z8p3rWfjk6e/JN+yz7/YQ7TMKk7YLMnhmJez6J
 NAVEK4lBZruk+B1dkao+WJ+FpDoShxxl/fEDmG70JsMjGNp6eSNhYrduHFWOdcpg9+G+
 Q2SsK77x+JPmNOH/75ylzAE0cItx6Pf7p896ojf4BkC90j+50c55GKUEqeRma4YFF1iL
 aylnRcNSUgSMoE5W1G83o7uZsCyK57sUini07YB3+DLk13jy4OxIaI3w8aDXBFpLSPgx
 mlHdEb2zf7s2fL3+PEHN7grgI6H2BM503CWFBkKPGRcHRU33Nyl/G7UzNywaMIfrajuV
 WZ6A==
X-Gm-Message-State: AFqh2kozulxjglVmnGbQoX6geC8xgXIMyYGpV98b2khXDE0bFwXYu81m
 5g9fFQM0dAsWlnaEopr+WPAIjg==
X-Google-Smtp-Source: AMrXdXupg6sn2BghsfuWP3nH5HnewsHoBrvhHmrybBicDxvnWfQNqbYK3rUP9h8ZUj1ToZxBFBOQew==
X-Received: by 2002:adf:f402:0:b0:270:c07e:5a with SMTP id
 g2-20020adff402000000b00270c07e005amr2713666wro.19.1671761432147; 
 Thu, 22 Dec 2022 18:10:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 03/18] dt-bindings: msm: dsi-controller-main: Fix
 description of core clock
Date: Fri, 23 Dec 2022 02:10:10 +0000
Message-Id: <20221223021025.1646636-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 8ba61fef576a5..6e2fd6e9fa7f0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -32,7 +32,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

