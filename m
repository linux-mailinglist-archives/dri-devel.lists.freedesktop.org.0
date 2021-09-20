Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BE41224F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46426E811;
	Mon, 20 Sep 2021 18:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2B6E7F1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:37 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z24so45177338lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3cNnrDCgyIBL/irFJrBQOLNlmfmIoiosnZsoOoMlXuE=;
 b=Yw1w3MbC5k7IwOn9x5OTHcYwRtwR40Vn1tYr+38jcmf/34n9b3/5Yu8db7KTf8KfJn
 6plmmWGXUWByLqSrt1gOqTq7SLIKjyeysN8Iu+x4I6amZoLrBjnHVzVs4PsVbPfHpfNn
 AAwq8IylOkPVDvkSSi2xqOvwyj5ItVlmIGzrnBITswcKw5+yHyxp1rZW3MLyHmDglXaA
 sdtQetdm+kodIkce+g94RsuF08NMxDVwhzgeKTWk/FTCVfXILiCZdO08lPJkRPJ10+Ya
 gc2sV/Cr6NAHGRP8ICaP1v5MLpsnak4WMvX1hLawyL2Qc4oiLMTiwdXhXBKjfzEMmEcm
 6U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3cNnrDCgyIBL/irFJrBQOLNlmfmIoiosnZsoOoMlXuE=;
 b=bCNvwI6qdupest6rcIfVtNN23F8YpDiB65Hat7UuvFJDKEfz/kkhs6dh8kk0v9ZiaS
 CiPD2+WvR6IbZ5wlN+wZHvvrddgxZzuaauaQlt7kRoS+k1+3Gzh34dGQVJ1HZDQ+1PKg
 OjAPCsTNsbsLji2nr8x2PuSSZnSId3/d+S6mjodW1cW6ZQFPCMv8tWsSrMp5dzI0kpPG
 +sFog6ee0ACZi75vqiuxirt0QQnYWMfeEWZ/VWz6UcxqAzvtdfqPzenSWz66A4e4EUTo
 n4/+AwNp07gAm9uhVgLaFDOoS2uKKGEzDrQeRxemvsgttNDiUd98DRd25khgwXWxhphk
 xy4Q==
X-Gm-Message-State: AOAM530InELaetdH/C66ri2hicsUpIel7ysTzYO3Dq2dIDFVe9NS/PiA
 NqBVA49CTg2tNNaAG7CuZNs=
X-Google-Smtp-Source: ABdhPJylByjO84Stsx9/ViAqL+H/onA2LwTouIfPv9E7JOFSK+y2mzq6tqkieMfV3MTDPRXOzy/rkg==
X-Received: by 2002:a05:6512:3995:: with SMTP id
 j21mr711969lfu.452.1632161555252; 
 Mon, 20 Sep 2021 11:12:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:35 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v12 28/35] soc/tegra: pmc: Rename 3d power domains
Date: Mon, 20 Sep 2021 21:11:38 +0300
Message-Id: <20210920181145.19543-29-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920181145.19543-1-digetx@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
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
index fb8faf7b226a..6759f19b9cd6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2964,7 +2964,7 @@ static SIMPLE_DEV_PM_OPS(tegra_pmc_pm_ops, tegra_pmc_suspend, tegra_pmc_resume);
 
 static const char * const tegra20_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3072,7 +3072,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 
 static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "cpu0",
-	[TEGRA_POWERGATE_3D] = "3d0",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_PCIE] = "pcie",
@@ -3084,7 +3084,7 @@ static const char * const tegra30_powergates[] = {
 	[TEGRA_POWERGATE_CPU2] = "cpu2",
 	[TEGRA_POWERGATE_CPU3] = "cpu3",
 	[TEGRA_POWERGATE_CELP] = "celp",
-	[TEGRA_POWERGATE_3D1] = "3d1",
+	[TEGRA_POWERGATE_3D1] = "td2",
 };
 
 static const u8 tegra30_cpu_powergates[] = {
@@ -3133,7 +3133,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 
 static const char * const tegra114_powergates[] = {
 	[TEGRA_POWERGATE_CPU] = "crail",
-	[TEGRA_POWERGATE_3D] = "3d",
+	[TEGRA_POWERGATE_3D] = "td",
 	[TEGRA_POWERGATE_VENC] = "venc",
 	[TEGRA_POWERGATE_VDEC] = "vdec",
 	[TEGRA_POWERGATE_MPE] = "mpe",
-- 
2.32.0

