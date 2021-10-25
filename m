Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E743A76E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D2F6E3C6;
	Mon, 25 Oct 2021 22:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DE86E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:16 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id n7so12464511ljp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XhJhoHa09g0eMXcPzvcsak7Gc2B+P6Q69tbTx8m4NvQ=;
 b=g4lNDzaXWoWnLUPZ36g5NPwv1hrjOWOnXwPfD+IvI+6zsWnp5DCMdjyRCMdQTTmCe3
 LgqIbs3O45c7jIcep2OzjdpPzmecNIqPCCwbOxhL6GhiRjv83y5f9E6AkmEOpKfq49dc
 N1iCKrMuxF5ghJLJ7iLcB+8Y0x3sAki9QxI30bG3pozVBsTlLSWv44KDuhwTOl6/P+o9
 i4to7W/zgwTrNK9xiza9rpv0rL4fJY4Bbv4/W1mNOW8sS/Hrd6HX6B77Mma0Jp0POqv/
 +ES8lNPKt3dv6y+iiUf5NhGpOHAgv604vY4m5nPNJnOuOfgADErV1ZQ6PGPzH12N2TcF
 X3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XhJhoHa09g0eMXcPzvcsak7Gc2B+P6Q69tbTx8m4NvQ=;
 b=qosC/8b7R2WY1xCfAYYpTonVB7bbgLN2hMl1u+u7WdoYd9CzyvWwUX3GqBgpMD5BrH
 Mroh5Fsi/5TQha8HmHtZbmJHlLMOn4/zX7pbrKxCyeIVmdxVwmkjX2p/BzcTyR2Wz2wU
 xEFhhpjE6zSUKs4Td0mgd+jOkl7Pk50oEtO082KISbupBvXbkWR+ma5FuZBmIjvDdK7a
 xfONJjzzVStmNgGz7mYehzG/3EF+RmjlLfKIhBiaWWwFP4YKX+NA91YOkuFxe3zuKvJH
 sWuV8KuXWs+7d4sBM0YM6W9JccfxV3fQdCClvxk88DeY/+pzyvAJ984o7w50f3WOgvJW
 fcuQ==
X-Gm-Message-State: AOAM530aqQcv1hCOjnUhH8wjDBFAFEaHtqbr39GVfmg0hVlOW17PmRtM
 c5OdOyicQroKGHGIF3NMfYs=
X-Google-Smtp-Source: ABdhPJx19huNzK+qkOsecJzciIfqsQoAzle0v8di7zqWT9JJN0+HUZjnnILNgbhPItf4hiomO38dkA==
X-Received: by 2002:a2e:9891:: with SMTP id b17mr22400671ljj.391.1635201974621; 
 Mon, 25 Oct 2021 15:46:14 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:14 -0700 (PDT)
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
Subject: [PATCH v14 31/39] soc/tegra: pmc: Rename core power domain
Date: Tue, 26 Oct 2021 01:40:24 +0300
Message-Id: <20211025224032.21012-32-digetx@gmail.com>
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

CORE power domain uses name of device-tree node, which is inconsistent with
the names of PMC domains. Set the name to "core" to make it consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5c6d58a27c39..4665b7214f1c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1353,7 +1353,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (!genpd)
 		return -ENOMEM;
 
-	genpd->name = np->name;
+	genpd->name = "core";
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-- 
2.33.1

