Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22841224E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AAD6E829;
	Mon, 20 Sep 2021 18:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F206E7D1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p29so70467861lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
 b=Wwh5Bp61loEgevDUFcsNB1xPMhR1XTpK+N5ivwKy3o+MQreoLkBZiSjBr1jHTPesp/
 y/RfPU1kIhmHBS4vZnv1ofR8MSrfOTaVskrC+CjJ/iyi3SBAtlMhN/5K8QIbifnjOkuu
 Dh97HFATcsIjwx7rWqSro8j+RixDozr05vXauDn4codyUtrpkPAL8OacgXCjMiw9sU6H
 hrJ4bNYPWROFg+PHVRJTKZ6aEWK/3UsIAIkJtdyUrIhQx3KUJx5sHmCOuzEu7Je3Fd8E
 k+UQaoNQXUCMSbxKpQfnFFK1bid7z+ov06RC5SgaW3u6UB/EwwGVRrTWh9dh9YT+vmxe
 5cHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myD2habKvt7RXAHJbtKPfyU4WLnqnb1bLB54hjelw1E=;
 b=taP3WXDT2O1pysSpKXBBo7jkHEvHHiS0oOKUACBdPfkTUrc9MoAjwTYt4pwvnIjoYG
 E8n87kGbWMrJNYYOVVezLtzymxDETe0tYCT8gzUIcuKLOcyvcEp8GpNMiUXW0p5A7cak
 baX2tNC9LN1CcHHcQ0pPdDSGdmm+oLyDBJGT7X+ZuvofEvvRN7aHpqjdygMd5j1M8L5O
 so9cbI7PWyCOtuGDowb7oQylLezvygivx1dJghxT8v2o3hT5CVvfvOZN6cVAURifgN5r
 xv9rJk0zza5jOBpo1XvRlR2JhnYJDK7fqPE1bfKMeCMtq+Ko2amYt4GJ46HDHbFYNU3g
 bGlA==
X-Gm-Message-State: AOAM53260LyeLku9sb8TGt9gT42zSTsTaTiJKw8R18Qdm5ZjtMhRRpre
 wC2E/A0L0m2Bwx8Hu5FvfAs=
X-Google-Smtp-Source: ABdhPJx0jdF0TRfniBGFptMPciVnLNS38vWQMz2X5dyyfZ8CmknMYMYEDaHex2CJkph6/kiivPojgA==
X-Received: by 2002:a2e:2243:: with SMTP id i64mr16693903lji.333.1632161556519; 
 Mon, 20 Sep 2021 11:12:36 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:36 -0700 (PDT)
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
Subject: [PATCH v12 29/35] soc/tegra: pmc: Rename core power domain
Date: Mon, 20 Sep 2021 21:11:39 +0300
Message-Id: <20210920181145.19543-30-digetx@gmail.com>
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

