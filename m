Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36973B46F19
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836CB10E0FE;
	Sat,  6 Sep 2025 13:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dTV/HqFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CE010E0FE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-336dc57f3f2so29292351fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166844; x=1757771644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
 b=dTV/HqFEnUALwNrA6cv6IRpU9mDscqRDGpFQHhekeK7cNz9mV5eAA3Rv4WfJTdvqyk
 E3JF9GiNrPrwBEm8yv4nwY03SImhoaXIPQxsQsubAbwM4nYh7DhrbjA3F3Z5Yubg1U5d
 3qS42BKFXDtj3g9sG5ZArNP5HFYUPig5cEPsqIpWcJPFdz/y/zC22MMV+eeC3ddJUs4u
 2HT8cAgPrLPj2578N97tPWZnT6t6Xe9R6eLYBT7fDQuop3RkabhdpLHC9uja9yj3kFMH
 sdlwCAg1rscU8fWII2cekoTez5KSHKn0zZsIFhVwbqlv1IU1PAxPNadA5VghgSr/gJyT
 ZgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166844; x=1757771644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
 b=OPnRKl9f/vXEAwjPDLKDAqz1055ln6CM0WTIP/5h6MygWTP5ZNvzhDOzNtubWYQ7x6
 n6dkoTCCWo9tlCzU7g+HNk/EiBHe46R9E2bw24AmO9ZkFDmJaVmeq/xcWiNtzOKsyM/R
 MuTbwp2x+trZ2L5tvUwgumazSKruzdCv5t7Ydq/N8Qor+jqKuRfXUqSfYY+Qy/k4H0f4
 FpbYBP4Yitu2B7ZUuQxXPhqM1eR1muFmBtmo08H2nKsGi1ddZ6zXVemb7MA54IvmaqKd
 0w16mm/mkY8f8F/GfzZmBJajY8HgBI7QDZOozqTH2CtPdDpgR1it3IPNPC74HjSCiVSW
 pTnA==
X-Gm-Message-State: AOJu0YxuzwEGy3LsWNS2EiXnxOKqc17u6OEPnmnpEAAZyVjSQLleEKE9
 5YBGvQoOel6Yp2Y0JD4fqKVuRqdU/qhd/Llk8bPnlvpPrAyyY4E9ZaK0
X-Gm-Gg: ASbGncuft/TjFMJNUzmpkq/9zg9zAHsAIsHLu1hHAEmaSQ26gIC6Uutctk3mznDDGya
 47i4wVTrxgaHNj0iUrL9NPutmSskx7IWZ04r37fKEbZX/B1bwxojeqeGgibZYUrGc4OndP5aWKD
 woCQYtgVsNZ6WPNZ02kr/cLUckT5y1xlPdsaaORYTzZdHfvmNAXZClkJO68+0m3m3k110Wx0AZN
 6AZPvjTX/WektyeeaqYgAvdOpq5DbXN7Qp6UGG9tdGjLkF420andyRKeiBvd5MLMv3IDFbW1TdW
 vHYE9jORZ75mvnJNYzfMl2Mq3UmgFILTqQW9oqeM1C4IZY4Xy3VNfCW+niTVozmGiox2KRqc1Bb
 ZHR/PvQUdPikjrg==
X-Google-Smtp-Source: AGHT+IFbSjW+2df8ovhvrvEYVHwTDb6GcdY+zCQF41mbNwIX4MyigO2GWVmHYoRhEYpkxCfyDxwxvw==
X-Received: by 2002:ac2:51ce:0:b0:55f:48db:813a with SMTP id
 2adb3069b0e04-56263ba3098mr617510e87.54.1757166843736; 
 Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 01/23] clk: tegra: set CSUS as vi_sensors gate for Tegra20,
 Tegra30 and Tegra114
Date: Sat,  6 Sep 2025 16:53:22 +0300
Message-ID: <20250906135345.241229-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

CSUS clock which is camera MCLK, is also a clock gate for vi_sensor so
lets model it by creating CSUS grate with vi_sensor as a parent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  | 7 ++++++-
 drivers/clk/tegra/clk-tegra30.c  | 7 ++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

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
index 2c58ce25af75..bf9a9f8ddf62 100644
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
@@ -807,6 +806,12 @@ static void __init tegra20_periph_clk_init(void)
 	clk_register_clkdev(clk, NULL, "dsi");
 	clks[TEGRA20_CLK_DSI] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA20_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_CSUS] = clk;
+
 	/* pex */
 	clk = tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, 70,
 				    periph_clk_enb_refcnt);
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

