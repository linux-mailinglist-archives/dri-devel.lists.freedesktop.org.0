Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A890DD5D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FF910E7B8;
	Tue, 18 Jun 2024 20:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JeQvMPx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A172610E6A4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57c83100bd6so6736298a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719238; x=1719324038; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bKqBqiUFuc0JpR2mqQXDoqJZzafqiedaqDrYiJZ4fmQ=;
 b=JeQvMPx5Lz/rkCtfvSj3Erds7goL14fCpil6qI8Zxpr9iBLiUaHVlKGHoNHZTdLF3/
 7dPcEYPmAZ8KYo5lr+cb09L3PpoatD2T7v2vXwhPP/HorP70GRSIJDecJGFwHqXHoMYl
 H+KvYni5HPUdJOlBEHYSutauiKmQO0pHnF/MxVDi7ftVYV+Fqfrr9TIp7EiIrUb3fLwe
 m+PJNZ5A7D5pKXcI8CFryYEP9ZJok/QtQqz9yiC/F/ioxi0P5y9aXdmVK8+H6fG2jZKQ
 wHILiKv5u84QX5/xjJ5UAXjdzvmArKv7aH5FGcNj+pl+n3KclxhPaetQwXnxMT/FFTd9
 JeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719238; x=1719324038;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKqBqiUFuc0JpR2mqQXDoqJZzafqiedaqDrYiJZ4fmQ=;
 b=mXzBwjlHXSqD/vKYGti473kCmemLuFBHMoLikU9htV92E6jDivwDvjd3xqr08TwZ4n
 zGEO7DjgvWO/f7ts4ICCcUyInDds0rEP7Nqtc4e36AkJsS+7vYJNPnKrqrbU3MCQwDo9
 snzaje/V3sjrhMdF4syB8u4hkPFxgaGIv/3cYLMDFcFy/0P1c8O6tXRy7XB8JAYJsqoC
 JYqZH8/uNLx/prUl3xi0QOpUrlocoPcTQneh9jEDqL67JkSGFmQ3uGHPoaQrk1g9AyFz
 qXUxMmg4J6Ql5ft9OgzDiJ6TFZY0uMnPbyFK01uN4bJ0T+8/RZPvgzmfI3oaVZmNHxI/
 XetA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvQ0G1KJPA6SnB7DjPPpszHrfbSPVD+qvvlYJQtKhRGtUO8Ed7C7s6Y53cpPdbZ6lPpJBTCNhjMyfkqyEYglb0iEXyfhAEaHHsl7Sp8Ev4
X-Gm-Message-State: AOJu0YztsTNoM9JFOVwwU/ajC2rIBNTDYPxscedK0b1bjgIGuKa+YwxM
 1NtemhLUbE9+l/MIP5is5M1P66ftsb/U7fRNLYb33sDBpzM8umr4u41FQg==
X-Google-Smtp-Source: AGHT+IHj0NVO2LbmqVwPKLiM4o8xwGtgHAaztxBmavCHO3e8YhM7E9p3r0tm0tYI9onhxvxtZXb41w==
X-Received: by 2002:a50:c34e:0:b0:57d:61a:7f20 with SMTP id
 4fb4d7f45d1cf-57d061a7f8cmr36144a12.3.1718719237717; 
 Tue, 18 Jun 2024 07:00:37 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:37 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:56 +0300
Subject: [PATCH v3 22/23] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=1140;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=bJDbtUbL+y5wg/waQs7Lp8AQgTgkl1/W9/LG9VfOOh4=;
 b=vQvnoeSWgPz4eSKFu+g3ROb/3wWMV5zcWLBJBEbi09PSN9t4bbEHIOEE3tV5BtVu/RZcsInhL
 2HFncvbDEwDAvdoxgn+AsxypoVxKaQ9PVyDF809mOr1KJqn/aQULMnK
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 578798704577..bad154b1e894 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -126,8 +126,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -148,6 +146,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.2

