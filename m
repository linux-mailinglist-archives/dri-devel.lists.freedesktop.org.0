Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0229978382
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561310ED38;
	Fri, 13 Sep 2024 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZMgGFmab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1AD10ED38
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:23 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso31102331fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240162; x=1726844962; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5paN3POim0M1V5oFYfgmQMIz7bvdUVefYvSK6m+fUeE=;
 b=ZMgGFmabhYaGMA0iSqtYj4ngUnrWYxFnjUJ/wnzWC2Ehae9aJuVF/UEBZZiQvb0Ngv
 JdUWFpDAOHpLw9aKHZMdiWH2BKh37be2QpMf04uK6zGg8atl7XwGy1Z6p0/1FtTBA6Ws
 QjnCSLHv7eSrY1ff5qLJzhvY7PGWboTjW0Twvlb+7rdooQSB49bdkygc72euqk3n16ug
 0WpA8SfSkcxTEkNililqNnzyy/xexEd6aG/iJJNYMnBwnCK+2qbgDzzeJSaZRqlKaOFH
 PK1n8zzBothmcE9v7QyQ3xXXozfBH7roUVfVDVyxljX6rmv739ctQIKsz/9ObEZwy88c
 At9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240162; x=1726844962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5paN3POim0M1V5oFYfgmQMIz7bvdUVefYvSK6m+fUeE=;
 b=rnnp3MA5iE9ngpOOd+I0fUUvHjXWaRf3nVXHQuLu2oMDPEAqo5wE6R7qJDMVCQDapU
 6dsLt/AWagKrV7/LYoxP0yTh/FFx5cMIj+iFYaFUS7QjQDyZ7Cj5eD5UfRqiomxrTXKA
 lvuMBwfk4PYtGHvHx+iOzFMx9/XbAEmQdzNCAR4vBfIDjbx7SkLnPai3Kc1k5foRbzg7
 lbyQyMUcUEewjGjOJBp5wiu9k24Xp8G7H/tJ6gvRb8x8N2tX692FMlg1g8buC/I+a3GS
 kpZaJh+V0a5FmwE6ZDP42HFPLfBUhta8MPh5S/zrpDjkFxl6IXBbmXMnAeqxQCIxoaCU
 mDSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGvtJvunZ2ZpcD4skjqxpxJY8Tjjqs2LY65YPHMmEDiL5fTQ6qUZI7pWHaTmGViJ/1lDJcvVJHaAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoCVLbofzvKFEm/qb4zFSnimkheUWfl3tnXDOP324b/7a+0dcj
 B9Gwx2DvUwnHCMJDE7VNwVG0Amm0zXtTC+5+uXLEfLjJG0pPtUS+
X-Google-Smtp-Source: AGHT+IGOa3rG2/U+LVdvy0rfhL8MzbuMFEt4AJuYsIVlKUh9YYYMrgSmSQIgbFNhJgxCiHNrBCkT4Q==
X-Received: by 2002:a2e:809:0:b0:2f7:4d86:5dcf with SMTP id
 38308e7fff4ca-2f787f1db54mr34021521fa.35.1726240161793; 
 Fri, 13 Sep 2024 08:09:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:20 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:07 +0300
Subject: [PATCH v4 24/27] arm64: dts: qcom: starqltechn: add touchscreen
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-24-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1297;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=xfKPhhSb2zcxmRcgX3kYwVV6/9Weh+gAoxLXODpNqZE=;
 b=H2ABvb3Og7GioCBEnHoqR/zTsCMYCQ09poncV3dRTaltzSUC0uKIPjDC3H7LVXWeM8uWAM2bD
 0/ZP2Q0zlJTASO7xLc4jt1qAZKXbOeEDf61wB1fLvdGeXfm2757FbeD
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

Add support for samsung,s6sy761 touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5e5684f84ffb..37433ef74502 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -561,6 +561,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -665,4 +682,15 @@ i2c21_scl_state: i2c21-scl-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.2

