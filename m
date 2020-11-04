Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8542A7901
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875456E9D2;
	Thu,  5 Nov 2020 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7B6E852
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id s30so179268lfc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWa430PVIqmJIbeD7KBt0TZCN2r4IZvUOeKukZUULSM=;
 b=eN4h8wmKVmc98I8VpVQD05mgPsSKIV8roZRuvQUi3EOcizAEVMxhK4XcKenNODUP57
 Rxze2zWAWjLCIfL2dNIRIGywZvC28Gu+MslIDgcQBiINpAIgA8ayEvdgAWeaNJS/UoUw
 AF/ln6R+1zf+7IT8b1pPX6qDWo8FajvGF+vv4uuipo2sXIA3JUzx7p8u+ktEcwm1o1pg
 8EzDhwuYDylAakt40bWirCp8sipi2Klh9G/IBYON5H8zDXGqS29eR/JqRCTc9dW4pVKR
 y1mExIRa9//FQnuJ5e8gfTLqClqNg3UUpnvkCzqL0KLmGCs6gxB1ftFcHku0KNIwUxDo
 VvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWa430PVIqmJIbeD7KBt0TZCN2r4IZvUOeKukZUULSM=;
 b=g8jPgGGxtHzvup1LTPzGSwB+ezLIlUiWlnxVxI+K8IphpVFGYnaDiOkN6P69XUf28y
 7qNBMHXOFGpE/lk7DHnaZCt/EcXIU5yKrDqwMDxVQP7epcoqbKY6yga/3AZPUq/Ys5L3
 N2oeQKkhmYW97HbiXd/VAT27feE3VeZ4WjrLI+bZ3iw8hKlqnpsu0LHTU/vFnhCzLGqe
 GBAK9m9m8SNK948etPqSmjO2gQlRqzVouQFf/NdlNHdsommWOa9LuR0y6mjWSi8R51VZ
 b53/UOZ6IaOlwevho0r067wkr2ENYAXMoDRv4wpW/ekUBvvsmgt9/jRxGcYltT8zVA02
 IJKA==
X-Gm-Message-State: AOAM530FrftteekTC1/imXSLfuAmqURn17F1MlM3lZRdjF1BjdPEDiPh
 DUe9YwIf0rOVvpwJmc1bVrk=
X-Google-Smtp-Source: ABdhPJz6df+Ge/OfH/yyY6XjwgEffIPjNRxtB5oKKiqUFuVW6jG9sorT54nuDmLv0xSqhkTx9fOGHg==
X-Received: by 2002:a05:6512:3388:: with SMTP id
 h8mr60396lfg.318.1604533536417; 
 Wed, 04 Nov 2020 15:45:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:35 -0800 (PST)
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
Subject: [PATCH v1 29/30] ARM: tegra: cardhu-a04: Add voltage supplies to
 DVFS-capable devices
Date: Thu,  5 Nov 2020 02:44:26 +0300
Message-Id: <20201104234427.26477-30-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra30-cardhu-a04.dts | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
index c1c0ca628af1..7149e5594537 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
@@ -93,6 +93,34 @@ vdd_bl2_reg: regulator@106 {
 		gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 	};
 
+	host1x@50000000 {
+		core-supply = <&vddcore_reg>;
+
+		gr2d@54140000 {
+			core-supply = <&vddcore_reg>;
+		};
+
+		gr3d@54180000 {
+			core-supply = <&vddcore_reg>;
+		};
+
+		dc@54200000 {
+			core-supply = <&vddcore_reg>;
+		};
+
+		dc@54240000 {
+			core-supply = <&vddcore_reg>;
+		};
+	};
+
+	vde@6001a000 {
+		core-supply = <&vddcore_reg>;
+	};
+
+	pwm: pwm@7000a000 {
+		core-supply = <&vddcore_reg>;
+	};
+
 	i2c@7000d000 {
 		pmic: tps65911@2d {
 			regulators {
@@ -117,6 +145,22 @@ vddcore_reg: tps62361@60 {
 		};
 	};
 
+	memory-controller@7000f400 {
+		core-supply = <&vddcore_reg>;
+	};
+
+	mmc@78000000 {
+		core-supply = <&vddcore_reg>;
+	};
+
+	mmc@78000600 {
+		core-supply = <&vddcore_reg>;
+	};
+
+	usb@7d008000 {
+		core-supply = <&vddcore_reg>;
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vddctrl_reg>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
