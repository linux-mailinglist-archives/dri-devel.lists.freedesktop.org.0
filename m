Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1AE4642BD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2EC6E828;
	Tue, 30 Nov 2021 23:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB406E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f18so57926051lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BgSCMMMjImw4OC6XX4I1D4jJZR1bPLAq5CznL/tG6k=;
 b=oZMjcopCsYiqbZp4/XOOVzs3uI0UgVvg1HxSmygyjHnuAmVEzFCZHE3NnyvR3kzK+l
 XGpmZXTMlKjr4CFlK8Dssww/+5skXIBeF9P1HlC7mZY653Y50isOLEjJPm3CtvsFuemL
 BUizIFplEUvls19ORkvmhksN6JY5Qr1+SJw2Ex/JjOgZfZlUOPkrdDzGQ8AU4auEFrL1
 ayyWKqvE7tBRUXkYQkDkT38M2mflsCSi/Ty8qNvUepitGBCFmwf8g1jw9FHMIGGoI1ll
 3OZGZlvlssaAxIaXWwpBtPVTDeQYx8vMdNOEnreSHehARb1XcJ/ZVcSBkBrRPphKelCq
 ltmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BgSCMMMjImw4OC6XX4I1D4jJZR1bPLAq5CznL/tG6k=;
 b=ptU+efELxVPk5QJxHF1+zZ7ZIBP/KHT9rTUd5zCDrGi2LuNOndJkcVvgU6I1uSC//z
 iJqLj7GGEh+xcM874YJeA9vQkvzK6rcJ2Rry6sMDer+ZJ9cIjgeYQhQQ3WvpAABYNiTA
 a+lhq+/keme/dbwndNDelx6igNWVXrot6eO+YMn32AOzXDtJtd68+sKJ6XOmGWs7saIe
 oqreF9CDlh83+59YRYjdpYuExUCr4sEUgiOnL32wTXURuQa/6g/DVjF7x9qmse/PKevA
 qqBM5br8egXYqIx9SbGYf2TtrqKgd4DxhO2zDUHqOXeH3jXlDXrrZAKBhUKdxHED2xku
 2wIg==
X-Gm-Message-State: AOAM530WsaHn/uFb0NDCeHy27QJz7QTwuExLyWF4h3KBog6gXlj3Uf1b
 X3TkVhdS/jAMIuljFAbYpVo=
X-Google-Smtp-Source: ABdhPJyvoCavnDOlzlzD+43SO0WW3kZbv7iDlx4saMAl9TdN0YElvSyajZbUXOg8f8WQDZAJhkFjTQ==
X-Received: by 2002:a05:6512:1148:: with SMTP id
 m8mr2122108lfg.456.1638314665009; 
 Tue, 30 Nov 2021 15:24:25 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:24 -0800 (PST)
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
Subject: [PATCH v16 31/40] soc/tegra: pmc: Rename 3d power domains
Date: Wed,  1 Dec 2021 02:23:38 +0300
Message-Id: <20211130232347.950-32-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device-tree schema doesn't allow domain name to start with a number.
We don't use 3d domain yet in device-trees, so rename it to the name
used by Tegra TRMs: TD, TD2.

Reported-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1a55b8319d63..e1fae1a5e36a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2992,7 +2992,7 @@ static SIMPLE_DEV_PM_OPS(tegra_pmc_pm_ops, tegra_pmc_suspend, tegra_pmc_resume);
 
 static const char * const tegra20_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3100,7 +3100,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 
 static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu0",
-	[TEGRA_POWERGATE_3D] = "3d0",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3112,7 +3112,7 @@ static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU2] = "cpu2",
 	[TEGRA_POWERGATE_CPU3] = "cpu3",
 	[TEGRA_POWERGATE_CELP] = "celp",
-	[TEGRA_POWERGATE_3D1] = "3d1",
+	[TEGRA_POWERGATE_3D1] = "td2",
 };
 
 static const u8 tegra30_cpu_powergates[] = {
@@ -3161,7 +3161,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 
 static const char * const tegra114_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "crail",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_MPE] = "mpe",
-- 
2.33.1

