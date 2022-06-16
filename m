Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5654DC5A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43D10FA47;
	Thu, 16 Jun 2022 07:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251210F6D1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:59:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y32so1012721lfa.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGNB/O3yb7InoceOz218JG2VBA+WBg1TNFmvlSb9qs4=;
 b=r+E2w2g7kU/m5Jr0w0Drcz2bPBn34gKqqSXBxG5d8BwyplJn7R7M7M2PiO6ne0VXZb
 mYxo66C5nVhVcpF+pE/0jhkLHlExdeRd2ShodhvuLcaMvmlJigkzuXRixRemaIuHxBdq
 cyaHn7pgSlCByF/+wDk105c1JF29pJ8Y8Xn1M/qjTIFGYlxZmnAVROKq2jGQ967qjnr+
 F37sZRCjG4i3EG/+vcJrb2D/yHnVjjIDZjpWjxWBcViG3iXdFdzmBPSNfJnBVL5BdMBA
 n5Hs1vTZIjNG/Lg+PQpdI3Xgeg2cFSeGpp6AKeAyGLe0/FxtG2SD0DNqbrI2yjSxJYSD
 LT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGNB/O3yb7InoceOz218JG2VBA+WBg1TNFmvlSb9qs4=;
 b=J/ePAihu3JqcTlYvxuY3PmpBgVRfE3YsfkTM9ixl6wLkS3FlNAHK/L+8zoeT8ahoel
 hIJl9tiUHgzgaQ5BDrozAo1oZXUdMMVW0zCq0q6FuJIjdcPzB+89FTplUPVo2xwEZIHv
 9l0/H4xoCFfqLg5MBnBNZltoK3Ib3QlXpTA2C3gLQV1qRAoIsbMcAXEeS9SIiC3MBhY8
 dhbCR0aoI2XmRhkaXdjhRFQz8TlHwFkBTxt6AMSJBiqZVJ1yqhkraFxOjA5an7FK4OxQ
 RABdfFINbvyhvIuO2BBMPqlRHGsP32ZBPuZNCSgPNdRqlKtPpIjxTCCcPkL357NXJcKj
 UWWw==
X-Gm-Message-State: AJIora8Y4KO7efmtKXZzGlhV7PGDyhATzsKmeBIA2ThWeHFypaKoHq3B
 NxejXQ9UHl2vx27VoUcoduA5HA==
X-Google-Smtp-Source: AGRyM1sx2nicYgg93ap4FUAhGh09GFwJWRgk3UeOuYV3q7MS9dXIEn4guklkp1o/i6NMcPNhrZLniQ==
X-Received: by 2002:a19:dc57:0:b0:479:5300:4e0e with SMTP id
 f23-20020a19dc57000000b0047953004e0emr2030677lfj.236.1655366391010; 
 Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/hdmi: drop constant resource names from platform
 config
Date: Thu, 16 Jun 2022 10:59:46 +0300
Message-Id: <20220616075947.347888-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All MSM HDMI devices use "core_physical" and "qfprom_physical" names for
register areas. Drop them from the platform config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 9 +++------
 drivers/gpu/drm/msm/hdmi/hdmi.h | 3 ---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9ff9a68b201b..8dfe5690366b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -133,7 +133,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
 
-	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
+	hdmi->mmio = msm_ioremap(pdev, "core_physical");
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
 		goto fail;
@@ -141,14 +141,14 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 
 	/* HDCP needs physical address of hdmi register */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		config->mmio_name);
+		"core_physical");
 	if (!res) {
 		ret = -EINVAL;
 		goto fail;
 	}
 	hdmi->mmio_phy_addr = res->start;
 
-	hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
+	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
 	if (IS_ERR(hdmi->qfprom_mmio)) {
 		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
 		hdmi->qfprom_mmio = NULL;
@@ -510,9 +510,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -ENXIO;
 	}
 
-	hdmi_cfg->mmio_name     = "core_physical";
-	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
-
 	dev->platform_data = hdmi_cfg;
 
 	hdmi = msm_hdmi_init(to_platform_device(dev));
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a6c88d157bc3..7263bcbf4d06 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,9 +84,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	const char *mmio_name;
-	const char *qfprom_mmio_name;
-
 	/* regulators that need to be on for hpd: */
 	const char **hpd_reg_names;
 	int hpd_reg_cnt;
-- 
2.35.1

