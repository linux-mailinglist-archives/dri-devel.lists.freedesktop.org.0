Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F0418C39
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C326E7FE;
	Sun, 26 Sep 2021 22:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7A16E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:43:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u8so67672378lff.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
 b=kC+icNnnM68LagyRGGEkOQupTcNBYuDcSG0HFicRtIiTyC+plFKn3cvHTRDvYVnmx9
 9V4KSaIw9OcWGcRp6dmsMjSj9hx8CjuFfzL+aBrmDRxvrIkmsHFwUroFsNPYCxkIr0W8
 Un6+DO2AsKkUFSkduTD433sBrILi5ewzXGddooCqW4ze81GkzdjBtSNDQGSoiUnym8ad
 N1NgQZMznEOZqBWAmCG8OIxTMeHgaW+T04Wpx7xvrjBn5mZ7xdlGJNzEihb1INyGjhjm
 6frWTQTuXWYuHOzKv5qBDKA9bVBzQoAr3sO+ErQOFjvj+4iubRb1QmKTf0pI6PZjV3U+
 NDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDRA8PLugfMxJpXAqa8RlnWxOlWeZ2QqIDIb0I+7p08=;
 b=4BrTh2STvmx2a99rFngwpidguRvV5aeLHKN4wshBD9Pg8nEAtXrFPGnLWtZ9kyN6lg
 hrUJwlH+X9EvhSl8VvCdZPl/3nPh88xW1eOLOgCtBMLBtBziqUoawtfz1pmA1f9d3IMU
 73RmaStqVJ/sMbYbUwTRgj6dbiCmf+r3R4G++JfO/lMegDr4B/SPCHkos4SIRXl3mx/P
 eRQwYs+GGH6sH4+elD8i//ktzSzqk/wW88thScE/vbQ7Fr8Ohl7Pu5G3yfCwcPT9xBlB
 dGBQjAFiqvuMSdKhPQ8WQk30VDkSj43yeV7pBXmFs/v6mW7AwHWG/4fNpPmAUJUWeN+b
 lFeA==
X-Gm-Message-State: AOAM533w8C5Cc9wVXv3hb5wuEWAHXulz0sRWcsc8bFypd+tlQF6O1aQa
 OfD980UxKZ0G5fVPqiFnITPKh76O0xo=
X-Google-Smtp-Source: ABdhPJxIGYEdLSAtK2lqAJBv7v5bdPEvftQGTGQC471A9Kq4ApP2a2tRiygRkUZI8l152v5eb2O61w==
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr25671483ljc.70.1632696181602; 
 Sun, 26 Sep 2021 15:43:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:43:01 -0700 (PDT)
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
Subject: [PATCH v13 30/35] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Mon, 27 Sep 2021 01:40:53 +0300
Message-Id: <20210926224058.1252-31-digetx@gmail.com>
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 3e52ceada60c..7c7aff8120d4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0

