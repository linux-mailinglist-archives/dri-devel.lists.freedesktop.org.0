Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B24642F4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF9F6E860;
	Tue, 30 Nov 2021 23:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888356E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b40so57920377lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fItgMJ65iQSV+grlztB0lQCNjAn4l4vCQ8OPUC2n0iM=;
 b=aF4Ycii/MaHg00ZE+3dfsIrypVoNheEl/2z4wZD7B5Fk4zUtHjBDfqlo141OzxnaQa
 zm7xSEYL4w0/XZL8aWRjqM5n7O15+U8YcTg7o7+rsRCOOJ+7pttZLn0qcR/xwzWBqYve
 PxVj+uhKmoR3sfiqx4R4gYJCydMQfiaMPrnKXLXxVM773tj/5onjnzuJXwHXUoWrZPPg
 8IFr+JCg0bz/nDHZxnUtA3fywTxkh8cpGh2JhevcLq4n6jeOJklKLfpzRcliS67IuVSk
 1rk4t2pC1AEteT5UDrCGSiGAshZfpndMymsOCMArlbIU+loriqB4r7KOF5yJaTSQXOlL
 l7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fItgMJ65iQSV+grlztB0lQCNjAn4l4vCQ8OPUC2n0iM=;
 b=kLvIH+MpwspdC45/vi3BMu5HkXaqHwrmsieFT/k0aZiXWC8qYCvHoaPGA/LXYXlbnB
 t295nUqL3jOMO4trKXkSs/7QX7xq0GZmngPhMyUAbEo0443/pG8R3QHjurqQgfRjjogg
 yJKaHOIcMjETB12Hv1jx5Vyit0WYOi6oTDiNSKBFPjDyzAleeVBaeutMxfmAEn9iRHdd
 lXsYUm+A08MIVASMbKYTnmCaTfc2b841+kc0geI3/2njJgD8sEv7l6R48JGiifo2fcEz
 d2u3H1hmdre49aaRXp9s8+/cp7F9jaGpNlKNVzrl35PbwA8T39vZfS+AomcZIMnFUuAR
 D5ZA==
X-Gm-Message-State: AOAM532s+B2zjbapT48Aiy+2UjPH23j4ZHlMSrlGFBuiL6HiToEss7VG
 DgMCFiF4021tV9BoIXyBQnU=
X-Google-Smtp-Source: ABdhPJxNNuml25jdJ1uBpe8+MC5krQ/60pjZWIeaI9zJ79Nq+G/T9R/n77kuIsPsf3+6jSdJfbWKRA==
X-Received: by 2002:a05:6512:2082:: with SMTP id
 t2mr2340563lfr.186.1638314665960; 
 Tue, 30 Nov 2021 15:24:25 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:25 -0800 (PST)
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
Subject: [PATCH v16 32/40] soc/tegra: pmc: Rename core power domain
Date: Wed,  1 Dec 2021 02:23:39 +0300
Message-Id: <20211130232347.950-33-digetx@gmail.com>
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

CORE power domain uses name of device-tree node, which is inconsistent with
the names of PMC domains. Set the name to "core" to make it consistent.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e1fae1a5e36a..de6234ec4f9b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1369,7 +1369,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (!genpd)
 		return -ENOMEM;
 
-	genpd->name = np->name;
+	genpd->name = "core";
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-- 
2.33.1

