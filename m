Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3062A790D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8716E9E6;
	Thu,  5 Nov 2020 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1E46E864
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id y16so334641ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yjbdf3STEE4rNnRcEhcRQiqrSN3jG7H1bJGL9sZTG9k=;
 b=V9QwES8ET89AOiUBRT+eIvF6XzhjS+DjpLL1iRiIsSjluQePWdwKYG8fQbEgOmC8Hs
 VtAmIs/35THre4bevIa58fOFVhZrzx2Kxkk2WJEt+haAknxa56i5yQ8e4V2cN0MGR8n5
 BdX7n+7ud+UK+Jtwj2gIH5afHRoExPH/96HsQ/E6b9xXO+hBkem/lcVpg70kUMz3DOEc
 ws+Od0WSws3nRin0sWeT0g94azNFnsU8Ux9/nnK1Eito+9xUDqZOdrqq5LA9pURZsB1z
 AxYAwFA7x9eWkhgx4amRNLtXxn0k5r3j6B50KYP6MXZL0wHMaRp9FFMlshP1pEH/7XrF
 DZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yjbdf3STEE4rNnRcEhcRQiqrSN3jG7H1bJGL9sZTG9k=;
 b=YhW2ozvhVaHmOosY7A5jURDJ6QmpBwRlXoAlMEpZoZICcmYWoQtY2iaExcCohi8C8n
 GNtCL+42TO3ytnnMUyRoXFPnaf4h6lMwC1pmhWAAFQOSedqU/eXaOC/lUmL975JyexQN
 uzDVxf/eVPjD//UPIWwpLQCS8JuLDLs9xT5qNNwjVCORmyDPp75zBROYL2JjS92jQR0m
 DwXYd8VHyyiIcAa3OkNWgZNdlFoFU5acIzQclFCLjzJfVO0uXJP2kp6JU965ZFV0f0vu
 qY1ZzRgioSQrgib8U8VphWUls6VVSa88YzzbGI+uBqtflVsUwVwOCjbp4+q0mpRVLwCD
 PiPA==
X-Gm-Message-State: AOAM5310koWMtfGlrywU7j9b4yA6RLodwudmQJGxJhvBVsQCOdndBHAP
 +OmS+aJMeSx5K6W+Nw3lidg=
X-Google-Smtp-Source: ABdhPJwjhPhKFt0lNe90pTR2Xw1Lb6bFLFS58uf0LIGIGb1ElMvJNr+QWIO4rLzUWk04NzQTCXFSOQ==
X-Received: by 2002:a2e:9114:: with SMTP id m20mr125119ljg.203.1604533530966; 
 Wed, 04 Nov 2020 15:45:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:30 -0800 (PST)
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
Subject: [PATCH v1 25/30] ARM: tegra: Add OPP tables for Tegra30 peripheral
 devices
Date: Thu,  5 Nov 2020 02:44:22 +0300
Message-Id: <20201104234427.26477-26-digetx@gmail.com>
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

Add OPP tables for Tegra30 SoC devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 415 ++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  13 +
 2 files changed, 428 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index cbe84d25e726..f8c522099dfe 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -380,4 +380,419 @@ opp@900000000 {
 			opp-peak-kBps = <7200000>;
 		};
 	};
+
+	vde_dvfs_opp_table: vde-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@228000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@275000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@352000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <352000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@400000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@437000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <437000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+	};
+
+	gr2d_dvfs_opp_table: gr2d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: gr3d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@234000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+	};
+
+	host1x_dvfs_opp_table: host1x-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@152000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@188000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <188000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@222000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <222000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@242000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <242000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@254000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <254000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@267000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@300000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+		};
+	};
+
+	usbd_dvfs_opp_table: usbd-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+		};
+	};
+
+	usb2_dvfs_opp_table: usb2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+		};
+	};
+
+	usb3_dvfs_opp_table: usb3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: sdmmc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+		};
+
+		opp@208000000 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: sdmmc3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+		};
+
+		opp@208000000 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: hdmi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@148500000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <148500000>;
+		};
+	};
+
+	pwm_dvfs_opp_table: pwm-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@408000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+		};
+	};
+
+	dc0_dvfs_opp_table: dc0-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+		};
+	};
+
+	dc1_dvfs_opp_table: dc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 44a6dbba7081..c387d46f737c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,6 +123,7 @@ host1x@50000000 {
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
+		operating-points-v2 = <&host1x_dvfs_opp_table>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -180,6 +181,7 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
@@ -193,6 +195,7 @@ gr3d@54180000 {
 			resets = <&tegra_car 24>,
 				 <&tegra_car 98>;
 			reset-names = "3d", "3d2";
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_NV>,
 				 <&mc TEGRA_SWGROUP_NV2>;
@@ -207,6 +210,7 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			operating-points-v2 = <&dc0_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
@@ -237,6 +241,7 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			operating-points-v2 = <&dc1_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
@@ -268,6 +273,7 @@ hdmi@54280000 {
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
 			status = "disabled";
+			operating-points-v2 = <&hdmi_dvfs_opp_table>;
 		};
 
 		tvo@542c0000 {
@@ -466,6 +472,7 @@ vde@6001a000 {
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
 		iommus = <&mc TEGRA_SWGROUP_VDE>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
 	};
 
 	apbmisc@70000800 {
@@ -574,6 +581,7 @@ pwm: pwm@7000a000 {
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
 		status = "disabled";
+		operating-points-v2 = <&pwm_dvfs_opp_table>;
 	};
 
 	rtc@7000e000 {
@@ -906,6 +914,7 @@ mmc@78000000 {
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
+		operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
 	};
 
 	mmc@78000200 {
@@ -928,6 +937,7 @@ mmc@78000400 {
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
+		operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
 	};
 
 	mmc@78000600 {
@@ -952,6 +962,7 @@ usb@7d000000 {
 		nvidia,needs-double-reset;
 		nvidia,phy = <&phy1>;
 		status = "disabled";
+		operating-points-v2 = <&usbd_dvfs_opp_table>;
 	};
 
 	phy1: usb-phy@7d000000 {
@@ -991,6 +1002,7 @@ usb@7d004000 {
 		reset-names = "usb";
 		nvidia,phy = <&phy2>;
 		status = "disabled";
+		operating-points-v2 = <&usb2_dvfs_opp_table>;
 	};
 
 	phy2: usb-phy@7d004000 {
@@ -1029,6 +1041,7 @@ usb@7d008000 {
 		reset-names = "usb";
 		nvidia,phy = <&phy3>;
 		status = "disabled";
+		operating-points-v2 = <&usb3_dvfs_opp_table>;
 	};
 
 	phy3: usb-phy@7d008000 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
