Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB12E91FD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605E289E0C;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCFC89895;
 Sun,  3 Jan 2021 03:55:58 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id iq13so7827436pjb.3;
 Sat, 02 Jan 2021 19:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SxpOyeiM3z18aNMuDs4uqaleFHYcq3v3an1mAR1G/5I=;
 b=AfqoZriugPzwzYSNyVjK7DhI0hUXwCi2rh6VXlP87GQQa5fjpFiZGRGOKaa2bVC6qS
 KNUGWoDbWwi99UvbXCoiMLncRbhKM90XVtGVix8wNxybq0PPu1+ANZovkGJ756+3RFhR
 zP9nG/12bnrj5Ey60RFSl4qHGJol0jCLf9L4aQm1kwh4H56RYa/55+iY9tIgt++AW74x
 mXgK8k3GTn0nq6GOCImWE6OxFd8cyGibeXduGU/UJnKTASfEHM+ZKRR8oQI5JGn3qfJV
 M83qVzQsm8/sxJuz1JjMaoaibL2VVkB00j++VrDnODpsrfBQfYod9P5VyZH8xa8sT7su
 muLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SxpOyeiM3z18aNMuDs4uqaleFHYcq3v3an1mAR1G/5I=;
 b=RP5h7JqSDZXCFeSfJ62ZJlrVghDKb5hYhlTEAExvd2RoswTzMORABOqb0JOKfUHz+N
 KaeBwEU4zmtMEti7nhshh3Ph1s4AHqeQcuONFeaRJsStQindCkfMfh5/c8tyjgVAhl8a
 vzZ2XNEVWHHitNXmmDJtn5unzFiO+41VfiK+Qhy00v7n/V63zv1yjgNRLN4H08vTQX5L
 kRX2w8SuOP6q2ta+1tcRARUEU8mUhL2LNqKvmX4+Gc+IxvgW2UL4q+2kscgey6JBpK/z
 TWMjf+oZOYKtyv9LE4yaShdjun1c5GFKe13Kf0iJFnLJ4MuMFjnMUvrSixMscRJ9z4hy
 WTNw==
X-Gm-Message-State: AOAM533y6ERegSjOOCtPV2RxYJy7bCHtnoUODXYRRNEAjjNnYCms19cK
 QF8l7Z3F4Atdgw6KN5t1iJs=
X-Google-Smtp-Source: ABdhPJw9UCd2o0dVAOrYYYoU83PIRdrJPypmz/g74Y1c9s2nzpejBc2/fDlERUdGOBi5P6mnd+gbww==
X-Received: by 2002:a17:902:7489:b029:da:5aed:8ebf with SMTP id
 h9-20020a1709027489b02900da5aed8ebfmr66298619pll.35.1609646158201; 
 Sat, 02 Jan 2021 19:55:58 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id f67sm45500049pfg.159.2021.01.02.19.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:55:57 -0800 (PST)
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
Subject: [PATCH 28/31] PM / devfreq: imx8m-ddrc: convert to use devm_pm_opp_*
 API
Date: Sun,  3 Jan 2021 03:55:40 +0000
Message-Id: <20210103035540.23886-1-tiny.windzz@gmail.com>
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
 drivers/devfreq/imx8m-ddrc.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index bc82d3653bff..9383d6e5538b 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -370,11 +370,6 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	return 0;
 }
 
-static void imx8m_ddrc_exit(struct device *dev)
-{
-	dev_pm_opp_of_remove_table(dev);
-}
-
 static int imx8m_ddrc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -419,7 +414,7 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret < 0) {
 		dev_err(dev, "failed to get OPP table\n");
 		return ret;
@@ -427,12 +422,11 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
 
 	ret = imx8m_ddrc_check_opps(dev);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	priv->profile.polling_ms = 1000;
 	priv->profile.target = imx8m_ddrc_target;
 	priv->profile.get_dev_status = imx8m_ddrc_get_dev_status;
-	priv->profile.exit = imx8m_ddrc_exit;
 	priv->profile.get_cur_freq = imx8m_ddrc_get_cur_freq;
 	priv->profile.initial_freq = clk_get_rate(priv->dram_core);
 
@@ -441,13 +435,8 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->devfreq)) {
 		ret = PTR_ERR(priv->devfreq);
 		dev_err(dev, "failed to add devfreq device: %d\n", ret);
-		goto err;
 	}
 
-	return 0;
-
-err:
-	dev_pm_opp_of_remove_table(dev);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
