Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F9BA98AF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83A10E439;
	Mon, 29 Sep 2025 14:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F5KtqPx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2572C10E432
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:24 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-371e4858f74so31442411fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155922; x=1759760722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=F5KtqPx+8a2n1LWtkB0ZaltcXrin6HatoTeFNN6vH/31OLC565bvObkFygiNkFp1MJ
 22nhFzMTTU3S3UyRIdr0at91tgdPamAoJEGDErc5jqRwbBWKEJpOGrsLcjQTUA1k9fsb
 pTLyc0nKCxMDmXvVJPxNT6iBqPvSGEwFOlm3OVAotp4uHzehZQRTcdp/22gt/BSI/8Lg
 N7azF90DQjjtS8gtOnQYRJQ0JV7OhSjFDsk38vaLOCPMFBrEAIdnaaFht3mYbE+paRe7
 gQwKoEOSsheAR8I/mUUx6ep+SXXit12HLIErtqZToasqxd5CKvqsmM3CPWko1N0muWz6
 W+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155922; x=1759760722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=upDv/tYG6t8Qhw2X8n6fPwEWrxkr0I78oCB9vgvbVNNPuSWQYUbnaiiOBOkmIa/jGp
 a50yHPHRTfg0Hl80WPmjGYkd0EEc3aUJfZq2GYKmLzjRPtqKOwvYr74eerWkurZdOu5u
 L0aYCQ5Y1XrAM0CWDv2Mn6w1eu+evf3wZGvif2VXNqaQ8Z9PSOCsnIw5x+Otlbbj8PE+
 SuXHwKBlNAPXYZb3Hlchgs1gEzmX1xjJBNlSBhor3zoh3Tgzgo4iU8Vhzhhp2A9N3Sm8
 p5n9fVZ25Lzqndfgsxaknp0caPBFFgz7v3Z2mhv64ixQs903CJZeFwaFYgmQQWbf/Vj6
 Tirw==
X-Gm-Message-State: AOJu0Yw3Kl2lmdRVO4I+BiiC3AOx+1fbAn4plcs2R5sohTRlmcIGXCe+
 o/K28wjegiIC732oxZ36dCBOHRAea+3nj2zfdfU55rxeVgfs4wru8Vq2
X-Gm-Gg: ASbGncuk1GaUp2yB0/aTS8KJahL7ukPgTgkd8fa9lRCSkTPra2KksbhsU5uNk5hXNwp
 RAaJ7UQx3J5kwQrLh/dyeaTNdaJNn7xYmzrC0ZKQBbq/Ip3YZO8puG6xk3nA8q1bC+gVspHoE0I
 aju6gBp3GrhKiZmoQAGGPhcb9hxFuSLK8urEeYSMtSXvQbqh6moYOVmIjXrOpRLOIyr9huWLsY6
 nag2q1uPAwp4wXvgjGgd+cCgnrxqaArWoLc+RyBMz5cAurngSDr58E/IHcskoAal07gBlpjF0DR
 fXX/UejrPt0tss0q4UTsUUFAt85BgvN1csqia7a+wg+cqeIwjI+xPJ0ZIgr0NPxRiALXPwptbqZ
 wcFRkm1OATHWKSgtorJ3vefRc
X-Google-Smtp-Source: AGHT+IFG+Ih0xaj7zpJFsK+/+exH1aoBAWLVyYSD//n2Y4fEfbx51EUFKSvnwF0GU5y7LWmXyxKWTg==
X-Received: by 2002:a05:651c:1581:b0:372:91d2:f659 with SMTP id
 38308e7fff4ca-372fa23164bmr2454131fa.3.1759155922087; 
 Mon, 29 Sep 2025 07:25:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/8] ARM: tn7: adjust panel node
Date: Mon, 29 Sep 2025 17:24:49 +0300
Message-ID: <20250929142455.24883-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust panel node in Tegra Note 7 according to the updated schema.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index bfbdb345575a..75fbafb4a872 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -43,7 +43,9 @@ panel@0 {
 				compatible = "lg,ld070wx3-sl01";
 				reg = <0>;
 
-				power-supply = <&vdd_lcd>;
+				vdd-supply = <&avdd_lcd>;
+				vcc-supply = <&dvdd_lcd>;
+
 				backlight = <&backlight>;
 			};
 		};
@@ -101,11 +103,10 @@ smps45 {
 						regulator-boot-on;
 					};
 
-					smps6 {
+					avdd_lcd: smps6 {
 						regulator-name = "va-lcd-hv";
-						regulator-min-microvolt = <3000000>;
-						regulator-max-microvolt = <3000000>;
-						regulator-always-on;
+						regulator-min-microvolt = <3160000>;
+						regulator-max-microvolt = <3160000>;
 						regulator-boot-on;
 					};
 
@@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator-lcd {
+	dvdd_lcd: regulator-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "VD_LCD_1V8";
 		regulator-min-microvolt = <1800000>;
-- 
2.48.1

