Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275C07197C1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFE810E539;
	Thu,  1 Jun 2023 09:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974C10E535
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 09:52:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30ae967ef74so609515f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685613150; x=1688205150;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f3x3X1a6G/OXzIQ0e/FqTCoMI/OSYIjl1tXgiqm7Ko4=;
 b=rhHBsl4aHuNPRZ0hMiQGwtISYhhMW8fTHTkDjOzw3xYr3alyt9MdZisj0AKjTnvo0T
 +dfg3yY1HTUp+9hbHtQcb+Cdw47O/Gf6AJg4JiokGTAHAy4jTfwhOOGOf8kCbvAQrPPi
 OYTehTkem4FJDcct+RdeS9+/DoK0id6lQQBiOcRKb5gXjPWgT/vwAlB9LwEM8Q5lBwI4
 8L3wUONjMq5Cy9g8CixtjAyu/4jxDDdAr0XzH2jKruRsUjdEfeAfFpLRSvlhUBREt18Y
 +B2ZvV52avxweS6YpbsoUK+VtPrMQlYN/4CnfxE8oh5EsUR4jcAMu3m+Zn8P9Yw6mmKg
 RfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685613150; x=1688205150;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3x3X1a6G/OXzIQ0e/FqTCoMI/OSYIjl1tXgiqm7Ko4=;
 b=irDfmG/7LuCaXpCXbhfKFfbcT2BOqEhq3MJyrEuorjxCG6+KB4fYYS4AWjfEj2fn2v
 YgDhlxyrT2CHyVby/38v8sTgfDQ6hN13eZTT7lX4Hy5TZbAdwU0n4YrQIcrrv3oCOS4Z
 h3n7ECrzlK/Eu5eWhQ2mFI0Z350GJFaI7QSB5PHsPR0Z+0C6lpi9zYZjuHqRhqZmFS3i
 9cwjKtpAS3kwGATVKKv5rc90ZJGThENQUxz/2aIT/Dm8xoVEMFz6DjzSwjZlDF/c9dKZ
 pWxWpYme2j5yZ4qmUh2moTqrn481D6CuP6xhdhy+Ai+VHlHO9ksYGoGs4vQ2xClhvegC
 ryHQ==
X-Gm-Message-State: AC+VfDy153aZklfaSPDZVc9WlluhlsH5N7/Cz3NdpIH40RSoEg0BtJqb
 6Ekw4h3HllBI9KYz1NPJT4ASeA==
X-Google-Smtp-Source: ACHHUZ5IhJO0KYcgAiScAvGIMpuDsyLi/N2TEMPPa8jf751U1IW27j+pcLdDb7aCna7bRKxQIdbnOA==
X-Received: by 2002:adf:f889:0:b0:30a:8995:1dc3 with SMTP id
 u9-20020adff889000000b0030a89951dc3mr1557912wrp.55.1685613149941; 
 Thu, 01 Jun 2023 02:52:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d4409000000b0030af05fce4dsm9746150wrq.77.2023.06.01.02.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 02:52:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 01 Jun 2023 11:52:25 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550: add display port nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v1-2-29efe2689553@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3408;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cvd2h/OWSMxMDDXBFiERp/JEl76MczzHyDyFFv+rQt0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeGpaZtWnWx1bo0rdtB7RwCFqrWYDLPW8gPo5NL4Y
 OvsL3MGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHhqWgAKCRB33NvayMhJ0e69D/
 9iYcEacMHsbMOoEAi+SVu6RR4UmqrZ6kI78xsolG7sfpwsvnsnumEKCKeLjdBN8JWD5lRuiFusrIcE
 P7mlIYtlKX1WiX4PUeALfqVdqnzWXKJ+oMhxsDbMFS+lDEEmFUB+yGLghdnwv6ZV6aFPyFpYmH0GFn
 Py3+ZZf5fJJ2i3PmIFqK8nFnMRG/hwCWtYW1gk3FqKboov7vahJMCXq69sFi0WrC1giJsr7nmsVN3G
 Ap8r0CfjqLBh5GL6h+eKXGVaT2MPTCg093zweykIS87lBEPP1RBlbOZAW+6UMNGhUbHWtILxLOPmsV
 2iYIpvA8rSjEieVH0fIN2P1Hp2s4hWRIOVq2oCz4GnI4tNC54j+Kq5S45p3QjcnnPnjXRMU+B6WJQn
 FlFai94wxI/QZ3qNXPTOeSn5hXyFeppxsMRFp1vK6CivgBYypRUiB3T0wkhX2FKY6hZiV96MGTZUFf
 ghCnFBIAVzfQHJvITFmuwamTEzpfh/vs4JY6dFVCGwM4UMq8sYTJreJcZGkQhWBAMuFKw8Hb/kGj8W
 IEqpNxKd3++q9nODh1irCIZtmtFFkZQKfWtHgMf2btUe51jmUP2LronKP/+OjY6h1OWUX1uhSdjdRT
 i4vRb8qPW/OMwJjoRVQQI2IJZ7DX72khRrbx0lGah8ABYMUhwDX8qyzeiJ4g==
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

Add the Display Port controller subnode to the MDSS node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 89 +++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 75cd374943eb..73524afc2e3a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2495,6 +2495,13 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2522,6 +2529,84 @@ opp-514000000 {
 				};
 			};
 
+			mdss_dp0: displayport-controller@ae90000 {
+				compatible = "qcom,sm8550-dp", "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8550_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dp0_out: endpoint {
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
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
 				compatible = "qcom,sm8550-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
@@ -2705,8 +2790,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <0>, /* dp0 */
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */
 				 <0>,
 				 <0>, /* dp2 */

-- 
2.34.1

