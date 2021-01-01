Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDC2E91EF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC389D7F;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84789B96;
 Fri,  1 Jan 2021 16:59:11 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s21so12642801pfu.13;
 Fri, 01 Jan 2021 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nOrTUQDqcrp2yYz1ncMfAxE/wuO+TeNVbsnY/E5njVM=;
 b=FvhIcKL3gFiPC4MQWFrECdhBaInvbpXZajHPBTLO4leoKndbMVjn4PirVv/WrJBOWd
 gPiGbT+cLi0DEBGjhKn1pBYl+05SdRVH5gPrOY+ST5LgGpwDQIWF7ahuQ65u2CxR3GTk
 TZqaNidqcVUmoWXGnCk9YOAEE5ZUP1Hvbrj+Ke+oaTdDLfRiC06LnnxNv/rB43nh5zm1
 MMBCVkPeuFz0g3SbSJ4y85cNobRU37bLr+GAbX9CnuVVwbhPAgdttmqGThiT7vImAisd
 A4hDkGLn4Do9bCqON+9QKfOpz2a+px41iaIZyuV7Ul+YwTnUauP4UkGaBlCPNaEJMa5D
 gDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nOrTUQDqcrp2yYz1ncMfAxE/wuO+TeNVbsnY/E5njVM=;
 b=TZSjBXvGXEqP1ToYlK7JePTRpjJ+cTu1fdN6AThnXY6/SAYiho5Dxd3kaV/r7Krsua
 73YKYfzqqx6sIS/F95bq53VBv7aJgPeiXQ8ymY3EBZziZptRIQsI0dU+z1BX9ZD+BdOH
 DRf71kADytM/UocyVisEGPrZnBJdi9vo/Loh1ReEC1eHTrw4/uq/Thl9Q5mGPxGKUX/b
 +funoFliWB7ZsAEq0E64tYteYZYcbD8WsM8UJHvX/U1gTHhmCe3w+zOvVziQ0bkqQOqn
 OE4Mm3zEv5kvzyzTusOP6tVbNVNkl8nfb8b/AUpsIqdymg6abkVArjxbMO4QCxD8aP3k
 PccA==
X-Gm-Message-State: AOAM530Nk3CpZzjGQXVG557uL1ZK3KXn/YY+unRbDd9aUzZvFdaT9orH
 A6Mgcqc9VZw7yMUWthro8T0=
X-Google-Smtp-Source: ABdhPJx9/a2A0liu3B7BHFV2hGRrEo3CW6/DaLKHJLACZdl+Eayk3FGJay3TkpxphgxWPoYQuCchfQ==
X-Received: by 2002:a05:6a00:1596:b029:19d:96b8:6eab with SMTP id
 u22-20020a056a001596b029019d96b86eabmr56106663pfk.38.1609520351287; 
 Fri, 01 Jan 2021 08:59:11 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:59:10 -0800 (PST)
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
Subject: [PATCH 17/31] drm/lima: convert to use devm_pm_opp_* API
Date: Fri,  1 Jan 2021 16:54:53 +0000
Message-Id: <20210101165507.19486-18-tiny.windzz@gmail.com>
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

Use devm_pm_opp_* API to simplify code, and remove opp_table
from lima_devfreq.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 40 ++++++++---------------------
 drivers/gpu/drm/lima/lima_devfreq.h |  2 --
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..d5937cf86504 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -99,13 +99,6 @@ void lima_devfreq_fini(struct lima_device *ldev)
 		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
 		devfreq->devfreq = NULL;
 	}
-
-	dev_pm_opp_of_remove_table(ldev->dev);
-
-	dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
-	dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
-	devfreq->regulators_opp_table = NULL;
-	devfreq->clkname_opp_table = NULL;
 }
 
 int lima_devfreq_init(struct lima_device *ldev)
@@ -125,15 +118,11 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
-		goto err_fini;
-	}
-
-	ldevfreq->clkname_opp_table = opp_table;
+	opp_table = devm_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 
-	opp_table = dev_pm_opp_set_regulators(dev,
+	opp_table = devm_pm_opp_set_regulators(dev,
 					      (const char *[]){ "mali" },
 					      1);
 	if (IS_ERR(opp_table)) {
@@ -141,24 +130,20 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-			goto err_fini;
-	} else {
-		ldevfreq->regulators_opp_table = opp_table;
+			return ret;
 	}
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret)
-		goto err_fini;
+		return ret;
 
 	lima_devfreq_reset(ldevfreq);
 
 	cur_freq = clk_get_rate(ldev->clk_gpu);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp)) {
-		ret = PTR_ERR(opp);
-		goto err_fini;
-	}
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
 
 	lima_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
@@ -167,8 +152,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 	if (IS_ERR(devfreq)) {
 		dev_err(dev, "Couldn't initialize GPU devfreq\n");
-		ret = PTR_ERR(devfreq);
-		goto err_fini;
+		return PTR_ERR(devfreq);
 	}
 
 	ldevfreq->devfreq = devfreq;
@@ -180,10 +164,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 		ldevfreq->cooling = cooling;
 
 	return 0;
-
-err_fini:
-	lima_devfreq_fini(ldev);
-	return ret;
 }
 
 void lima_devfreq_record_busy(struct lima_devfreq *devfreq)
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 2d9b3008ce77..c3bcae76ca07 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -15,8 +15,6 @@ struct lima_device;
 
 struct lima_devfreq {
 	struct devfreq *devfreq;
-	struct opp_table *clkname_opp_table;
-	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
 
 	ktime_t busy_time;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
