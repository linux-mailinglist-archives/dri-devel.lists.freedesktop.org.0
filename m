Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C908D80CFF3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B1D10E497;
	Mon, 11 Dec 2023 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6FE10E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50c222a022dso4827465e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309489; x=1702914289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=y5Jv1lDGtMUzCclcnWbdjPIS3EXMPk1/lLm7EnsDiFLuqMxan0kDe37e2pDlfEs5Hg
 Uzvrcoo0zsMUl8k2x0K5eMdez54zfsP5uoYikfPsfh8ROfD4BotXEkQZ0slkQeQRTEY5
 04V0R9IAg+FAkXpL0Bvp/V41kM8jMHrcZJcXOYQiE8l4KX5PaASRx8Q4u31SYZSCxiPv
 PcSKm2sp0sy7gvqD5T0W+A+8WeKRRVwh8sucxQJHDQWvsz/vmUsK65DgLb+QjxlLYgce
 yayjqE9N1ztHjaUjPaCdaDGzPAZLjlO6K/fu7S1sQzzMckKWlLIlyi0RScA4sORqRrN6
 2pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309489; x=1702914289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
 b=SLH+W8+ZarYVWvk3WSapaCAJoq+WDwvPFD4TZj46yHt98xVu+MJMISvxXMWvMA5BFZ
 /x4vkBmQIjLClKJ//NRJQ4bCaEmXKkG7Mq/+Zxzd7FgbD5BGUFhCBdjow8SliJerJ/2O
 qWeJu+IIQwhIAN+R/p+N+BzrJ/09QjBq9APgWNxWN/KZa5RD+4pRoXciS7+RGcy4nNZP
 AJcfkkFnIDcS3giNUm9oYot9r5HdOB2O9Xdszd/6WU+c83x25Efqf1pCi0qTsJLKotyW
 9LHbAUN6Qa15u3Pq4Qld5QNPoIsKRo7EmHCA4cux3gcziEBMCRKAsxT5AOEfVXf/lt07
 lKxQ==
X-Gm-Message-State: AOJu0Ywh7kzC7N4DAtbOqC3rqpkf+QQ4UN7ZryNkkn+KrnEz2/kYJHwd
 C2zwK/1KPf4zBQ6rWluSD3Lr+A==
X-Google-Smtp-Source: AGHT+IEam9fZdsdP7QrV4Gd0KMwsyDVoSVVfAV9Zjzne67TnyppEtLORztpSC/Ow1E1UoDACb0dtcA==
X-Received: by 2002:a05:6512:3e1f:b0:50d:1a14:3e79 with SMTP id
 i31-20020a0565123e1f00b0050d1a143e79mr2363359lfv.112.1702309489583; 
 Mon, 11 Dec 2023 07:44:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/8] arm64: dts: qcom: sm8150-hdk: enable HDMI output
Date: Mon, 11 Dec 2023 18:44:40 +0300
Message-Id: <20231211154445.3666732-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
bridge, enabling HDMI output on this board. While adding the display
resources, also drop the headless ("amd,imageon") compat string from the
GPU node, since the board now has output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 128 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bb161b536da4..6a036f9ba1c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -54,6 +54,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -359,12 +370,112 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p875>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p875>;
 	status = "okay";
 };
 
@@ -402,6 +513,13 @@ &remoteproc_slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <126 4>;
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio9";
+		function = "gpio";
+		bias-disable;
+	};
+
 };
 
 &uart2 {
-- 
2.39.2

