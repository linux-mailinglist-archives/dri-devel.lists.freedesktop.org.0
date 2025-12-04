Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878BCA273A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742BD10E1BF;
	Thu,  4 Dec 2025 06:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mQYwd2N5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857EB10E1BA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:56 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64312565c10so739874a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828415; x=1765433215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=mQYwd2N5EYPvCPv1MwWZBNtgudCpP4K6vdklVf4OznAASz8zJ4b4DgiEpeDQJ9n2ww
 Yj+Z9pqzihGIWaUHnYiY0ghxVPIxp1yIWZN+hqGdFdxnsz7sqwjCsI8lLUKa0VPfCAxm
 fheMnuNXPJXy70B2+htFIFWw3NQzzTr54Hnwt+NkFO1cPH7B/Xuya8FqNg+du51QGuQB
 5QyfUKvBrMTLJMBk1yTypVImOemgoXZCfHnlQiA8jsLco4bITiNl+8yEY6lkDHqzgWlZ
 8icf47Gn9l1WaftnI9599N/dcCAQkuFpAeubcHuPw7z3BkaRwpEhyKrjhbasS4IlotqO
 UL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828415; x=1765433215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CS1qvZ66jY4Y+/VjejeV3GAhiKWhtdvuL8aLYEGuxs0=;
 b=rd2bYlwJWiVNEkDo/z8mfefkidQn0DOn5tAw1zheDBGw3yoBA4NzfnHKkckRII2DDS
 KgyRQsXNI6whNBKs1hXX5De2m6yYUTa1ckJH8BEQ2DngofmDSPzvgVhVySz/a/kYnCwg
 VKj6knt+oa1E5q2ltESY7HFRv0wwIrJcBRjqChsbcZOzQuBY3zHUyUG3klGh9DhaCxzo
 oIkvhzgVGW7bXlk896Y8wIkmIQ6JqHutf1nLb1TQhVE36E+1GbVvk/5MytQ7UL+Qvyid
 KcnW07HU6EVGIiVWLg617VJj8o5hjMRd2D5lsnxmtd8nG2pcdzwWVvttzHTKkoVX8wL/
 O7LQ==
X-Gm-Message-State: AOJu0Yzv4kB2KufY4AobcsKWUGBAq7l6h6FzRPQxntXAULR/hIBZ3CP5
 N9f7Xon8xfEzdMbZIyIcoL0lFH5uOF6tz0VLXZj/ikRrPBx53CakG+J2
X-Gm-Gg: ASbGncvYw6aX1d5/mH9DOXaqnvuwWL30ZbbGlPUosQdkE3zycCxE2X34bSso1I2pofq
 kt9XvbeQumCskbe58Hhh/ji36nbK4TOkN+VVgepEM/vNCAF0l5uPgDkkinfY4NL3+8b93eo8us0
 t5zBE4GrrSXGGOfCUPs+p4oUXDg/XvBoUhT5SC5mHH+jc6XvILefu3ZjbTJqUS5nJHd5H+UyDbP
 zeN3A4cMtFGo/6aNvRLflsZHATWWh6LzNgafThsdDd5GMha8FJn871Q7nTA0Ce4dbAXnPmyTIwU
 YGjMaW7RTY0Ot7eg6Apk4nttIS3TP8bzisGMQsaWUhyaMawUAq3oTM83uWWjiGv9jKrjUkHu0KI
 I8J7qzlYviy9LDSzUjWb+l0a6XWSD3ChhGTDH3o+DraHiNnyjiUw80TpY6JiWfLlu6NvmVKQG/d
 c=
X-Google-Smtp-Source: AGHT+IE+Fr6H1WVOFv89mmmcteyvoUreGk+YgPA8+X76Lo5K3YtT982xGzt2fTbBOqBAgi8GNeopNA==
X-Received: by 2002:a05:6402:274b:b0:640:b3c4:c22 with SMTP id
 4fb4d7f45d1cf-647abdd3177mr1426616a12.18.1764828414907; 
 Wed, 03 Dec 2025 22:06:54 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Date: Thu,  4 Dec 2025 08:06:19 +0200
Message-ID: <20251204060627.4727-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

