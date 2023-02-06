Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCF68B9B7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33210E360;
	Mon,  6 Feb 2023 10:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976810E363
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:17:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id q8so8259172wmo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GdtgPOsS+eJ2bLHEXUvSjTjV+n9xtPlHxHGyKl7tQ9k=;
 b=GkDq/JqiN2QVqai/vD26TJQ4/f/BN5gyTepuUSI/GnFvpNpgzLrF0jcp+WT1U7tSy3
 1UbE/I+T+5gj+5VNDOg/t/srQeF8WWXPvnPbnl7Hdi3z9ZNifAg/ta/fnIwdmSAtR/98
 ZjvCTg4r3j67DgVKVbh0M9o3wn1iatLTg0JJ0mw7+zMwgwfpHp5JDOIdBxsG4MMWycH8
 IRBeXBabtH7/v1ZKr0cDa/pZb4LDYQYWAIQD9se0cYMBW4/OaEf7a0h8xqf8JE/VXVDE
 bF3awOoWOLs3ZHQGeyhoAM9+SjaqYFCAIdrstA36UnOCnAWuMVKaMRytyCuu+/ASEMLp
 WfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdtgPOsS+eJ2bLHEXUvSjTjV+n9xtPlHxHGyKl7tQ9k=;
 b=YMKtE+kJvY296SH0D+cVRpUuSkqQNdUeOtgFbgs/NUDlIF6/xpJyVeVtfOo0lB/pSE
 r8tTs2DrM2yL/Te19wUWn8zx0gh4IlpkGeOUJ3NIr8NBj0gEjXxnvn0QCoY8wjuJhB0R
 E//gmVeoN6UtUBEm8N3iGY4PDS4cqVbUnH+RqTNoxbkX6WRMmER2Vr87dRpZB0/+0vlb
 Z/f+FPlTlSOsjSZFwQ6NaS06iJGrEL0PpQqUySHuZMpZ0NYy9coxO6Q2UQjX5nWps3lV
 iXwOCn53JNH6pq+zGGxG4UXbRMQ4oS6fWE5HzHUFP2gAW4nQpy60LsLcMhwLNjO0eUOO
 8/Sw==
X-Gm-Message-State: AO0yUKUbAd5FW/iFPpCeBIUU3r8TNT7OFU7t2CP5NyXB8/hy5S7UqKjg
 gvFZ/FjlD+uQQUOrieUMssCjWg==
X-Google-Smtp-Source: AK7set8yvmrfy59lqP7fsYeoisSsEETUrS8Vlz+YNfOtElScW+FNGZIRDlNRoFg775z/4fmQ2m2ceQ==
X-Received: by 2002:a05:600c:470d:b0:3df:f860:3089 with SMTP id
 v13-20020a05600c470d00b003dff8603089mr6222011wmo.32.1675678628809; 
 Mon, 06 Feb 2023 02:17:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003db0bb81b6asm11314201wmo.1.2023.02.06.02.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:17:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Feb 2023 11:17:05 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v1-2-f1345872ed19@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
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

The first QMP PHY is an USB3/DP combo phy, switch to the newly
documented bindings and register the clocks to the GCC
and DISPCC controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 37 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0de42a333d32..2586321af6df 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -652,7 +652,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy_lanes 0>,
 				 <&ufs_mem_phy_lanes 1>,
 				 <&ufs_mem_phy_lanes 2>,
-				 <0>,
+				 <&usb_1_qmpphy 0>,
 				 <0>;
 		};
 
@@ -2601,37 +2601,27 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
-		usb_1_qmpphy: phy-wrapper@88e9000 {
-			compatible = "qcom,sm8350-qmp-usb3-phy";
-			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x20>;
-			status = "disabled";
+		usb_1_qmpphy: phy@88e9000 {
+			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
+			reg = <0 0x088e8000 0 0x3000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "com_aux";
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
 
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: phy@88e9200 {
-				reg = <0 0x088e9200 0 0x200>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x400>,
-				      <0 0x088e9600 0 0x200>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x100>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			status = "disabled";
 		};
 
 		usb_2_qmpphy: phy-wrapper@88eb000 {
@@ -2727,7 +2717,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -3092,8 +3082,7 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
+				 <&usb_1_qmpphy 1>, <&usb_1_qmpphy 2>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",

-- 
2.34.1

