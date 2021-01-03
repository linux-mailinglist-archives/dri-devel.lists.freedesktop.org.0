Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059B2E91DD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64289C1A;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D613889895;
 Sun,  3 Jan 2021 03:55:07 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id e2so16596881pgi.5;
 Sat, 02 Jan 2021 19:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XukCghNiyOItZhHaZYN/GSrSL5U50HSG0l4LszYD+Co=;
 b=YKg7J93UN+43tgiOnq52fm9GQJNJt8EzL0xhqubddoujHgkE6oqBQbiylU9wCJ0ugP
 t7ei6QE6u2qNut7tLfJIvddWZj1EOvm7EWvxIxQWPDVcaMly5FywYUNKjuDaEDGQtSeZ
 g80TdfUR8svyTcpN4r3lAg4UKTQtCIWJzWvLDvwp6vdp6RhY/b7hbW8ErpScpfbpKiHk
 DUZvL/mpfw1msfOEX4ljnKoWshzYRLHH/pH1tFwfm9Am7ljlg28wTm+S4izfKEGzxIm4
 Ov8IDeDWD2wzaOWLyjEqbGfJjCmNV5ywp7ylpoz+hdQ0IUvZvhiLLUG+xTGmA7m7chVh
 qFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XukCghNiyOItZhHaZYN/GSrSL5U50HSG0l4LszYD+Co=;
 b=X3C8pgssnlvB2ZhKkCmcTh+tDKSXej+aoXfhA7qgKDYPMD+BIJhsawH+iDbtjdYK6a
 Bv2/VHSZSoSDXdziBRhGsBc/rdAUStuMBdRfDKKCJPXtfB+y0/P2qS6ScapGX67R0Fie
 z5pCaYL4yJqpDHIXufdyRUPSOFUs+mYfibyOlnOyJvvNEo6QWh97bMLiEZK9lIDFdmYC
 58791N1QMo/JpNXSBlSTbBXNfxnWLeQ6vF1KpdZDLpcA1zqRyEOTtejfjVaMGm9TDWad
 dbDUVEUL9s8X/WwOq5pTEnBuAXgkwyAEBsF7sgPMAKQWuSANKpxCcpLBC+ceJOm0NkcY
 Qe1Q==
X-Gm-Message-State: AOAM533wELfnHc/OWj/PDxFuIxUKYJaTEnYtCnw34H2fIt/xpLlKpN+S
 uQb36wvcaeIcKmYvykIi7M0=
X-Google-Smtp-Source: ABdhPJztzvvTllaqz7ejOV4bbiE80gA6URGwLsGIb0AJ86cxZXMSpVpCDIvAE+92iRA1fFhFsGEGMw==
X-Received: by 2002:a62:7c4a:0:b029:19d:b7bc:2c51 with SMTP id
 x71-20020a627c4a0000b029019db7bc2c51mr61899143pfc.30.1609646107481; 
 Sat, 02 Jan 2021 19:55:07 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id z3sm10967448pfb.157.2021.01.02.19.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:55:06 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 26/31] PM / devfreq: tegra30: convert to use devm_pm_opp_* API
Date: Sun,  3 Jan 2021 03:54:45 +0000
Message-Id: <20210103035445.23696-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_pm_opp_* API to simplify code, and remove opp_table
from tegra_devfreq.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 117cad7968ab..4984cb91e9ea 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -178,7 +178,6 @@ struct tegra_devfreq_soc_data {
 
 struct tegra_devfreq {
 	struct devfreq		*devfreq;
-	struct opp_table	*opp_table;
 
 	struct reset_control	*reset;
 	struct clk		*clock;
@@ -794,6 +793,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	struct tegra_devfreq_device *dev;
 	struct tegra_devfreq *tegra;
 	struct devfreq *devfreq;
+	struct opp_tabl	*opp_table;
 	unsigned int i;
 	long rate;
 	int err;
@@ -841,25 +841,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tegra->opp_table = dev_pm_opp_set_supported_hw(&pdev->dev,
-						       &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(tegra->opp_table);
+	opp_table = devm_pm_opp_set_supported_hw(&pdev->dev,
+						 &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(opp_table);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
 		return err;
 	}
 
-	err = dev_pm_opp_of_add_table(&pdev->dev);
+	err = devm_pm_opp_of_add_table(&pdev->dev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
-		goto put_hw;
+		return err;
 	}
 
 	err = clk_prepare_enable(tegra->clock);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to prepare and enable ACTMON clock\n");
-		goto remove_table;
+		return err;
 	}
 
 	err = reset_control_reset(tegra->reset);
@@ -917,10 +917,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 disable_clk:
 	clk_disable_unprepare(tegra->clock);
-remove_table:
-	dev_pm_opp_of_remove_table(&pdev->dev);
-put_hw:
-	dev_pm_opp_put_supported_hw(tegra->opp_table);
 
 	return err;
 }
@@ -935,9 +931,6 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
 	reset_control_reset(tegra->reset);
 	clk_disable_unprepare(tegra->clock);
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_supported_hw(tegra->opp_table);
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
