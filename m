Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D286A92D70B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F22410E2A9;
	Wed, 10 Jul 2024 17:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JJLhvZTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5833D10E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:20 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e976208f8so7221547e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631118; x=1721235918; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ejuDXxzDzIH7zcxYcOPWRk3uTUuzsIoqRWToUCtONmU=;
 b=JJLhvZTEcTjlDA8tdOMgibjopFTRSuMUU5j/aLOXsGF5ovJjSdXpRDdEH3lfateAw3
 BgWejUOMx30SCNUfPT56cftvb62lKnt31yLfP9qflZFiFIFSmJs6eSFSYB8jXMjOTaoi
 vgphPmuPUS1mFQE0ObbwTGIw+GTPM2hpzwAAtQw/fiYiLZEV7JdvjmjMFzWO+6BWNJIN
 kFjr77TW8nBqjCO3HEoDPwSHDR5ZIL5b9JZfDwX17bsyLd09+ypszKuwdXunWA8prHyw
 TQ56az5jJAHORHEoOGI7F+txGAf/a5IViUyZfchhfJzDndOFms/Qt+PnMnxWbZPZvpPs
 qpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631118; x=1721235918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejuDXxzDzIH7zcxYcOPWRk3uTUuzsIoqRWToUCtONmU=;
 b=j5+K59jSSk5vdwRlQAyJ4bSoClsmACkywljTgHXecSvGAE+JFq5ZgpycECzsxe3p8A
 eQGZZ4CNHXoAR0dtkTZOetJ7HyO8tRjfNj/6NglB7kKBwPiJaMr/gLzSZmInup4lMEPL
 nn3H8qt1lxWJ6tNuvML/qFsEX2o4FHdLe5nnYlRbr5OeVNv/XNecpzYhf8a6B/arCi18
 Hz0KkeTan2fSQI+Mb+iCfxL+aWn33VOe/iD2+WEhlj+OCyFbaFNtw009xobA8C8LvAwR
 NHtS0Y7imCMhphMPxbhZ4fDYZ9zHg1xlEscq2SHAWkMzqRumAfQwSncsiSXGkgsKhzhW
 oipA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRp9nxXiVt7AwJVtA/EtFzZDKRq3T2SD+s7BFifuN0ehgqaoaEnsyPGBqmYdq4Zofg180h4lqTgHrRG2t2P4JQkElDnTPLnUSh0gBMsClr
X-Gm-Message-State: AOJu0Yy+fZQ+sa9PGffUsLADwOH1oxbx4pcrdWm0dapo08phQDPUuDVx
 Fu952jQ3vpB6z0HuRKnSZdP3GOEpjoEQ3PAMmHjX0+fw+vFmLjwhzPjuo+NzxX4=
X-Google-Smtp-Source: AGHT+IEdzDMqSpFrgPIKMoDSkhiU2e+ql+AL5vU9wurvK32RxWDhsTOWJlgEkSrVCpO+E3+Am+YAjQ==
X-Received: by 2002:ac2:4281:0:b0:52e:9471:e533 with SMTP id
 2adb3069b0e04-52eb99d5fb9mr3803124e87.66.1720631118372; 
 Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:05:00 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100-crd: Fix backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-4-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
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

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6152bcd0bc1f..7d6800dd9b8a 100644
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
+			compatible = "samsung,atna45af01";
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

