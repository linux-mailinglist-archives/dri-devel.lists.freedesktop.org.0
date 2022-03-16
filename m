Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE284DB748
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 18:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AB310E8EC;
	Wed, 16 Mar 2022 17:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2862A10E8E9;
 Wed, 16 Mar 2022 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647452213; x=1678988213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EoW94ZckvA5awhywuafl9mc4HFelLFPLeZayBs/fPk0=;
 b=kTv19/LZSLJCPjOfZujdmShGlpkJiU1UjraAKwmn4EY7R+poLMXuwE84
 EXHJV95QVCYRd2yvxgWC88pVve6ugmLvDBJSjAd1F/ZNgQ6D/CTHH7rro
 7dgaZ+ZGN1ztUWvHDJiyQM0Rv8akVokAOWcpeljmtj9A5vnzUgAWpykJd M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 10:36:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 10:36:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:51 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:43 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 3/9] arm64: dts: qcom: sc7280: Enable backlight for eDP
 panel
Date: Wed, 16 Mar 2022 23:05:48 +0530
Message-ID: <1647452154-16361-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
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
 dianders@chromium.org, bjorn.andersson@linaro.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, swboyd@chromium.org, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable backlight support for eDP panel on CRD platform for sc7280.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v5:
  - Separate out backlight nodes

 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index 2df654e..16d1a5b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -37,6 +37,15 @@
 		pinctrl-0 = <&edp_panel_power>;
 	};
 
+	edp_backlight: edp-backlight {
+		compatible = "pwm-backlight";
+
+		power-supply = <&vreg_edp_bp>;
+		pwms = <&pm8350c_pwm 3 65535>;
+
+		enable-gpios = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+	};
+
 	vreg_edp_bp: vreg-edp-bp-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_edp_bp";
@@ -123,7 +132,9 @@ ap_ts_pen_1v8: &i2c13 {
 		edp_panel: edp-panel {
 			compatible = "edp-panel";
 
+			backlight = <&edp_backlight>;
 			power-supply = <&edp_3v3_regulator>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -172,6 +183,13 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
+&pm8350c_pwm {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_bl_pwm>;
+};
+
 &tlmm {
 	edp_panel_power: edp-panel-power {
 		pins = "gpio80";
-- 
2.7.4

