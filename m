Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B054343A765
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A488984F;
	Mon, 25 Oct 2021 22:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452FA6E328
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id o26so16227131ljj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1MsgTWaMU7L5hsoQyQaWcgiqMKdd8mOxB+as8zU9xk=;
 b=ESW5TVtukQQHsP1xA1tsnaOoIjIQu87u6518JmR4shcn7KtAWPxPFh3d0xpoDsI6wM
 YyP2MT3Eu+6fIplBUYjaf0WSmG+CDCMsMvMiidRkeq9ZtD5jB9qMIibBJqrqgCUM/bKv
 pWnLiISUU3Z6rNE17YU25yFK/efAJIdE8Gt8dzjGEIznWXy5DlEdOLDN6teWTGMHUNKY
 1zyAUKVMTWnAk+7boP6tufnTpZEe8brt5G0s4+mIA9wod8aobxx3bnsTKl9oNjn7ru+Y
 QdDqeZIrycYFFAEbEuLO0p1eLh2LDrr2oPkhVFiJCXWmGtGfQS2q2OhwgibVnvCC58SF
 vmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1MsgTWaMU7L5hsoQyQaWcgiqMKdd8mOxB+as8zU9xk=;
 b=uchDxEwk+sZqLJV7MLI1lmBYIuAi1/5zL6Eb0NTk8V0GGXRwwdvrjsSZ0iIX+hznm/
 oaDXqMNlhtSHd6JBjc0IDFKg8KEoQkold716wFvCpXG9cxeEWleH9YawMpSDOvekEAVn
 t+cY/R34H+wNwHQ1pgNPJg16zyZ03iZQx8EGBIHR6u/oahovUbfJkgGIVjYoyrrBTygB
 0yIzrQoAzadHPMaoVBnpWsypPykjOG0BUgy1IRWu9rYJeVXNphvJkK2/jOeETDPGo6iR
 bxGzAr3/AVaxcvfpKk4DOY+wTZQxTlPakvjCSmP5z/9SIw+pILkdxMVOx8BBi281Rjd9
 AYCg==
X-Gm-Message-State: AOAM532lb5mnKm+jO4gVnon1q+5cr4N9KaADbSKvy95yL2uOv6xM+NLQ
 kkHzhHyq1iFhmy+fJacqfas=
X-Google-Smtp-Source: ABdhPJx5gPntgOyZIHqj2um0ceQNxg/n93Di/GFAUn7kVG4nQHeNw/wbNxrIgWWvvCnUBeaoVmYQag==
X-Received: by 2002:a2e:8785:: with SMTP id n5mr22579743lji.52.1635201975524; 
 Mon, 25 Oct 2021 15:46:15 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:15 -0700 (PDT)
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
Subject: [PATCH v14 32/39] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Tue, 26 Oct 2021 01:40:25 +0300
Message-Id: <20211025224032.21012-33-digetx@gmail.com>
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4665b7214f1c..ad8f33a5daa1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3041,7 +3041,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3102,7 +3102,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.33.1

