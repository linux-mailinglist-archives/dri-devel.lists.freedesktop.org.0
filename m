Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E72A78C6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FB66E1E0;
	Thu,  5 Nov 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE5B6E869
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s30so179318lfc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3MVi35NrfPSfRw//362HseqQCwlWGtdqp60bFnUhwA=;
 b=OMn9xsQeCPu/4JinLc/AgoFUYFf1NUAoZIU2Zlu6R9dPQunR73wlhPP73mbb5TTpva
 8JiMy8NqbA0ZUwEVbGtyIWXt0/tfNkV48rTG7UCuIXLFva4JtNhIA8GqUErMg0IIfKUE
 OGNdyB9H+gojt3sZ7bQ7bIApJMJ4in5sly2bBNeehvG48k/7mXjUtjndqT8kWTqY/A8g
 qT2PIZ20opUDRyncNfJ/LO9879zyPy4vHJoeMho7u+q9lf9+ZJxM1tYmJF+TFnEibpMR
 nv5gAps0odmdCDhcgB3tni2hr1hAyEgQ9NPd3AF9mNe+BxeSr5+mlHHTfY0Od+dUrfDJ
 v6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3MVi35NrfPSfRw//362HseqQCwlWGtdqp60bFnUhwA=;
 b=tNa3avU9oAMr+V0ZgzcH8IAr1BFLWms7evVQCACr2I6sDios1DFGoOEGRbs3/gA1pQ
 36iVOxrzfBxldLwnwTChEuHTaqu/2KYyEdbsf3p0yRph6d6+bVvQNnOwg8QisALBV6xh
 b9FAuA29/RhSOQVpmC7D2+FnecaN/DdzKc2A8a3KchTHfxfJLftrAmR8aE/pycknJxyw
 M6CMhf+0fD4ndeKplOEqgOC+YJmwdhFAyIlzG0C2u/ulm96vP5cu8vwNNO32aVX8Wx7+
 xMPD4C3UEpLhwpCQ3Esrckx/8KPg3a/tKGIUfsfF7LJqRBSRbCTIIOH7qEgyF+DK1AmY
 6ENQ==
X-Gm-Message-State: AOAM531dHLYEigmvHXo+DjIMtOnqc4Aw00gcBQSPWdNqUKbZVRQU/t+v
 sP9w7d5usSpelx7CgP7mMHU=
X-Google-Smtp-Source: ABdhPJwyQ9D+w6Gwu+oNG3O4q0AAu7yTKLISIo+dIOXhdhlh+KdufIVDxOlsB9IAA16GjdDdX/+EHA==
X-Received: by 2002:ac2:53a5:: with SMTP id j5mr41614lfh.253.1604533537747;
 Wed, 04 Nov 2020 15:45:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:37 -0800 (PST)
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
Subject: [PATCH v1 30/30] ARM: tegra: nexus7: Add voltage supplies to
 DVFS-capable devices
Date: Thu,  5 Nov 2020 02:44:27 +0300
Message-Id: <20201104234427.26477-31-digetx@gmail.com>
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
system-wide voltage scaling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 261e266c61d8..2b405872ad2d 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -60,7 +60,19 @@ trustzone@bfe00000 {
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
 
@@ -72,6 +84,10 @@ lcd_output: endpoint {
 				};
 			};
 		};
+
+		dc@54240000 {
+			core-supply = <&vdd_core>;
+		};
 	};
 
 	gpio@6000d000 {
@@ -90,6 +106,10 @@ init-low-power-mode {
 		};
 	};
 
+	vde@6001a000 {
+		core-supply = <&vdd_core>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -835,6 +855,7 @@ bluetooth {
 
 	pwm: pwm@7000a000 {
 		status = "okay";
+		core-supply = <&vdd_core>;
 	};
 
 	i2c@7000c400 {
@@ -994,6 +1015,7 @@ sdmmc3: mmc@78000400 {
 
 		mmc-pwrseq = <&brcm_wifi_pwrseq>;
 		vmmc-supply = <&vdd_3v3_sys>;
+		core-supply = <&vdd_core>;
 		vqmmc-supply = <&vdd_1v8>;
 
 		/* Azurewave AW-NH665 BCM4330 */
@@ -1018,6 +1040,7 @@ usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
 		dr_mode = "peripheral";
+		core-supply = <&vdd_core>;
 	};
 
 	usb-phy@7d000000 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
