Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A8978922
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 21:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AAA10ED4E;
	Fri, 13 Sep 2024 19:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGgB881q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9710ED4D;
 Fri, 13 Sep 2024 19:51:37 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2053a0bd0a6so26432985ad.3; 
 Fri, 13 Sep 2024 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726257096; x=1726861896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CB8jZGjPjnOyT8KVsrlJmg/A4Cpb/kxqtggkRJsoV9U=;
 b=eGgB881qm/khZaBKlh2m7gGJcknj0QF0kxPgDWJHYwTorjRrzG2Qb3kyi671uog/iD
 Fgjz1v7QuchTnZw9eu6d7iTAS/aL7VTMW9sGys6zfrcu8mBaRa0HVm5lSHLiO5XzNOyk
 1ecIdjc0Ip/mlK4t2Xn03Ec3igeLFoRrZ2qBEARq+4WmA2di87S/tpbl4EFV9Qma/7Kw
 r9dsSNH/215zjCkRVNE5T7ukoQ9gGLFhugDyDmcXcYN3HY36cAjCp567/zU/6FUZyMt4
 z/C3FUyNNtJbwT4i1MF2qv7nAXJmL9XlSDtTWQi0XSKr9Kn6n/vBxBw1kgYvZV9zY/eR
 a5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726257096; x=1726861896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CB8jZGjPjnOyT8KVsrlJmg/A4Cpb/kxqtggkRJsoV9U=;
 b=OgvLVxFgclddBf3msmljc43tzvjyiZkkWvZ3iFjeZopggaNO4dPPfAbKLThdq4zOmT
 e0JkOi9gedxjTVddZqE9Fjyte3SmGLyLaJ2qMl7rmu+UpXhdidlGgIwrHXQ1a46AfvlL
 zqiS/J4S2+GuDv8V7Fqc1InlTj2EUc0VVYfgfJxyqRihszLH/cqSphCzRqL35ACXYLeT
 3QTHmOHgJnTyD4BEE9MjkymqNnFkPK7Ndwi+4ChXVlvmd6CZju3/mwA5T9VigkntpbXi
 cECcSQaCIeMPQ2ZRmWjEjR5CSm5Rc0LkbKSFuH3OrlROllK94cwtlMApeHtMfz2YK6GP
 vcPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8wxiuDXfW0Q8XjE/wGNSOeRlffedEVPW1yW7t+e40o05RZs3quMNhDkj5KSEFl1TyExuM6ARo5sQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdJAVLw8wOGjuMtVb8ZOCR1sTWCDB0mVDuhDqYbyVC3R+BgEyf
 WJf+bKDOb5OFsfkO71HROInQF6ijxNwcGW4AajZCtGiSsSXs6Fxwz7G7eA==
X-Google-Smtp-Source: AGHT+IF2m8yqpRXDRCpHC9T48pLfZDaKaeeZwKrb5xVVqT8J3uKIrDGq4EO2eV7HtkaI2gEwjhuChA==
X-Received: by 2002:a17:902:f693:b0:205:68a4:b2d8 with SMTP id
 d9443c01a7336-2076e3155e9mr125176375ad.11.1726257096201; 
 Fri, 13 Sep 2024 12:51:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207945daa86sm169925ad.61.2024.09.13.12.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 12:51:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
Date: Fri, 13 Sep 2024 12:51:31 -0700
Message-ID: <20240913195132.8282-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
devices (x1-85, possibly others), it seems to pass that barrier while
there are still things in the event completion FIFO waiting to be
written back to memory.

Work around that by adding a fence wait before context switch.  The
CP_EVENT_WRITE that writes the fence is the last write from a submit,
so seeing this value hit memory is a reliable indication that it is
safe to proceed with the context switch.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..ba5b35502e6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 }
 
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
-		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
+		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	struct msm_file_private *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
 		return;
 
+	/* Wait for previous submit to complete before continuing: */
+	OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
+	OUT_RING(ring, 0);
+	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
+	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
+	OUT_RING(ring, submit->seqno - 1);
+
 	if (!sysprof) {
 		if (!adreno_is_a7xx(adreno_gpu)) {
 			/* Turn off protected mode to write to special registers */
@@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
@@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 
-	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
-- 
2.46.0

