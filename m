Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142E6C64D8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A410EA72;
	Thu, 23 Mar 2023 10:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96C310EA67
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i9so19859472wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KpNLyip69wJmwS3OqBQsHCVctKdhVF4LiqZDmDMUITQ=;
 b=ksoJnpaK/Zy6H22m19pDj2+MsjnTWx5V52xHiYII2sZY3NnOGH/VCPayWVplJI49n4
 ND5pCgxvdcpo2zY5ivvI+6PaEQb3RUIrHghG0fXowpUPDaiRdFNFFoaptC6atp2LFDu4
 /7l8Ft9XzQI/dgI2u5Kwjzjf3EGfetJ/nD19W1xeFExSOR/0ZrGeJgeovF+mJ5cIQcS6
 IIUH+yBHXb4uTAbLYXpoijgnFWQYeSiSA6Q4cZyNbB1P4/nuqF4+tRfG4scuPUaaB4PZ
 oy7rac3DSmLy92YeMtCqS/0R/2asitjiEoWzOpdqfo6qh7rO6b/GqtLVjy5psj/Std9W
 pipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpNLyip69wJmwS3OqBQsHCVctKdhVF4LiqZDmDMUITQ=;
 b=724kJkjiCb86MoT3VAh8e8bUpFck4fOUu7p4jdEg83axSkYBlAqO4GhcOc5g4mGUoS
 fgAGP3hdPKfsHwV04+we/5gbul4GhuTcWSJFkyG9x1rgRQqAOe2hByLcT03Q6GFPM5Kt
 ELgo4DtpAxJP0yLiWNro6qqhOG1gRa2bkO44ZRTNsbAsaVu4C6gJRfS9XWKWLcN0gX0O
 YUMdORA/dxgCPhimfjUC2ES6rpfgiXS5UhJdh9bsNI43Te6gOle0S8ecHfnJ2ltEkMDi
 6sqPAkScegYRSiPlAgcXhqO2G8pZstDq/H+82WaPafsJDZ3NvyMgKc8+ro1QViOwGPss
 ANyA==
X-Gm-Message-State: AAQBX9cpskDuzjDf35FZmtJWmXSs4QqMOdlpa7Vr1bWN+Dqgs2AHqE6C
 t/AResKKwyk/2dNT33shtfANFw==
X-Google-Smtp-Source: AKy350aWTw8oMw5mfdjhhl2Uko+aQ7QMPlClfObRzjyqr46IHBi4Ee5GKUOe7E4wHzsM5OQklZnfuQ==
X-Received: by 2002:a5d:6187:0:b0:2ce:adbf:cb14 with SMTP id
 j7-20020a5d6187000000b002ceadbfcb14mr1824465wru.28.1679567129412; 
 Thu, 23 Mar 2023 03:25:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:18 +0100
Subject: [PATCH 3/8] dt-bindings: ufs: qcom: document the fact the UFS
 controller can have an ICE core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org>
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

Move the qcom,sm8450-ufshc to the right allOf:if allowing the ICE clocks
and registers to be specified.

Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index c5a06c048389..4527bcb949b7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -108,7 +108,6 @@ allOf:
               - qcom,sc8280xp-ufshc
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc
-              - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
     then:
       properties:
@@ -137,6 +136,7 @@ allOf:
               - qcom,sdm845-ufshc
               - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
+              - qcom,sm8450-ufshc
     then:
       properties:
         clocks:

-- 
2.34.1

