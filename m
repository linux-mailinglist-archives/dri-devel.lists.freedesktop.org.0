Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243B43A722
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E596E2E1;
	Mon, 25 Oct 2021 22:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD83C6E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq11so13208232lfb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kVn44UJl6fsxwvVMnWN4rWlwALC4wEkQ8Ltx5Ru85I=;
 b=bEH2cGpchvDPwkMd9z0LQIcOmk/u440rjJmMCVazujsoPMTB5FQaOYLbejY2sEP9Gx
 T878kU7T8oIW6d/dHdQfHyNVcW+oMMbcJYsT/VitwqzWZr1NREBLGiqUl0GYqbgHjPtw
 g1mR2hYLaRScSlzZuq3XBoK45Xa8ByejW+Cva5qJRQZDW9UwMZqBMzjQ2lxIFZg2q4M9
 Fw6CHUlM/V57XsTOsufGVchiFI80I1KoIl0Gy5iUx5KJzo9YRHEbVn78j57mKV2ZUIuj
 02dJLQFrBSQokLUL8BOan0yJIsr8oMhTYIk5yHnsv61clvQXVEvQ9X5CyhMV4ugJKLN8
 bF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kVn44UJl6fsxwvVMnWN4rWlwALC4wEkQ8Ltx5Ru85I=;
 b=utBsevD/84zaWovIz9XQ1PQn97ayqzgjYAxMFujsxutruc0irgu4GkP42zZHpgp78o
 Z4vOqPm0QYq2+91feZOhLn+6Hu5eEIg6ki9RQvgGoJDWJUEROyA6HYxn9a+ASCvz4Ysq
 8VW8D8+qp4Z8lXqWNPWTpIxzLAoxnNASaNJTZnJAiqte24AFHfxBg3zR8m4NrpoixQ8N
 1YJ5iLmexrNSAl81XTJ4W3cb7q0zBnh+wzZp7GYuTVEA7Xz/RFtbqnCBF2EcpRLkr2h+
 QI3RXl4b0Ni5Y3/y2ngUw7hqzQ64S3Fb0iJr5e8t4OgxVM5Kg9EG4fiHaCNPTQy6tDZI
 nWTQ==
X-Gm-Message-State: AOAM532I5IJKtnfixGcz0lRgh/CPSx1k3tvPnFYuo4ta0sbzFM0Czbw5
 Qvt5HE7UL/vFLEwp19dR4M/DkKqx+WQ=
X-Google-Smtp-Source: ABdhPJyFH33zgAFRFRVBFFB9Y/6hkGd0ZRgecxsZqpM+QDY3ZTYFAnvBykhg3Eh7aWgyJB9OIJDR9Q==
X-Received: by 2002:ac2:4c88:: with SMTP id d8mr11635926lfl.531.1635201960189; 
 Mon, 25 Oct 2021 15:46:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:59 -0700 (PDT)
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
Subject: [PATCH v14 15/39] drm/tegra: nvdec: Stop channel on suspend
Date: Tue, 26 Oct 2021 01:40:08 +0300
Message-Id: <20211025224032.21012-16-digetx@gmail.com>
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

CDMA must be stopped before hardware is suspended. Add channel stopping
to RPM suspend callback. Add system level suspend-resume callbacks.

Runtime PM initialization is moved to host1x client init phase because
RPM callback now uses host1x channel that is available only when host1x
client is registered.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 48c90e26e90a..0f1146be9d6d 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -112,9 +112,13 @@ static int nvdec_init(struct host1x_client *client)
 		goto free_channel;
 	}
 
+	pm_runtime_enable(client->dev);
+	pm_runtime_use_autosuspend(client->dev);
+	pm_runtime_set_autosuspend_delay(client->dev, 500);
+
 	err = tegra_drm_register_client(tegra, drm);
 	if (err < 0)
-		goto free_syncpt;
+		goto disable_rpm;
 
 	/*
 	 * Inherit the DMA parameters (such as maximum segment size) from the
@@ -124,7 +128,10 @@ static int nvdec_init(struct host1x_client *client)
 
 	return 0;
 
-free_syncpt:
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 free_channel:
 	host1x_channel_put(nvdec->channel);
@@ -149,10 +156,15 @@ static int nvdec_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(nvdec->channel);
 	host1x_client_iommu_detach(client);
 
+	nvdec->channel = NULL;
+
 	if (client->group) {
 		dma_unmap_single(nvdec->dev, nvdec->falcon.firmware.phys,
 				 nvdec->falcon.firmware.size, DMA_TO_DEVICE);
@@ -267,6 +279,8 @@ static int nvdec_runtime_suspend(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 
+	host1x_channel_stop(nvdec->channel);
+
 	clk_disable_unprepare(nvdec->clk);
 
 	return 0;
@@ -411,10 +425,6 @@ static int nvdec_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
-	pm_runtime_use_autosuspend(&pdev->dev);
-
 	return 0;
 
 exit_falcon:
@@ -435,11 +445,6 @@ static int nvdec_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-	else
-		nvdec_runtime_suspend(&pdev->dev);
-
 	falcon_exit(&nvdec->falcon);
 
 	return 0;
@@ -447,6 +452,8 @@ static int nvdec_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops nvdec_pm_ops = {
 	SET_RUNTIME_PM_OPS(nvdec_runtime_suspend, nvdec_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_nvdec_driver = {
-- 
2.33.1

