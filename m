Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5B4AED57
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DE710E6AB;
	Wed,  9 Feb 2022 08:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D9110E61A;
 Wed,  9 Feb 2022 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644396968; x=1675932968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=oKWHI1/oLjFI5xhSYdvQVsYvHQorhqBTY2LP5gYKBKI=;
 b=FP6Z2T0ilcX02xZoFglyAIGT6aI3b092IQA9j5AGZoomptTsJgSH5s7d
 bq6m5MqERlwGF5GpwRsuL4rVD9QC8B2Ua92JHWDi4/gEwZrQiTD9XhwUI
 a/jEQlJHYxyLljGMh0csyiFgYQHhgUzikwxT0rtFYrS1plwI/3ec9J/90 U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 00:56:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:56:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:06 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:00 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc7280: Add support for eDP panel on
 CRD
Date: Wed, 9 Feb 2022 14:25:30 +0530
Message-ID: <1644396932-17932-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the eDP display panel support without HPD on sc7280 platform.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v3:
  - Sort the nodes alphabetically
  - Use - instead of _ as node names
  - Place the backlight and panel nodes under root
  - Change the name of edp_out to mdss_edp_out
  - Change the names of regulator nodes
  - Delete unused properties in the board file


Changes in v2:
  - Sort node references alphabetically
  - Improve readability
  - Move the pwm pinctrl to pwm node
  - Move the regulators to root
  - Define backlight power
  - Remove dummy regulator node
  - Cleanup pinctrl definitions

 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 122 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 +-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index e2efbdd..2a490a0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -21,6 +21,59 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	backlight_3v3_regulator: backlight-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight_3v3_regulator";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bl_power>;
+	};
+
+	edp_3v3_regulator: edp-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "edp_3v3_regulator";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_panel_power>;
+	};
+
+	edp_backlight: edp-backlight {
+		compatible = "pwm-backlight";
+
+		power-supply = <&backlight_3v3_regulator>;
+		pwms = <&pm8350c_pwm 3 65535>;
+	};
+
+	edp_panel: edp-panel {
+		compatible = "sharp,lq140m1jw46";
+
+		power-supply = <&edp_3v3_regulator>;
+		backlight = <&edp_backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				edp_panel_in: endpoint {
+					remote-endpoint = <&edp_out>;
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -76,6 +129,44 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hot_plug_det>;
+	data-lanes = <0 1>;
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l1b_0p8>;
+};
+
+&mdss_edp {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
+&mdss_edp_out {
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_edp_phy {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &nvme_3v3_regulator {
 	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 };
@@ -84,7 +175,38 @@ ap_ts_pen_1v8: &i2c13 {
 	pins = "gpio51";
 };
 
+&pm8350c_gpios {
+	edp_bl_power: edp-bl-power {
+		pins = "gpio7";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-disable;
+		output-low;
+	};
+
+	edp_bl_pwm: edp-bl-pwm {
+		pins = "gpio8";
+		function = "func1";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&pm8350c_pwm {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_bl_pwm>;
+};
+
 &tlmm {
+	edp_panel_power: edp-panel-power {
+		pins = "gpio80";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	tp_int_odl: tp-int-odl {
 		pins = "gpio7";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3572399..eca403a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3066,7 +3066,7 @@
 
 					port@1 {
 						reg = <1>;
-						edp_out: endpoint { };
+						mdss_edp_out: endpoint { };
 					};
 				};
 
-- 
2.7.4

