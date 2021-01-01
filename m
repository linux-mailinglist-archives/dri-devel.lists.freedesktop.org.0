Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A526B2E9204
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611589E0E;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20689C33;
 Fri,  1 Jan 2021 17:00:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id iq13so6294547pjb.3;
 Fri, 01 Jan 2021 09:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8tu+qmTBn19dJ5gPJsn24LjDSvHBfNF8Z6WeRyPnF0o=;
 b=mtSShWOVItM7MqI3Ko7jFbYK4A8hl8pYqozq5KjocZVA23lW9QNonT8PJHA8dcPpTT
 hLP9GVa6SmvfValVy1c405ZwzEV0OL2w8EJvYuIXLPZD3567ExhOEf1QTA05xlhKsnlM
 CdAiTFViPyb7B88OR5kDre0PQPAl/MVnvcCHw2erWjrZtZCkqQKVwutd47duJlNxQSIX
 uE9ZZYKMgni5Z5Oli1DM/qZA/Gbmg0iVW/cWOXgZWa4M4npQ6m2tKmWgL7TKn2N2Nsdv
 uQY1BK6fWL6j/nVNJ+loYM+pc2TfwSMBKRZoWz+r9WXKAB71He02AHNrxbpUVW0AoF6S
 4B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8tu+qmTBn19dJ5gPJsn24LjDSvHBfNF8Z6WeRyPnF0o=;
 b=n+3RbIdFCutDWLVSyXkdIl5+/K8kWeLr8okQ1ATscu/hizmjJZcjPzQtIzu+pHpDbu
 8negTmDkCbE3ebkcrdOIKYwwVj1Fsqwqmrpyn64/fhLcYJsfBUXArHiBvmsQC7mpEzHa
 gpQvfR9akmf3UOsWp1zmfMh98rhgqN253ExN7KvFJzBM4X5FzRtdC+TUoNC6xI1wcojf
 CHByoPtdHe9M3J/d+rawFQpluRA15EQ/1u6u207aJhzNMdOH0/1meX7NnJsesFffPTd1
 gKkkh8M1AaeITHM6MUfdSY0UkWbgwfqNlkh7mKDHE4ZaIdKs9eFWw8ivNwxMkoAHLMqK
 iqGQ==
X-Gm-Message-State: AOAM530ujy0geIzktsBGNC0m/PPodgqg8ZxE2YCEYBfUNMiBW/d5o+zt
 +T8Qy+EwDtyFa8OWRbLgf4E=
X-Google-Smtp-Source: ABdhPJxdcJSkAjLz7kwVtZIMVT7S93VrpqFpUMA6/+FN8KvXEJO8cvrLmP3NDvFgN9RfnewK7jzAFg==
X-Received: by 2002:a17:90b:46ca:: with SMTP id
 jx10mr18760999pjb.208.1609520438671; 
 Fri, 01 Jan 2021 09:00:38 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 09:00:38 -0800 (PST)
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
Subject: [PATCH 24/31] memory: tegra20: convert to use devm_pm_opp_* API
Date: Fri,  1 Jan 2021 16:55:00 +0000
Message-Id: <20210101165507.19486-25-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
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
 drivers/memory/tegra/tegra20-emc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 686aaf477d8a..223d9d97eb8f 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -911,31 +911,31 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_process_id);
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
@@ -943,19 +943,8 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 
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
