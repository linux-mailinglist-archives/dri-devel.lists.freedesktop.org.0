Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096F72DAE0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38B10E341;
	Tue, 13 Jun 2023 07:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976D410E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:30:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f8cec6641bso2138425e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641422; x=1689233422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o6LElsFzPxh77ZLbLkZX9VeLLGGZJsRBvmjPinVkkXc=;
 b=g/oywEaymjRQhU1bl7foXjQEsy0a+yIeMT2mXMe5MI7ASmn5aJgVayc8Gf6jGhJJR/
 OlZUxMG/NeFnqx0iZz7gGsbUUNMlZUOytTzsRSEq+De7rbFrbcunqG2WKZfAsJ5PaHlR
 4nN1i5OtCxv2xgKJUUNLBLT9su9K8iyruokPzaTaAZZoVD8BR4MH9tvHPDypuSge/W7n
 wEf+e3qm4+mtI1cfTkcrsHWaQ+wPfFqryxsTqFpjvy9N1Yx+ONGPR99XiPDfm5GSr8qc
 T/lkz/s8p8BN2u1sKnEl4l5MN2VIBzF31nxSlF5pIG0nTX02Shj31C1IO3hokDt+Heq4
 RLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641422; x=1689233422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6LElsFzPxh77ZLbLkZX9VeLLGGZJsRBvmjPinVkkXc=;
 b=ArjkzLcyVrLgMDh8Oz+4C3/Xufh63S2/5nMUyOr7Ft4Ej9LgijoRQmGWAb+LdZYz+b
 koP/mig1bv1uPvtc4lcksteOX0wsZ6EKwkBWT/2P8ZkNrBVN+ish9FfitqvTj2l5ZOk6
 rxyKhvVYCR+dkFT0K0yXw7e76VOUr6let4/ueQsnTT9931b5WqXFWaw3JCAxoEIH0VVi
 U0mDXL4JaI3U23PkiWx54uSZD9UL6dobVyPsArDCEyGBk6kG4K6bOk43vBoFQiqVhZbW
 keoc2qFvA7zTgUA2yr8lVpBiN871EOf6kbo1Y+1DIIQ/B4nJ/l05gVL27aXAfmKF4jvh
 Sn7A==
X-Gm-Message-State: AC+VfDxXnq2GyemeHOdeX+XQtiZej/RLS994WY9pgZ+n65WBDlFoXfrJ
 CiuuqpCPRZCOqWG/lChX8CFeyA==
X-Google-Smtp-Source: ACHHUZ46AM+DpW6rDbIsu7b0Q+F4vpipyMeqHrzQ6PBYqGrZ0bQMjK5H6YphB7yBciNNrxTyoE55Dg==
X-Received: by 2002:a1c:ed15:0:b0:3f6:da2:bc86 with SMTP id
 l21-20020a1ced15000000b003f60da2bc86mr8656178wmh.7.1686641421791; 
 Tue, 13 Jun 2023 00:30:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm13474453wmj.27.2023.06.13.00.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 00:30:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Jun 2023 09:30:12 +0200
Subject: [PATCH v4 1/2] arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v4-1-ac2c6899d22c@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nJqLBkS8fxRgUU70NtM0p74qFBwhXul3hYyAwBkcZwU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiBsKOLHj+O1c3irzwDgvy4v8K3CEnvzoXV3sNFLI
 TBWZ/MOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIgbCgAKCRB33NvayMhJ0bVEEA
 COS+FQe+idmgtkEEqz7yTq9tEHS6CaGoh1Ob9q1VblBAdJECLHy5kd80jtwTPUs14h0gkLfGMzsWoj
 n5OX8fHbLefY7osJ8SG54GTPzZAPthxEoJF8uJnlvWkR/uswfKqOHnJlkctUbwdM02wOz0CFr+jIO+
 CXIFH+IVwFQnSKOO2VipKZyyC/FKtE53eCZp3/ZP7CEmU/xU6W825axHy+Be4UBesTt1tW/pS0h00z
 NViaZUit8VV/zTWPCsbJBgxHWT6/38UgpqjPR70H6F5vZRTmmdYPiDn9kCiixJbymkKg57whJyQ2Kv
 ZKP1N6xE/0MJA9v7L29J6Be+SRKwwHukGyhWIg9LSfBvCIgR7kU+U0/mRR19WiKagNyWuQ5w1kaJry
 2lRXZD30w9IKVLJyf00vm5fBrpRO7pCDXcPCsiZdnMmMoXmvlG9U1gE7N7BeS6yH9B7Kw9XYF29Ggw
 c7pi1WqlV0M9A6nZowT5gaKhZHBu6P3iBKUuy/GN2j5bnYvCWoCIYIs44opf1xmaQzANJbh3pHgAek
 B4YdZvUT1L3jj1vdQr7XW6Lfsh0XT4V8H51IvWj8O80J7BhWq4dOQsv+8u2pSFWvU5LSzoBhhQbVPr
 pR1I7WPVHtEjIoX8PJN0j3Ng0awH4YKBj3/fjmL1TT55/mDSA0oL40Ey/f7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"low" was written "lov", fix this.

Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 75cd374943eb..972df1ef86ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_lov_svs_d2: opp-52 {
+					rpmhpd_opp_low_svs_d2: opp-52 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
 					};
 
-					rpmhpd_opp_lov_svs_d1: opp-56 {
+					rpmhpd_opp_low_svs_d1: opp-56 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					};
 
-					rpmhpd_opp_lov_svs_d0: opp-60 {
+					rpmhpd_opp_low_svs_d0: opp-60 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
 					};
 

-- 
2.34.1

