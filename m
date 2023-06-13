Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C772DAE4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58910E344;
	Tue, 13 Jun 2023 07:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E4110E342
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:30:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so3805847f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641423; x=1689233423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=f19c6qI3lfqYskS1oo0aUUXqQy5cJaJClkZqEF/XNQ7ScZmawpqjb0mOYqQjncm0zs
 QdqJdT92wjt7ZtTTGS8D3RkQVfj/Passv9I+zeMuBF3T9Osb3GUoO9lElXkILQRQV68w
 Rw0hGhEhSqdzgTW7yj52jFPgKEYTcWhL70VH1n6rRGm1rzbiEuIr0zyNXUjcswj25JBi
 PPo6Z0FJrfrpL0g/Wvyav+KOpgbiuFxIfB6T84t8YaKlGO7eZyIQYqcr/m7m3znzpbrs
 Y3mOBoFYuoEXBTFAvRDtHRlsBdCjDBCJKy0SAuu/u2lVevq7I5GpGTdnbF3cc97g134D
 h/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641423; x=1689233423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=Xt10qbm964aAOMmwbMtZncnuNggf4JcCqYj1HM9REPHdQP7LVo/OcSb+RaPbXCILq8
 oj40RH87/f6v6zQBRdM28bL7VNrdCfpMUtfhQO3oQvoldxEuJ67qRBigabbEuJskDdcO
 Rhvb0oJYgTOc08C/i1U9IatWRwB9Fb6Z/rXdbQTvb4t4s+vv1o1NLeMp4VA7xeRFVrnc
 Fsmi4L+osZTjkST7/gA4VIzVRkDEh4DaPYsl5sRYGWMGO022o/v1LsS7k+40A+dxWsD2
 mo34z+B991IIVRxcnLyYu3AUHyk7wyOPOeFRa4d+k1cW5yG050HOJPi+1+M/YAH3oajZ
 s1Vw==
X-Gm-Message-State: AC+VfDzSbFgZdjH0+lGCzmrdJ9WqM+A4ffXQgvbS++tmoDfb4ZBrBB/l
 1yaY6KJ2MA21e/VrYHHlHRrmSw==
X-Google-Smtp-Source: ACHHUZ4sH2HytnNf1ZE8FXoYFFHV0OtkPgsKw1H/3G+aVs/hsTaHUgWLMR67qmKBu8muaPzlndiNMQ==
X-Received: by 2002:a5d:594b:0:b0:30a:f60a:dc3c with SMTP id
 e11-20020a5d594b000000b0030af60adc3cmr6417764wri.24.1686641423039; 
 Tue, 13 Jun 2023 00:30:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm13474453wmj.27.2023.06.13.00.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 00:30:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Jun 2023 09:30:13 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: sm8550: add display port nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v4-2-ac2c6899d22c@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3472;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OT9fRI9abb+RycwRAR3WBnAhUBfEPjR/71I2pAue+x4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiBsL2NWmkEWos0mQfZTxgT6q6aNllKnzeoj8boi9
 SHFErjWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIgbCwAKCRB33NvayMhJ0dplEA
 CWVNMiu82x/7M3/290CDaDUh+iBtv+SewsRaQ5glE9uJOWQVEWP/em7LbV1D6YViPalahrA6A+IDa9
 BG2I4YAmW2Cto+jDoWW4CEWbJ/j6oCmZ6TLRh3YdqO2bO9VgvhLYsrIYzBtwstCyJX+BYzi+M1iqAx
 oFmME85h1cncLT3ZQLUEwAgD9QJQCk9odLYFF2LsF09cV/4U+emfoz+3L5AzdjJKYCS/zYG7H6zaVv
 CntbtJeyDbV+/8eSqQbeaReV8/BX0rezkyS8d6lgRW1FLexfUIUEOy0+IFdv40XrF/i4D56DIxg8v5
 uSk1W3v4tzAFZZHMmE75KpfWTMPATWmYt5lEjBWbibrkMfsIYI3PWjoY/OYsy9jHetSCATVBsrh3dD
 1417NLUBCzaEm3Mgsmh+Uyks85lOZYNxFICLA16hWwIvBut20x2MIfqOlmSgByaiFAgYdBGVkrl3Ji
 goNORVbwZK7gNJh0lWkdBMZLgl8v7oMflnPJ8y775JWjrPpZdPLmiHRfJNabZXxE2ReWCN+ZFO2cU/
 kfbo31+7Qn+wu94auszhCL1x7TXzbTtoyQy9JIoELLS6uoEd0Hh6Yrh7Ht1VWlpN28z5iBylHUVlIh
 OrFDj73B3rOZp4LqttOapadmO9bhQ1wXSjgDND79bctQia3h+4f4JN6iC6/Q==
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 89 +++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 972df1ef86ee..b41b3981b3ce 100644
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
+				power-domains = <&rpmhpd SM8550_MMCX>;
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
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
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

