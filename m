Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9E408055
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF626E07B;
	Sun, 12 Sep 2021 20:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7326E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q11so11298371wrr.9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6ifLJNQpWHL/aW6APbCXiXF4Xey3uNJjXkEDYLDpf0=;
 b=ZfKwSrRJYOUFhAoytmkutWh0G4OM3EDXtdlI9nE+QFtPei+2E4JdDl9Wka9E5pH3YS
 04uPK1Tw8S/mpSJek9+01/hZUOudukqiP1FHYcqijmNUw3d/ou4/LVcqog6TND7k1ctk
 nhrCXGQ6H7XuuSz39ea5BGGnr4/poWAHAjMjQDsmYxL4FiyE8A3sMYfTHP3veVbXO+uo
 d9x7efPI4RBayLlBeljU0f1eSkDX3OfNSksY6kDtJWGRBn8yGTD1egqNKbd5IoFywF9B
 P5raiK7sTUwh7OkLsuO0sINvzimEE1qvWRuqPCO+jbWgCSh5d3Bgwic9fGMsNaWhx7YO
 E6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6ifLJNQpWHL/aW6APbCXiXF4Xey3uNJjXkEDYLDpf0=;
 b=rKe6gGuwyxLb/W4R9WZ+0snRDQk61gisp1m79OxNa4t76QXAZ5+L5U7pszmr+65rqL
 NEQKNLYNYQqpy8/lnIRnNGdF8kiQrHJLGx0MEbdWNmcwct/xbBF2EIqulWV6L2se7qHt
 LnarLabnjT37ZZt8mooQ7yRu/ryjzFUobxZgqTFHohVn0PI0ThN0UBDQOU7/PRdyMNg5
 VNaea4U4f4PJCL4tJ/+loo5Azb/ygVaiy1skGd58HnEtm51xHe/dZEEDMFoytU7Eoo+N
 GjIH8i6zvAX148ckvLVfzbqJfZlrIh6MRWT/TA2lm98JrT7Pj2XSRc0saEDkcLKjmFDJ
 5x7w==
X-Gm-Message-State: AOAM533dv+LHiEHeafZDkzIluECHUHEc12x9odhF0ofAXeICaHixsS+1
 llOGHTgKqZIMa83jW+8c3Gc=
X-Google-Smtp-Source: ABdhPJy5R0R2cYZ9ytbAqF/pKeienf/EwQwWGSDMVrYLML+XPPmZs/giSU/21wa5JsLrvKFXP2DpUQ==
X-Received: by 2002:adf:8170:: with SMTP id 103mr9108790wrm.167.1631477442191; 
 Sun, 12 Sep 2021 13:10:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 28/34] soc/tegra: pmc: Change name of core power domain
Date: Sun, 12 Sep 2021 23:08:26 +0300
Message-Id: <20210912200832.12312-29-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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
index fb8faf7b226a..5e1fc873bf8f 100644
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

