Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ADBAB8A20
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43B010E8EE;
	Thu, 15 May 2025 15:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TOn7AFnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6B10E8E9;
 Thu, 15 May 2025 15:00:44 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso10489245e9.0; 
 Thu, 15 May 2025 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747321243; x=1747926043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kt+ViwGsLDErFkNamffroJIY2ru6XGO1gjR2dC+Kcvo=;
 b=TOn7AFnwcY57oIn8jxhViHW7upmk1PvOtXzJVJ2hc+Q9zxvV4G5sBUW9bLbuWUj7xF
 Pyi2u0UbLtn3yRVHbTZ/pYptg93GWWCEFto8uBz3u7qIiO/HSu29K8gamWPjvQ0tkxTj
 bT2fpvYhDjubB3rL9kW9T79bMxHlt6zKVVg63SQ7Nw56DnDFf+gQ39ZpyO51WaWEeiSW
 5jCnK+H4QzG+/IDb4mAHiY5NUN9WzLGCf2yEzy1rUws0pGarFObynt5MXHHzlHtrQObq
 28TIRwyJ1d40p6dZBRFsd0PAgMzZomhDTl0nKzgLHCwYNtbN4x42kR0TATWihPsrJF0m
 FnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747321243; x=1747926043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kt+ViwGsLDErFkNamffroJIY2ru6XGO1gjR2dC+Kcvo=;
 b=JsXnCqVJJBbx4p9lAYesI4uhjLyqW9zS2KhmJEUUtyTKt0HcuP/ncvBKMFq6kwacwJ
 OnRiGXu8mrcA05wwYZ0VlePeUHIZOBKceX/XNxhCSP8a1lGTvfbz3yHbboi1W4ihwQHg
 Ok5Jn0YiNPPDJERChPQ3fZVwi7TYl+fDTgDjwNADxpKCnLFvpbTdaIOtxQIfXUZQwD8f
 kHxSqVqwymdecILXpg+14BtXYOeMLZ8dtp8d70E4xtX44M6tmfOx9NQb4qQh5NPTMuRh
 J8cZeBXCtoR+hA+l9eF0u4e8fr7LVDeTLqRTewv66Dh4ZlfnGWjRhfBoM1ra3GzdVulu
 sN0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoFLv6ripxHX1m2gXr6jt6jhafMjiybWSV59zD8oppYeb2Gfid91bhDlQjxDKEsg6Fiib3tz8r@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMTKKVEBtgzwd1Hox3g3FDH+5ryU5uH1neLFBL2fF0/qIadqlh
 t+XOoZedykaUdd9oMJzjLyd4/ie6W5vcv3Fa/+xq1qHaFq7kgia38hj7og==
X-Gm-Gg: ASbGncvrJ+YJIK5NhAlip0V2FuKMG3NYUfVfW8+NmLxieIpJh5jfuAlgvYzWT18PP/t
 UVxQJFs4CrKpck0ZxrNWDH09HCUtzMBLWHuODtAXL111w0+nSvvTJrb7gFDT8qKMsgmzI2vM9Xk
 5yT65VBZIht0jCGI4f6tebJ2Id171gfRQAHtnz316eMvXGDa7izQrHg+B+wc3pIO+9d5kd4ZLMH
 ZA9CNL/I9BpmbIV0FljRV0zkA3aD+Xc1ryLLFlmJJLcBOLXotR0t8cGWmzD+RoY6l1Wa6kDHWmc
 t84l3ZbNrOZs8QoeMNeFOTqMYfw7mI0dUsPhiuCu9x+uh4poOdT+3qDWJjP2Gtpv
X-Google-Smtp-Source: AGHT+IH6Tvy4C2I5Lwr4e2VXrloujj+OZiP+MF3mh/tLeKJWa/r7fkB1uHS3eokSFit9Z/Envc4XZQ==
X-Received: by 2002:a05:600c:3e88:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-442f20e0f2emr73256065e9.8.1747321242353; 
 Thu, 15 May 2025 08:00:42 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15b1:d600:9d43:bc40:55da:2532])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39e8578sm75808185e9.29.2025.05.15.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 08:00:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: fix gang submission error handling
Date: Thu, 15 May 2025 17:00:38 +0200
Message-Id: <20250515150038.4615-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515150038.4615-1-christian.koenig@amd.com>
References: <20250515150038.4615-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For the unlikely case that we ran into an ENOMEM while fixing up the gang
submission dependencies we can't clean up any more since the gang
members are already armed.

Fix this by using pre-allocated dependency slots and re-ordering the
code, also fix a double unref since the fence reference is also dropped
on error.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 49 +++++++++++++++-----------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82df06a72ee0..b50a5532f4c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1282,6 +1282,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_job *leader = p->gang_leader;
+	u32 fence_slots[AMDGPU_CS_GANG_SIZE];
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *gobj;
 	unsigned long index;
@@ -1289,36 +1290,23 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	uint64_t seq;
 	int r;
 
-	for (i = 0; i < p->gang_size; ++i)
-		drm_sched_job_arm(&p->jobs[i]->base);
-
+	/* Preallocate the memory for the gang dependencies */
 	for (i = 0; i < p->gang_size; ++i) {
-		struct dma_fence *fence;
-
-		if (p->jobs[i] == leader)
-			continue;
-
-		fence = &p->jobs[i]->base.s_fence->scheduled;
-		dma_fence_get(fence);
-		r = drm_sched_job_add_dependency(&leader->base, fence);
-		if (r) {
-			dma_fence_put(fence);
+		r = drm_sched_job_prealloc_dependency_slot(&leader->base,
+							   &fence_slots[i]);
+		if (r)
 			return r;
-		}
 	}
 
-	if (p->gang_size > 1) {
-		for (i = 0; i < p->gang_size; ++i)
-			amdgpu_job_set_gang_leader(p->jobs[i], leader);
-	}
-
-	/* No memory allocation is allowed while holding the notifier lock.
+	/*
+	 * No memory allocation is allowed while holding the notifier lock.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
 	 * added to BOs.
 	 */
 	mutex_lock(&p->adev->notifier_lock);
 
-	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
+	/*
+	 * If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
 	 */
 	r = 0;
@@ -1333,6 +1321,25 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
+	for (i = 0; i < p->gang_size; ++i)
+		drm_sched_job_arm(&p->jobs[i]->base);
+
+	for (i = 0; i < p->gang_size; ++i) {
+		struct dma_fence *fence;
+
+		if (p->jobs[i] == leader)
+			continue;
+
+		fence = dma_fence_get(&p->jobs[i]->base.s_fence->scheduled);
+		drm_sched_job_add_prealloc_dep(&leader->base, fence_slots[i],
+					       fence);
+	}
+
+	if (p->gang_size > 1) {
+		for (i = 0; i < p->gang_size; ++i)
+			amdgpu_job_set_gang_leader(p->jobs[i], leader);
+	}
+
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
 	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
 
-- 
2.34.1

