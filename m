Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E26851D43
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E5310E7F4;
	Mon, 12 Feb 2024 18:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rve4ZXl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD0E10E7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:50:02 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5957ede4deaso2216057eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763801; x=1708368601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8Muw6h1Q9P9TaGArYYX/lVFQTdPnjrlwu+lY7NfQMY=;
 b=Rve4ZXl/bJtGIMbYbIFFx2ELVGAjmuvw5NigeJHTs1FpYa6blJT9ONBhrM4zwZYfBs
 PPeqExKhY+6jK4/mJ7LHCYNgtqK1q1YyIzPW2zmqcDhWEKmOOpysYRmCSTGvCR/lGA0D
 Y9FoFzSqo5cBQMrwRvlKsGSMOkB27l8ydYVk+gpoDdJg1OoQF/Fsf/rGsdnkc8n6gpPt
 KT/3Y5p1tytsLp45J31DQV6+dmHrVrv4M7purrpds5EpNmDF8XsgyiZ7r9xUaOH5cHoG
 L9yZsYF4DhxBPrSUFdxjRuE0oCjJlcP4WmElce/yTcPZj3QdRpd/U9VIh1fRM5mejEco
 1SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763801; x=1708368601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8Muw6h1Q9P9TaGArYYX/lVFQTdPnjrlwu+lY7NfQMY=;
 b=hbwS+R46jJnj0x2XC0ugbu77DNg7V5+SEh9iJciWaN1IhVEyP7i6ntGPCDlY9D5AMS
 i5O3/Y0pBxgPnhxpn4GH+Om4jqpnpf7ZRLKcVzbOEKCWKfCbKVO3FBDoCqH5k0Dw6OZs
 w6dDhje/lo2cm4ixDHlx9zc79MRvbhKQduH7P5c42BOjJG4Fqr843jBy8Z7WrvsQS2m5
 9PoBPAUXTB2fcHb1jgV0SnRTqqrGgNIuXOakHLaOsXCIPJmr1/p6FBKhd8n3l+f01WT2
 1HV0Smv7INHOkT+im9s7+xCOUqtbWouo15qiAaCqk5hDsRXTjLyPsqR0BGHeC48hkBEX
 cV1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUyE/c4SRhG2HDdo/orrU9xQ3AuOVqLv44+PJ6EW6vmpiBalPXrqB4DTjHxTFX41cvJJTLS3bcATKmgjkBhwUkv2aJ9s0m8FRFX5dPE6J6
X-Gm-Message-State: AOJu0YwibjwuLzmrocYNLXKQBipYNAJahpuy/JOTH2bZ1CG29Lio/mxN
 fA0qV1h4CV5wwL48mflWJvMw9Oyl0otqmezjMwEUdNbtkqXI5NGy
X-Google-Smtp-Source: AGHT+IEyol+40Ytm7NwX5jgfgRdxMGoz711CEzuTbCrMDRmaGjM6JITqTjIMUT4sVuKU/aYQV+lhGA==
X-Received: by 2002:a4a:3043:0:b0:59d:4eb1:1b7d with SMTP id
 z3-20020a4a3043000000b0059d4eb11b7dmr4373629ooz.6.1707763801581; 
 Mon, 12 Feb 2024 10:50:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCAHg8jjwVNnCn2wDfiU8wLFp8CZBjM/oUV2aG9tbS1Z6mEifTK/co8G7mdxU3NFTMxkVXlzUSDgCIg/le/ishPNtgv4QzxFsilMo0UQJvtCUbp23pd4Xzy9OlES50/DW9uJX0zL0V9gYl3338z3OdOftCK67W6XfsjBCu4XqsPNbHpvf7RS5ayEJ/ka46m0vYZRnIz9ID/osCSEb/g+0AS1Ro3Sj8DA+x73mFOgU3iAcSIkyI1Mkx/RCV1CZsO8KkVBQ8CBCQACkZokmU/v3nAcoqxzT2Se2p8l1Sjv3HVdX0OmiDNYcoBH+QJ2sdcyFaOWCoT47V/JHEfeUIitSxFEWAc4XPyExwiVMJcpZSxobhXmCUQjcbNETcAystZJuLVWUBhAeuFOt/gCx8DuWY+gXs9bSBoDpSGGYYvPT8ijidf0/IMUjkQ/IeBMiW1P0x62EY7g/r5WD+8C+AsVX2zlHBxkWYPpRrYFI51Ucdud93t3LGk0Th0nhnFus72/U/Cq0sB/n0cAexOUV1z5zDJYr/8yutqxNydGdobOpVKLI9S/sTSPqCmLjD
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:50:01 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/7] arm64: dts: rockchip: Update powkiddy rk2023 dtsi for
 RGB10MAX3
Date: Mon, 12 Feb 2024 12:49:48 -0600
Message-Id: <20240212184950.52210-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Move the vdd_cpu regulator to the device specific dts. This is in
preparation of adding the Powkiddy RGB10MAX3 device, which uses
a different vendor for the CPU regulator at a different i2c address.

Also add an alias to the bluetooth device so that we can change the
compatible string for the RGB10MAX3. This device uses the same pinouts
but a different bluetooth device.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts     | 18 ++++++++++++++++++
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts    | 18 ++++++++++++++++++
 .../dts/rockchip/rk3566-powkiddy-rk2023.dtsi   | 18 +-----------------
 3 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
index 0ac64f043b80..1f567a14ac84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
@@ -37,3 +37,21 @@ mipi_in_panel: endpoint {
 		};
 	};
 };
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
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
index ba32d0793dca..bc9933d9e262 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
@@ -36,3 +36,21 @@ mipi_in_panel: endpoint {
 		};
 	};
 };
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
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
index 0fa8f06f94cd..3ab751a01cb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
@@ -614,22 +614,6 @@ rk817_charger: charger {
 			rockchip,sleep-filter-current-microamp = <100000>;
 		};
 	};
-
-	vdd_cpu: regulator@1c {
-		compatible = "tcs,tcs4525";
-		reg = <0x1c>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <712500>;
-		regulator-max-microvolt = <1390000>;
-		regulator-name = "vdd_cpu";
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc_sys>;
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
 };
 
 &i2c5 {
@@ -805,7 +789,7 @@ &uart1 {
 	uart-has-rtscts;
 	status = "okay";
 
-	bluetooth {
+	bluetooth: bluetooth {
 		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
 		device-wake-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

