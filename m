Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A62A790F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057EE6E9E5;
	Thu,  5 Nov 2020 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890306E850
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:36 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b1so136303lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gi4Ws1VebKSodZ1aFskWWEY2ENCBRhjpkPkVyE+JZ/s=;
 b=ZVGF415ceJ5cr2f9Gly+jv4fzQXLlFJzBRcuR2zD4WvgH5zsluXpWCU+Qj1Ax6ZhVf
 1u0lOZIC13jnHSZyF8YgC9LapKlkjSE2olp5X0VAkAmOHo47oGiOd5KA51jau/9+1r5Q
 ZeTQKEqrAXOCG4BSyhIC6+s49wRDSmdZMvycdRKpjqSje66qxlJOfAn1erQ73TtXXuaZ
 iSCWRvM8IOOU+neCqee3lOhq+/lqVKY3CF0lloOJSA1gj7ifC6+jn0RNW/R6aoa+9wD+
 dgu4HpFxYtEPUrSRWIfoyjVSloujlYPyvV4oLCDPZxUQsNdkHeXL2lcu1JDT6N4vPELD
 54yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gi4Ws1VebKSodZ1aFskWWEY2ENCBRhjpkPkVyE+JZ/s=;
 b=PMnoTFReOkBSSBJBBQoLQjj0uZ5qY8D8BGnZ5K7GWsosBxC2+re42gPDJoMahChOPm
 iVTfk2ZLrt2oxAWkvOr4aivfHWthePoZILqb/OccmWnvsEqsmm72ZtfG11hEe7aWJqlE
 t4Rn6qOrsTtCnr1b9FdWzpPTNxkcvL20xplU6FisQJpRuxisQ3ifZgLDNRqTnrYvaXgp
 /rVcCYTC/nHLcmpurYyX8wGxkDdDhS8Xpg+Id/vx1zwLwbxkSXOuLCExkSyL7SAgS1uJ
 oEjHbuU8TgkkNr6AU90z0fyjEJkNxluMLuMqENfAOdS0QqwEgnWAx6hHsBNGIBm+06zM
 zx8g==
X-Gm-Message-State: AOAM5320dp95iCr4gYfS7nbWM2G68pWfm687FnxI7dnK5CAdOJpIZc57
 dpd8alFT17qKvTWkJX7Y5bk=
X-Google-Smtp-Source: ABdhPJxSINEdNTI8WAS9/8DNtowjH/ui3U9cyprfFygiShmm4vwewOoOOmbkqukzpRnxz4FsJYlb2g==
X-Received: by 2002:ac2:5498:: with SMTP id t24mr69465lfk.12.1604533535051;
 Wed, 04 Nov 2020 15:45:35 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:34 -0800 (PST)
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
Subject: [PATCH v1 28/30] ARM: tegra: acer-a500: Add voltage supplies to
 DVFS-capable devices
Date: Thu,  5 Nov 2020 02:44:25 +0300
Message-Id: <20201104234427.26477-29-digetx@gmail.com>
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
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index b4ed88802387..5ab6872cd84c 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -60,7 +60,19 @@ linux,cma@30000000 {
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
 
@@ -73,12 +85,17 @@ lcd_output: endpoint {
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
 			hdmi-supply = <&vdd_5v0_sys>;
+			core-supply = <&vdd_core>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
@@ -86,6 +103,10 @@ hdmi@54280000 {
 		};
 	};
 
+	vde@6001a000 {
+		core-supply = <&vdd_core>;
+	};
+
 	pinmux@70000014 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -565,7 +586,7 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -606,7 +627,7 @@ ldo1 {
 
 				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&vdd_core &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -696,6 +717,7 @@ usb@c5000000 {
 		compatible = "nvidia,tegra20-udc";
 		status = "okay";
 		dr_mode = "peripheral";
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@c5000000 {
@@ -709,6 +731,7 @@ usb-phy@c5000000 {
 
 	usb@c5008000 {
 		status = "okay";
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@c5008000 {
@@ -746,6 +769,7 @@ sdmmc1: mmc@c8000000 {
 		non-removable;
 
 		mmc-pwrseq = <&brcm_wifi_pwrseq>;
+		core-supply = <&vdd_core>;
 		vmmc-supply = <&vdd_3v3_sys>;
 		vqmmc-supply = <&vdd_3v3_sys>;
 
@@ -764,6 +788,7 @@ sdmmc3: mmc@c8000400 {
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
+		core-supply = <&vdd_core>;
 		vmmc-supply = <&vdd_3v3_sys>;
 		vqmmc-supply = <&vdd_3v3_sys>;
 	};
@@ -771,6 +796,7 @@ sdmmc3: mmc@c8000400 {
 	sdmmc4: mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
+		core-supply = <&vdd_core>;
 		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vdd_3v3_sys>;
 		non-removable;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
