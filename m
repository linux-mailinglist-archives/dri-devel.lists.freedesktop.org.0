Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4E5AEED8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4EA10E6DC;
	Tue,  6 Sep 2022 15:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF510E6D1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:30:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e20so15986486wri.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=i5Fx7IVYwPyLivAgaYsyID9MSMUQe3FGyD8Gwua8VA4=;
 b=Dpd6+bbXENGWjlJ+Rk/N6aSO+77Eta7XIFQFlzwexijOux30B7jCSrI3nK4/pMPvrV
 Z3sLxXUbxuzzGFctCsnnkCjsxltRgjMWUy1Mir8HzQhj/kvEXVzpmgLE5dSFST43ApMr
 htPvRgyEVPmVlgDRW9Q1XwvBCevfw9Zr9IW0SqqYk9u00XIkCv5BDs5Wz3mAdV8A12FC
 ER7PvRT56Memx7kVLS3YR9Z7r+b3QUd419WJ5H1PWQHCkjVQ0rtyrqhJ71GfdnfiEMBX
 hXIbNw2SOTjd7XkpPeNfhaFpKailuPfMKx0vCX8FxTygbgsbhZuGhOitkBFO8QOlMvb9
 NeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i5Fx7IVYwPyLivAgaYsyID9MSMUQe3FGyD8Gwua8VA4=;
 b=4g2T8MbpDuD56uG4B4up8xSJu8vIVsS1jtlKyaX+pyes1194knz1apWbQtMObyg3B9
 t/Al9CmXirI5PZpnyR3UrgJ+PxjgnMuRug2lABmBpCY2QERsjpUyeYwp15i1Bj8uasOm
 W+RWUaBi1bgoRoKp+g9FLCiBpz57YNVG0dSvkyUh6A5wFXIRbvBozEIiPY0zayWf2rho
 BeOCGFRHRbuLohuXOZrCgwmKOdYtHQ86vYTfHp3JYvrWY7opMTTPCVFYcJup8EpWKjvf
 Tf4wRb9gIb7WM7Kq9dcSKeuMLgQMPaRcwmKDZ3Od8kgLFCuKDouxDbeS+GpZqC8Rps3g
 vpNg==
X-Gm-Message-State: ACgBeo0I0NS8qNjg7WtvptEA7eXrTL5azzh732+c06urHY1nv4RjHgsq
 OTwIXvckNwxoV1YSOh7KlTA=
X-Google-Smtp-Source: AA6agR7Gk+SyBM5KEpmW40JfCj1eCWgs4ex/z4EHEwPDBeTPMJA2kA8/BBoluAnx+PZIBZFMAlxOsw==
X-Received: by 2002:a05:6000:1566:b0:228:b754:186e with SMTP id
 6-20020a056000156600b00228b754186emr4831466wrz.226.1662478240266; 
 Tue, 06 Sep 2022 08:30:40 -0700 (PDT)
Received: from Clement-Blade14.outsight.local
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:30:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 2/5] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Tue,  6 Sep 2022 17:30:31 +0200
Message-Id: <20220906153034.153321-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple cooling map for the GPU.

This cooling map come from the vendor kernel 4.9 with a
2°C hysteresis added.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 51 +++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 5a28303d3d4c..53f6660656ac 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -186,6 +186,7 @@ gpu: gpu@1800000 {
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1072,9 +1073,55 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+			polling-delay-passive = <1000>;
+			polling-delay = <2000>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu_alert0: gpu-alert-0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert1: gpu-alert-1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert2: gpu-alert-2 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				// Forbid the GPU to go over 756MHz
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu 1 THERMAL_NO_LIMIT>;
+				};
+
+				// Forbid the GPU to go over 624MHz
+				map1 {
+					trip = <&gpu_alert1>;
+					cooling-device = <&gpu 2 THERMAL_NO_LIMIT>;
+				};
+
+				// Forbid the GPU to go over 576MHz
+				map2 {
+					trip = <&gpu_alert2>;
+					cooling-device = <&gpu 3 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1

