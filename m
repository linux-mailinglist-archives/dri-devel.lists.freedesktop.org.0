Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0D2E91FE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D72689DC2;
	Mon,  4 Jan 2021 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4CF89895;
 Sun,  3 Jan 2021 03:55:33 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id n10so16583279pgl.10;
 Sat, 02 Jan 2021 19:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y7HzXQDsnmIGgDTOmDGILMwV02kIMjNKdm8ZKEdeXsg=;
 b=eotmQVpxVreVKXR3oezT+9H2WsardzWH1A4dZzoFoLIXCTMWKe9iaoIfuRs0IZr0Ii
 xhSF5IcF8dP4L5taLEStTtfKdfbcFVu8m2GrnVFBVg4ujy0hOAV6WPVweG9JJBBJT/y0
 5oVwwvgcmAy78H6McatzbUhblbZnRMHRrRP6rMC8HQztdvRWL8LEAzg8pUVsLmEP+q61
 yeurrF1M5OAMvFPVKvm8kI4lRijYtowPU6kmkh784bshJDfvlXOtsG0wHW2pm7T5d75u
 qmH1I+lAE7FQDM/ZhK4Rafnx7zSYSzxvReptopRtapiqcSt38bNkR9341aSb6u7goV6r
 PG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y7HzXQDsnmIGgDTOmDGILMwV02kIMjNKdm8ZKEdeXsg=;
 b=mJOuLy57eZRSKsbDWgQtpXHj09p5rzja7i08jbMfa7QlQKoFqNu0De8spmabyCYU0o
 eWLQ9cOJs6Bn4w4TcprdYlEMfUryD7jfgED5TZIVAjF065ng++rATHMtRWuCocz+ioiM
 ZjCb3KREoa9MgaDLiXJ3IM0Dd8ROtemUW3Hr6QlnN4kr+q+J2KSS4E4KBB9RHT3D+eM4
 g5JyBXI00KxwizyV/0YQLx3DqBTi/jCOZDE+tKrJiCr92LlqE08ft3VXyQa2DsUMcSX+
 7ArSSkOmaCePuMi/1DSxZZkhgK/Uzw1BNt3dyqa/1iaFhtBab80BD5GIhCOu4iCla5L2
 BVeg==
X-Gm-Message-State: AOAM5323sUqWuI2J7nMo+74qETHTCgRsgswvxET6cOIAjc4HW1R+DONu
 65BqLTTR59jqKAW1WdV7GjA=
X-Google-Smtp-Source: ABdhPJxbG4x+2xe/jKFrc0z4c/mz7QZfjYFTZamqCvYgW6Xt/IdV+YGfApUBbqxyjaHMHkPtOoCY4g==
X-Received: by 2002:aa7:9eda:0:b029:19d:ce86:f941 with SMTP id
 r26-20020aa79eda0000b029019dce86f941mr60065476pfq.57.1609646133007; 
 Sat, 02 Jan 2021 19:55:33 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id c13sm53063490pfp.147.2021.01.02.19.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:55:32 -0800 (PST)
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
Subject: [PATCH 27/31] PM / devfreq: rk3399_dmc: convert to use devm_pm_opp_*
 API
Date: Sun,  3 Jan 2021 03:55:14 +0000
Message-Id: <20210103035514.23788-1-tiny.windzz@gmail.com>
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

Use devm_pm_opp_* API to simplify code. Since devres release
can guarantee the order, let's remove
devm_devfreq_unregister_opp_notifier().

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/devfreq/rk3399_dmc.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index 2e912166a993..9b8ab8be29d1 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -432,7 +432,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
 	 * We add a devfreq driver to our parent since it has a device tree node
 	 * with operating points.
 	 */
-	if (dev_pm_opp_of_add_table(dev)) {
+	if (devm_pm_opp_of_add_table(dev)) {
 		dev_err(dev, "Invalid operating-points in device tree.\n");
 		ret = -EINVAL;
 		goto err_edev;
@@ -448,7 +448,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
 	opp = devfreq_recommended_opp(dev, &data->rate, 0);
 	if (IS_ERR(opp)) {
 		ret = PTR_ERR(opp);
-		goto err_free_opp;
+		goto err_edev;
 	}
 
 	data->rate = dev_pm_opp_get_freq(opp);
@@ -463,7 +463,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
 					   &data->ondemand_data);
 	if (IS_ERR(data->devfreq)) {
 		ret = PTR_ERR(data->devfreq);
-		goto err_free_opp;
+		goto err_edev;
 	}
 
 	devm_devfreq_register_opp_notifier(dev, data->devfreq);
@@ -473,27 +473,12 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free_opp:
-	dev_pm_opp_of_remove_table(&pdev->dev);
 err_edev:
 	devfreq_event_disable_edev(data->edev);
 
 	return ret;
 }
 
-static int rk3399_dmcfreq_remove(struct platform_device *pdev)
-{
-	struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(&pdev->dev);
-
-	/*
-	 * Before remove the opp table we need to unregister the opp notifier.
-	 */
-	devm_devfreq_unregister_opp_notifier(dmcfreq->dev, dmcfreq->devfreq);
-	dev_pm_opp_of_remove_table(dmcfreq->dev);
-
-	return 0;
-}
-
 static const struct of_device_id rk3399dmc_devfreq_of_match[] = {
 	{ .compatible = "rockchip,rk3399-dmc" },
 	{ },
@@ -502,7 +487,6 @@ MODULE_DEVICE_TABLE(of, rk3399dmc_devfreq_of_match);
 
 static struct platform_driver rk3399_dmcfreq_driver = {
 	.probe	= rk3399_dmcfreq_probe,
-	.remove = rk3399_dmcfreq_remove,
 	.driver = {
 		.name	= "rk3399-dmc-freq",
 		.pm	= &rk3399_dmcfreq_pm,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
