Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC56C64D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7310EA6A;
	Thu, 23 Mar 2023 10:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87C10EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i9so19859359wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aARTCK4sQSdJ4cxE9VmvCb0XymPAsWngkLF26icVX2A=;
 b=K5oYRdOH+ug+Y9Mle5NMbmdYFlcG9wrZ/cIy5NwxV9Ikqv47ML+A/yPw8BRlq+/930
 Zb6g6AYQUNZM9kux/uRsCXvCzyX6FiYlgJApTCcVRUf1IXktNfoDg1OG0s/jTivurvBS
 2vY/unzjPUm/mi5yjtTs8+l1SMJPNQAKI8+MvEnVCkOtRkxHj3pqWNYUD/hFYP+Z160E
 OHaTH/mK4MnJH6sgQe7Kgiu8Uz6YfnuDGs426pmdu2QltWmZOw1htb6+GxlHU4RsDBXl
 0qSp9F3OFEZ/AyGFbcNsQoFyl1EYh+XxNO1VutRdA39Ihw1WBhYxqLlyHRqooQtjaDik
 PGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aARTCK4sQSdJ4cxE9VmvCb0XymPAsWngkLF26icVX2A=;
 b=kyAsI7cQS8aroD+qIj3Yxwhx4lgDeNY4RNfU/9G737+KHrWq09NRQYnk74lVczChV0
 6M0a1sSryLLWtUs3MaziGenob+pXsmLsGZHqlc2f1Css3YeCb+iYoGGypZoePk3fWfyd
 VAyjReyCZNAJNbl5wDogHUqANpZOwMbpjEbBjseJKxEjefiJvX1sEMm6d4mBD3yoBQ9w
 J+tOCoNPfV+LbN4hsZAYTzrnxChdAuygtamg2mt14cjR2fiJ/X64lYb/KoNyVJJvwjs+
 1Wy1eb3nabLk/dhmsu/DkrJT7q4KsgGkfMCTjsC5eCnmIiON8FKE2KDbEX17xn6kyzzn
 nP2w==
X-Gm-Message-State: AAQBX9eDCkLxyKvOfMcAlvbMDt1t9H9DQcWn8QXNIHtIADey0D4eGy6A
 /Fj7CkAr9nLLFF5kdy6UCD3uIw==
X-Google-Smtp-Source: AKy350aBOd8afsAojbQ8LGe3Im4DfBL+7ds0nVt2O90BTkM9NRCljd+tnLDX7YXFFONFZvdCNkXl/A==
X-Received: by 2002:a5d:6a50:0:b0:2d0:d739:e37e with SMTP id
 t16-20020a5d6a50000000b002d0d739e37emr2097210wrw.40.1679567126944; 
 Thu, 23 Mar 2023 03:25:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:16 +0100
Subject: [PATCH 1/8] dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>
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
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 4c6929e2534c..48781cc56434 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -54,7 +54,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8450
+        const: qcom,sm8450-dsi-phy-5nm
 
 required:
   - compatible

-- 
2.34.1

