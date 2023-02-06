Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD5C68B9B4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C6510E358;
	Mon,  6 Feb 2023 10:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20F10E35F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:17:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso8333062wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xxHXOpufaFaK69tlU0lBmq/fhKzZKgu1EiJW7yQ+PNo=;
 b=HSSTHcYzQO3wNiH05mSAVVu5JkYtD5lZcmYvFPgTdEUa+2BKIh4oYukbuhR6NIvKyb
 urQzDH+NZHgQ2OzFCMZqahRg+ytRQofuqwrENqM6LP7+FhObO3Igavjb0ZFvk7r9UWCk
 8B8w6uNAileZxV8ywbcbw8abKg4FYfOXdcaM3pLpVg4rJs5pZkTgqes794V9VoruZSnR
 OIunKYmdeTUcZVQVpOWWyEBnJB4eEIefmb23qaZrfdRJd5v5FZR8wmwMLU9yioFIhDIq
 IP1BAPqSVcn23jhTQLVUecvO4560biMEWXcdg3FqI86r17ys/MESAZmML3ivOnqU/0Wv
 ZyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxHXOpufaFaK69tlU0lBmq/fhKzZKgu1EiJW7yQ+PNo=;
 b=OtJuf+10Wt0omSgjlymSY6Kddl3VLUJ6+wjMSXNo5rLXu3Q9/KF1KGfM3um3ysRyhh
 bYmuiHWBRqYWY91UPSjFKxPhz0KyJUnlYzkhPf3VqgE2Vur7AIaMS8i64z5P6LGiFDr1
 hpIJJ/JiQ2kgqQKVGE11SnFCAV2de+n+zrvi62nnn8PIuuwDRxU2FC9Vdu8/lKDrSZUW
 9rk5yOpYIQD8tsfTo8B9XVWy7TX9Ce79CvXnPZg24bsT/kucLnjVjLoP9rshCZkjP31q
 VCzxVyUamq5mL8ropWjwRDAghMRBPZo+GkvorEd7gYAaCmzIqmmKXsWz8M1kt8zc+TAB
 suOQ==
X-Gm-Message-State: AO0yUKUS3Oa+HAH3umEBYjJCFdjV56tl1ZbwihlqYQs9lbxuOrg7DfDt
 6JSILjpYL/2AsLhDdzBFqxgrYg==
X-Google-Smtp-Source: AK7set+ZNux4+DZLpYsN4jJN72b/mfmMES1nLuAaxTfOCwfe4bppMiVSD5rf6vfeBO4hxbhPLw6L/g==
X-Received: by 2002:a05:600c:601b:b0:3dd:1b76:347f with SMTP id
 az27-20020a05600c601b00b003dd1b76347fmr18520898wmb.18.1675678629847; 
 Mon, 06 Feb 2023 02:17:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003db0bb81b6asm11314201wmo.1.2023.02.06.02.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:17:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Feb 2023 11:17:06 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: sm8350: add dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v1-3-f1345872ed19@linaro.org>
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

Add the Display Port controller subnode to the MDSS node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 80 +++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 2586321af6df..9d7084934d99 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2865,13 +2865,20 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dpu_intf1_out: endpoint {
-							remote-endpoint = <&mdss_dsi0_in>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp_in>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
 						dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
@@ -2879,6 +2886,75 @@ dpu_intf2_out: endpoint {
 				};
 			};
 
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sm8350-dp";
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0x600>,
+				      <0 0xae91000 0 0x400>;
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+			                      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy 1>,
+							 <&usb_1_qmpphy 2>;
+
+				phys = <&usb_1_qmpphy 1>;
+			        phy-names = "dp";
+
+			        #sound-dai-cells = <0>;
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SM8350_MMCX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
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
 				compatible = "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;

-- 
2.34.1

