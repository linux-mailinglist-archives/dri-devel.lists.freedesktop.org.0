Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752F418BB5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C166E6E5AB;
	Sun, 26 Sep 2021 22:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22026E5A5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e15so68609228lfr.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+whg/vR1lDDJUCWuilT5Vzp2lbX9lxYPieEOT99+gTQ=;
 b=oLWO/vyJTTDlVSPydjP6AYwkxAlr5iy/JlDt/BbqS2lo6hlZ0KNz/gRTRZMVQMNioh
 r5RcVUqdWSzdO0lxxF9KtGbegUFjhhrCk9P0rWeO2PerhFEKe2aboHJQPDzuab4ph1c0
 Rf5BdnU2fVLsbsUkmx+w3l4wDfbekTni6Uxy5ycqAb58A1dHRJR1pEpPAgs+0LIJKX/z
 LuabDfkxB1YypmB/U+MK1kmHxsyOpVlw2B1ID+Efp9rvDOxySvk9xAFgdkoIwGc8yJnk
 fe9QIotDuDDvzaTVA8SnOkMqz+HXxGziXFx5DVCCTSaNmdXkG3Cyr5Gdv6P8E52hK/Fe
 zwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+whg/vR1lDDJUCWuilT5Vzp2lbX9lxYPieEOT99+gTQ=;
 b=grBN3hVOpS8TytPyekAEvs5XMPWEbHesa36FcPrgmXFYWkeKrnfGrxVut804DZpRGI
 jaxXhf7I+mxtOi2OINwrFGsVdZsnOlOhn6j5s4LB/Yj8fkadHbqVHTR6Mfj9a5ETx62u
 KjFrXl40pGaOWtCfzcOQa1IcwwmmYFlvPL4jqaOBchRzac+noxxsDOJq3Hu6gR8tghYe
 2MwAPsg4yoP1IzzXaUFFgcvlBmisgyUtp9QQXS1qLPBdJ0gDfKUb8p0pcLhmNxgv2eOp
 oaiqKkBii2wuDiS3Z8GyHeKAeVLOoIaWt+eR5Jh5LsH50zLxD7cCdOttL3mrgF+P5CVA
 Kgbw==
X-Gm-Message-State: AOAM531rp95VsfJplXf0WZ/i9hCYg/TLdmz8EQkvSBfQZfcHVyvKO2/W
 cVdX+6T+AjxAE8nWPdI9d18=
X-Google-Smtp-Source: ABdhPJz3XYdDBXG91bqXj0hDSBRKOWWLM6fxt9rVwzqDlgF9wZeNbMEbj7czzXrnV4JtevuwcX+/SA==
X-Received: by 2002:a2e:7d07:: with SMTP id y7mr25887502ljc.406.1632696149001; 
 Sun, 26 Sep 2021 15:42:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:28 -0700 (PDT)
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
Subject: [PATCH v13 03/35] soc/tegra: pmc: Disable PMC state syncing
Date: Mon, 27 Sep 2021 01:40:26 +0300
Message-Id: <20210926224058.1252-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Disable PMC state syncing in order to ensure that we won't break older
kernels once device-trees will be updated with the addition of the power
domains. This also allows to apply device-tree PM patches independently
from the driver patches.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 50091c4ec948..fb8faf7b226a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -360,6 +360,7 @@ struct tegra_pmc_soc {
 	unsigned int num_pmc_clks;
 	bool has_blink_output;
 	bool has_usb_sleepwalk;
+	bool supports_core_domain;
 };
 
 /**
@@ -3041,6 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3101,6 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
@@ -3157,6 +3160,7 @@ static const u8 tegra114_cpu_powergates[] = {
 };
 
 static const struct tegra_pmc_soc tegra114_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra114_powergates),
 	.powergates = tegra114_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra114_cpu_powergates),
@@ -3273,6 +3277,7 @@ static const struct pinctrl_pin_desc tegra124_pin_descs[] = {
 };
 
 static const struct tegra_pmc_soc tegra124_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra124_powergates),
 	.powergates = tegra124_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra124_cpu_powergates),
@@ -3398,6 +3403,7 @@ static const struct tegra_wake_event tegra210_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
@@ -3555,6 +3561,7 @@ static const struct tegra_wake_event tegra186_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra186_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3689,6 +3696,7 @@ static const struct tegra_wake_event tegra194_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra194_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3757,6 +3765,7 @@ static const char * const tegra234_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra234_pmc_soc = {
+	.supports_core_domain = false,
 	.num_powergates = 0,
 	.powergates = NULL,
 	.num_cpu_powergates = 0,
@@ -3803,6 +3812,14 @@ static void tegra_pmc_sync_state(struct device *dev)
 {
 	int err;
 
+	/*
+	 * Newer device-trees have power domains, but we need to prepare all
+	 * device drivers with runtime PM and OPP support first, otherwise
+	 * state syncing is unsafe.
+	 */
+	if (!pmc->soc->supports_core_domain)
+		return;
+
 	/*
 	 * Older device-trees don't have core PD, and thus, there are
 	 * no dependencies that will block the state syncing. We shouldn't
-- 
2.32.0

