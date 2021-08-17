Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA873EE23D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C486E09E;
	Tue, 17 Aug 2021 01:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E536E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:09 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y7so30267500ljp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=whXbmpiV9uZrIWQEZSp5RRTDQ3TFfbRun1N2tfG7MWk=;
 b=qVuy6Otl0UWSQ+/nZMjDzykD2sSUZDst3NL/JVapiLI3z3yUfsGAUcncelhMR38Lym
 1xjVPKDNQoeHSdojhaD4CNMJ2Dgxsx7ya2LEvfAdSM6jyMIhg0fAggQvAzFKMqqVOL9O
 IPbH29DcWGT56C4Udgprd2zRCBzNWyrc1+xqzNB9hh3j27fQeaGpUX2Jl9g2CjR6dsJE
 H3f4BOVlgw85yDYhZPvxDoAPPZKXld5HwD4iSdkylVBs+x8a7x/zUr2T15/KjxPp7TBo
 OcMaTgNBzyb8Gi7/p8ZpOcNZ09XNRqw/14qoRIg6z6RvIG29dGNOEq13dllv4PGdI+NN
 gRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=whXbmpiV9uZrIWQEZSp5RRTDQ3TFfbRun1N2tfG7MWk=;
 b=Lzn1uBfjWZ/1lhV1oQNdh3YbXyJJVfylMTaJBSrjck+COvap7rvYwoeYFIpwqfnc+w
 ug1PGGn5nGfCaJVFT/fMWAyeenamZTQ2HzACsMIiGL7pPwQ3Zp0APt2n2lvI/y89bEe9
 ASAT1NOpXlltrPSKEJb+gkPkjlDvBRa9iD8XL//h/wwrZrXOqhxy8Yldp6wNAeszZehW
 lVlDB6CCVNs8RTvVw5UCIm/HJ1ome/9YsJfR9Z0ED3Vp2U/jg+u+7iNS09vc6bkmSXaF
 K3PZ3vbjkdLoQCEe2A739vg1IsQIrJpfhd5LiB4Ptkxw4zcKEiZvkFF2TSg3uIXyDe05
 bXpA==
X-Gm-Message-State: AOAM533+DWsXN0S4lV5wdzi0raOtHyDb+hSZ08JAjZWVO8ZYXKCiqGc3
 p811S2AVXGePK8+4HzWJHMk=
X-Google-Smtp-Source: ABdhPJx0BGOHbSZlE+uingQVCD7QPlpfvESjI/6O9+jCEZkAPokxg6m3XSjkH1CoIjJ45grVv1YxFQ==
X-Received: by 2002:a2e:5758:: with SMTP id r24mr870243ljd.432.1629163807370; 
 Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
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
Subject: [PATCH v8 05/34] soc/tegra: Use dev_pm_opp_sync()
Date: Tue, 17 Aug 2021 04:27:25 +0300
Message-Id: <20210817012754.8710-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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

Use new generic dev_pm_opp_sync() helper which initializes voltage vote
based on clock rate.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index a42d4f98c078..dab1bacb41ab 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -39,34 +39,6 @@ bool soc_is_tegra(void)
 	return match != NULL;
 }
 
-static int tegra_core_dev_init_opp_state(struct device *dev)
-{
-	unsigned long rate;
-	struct clk *clk;
-	int err;
-
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get clk: %pe\n", clk);
-		return PTR_ERR(clk);
-	}
-
-	rate = clk_get_rate(clk);
-	if (!rate) {
-		dev_err(dev, "failed to get clk rate\n");
-		return -EINVAL;
-	}
-
-	/* first dummy rate-setting initializes voltage vote */
-	err = dev_pm_opp_set_rate(dev, rate);
-	if (err) {
-		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
 /**
  * devm_tegra_core_dev_init_opp_table() - initialize OPP table
  * @dev: device for which OPP table is initialized
@@ -118,7 +90,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	}
 
 	if (params->init_state) {
-		err = tegra_core_dev_init_opp_state(dev);
+		err = dev_pm_opp_sync(dev);
 		if (err)
 			return err;
 	}
-- 
2.32.0

