Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76452671279
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AD110E667;
	Wed, 18 Jan 2023 04:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470CB10E671
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mg12so7933570ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTx+1Coi54LOnYrnhd+ya/yYP+FV6K4iB87FWebW9I4=;
 b=JHgoNwmcuYXX99rj90Nd8yfF4raJhBWT4ayVIwvzsbbbs4LrAeBHp25lwcZK+htRmi
 d1jB4Fm3p+QaYbCLELP3UC1ewaNExWAC6TYhegI12p1m1Mh4li+S7SkaQPGhu//iDZ3l
 JKaDwR7NoDYIfnZ5P8xSHy1aALqaFlHwFhdBfqxLCDrYcJrvzbYrRlh3nQMZRUuM+1YS
 W0wugI+ZTRK48S6i3wc1GHvLpvHwTGBi1fT6ij4o11EyJ1eEChlrwdBKytOYmMEcv8hq
 S8p0h517guam14ZJqR77YoK4yr+o06ATXUmycxRw0zjvU1zIv46QdReiWGJdp94SL9ZR
 8bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTx+1Coi54LOnYrnhd+ya/yYP+FV6K4iB87FWebW9I4=;
 b=oLNbWRSvu8Hdt1q9O5eKmVQ0rgjIYAQKMseYz5+5loChTL2pgl80ZS8HWTw1X4LNyf
 okPb1QOXczLk5psNWr3txURTZfzNVmxOQXMqxBSS4rxAJaSKhahGGJNUa77EfpGIxxwq
 NI0rfrk3JOBcVIGFJEGCdVemkcfnp3G/2yxnF44IzzMRceD5o2+5hvwumOSkpHYMjL+l
 ka6mWOIg9cBgkpTHI/F+rmNeuBn3QrB8qKi39dUXjAfOal3V5PDVmRbm3W/FVwlloSRI
 8pmfHqdyUmdt04MQmWQLmdfBamNETp8xLDDJD2t4c1yJGC281vLbu8swQLKnF5LB25eV
 VT6Q==
X-Gm-Message-State: AFqh2krzcS1RUc/1nAQvjGCQaLGQB9EcDG8nEptv/6y46BFIOilzVtOY
 I0JlYXJXUnaYxVnHVOJN6+n/9w==
X-Google-Smtp-Source: AMrXdXtlkkGTXQZBZZoAEZl0QqIOvT2QgvPJJHYHGsc+ZH7s0aJrWVclUcH9zbrRZi4DNWQKFaTGYA==
X-Received: by 2002:a17:906:758:b0:84d:12d8:e1e9 with SMTP id
 z24-20020a170906075800b0084d12d8e1e9mr4642744ejb.41.1674015177839; 
 Tue, 17 Jan 2023 20:12:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 10/11] arm64: dts: qcom: rename mdp nodes to
 display-controller
Date: Wed, 18 Jan 2023 06:12:42 +0200
Message-Id: <20230118041243.1720520-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index b688df272207..027eb99340e2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -988,7 +988,7 @@ mdss: display-subsystem@1a00000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 9d4b785409b1..4e17bc9f8167 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -699,7 +699,7 @@ mdss: display-subsystem@1a00000 {
 
 			status = "disabled";
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8953-mdp5", "qcom,mdp5";
 				reg = <0x1a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 97979f7a8050..5321b217c1de 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -934,7 +934,7 @@ mdss: display-subsystem@900000 {
 
 			status = "disabled";
 
-			mdp: mdp@901000 {
+			mdp: display-controller@901000 {
 				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2ca2f75f2aa7..5827cda270a0 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1497,7 +1497,7 @@ mdss: display-subsystem@c900000 {
 			ranges;
 			status = "disabled";
 
-			mdp: mdp@c901000 {
+			mdp: display-controller@c901000 {
 				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

