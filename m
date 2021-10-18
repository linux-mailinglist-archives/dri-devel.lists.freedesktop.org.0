Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A04322EA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 17:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC666E0CF;
	Mon, 18 Oct 2021 15:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565C56E0CF;
 Mon, 18 Oct 2021 15:31:47 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t7so2173457pgl.9;
 Mon, 18 Oct 2021 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nAxUhiohFw8E/dLvkWEsSUAVxjPg+HfNNJoup320RQ=;
 b=Iw6xvvAIMSZXU1rGcGv1/MP6RkbVOHaOhHmf+XbrgHD7Byo3eOutTpfKGdTE7py/mO
 ekobRUrT8gXzEhSpjhgIxGvjNXJY8K9jvO6+pfdFpYjuvalzf1cx1cissMgwXqOddXzE
 Okgb2N4Pz5L9ySBd6Brjy5UryC19FCKDFBaPJncV/3Zfm5qv8fbnjNfR868PTNm//aHy
 T2KOb6AEhJItapcMBfYW17DvKxd0XbpNLCnGL+gIWK3x60uc852f3n5pewOupNxKgTvl
 99EjlD28hvO/cozcl3zqRAy6GtiVCXxe3wOC/CTiDLK01GkUzrs7ym5O64mtkvcC5RRx
 LTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nAxUhiohFw8E/dLvkWEsSUAVxjPg+HfNNJoup320RQ=;
 b=LkBQRWkuWAwEpIgutrn5oXEwIHUEf/dawITe9aVjlQJETXOj8+hbuNJmRmfTrdbOdb
 3FYDeYdPbl16qAWxnxHIsyP8J5+093lQsR/vxQ7F2pg0JwEQwjKKsDbXgN6eBKC+HAiD
 kOkPdRtwGM0aXyu42wX5UPoDg8pLvv7g7FKcXTGIcNErTgGib9H/G35eW9oVvCqWYmHR
 ff+Vmm3RE5sLFujo3Hus07VavBN4O0tKla/tIXM/cRXy1+HeP8kZa2vy7eSiJiNoZcnX
 dDrp2W/NIeWus7Tyz2F/Nh5tQjOHLHyyOT0a1lyPP+meVF07nF2AiAveg3GscE+iFEK0
 J1Jw==
X-Gm-Message-State: AOAM532cjY9C4plNe9xAhFElPRo35Kw2H+iqRbmbnl7lr2HWHBvMP8iT
 YN/EU/l7ZpnwSyaMI3feq8itAsDqseo=
X-Google-Smtp-Source: ABdhPJzx/67tRE7LZ74Xr3oWGr/dThMTUbbmMp7W2dP0iGjeZmkTK0a9FWEAz1ZK3N+YjdfeXd8HJA==
X-Received: by 2002:a62:7688:0:b0:44d:186d:c4bd with SMTP id
 r130-20020a627688000000b0044d186dc4bdmr29641892pfc.71.1634571106220; 
 Mon, 18 Oct 2021 08:31:46 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c27sm14233262pgb.89.2021.10.18.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:31:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
Date: Mon, 18 Oct 2021 08:36:25 -0700
Message-Id: <20211018153627.2787882-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Until we better understand the stability issues caused by frequent
frequency changes, lets limit them to a618.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Caleb/John, I think this should help as a workaround for the power
instability issues on a630.. could you give it a try?

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 ++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33da25b81615..267a880811d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1838,6 +1838,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
 		adreno_gpu->base.hw_apriv = true;
 
+	/*
+	 * For now only clamp to idle freq for devices where this is known not
+	 * to cause power supply issues:
+	 */
+	if (info && (info->revn == 618))
+		gpu->clamp_to_idle = true;
+
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 59870095ea41..59cdd00b69d0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -210,6 +210,10 @@ struct msm_gpu {
 	uint32_t suspend_count;
 
 	struct msm_gpu_state *crashstate;
+
+	/* Enable clamping to idle freq when inactive: */
+	bool clamp_to_idle;
+
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729b4616..8b7473f69cb8 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -214,7 +214,8 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 
 	idle_freq = get_freq(gpu);
 
-	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+	if (gpu->clamp_to_idle)
+		msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
 
 	df->idle_time = ktime_get();
 	df->idle_freq = idle_freq;
-- 
2.31.1

