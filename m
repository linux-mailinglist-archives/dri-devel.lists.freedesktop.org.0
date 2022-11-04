Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2A619748
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD410E75D;
	Fri,  4 Nov 2022 13:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0210E74D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d20so6259926ljc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z653ZyragP85l79izzTl+UNCeX6ImVJawc3srCeRWhs=;
 b=Li2D0pkmDvWiyUO4KNKPJ65HCQ84aC2EXJLc9HL1kPMQTdNt3pt7+bqYQpYCjKlwWm
 cuBwzuYt3dLxI26nWoMISRVOu2q7oauia2fM1atoY7T3qhx6e6Au42tz06BJ8lVxoNhu
 XjshHE3+953F1S58gjXJUhfQE/4vwULhkth8ZjOCvQWD+Hxem+ycsqAPz3mc9MzZquNs
 iib3zdhgVx1ipDZcOJUtRtqcsLHB51DEuDFh2KLG7eXpBWQl9q7enyEskcCSSeU4k2tc
 eIzDN5FmeqmJpycx/SWbf3BW8P3uC/MLtcfzlS0G4uGpPkSfwNPwRmnmHPkBbpA6pTt5
 RMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z653ZyragP85l79izzTl+UNCeX6ImVJawc3srCeRWhs=;
 b=YrqbOPC5uLmpeYmIqJ84asv/whyeLWQ7kSXFeGaqyBNeLu7Xa3dc36XAE9Gy/VLsna
 fI6SZXCGlGFrYnwd/wyBpO1Dx/sSlJPiY3kDaqcyjyHkuiXlQn+J4tA85ND0fpKXc6wH
 KbkG6lHH0s5J+MSDMOxkddi5goIThCMZcblooDcX7V8uwe+CmyjDLWSdvHfxM9dm6pe5
 /PX3ceYFTYNcTtTRHcjJtu0F4spxuoTSpJ1QR3CBGZLgL0D7wkGq7ykXK+PVvTBGjOv1
 LtRm265SBbvL4a8cdDUubjs3rRRcAKWvtuSkGhwHmdcD97bjnlwi6KWd3i7ZRswOU5D6
 XAQw==
X-Gm-Message-State: ACrzQf3V3iUqkMEHQ0YYyPre/7vpq+KF2Ke5TSO40ytdTrkXwzrCWVRp
 49qlkolSxC8QjJYhuMgiL+rb1g==
X-Google-Smtp-Source: AMsMyM6Xa1uzq8VNmdLCLapSeOr9U4p+WMZ6ZNJTJBHzgLaYNzYJhlIE+5w/qH62yG+5tbokTXJpQw==
X-Received: by 2002:a05:651c:1034:b0:276:e452:1184 with SMTP id
 w20-20020a05651c103400b00276e4521184mr2145285ljm.240.1667567641449; 
 Fri, 04 Nov 2022 06:14:01 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 1/5] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date: Fri,  4 Nov 2022 16:13:54 +0300
Message-Id: <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add another power saving state used on SM8450. Unfortunately adding it
in proper place causes renumbering of all the opp states in sm8450.dtsi

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index eeff62d0954b..250e6b883ca3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3197,35 +3197,39 @@ rpmhpd_opp_min_svs: opp2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_low_svs: opp3 {
+					rpmhpd_opp_low_svs_d1: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					};
+
+					rpmhpd_opp_low_svs: opp4 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp4 {
+					rpmhpd_opp_svs: opp5 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-					rpmhpd_opp_svs_l1: opp5 {
+					rpmhpd_opp_svs_l1: opp6 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					rpmhpd_opp_nom: opp6 {
+					rpmhpd_opp_nom: opp7 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					rpmhpd_opp_nom_l1: opp7 {
+					rpmhpd_opp_nom_l1: opp8 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
 
-					rpmhpd_opp_nom_l2: opp8 {
+					rpmhpd_opp_nom_l2: opp9 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
 					};
 
-					rpmhpd_opp_turbo: opp9 {
+					rpmhpd_opp_turbo: opp10 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					rpmhpd_opp_turbo_l1: opp10 {
+					rpmhpd_opp_turbo_l1: opp11 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 578e060890dd..69aef395d85b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -168,6 +168,7 @@
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
-- 
2.35.1

