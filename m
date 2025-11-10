Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3FC458F1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CF610E360;
	Mon, 10 Nov 2025 09:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d8ag4Jeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6BA10E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:29 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5943b7bdc37so2557141e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766127; x=1763370927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=d8ag4JebOdg8UTH2g0qYuJSvoTxLXexOv43+OMgpozHmMNxXq/OhVQyp3Wx7Te+fK4
 Xtkic5WaDQLCnKbXv04eKi634YaS2LW+lWn8+w3O5LYLh9Gb4T0whfRioKaXBtCcyXGf
 ipG50iXwbIiW+6idWpcZiXfl4gj4fkI2dA9A+2RT7Reo7IEPGUc0kklFisW7LV2nzczr
 yFSb4PsdI4zYGXB4rZ0amsa2J3V1H6W5CJiPRcX6btxK/pP8NpGy4fQpkj13opU6lSWw
 ui1z5u97LdiWGpWjY52nv/0fgIGp1kfx1hkoKC2JpnjSxX4rmBLhRS55FytIgLcRpXid
 xtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766127; x=1763370927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=nBnXgZzB94PivqrPcB4sWjzt8Wya5n2vVwo+nDeFreiWqY3CIglYzNE9zdKzNhG6fy
 xgGr5C+UhQsYR9mnhZLvud+xszeOy/4qGk7t9BJ4GjHf4vP8zC4tv88SgyPg7n+XUby2
 cz+XJyrDjG9Jkw+xwS9eeZDMLHNlnfuaPTDldOnvXh91Rmnl6ShrLfvw5WzevoOsfub8
 5hwZkPQ4LuAHiRQd70fbrhlzGzCSZ1HwFFE8Tg+AIJ6sPu42jsNfKN3R1HkkGC6leIh3
 3qkV9YJWJMzcCo701mffAoKHXSVG017cMDA+LvY/oq3MOvgeHSGSbzz60IHdX0mk1PeM
 I+mw==
X-Gm-Message-State: AOJu0YzKqdRdLhUYS5IEoeIWciOtdeQSQQney3w3gTIAYa4INAyMWBlh
 lRDFUjta2EFGvNm1++1k5JaEToYPN/zNc980P1ZAKQ3BCxnKD5Flk4yq
X-Gm-Gg: ASbGncuL1r7Nyb4YNJbAO6VQAFs/K2t4gyNtZz5WytPSTUBgy3ibcmofQlSZZDSPl2h
 9OPyB9gl1FOw9CmDyzyc5PKMwXI4+HW6vQKFZHRJB/VObh+fL+G2J3ys2J2ZuGmCHQgPH+Fz+iE
 ywi9aoXl+bqKR9o2Z8iZDfCgmrrZ+ZKaWH4YblAHHSRy895ba8FhwZrqj3RFVzQVwbhpdYHRElM
 E+ucseRUQZrHuha2HlXM0RCfLxNzuHGQopjkqh7/u+5nxV3YLSSD/8rgHB0bMQttSfeilivIVWd
 0QbyIPwrRCyZEx2yV762z4FefrUfMegH0LO4EqMbx+Gv6uI030L2qSWl0VQPf4wWD+0i4XZEnTU
 cDvj9XDNwVGhiV8qLfHIg9gr15k+nNma27G5Vum2PkHNbCLDYQUf+rX6yrfEOz4ea
X-Google-Smtp-Source: AGHT+IGg01NCiIGQo9N2wxV8aW1VWsEBMMCQPFsF2STXbWMO8Vd4nbT/5Lwb6SNxAC57s9F/DHJ/cQ==
X-Received: by 2002:a05:6512:224d:b0:594:511f:f1f1 with SMTP id
 2adb3069b0e04-594599999d3mr3496080e87.11.1762766127093; 
 Mon, 10 Nov 2025 01:15:27 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Date: Mon, 10 Nov 2025 11:14:33 +0200
Message-ID: <20251110091440.5251-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

