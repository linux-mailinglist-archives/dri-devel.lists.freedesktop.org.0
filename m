Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17252E91E9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8E989BA1;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C5389B96;
 Fri,  1 Jan 2021 16:57:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b8so11279553plx.0;
 Fri, 01 Jan 2021 08:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F/WPpPl1Y2V+ZuQ/3f5gGliaIHp/D14siqwLKMznygY=;
 b=ENVma3D0wKYDd0nhKbTeMlxg5anuR2s5IWLvunZO/1fBJgKY5iNCetO+aqVXUivOnw
 qlAaOGctYK5f8YLteGp1y+os+ACP4lTYrmUW+jVcnd198hEQSVBPTmylm6Nyl3mMd0X/
 2cnxylfaWb0KdeQV/K4LTwp3elEVWu7njUlFVAf8sqsWY4wpx1tGe8ZkjY+1kK/V1lzd
 lNebxa4G90GYtHFb2C/pZpw3aVjSiaZntZFUCk9Hqmu5wa9dNEBhE3BBHx9mRxGIeaRd
 4/6gDJ3/n4IG82Jzcy5e8W66PUMONsn4PvUo1OMtymZP80gSW4ARkXZbSlLcXthfqm3o
 PAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F/WPpPl1Y2V+ZuQ/3f5gGliaIHp/D14siqwLKMznygY=;
 b=ZgEPyZuvJtP7jK/temb6LSgl1PGPxkJ7PUOEvMoP+of/PLsOHp3NBoPyntXeFLKYC5
 MzgZDJWhvtVK7leLg11psAnCyBFPrM0UzRfdO8pJOjm3+Gk8rduXYyE8PnJ/NyPKbwCI
 HwTGybiGyi1duCdBOCqbag8rIKvBmvDD1GhAY4ce0iF88rlzLG4PbX48y09dFoiiSO05
 PmYzs8A1qJO+EfvoFrh9bZ3WVxhB8szZJ5oET3xEFHkB7hD/fvuxwBdmC5ANEftCKHTc
 nEx4UA9CouCNziH9gY5g8hXuN7XI1sjvH8BclsqdDl59DlG1hKRUKrPGpn8qVvAKWaT/
 o2uA==
X-Gm-Message-State: AOAM530t2W4tCMCqfToYOlEKJdsPFe746GgeR18a5k3GeUSlct29By13
 GgUSjuP3+2Em7VFdtQuq+aY=
X-Google-Smtp-Source: ABdhPJwN3a+tylYYOkBWZhvnWgkugep3Fs+zAJ5RKRkuMyfw7Ml6JnvpNbMtmrf2eIesHL27ttl/Ug==
X-Received: by 2002:a17:90b:224a:: with SMTP id
 hk10mr18256443pjb.81.1609520276252; 
 Fri, 01 Jan 2021 08:57:56 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:57:55 -0800 (PST)
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
Subject: [PATCH 11/31] mmc: sdhci-msm: fix potential mem leak in
 sdhci_msm_probe()
Date: Fri,  1 Jan 2021 16:54:47 +0000
Message-Id: <20210101165507.19486-12-tiny.windzz@gmail.com>
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

We should use dev_pm_opp_put_clkname() to free opp table each time
dev_pm_opp_of_add_table() got error.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sdhci-msm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 9c7927b03253..094ef95f5ecc 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2291,9 +2291,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
-		goto opp_put_clkname;
+	if (ret) {
+		dev_pm_opp_put_clkname(msm_host->opp_table);
+		if (ret != -ENODEV) {
+			dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+			goto bus_clk_disable;
+		}
 	}
 
 	/* Vote for maximum clock rate for maximum performance */
@@ -2461,7 +2464,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 				   msm_host->bulk_clks);
 opp_cleanup:
 	dev_pm_opp_of_remove_table(&pdev->dev);
-opp_put_clkname:
 	dev_pm_opp_put_clkname(msm_host->opp_table);
 bus_clk_disable:
 	if (!IS_ERR(msm_host->bus_clk))
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
