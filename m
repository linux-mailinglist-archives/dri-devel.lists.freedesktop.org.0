Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11A22E91E3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C789D57;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A789895;
 Sun,  3 Jan 2021 03:57:25 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id z21so16588012pgj.4;
 Sat, 02 Jan 2021 19:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bOqOQLWJhyl2a577YM0GR4m7krtGGKspJhBDUdooXQs=;
 b=LG0ARZRkjmTXrJorhu/jihm0Mi+5yzddGgU9D1bfoBGcEAyoou58vPzfDIyONWYqDI
 /4OAqr7Z/zf9ER+L2uOc24kSRn+qLmG4BY+JodzoFQF/B1c2wZHJyb4kvhKxgU+izRHv
 8MRgEhNgPrZuxzSLQRqYfuvGfcvCuVUoshvt9sl0r4QAtutdKDW05rcIQ9dBdwIO5K0F
 2hKHfKf0/Qu+0Hr5NyOotRE7Lw4UCKOU9MJ5nHdb3S33C4V0d4YDfF8LqHdXhsI1aUWM
 ZsJ6w1waDejbsq3kHUW0bKB81kH8ze/DhP8Yctb91F8FeL2e5BM/CTjg2bOh51mUiQqc
 m2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bOqOQLWJhyl2a577YM0GR4m7krtGGKspJhBDUdooXQs=;
 b=Zn4kNYMx1mE7UM/ictbG8izUhke+/RNRWwHqE8dOUzKOb270PI6qhmJHggZHkNsFFE
 tpR02ws6xfitrPpm9zwyWYyjpDACl1nk7jjMgBzlntr9ps2r6UuQ1dvRddKw8QygTYXJ
 PpaZH0Hg865e2HfXO2Kp4QTEDmGi+Rx5AZ2FrfvtMbfz1yQOBpk6qJZHR/IVYmS8Muhk
 akGlMti6YYFJswXxDR+0ZtsKc8wodTEb7BsJNK6MrrcLORnivtRpxfrPWCnyZD2eKdQj
 FW45ko0AJUtbt69Q4na3dC9Zys40VcW2JfGsCJ9NoMaHnbVJK7vGHW8JV1rq4+etsti9
 3GAA==
X-Gm-Message-State: AOAM530iCwfDVCUu2kHrV88bVWUmeXHXRQjMB7x25fVMk8wDeAOmL22d
 SqEVGdwZ1N0IbttaFScW2sY=
X-Google-Smtp-Source: ABdhPJz6zhBwhrRUfur/KM3Xc29SF2oYTEQF68P1OftsFEJ1idogWYGRJDx/+HEraVeVhoNlpuXM5Q==
X-Received: by 2002:a63:db54:: with SMTP id x20mr52218787pgi.200.1609646245532; 
 Sat, 02 Jan 2021 19:57:25 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id h12sm55934950pgs.7.2021.01.02.19.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 19:57:24 -0800 (PST)
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
Subject: [PATCH 31/31] PM / devfreq: convert to devm_pm_opp_register_notifier
 and remove unused API
Date: Sun,  3 Jan 2021 03:57:06 +0000
Message-Id: <20210103035706.24168-1-tiny.windzz@gmail.com>
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
 drivers/devfreq/devfreq.c | 66 +--------------------------------------
 include/linux/devfreq.h   | 23 --------------
 2 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 6aa10de792b3..f593f30529ec 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -2004,40 +2004,6 @@ struct dev_pm_opp *devfreq_recommended_opp(struct device *dev,
 }
 EXPORT_SYMBOL(devfreq_recommended_opp);
 
-/**
- * devfreq_register_opp_notifier() - Helper function to get devfreq notified
- *				     for any changes in the OPP availability
- *				     changes
- * @dev:	The devfreq user device. (parent of devfreq)
- * @devfreq:	The devfreq object.
- */
-int devfreq_register_opp_notifier(struct device *dev, struct devfreq *devfreq)
-{
-	return dev_pm_opp_register_notifier(dev, &devfreq->nb);
-}
-EXPORT_SYMBOL(devfreq_register_opp_notifier);
-
-/**
- * devfreq_unregister_opp_notifier() - Helper function to stop getting devfreq
- *				       notified for any changes in the OPP
- *				       availability changes anymore.
- * @dev:	The devfreq user device. (parent of devfreq)
- * @devfreq:	The devfreq object.
- *
- * At exit() callback of devfreq_dev_profile, this must be included if
- * devfreq_recommended_opp is used.
- */
-int devfreq_unregister_opp_notifier(struct device *dev, struct devfreq *devfreq)
-{
-	return dev_pm_opp_unregister_notifier(dev, &devfreq->nb);
-}
-EXPORT_SYMBOL(devfreq_unregister_opp_notifier);
-
-static void devm_devfreq_opp_release(struct device *dev, void *res)
-{
-	devfreq_unregister_opp_notifier(dev, *(struct devfreq **)res);
-}
-
 /**
  * devm_devfreq_register_opp_notifier() - Resource-managed
  *					  devfreq_register_opp_notifier()
@@ -2047,40 +2013,10 @@ static void devm_devfreq_opp_release(struct device *dev, void *res)
 int devm_devfreq_register_opp_notifier(struct device *dev,
 				       struct devfreq *devfreq)
 {
-	struct devfreq **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_devfreq_opp_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = devfreq_register_opp_notifier(dev, devfreq);
-	if (ret) {
-		devres_free(ptr);
-		return ret;
-	}
-
-	*ptr = devfreq;
-	devres_add(dev, ptr);
-
-	return 0;
+	return devm_pm_opp_register_notifier(dev, &devfreq->nb);
 }
 EXPORT_SYMBOL(devm_devfreq_register_opp_notifier);
 
-/**
- * devm_devfreq_unregister_opp_notifier() - Resource-managed
- *					    devfreq_unregister_opp_notifier()
- * @dev:	The devfreq user device. (parent of devfreq)
- * @devfreq:	The devfreq object.
- */
-void devm_devfreq_unregister_opp_notifier(struct device *dev,
-					 struct devfreq *devfreq)
-{
-	WARN_ON(devres_release(dev, devm_devfreq_opp_release,
-			       devm_devfreq_dev_match, devfreq));
-}
-EXPORT_SYMBOL(devm_devfreq_unregister_opp_notifier);
-
 /**
  * devfreq_register_notifier() - Register a driver with devfreq
  * @devfreq:	The devfreq object.
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index b6d3bae1c74d..aca2cc4f4fa4 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -230,14 +230,8 @@ int update_devfreq(struct devfreq *devfreq);
 /* Helper functions for devfreq user device driver with OPP. */
 struct dev_pm_opp *devfreq_recommended_opp(struct device *dev,
 				unsigned long *freq, u32 flags);
-int devfreq_register_opp_notifier(struct device *dev,
-				struct devfreq *devfreq);
-int devfreq_unregister_opp_notifier(struct device *dev,
-				struct devfreq *devfreq);
 int devm_devfreq_register_opp_notifier(struct device *dev,
 				struct devfreq *devfreq);
-void devm_devfreq_unregister_opp_notifier(struct device *dev,
-				struct devfreq *devfreq);
 int devfreq_register_notifier(struct devfreq *devfreq,
 				struct notifier_block *nb,
 				unsigned int list);
@@ -355,29 +349,12 @@ static inline struct dev_pm_opp *devfreq_recommended_opp(struct device *dev,
 	return ERR_PTR(-EINVAL);
 }
 
-static inline int devfreq_register_opp_notifier(struct device *dev,
-					struct devfreq *devfreq)
-{
-	return -EINVAL;
-}
-
-static inline int devfreq_unregister_opp_notifier(struct device *dev,
-					struct devfreq *devfreq)
-{
-	return -EINVAL;
-}
-
 static inline int devm_devfreq_register_opp_notifier(struct device *dev,
 					struct devfreq *devfreq)
 {
 	return -EINVAL;
 }
 
-static inline void devm_devfreq_unregister_opp_notifier(struct device *dev,
-					struct devfreq *devfreq)
-{
-}
-
 static inline int devfreq_register_notifier(struct devfreq *devfreq,
 					struct notifier_block *nb,
 					unsigned int list)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
