Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9D6520DB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B4910E3DD;
	Tue, 20 Dec 2022 12:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2C010E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a17so10431769wrt.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7tCG2RVp+L8qHK6ZCOnqZpsqAhvGiGNti+CNMhR8tY=;
 b=ffyRCS2eCVKTryWXqz8CT2NMUZJVY8SDdeQUiDy7E8XS/irF1nKsOboxRtIH501w6i
 BmY6oH1AOaJkmMvkTD7vhKoKdKDxRS9i+A74OfqwTeOArVvva61WIR1HkZY685HGPRru
 bGwmDtp9qX4mMqlJSJ/zO8S0et4BRQUHakShMRZio7/EPvSFUy6XJVNBEot63BbZszP7
 I6pM3Y9VrWFTkn8ahvAvv+BoTnkqjaAb3C6ZIG2zR6bK1QwWus8FnzeK6T5d9Vt20Dwl
 mAxcH/26v24jkViLHp24lMxQ/diS5jdh3J7wKsft4/SGmnWsewoaVB7Y7OyU63LVj19C
 8suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7tCG2RVp+L8qHK6ZCOnqZpsqAhvGiGNti+CNMhR8tY=;
 b=Vj1mlBjygOBtWZSi1W5CjIt6q/V7IdA2DaMBSM47Wq6vg23CZzmLLoRtWstEeokA8B
 IzKBYu7LgDZTxtL4a+JUwZ0SpoZ/rIsWRjOKSzkXethHxdh1Xjz1Vq3JLkyy97ZRfzJA
 wTe/+hIr2pib5Oci9nyboRyeKZ/nL2USu+QCnZDRs5tq1o6RCcJVMptRTH2P4Vi7su6F
 J9vm90NlEInChG4EoUVMzwtwZOYKoY1PfwG+Ht8zLATpJ7Ru0KatQ7KpH5yVUzxWJbNT
 4EE9mRmmO+bA1WTnseY7R7+NcnnE0DP8bWiPhV5aj7PH3dCbCiCmgrKD+V/Lc3sSWsph
 o/zQ==
X-Gm-Message-State: AFqh2kpQxmIZbRv7SQBQOrah84wbgnjc3smmZyGvWHcbm/uEnAG/H0vO
 Mt+f4uEYzrvJQ82NaCh4Sx3QDQ==
X-Google-Smtp-Source: AMrXdXv+Mu93c4tBp5no0FI1gfLVaHzebCHZzfVM85absa0AE+HC3wozZF6AHMDlrvtASq1J8xyWTg==
X-Received: by 2002:a05:6000:714:b0:242:fa3:3824 with SMTP id
 bs20-20020a056000071400b002420fa33824mr1848694wrb.12.1671539813554; 
 Tue, 20 Dec 2022 04:36:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:53 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 14/21] arm64: dts: qcom: msm8953: Add compat qcom,
 msm8953-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:27 +0000
Message-Id: <20221220123634.382970-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,msm8953-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8953 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 32349174c4bd9..acbe100d9b5be 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -797,7 +797,7 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@1a94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x1a94000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -867,7 +867,7 @@ dsi0_phy: phy@1a94400 {
 			};
 
 			dsi1: dsi@1a96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x1a96000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

