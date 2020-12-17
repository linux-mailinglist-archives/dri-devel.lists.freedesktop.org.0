Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A952DDFDE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B97889D44;
	Fri, 18 Dec 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104186E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id l11so59864429lfg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BCi2FA9cuc84aB3j2Dtgj2hYIKTYzldBGMNPDQ+ziE=;
 b=r2zTV0LhxvbLLcRE/Q6upA3jHFFoIHhmeTHZH8k7Nfo6TEPtghv24CkOqquv0+y9xP
 6+FZ+MXgdTx2ytHtR7Sk7W1UA2CPz43wyzcL6eN3hopQk/E3YteFKOLhzUro4h8CbQNU
 +fgzGRIhTqgs+WbaL3TqMhWkuNzse6BJ4C/8X7Ixe3FMp1bc0jGwx6igCKOSE5vPOnJl
 gKxDySx0IGEHosYP6Q0PXPEXhoddkGXNRY8r2Ow5AL11IX4RdEBmmxMv3sTV6ncFWhYG
 PEoo8YrrVqcuWZEFkH1nd5jPACS2AUeM4P0FHx1ROikt0gKyKm/OLrSZrtjiGzDY2xKO
 o/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BCi2FA9cuc84aB3j2Dtgj2hYIKTYzldBGMNPDQ+ziE=;
 b=uREWqtMBiDe07oyArglVIwyu/exBJLRtASPzawQeNOac1eij43vfYutDgvI2gP2S7f
 p1GRCtTZE2QZqMq0zyDQOwpOVuYMTuN7DEev7+PHYasQTSWBp8N5ri3/+ksmp10wGT5C
 a3WKz5BkzCyQwLNfbaNIDlMSc/4t2LucU4/fvPCDEqbdWIJzHz3MluS9twrsjn8ydpWd
 Jph/tfSxQFsb5AoNz4Saa5+z0zEDFwAE8WT2u7edWXAR44x39tGgGgVecKj3pTjb1a+E
 +m/XcaMSusVvdn+rnRznM3mrS3EDyxct0Xctvv8kDpNvV6Yp7mlIqcZpGJUQsWyeVzMk
 6nVw==
X-Gm-Message-State: AOAM5321JEir7FrMz+HJl+FJwp66n5vAXrNYRXNQMNwQIThqkLSNV3Nv
 LkFXx2eID2nbt4LfPtXDUnc=
X-Google-Smtp-Source: ABdhPJxWWr3saixXg4MMgzNRzLC4JnQkjYvJetomHe6o2KMKNy5SgOY8ZxCeWHixZTKkqqyu60wiaQ==
X-Received: by 2002:a05:651c:2dc:: with SMTP id
 f28mr208929ljo.13.1608228494555; 
 Thu, 17 Dec 2020 10:08:14 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:14 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling and
 thermal throttling
Date: Thu, 17 Dec 2020 21:06:37 +0300
Message-Id: <20201217180638.22748-48-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable CPU voltage scaling and thermal throttling on Tegra20 Ventana board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-ventana.dts | 40 ++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 14ace2ef749c..c2d9f38960bc 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -2,8 +2,10 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "tegra20.dtsi"
 #include "tegra20-cpu-opp.dtsi"
+#include "tegra20-cpu-opp-microvolt.dtsi"
 
 / {
 	model = "NVIDIA Tegra20 Ventana evaluation board";
@@ -527,9 +529,10 @@ ldo_rtc {
 			};
 		};
 
-		temperature-sensor@4c {
+		nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
+			#thermal-sensor-cells = <1>;
 		};
 	};
 
@@ -615,10 +618,13 @@ clk32k_in: clock@0 {
 
 	cpus {
 		cpu0: cpu@0 {
+			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu@1 {
+			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 	};
@@ -717,4 +723,36 @@ sound {
 			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* start throttling at 50C */
+					temperature = <50000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: cpu-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
