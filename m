Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9D3EE2CE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7654D6E0D7;
	Tue, 17 Aug 2021 01:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1B76E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x7so30213454ljn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwsrDMqvWpJJAGAghG99RBI6rqTk8tR3VH4OuAhZgdw=;
 b=MAbX1kZyTAib0NFk5HMkji4hZI6KSYikH4MdXoQIia/ppL2rWtrvOLUevZyKTqI4R1
 9v3TOJ9TgSl6trmxqTPsVbS5XDDQ5npSYPPT2rzjMb0jWwM80c3AIgnOP1xw//VX6RS2
 QbWSBj7gHrMOJQjXGGr6Lb6FAWTvLgSZG6oknGmpPAqvvYLN7LQ5MXBgNKt0zeF6Bjbg
 WteRvBhX8kRNNkFjMB8K32oPhsTvpw7CA6LlvKbjesLvpyAmXsg9agtN0y7MsBmb7uKf
 hqKYNfnM1cik2l3YyRHRB3VgdtAUOb7qAFMcWuKEHFNS4qvzLRemTcokMm8UTk5OFNu5
 rQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwsrDMqvWpJJAGAghG99RBI6rqTk8tR3VH4OuAhZgdw=;
 b=tfsJi7JQKS8qoYWCiqky322FbAehyYyYD28+ah4SQIZx98bJ3D/x2/L1ezIO055/bK
 qBtg2tAlw474zDGY6xgr4Php1jKTvZG13p3smyaecNC3766tyKntz6aR0k2mc1ilw9iS
 d1SXwnLmrQMCKKj47bNkcaPSIUuEUdsGagd3RZh0Ir0TaFqIXZP3QzNt5y/t2hH9GbXl
 qLvE1JNWR6XQIm4v4tfeVoV5bQk8snziAGnlwsfJ2C/CmtSWeM+UsnG0EE5E+FyFba/I
 4uP/b2J4mGU9myy22yRN3VoNwFtfMcS0N2j7GflGoBBkgYxNpdp9fF7CIHfSFj2VeqWC
 dl3w==
X-Gm-Message-State: AOAM530Nv/Zqg+NW5cLjO5VA1AhZiAnPdykb7OjTuBgq2CHbdEc+7KbI
 Xs1bKCW0NVleK3Rw8ap4dkk=
X-Google-Smtp-Source: ABdhPJymhUa7ob+dx2CKSb3iD3hMvuzIQhMVT38tcQMt4odNZTaqU3FDkCiOBT/eALQn/tQWfxCv8Q==
X-Received: by 2002:a05:651c:1303:: with SMTP id
 u3mr894767lja.358.1629163839538; 
 Mon, 16 Aug 2021 18:30:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:39 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 32/34] ARM: tegra: Add Memory Client resets to Tegra20 GR2D,
 GR3D and Host1x
Date: Tue, 17 Aug 2021 04:27:52 +0300
Message-Id: <20210817012754.8710-33-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

Memory access must be blocked before hardware reset is asserted and before
power is gated, otherwise a serious hardware fault is inevitable. Add
reset for memory clients to the GR2D, GR3D and Host1x nodes.

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 5c74cc76b5e3..2cb31bdd9eea 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -40,8 +40,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA20_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_core>;
 
@@ -98,8 +98,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA20_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_core>;
 		};
@@ -108,8 +108,8 @@ gr3d@54180000 {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
+			resets = <&tegra_car 24>, <&mc TEGRA20_MC_RESET_3D>;
+			reset-names = "3d", "mc";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d>;
 		};
-- 
2.32.0

