Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88782E920A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258489DA9;
	Mon,  4 Jan 2021 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474DE89895;
 Sun,  3 Jan 2021 03:56:31 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id e2so12643329plt.12;
 Sat, 02 Jan 2021 19:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MBqnkb35Yx+XB2qacn+GMSgP3vvOS1DmQn6mAoUxAko=;
 b=psBWJqf/IihlpGW8zhb4mDcJKjwQwL+Nm74dbHhamfsUrv4kpAP9nx7m6wtoHcGIyS
 zgIy24UtjbfcuiB2Mq4FZXNkgeSVJ4YOCeiwYZMJ4w92AXNzd5SxxAPhquqd1v0gzfg1
 HKOxUvEoAAh/RqZLi7RJ+71UzMgXpnf3dGjA8q0fBY/dEsVhDAOER88azzWmRrKET8Au
 tBuEC+ePsePrdQ4WUIDmL+6lq96tHi96QNj+AUyarqZZGd+ntX++9/Xjfb4ZcANVlotm
 +3c0UsB9ziguJ86i5zONeSBsCLuU+6efKECn0W0P1t3marpfQ+gh0BDh2kyVAIBBkYv2
 IifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MBqnkb35Yx+XB2qacn+GMSgP3vvOS1DmQn6mAoUxAko=;
 b=Ij8i7oS+5Wma+bgDUSIE6nUuL31BXxnoumL1E6xCqqvtgTxR2gjDOrWxpoF9hCibvB
 rTVNV8PNjRAPmIgtFJmVM5WBCVLOdpWX5eIssiM0m0rnaZAPl25ZOtxYdmvIZIVvY3Dw
 +vjUg4p1/9gbE9F7csAstUgXgwLtgJMbuL+vZb9Fgo4T+Lx/AkyAj0TGsLZnFj6IrS98
 OEbTg/0FNVavzrlV+7bciKfP4u5eTEPtwq4UQTPx7J5sJp9ZuVIZCFjY+IiBlCfs/AVT
 aotvZdzaF6CV5gtcGR3WVWryDMD+bhfrdJJX+aREXr0F4fsUuHz/vuNON3bFvJU89DuM
 k5DA==
X-Gm-Message-State: AOAM532Y/NqZPo4q02feHF8bwic6YRTAEq41T/toxginXv84aC/x4o5Y
 4x9EA3OEn+SBeOdK893gUHc=
X-Google-Smtp-Source: ABdhPJw4rLAK7aVKo+4qowfteGr9aQhB933bY7H4Pkd1XY5luUUGGANfZdnT+MeSUMumccO7HG1M0g==
X-Received: by 2002:a17:902:6ac8:b029:da:d645:ab58 with SMTP id
 i8-20020a1709026ac8b02900dad645ab58mr45836977plt.25.1609646190921; 
 Sat, 02 Jan 2021 19:56:30 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id i25sm56066998pgb.33.2021.01.02.19.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:56:30 -0800 (PST)
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
Subject: [PATCH 29/31] PM / devfreq: imx-bus: convert to use devm_pm_opp_* API
Date: Sun,  3 Jan 2021 03:56:05 +0000
Message-Id: <20210103035605.23973-1-tiny.windzz@gmail.com>
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
 drivers/devfreq/imx-bus.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 4f38455ad742..ff26ef049b1b 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -61,7 +61,6 @@ static void imx_bus_exit(struct device *dev)
 {
 	struct imx_bus *priv = dev_get_drvdata(dev);
 
-	dev_pm_opp_of_remove_table(dev);
 	platform_device_unregister(priv->icc_pdev);
 }
 
@@ -123,7 +122,7 @@ static int imx_bus_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, priv);
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret < 0) {
 		dev_err(dev, "failed to get OPP table\n");
 		return ret;
@@ -141,18 +140,11 @@ static int imx_bus_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->devfreq)) {
 		ret = PTR_ERR(priv->devfreq);
 		dev_err(dev, "failed to add devfreq device: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
-	ret = imx_bus_init_icc(dev);
-	if (ret)
-		goto err;
-
-	return 0;
+	return imx_bus_init_icc(dev);
 
-err:
-	dev_pm_opp_of_remove_table(dev);
-	return ret;
 }
 
 static const struct of_device_id imx_bus_of_match[] = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
