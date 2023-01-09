Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A1661E49
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6102610E275;
	Mon,  9 Jan 2023 05:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164510E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g13so11274007lfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GB465vGA5Oqc+Fz/FSZURBG1JtOHeRirkNj306Rez8=;
 b=vfWstl2BysB9QjsMouvqqbgC537P1c+lCVs+zvdV6AtRP50n1b/HQNZFg3qb3K38lX
 feJWOyH/1itcUzrpldw+GWPNVkgoTq9egOmHd0POp14Zp6EFiMf2zljlY57WPaRjU0tD
 7QFHmHzmOIaisAe0LWUl4liBl0lP0MfFJ61qfvRMvdG7uIGfD91EVbuiuA++c7LQwMT1
 hettwHpwxxV+eBj0QteQm3iKbr/6QhAn6YuwKY/LQglWC4hQUTsArBIrn0GuIGm/A8os
 XI1ZMld7d+PcXHR5sTxMlxY9GBRk9i2sO8dzh72H4oXsbK620OnT4L+xwz+k3s7YHdGo
 6xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GB465vGA5Oqc+Fz/FSZURBG1JtOHeRirkNj306Rez8=;
 b=gAmtYAMgzIdI5unpM4TYqrnTPrNpLbfzNxrXgVUw4TjdTXAIZRWBRgNHax++PIgPhU
 WPtulMmUVo6UHJuA7jq9hLWBfaHAyeF3YPsUEirX1aY3C+riHd+SJ8prTlSTlRikqSiM
 riASkfFpEQz+VCp7IEEdInQXqO0LoVNk7SQNrvohgLak4CyeMuOkEne6GxUeQtz+ZgLd
 w1EFmSyWTfFUCStFqFoZDpdLYfJzqFTzfz6k2V75xNgRaLb4Cv9P5CkWb8Vy3HYZseYA
 dJP/GimhFOzyYHp2RrLC6etpCGOiopYokJGRNEVHz6H0179aFmoXJQilMymkesMAxjSx
 sS2Q==
X-Gm-Message-State: AFqh2kq+4r2YcGl5EGnZW0uYfWAsKY97dpogHPMr/NpBcTrZcvldM3SZ
 suGBeBu3tUqkw0MmnmVIwgag9g==
X-Google-Smtp-Source: AMrXdXtzfclozOBI2+25b/jIKuR25HwO8C5c0ePhV3v0NTHESTWE7zzFhleqYVLZha3lZ2fPgY384A==
X-Received: by 2002:ac2:4e06:0:b0:4a4:68b7:dec3 with SMTP id
 e6-20020ac24e06000000b004a468b7dec3mr22722515lfr.31.1673241245002; 
 Sun, 08 Jan 2023 21:14:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/6] arm64: dts: qcom: rename mdss nodes to display-subsystem
Date: Mon,  9 Jan 2023 07:13:59 +0200
Message-Id: <20230109051402.317577-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the schema change and rename mdss nodes to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0a23fb6efae8..8f29d7e49423 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -963,7 +963,7 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
-		mdss: mdss@1a00000 {
+		mdss: display-subsystem@1a00000 {
 			status = "disabled";
 			compatible = "qcom,mdss";
 			reg = <0x01a00000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 32349174c4bd..c07b707ff454 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -726,7 +726,7 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
 			reg = <0x193f044 0x4>;
 		};
 
-		mdss: mdss@1a00000 {
+		mdss: display-subsystem@1a00000 {
 			compatible = "qcom,mdss";
 
 			reg = <0x1a00000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b5cd1bcad5eb..b30c35fffe68 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -904,7 +904,7 @@ mmcc: clock-controller@8c0000 {
 					       <825000000>;
 		};
 
-		mdss: mdss@900000 {
+		mdss: display-subsystem@900000 {
 			compatible = "qcom,mdss";
 
 			reg = <0x00900000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8..d951ea42ee45 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2921,7 +2921,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sc7180-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 65addd4c672e..0bceda788341 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1470,7 +1470,7 @@ opp-262500000 {
 			};
 		};
 
-		mdss: mdss@c900000 {
+		mdss: display-subsystem@c900000 {
 			compatible = "qcom,mdss";
 			reg = <0x0c900000 0x1000>,
 			      <0x0c9b0000 0x1040>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1d0198935136..fa62479206ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4473,7 +4473,7 @@ opp-358000000 {
 			};
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f3..75cd600c5ca3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3955,7 +3955,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
-- 
2.39.0

