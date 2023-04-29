Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A26F244D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 12:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3B10E0E2;
	Sat, 29 Apr 2023 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782310E0AB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 10:46:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f490so917123a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682765159; x=1685357159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8i7rGQnK06oWrox/+/zsH6gyQIWGdw1cmoWrKvTJu0=;
 b=ECTA/9/pB1Aymto+vgPPXAGx2Mz0xzcGbhYKDM/Gj4N5GH35j+EKmQ8cCYBB1SNBVd
 18dQAyC2YsDgi6+QKqbkaRKmbSblqWh5Al5G8D/u/avdbAT3sNcuEMdFmDlM31xUNICY
 E3FWlj6q6uOLAGoRxrMoPhAIgbPtHD5eZAEdMjprP7RCioYDXy21t5m+I8hQ8WDOG+G+
 FG8M58072bKX0imFso5nTX2CJSx4fRE0DSZpDybJwN04wikukos70njeZhL1AzT3vg2A
 3Tg59bfjkpu/qjBOjiYo7B6oYwp9HjGSyhPgLH4Iz0MEdgGrfO+b2P2QYjbtVpRBj1iP
 1qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682765159; x=1685357159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8i7rGQnK06oWrox/+/zsH6gyQIWGdw1cmoWrKvTJu0=;
 b=IzUhtVTsYyjgATyyVoHbl9quqAvPyw4TMzvqpP5qB2BDRTIaBq6cHCQyWeJKyg7VDy
 qKEZ/QVzKSHXdVnOsPlJsoAyebujc2/RZz2Vme9OgTaNSsOYlvZSgEYimQk1FGSmfYUF
 zTQVuRKWhMdon2gwdEQjbx7H/9AL/xuxsPyk43V5SRhYpGWb9P95DeIj0Yfq6+nGaEsh
 dHQcHNPceP3LT3OD1knRDI1BnL/egjhJ55xJyf1M3ZBKeGZpp3WLNgaI4F2vEXXkRHan
 b6Tx3h9ngavpN8vO8CteqGvMmRlFKXN89bD1tMfc1u/p4ykLN1+Yk7F/CQ8aYLMKXuoj
 rReQ==
X-Gm-Message-State: AC+VfDwbcNoW5YNhq5DkJ/oUxYaWH/cAVmlN9hSFP3A0Rpbc9Ilscex7
 x27Nl1A0roFyJIkd6qV68vQ=
X-Google-Smtp-Source: ACHHUZ7QTqQ3HOeexrhn9fW09EilRSCgystsEJS6enNJ6B7Rh0+1wWmP0iMty5BrTXpQ46zowvgyGg==
X-Received: by 2002:a50:ef1a:0:b0:502:233e:af49 with SMTP id
 m26-20020a50ef1a000000b00502233eaf49mr1253772eds.4.1682765159016; 
 Sat, 29 Apr 2023 03:45:59 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm9952522edv.86.2023.04.29.03.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 03:45:58 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/4] ARM: dts: adapt to LP855X bindings changes
Date: Sat, 29 Apr 2023 12:45:33 +0200
Message-Id: <20230429104534.28943-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429104534.28943-1-aweber.kernel@gmail.com>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change underscores in ROM node names to dashes, and remove deprecated
pwm-period property.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../dts/qcom-apq8026-samsung-matisse-wifi.dts |  1 -
 ...-msm8974pro-sony-xperia-shinano-castor.dts | 23 ++++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
index 91b860e24681..884d99297d4c 100644
--- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
@@ -99,7 +99,6 @@ backlight@2c {
 
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0x3f>;
-			pwm-period = <100000>;
 
 			pwms = <&backlight_pwm 0 100000>;
 			pwm-names = "lp8556";
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 04bc58d87abf..2396253f953a 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -150,47 +150,48 @@ lp8566_wled: backlight@2c {
 		bl-name = "backlight";
 		dev-ctrl = /bits/ 8 <0x05>;
 		init-brt = /bits/ 8 <0x3f>;
-		rom_a0h {
+
+		rom-a0h {
 			rom-addr = /bits/ 8 <0xa0>;
 			rom-val = /bits/ 8 <0xff>;
 		};
-		rom_a1h {
+		rom-a1h {
 			rom-addr = /bits/ 8 <0xa1>;
 			rom-val = /bits/ 8 <0x3f>;
 		};
-		rom_a2h {
+		rom-a2h {
 			rom-addr = /bits/ 8 <0xa2>;
 			rom-val = /bits/ 8 <0x20>;
 		};
-		rom_a3h {
+		rom-a3h {
 			rom-addr = /bits/ 8 <0xa3>;
 			rom-val = /bits/ 8 <0x5e>;
 		};
-		rom_a4h {
+		rom-a4h {
 			rom-addr = /bits/ 8 <0xa4>;
 			rom-val = /bits/ 8 <0x02>;
 		};
-		rom_a5h {
+		rom-a5h {
 			rom-addr = /bits/ 8 <0xa5>;
 			rom-val = /bits/ 8 <0x04>;
 		};
-		rom_a6h {
+		rom-a6h {
 			rom-addr = /bits/ 8 <0xa6>;
 			rom-val = /bits/ 8 <0x80>;
 		};
-		rom_a7h {
+		rom-a7h {
 			rom-addr = /bits/ 8 <0xa7>;
 			rom-val = /bits/ 8 <0xf7>;
 		};
-		rom_a9h {
+		rom-a9h {
 			rom-addr = /bits/ 8 <0xa9>;
 			rom-val = /bits/ 8 <0x80>;
 		};
-		rom_aah {
+		rom-aah {
 			rom-addr = /bits/ 8 <0xaa>;
 			rom-val = /bits/ 8 <0x0f>;
 		};
-		rom_aeh {
+		rom-aeh {
 			rom-addr = /bits/ 8 <0xae>;
 			rom-val = /bits/ 8 <0x0f>;
 		};
-- 
2.40.1

