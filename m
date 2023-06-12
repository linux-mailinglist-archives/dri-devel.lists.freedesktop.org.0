Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28D72CA00
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092E910E2AD;
	Mon, 12 Jun 2023 15:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118FD10E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:26:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f735259fa0so45537805e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686583608; x=1689175608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=N9gaZs3GOrtMfoObvoHXAIZYbDkqzj43EiMUg1n+ZSC7S7wTMeoVX3vY+xMue/lK0U
 +4W5YGbVwZW/YSJbachvLaQWJhMgqfDzKklacB7ElGpOsil3wAeclrpuhq8/rLtgBsiM
 98gRAkV5ZNmgkSRnmAyCQ0mXvVwsiSsrNF/FP5BOp0rnuMQujqrCyvEa6eZBoU7aR8Ck
 AeKxtIneDTASmN5xWbdBU+j/qS5ccbIAgwDxsN0v45cevSDyqlWizPRKaIThIIkqD3Xa
 OwM2VlDnVAh5l/lmA2ogaerIq2ao0hhWIY+ctmL+3moYPWaybmCX06GjzuzJ3BxKf24z
 Wxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686583608; x=1689175608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=QyGn7YphN6A6aXDuu1c3h921srL3U1fir888wex2R7bscijyyqZ4gwyUkYsyf/pyDQ
 GOMHF8IvV4KETNXSX6ftqUGVJeu9XN/9jHIhvRVkj49ulyr+Ppf4kUfJKNgdna7Q+/sz
 S6O7TgZVdllL2HTuTo2BJ70O3JEGYhlyTOGcNAGickL4mrt71btTwzqpH3e6IWVj0c84
 f4TEtTyU+R6SF9TrtDZ712hA+OVXQEsxqQlKc++Ax9hr3bi+oxLtAUYVlBpAn3xWm3g1
 TJDpxSReaNvYarinH1gv5vGlPUGfEWonp+7nvKtn5KCAG583RJDL/3urAHLkT7H6VTxb
 uZeQ==
X-Gm-Message-State: AC+VfDx4gg0+joupFsU8nmhx69WBuvxzoPj3vmaG/nSR/aRnwcR9pwm0
 jUdUXgLqmuoSRjgmNOoRYNVuag==
X-Google-Smtp-Source: ACHHUZ6cxLwpV2DDPgY96MVULz4xXUcm/ukdR+f9kNyYlHBOiaPSx6vdMauIEiHJ/hr3Ws0OlctSlg==
X-Received: by 2002:a7b:c458:0:b0:3f8:6d6:d4a4 with SMTP id
 l24-20020a7bc458000000b003f806d6d4a4mr7390462wmi.10.1686583607669; 
 Mon, 12 Jun 2023 08:26:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c28d100b003f080b2f9f4sm11816344wmd.27.2023.06.12.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 08:26:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 17:26:41 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8550: add display port nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v3-2-5f9ffdcb8369@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhzkzNMCe8HsWmMOH3B20DVFcSIBhFzdJrkQ+SEgW
 5AkwBfCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIc5MwAKCRB33NvayMhJ0eDwD/
 9zdODZUvqdgFl9NF0db1A4Ghx6Zfx0diVgO3rjcprByoxdgIz0LqJhT5ySkTNQneTWr/Uz5gm6+DhM
 5i7Nw+ORnQhKYqT5FMPlRE13yuS4VBb7I0GKqBkKQ3BZMhZqhzTEYtc6pU98oTAH5GTiYl1aymCxoA
 u1VycC8eWP4EJj4ib6/X2MjOdNmrhvixPn+bvXkiMvxI6qI5xisrYZPLUdtvQbsGaMQtHcVTKtnNuC
 iajYn2WthnCHgOiANjlRcB8B+O4PwavyRg0oAgNC3IiFXNQeXOVNW3C7q8CCL/9Edhzunva84e+Pa+
 IqiJlPY7M3jACH3V50NQVusNAT3k0GVROyHagYMcZ5AQjVLr6hVVySnmsiv7z5qTIqtCIBQhz1RqL6
 JF4yg7EfUKp7KaTWtnsPlfhZLnnivm89iVYWwE9YrGyrUJAAm8dvnJRDn/UKwWNmbvUn1l51QqYPwE
 XRjJQrjJzH88co0Fs0hdb2fmae9mALK7im+iSAGl7urR7c9X8MVGRJm1xRoJY5m1w0x+/oeFS/oS/G
 WieLzgdd46wMz5ZkbBKU4ZooFhBtcGDWUUSk8RqgIv/mGtdBpRoLi8unp5vTILXtU+oIu/SSxd/og1
 UwD/H90N5uzEWAVA6BZVKVr88kQbaBhCMw3+KjTeYA7EmjR8tyyMZ4QSsn2Q==
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

