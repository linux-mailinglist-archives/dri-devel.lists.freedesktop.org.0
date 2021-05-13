Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9237FC41
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 19:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE00F6ED87;
	Thu, 13 May 2021 17:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43756ED85
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 17:17:32 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id h21so16519486qtu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=E7HOshN2Er3I4UfF4n/peggr8eR4WuZ8uunuphLdocHtt7r90Y53jO9WRxq3gY9C/I
 +x+X7fxwvAAqTj29LFiAwy5SBCiBJOc3mS3SozXZmTwnFOzVsC/lhKfisJYQLBd6chTk
 6669Oaxluf6lTGECVNHkmGNRi2Grbppi/gx1QYZEKO8naPyTQP3mtfUzqKcrNuB579Nh
 kikc2pmDEO62s0661xX04KgvWNd0mkIQx+Uc3uyk8Es630fRKDupdOcmOoskyfaTi8Gz
 qgPVhPp8ajSz9GNhbc+9cKmItvoyvjjjGDL2M1ESWiGwkBtHL4Emv/RZKBSVu2mnjrwL
 pG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=Ao9yb+Jhlgyjm+e5YKfKW7P+18nr5O8R+Yruy6oSRBfnoFH1aydV32/C+BZ3jf602J
 vdgkIbBhVK3mssLysTXpXj7AAtWPlPFuYjm1hqYr0MxoG8D4lXcVaab2NPwZbRv9DG9g
 KkkYHYEvJTY9OBn1XFLRAZNY005DiRFgC5m+lC2zk/u5jxKUZ+Hem06mgePWatzdb9CO
 0kFl5Muwkc/qA63S0s+jgu5QgkSXEa4zEbsEsJ6TPauT2F6wsNa6n+IbRxG3h7pOWG2k
 vbmBKj940THu6+ptjLXKBFOhcETGD70l9p/tvbkLvFJpvFTyOBZcStukspslV7d2gl+9
 GdrQ==
X-Gm-Message-State: AOAM532RQ8VUOfzMImROLMbZhzYKV4K4DdXk0dKo3pvewmcP+oBo5vR4
 lIJhx180bVW6h1YS3DSFnvGtJQ==
X-Google-Smtp-Source: ABdhPJynW10U6+pZDKPiqvMqVTGTcJYK/SyVqUlxAT1mqI+w5xVRJs3FIJt+9SBtPm/CN1CmeiTfaw==
X-Received: by 2002:ac8:7307:: with SMTP id x7mr38907975qto.144.1620926251991; 
 Thu, 13 May 2021 10:17:31 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:17:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/msm: remove unused icc_path/ocmem_icc_path
Date: Thu, 13 May 2021 13:13:56 -0400
Message-Id: <20210513171431.18632-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
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
 Jordan Crouse <jordan@cosmicpenguin.net>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
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

