Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EF808D9D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADDB10E932;
	Thu,  7 Dec 2023 16:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D75910E93E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:37:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so14130135e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701967051; x=1702571851; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bxKGdImuRLZ2ff2aA33QkmE9DJSE3GmgdmadEo3VeMw=;
 b=LMSdDc3MeeGKbVgAnqCl66Kg37D0/kHPQ+kSubIxk5KLY+CHKD2sF4UZwA6E7k7HWa
 E7gpZFPbb56auj9JbTM+vVFf8+z9/J+8EGoVv8qVxXm/0ilDy9liRTnXxiyFrJz1sYOM
 nj0HLyK/C0hJcPqU1ejvDno3hEmYIPDUC8uLcdluofjdM9bPMICHK+4q4yMFX7I8xHry
 ctec/BrG/H/iPOrongEXY4Ch8VCw/7QpEhl6igjvh3h+y7ZO8D7iXOJ/fY1FMNzhhvKZ
 NugGcEOftfo0rjCwxuYhV0pW+L0fXpfUVq7YD90gsdIgzl4iW8YNxNn0tG6Rqg9GQx/N
 e4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701967051; x=1702571851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxKGdImuRLZ2ff2aA33QkmE9DJSE3GmgdmadEo3VeMw=;
 b=sor70uLX3Zlr8D3Yj92xgcLZ5VWr3dELGgBfN98s+JQg1fyE6v75VRXGapOavBK4zI
 /h1NrjYYPFJgTK5waM6eoU39fAMshD6q1daiGvvBhOv1FqPVUtdxeyTd5wSMqEPN9UdH
 VgzfBfOM0lIMgqASwX5qjtOS4h4JhzXcqjxOM3HqbpvEWekR0YLmM+BTbifQivdKbwVn
 +D0RFIHIEeqzbxXIzpLbnH4725rZtEw6eUBdgdqp6yIiNpmLm0Rv3WN27xw3FznQePdk
 qLQ577jgSNKF75QFmLiMKB2C4IyqPxQ6WezyUGsgo8wNGQ7SqDY04+qP6uGW8FZjUUAA
 lpvQ==
X-Gm-Message-State: AOJu0YzPK9LY5qJ5cUq6e4l2R+9mtfkvE0LprE5Fjik17o9bdK7nKrmK
 nw7OIDf+PmKNRYtOEVkqCeuneg==
X-Google-Smtp-Source: AGHT+IGVT4tSfLvOkF6hsdQi11xAyGnLY+Gwv96d9zkBtDv5hMF0tPmOR1j4mEuFufAdNy4eSoS+Ng==
X-Received: by 2002:a7b:ce08:0:b0:40b:5e4a:407a with SMTP id
 m8-20020a7bce08000000b0040b5e4a407amr1749791wmc.154.1701967051666; 
 Thu, 07 Dec 2023 08:37:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:37:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 17:37:19 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=aQc/B+CmR/QYjLu3hk14Lm4+Zuwr6dr+9leZQG/FbkU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTGzVWS/u+tTB+TPj8R775ji3F5H3TRfRW0gv7p
 7CfO2cKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xgAKCRB33NvayMhJ0UCZD/
 9gpDy/fAE5K1IsOD/6M0Yx9T7gOTXX50h9JvKS9634rExhas0Ozv4C8fXyEbyMVqP859ku9XJ2Zjje
 k3dRAQMKxrhv2+Nb2ufzrTpSrKJUiLJCiR7Ny1Bhk7o5Mx+JAQusDdSB5Oqh2PLWjJP7MADslJJwA7
 IQvHroyKPoHBt5LsyJ+ze28TPQf0n9jY8aBH86S58EEQBZuwO6KAENkW4wG7JBGfS33XCwbeMxoMHq
 hjrJNL9JQ3X+Hl1rj+RpKP5GPmwJ0/WW+Olav64ZkpcRupJU8JmbDN0J7O762PkcC5QFfGqrf43Rli
 mf0BnwJN4guVqMmYOdKPOKVB7w3jiw5mLgusnHxFptUDmRqhHBkBMZDUt+p1G1MbeGQYGGNQuDkR3B
 Rllmy9sjH8EeZFNuFa5R1omqWib4cYbZvgN9hsu33sKlPUmtG7qdVrL3OvqdLVED9qINfndO2TheSz
 VVtIy5ZZobIzacQYreGM6w2M1dnBpwjUKoaNqVbnQ1ohUzgeY4PRT5WBSv1seNxOhocykDiiNpfAnD
 qCixc73HrMU5PXOa4BX2W7WINAK6waIJEZQTYP0L0Nm7NfBrLmx6erg7Nv9Te2Nwem9n1YpEre+hQj
 BVfEmXp7OcjlcZ4F40+0cEPbDDooPqG1Bi2QOXmFL2viWnlcKUgpKrlub9rw==
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

Declare the displayport controller present on the Qualcomm SM8650 SoC
and connected to the USB3/DP Combo PHY.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 120 ++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d1442b100e79..b2a50686d419 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2781,6 +2781,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2982,6 +2990,88 @@ mdss_dsi1_phy: phy@ae97000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sm8650-dp";
+				reg = <0 0xaf54000 0 0x200>,
+				      <0 0xaf54200 0 0x200>,
+				      <0 0xaf55000 0 0xc00>,
+				      <0 0xaf56000 0 0x400>,
+				      <0 0xaf57000 0 0x400>;
+
+				interrupts-extended = <&mdss 12>;
+
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
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
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
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
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
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -2996,8 +3086,8 @@ dispcc: clock-controller@af00000 {
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
@@ -3054,6 +3144,32 @@ usb_dp_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a6f8800 {

-- 
2.34.1

