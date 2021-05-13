Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5F37F07E
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FB66E5C6;
	Thu, 13 May 2021 00:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03456E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:39:03 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id x8so24141340qkl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 17:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=U4o7cwX2QQVVTuDryXGCKWLw0coEb16npVBu/jFofLo4GTjmsF8dA6MYmsiPfPhL6k
 7aMlrAqXx/H6Pa4kuBluRMbfC247VwlqE0yooUKjYvApRKrTskwNrJBHYywJUAG2X7ZA
 VQXOMtLtIOPk3tDvIg5SVdRe9RAwpOkkNNNFBVO9EHxnkLiovJXusp6fgipw2FGdIazc
 cjmJd/iLu+KsJIxKRLXf4zI1sOEvxLypncNuNAUbrYar2eBfztYVQSj/RZ2iqy5QXSXb
 2xhLZY6lyGwAnZZBDNeBnBzMFx55muQBXIO7309s7AB4U2TuElmMFmNEZQZL0Ogeze8S
 WZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=DU42kYwoSxLLo02fOoAq9ohCFrVRa1+Dof2XpAiERm2u9RYfil3THD37XB0ZHCXxL8
 DA3m6nvmVTrpyCTuK24fDeceKGGoynm6EEvYThzbPNGEvB6mjTRaF3OKSjWExPMZqPzI
 l8uUiqbFgy1wNiPDf8nvipWhnVDYEHUSzoHBfRrLL2YMb5SAqGGmSGPY5wEkpvpGkcCU
 sUCRtqeQCsHjNePQPjIG0nx8oujHEGqv71k64vUfzZS88tk6F/lt9FclZbU9iI9UY/w5
 umNCsijmUGnO5afwBgAiaRW+zcns/6YXXf/eRhw8n2LL6zwi/1LGmhY8T7CdLulh78gi
 pqeQ==
X-Gm-Message-State: AOAM5305WjKIL51McRtDlZqshLRb4+9Uyxazx5KcYQppMf8mDg5B8a4l
 7u2CE9KBoWp1naICbwBngbCBnw==
X-Google-Smtp-Source: ABdhPJyDGD9edTt/pecm2J2HYiTGtCLsMV1PL5FrxPOMfc9PT5J5phKcxKXCTRi/AnZO7jbXTmddog==
X-Received: by 2002:a37:4017:: with SMTP id n23mr34108146qka.338.1620866343100; 
 Wed, 12 May 2021 17:39:03 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:39:02 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm: remove unused icc_path/ocmem_icc_path
Date: Wed, 12 May 2021 20:37:45 -0400
Message-Id: <20210513003811.29578-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These aren't used by anything anymore.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ---
 drivers/gpu/drm/msm/msm_gpu.h           | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8fd0777f2dc9..009f4c560f16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -946,7 +946,4 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-
-	icc_put(gpu->icc_path);
-	icc_put(gpu->ocmem_icc_path);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..c302ab7ffb06 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -118,15 +118,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	/* The gfx-mem interconnect path that's used by all GPU types. */
-	struct icc_path *icc_path;
-
-	/*
-	 * Second interconnect path for some A3xx and all A4xx GPUs to the
-	 * On Chip MEMory (OCMEM).
-	 */
-	struct icc_path *ocmem_icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.26.1

