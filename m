Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FA2E920D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5F89DC9;
	Mon,  4 Jan 2021 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CE0899C4;
 Sun,  3 Jan 2021 03:54:35 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id c22so16552940pgg.13;
 Sat, 02 Jan 2021 19:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=upHhoKMhwNycSsUSkWTDTZGGHEnMJMcgkEoZXl3LtcE=;
 b=A0sZKpRKEBmumkd+j40q8l8w0e6Orse8JgJFhy/apGOP6iLFx6yB45mUGQ3MmclC6c
 aR+upeNFhOcGYl2SuGmLC68lbqb66N0Luch93M4VZnz8y5nA00724FAkKZ1GsUFgn0nE
 NttE5XTiTT1LJDurD4XhqCx9pZKnjMKKbMWWWzDaztkfl9FH/OLZzkkJjrTjif7SmuJK
 KzOZuPdeTHhfLh7oOVF89U3FWwLKk8mSCnt6MluhZWT6iu9SQ12bBD08gr36rkuw8W46
 d1TIUxb/h0PXu/rb0qbgH/H7X84Yw1SMEI+bJzPaLWqdLFW97uTXRl+bkRgHCgr4s43Y
 Mg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=upHhoKMhwNycSsUSkWTDTZGGHEnMJMcgkEoZXl3LtcE=;
 b=Z8/kXE0hLhusNyYyu6OX32m5nKiPlqW5C+HezH2WcGjlAXu+e0FrsMBDL4YbUK64y0
 YfkLPR775nazP8Buur8K67BH0B3dkGRIZzpgtehArmqJgcp7vguMt94XYvGZppHFXCLH
 +scCaOvQrM/emGcY8Ek88d0xRLdaBRdkzGkQBKM1MHHj7LobJYiwRKJZ+zAKoGZmudlR
 F/xqh4Px6FpBquhJX5iYx52bwUV4Si8hl1zNZuSnsESxfVWfGtciK7cPSvvE65N0g7hg
 PpIyQdSZgtuzALiy2ddqk+L7hXw+SqOFZSj7b0pVi9DOlh3PYYJhV0q33PB4MKu/qCFC
 bSUQ==
X-Gm-Message-State: AOAM531QYFxfjhn7dilBIdEfNh1ROhc+sgZcLdyopJPk+nA+NkD7uRmg
 k5XHtwTb0hUIvChuVNZ+gs0=
X-Google-Smtp-Source: ABdhPJxv/KIPydC4rwftQy4xrCraXrrFy9P+M3m1ZoKozY9r6GNMFOiNFe7kIU7sHqxKl0WT+nK2fw==
X-Received: by 2002:a65:6a09:: with SMTP id m9mr37744699pgu.51.1609646075302; 
 Sat, 02 Jan 2021 19:54:35 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id s67sm14054605pgb.60.2021.01.02.19.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:54:34 -0800 (PST)
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
Subject: [PATCH 25/31] memory: tegra30: convert to use devm_pm_opp_* API
Date: Sun,  3 Jan 2021 03:54:15 +0000
Message-Id: <20210103035415.23600-1-tiny.windzz@gmail.com>
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

Use devm_pm_opp_* API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 44ac155936aa..a93d8c3629fe 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1483,31 +1483,31 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
-	struct opp_table *clk_opp_table, *hw_opp_table;
+	struct opp_table *opp_table;
 	int err;
 
-	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
-	err = PTR_ERR_OR_ZERO(clk_opp_table);
+	opp_table = devm_pm_opp_set_clkname(emc->dev, NULL);
+	err = PTR_ERR_OR_ZERO(opp_table);
 	if (err) {
 		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
 		return err;
 	}
 
-	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(hw_opp_table);
+	opp_table = devm_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
+	err = PTR_ERR_OR_ZERO(opp_table);
 	if (err) {
 		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		goto put_clk_table;
+		return err;
 	}
 
-	err = dev_pm_opp_of_add_table(emc->dev);
+	err = devm_pm_opp_of_add_table(emc->dev);
 	if (err) {
 		if (err == -ENODEV)
 			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
 		else
 			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
 
-		goto put_hw_table;
+		return err;
 	}
 
 	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
@@ -1515,19 +1515,8 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 
 	/* first dummy rate-set initializes voltage state */
 	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
-	if (err) {
+	if (err)
 		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
-		goto remove_table;
-	}
-
-	return 0;
-
-remove_table:
-	dev_pm_opp_of_remove_table(emc->dev);
-put_hw_table:
-	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
 
 	return err;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
