Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A04719875
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6B710E544;
	Thu,  1 Jun 2023 10:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EC510E231
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 10:10:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30aebe2602fso595218f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685614206; x=1688206206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=FGN4yf8vO6rSoOhK+YgxrkiSxKHiemjriGFwdAd5TDCNmbvGBa8ThMt9g8N/rpbRM3
 YrVj3ZJNsI2Wcw/UJfWf3AGv8TaNde5ygEZbFXcheF24dNxYdzJEwOj7WJNKFfUbciwh
 vVuVIflfsW6q2+Qmi4xs2COiEhBKTjh/R2xXhsbmKjUe/kmgMmyrZbLqFIxg83uuDI19
 m+2moSBbp4OcpcxxoSFvYvJVJpOw3tqz6BYB0hG/ne4ZS/gl+iXZg6gpY8a6CcYMZO9x
 1rde4tRYQB8bXShIkX8ZWrnJj0lx0asR4MMPFGcTJI6lNhhRTAkREASr6mIuCgBsaAuE
 5JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685614206; x=1688206206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWxp0A9f2AiWgsptaHzRYn+xtrjX1untDQt897ukbeo=;
 b=Fvsl67fYMwiOPJXJPJG4za1Cfn891K8kzrqzkYZ/Jl0yWVzAtOUjIoFXHe7WDh5YYy
 KH/ORD8HDV+y3+KvJ4JrfKzhNkVtCoew9QWtkSqlUtzJGmXZOQH180xsqyHwkyjPrxvM
 nMFi9K71sFp8tVRKY2ix6Z2i7JRAWNRgiJOtKrBJjFVOAhnuGRZUZQw/xFhTx6v3IIqy
 D9TTKazWPGS7Get7xiw0r6w5O2WN5vSgqjDNz0zm4ZTPQ6PuwaAvdHHRm7ehuPHKq9T4
 Gx7sx93mSVzSKYPfNIexQOXznr2sK8EtDCOp/iWY0qd74/geHADTu51jcDEoleYH6xJK
 7X+w==
X-Gm-Message-State: AC+VfDz/fPwPuiz/9fPnKH3odyV/pDMoIg/GnzlDZ0VJDM7Sg1J1eX6G
 WRjsZUXiQKH3xnaoh/bXccArxw==
X-Google-Smtp-Source: ACHHUZ6PuPvRFM4x7RgsdaqAmP+TvO3TLIBf8vCnY0dKibuhnRyroSV1F/q6L7/QqckOpnOLJFBlpw==
X-Received: by 2002:a5d:6ac6:0:b0:306:340c:4737 with SMTP id
 u6-20020a5d6ac6000000b00306340c4737mr1368606wrw.67.1685614205707; 
 Thu, 01 Jun 2023 03:10:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfeb46000000b0030ae53550f5sm9683845wrn.51.2023.06.01.03.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 03:10:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 01 Jun 2023 12:09:49 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550: add display port nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v2-3-e8778109c757@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeG55GGM70ikTcpzNAy/RJEFi9T6jCl4yqxQItF7a
 MmdlIyKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHhueQAKCRB33NvayMhJ0WGgD/
 0XBJQ+tQcudmmAhj9u4vB2qN/i0fy4zbHTRGOEyfoD9LpsjVtC2o041JXqfXS5U1r6mmCA57owr+nc
 pj2Dusa51mO97Xg8Q+5J1sYkXhli7N9z7G4qFgGl4hvPs/SOpvf/6Uz0VdhC9YyATqRkRWDFJQwBjZ
 uV09oQ2VgdZPgHSDv5xEIpptEiFT/lpJPAvPzTZMvpW0Ix5Qu16AqwmUQR8qR/A/nczkUzyMI6aP+N
 vJK8+/7PxBgt2089IayEDCCstntgu7bS6XSVBaOiE5fCuaOevq2o5MnOpfEAjPLpPAVlfER1+JVXgH
 RjHAB39+3IDOghF3hL49d2v/QKztCdOvDBzkvhqeA6IZLrgL6GDWgyLz6EAj59kzPUV1k6PERgUEeY
 p4v4fUCeW0TYGXB6L4rNRjkbJrc2/cTU8ZYwhf93+N0/3s2ZdW/pVOVY0//C3DaJsk37MglvLh5497
 /GG2hxuCRg9G/H/Ub4ri/ksY6+26Tb9r2wFWCacaxfBe7U3yAC4KYy/nR1P9+s6/dgoKh1+Z+itp6r
 yDGwTjRSUDaB3wGvsDJFOHo2yKAB3uF9ZjBTQBJii9lSZF6TdEJ+VIukmpf0iliUbmj1NMneDeGOB6
 OEAD0Xo3C/IJwti8ES5bjkd9I1Wzjgsxq8UdQH37hP2DxaSm0DmGyxC0KrCQ==
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

