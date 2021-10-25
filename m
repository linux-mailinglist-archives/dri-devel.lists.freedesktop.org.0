Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E803843A76C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E2E6E32F;
	Mon, 25 Oct 2021 22:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CD66E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x192so14443438lff.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jxEVcQtZ3tt3q/wwMe8WgzAKwAHr0b1+CvBDSsdZHw=;
 b=nKilEZyg92NbWrWgqmsDfFJ32XScS5VMh+ZEIYORsMz2y67e27hricxwxxSqLCzB+B
 r9cB2aqSw67ZAZ/N2E9oWPvLjsCYJSlHzzC6X5qt4sxs6KAPyF3O3X5RjAHYuDG/2WYX
 jjokeDi1qh8BhtZkLTdnT2ceJoenhzogfYQnYGLnQPA3w+LnjmNwkbIV+FG2fRA3dSjI
 QYUXC98osVUf5R/5ZYDxJUT4Duocy7tEoCLI7Dm+vgCAPU9MLK0AeGtxa3H2KJQfuWej
 11v6qT6X3LCYhUwH/hJmTvhO64nnuSfATa3vnIu8GTaywxpPHlwTlviTYx6rR/1oTZdJ
 tkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jxEVcQtZ3tt3q/wwMe8WgzAKwAHr0b1+CvBDSsdZHw=;
 b=q0H/RZPmNsjcOi/Kn+2T0jgE1bVOn82y8G/GGJooCco2xH1AjUlY7sfGqNkGKZtmeX
 HlOfuiiXmUzVte0YT+jrmibYATu4hTjNyCFdNFPkSFT0RGJ2dwVUTgavSAzvE1B/Rq9K
 ugbzJMwh6grGGUU22ES/knrUlG7kGTpBqgY6q48/G/OdQc4XZewf9qbKOB3YeB98204W
 Lk5g5zkkFl0KG3995kMjZBDzK9UUBRcEcOk6Bna/cCcnn7JWoLTP8mc28+BbPmMKXY+F
 x0rTiQdwz/Ja/Gdy5QJCThj2uUlko3CAg+yZSsCAIcRtYsLt6HPxXgBPb7unVbXd4br4
 x7zA==
X-Gm-Message-State: AOAM530pifHQ8RtXlsPvHhoHRGCySra7e9cnVG/KC3pWPKwMqPuSWvxz
 xXhRhJEy0qjJwDglgZsKqj0=
X-Google-Smtp-Source: ABdhPJwIqWTCtIZUvwhjyjmr1zhRYr9aIO/xrwQvYeOizbd1AGCTNEfr2W2E9bY8RgQyE113Q4PpwQ==
X-Received: by 2002:a05:6512:32c9:: with SMTP id
 f9mr19217607lfg.113.1635201981193; 
 Mon, 25 Oct 2021 15:46:21 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 38/39] ARM: tegra: Add Memory Client resets to Tegra30
 GR2D, GR3D and Host1x
Date: Tue, 26 Oct 2021 01:40:31 +0300
Message-Id: <20211025224032.21012-39-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index e40d5563778b..c1be136aac7d 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,8 +123,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA30_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
 		power-domains = <&pd_heg>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
@@ -190,8 +190,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA30_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			power-domains = <&pd_heg>;
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 
@@ -205,8 +205,10 @@ gr3d@54180000 {
 				 <&tegra_car TEGRA30_CLK_GR3D2>;
 			clock-names = "3d", "3d2";
 			resets = <&tegra_car 24>,
-				 <&tegra_car 98>;
-			reset-names = "3d", "3d2";
+				 <&tegra_car 98>,
+				 <&mc TEGRA30_MC_RESET_3D>,
+				 <&mc TEGRA30_MC_RESET_3D2>;
+			reset-names = "3d", "3d2", "mc", "mc2";
 			power-domains = <&pd_3d0>, <&pd_3d1>;
 			power-domain-names = "3d0", "3d1";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
-- 
2.33.1

