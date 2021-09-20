Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B1F412259
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 20:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76B76E81E;
	Mon, 20 Sep 2021 18:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF56E811
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 18:12:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e15so32428235lfr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuKrXeUQQi+X+gXF6rgX7l9I20zb6cKrHqHuf0Fo3Dc=;
 b=oAOCoG/znAVLsYr84YVLiCtxJTD4YhbnMl9MmvH4oJCtY8MwJLucG5KkFDTnpEOxdC
 3DwslC/Ndk9Q90zwRQTcGMZJAEyBOjnRIMVbOcsHqqEOkquTyjCV90rzQJuA8zIomDrt
 5SNR6c6V59My91FTmuvl2Dyf63eO+QUZ73yA5fEIGnYyLfalU6IIRV5YkJgSP99n/+GJ
 DinoiqpKW9Xe/5PiK/RLrelVTcb8TxN8LvLASfhdcKDoxsVx8BDwMIdxOsHRAke57tSZ
 oQ5friBDYEIejTBWxrlAt73EpQiE0A9d6HcXUVrGO+mADKCElOm3g+IRVvgQMbDm/ocp
 5jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuKrXeUQQi+X+gXF6rgX7l9I20zb6cKrHqHuf0Fo3Dc=;
 b=uLvGbaAbItxClhqpLyi3ysXyyHz42c+6UIP0Q4m7j62rF0vdKLo93zT+xUV7eA2UPm
 NMl+lI9HQp00QZNzdAwFyo3xjWW525OPbSw2mAd+Iu15P5sbwtfo+iQ4IQfTJDzL98xm
 n0/Z0RlfA8aQgws0HycUpwg13dapFUbc7Ow5Fr81zprN5V1RQf8+93T01cDQSdhWqdbu
 P9fsCpXvMUfFgDA+4QlmK9PVCupnhTSzKvCuuYk/Rnk9joOCO+splRu2GcxiVqhSqQ+i
 u7+7VheSTSgmCGk+aFBxf/vKl0yof4qZCgnF+1zzSZdRzID2/MNBaWSxBMNudeHuZjVr
 NRVA==
X-Gm-Message-State: AOAM530Vaa7q1XGuwQpnrhiRVxPSEKlxfCgrISUnTsBsrSTIm49LJDjM
 MNrdxCz63bWBPccFNzvEtHs=
X-Google-Smtp-Source: ABdhPJwYFTOCU91qzlX2w90yxfMQHK7pWKUxWyPmSJCZEWlSkWbUE0mq0fWrUUX0M+dtPv5volXZHg==
X-Received: by 2002:a05:6512:68e:: with SMTP id
 t14mr2732886lfe.156.1632161552584; 
 Mon, 20 Sep 2021 11:12:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.gmail.com with ESMTPSA id u3sm1775677lju.107.2021.09.20.11.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:12:32 -0700 (PDT)
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
Subject: [PATCH v12 26/35] soc/tegra: fuse: Use resource-managed helpers
Date: Mon, 20 Sep 2021 21:11:36 +0300
Message-Id: <20210920181145.19543-27-digetx@gmail.com>
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

Use resource-managed helpers to make code cleaner and more correct,
properly releasing all resources in case of driver probe error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   | 32 ++++++++++++++------------
 drivers/soc/tegra/fuse/fuse-tegra20.c | 33 ++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index cc032729a143..fe4f935ce73a 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -182,6 +182,12 @@ static const struct nvmem_cell_info tegra_fuse_cells[] = {
 	},
 };
 
+static void tegra_fuse_restore(void *base)
+{
+	fuse->clk = NULL;
+	fuse->base = base;
+}
+
 static int tegra_fuse_probe(struct platform_device *pdev)
 {
 	void __iomem *base = fuse->base;
@@ -189,13 +195,16 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
+	err = devm_add_action(&pdev->dev, tegra_fuse_restore, base);
+	if (err)
+		return err;
+
 	/* take over the memory region from the early initialization */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	fuse->phys = res->start;
 	fuse->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(fuse->base)) {
 		err = PTR_ERR(fuse->base);
-		fuse->base = base;
 		return err;
 	}
 
@@ -205,19 +214,20 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to get FUSE clock: %ld",
 				PTR_ERR(fuse->clk));
 
-		fuse->base = base;
 		return PTR_ERR(fuse->clk);
 	}
 
 	platform_set_drvdata(pdev, fuse);
 	fuse->dev = &pdev->dev;
 
-	pm_runtime_enable(&pdev->dev);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
 
 	if (fuse->soc->probe) {
 		err = fuse->soc->probe(fuse);
 		if (err < 0)
-			goto restore;
+			return err;
 	}
 
 	memset(&nvmem, 0, sizeof(nvmem));
@@ -241,7 +251,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		err = PTR_ERR(fuse->nvmem);
 		dev_err(&pdev->dev, "failed to register NVMEM device: %d\n",
 			err);
-		goto restore;
+		return err;
 	}
 
 	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
@@ -249,7 +259,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		err = PTR_ERR(fuse->rst);
 		dev_err(&pdev->dev, "failed to get FUSE reset: %pe\n",
 			fuse->rst);
-		goto restore;
+		return err;
 	}
 
 	/*
@@ -258,26 +268,20 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	 */
 	err = pm_runtime_resume_and_get(&pdev->dev);
 	if (err)
-		goto restore;
+		return err;
 
 	err = reset_control_reset(fuse->rst);
 	pm_runtime_put(&pdev->dev);
 
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to reset FUSE: %d\n", err);
-		goto restore;
+		return err;
 	}
 
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
 	return 0;
-
-restore:
-	fuse->clk = NULL;
-	fuse->base = base;
-	pm_runtime_disable(&pdev->dev);
-	return err;
 }
 
 static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 8ec9fc5e5e4b..12503f563e36 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -94,9 +94,28 @@ static bool dma_filter(struct dma_chan *chan, void *filter_param)
 	return of_device_is_compatible(np, "nvidia,tegra20-apbdma");
 }
 
+static void tegra20_fuse_release_channel(void *data)
+{
+	struct tegra_fuse *fuse = data;
+
+	dma_release_channel(fuse->apbdma.chan);
+	fuse->apbdma.chan = NULL;
+}
+
+static void tegra20_fuse_free_coherent(void *data)
+{
+	struct tegra_fuse *fuse = data;
+
+	dma_free_coherent(fuse->dev, sizeof(u32), fuse->apbdma.virt,
+			  fuse->apbdma.phys);
+	fuse->apbdma.virt = NULL;
+	fuse->apbdma.phys = 0x0;
+}
+
 static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 {
 	dma_cap_mask_t mask;
+	int err;
 
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
@@ -105,13 +124,21 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 	if (!fuse->apbdma.chan)
 		return -EPROBE_DEFER;
 
+	err = devm_add_action_or_reset(fuse->dev, tegra20_fuse_release_channel,
+				       fuse);
+	if (err)
+		return err;
+
 	fuse->apbdma.virt = dma_alloc_coherent(fuse->dev, sizeof(u32),
 					       &fuse->apbdma.phys,
 					       GFP_KERNEL);
-	if (!fuse->apbdma.virt) {
-		dma_release_channel(fuse->apbdma.chan);
+	if (!fuse->apbdma.virt)
 		return -ENOMEM;
-	}
+
+	err = devm_add_action_or_reset(fuse->dev, tegra20_fuse_free_coherent,
+				       fuse);
+	if (err)
+		return err;
 
 	fuse->apbdma.config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	fuse->apbdma.config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.32.0

