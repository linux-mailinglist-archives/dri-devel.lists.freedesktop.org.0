Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07743A744
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BEE6E39B;
	Mon, 25 Oct 2021 22:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5621A6E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:15 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u5so15045031ljo.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geO1923AWqbQV0ZHVSFZZlCETWhtbpam6KIpanWLvLY=;
 b=DVHEJ18tuxzBcbjTR840zMvey9CCXY2CvoS4fRQuXym6mNzzDQxq1509R9XPaxgT8J
 BQd2inC3sAs5K6b94joZQVgZYL8U0LrlEIBMtYk/MFNrIPA3BY7XxczS8OYyxyJqilOD
 880F2dmg9+MDhqQK5Cz0O4pCuTMVffCCJL9GCSHDhvkXXtQd56Jv3zkx5XTZam4ncquw
 IuHAy+K82y7IQjENz75atzENY+kGokoZtJkwFnsj1qrhtdefTQ3dNnrXXfhejdN/owvU
 ou/PiwNyOvwogZKVlaoUNdinf9vV2jo+WY9bg01kti2iChZNmg6zLFDCxVLmd2WMBnVS
 LxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geO1923AWqbQV0ZHVSFZZlCETWhtbpam6KIpanWLvLY=;
 b=EfDUUa0Q9W/0OkRkv22yXsFibaamCqpOX/dJ2RivV0wvWl2Dyb9zRYl9HhotXEFWw7
 YWBunYaBblUTf86EKzwSsX6CViUS6k84F1hzftUYmQqpIsPubPv8O2xtRENn3CFjaF30
 3ndXEdPbnI5CrL+yq2LgMxNqLxn/9ibaKMVdNuVWDe+0B3QBCQ/2a0+dze5vTJ0prOK4
 l58LH9ufbpt336EwohW4bJElg6GXBsY02bvNAjMF4TWno+S7Smg1hd2sy/q7a80wjHne
 tM8JvZ9vAy030hnjQZ+GzkEPkRcRmscgqeP2GHuvcx6FpJUQ6m91IbpUrGHM6I4npCBD
 /Vcg==
X-Gm-Message-State: AOAM533ZlRNklFepdzf/ZyWRa+AXX0kmqx8jAe6NusAC8Xqhyjxo8dSR
 OxuPM2CYgu0bdspREvjCZHs=
X-Google-Smtp-Source: ABdhPJwZZ6JrYXaHlvUTnSapnMScCELz6b/X2rjYOT7ih4JhhzNhVrQbb3VcD2jBz2wtN+9v9xeRvQ==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr21766849ljr.48.1635201973727; 
 Mon, 25 Oct 2021 15:46:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:13 -0700 (PDT)
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
Subject: [PATCH v14 30/39] soc/tegra: pmc: Rename 3d power domains
Date: Tue, 26 Oct 2021 01:40:23 +0300
Message-Id: <20211025224032.21012-31-digetx@gmail.com>
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

Device-tree schema doesn't allow domain name to start with a number.
We don't use 3d domain yet in device-trees, so rename it to the name
used by Tegra TRMs: TD, TD2.

Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 575d6d5b4294..5c6d58a27c39 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2963,7 +2963,7 @@ static SIMPLE_DEV_PM_OPS(tegra_pmc_pm_ops, tegra_pmc_suspend, tegra_pmc_resume);
 
 static const char * const tegra20_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3071,7 +3071,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 
 static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu0",
-	[TEGRA_POWERGATE_3D] = "3d0",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3083,7 +3083,7 @@ static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU2] = "cpu2",
 	[TEGRA_POWERGATE_CPU3] = "cpu3",
 	[TEGRA_POWERGATE_CELP] = "celp",
-	[TEGRA_POWERGATE_3D1] = "3d1",
+	[TEGRA_POWERGATE_3D1] = "td2",
 };
 
 static const u8 tegra30_cpu_powergates[] = {
@@ -3132,7 +3132,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 
 static const char * const tegra114_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "crail",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_MPE] = "mpe",
-- 
2.33.1

