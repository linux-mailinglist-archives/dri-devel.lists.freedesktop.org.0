Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513B7CE297
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958610E195;
	Wed, 18 Oct 2023 16:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C3710E191
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:58 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b2d9ac9926so1127563b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645938; x=1698250738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cncp6Vqz2tNKyeMpBE+MzO1YFnQJcaDwVPsn6h2VtJs=;
 b=IkVXx8+nYY/IjXHdMUqUwlrNzjCZM2ZfGzUQ1nEp8uNI3kRcqRarxDOIoSzqwnXMQ/
 I87DAUjessz14Rgo+koktij07tuu0zVV11hq//9QEGKF09qGFIRQRsHQdEnRSHh1es4n
 SwnIsc04POi7DTWIAeiJb5SeRy3VuTxFfNWDA+wkgVWaeWqDo6b5VgU8cAbF8biIzswq
 93m2cjfLaa2cDTxndFEroQDO8uYh9RsqmKTRbd8njiAyuOdRJ3UOQ67oKJANgQ1f/2SD
 yNZYHKb+CKFfOzPj1+nYAIJiDslVyP3uay6uYoASzzukwGQ3A8TWaRDCFGG9OQOAmjaQ
 Fyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645938; x=1698250738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cncp6Vqz2tNKyeMpBE+MzO1YFnQJcaDwVPsn6h2VtJs=;
 b=cVUgFDTF9A3BWlcHUd0cDYw7YqNGYsuFe+NAJupHvmsMEw7kS/k3j8SrZerwrt4WZp
 V/lONgU8f55Rvn/bgKqriKDA5W4EuHcGtimASSU8wSmhyaocvpClo2Jf4/7lggYU4JX/
 E/rJFJPQ2SfILV3+83zxMcFWZpTRQUzgszSDxJtLnESt5Z1vOlFaPgijwSALqHpRbZLa
 Qp7Z7WsBKzo2oy/kcFAFS4RgH5T2SF0t/dxXB2Eh4olQtqNtdWu2bUukWmFlTyE9dIwj
 CX0GLM1s7TDk6bJzAucnqnF7Ccnn4VR2ZLVXdZfsVfbZrhAzUZdsxW9S+F/uNg8/eR8b
 g62w==
X-Gm-Message-State: AOJu0YzLu8eZhT3QskiYiHNcwVX2vRubFpwKuSkrH6X2jjPLtRMupEht
 xbsyq6ecBf3MO/aqAqTRiSo=
X-Google-Smtp-Source: AGHT+IE/YzedQcbGDsoYXAmqsp/sqSQwZYk7tpz3fGbIapByB8nFBl2o/e0043FsZ2iRLZAQsAXZaQ==
X-Received: by 2002:aca:1112:0:b0:3af:983a:8129 with SMTP id
 18-20020aca1112000000b003af983a8129mr6150694oir.53.1697645938112; 
 Wed, 18 Oct 2023 09:18:58 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: rockchip: add Powkiddy RK2023
Date: Wed, 18 Oct 2023 11:18:48 -0500
Message-Id: <20231018161848.346947-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023. The Powkiddy RK2023 is a handheld
gaming device with a 3.5 inch screen powered by the Rockchip RK3566
SoC. The device is almost identical to the Anbernic RG353P except it
lacks eMMC, a function button, a touch screen, no UART headers on the
board, and the panel has slightly different timings.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3f01b429a3aa..9ef64cfb8392 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
new file mode 100644
index 000000000000..5740412f6b2b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566-anbernic-rg353x.dtsi"
+
+/ {
+	model = "RK2023";
+	compatible = "powkiddy,rk2023", "rockchip,rk3566";
+
+	aliases {
+		mmc1 = &sdmmc0;
+		mmc2 = &sdmmc1;
+		mmc3 = &sdmmc2;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3151000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <2000000>;
+		constant-charge-voltage-max-microvolt = <4250000>;
+		factory-internal-resistance-micro-ohms = <117000>;
+		voltage-max-design-microvolt = <4172000>;
+		voltage-min-design-microvolt = <3400000>;
+
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 =  <4172000 100>, <4092000 95>, <4035000 90>, <3990000 85>,
+					<3939000 80>, <3895000 75>, <3852000 70>, <3807000 65>,
+					<3762000 60>, <3713000 55>, <3672000 50>, <3647000 45>,
+					<3629000 40>, <3613000 35>, <3598000 30>, <3578000 25>,
+					<3550000 20>, <3519000 15>, <3479000 10>, <3438000 5>,
+					<3400000 0>;
+	};
+
+	/* Channels reversed for headphones. */
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "rk817_int";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Speaker", "Internal Speakers";
+		simple-audio-card,routing =
+			"MICL", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Internal Speakers", "SPKO";
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+	};
+
+};
+
+/delete-node/ &adc_keys;
+
+&chosen {
+	/delete-property/ stdout-path;
+};
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			  <200000000>, <115200000>;
+};
+
+&gpio_keys_control {
+	button-r1 {
+		gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+		label = "TR";
+		linux,code = <BTN_TR>;
+	};
+
+	button-r2 {
+		gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
+		label = "TR2";
+		linux,code = <BTN_TR2>;
+	};
+};
+
+/delete-node/ &{/i2c@fdd40000/regulator@40};
+
+&i2c0 {
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1390000>;
+		regulator-name = "vdd_cpu";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc_sys>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+/*
+ * Device has 2 controllable LEDs (a red and a green) along with a red
+ * LED that cannot be controlled and is always on when device is
+ * powered.
+ */
+
+/delete-node/ &{/pwm-leds/led-2};
+
+&leds {
+	green_led: led-0 {
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_STATUS;
+		max-brightness = <255>;
+		pwms = <&pwm6 0 25000 0>;
+	};
+
+	red_led: led-1 {
+		color = <LED_COLOR_ID_RED>;
+		function = LED_FUNCTION_CHARGING;
+		max-brightness = <255>;
+		pwms = <&pwm7 0 25000 0>;
+	};
+
+};
+
+&panel {
+	compatible = "powkiddy,rk2023-panel", "newvision,nv3051d";
+};
+
+&pwm5 {
+	status = "disabled";
+};
+
+&rk817 {
+	rk817_charger: charger {
+		monitored-battery = <&battery>;
+		rockchip,resistor-sense-micro-ohms = <10000>;
+		rockchip,sleep-enter-current-microamp = <300000>;
+		rockchip,sleep-filter-current-microamp = <100000>;
+	};
+};
+
+/* There is no UART header visible on the board for this device. */
+&uart2 {
+	status = "disabled";
+};
+
+/delete-node/ &vibrator;
-- 
2.34.1

