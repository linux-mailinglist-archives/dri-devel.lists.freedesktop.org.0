Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DDBD393F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24C10E48D;
	Mon, 13 Oct 2025 14:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cNoYKg0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA810E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:16 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6318855a83fso9693670a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366115; x=1760970915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0CSe+Vq+fu1du/WruIHtASks3BoMmFt7VrBHSdFdfY=;
 b=cNoYKg0CnrewyRNlWAemzWTLYblYOZufbohV6sjqL5VnBymL8IbttL7++KMsD1KM3V
 RW+eNuhjnuDX3Lz46RSZzaJlS9I3milF5kjaozywEURaLNSh1hepEcnesd6N0ciQByWQ
 kh58pkpsZI2xJtbirb1fXDLPtdxKfPzvDMrbAopterINQNe+YN0SsxvcnCgdhyX7sCow
 j+17IjANHh9qFQsYXhDEWbK6l3857xeA9a3Qg3tNgFFyb4+PCNrB5UCUV8TdGx3j8ymn
 t30FiWzbSoEmKLrngIUvVRfXN9i8BsWb7V2l9tksuIyR/suBZOcrJTmT7V2eq7NeQ5vN
 Anow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366115; x=1760970915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0CSe+Vq+fu1du/WruIHtASks3BoMmFt7VrBHSdFdfY=;
 b=L4Szk3zIxmLrCxffFWkMBbBq54vE2WXDL+sOrVWt2ZOVyn2gTcZMEvi37Rv3DQOj+3
 werzdbCMYuQEJpGQlicJ89R1r7NnrHUnvLMPFoJODw0OJZffmu4Gvl3xe+h4esuDnu1M
 flRs8swbqIa4EBvI5BcBzBjLyXUNsAkBAZM6vrYTcEoW6RXlsQJwX1Qnpv8OjEX8A8md
 BXwdu9gafOsd56hDg8SQUyBXCbDQxVBFeV8GvYTXAQ/3bs9FJ8im//H/I0kpYba+GpLr
 1/n373wS+/ceSfa8VFkGsE0cuClmEtOfJx0DnGwA/CmIFKI2RkWs3wA/HHPhlTCS+4Ll
 LBlA==
X-Gm-Message-State: AOJu0YzQaWVo01y1CBy6IBRK4t6FKWEU3daW9z4T7RzFN97pHhCJrhcC
 4JQ0u5gFw8Or7tcd1br5GlC7+9O8bnKaImuzuXJAGJatzTE8D5eSCEW1
X-Gm-Gg: ASbGnctkFN4QIN5JH1+LsaSTCLzjYbhVfZNHJlYD3HffHHEHcvahkgEUoVDChjDmNyV
 CaLrWST4+H/G4z0q1D6PMJW+1P3S0tLRDzHxwqJc4wC1I0rkJL/Q21RV6sQa10dDTeTxxwcJLjA
 3mA4j2bjzSnCJvc9efQofN9Sw5BFBEnUMztGhBhJZ4E77qY72wRyAYD0CVXocakTLKtZlCM7zA5
 KbAYqRVaL3M2OBsFhgifg7PXU8HwrIs1bQlxdenAt1R5CfkPUQBKLz7sQ/miYcBaOSXExbA/HhN
 5hWOX8pwl3xAhym6Hl3YbyJlRtiKs8IL8GuW9az+CcNCxEmguGU5JVdDELChmcJJnl5grr35yZM
 bgrB6cld2u4Tu3Mct/8c1Ez2x/zJ5sWzjihUo7nHmRPE17dUp0Fcz7AU=
X-Google-Smtp-Source: AGHT+IFyPfcbbuza955t3CZkwiaWRYXDIgxI8rg6290fvp/qHcZzB7/xefEdgV0gcu+fEZ2xRGv1gQ==
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id
 4fb4d7f45d1cf-639d5c75dbfmr19259428a12.36.1760366114700; 
 Mon, 13 Oct 2025 07:35:14 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/amdgpu: independence for the amdkfd_fence!
Date: Mon, 13 Oct 2025 15:48:41 +0200
Message-ID: <20251013143502.1655-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

This should allow amdkfd_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 36 +++++++------------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +--
 4 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 9e120c934cc1..35c59c784b7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #endif
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
+void amdkfd_fence_signal(struct dma_fence *f);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
 void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
@@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+static inline
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+}
+
 static inline
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 09c919f72b6c..69bca4536326 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 		if (!svm_range_schedule_evict_svm_bo(fence))
 			return true;
 	}
-	return false;
-}
-
-/**
- * amdkfd_fence_release - callback that fence can be freed
- *
- * @f: dma_fence
- *
- * This function is called when the reference count becomes zero.
- * Drops the mm_struct reference and RCU schedules freeing up the fence.
- */
-static void amdkfd_fence_release(struct dma_fence *f)
-{
-	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
-
-	/* Unconditionally signal the fence. The process is getting
-	 * terminated.
-	 */
-	if (WARN_ON(!fence))
-		return; /* Not an amdgpu_amdkfd_fence */
-
 	mmdrop(fence->mm);
-	kfree_rcu(f, rcu);
+	fence->mm = NULL;
+	return false;
 }
 
 /**
@@ -174,9 +154,19 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
+
+	if (fence) {
+		mmdrop(fence->mm);
+		fence->mm = NULL;
+	}
+	dma_fence_signal(f);
+}
+
 static const struct dma_fence_ops amdkfd_fence_ops = {
 	.get_driver_name = amdkfd_fence_get_driver_name,
 	.get_timeline_name = amdkfd_fence_get_timeline_name,
 	.enable_signaling = amdkfd_fence_enable_signaling,
-	.release = amdkfd_fence_release,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..779d7701bac9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1177,7 +1177,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 	synchronize_rcu();
 	ef = rcu_access_pointer(p->ef);
 	if (ef)
-		dma_fence_signal(ef);
+		amdkfd_fence_signal(ef);
 
 	kfd_process_remove_sysfs(p);
 	kfd_debugfs_remove_process(p);
@@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
 static int signal_eviction_fence(struct kfd_process *p)
 {
 	struct dma_fence *ef;
-	int ret;
 
 	rcu_read_lock();
 	ef = dma_fence_get_rcu_safe(&p->ef);
@@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
 	if (!ef)
 		return -EINVAL;
 
-	ret = dma_fence_signal(ef);
+	amdkfd_fence_signal(ef);
 	dma_fence_put(ef);
 
-	return ret;
+	return 0;
 }
 
 static void evict_process_worker(struct work_struct *work)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 91609dd5730f..01ce2d853602 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
 
 	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
 		/* We're not in the eviction worker. Signal the fence. */
-		dma_fence_signal(&svm_bo->eviction_fence->base);
+		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
 	dma_fence_put(&svm_bo->eviction_fence->base);
 	amdgpu_bo_unref(&svm_bo->bo);
 	kfree(svm_bo);
@@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	dma_fence_signal(&svm_bo->eviction_fence->base);
+	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
 
 	/* This is the last reference to svm_bo, after svm_range_vram_node_free
 	 * has been called in svm_migrate_vram_to_ram
-- 
2.43.0

