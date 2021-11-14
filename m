Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E511644FA9F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164886E89A;
	Sun, 14 Nov 2021 19:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A606E88C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b1so31690181lfs.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fItgMJ65iQSV+grlztB0lQCNjAn4l4vCQ8OPUC2n0iM=;
 b=p7bP1P6r4dEikXS5YUjD4B1/CGf6lvJ6idSQeufZhdoMPZNLSpKj9R6K9ngCLl1aZ6
 w6FiXIx1EhIKNCySvfZ9dq6eK83Ass5BFjbtVZJxOeyNraegN1qyU1UCHoL073F6P8Jq
 hCtbPVZN3AHUyFfecXtTr4dj5Mcp/c9x+3SK7N41ST1QsDFdYaRzejn9zUP65Xbt1rdr
 4X6+EYQ06asjrmCH5HZEJuz8XEX4fBiNCXSCBk4t6/dARk5uivUbY8e5kQ6id6QS039w
 aepKfzngjEW5flAb9jo/i3puoqlYQwFUXBqEVehix3lbGsr/aQ9Hmi3LWp2clmwno6pn
 J/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fItgMJ65iQSV+grlztB0lQCNjAn4l4vCQ8OPUC2n0iM=;
 b=ya1Pn/OlWn2yDQy9GV6+8eC91EmWevB7GViBdIvuQt/1LMCGWR2udbw4rzSzY0Ai4P
 JzPCW6BRM4/NBcKxvGL8KgaWHhGyriXzgqJuEgd2lne0fs89HGMaBbj9sr9Mnb76jJ1z
 Fnu4pyhFJCv5L3zYhYx3aUKnwrvbycu8d5/b2YAIpLKJ3LT4xacNJx4ILKbudJAVSJFS
 NuiAES5OVZ0KiAlYQ+mI17I5pF3h617Y2IJa4QHzgSRCOuPuuIT2Z8pvLlCofQef4AgS
 CcpaBHPe/l4z/eydSRA7mILezbEbwEl2b4ydL4d5bhizrmxVTlQitvTXjWr8P60pa49z
 gNew==
X-Gm-Message-State: AOAM533/0GhHJF07AOS0vLifMdheYo7aliSCG58WEZq6/J5i4b6JLk4E
 F5HD/vye4EGrIdry9a1r1rU=
X-Google-Smtp-Source: ABdhPJzxAEbohXOKyUE7xn/hkXFl/4SfVadu4MW7os0XYNeheDcZ/TU+PAIPqaAHEjm2ORClibXzPg==
X-Received: by 2002:a05:6512:3d1d:: with SMTP id
 d29mr30408424lfv.685.1636918586150; 
 Sun, 14 Nov 2021 11:36:26 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:25 -0800 (PST)
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
Subject: [PATCH v15 31/39] soc/tegra: pmc: Rename core power domain
Date: Sun, 14 Nov 2021 22:34:27 +0300
Message-Id: <20211114193435.7705-32-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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

