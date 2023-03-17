Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62B6BE523
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A14910EEAC;
	Fri, 17 Mar 2023 09:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5834510EEA8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:12:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o7so3773286wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679044370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=g6f9A8Z0wJQ7Liw9kDKgGq/YiHncZo9u6nd7/engs7YVkj+Eemzz4Xwm/b4cN92z2J
 r/p6tGJgs9BoUElT3eD04ah8tRmms2MukhdzZ/vH/lghf2jGOVkfgW5+kI4GikQGIAGq
 7jYRuIiAU7Ld6Axs4QM7OSF5cxEWwiuimJOx2+D50mP7mgnUAmEsR/J1W2YS3veWeiSw
 eYE9Bgd0KSEdHrfk7C+eDPTeTLYyIjDz0HIAW59ox8QAtq5ZF3PO1VP8VbmcPK2dOdA4
 a8bAJsQHKq5QoUyJ7y0tvSUG+6+Cyl1vpltoawUKUXt9MqUY+8bhCbbN7m8PgG+wXRF7
 FPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679044370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBcGm9IzqWfmksEDhkD68OpL5s1KaoBkDeTtWamSELM=;
 b=zpNIsX8srfOfamyakIV/a61V00tTKZM6PMdEHT0Zu3c42SmPwy9CIzRW6ppqXlIM01
 OzV/fyiwtkxCV/iMHrXr1sBjT6l5awIxNNf24PAUx+UXNnDaNR4aAriR9LOC6bR5ofjX
 wpWjXDtVcZrM1pE+fsh7AgwsbS1dCnXekW+7K48gwUnqZv287j9T24gerL+ZBuWpJ2Vx
 YM4rT+cbWeF+MptavO3kH65k1nRyIuf1sxq/h3W1NhEfudqiRILFDWQh/pGCNTGPU/Ts
 iDUzTKyNGEN+JGAmtjxdvPpbA/+Qbb0+2WM5LIlVsYerpc8S8BOgZJTcMxXAWapW63nX
 8zig==
X-Gm-Message-State: AO0yUKUrxtBn9oKKo8laTW1IoGN8IdKb7as1BwnUXlid19YWwDi0MTtT
 aILw0DLFW8yznxfLBOsljMJ1dg==
X-Google-Smtp-Source: AK7set8RabUFEkyRs6BzviFosY0SupuZ8xyha9wfLzcaH1MSqBx++FHTvp4s0wPS7ZThKhlXqeYCfQ==
X-Received: by 2002:a5d:56c8:0:b0:2cf:ebaa:31a0 with SMTP id
 m8-20020a5d56c8000000b002cfebaa31a0mr6910090wrw.54.1679044370487; 
 Fri, 17 Mar 2023 02:12:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a5d464a000000b002cea8f07813sm1467976wrs.81.2023.03.17.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 02:12:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Mar 2023 10:12:47 +0100
Subject: [PATCH v5 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v5-1-a27f1b26ebe8@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..f0c2237d5f82 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -15,16 +15,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-dp
-      - qcom,sc7280-dp
-      - qcom,sc7280-edp
-      - qcom,sc8180x-dp
-      - qcom,sc8180x-edp
-      - qcom,sc8280xp-dp
-      - qcom,sc8280xp-edp
-      - qcom,sdm845-dp
-      - qcom,sm8350-dp
+    oneOf:
+      - enum:
+          - qcom,sc7180-dp
+          - qcom,sc7280-dp
+          - qcom,sc7280-edp
+          - qcom,sc8180x-dp
+          - qcom,sc8180x-edp
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+          - qcom,sdm845-dp
+          - qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

