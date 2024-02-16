Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD108579FC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E165E10EAD8;
	Fri, 16 Feb 2024 10:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="16udBSZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7910EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:10:57 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso245375466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1708078256; x=1708683056; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AmseNUB8XmILHTMGFvZmTPWMBMRG2oDjG5cDxIINlKQ=;
 b=16udBSZB0rN7TOz2BIsLPwJs/8LgKjaRnlSD0148f3ZtPjikfZV95MUDVt1DKI+k0e
 V7j6BNDZP3CqR8a8VDQfQ0zuiEUXqdZc5Q1WnZG86YEGGANFIwAG1Hod3LM7BYtR8nNW
 sd6dGE2RWGjSwf90sWoN/t9SEfqc3VsiVHHx5m0gH3JKYeQTuXnMPOwswEHJW/atCY+1
 tCOcyufHqDBUCieJ4Z4NjP1wIn5mrbodLl21HYJS8oxZF6rUSY54c+FzF3oK3yqj73XC
 4Jxehv1AboXzseIjgFYhfoZT1QC2hEW5rrxxWv/IkzOGbwaQzm1bi2kyaosqK6Tlfmi+
 hrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708078256; x=1708683056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmseNUB8XmILHTMGFvZmTPWMBMRG2oDjG5cDxIINlKQ=;
 b=g1XNjHm9KzQgmaCIRbecGUEpWJMNyNEPTAUhmlF9OzbCfMc/7RvKh2aNV4wz4YRXc2
 aODZxY94255fEGNGfnqEOFkdIL+DJpay8JbZrsnG8RbowN5etlBbCOrshlEZeFjCrRsd
 RADIOXIfNH5kSSoa+E8gPm9qknpnlQF6bFEBeUA1InyIvCdrLWqEL2ZsJBelsLifZWkR
 yXrCvMN8f7eiVLEil1fnhT4wc9bLjIgoIYfN7W8StKR8/LNeg1lADWRnqVYz+LYwpiUQ
 VlNukf1Ev+fMmPOT/qXOJcZ/GvLchsVEoA4381R6DZEO5/rdEaictQ47j2B/ibdN5ckH
 lrxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTUafNz/DB+Ga0t4BTSEvUIsOQ3dRZWE86+MlpvZBkixGQlaWu+MuofNYOyAHmEkHhNdmzAvAY95hTMhbnHtiphT1Nb5g3MZI8CEV45wer
X-Gm-Message-State: AOJu0YxcsHi+ArMcRQIy2fSrISEykeYqk+eT0UPmFQnmjIlbfhUdErww
 DN1bwqjhMf7mzNg/VF6/TGVolC+dYnbmJc2wU+ZtgCit4SqdgJzx9YwAUAyIF9b+yAIQ5E8J+pq
 /
X-Google-Smtp-Source: AGHT+IGal/6tJIPm3J0RtSc6ctiEJ5BTu7plrarS8+4pAaRz8meufv50XtRwP5cMKv1YKhUbtkQgvA==
X-Received: by 2002:a17:906:6bcc:b0:a3d:f81a:d50b with SMTP id
 t12-20020a1709066bcc00b00a3df81ad50bmr112120ejs.70.1708078255900; 
 Fri, 16 Feb 2024 02:10:55 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:10:55 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 11:10:51 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-fp4-panel-v3-4-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the description for the display panel found on this phone.
Unfortunately the LCDB module on PM6150L isn't yet supported upstream so
we need to use a dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU and set the zap shader
firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 53 +++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 5a05f14669be..c8099b10ddc4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1328,7 +1328,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index ade619805519..4e61da8078d1 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -68,6 +68,14 @@ key-volume-up {
 		};
 	};
 
+	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
+	lcdb_dummy: regulator-lcdb-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "lcdb_dummy";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+	};
+
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -373,6 +381,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm7225/fairphone4/a615_zap.mbn";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -404,6 +420,43 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l22a>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "djn,9a-3r063-1102b";
+		reg = <0>;
+
+		backlight = <&pm6150l_wled>;
+		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+		vdd1-supply = <&vreg_l1e>;
+		vsn-supply = <&lcdb_dummy>;
+		vsp-supply = <&lcdb_dummy>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l18a>;
+	status = "okay";
+};
+
 &mpss {
 	firmware-name = "qcom/sm7225/fairphone4/modem.mdt";
 	status = "okay";

-- 
2.43.2

