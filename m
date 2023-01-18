Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DAA671273
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1C010E675;
	Wed, 18 Jan 2023 04:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6971510E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id vw16so17122247ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
 b=wEwM3ODNU0MowFecviicvfnDW0dJpG75Qv0ExZ3a3pelAnpBJasRKpOnZ6j6+devK9
 HbVPw2a7RTyw0ZVqCywthztmlTNs1lHeNCL6tx/zvKdeBUJzlcT8EzYq9nHnXJk2RBgm
 Jz3v4CmJQmEkyTwBgZleRXccoDE3WQqi1rTT8gdjxOs+YsuzHhyRgVjJ6/BjBxXpGPOw
 kmRPRI+I+tVVCv3v/pnI7Yk1iuAtDywHHXMmEQdTOLTQGgUMeA10rOPPjUgmOLf/Okil
 911bIZkfxJ6axICvWAhMJBQp15XR2wcNAkbow09GzWWcb0cD4S4k7b8llqHod74Fscd3
 HLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
 b=5mzbjQK3xnDvHQ4CXYc/t34c97y5o3gqSpD7ICmhwNx+tdGYKf8huSkT7RqzTd0hdZ
 WrUItZs1YdqCamh4LtB1sFR/tEsUvlEZID6IbGaPRvI5KR4HpCG2T0ljxcs8EXc84biP
 H2d9c2z21L5zYLw+zmuDvPt8+LV0dcjFGTC28t++llHH6cSWL4SRVHvhrLNuukWkkwWX
 mifzs0r5acJTTNhOr0BAShqK8mssPwFzwepqcSV3Spe/ezw9OiYe1r71gZSMskr8Bldv
 7Vj790sgMKvavoawZ5lzDcM3dI60v/fTxsVT2YIvPaTwtO7mD3vCJfmiZsUE1z5uGcN9
 SeKw==
X-Gm-Message-State: AFqh2kqi4xmX+098SwoqzV+inc82xzK6vurIJ3Me2W5vnzSfj0/dAzk9
 +JmrcPv8DPgvA1LYt/t6zwlZ8w==
X-Google-Smtp-Source: AMrXdXvN1wWQAbY/8RhWhTDjJ4y3Gmo4ScpVY5GcZ+s1FciLYFRvitJ90f6oITqDZ2nrIsr5sPAzxA==
X-Received: by 2002:a17:907:9623:b0:869:236c:ac40 with SMTP id
 gb35-20020a170907962300b00869236cac40mr6677727ejc.31.1674015174016; 
 Tue, 17 Jan 2023 20:12:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 07/11] arm64: dts: qcom: add SoC specific compat strings to
 mdp5 nodes
Date: Wed, 18 Jan 2023 06:12:39 +0200
Message-Id: <20230118041243.1720520-8-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device nodes to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi  | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index cf248e10660b..68cdf255c474 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -989,7 +989,7 @@ mdss: mdss@1a00000 {
 			ranges;
 
 			mdp: mdp@1a01000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b8cf5c461d98..c05d2a85247e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -935,7 +935,7 @@ mdss: mdss@900000 {
 			status = "disabled";
 
 			mdp: mdp@901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e08ead06d4d3..d1542335be74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1498,7 +1498,7 @@ mdss: mdss@c900000 {
 			status = "disabled";
 
 			mdp: mdp@c901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d6908aa4c6e1..f0f27fc12c18 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -142,6 +142,8 @@ &gpucc {
 };
 
 &mdp {
+	compatible = "qcom,sdm660-mdp5", "qcom,mdp5";
+
 	ports {
 		port@1 {
 			reg = <1>;
-- 
2.39.0

