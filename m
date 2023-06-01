Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63872719874
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A6B10E227;
	Thu,  1 Jun 2023 10:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610E710E246
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 10:10:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso725647e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685614204; x=1688206204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sY1We4qYQqoWhZd32M3qvVq9EFogwk8bUgcdgefUaYg=;
 b=RIyPaMt0j2FCUZjMmBjUlH0p6Dct9E7GEV69C8HaRd0iRVA6dsE6J16zCkI/lKleo0
 WkSqo4XyFGJDi1BqPX9NMYcPwqbE1BCodgv0QriY7ZF4sPmINygF20H8quVtffciZNRD
 jzZYnmzkQ07G7xNxxaqruu2BEjagNjkf84sm2Kf3yVgKUsr5t3X9Kza0NqoxjLtENPjd
 6Qw7Boqvhlkx1R2GF/WVCphCK9fYVr7+TyoXP3M6KR9YWtL/EJ/A+rensy7dx1/6CBVo
 j9PXjj2N24QhqDMW6cMDh1vqE9cDfG286IkNEYNYrCysbOaj2cM13FhHKYfR/FpMRHPw
 rFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685614204; x=1688206204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sY1We4qYQqoWhZd32M3qvVq9EFogwk8bUgcdgefUaYg=;
 b=TVeag1aB7Eh2FUtEG3yJ38RgSNzH1IHbBDISCrf4/BULH/afdlBscIwGfmtCWPDyXj
 z/9kICf9EY9u6DsWUCnNgRfVogjZ0G2umW2Zl25NCSO0uHokSo5DQz3ntSUXvr1Hi//g
 K1LbkWGNmXfxNnEbXTblBf61e1qOJYnC3rYE4UKLgV6R/QrrnPwJYiagYPdLZwjZPPbX
 pRL+0lI2cQi28ezNtwXTYH3Sy8VEOO6wcQSlPtpeDEUFgeJLvyGKwqk27KGdjTHzTX4q
 1Hdhgw57SoUvavuH9K4FYmX2l8wO/Lt8lXy9eztx9cYlgKK08VBdUXB/CT9feO4/bXwn
 XRhw==
X-Gm-Message-State: AC+VfDy+0PsHmpxVhaTv8FCK5rs4PmsBOWKJjBE0Hgeh6Tgth9MnRATS
 ZjUVDA+3Mr1SjuZ6GifOrqt//Q==
X-Google-Smtp-Source: ACHHUZ65TRjKIjH36XsJnqcWHxy3HM0YdUpsaedx5ubl2+mAXMVmYvzVt/Gt2BmsypY9M2Hz+tReuA==
X-Received: by 2002:ac2:424f:0:b0:4f3:baf9:8f93 with SMTP id
 m15-20020ac2424f000000b004f3baf98f93mr1055227lfl.3.1685614204494; 
 Thu, 01 Jun 2023 03:10:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfeb46000000b0030ae53550f5sm9683845wrn.51.2023.06.01.03.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 03:10:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 01 Jun 2023 12:09:48 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v2-2-e8778109c757@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BYB/JqR4EQKAABvrcd/B6Yg5ojwBRjwkuwpOgjg+m3k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeG54bhNVdQN6AtyD+AxffdNrLX6hlWEkxTXj8vsE
 qBWbcHqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHhueAAKCRB33NvayMhJ0VxxEA
 Ch5pApwPR/p754sUMBx/sMt4sn6pnr2AeyXiUzb2+MaN3Fwcpo9IjzSvoT67PglpF5yQps4Yia+AEH
 JNS69njWUnGW+kJij07YFhspaofhY/9xX7aH7fmQ/npXitQ2h7mmglTQVZ6RiJ2Z/cuPm71RpU0cW/
 52r4m1nxpE9gcFKZD7MOFDtI53+xNsCQkTkvCkpl8E5uPC1uucg4+K2/P6VQt09UJ6c55ik/v9b1Jq
 85BsH8E9oXH6hJc4I+4RFUCeSopEeNCNAD3LFTQ8Azg1boLV9fNV2n1YAZoQDyktxT8K1mfqwtidTW
 uPZkLSRoWMWzkrBASVujWhR6mqLjHGK4meVeMIopppxaQxSmmHg5qUdgwJliVfY3Na/YqyYQHtQ64H
 NSQsrI+0J/Tzfe8Etd8adpkTXX6PCtAoQVIf3zeu4xyF9zt9ds2HdxYozqnq6mWdm+cg7+DX4XV2Ly
 POMtvSv+QPf633NEJO9l1Rs0TkTQGx7WInmITN11liIbnpL7lEdV8KwAJVdMDZFEJP1A9qPM5NPNhY
 8FdZXleXL0CAKy7axagK/uQjH6mhdI3WciatBGgVbKCON9CCQJcutT8vN/uBe2YwsRHdExFAP+mEIY
 S2eO4xSplMyEpps+kcqYPXw5qXKhT5R0OgeEcLsVltgnRDw98oOY+OJzwFAA==
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

