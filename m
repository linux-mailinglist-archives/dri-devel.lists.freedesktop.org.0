Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A3BC3D43
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394910E77F;
	Wed,  8 Oct 2025 08:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z1Q7akrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FD410E1E3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-58d29830058so7224510e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912121; x=1760516921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=Z1Q7akrnRzGUjG1r/No1H3UFcdVrTWmabieExD/Sggj7J3EAWiEXBZpentyJTSwjEB
 xCmBHEvV6bN0iuxDx4LL11abIw+p1NVno9kA/C8+kdtmazeaYTgNJ2v/H2KjMR+yQHOh
 IEwqo1N7pBs6hNS4/p1x27tnyMWQ1OVSfGvCpEBOVNMMv72lq+PffL7sUMV7zqEa4PnX
 ioQqRXPoOPutvo764Bx4B2lPREx8ZHhTQMJpM91QiJ2UYB4442wzFs/rZbCjVt7Xb9kp
 63ErVwA7ETdmn0fpfjr3XGwWI4Jb+5MkmgmGvtzpLatiiXDqnOj/9NRHh0hQlXbIyO2z
 wE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912121; x=1760516921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=SeXrdq+VJ/+IsdZzpPuU9+MKAxfUR5fMSgtiwveErzgH+QJIAJbySz2V7PuFPALimj
 mydXPBxlTMV4nZ1PLHZzTyTQc8Co7qKztBeVFwTO1YeWb29YHDkCDP077eV8FvqrMG+4
 pj95ebiopwhZs7tqrWVwmUo1NBWKGXxoiDYH+9gXhJT1eTp5hrIwlcKbGdwBTDAdK6Tz
 9QiYf3hueFx3WP7jQcQO6jAx/WOBjHlGcKp/DU+uJ5JN67mzyRO6g9C6i+73zb7Y/UeZ
 9oguXn94c7pSRS+9YcPX/HJTsVsN3EYVVZeLF5zfgx8oLPwgvXfs9keOZ/gjrU/eaklh
 IIbg==
X-Gm-Message-State: AOJu0YzGPVmIQOWTfI70HN5frcJzjcsdetEx1OzsT0PTIobubihpEgq1
 utpOXcTjhlhOXpSteAzB3yex1CtOvNRu5MjW0hGI4C2n6hx4JMNgLeC7
X-Gm-Gg: ASbGnctOE1UakEwzfKyRCn1RzWSGpF8r56VnGXihLNc+nbyeMQTtPTMCZEf9cTYLVja
 z2IHUI5yPtiyFLcKbuz2SOuI1a//I/NszrrFXOAzA0iyFFt5nvPHGlsy5UqmnUBZGk9maDZGXyz
 ap702x09rR9BtJs0MzSJsYO6CMR2O4hAAP4sNy5POH4ZJ2ACv7fphzZlgxgSUYDmzLBkU+98Lu0
 SlaKIykPb0t8DeXIXwBmBYHas9Xix6zFUIAwIQSEp5sbOARVLCQBKBFn8gU/hLZ8MlGOIzZwlOf
 wNSDncsgEcu/SzjX9e76rTihuZYUuQ7+JM0REQ/rKqQpX6avgYpjDWE/TPdZRrexbJvvAroie64
 UCdx4jw9K6RWqCbUQCnddYDYTy4VuqLYD8nN0qg==
X-Google-Smtp-Source: AGHT+IFV9hCDPQx6NSx5ECD7DNlbhKuCcj5wIMJQj0wyuQZ2L9bgoGkjVG4izGN54TiKv8m27OKE3A==
X-Received: by 2002:a05:6512:3b26:b0:58b:a:d043 with SMTP id
 2adb3069b0e04-5906d88b312mr813137e87.17.1759912120855; 
 Wed, 08 Oct 2025 01:28:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:40 -0700 (PDT)
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
Subject: [PATCH v2 3/7] ARM: tn7: adjust panel node
Date: Wed,  8 Oct 2025 11:27:55 +0300
Message-ID: <20251008082800.67718-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
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

