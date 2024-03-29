Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97389148A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 08:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350311256F;
	Fri, 29 Mar 2024 07:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="p3Aol2CU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF1711256F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 07:47:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a466fc8fcccso223318766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711698359; x=1712303159; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lcotkK4GO99SFGIIH8jXD+5kvmn1tNTmHBz7CWYrF30=;
 b=p3Aol2CUSQHqatj9gl57fvXtN0E9hU72flfa20XWIaw/B+6UXQUAYjlfXPSbwhzZoQ
 oG5wHy9z27aoEFTm3cykh7BUyAjHKE911ehGG0oawpPJAzxDRSufFNrE2W838h1OgGgL
 Gw4aQFLBGyxhSFjgcBzH+pqWTHjsnl4KhNwHY8kKJjSe2W/Nj1Egy0wo2xEGMjKvZbQn
 KFn1yO0Nzww3y2ghQFE46dynrON90xuTRRCA+9SXQ9ONMZvPu+77YSAgyAdvV64OYi0A
 mtlUpPV/qXNzahof87U671fLh/h69WQUqGaabm1pvrhNjpXxykKW5Swm88p9va03LRuJ
 kw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711698359; x=1712303159;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcotkK4GO99SFGIIH8jXD+5kvmn1tNTmHBz7CWYrF30=;
 b=Asty79iUjkkg1Sp+ANYui9+61axZ08zcO4Bwko0JVV4TzPlu0ZIK3nFYXs4fB9e8tK
 qSWOrItKcDo3s/U4ewSnZ0RZ89fJKE0qK1E57ggabq4IhtJ945G0tmUkvnPIVPSBZ9Vw
 B62k52jTckEpdOtzvowi+rhAYDiFq7m7xPmPPIu9KDCM8OnB7QHKVgzrNwAhS6itA2Gi
 1u6mCuXqDWsa3o8bttEPFRIUz0QPBpCiZupF1PYCUFAEQ5Kpxo37d//jov3/VA7cpnV+
 9lT5ExGJc66ekTMs8Ue7qJWvAu8jLUnKRjY+GUQzbNuw7gISL0eN2wn6Kkd5cO/2ORp6
 f5Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD+0bcvSlwfwoFEJHzKlKgOmB8mL464KGfUc2B1fRVyUxgkhlVZDyDl8pE3teFGFXYfrdFnlDzVMHvXPVN7HB1i6gl2WSLiveg/2y89ROR
X-Gm-Message-State: AOJu0YyU3b2qLkfypkcTspA/HxC5oeggkmusfAUEhzioKWCrYMpGTsr3
 ZvfHT3WRCCLWfVdy2LDx9MLK75pXgQN9za9V+7ZUNN+bzIahixnc2uk/7HFi3q4=
X-Google-Smtp-Source: AGHT+IE24627ppy3W0EYA3xkVYAvPY4pdoTFgJaCVO/S+vc52RfohmJ4tnXqThQoPHfY+9NaDMJ7Ng==
X-Received: by 2002:a17:906:a88a:b0:a47:5265:9aac with SMTP id
 ha10-20020a170906a88a00b00a4752659aacmr859536ejb.55.1711698359536; 
 Fri, 29 Mar 2024 00:45:59 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 00:45:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Mar 2024 08:45:56 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6350: Add DisplayPort
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-sm6350-dp-v2-3-e46dceb32ef5@fairphone.com>
References: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
In-Reply-To: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the node for the DisplayPort controller found on the SM6350 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..d7cf4b5ceea6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2033,6 +2033,14 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2070,6 +2078,86 @@ opp-560000000 {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM6350_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.44.0

