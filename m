Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D87EF8AA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 21:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A81F10E786;
	Fri, 17 Nov 2023 20:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9BE10E780
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:25:45 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ce31c4a653so1251321a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700252744; x=1700857544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn0jnV8watcY8qyeukKxGsG/nXZh1+98BwjcKTbh6rk=;
 b=I5rYOKS5nXX8xd4SaIY2nmqpAMeTVLM87AI1WjlVByvvMmXUgXFcKh1FQxonz2HAlU
 S+coLXBK3NYClmyyDXAsYGY15J+1+UCETitGaLyzj0R78/KZc7AA6pg693UTIlmqFEv1
 Cy0J5pm8FRBtR5kxC0uv0FVYAWP5XoNtxanzq5pfEfzN01zdwfUDRrwA4quuV/42nwQT
 1c7aqQ6gFGdrTnxgQ0gLwYxlwWt2b8OeHcq3mWV/h6WVMYxbnKV8eIX7lMK8Z9PCnUzQ
 hL5T/mA5GWiQPyGoLVTHK3ouAq0V2sIA+gOdg1bgXVrzOFmwtgmH4mBGfFKOHYO5zs0a
 ArxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700252744; x=1700857544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fn0jnV8watcY8qyeukKxGsG/nXZh1+98BwjcKTbh6rk=;
 b=dlHgv7AoNSMGAVXvEL5sZKOI4EhYTxNS/mP8Hb5f5hy47FwG2moFmGOmGLA2ov1M5k
 6GWtOwSTr835uTbdjUeN+y+g2pAShaToM3kmdkITmYfinUGkLy6/KoxoDvaJeBZ5FinU
 fs2sC/MOijmM5LsPW1DoPjRfHyQepd/Ddy/DmuL0AJmNyCGBqYAKJEe3hQaGvqnze0eC
 fnxSNLtceZzRqq4w41YRFTxePPkVb0BXH52rDPmNMIOwlO9cnS2PC+fBAuRjKDATAe/P
 ipf295gfl+qdmEdU/oBwmBvb4nsR65RTTNXmzFpk1IsiRVuMtaevW9NLDssC8hEEeetF
 EXGw==
X-Gm-Message-State: AOJu0YxJh8mpwNHcPdKA81bqtvt1OsGApFjH/1Hc5tNxoIfvTdX6Jg6y
 2vjOTzq0oytY34WJNMdz+sA=
X-Google-Smtp-Source: AGHT+IG/WiIIxATDLVZjBpAsRyrTJfq/2AtdbHUrOBdWEejgEZ06vPYVj78BAeiC1A59NcitExnJXw==
X-Received: by 2002:a05:6870:64aa:b0:1f5:acc6:3a5c with SMTP id
 cz42-20020a05687064aa00b001f5acc63a5cmr323436oab.44.1700252744646; 
 Fri, 17 Nov 2023 12:25:44 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 zf15-20020a0568716a8f00b001f224cbbde1sm390543oab.41.2023.11.17.12.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:25:44 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 6/6] arm64: dts: rockchip: Add Powkiddy RK2023
Date: Fri, 17 Nov 2023 14:25:36 -0600
Message-Id: <20231117202536.1387815-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023. The Powkiddy RK2023 is a handheld
gaming device with a 3.5 inch screen powered by the Rockchip RK3566
SoC. The device looks physically different from the Powkiddy RGB30,
but is functionally identical except for the panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index a18f33bf0c0e..f969618da352 100644
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
index 000000000000..ba32d0793dca
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566-powkiddy-rk2023.dtsi"
+
+/ {
+	model = "RK2023";
+	compatible = "powkiddy,rk2023", "rockchip,rk3566";
+};
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			  <200000000>, <115200000>;
+};
+
+&dsi0 {
+	panel: panel@0 {
+		compatible = "powkiddy,rk2023-panel", "newvision,nv3051d";
+		reg = <0>;
+		backlight = <&backlight>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst>;
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc3v3_lcd0_n>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
-- 
2.34.1

