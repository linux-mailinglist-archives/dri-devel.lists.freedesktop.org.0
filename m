Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2068B9B8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18310E369;
	Mon,  6 Feb 2023 10:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25710E360
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:17:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id u10so5209362wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4+RQoVZfem6e9FhQzMWvwQuGFKN/4iRjnbC4Ju9Z81w=;
 b=jO63HprQpX1TzqC/M6khRjkw2lOa3GbfVoYsnQuE/rdgmq5b9dMi2eRBDrzUctTgGt
 OyqxR4P/t5DUOa0sGuG56ECWEd1VBrxLCcnBnV/IxbBkeRRdhgWCsZHzZLeLdQet8aI2
 OyiUme9Gj9YkgVqaPlu7dJs/CUwwwqXS08PDY17eh0Y427VjtlasiofnNaYyS7hJpXfd
 JoAEyBONbuEofQRSLIughYINxqm63ro5XEcIbuvhhY22kC9n4M/6lHw07E2NkQfEugcw
 ocH5FquEoggq/cflC9F+0by4tJzyP9N4FVza/uBtlZVxSaiIB0t2flD82GVrcQupmcHn
 p3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+RQoVZfem6e9FhQzMWvwQuGFKN/4iRjnbC4Ju9Z81w=;
 b=V7A7Hrr/yIevxpirYzowmC975vmjjVi/K0oSocWROnr0nrtopBxL7fHkiQiLR+dOYt
 2V8zayV5dAojGRWIVPVgvQ2U9TfdE3934URx2/Y3HtXHM+KEnezXOcYh1+gGjcucG8bI
 6Kk+oiLX9WUn6tKxo0aw1tBtLPNoBWLq3Be7ySgFKBYf5KMK3gZ9+N8nrPLnS7J9Y3gP
 oQYtxjml0FaShVOkk8PeCKoW6Cj+NIwh61jMLLkFhBczjiN849N6cBkr4j24nfSQzMja
 lxT4gzxzRYT0vDZaknAcrN+SN3hFPivXeOZZMLPvE9sMadT1thZJBsTjN17vvtVLbzW4
 xN6g==
X-Gm-Message-State: AO0yUKUCgNaGsXPmKNEYWA9PxRlK3t65Kp+vgkLTGvDwS0I+5tHDm/Of
 hIf4vMxmW/fR2bBuu6xqUCBfiQ==
X-Google-Smtp-Source: AK7set+d7A4lbY4mReLik2PTZlJBXWH37IuILHSbkhWuDxZdPsVKe0tSvhWKxEmZviqQbAWkn6AYNA==
X-Received: by 2002:a05:600c:4f53:b0:3dd:97d6:8f2a with SMTP id
 m19-20020a05600c4f5300b003dd97d68f2amr18366441wmq.33.1675678630959; 
 Mon, 06 Feb 2023 02:17:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003db0bb81b6asm11314201wmo.1.2023.02.06.02.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:17:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Feb 2023 11:17:07 +0100
Subject: [PATCH 4/5] arm64: dst: qcom: sm8450: switch to usb3/dp combo phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v1-4-f1345872ed19@linaro.org>
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

The QMP PHY is a USB3/DP combo phy, switch to the newly
documented bindings and register the clocks to the GCC
and DISPCC controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 38 +++++++++++++-----------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d66dcd8fe61f..757b7c56d5f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -748,7 +748,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy_lanes 0>,
 				 <&ufs_mem_phy_lanes 1>,
 				 <&ufs_mem_phy_lanes 2>,
-				 <0>;
+				 <&usb_1_qmpphy 0>;
 			clock-names = "bi_tcxo",
 				      "sleep_clk",
 				      "pcie_0_pipe_clk",
@@ -2038,37 +2038,27 @@ usb_1_hsphy: phy@88e3000 {
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 		};
 
-		usb_1_qmpphy: phy-wrapper@88e9000 {
-			compatible = "qcom,sm8450-qmp-usb3-phy";
-			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x20>;
-			status = "disabled";
+		usb_1_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8450-qmp-usb3-dp-phy";
+			reg = <0 0x088e8000 0 0x4000>;
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
 
 		remoteproc_slpi: remoteproc@2400000 {
@@ -2976,8 +2966,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <0>, /* dp0 */
-				 <0>,
+				 <&usb_1_qmpphy 0>,
+				 <&usb_1_qmpphy 1>,
 				 <0>, /* dp1 */
 				 <0>,
 				 <0>, /* dp2 */
@@ -4157,7 +4147,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};

-- 
2.34.1

