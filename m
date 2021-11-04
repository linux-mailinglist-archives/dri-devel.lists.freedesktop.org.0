Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A6444CA5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 01:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1FE6EBA5;
	Thu,  4 Nov 2021 00:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6526EBA5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 00:34:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id j5so6682502lja.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 17:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkfgnJaDUY04rNIV6or1h0npcgBkYvs6ev3vQOc1YF8=;
 b=ABG+aRHIXjpa0AddFi3FTUVOa4EtckWj5BNxOpbOmxbGBF6s7cZGz8cZhvbyxn0Fon
 IzCmeKBxyH0DAYWJvvpYSyDI5BSu7qlrHyL94cWjM7pZXuingC2Fi9+Fz1oKVWdvb6F9
 oD7zDZKBhlnh20m7K+7Y0eyermQoKAAf+z0G/52HQHC31sluTWwjihJE4ZJDH2wRgBRW
 igi0VnD4l7yPp8YJKBxCamtb7iNjjN8ICx4FPFZLLZV/Rff24KbODnvc5EvebrHhzszX
 /Wc0ZgnqWBAti81eGosrJPpX5UaYZoLC/3KC/8S9GfEOSPx3Gh0A6X9tdpbNMZiHo5nz
 lpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkfgnJaDUY04rNIV6or1h0npcgBkYvs6ev3vQOc1YF8=;
 b=sxctHeFUNqNyW6/KABbNUt0pPI7tvzjGVOc8WQnChmSc51Thl42aMZX2RU3d4Tt+xW
 I+cfbqdDiVE2k7Njtt9Bd/bBkCL/fiS0nnAhWsPj0bSTYz/kx1SRW9jkfYMkp0lU1wDY
 kZwqgeRoxQ19ljOHwNyVlvFRpFt2raB6TmcdMbi36ZpKY6btXuj3nLXCLhPzHVje6Z8e
 alKDDRyaSHOLw6TCB1I3qv/QGcp65SycZ/j7w5Q0J08q00GD8h503NVHpBL2k9n9V6zs
 q2sh6sz4X8W49oG1AJ5hUyeM2BRHSFk67qsJUPa/CUH67pOhtRQf1z8iF+UgpN8VeWIE
 gdxg==
X-Gm-Message-State: AOAM533cAfjrI2303cXpJShweS96MsAVS65vhqoVRMmoig6+XBgDhJJu
 /ccYMqNniAzVshBtznJz170SUw==
X-Google-Smtp-Source: ABdhPJzCkR0IM+3ESKrRBralZgsMmASvHaJQoJHxxl87GrbiEH4Snc0/oybL5kI9s7tu9GjaAWf8/g==
X-Received: by 2002:a2e:8447:: with SMTP id u7mr49489401ljh.179.1635986069265; 
 Wed, 03 Nov 2021 17:34:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f4sm312128lfr.43.2021.11.03.17.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:34:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/mdp5: drop vdd regulator
Date: Thu,  4 Nov 2021 03:34:28 +0300
Message-Id: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "vdd" regulator was used by the mdp5 driver only on downstream
kernels, where the GDSC is represented as a regulator. On all current
kernels the MDSS_GDSC is implemented as the power domain, removing the
need for this regulator. Remove it from the mdp5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 24 ++---------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index 2f4895bcb0b0..2ac8fd37c76b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -16,8 +16,6 @@ struct mdp5_mdss {
 
 	void __iomem *mmio, *vbif;
 
-	struct regulator *vdd;
-
 	struct clk *ahb_clk;
 	struct clk *axi_clk;
 	struct clk *vsync_clk;
@@ -189,8 +187,6 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
 	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
 	mdp5_mdss->irqcontroller.domain = NULL;
 
-	regulator_disable(mdp5_mdss->vdd);
-
 	pm_runtime_disable(dev->dev);
 }
 
@@ -238,31 +234,17 @@ int mdp5_mdss_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	/* Regulator to enable GDSCs in downstream kernels */
-	mdp5_mdss->vdd = devm_regulator_get(dev->dev, "vdd");
-	if (IS_ERR(mdp5_mdss->vdd)) {
-		ret = PTR_ERR(mdp5_mdss->vdd);
-		goto fail;
-	}
-
-	ret = regulator_enable(mdp5_mdss->vdd);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n",
-			ret);
-		goto fail;
-	}
-
 	ret = devm_request_irq(dev->dev, platform_get_irq(pdev, 0),
 			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init irq: %d\n", ret);
-		goto fail_irq;
+		goto fail;
 	}
 
 	ret = mdss_irq_domain_init(mdp5_mdss);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
-		goto fail_irq;
+		goto fail;
 	}
 
 	mdp5_mdss->base.funcs = &mdss_funcs;
@@ -271,8 +253,6 @@ int mdp5_mdss_init(struct drm_device *dev)
 	pm_runtime_enable(dev->dev);
 
 	return 0;
-fail_irq:
-	regulator_disable(mdp5_mdss->vdd);
 fail:
 	return ret;
 }
-- 
2.33.0

