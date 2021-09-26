Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC0418C30
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDBF6E7F1;
	Sun, 26 Sep 2021 22:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3746E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:43:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i25so68980415lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
 b=mIfxe0TF/9Pcmy48yz0Fsm9ZchpGfpzi0SLlaP45hHx+C8LQ6p9xMjB3D70WA9M6r4
 f9Aargip+FhmIUdB55HLiFKB+j0CuPHT9193U5qmsrnbn/Shc1W+Vlq4RScSptQph0b2
 zgkvwA9uw/jspllbPLhMek7qZa3C+M4uXTPhgu+iJy9ui2A9cQvS5x86VDhpjfBZa516
 68hec1KCKBc+8zQLs7jcGuH8GoDG8SM6R1dQGUDeR7s+JPShQDnHP4x9Fz7CwQzH2hyu
 MW3MHHj7ACUbOHnjE0xhpImyVDrgU2Fi29vssm/QIqucYYRqM4SuFJTS04LbgtjS8oZZ
 51Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
 b=o8dpCz3oJEWniAx0unu+b4cn60uSgNjg22tSnbfrsPpG53f1RdCKFviZCW2SOkYUrS
 3OUM2bRUYH1PV6fsmWlWk9W9SdDyc6HlDCen7VdBYEY55FyZSBd67r4TSbnAy471l826
 A7T0MIqaopgk3am2TGhKEFAfv5vNITZlJhVOI+8kx1mMd4kIsngq1mXtOp3sCH9yl+6P
 tB/QSJMV0MCQx6uym8GcNyK2eso788aR71GC8GqMnE1bI8FGK9gIWfc0FfXRiZSTPRqU
 SPRU/sx1xHc4B0g7i7xi/fLPBQbIxG3TbYQ17epvSkVqHJFzTsWUFgn1TabrLhex6eaQ
 PGqg==
X-Gm-Message-State: AOAM533JI6DzZVTqOg9zFRvZ6nPJ8fFidsAzCbp9ZA0JjNJl2XnfTFmd
 SCq9d49dW6PLLrau9SSsQFI=
X-Google-Smtp-Source: ABdhPJz2GN71oCn5sxPfcYLYhElIbf9KK/DAi0VeYmiU+Ndj/lzTslJMlCVfBT6aWvUUtQxHZElN8g==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr24867181ljk.96.1632696180464; 
 Sun, 26 Sep 2021 15:43:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:43:00 -0700 (PDT)
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
Subject: [PATCH v13 29/35] soc/tegra: pmc: Rename core power domain
Date: Mon, 27 Sep 2021 01:40:52 +0300
Message-Id: <20210926224058.1252-30-digetx@gmail.com>
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

CORE power domain uses name of device-tree node, which is inconsistent with
the names of PMC domains. Set the name to "core" to make it consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6759f19b9cd6..3e52ceada60c 100644
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
2.32.0

