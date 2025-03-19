Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58210A6917E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B210E526;
	Wed, 19 Mar 2025 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I522ojXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8410E536;
 Wed, 19 Mar 2025 14:55:55 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-224019ad9edso25559125ad.1; 
 Wed, 19 Mar 2025 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396155; x=1743000955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykRZx1zxGai8riCEOFUoLeUcHnk9mI1cgk2cvB/7auU=;
 b=I522ojXcc9Pp8Iwzp6lx4qjdlc2Ld/8F/u6d7aCqvWs/aYNgpeEy1gh71EiiM3A2Jj
 RGBIiYaA/eMQhZORJaXWkwIeTac+KL0lrbmI9/NPZIaIDxHX55lzGvpOIIhukkElqvD4
 /ftdhbUgGTA4ig0tCwsIApv2ynX2lcheZTyURtm5KXyk+bbD8MYgr0TZDyKBXixPjQvk
 yY9dAtjT8MJmnPRwkXF1c4uASSA6dCZz/qDYJ/UMZonNYoqj0pbgH4m6X5zS6qpg/r35
 MJH4xiXKoEJkqs+Qsj/gz2xfV8O8rr4v8b2ZBP3xA0JLMTux3rAxgC22ILRZ/ck80es7
 3xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396155; x=1743000955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykRZx1zxGai8riCEOFUoLeUcHnk9mI1cgk2cvB/7auU=;
 b=uPWU7D7Bx7jYBUMBhuygZV9Awcz1Cdm3KY5t/UBke5r133NDtvSlXvD7T5hcdZvY9d
 zNcgz4U/QJjrH5OCoj88GC/7SW/OwlqdqPeUChr1mM+kGqr6zkZfe5jfiRbr0YgFq0yS
 Cjd1iJ0HPz2HI/hyHxr/CD5cyil3uXHdGxg6jsh/7Z15AhA9bXolKCFImR/d/JHr6P7I
 ZuPw9M8WvovVvjfsFcglvtJAFJGotAvQ+t5Wd+SM2ty1eYVZDpJ+dgf7C81x9fSfli6A
 0/fTbTMP2lOGEN2LrZSNZ3Ow/NaILuiaZPXbLGF6D+0F+o9P6YFsWqq7Xh8yvi31OQ7z
 B5rw==
X-Gm-Message-State: AOJu0YxXMDM3j0hMmWBRZG4A+8L6TCfOWuqEoPv9KBP6HfBhIMNRGRAM
 JW93XrNT0d2OBots6rR3wAj+Pe6YPvealkmtlwSP0CFWN/Vep5X2kz/TAQ==
X-Gm-Gg: ASbGncsl0kZ4ObzzncFwpL8aXqw1+fLVi96dpRAWqi2wQdwp/OrU30+VU6tdbR0nEPv
 sIQIamfCehZGkfckHX+Mw4FuempwourKr0uhriHeciKh6KtHa8Xe04rUhzfCHIpv0Kntt0Q3qzl
 NBQsPDszKlDWPpRGBGOzeL4K5K4t1yYJWD3VbmyRW+wW3cTgfj2a/oyjxLm0p6JnZeDLNxJici+
 fxP/NQxvmNorYoXNPN/P4eZcdmqcaGJyL9wvbQHVu8z6ULpRi8mLjKlWV9hWyzpXB3y0JTK2tsE
 QhTHl3XpZtfN6wOdAq8s63EO4FiLtRRT8+q1sMm13kpsnlsGNUSAKyHaWnv0VNWVQD/A6fRZK90
 fivDGIM2Lrqd7ye48+j0=
X-Google-Smtp-Source: AGHT+IEVSY7Gut4/GrsN86Y6Sp1q/BM0Hd+KvVhzTdD7P8COT0VA6pKX3430prcbrjpzaGzHmvnQdw==
X-Received: by 2002:a17:903:4407:b0:223:397f:46be with SMTP id
 d9443c01a7336-22649ca8f5cmr48378535ad.47.1742396154522; 
 Wed, 19 Mar 2025 07:55:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-226273e1459sm42742005ad.145.2025.03.19.07.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 25/34] drm/msm: Pre-allocate VMAs
Date: Wed, 19 Mar 2025 07:52:37 -0700
Message-ID: <20250319145425.51935-26-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

Pre-allocate the VMA objects that we will need in the vm bind job.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  9 +++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  5 +++
 drivers/gpu/drm/msm/msm_gem_vma.c    | 60 ++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1622d557ea1f..cb76959fa8a8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -115,6 +115,9 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
 
+void msm_vma_job_prepare(struct msm_gem_submit *submit);
+void msm_vma_job_cleanup(struct msm_gem_submit *submit);
+
 struct msm_fence_context;
 
 /**
@@ -339,6 +342,12 @@ struct msm_gem_submit {
 
 	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
+
+	/* List of pre-allocated msm_gem_vma's, used to avoid memory allocation
+	 * in fence signalling path.
+	 */
+	struct list_head preallocated_vmas;
+
 	struct pid *pid;    /* submitting process */
 	bool bos_pinned : 1;
 	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 39a6e0418bdf..a9b3e6692db3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -80,6 +80,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->ident = atomic_inc_return(&ident) - 1;
 
 	INIT_LIST_HEAD(&submit->node);
+	INIT_LIST_HEAD(&submit->preallocated_vmas);
 
 	return submit;
 }
@@ -584,6 +585,9 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 {
 	int i;
 
+	if (submit_is_vmbind(submit))
+		msm_vma_job_cleanup(submit);
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
@@ -912,6 +916,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (submit_is_vmbind(submit)) {
+		msm_vma_job_prepare(submit);
 		ret = submit_get_pages(submit);
 	} else {
 		ret = submit_pin_vmas(submit);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 7d40b151aa95..5c7d44b004fb 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -258,6 +258,66 @@ static const struct drm_sched_backend_ops msm_vm_bind_ops = {
 	.free_job = msm_vma_job_free
 };
 
+/**
+ * msm_vma_job_prepare() - VM_BIND job setup
+ * @submit: the VM_BIND job
+ *
+ * Prepare for a VM_BIND job by pre-allocating various memory that will
+ * be required once the job runs.  Memory allocations cannot happen in
+ * the fence signalling path (ie. from job->run()) as that could recurse
+ * into the shrinker and potentially block waiting on the fence that is
+ * signalled when this job completes (ie. deadlock).
+ *
+ * Called after BOs are locked.
+ */
+void
+msm_vma_job_prepare(struct msm_gem_submit *submit)
+{
+	unsigned num_prealloc_vmas = 0;
+
+	for (int i = 0; i < submit->nr_bos; i++) {
+		unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
+
+		if (submit->bos[i].obj)
+			msm_gem_assert_locked(submit->bos[i].obj);
+
+		/*
+		 * OP_MAP/OP_MAP_NULL has one new VMA for the new mapping,
+		 * and potentially remaps with a prev and next VMA, for a
+		 * total of 3 new VMAs.
+		 *
+		 * OP_UNMAP could trigger a remap with either a prev or
+		 * next VMA, but not both.
+		 */
+		num_prealloc_vmas += (op == MSM_SUBMIT_BO_OP_UNMAP) ? 1 : 3;
+	}
+
+	while (num_prealloc_vmas-- > 0) {
+		struct msm_gem_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+		list_add_tail(&vma->base.rb.entry, &submit->preallocated_vmas);
+	}
+}
+
+/**
+ * msm_vma_job_cleanup() - cleanup after a VM_BIND job
+ * @submit: the VM_BIND job
+ *
+ * The counterpoint to msm_vma_job_prepare().
+ */
+void
+msm_vma_job_cleanup(struct msm_gem_submit *submit)
+{
+	struct drm_gpuva *vma;
+
+	while (!list_empty(&submit->preallocated_vmas)) {
+		vma = list_first_entry(&submit->preallocated_vmas,
+				       struct drm_gpuva,
+				       rb.entry);
+		list_del(&vma->rb.entry);
+		kfree(to_msm_vma(vma));
+	}
+}
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
-- 
2.48.1

