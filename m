Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02F2A791B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD06EA1C;
	Thu,  5 Nov 2020 08:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D06E86F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d24so287300ljg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/Hni58baaBRkBA/E12F1O589RWTv9opCJ9Hh1/iM34=;
 b=Sm5WrQnZ0D3hvsBZOQHkDyD+Jq2TPvlN7uwF8WN3Uv8kuwrYVqVsfq0/3J5+jnU/pT
 VBsQr8GhVo2ZvCRpwrQKBDAGJpGww0kRT/1mIRRiztXRoEWFuCq7sp7IfF8bzW7zYzRc
 78Sj6fJyoZOHfeHRv5kr3D+seIzzDI98P8QNBka2maFbDk7qHCBLquXCtj1Fs/nP/AMX
 6KHos4nxqMOUWtYPNQl786kdx/tN4srQER0Fs42t8PenuKt/C6LOJBTl+T3BJgcTgGD0
 0w+aZp3kr/UZKdvKdQPZYxNDWPJXttyejlGh3BVtz3LDIN/10CvfqqBKcywCCLYFGJ/Y
 PUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/Hni58baaBRkBA/E12F1O589RWTv9opCJ9Hh1/iM34=;
 b=Ao730sdRK8Q995G0aWId54lB9GLbNdEiPDIKBZTYHSLk3WWJufzfR/vCPpTQOFfCBm
 +7jJlKyprzQ/1/p4q7+eUT/ZgU+BG4sQEwtLKPlsD04i72qiIG4sEaOzghNYZ4HRRXKD
 q/QFTGFTAkazt5U0v4teDgalA5CWiyI4Tt6w1GnIg8MWU3nsRL3xZfiwSJ4vADQ7GILF
 oklSBfYVEOiuMcDK7QCm/b+3QEo9ceWhMmtnkD8YbXMVRgmx6fS1OIRudAFYsXS7aiYe
 hU7A+Z0VcjsdTUthEI5nh32OLjTNOP8Df74OT1R48WumQj1fFEXmjBGPmghGwzmjiJKN
 MAtA==
X-Gm-Message-State: AOAM5322wq0K+X+AHhTSVgE+6AtPbqqRO/YcftSDqCOP/8ABDKEmRKAf
 ViFU3CE+yurQvNn8jYJMI/E=
X-Google-Smtp-Source: ABdhPJzKBAFfH6g0Sbo7Iagen9BtmzgUfL9vy4OJ2UR7IPdha9rdzAY7OVi8bWRa54JXYffWGj3W1g==
X-Received: by 2002:a2e:80c2:: with SMTP id r2mr134148ljg.402.1604533532319;
 Wed, 04 Nov 2020 15:45:32 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 26/30] ARM: tegra: ventana: Add voltage supplies to
 DVFS-capable devices
Date: Thu,  5 Nov 2020 02:44:23 +0300
Message-Id: <20201104234427.26477-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add voltage supplies to DVFS-capable devices in order to enable
system-wide voltage scaling and allow CORE/RTC regulators to go lower.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 65 +++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index b158771ac0b7..d5d90605e649 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -23,7 +23,19 @@ memory@0 {
 	};
 
 	host1x@50000000 {
+		core-supply = <&vdd_core>;
+
+		gr2d@54140000 {
+			core-supply = <&vdd_core>;
+		};
+
+		gr3d@54180000 {
+			core-supply = <&vdd_core>;
+		};
+
 		dc@54200000 {
+			core-supply = <&vdd_core>;
+
 			rgb {
 				status = "okay";
 
@@ -31,11 +43,16 @@ rgb {
 			};
 		};
 
+		dc@54240000 {
+			core-supply = <&vdd_core>;
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 
 			vdd-supply = <&hdmi_vdd_reg>;
 			pll-supply = <&hdmi_pll_reg>;
+			core-supply = <&vdd_core>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
@@ -43,6 +60,10 @@ hdmi@54280000 {
 		};
 	};
 
+	vde@6001a000 {
+		core-supply = <&vdd_core>;
+	};
+
 	pinmux@70000014 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -419,18 +440,28 @@ sys_reg: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-core-regulator;
 				};
 
-				sm1 {
+				vdd_cpu: sm1 {
 					regulator-name = "vdd_sm1,vdd_cpu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-coupled-with = <&vdd_core &rtc_vdd>;
+					regulator-coupled-max-spread = <550000 550000>;
 					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				sm2_reg: sm2 {
@@ -449,10 +480,16 @@ ldo1 {
 					regulator-always-on;
 				};
 
-				ldo2 {
+				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-coupled-with = <&vdd_core &vdd_cpu>;
+					regulator-coupled-max-spread = <170000 550000>;
+					regulator-always-on;
+					regulator-boot-on;
+
+					nvidia,tegra-rtc-regulator;
 				};
 
 				ldo3 {
@@ -526,8 +563,13 @@ pmc@7000e400 {
 		nvidia,sys-clock-req-active-high;
 	};
 
+	memory-controller@7000f400 {
+		core-supply = <&vdd_core>;
+	};
+
 	usb@c5000000 {
 		status = "okay";
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@c5000000 {
@@ -538,6 +580,7 @@ usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
 			GPIO_ACTIVE_LOW>;
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@c5004000 {
@@ -548,6 +591,7 @@ usb-phy@c5004000 {
 
 	usb@c5008000 {
 		status = "okay";
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@c5008000 {
@@ -559,6 +603,7 @@ mmc@c8000000 {
 		power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
+		core-supply = <&vdd_core>;
 	};
 
 	mmc@c8000400 {
@@ -567,12 +612,14 @@ mmc@c8000400 {
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
+		core-supply = <&vdd_core>;
 	};
 
 	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		core-supply = <&vdd_core>;
 	};
 
 	backlight: backlight {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
