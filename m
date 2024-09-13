Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74B978388
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9146010ED44;
	Fri, 13 Sep 2024 15:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSQId51x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0E10ED40
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f78b28ddb6so19375991fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240169; x=1726844969; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6fGinMsoxJHH1gDGhStsupCS0lT0j7DlavjBxipyt/0=;
 b=QSQId51xWfimoKUScYKd/J5FesMWQmZOB/gRCaWNTk8FYn3hWyghKkIMCqNBuubk83
 kZndqQDh5lgkR/nFMeyhVMrOmZIE1eeevPhe/ozInSlz97djQLtLYP2duPqmt18l6yTK
 xXWkuBHe+vY42akoiuEdVKhS3dl0cwkKgNWfG5A9vcvJYllwfv9obijgVYkzVvdifxdR
 dZFAieND8YK+MH04rKvhGH/fw8KY3RvnlHP0YF1aRNqrzPVrWDuE9a7/9oIH0YtwuUl/
 4zZP03PsWdXasXDqA4OX6JNYv4AL+DjQAsY6FrfZTWukm2xlbsejpIn+o1Pn3fGDJtvd
 Mkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240169; x=1726844969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fGinMsoxJHH1gDGhStsupCS0lT0j7DlavjBxipyt/0=;
 b=kIejZfu0S4xrGmOZmLtTHUMqhnlHxE/5pUWUvLWp8ZVAzTr/Q3B1EXlFOG+gO3nIUf
 RO1gnwQivU5E+jvTEwLIncp5W+/gW3Q8PuYF1ZhlIJOy/ZrEX3IK0rf81x66XX3qBd4G
 oi/ZPrI5Vqa+nEUolD4tpt3L9uhIcxT0kMEyFmK2JLpAIqakLMA2qFL+WGm9YvXWx3RR
 PYOnxFG7J7ERlYDVR8kAM+ENvazcAAXoszqHIlwvXzYRvsMtuKuNGnlx2qKhHdB8t+yY
 EIDaWZB7NzaOs3ROU+aQUZEozxNJnG/dvsf1QJWN45T61Vbwna27jhKX1kAMo+2tHqXu
 ZRVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Zq9hpcpH7zELVdLFH+Unq8XkOwxkTslDoq0x/6Y8R6VJWj9IDgNnUTx/kufObqlQiLoHEy1IIbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuNa5RSeBCpeA2kpVFxz5ZMQjHiX9eYn/nih/1QRga29F6/bAv
 W0OjHRCQWpWreQfOeUtUJngRE8CD1xP3VW1J4APLqjnE5JOeqUnS
X-Google-Smtp-Source: AGHT+IEsMkvGt7hLQi684Ay30ID1FMFVFevU1MTlJ0EnA8fvjeecyqBnmmmCk6jlChOFsa541LWk0g==
X-Received: by 2002:a2e:859:0:b0:2f3:abca:8b0f with SMTP id
 38308e7fff4ca-2f787ee1f49mr29803711fa.27.1726240169009; 
 Fri, 13 Sep 2024 08:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:28 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:09 +0300
Subject: [PATCH v4 26/27] arm64: dts: qcom: starqltechn: add graphics support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-26-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=2196;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=FD1rljMeLn+151Vf5vciVGrZi3usPsZLEWnoi/tRPhI=;
 b=6C6CK/OA4qFYIxjuSjl3Jh3cGdMnGDl0PerNpUvETcvNDy9pXgL6GQGnrjeslJjmw0qV9V0Pz
 Phboy8dYDhEAvBqR7ufbk5QySAlCyzNfS4+gxeOVOYJOt+qRz7QJwzA
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add support for gpu and panel.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index c36ad043edf0..2710386a89e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -203,6 +203,52 @@ vib_pwm: pwm {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8";
+		reg = <0>;
+		vci-supply = <&s2dos05_ldo4>;
+		vddr-supply = <&s2dos05_buck1>;
+		vdd3-supply = <&s2dos05_ldo1>;
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&sde_dsi_default &sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
+		pinctrl-names = "default", "suspend";
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
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+	status = "okay";
+};
 
 &apps_rsc {
 	regulators-0 {
@@ -837,6 +883,27 @@ &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	sde_dsi_default: sde-dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te: sde-te-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";
 		bias-disable;

-- 
2.39.2

