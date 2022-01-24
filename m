Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F749880B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2010E773;
	Mon, 24 Jan 2022 18:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59A10E76C;
 Mon, 24 Jan 2022 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643048144; x=1674584144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=arZ0uTaWJp6QcmiA0BEOwSa5cV/W/erIAwkV9kyaUbM=;
 b=RwEW0yCb1NnkjetaqRYNUEln2NwAvx9q+9FpXOVy8sX2BUK9uNsKFFLY
 EaWHGwBOLyTbrm9CFgoH9sgsjJ6bofipjmoyQ5m664UY5vOsO/7LU6ttF
 /WP0OidURRihl8Ux1jgsCndsx4qCuac2q4svguiicvVPAuJguGQ+vOm7m g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Jan 2022 10:15:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:15:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 10:15:43 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 10:15:38 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel support for sc7280
Date: Mon, 24 Jan 2022 23:45:13 +0530
Message-ID: <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
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
 dianders@chromium.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the eDP display panel support with backlight on sc7280 platform.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 127 ++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index cd2755c..fde6f75 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -64,6 +64,47 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
+&mdss_edp {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			edp_out: endpoint {
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_edp_phy {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
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
 &nvme_3v3_regulator {
 	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 };
@@ -72,7 +113,93 @@ ap_ts_pen_1v8: &i2c13 {
 	pins = "gpio51";
 };
 
+&pm8350c_pwm{
+	status = "okay";
+};
+
+&pm8350c_gpios {
+	backlight_pwm_default: backlight_pwm_default {
+		pinconf {
+			pins = "gpio8";
+			function = "func1";
+			output-low;
+			bias-disable;
+			power-source = <0>;
+			qcom,drive-strength = <3>;
+		};
+	};
+};
+
+&soc {
+	backlight_power: backlight_power {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight_power";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	edp_power: edp_power {
+		compatible = "regulator-fixed";
+		regulator-name = "edp_power";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_panel_power_default>;
+	};
+
+	edp_backlight: edp_backlight {
+		compatible = "pwm-backlight";
+
+		pwms = <&pm8350c_pwm 3 65535>;
+		power-supply = <&backlight_power>;
+		enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pwm_default>;
+	};
+
+	edp_panel: edp_panel {
+		compatible = "sharp_lq140m1jw46";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_hot_plug_det>;
+
+		power-supply = <&edp_power>;
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
+};
+
 &tlmm {
+	edp_hot_plug_det: edp-hot-plug-det {
+		pins = "gpio60";
+		function = "edp_hot";
+		bias-pull-down;
+		input-enable;
+	};
+
+	edp_panel_power_default: edp_panel_power_default {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		output-high;
+	};
+
 	tp_int_odl: tp-int-odl {
 		pins = "gpio7";
 		function = "gpio";
-- 
2.7.4

