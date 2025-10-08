Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E9BC3902
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0884010E0BC;
	Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIhgf9kO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346310E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso8727334e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908677; x=1760513477; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQLFTxrIKtieldvIvL7WZTPqw42YlDTw8nNSn3fA0Wk=;
 b=UIhgf9kO+W60MMXqCXuH3WbZxJRZqf7Zc89zG1UTeCEyFcm/enxPT9lKSKlv0lvuBG
 kiw3Af3MVqjbEuXrkuBCpJGmbuVOch90uzmMYpSjuucr/tLmBJ7LUksLl/1ZCqqHDQg4
 kIHbrdsQYQmD7+soYshVYFVK3vLa9MTivFLy9uWMv6UUwI2rQx2WG40xiHjeK4Afm60h
 l0s3QSFcbOsm0F6iOlTKlcuqWDr+xXKls2LY0KyPd02ySwImxm/lO2m6hMxjPa1db7HR
 O9xMHhkTjBKdTV4W94uPbX3Rry4umV/Br8Ujap3Svn5sa+swFc0XNTPqjTGwymkIprom
 99Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908677; x=1760513477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQLFTxrIKtieldvIvL7WZTPqw42YlDTw8nNSn3fA0Wk=;
 b=EL0h0MY2wVRyyJpUNvmQgQ+CZ1F7e9rMN9VV4uPnyfD+Fpdcaw05Dx+SeSPUtuMSYG
 mzT+F7RSgA1Y9NnlhDADyDwhLGnDmDdzF8UAo0PP4wIBit4Jw2xy+EZ+Gf/UHV0O5+Ce
 XdA4zwCmXookzV8sK+u1hzgANbqcOQODonYAZAoOCW39mM6tYZ+pPq/fUolygKD4gAPc
 UMBTT2WvGQTDNNk4/HaY6/lT8nPLLrJYwpp9gfgdrY05ZsSt68+3/NMz5v11zrpNpb+P
 IGAgCiFlLKG1vc2kPkGhbnHdFrYyPh+nBm3lH3B211ZLWr2XSJMh291XRXM/B/WqeurV
 FuPQ==
X-Gm-Message-State: AOJu0YxzpnAjOC5ckVE8uDO6EnHTWYcE3vdxILdAo0cYGJI90j83iWVE
 ycdsX78iXa3zw3jdRXKWp5sbVLEFq+WkK3nXY/Nuamzv3U4nK5fp3R2C
X-Gm-Gg: ASbGncuGT6S/xk1JfX6gvicMt+Lma4vz2osQ/d6B7h2sVNx/Q9MvZJGUbveyDMa2es5
 ItKz7hTm/x1Sxm2sDTBEYeP2AQq07RoL4Yg0G2zY6h8IGKBT8E8fA1RPOKJHkJeMC5oFttTJCKb
 U41GsA5jlBf8Z7SDD8aNeVnxiT9o0hgyy7Hv+Gk/EKPIwOeK2ytfAAkP7V90KSESL8fTM9ycQZU
 pusE4LyxftBHweswt5PkHpyiJfeZ82brcsgKWo3hFm9OS8LUecFVbysKkVV+FicmL/LlJ8Vrh1D
 U2WxK2hJW6K5mOHoKPXBWk/O5HkKd351rx63evg8da2V+DU/Xg7OSKhrhWee2GVn11DY0IHQORM
 usBLvmzlPeFFoi+mdTmmx07jV0jJr6eie/TXztQ==
X-Google-Smtp-Source: AGHT+IFpUSCjmqWlypk1jhB6DNeYarmmHYoM2rml86MGPw0PJqxvr54S+GMFfAgFpZaGYlwixjWo/A==
X-Received: by 2002:a05:6512:3045:b0:577:6e42:3718 with SMTP id
 2adb3069b0e04-5906db0365bmr662412e87.7.1759908676756; 
 Wed, 08 Oct 2025 00:31:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 02/24] clk: tegra: set CSUS as vi_sensor's gate for Tegra20,
 Tegra30 and Tegra114
Date: Wed,  8 Oct 2025 10:30:24 +0300
Message-ID: <20251008073046.23231-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

The CSUS clock is a clock gate for the output clock signal primarily
sourced from the VI_SENSOR clock. This clock signal is used as an input
MCLK clock for cameras.

Unlike later Tegra SoCs, the Tegra 20 can change its CSUS parent, which is
why csus_mux is added in a similar way to how CDEV1 and CDEV2 are handled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c |  7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  | 20 +++++++++++++-------
 drivers/clk/tegra/clk-tegra30.c  |  7 ++++++-
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 186b0b81c1ec..00282b0d3763 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_tsec] = { .dt_id = TEGRA114_CLK_TSEC, .present = true },
 	[tegra_clk_xusb_host] = { .dt_id = TEGRA114_CLK_XUSB_HOST, .present = true },
 	[tegra_clk_msenc] = { .dt_id = TEGRA114_CLK_MSENC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA114_CLK_CSUS, .present = true },
 	[tegra_clk_mselect] = { .dt_id = TEGRA114_CLK_MSELECT, .present = true },
 	[tegra_clk_tsensor] = { .dt_id = TEGRA114_CLK_TSENSOR, .present = true },
 	[tegra_clk_i2s3] = { .dt_id = TEGRA114_CLK_I2S3, .present = true },
@@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA114_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA114_CLK_CSUS] = clk;
+
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..d8d5afeb6f9b 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA20_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA20_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA20_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA20_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA20_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA20_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA20_CLK_BSEV, .present = true },
@@ -834,6 +833,12 @@ static void __init tegra20_periph_clk_init(void)
 				    clk_base, 0, 93, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_CDEV2] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "csus_mux", 0,
+					     clk_base, 0, TEGRA20_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_CSUS] = clk;
+
 	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
 		data = &tegra_periph_clk_list[i];
 		clk = tegra_clk_register_periph_data(clk_base, data);
@@ -1093,14 +1098,15 @@ static struct clk *tegra20_clk_src_onecell_get(struct of_phandle_args *clkspec,
 	hw = __clk_get_hw(clk);
 
 	/*
-	 * Tegra20 CDEV1 and CDEV2 clocks are a bit special case, their parent
-	 * clock is created by the pinctrl driver. It is possible for clk user
-	 * to request these clocks before pinctrl driver got probed and hence
-	 * user will get an orphaned clock. That might be undesirable because
-	 * user may expect parent clock to be enabled by the child.
+	 * Tegra20 CDEV1, CDEV2 and CSUS clocks are a bit special case, their
+	 * parent clock is created by the pinctrl driver. It is possible for
+	 * clk user to request these clocks before pinctrl driver got probed
+	 * and hence user will get an orphaned clock. That might be undesirable
+	 * because user may expect parent clock to be enabled by the child.
 	 */
 	if (clkspec->args[0] == TEGRA20_CLK_CDEV1 ||
-	    clkspec->args[0] == TEGRA20_CLK_CDEV2) {
+	    clkspec->args[0] == TEGRA20_CLK_CDEV2 ||
+	    clkspec->args[0] == TEGRA20_CLK_CSUS) {
 		parent_hw = clk_hw_get_parent(hw);
 		if (!parent_hw)
 			return ERR_PTR(-EPROBE_DEFER);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..ca367184e185 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA30_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA30_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA30_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA30_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA30_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA30_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA30_CLK_BSEV, .present = true },
@@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA30_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_CSUS] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1

