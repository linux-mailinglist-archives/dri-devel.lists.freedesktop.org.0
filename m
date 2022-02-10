Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390D4B0CEF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F2610E82A;
	Thu, 10 Feb 2022 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118210E82E;
 Thu, 10 Feb 2022 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644494299; x=1676030299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SlEkynaCwSX8rlF2BMxjwgninKOxCUH6D5+E79sbVZE=;
 b=FxXuL6faY+JRK3iES/d+5HeNvgblE5sBT6G/uOuffGu7qtgscRkYZyFD
 VRWSElgGdzl4Fqsf7irhIEYB4MQcnb40pJqA8kRsk0s1YPoCRrR3O0W31
 Wjzw2SJ8wH0a5mm2GKriUlW31gsg1YFwJlJiPI8/o5P025DRe4cex3FGT A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Feb 2022 03:58:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 03:58:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:18 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:11 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 3/5] arm64: dts: qcom: sc7280: rename edp_out label to
 mdss_edp_out
Date: Thu, 10 Feb 2022 17:27:33 +0530
Message-ID: <1644494255-6632-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
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

Rename the edp_out label in the sc7280 platform to mdss_edp_out.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index 6dba5ac..af40e14 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -69,7 +69,7 @@
 			port@0 {
 				reg = <0>;
 				edp_panel_in: endpoint {
-					remote-endpoint = <&edp_out>;
+					remote-endpoint = <&mdss_edp_out>;
 				};
 			};
 		};
@@ -129,10 +129,6 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
-&edp_out {
-	remote-endpoint = <&edp_panel_in>;
-};
-
 &mdss {
 	status = "okay";
 };
@@ -156,6 +152,10 @@ ap_ts_pen_1v8: &i2c13 {
 	/delete-property/ pinctrl-0;
 };
 
+&mdss_edp_out {
+	remote-endpoint = <&edp_panel_in>;
+};
+
 &mdss_edp_phy {
 	status = "okay";
 
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

