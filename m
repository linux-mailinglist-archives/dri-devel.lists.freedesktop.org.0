Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB766913B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC3D10E9BC;
	Fri, 13 Jan 2023 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B8610E9B5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id v25so32066128lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAxGWhkR+sGLWasNMFlzZesjFzaUZpYkAtY7w3ETX04=;
 b=QHVcxOKdLZ663y8qMHMt8b+YIOuayY5GZX90/S0jOruZSithZMPQinIn+nMP52VNbu
 dm2UMlEDAFL4J7967dZ9Zlw8HaCJ3Ohn3muP42SQqCWm3RxSLFZoCt+QKfQ7lTjCclKi
 VBtTfR95BYf2dGXtI2b1Tte6ijmVRYIF5NdruTCEsM+qsIn50YL6fVpfkniRqmcwPABy
 SrKn5ObEUwZhNb5nJsI8cc6r3IPBra5pWrsv28eoagKaPGfnZYEpsCBfDh581rtgc+LJ
 GU9LgsKAtaLPrtq2hoNhNHUJHiPVhrUP5uSdBc2OQE2hdjY5rzpoXMJ1bPCrZbIKYp5g
 uzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAxGWhkR+sGLWasNMFlzZesjFzaUZpYkAtY7w3ETX04=;
 b=CoABddAFaNufNUibnxkBI1r1zJwg3NWsmtkb1maA7js+wtNBYWvmS+EVfNnjqHdMn3
 tio3Kk+ySUYmBoZrQoORtNqfQqVVWfWC7g0/5itpPSYA/KCeUATlgrjF0fkWojFXhMAJ
 BibCV5KzN7gt15bneyE47cU46qLZQJEt7YlxmjfkTf9a2GoycjqCd7immsHDYmcgKWOP
 JOLR+Pa49F5oRR4G4PvJ7Bez79U3e0rxZ+wDuYl1lwC/SnFMycsvRK2XPsEep+oA2Hpp
 ljrtMQENifdoRwB3uCLni+g2Yzp26TPFit9gZv1SLcHOW9Cqn2zhSI8yp2g67qNCrgxh
 gWOQ==
X-Gm-Message-State: AFqh2kpK3geSoqWn0C8cRePXk3fCFj+Mz0a11rTPTPPU68gztsfLoo8D
 zvLVD32p/LTRJvnBnjj9GQ7vgA==
X-Google-Smtp-Source: AMrXdXvFFP1XOuKfc2DLTQZwZQC8/8KcNqEVn3VpCMy3Jrqn/JuRW/LXX/8KpyMMcbjdR4KyFu78WQ==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e64c:aec6 with SMTP id
 k3-20020a05651210c300b004b6e64caec6mr27180183lfg.63.1673599053166; 
 Fri, 13 Jan 2023 00:37:33 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 07/11] arm64: dts: qcom: add SoC specific compat strings to
 mdp5 nodes
Date: Fri, 13 Jan 2023 10:37:16 +0200
Message-Id: <20230113083720.39224-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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
index f4da50b2c007..df5871847778 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -933,7 +933,7 @@ mdss: mdss@900000 {
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

