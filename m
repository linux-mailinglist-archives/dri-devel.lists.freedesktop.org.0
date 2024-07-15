Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876E9313DC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75F10E363;
	Mon, 15 Jul 2024 12:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iweJ2yEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA9210E36A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:16:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3678f36f154so2487521f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721045767; x=1721650567; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nlicpzX8j7ceD/JMCHCgT4Wp1znP1wKt2ZwJqztrd3Q=;
 b=iweJ2yELRnInCHWR2zyskGIKVl0CJ1tLL1G4YClbQvRjCwcugh0PVafY4aVXzeHMn0
 fI16YbR7zpXh18lsq0ZIJPn2EFpxamUMasQE74vUa3qgPCYzNiJmvcnHid8nq0syHSf6
 g+a+o7rEWS00BOtm/REDEluSLs6C5USC63AgiDxx7pA6O7w4kwL05kApYpJwpSvtE6na
 tiYtMCIcwkj7+/dUAyArlwM0QUuEYvb2E7+0aDm/A4Y0ynPw0/abSFhuApdcFCvTEa5V
 ft35rYJdOHyCXb3O24+8W/5a+fYo9o3xZ0tFKOTjjZtLJ79N3MTFjwDadFPk4WoV+Kx9
 GMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721045767; x=1721650567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nlicpzX8j7ceD/JMCHCgT4Wp1znP1wKt2ZwJqztrd3Q=;
 b=gjO4psucFCpKsTgvUUhU2o7O55LBBMUPMOTtR7miIwUBMCasGJRzWKiNMxE/daS+Ac
 rbN2dujJ0suIFIEOa1gu5lI090GMkC6sh3AKF3B75P+hSMjMtRKFo01py9Lleojgy7KU
 pLYYPe8bHXI/jzQm0d4KnvKS7/2IDh+gVGF/5Whzo74Duq4FLShipSf65QVaU4NSol8F
 yro2BPi8nBFXlnHnLSp5fgW4terCN/ZYZmHHbV/ce833Qj0zsWRRsnltuiolQttga1J/
 +bioqxsn/eQkRE5Qc3EW3SDSmG8Y+pQdsBE7TKqWgwTvu2NzV8lsD0GMWhM+XoV2Ulwq
 SgsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYF0Vr969jnlAsgmzDa3ewBOrQHO0yaszDQjt94PuxHSaXEJABlXeyU8TX3apq+uJtP48qeSWCZ/Vui0Jse1NB3Q1RqI8+FBNoxktbpMMO
X-Gm-Message-State: AOJu0YzES5JKpUCcIXlSyS3pcQRR80YKqOZFgHKiOCGT8ZKbGPSExZ65
 6DCidYX9ugZsCU+0dcTDIy4YQVpvycdNa4azH+Nm6uR7H2XqfcYcZ+Jp4TSn6EQ=
X-Google-Smtp-Source: AGHT+IGgvcNb0nVQlFTcKcu6JOIlWWDkfbIbuPOAB1CSXeabBGkhzvEOawCNDGbvQTG94lGN9DpG+Q==
X-Received: by 2002:a05:6000:2c3:b0:367:f281:260e with SMTP id
 ffacd0b85a97d-367f2812acamr10220652f8f.3.1721045767292; 
 Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Jul 2024 14:15:39 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-crd: Fix backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
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

The backlight does not work correctly with the current display panel
configuration: It works after boot, but once the display gets disabled it
is not possible to get it back on. It turns out that the ATNA45AF01 panel
needs exactly the same non-standard power sequence as implemented by the
panel-samsung-atna33xc20 driver for sc7180-trogdor-homestar.

Switch the panel in the DT to the new compatible and make two more changes
to make it work correctly:

 1. Add the missing GPIO for the panel EL_ON3 line (EDP_BL_EN on CRD and
    enable-gpios in the DT).
 2. Drop the regulator-always-on for the panel regulator. The panel does
    not seem to power off properly if the regulator stays on.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
This can be applied as fix for 6.11 since the driver works as-is with the
fallback compatible. If so, the defconfig patch should ideally also go
there to ensure people actually have the driver enabled.
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6152bcd0bc1f..4a4eb7211e69 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -268,7 +268,6 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		pinctrl-0 = <&edp_reg_en>;
 		pinctrl-names = "default";
 
-		regulator-always-on;
 		regulator-boot-on;
 	};
 
@@ -724,9 +723,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna45af01", "samsung,atna33xc20";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -785,6 +788,16 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.44.1

