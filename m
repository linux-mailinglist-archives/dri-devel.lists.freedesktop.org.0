Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671AA82444
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7510E86B;
	Wed,  9 Apr 2025 12:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HSK2iBLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A5410E868;
 Wed,  9 Apr 2025 12:07:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B111E61364;
 Wed,  9 Apr 2025 12:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F806C4CEE8;
 Wed,  9 Apr 2025 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744200447;
 bh=8tSyAH4I72tVt6uZZ6CfbV+83IhFZnn7M3vNJ9sVpBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HSK2iBLfybpU2dmb53vGD6As/IPih5zhKzJKCqD2V7aprvxYKoc5/00dCuFSqFeyH
 5AFQaIL6IP30r5/7KnuI4UbPbIadQjJLBsPYaiiqTIYeB9eHTWotWeRwQ7GKiPQUaw
 AU/tCuYGu4QInj0FFwf+Qa4PRqYws20iSpTjywVhtfFdsXfXdEDG0p7ID7YH1sRVlH
 ZhunkEpvpz0QtUZaA/GhZO88+AGEeJVinw3bngaROmyT3VWJYy2IMjMI+LQagzZPX6
 FddweSikyILaM2GZNdU2ACV0xKIUMjWK0sZ+OLvSErV3ctmmrd7UrVNsUopuaF4yXM
 q0NrDxVTelaig==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
Date: Wed,  9 Apr 2025 14:06:37 +0200
Message-ID: <20250409120640.106408-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250409120640.106408-2-phasta@kernel.org>
References: <20250409120640.106408-2-phasta@kernel.org>
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

dma_fence_is_signaled()'s name strongly reads as if this function were
intended for checking whether a fence is already signaled. Also the
boolean it returns hints at that.

The function's behavior, however, is more complex: it can check with a
driver callback whether the hardware's sequence number indicates that
the fence can already be treated as signaled, although the hardware's /
driver's interrupt handler has not signaled it yet. If that's the case,
the function also signals the fence.

(Presumably) this has caused a bug in Nouveau (unknown commit), where
nouveau_fence_done() uses the function to check a fence, which causes a
race.

Give the function a more obvious name.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence-array.c             |  2 +-
 drivers/dma-buf/dma-fence-chain.c             |  6 +++---
 drivers/dma-buf/dma-fence-unwrap.c            |  4 ++--
 drivers/dma-buf/dma-fence.c                   |  6 +++---
 drivers/dma-buf/dma-resv.c                    |  6 +++---
 drivers/dma-buf/st-dma-fence-chain.c          | 10 ++++-----
 drivers/dma-buf/st-dma-fence.c                |  8 +++----
 drivers/dma-buf/sw_sync.c                     |  2 +-
 drivers/dma-buf/sync_file.c                   |  4 ++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 10 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 drivers/gpu/drm/drm_suballoc.c                |  6 +++---
 drivers/gpu/drm/drm_syncobj.c                 |  6 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  4 ++--
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 drivers/gpu/drm/i915/i915_deps.c              |  6 +++---
 drivers/gpu/drm/i915/i915_request.c           |  6 +++---
 drivers/gpu/drm/i915/i915_sw_fence.c          |  4 ++--
 drivers/gpu/drm/i915/i915_vma.c               |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  4 ++--
 drivers/gpu/drm/imagination/pvr_queue.c       | 10 ++++-----
 drivers/gpu/drm/lima/lima_sched.c             |  4 ++--
 drivers/gpu/drm/msm/msm_gpu.c                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  4 ++--
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  4 ++--
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c               |  4 ++--
 drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  6 +++---
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  4 ++--
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  2 +-
 drivers/gpu/drm/xe/xe_range_fence.c           |  2 +-
 include/linux/dma-fence.h                     | 21 +++++++++----------
 51 files changed, 113 insertions(+), 114 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..4ac682716827 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -127,7 +127,7 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
 	}
 
 	for (i = 0; i < array->num_fences; ++i) {
-		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
+		if (dma_fence_check_and_signal(array->fences[i]) && !--num_pending)
 			goto signal;
 	}
 	return false;
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 9663ba1bb6ac..66f58716e3a4 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -51,12 +51,12 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 
 		prev_chain = to_dma_fence_chain(prev);
 		if (prev_chain) {
-			if (!dma_fence_is_signaled(prev_chain->fence))
+			if (!dma_fence_check_and_signal(prev_chain->fence))
 				break;
 
 			replacement = dma_fence_chain_get_prev(prev_chain);
 		} else {
-			if (!dma_fence_is_signaled(prev))
+			if (!dma_fence_check_and_signal(prev))
 				break;
 
 			replacement = NULL;
@@ -166,7 +166,7 @@ static bool dma_fence_chain_signaled(struct dma_fence *fence)
 	dma_fence_chain_for_each(fence, fence) {
 		struct dma_fence *f = dma_fence_chain_contained(fence);
 
-		if (!dma_fence_is_signaled(f)) {
+		if (!dma_fence_check_and_signal(f)) {
 			dma_fence_put(fence);
 			return false;
 		}
diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 2a059ac0ed27..f2ed128ccd93 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -93,7 +93,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	timestamp = ns_to_ktime(0);
 	for (i = 0; i < num_fences; ++i) {
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
-			if (!dma_fence_is_signaled(tmp)) {
+			if (!dma_fence_check_and_signal(tmp)) {
 				dma_fence_put(unsignaled);
 				unsignaled = dma_fence_get(tmp);
 				++count;
@@ -127,7 +127,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	count = 0;
 	for (i = 0; i < num_fences; ++i) {
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
-			if (!dma_fence_is_signaled(tmp)) {
+			if (!dma_fence_check_and_signal(tmp)) {
 				array[count++] = dma_fence_get(tmp);
 			} else {
 				ktime_t t = dma_fence_timestamp(tmp);
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0cdd3e99d36..686a28beab5b 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -857,7 +857,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 
 	if (timeout == 0) {
 		for (i = 0; i < count; ++i)
-			if (dma_fence_is_signaled(fences[i])) {
+			if (dma_fence_check_and_signal(fences[i])) {
 				if (idx)
 					*idx = i;
 				return 1;
@@ -968,7 +968,7 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  */
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
-	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (fence->ops->set_deadline && !dma_fence_check_and_signal(fence))
 		fence->ops->set_deadline(fence, deadline);
 }
 EXPORT_SYMBOL(dma_fence_set_deadline);
@@ -985,7 +985,7 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
 		   fence->ops->get_driver_name(fence),
 		   fence->ops->get_timeline_name(fence), fence->seqno,
-		   dma_fence_is_signaled(fence) ? "" : "un");
+		   dma_fence_check_and_signal(fence) ? "" : "un");
 }
 EXPORT_SYMBOL(dma_fence_describe);
 
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..73cc7b25dde4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -217,7 +217,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 		struct dma_fence *fence;
 
 		dma_resv_list_entry(old, i, obj, &fence, &usage);
-		if (dma_fence_is_signaled(fence))
+		if (dma_fence_check_and_signal(fence))
 			RCU_INIT_POINTER(new->table[--k], fence);
 		else
 			dma_resv_list_set(new, j++, fence, usage);
@@ -309,7 +309,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
 		if ((old->context == fence->context && old_usage >= usage &&
 		     dma_fence_is_later_or_same(fence, old)) ||
-		    dma_fence_is_signaled(old)) {
+		    dma_fence_check_and_signal(old)) {
 			dma_resv_list_set(fobj, i, fence, usage);
 			dma_fence_put(old);
 			return;
@@ -398,7 +398,7 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 			continue;
 		}
 
-		if (!dma_fence_is_signaled(cursor->fence) &&
+		if (!dma_fence_check_and_signal(cursor->fence) &&
 		    cursor->usage >= cursor->fence_usage)
 			break;
 	} while (true);
diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e4..38f0e2105286 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -484,7 +484,7 @@ static int find_race(void *arg)
 
 	count = 0;
 	for (i = 0; i < data.fc.chain_length; i++)
-		if (dma_fence_is_signaled(data.fc.fences[i]))
+		if (dma_fence_check_and_signal(data.fc.fences[i]))
 			count++;
 	pr_info("Completed %lu cycles\n", count);
 
@@ -506,14 +506,14 @@ static int signal_forward(void *arg)
 	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
 
-		if (!dma_fence_is_signaled(fc.chains[i])) {
+		if (!dma_fence_check_and_signal(fc.chains[i])) {
 			pr_err("chain[%d] not signaled!\n", i);
 			err = -EINVAL;
 			goto err;
 		}
 
 		if (i + 1 < fc.chain_length &&
-		    dma_fence_is_signaled(fc.chains[i + 1])) {
+		    dma_fence_check_and_signal(fc.chains[i + 1])) {
 			pr_err("chain[%d] is signaled!\n", i);
 			err = -EINVAL;
 			goto err;
@@ -538,7 +538,7 @@ static int signal_backward(void *arg)
 	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
 
-		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
+		if (i > 0 && dma_fence_check_and_signal(fc.chains[i])) {
 			pr_err("chain[%d] is signaled!\n", i);
 			err = -EINVAL;
 			goto err;
@@ -546,7 +546,7 @@ static int signal_backward(void *arg)
 	}
 
 	for (i = 0; i < fc.chain_length; i++) {
-		if (!dma_fence_is_signaled(fc.chains[i])) {
+		if (!dma_fence_check_and_signal(fc.chains[i])) {
 			pr_err("chain[%d] was not signaled!\n", i);
 			err = -EINVAL;
 			goto err;
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index cf2ce3744ce6..76100f3f21e5 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -121,7 +121,7 @@ static int test_signaling(void *arg)
 
 	dma_fence_enable_sw_signaling(f);
 
-	if (dma_fence_is_signaled(f)) {
+	if (dma_fence_check_and_signal(f)) {
 		pr_err("Fence unexpectedly signaled on creation\n");
 		goto err_free;
 	}
@@ -131,7 +131,7 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
-	if (!dma_fence_is_signaled(f)) {
+	if (!dma_fence_check_and_signal(f)) {
 		pr_err("Fence not reporting signaled\n");
 		goto err_free;
 	}
@@ -427,7 +427,7 @@ static int test_stub(void *arg)
 
 	for (i = 0; i < ARRAY_SIZE(f); i++) {
 		f[i] = dma_fence_get_stub();
-		if (!dma_fence_is_signaled(f[i])) {
+		if (!dma_fence_check_and_signal(f[i])) {
 			pr_err("Obtained unsignaled stub fence!\n");
 			goto err;
 		}
@@ -505,7 +505,7 @@ static int thread_signal_callback(void *arg)
 			pr_err("Callback not seen on thread %d, pass %lu (%lu misses), signaling %s add_callback; fence signaled? %s\n",
 			       t->id, pass, miss,
 			       t->before ? "before" : "after",
-			       dma_fence_is_signaled(f2) ? "yes" : "no");
+			       dma_fence_check_and_signal(f2) ? "yes" : "no");
 			err = -EINVAL;
 		}
 
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 849280ae79a9..10f27533ff7a 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -261,7 +261,7 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 	INIT_LIST_HEAD(&pt->link);
 
 	spin_lock_irq(&obj->lock);
-	if (!dma_fence_is_signaled_locked(&pt->base)) {
+	if (!dma_fence_check_and_signal_locked(&pt->base)) {
 		struct rb_node **p = &obj->pt_tree.rb_node;
 		struct rb_node *parent = NULL;
 
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index d9b1c1b2a72b..dfc30fcc15c8 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -201,7 +201,7 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
 			wake_up_all(&sync_file->wq);
 	}
 
-	return dma_fence_is_signaled(sync_file->fence) ? EPOLLIN : 0;
+	return dma_fence_check_and_signal(sync_file->fence) ? EPOLLIN : 0;
 }
 
 static long sync_file_ioctl_merge(struct sync_file *sync_file,
@@ -269,7 +269,7 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 
 	info->status = dma_fence_get_status(fence);
 	info->timestamp_ns =
-		dma_fence_is_signaled(fence) ?
+		dma_fence_check_and_signal(fence) ?
 			ktime_to_ns(dma_fence_timestamp(fence)) :
 			ktime_set(0, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 1ef758ac5076..63d5f0d80f68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -123,7 +123,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	if (!fence)
 		return false;
 
-	if (dma_fence_is_signaled(f))
+	if (dma_fence_check_and_signal(f))
 		return true;
 
 	if (!fence->svm_bo) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 1e998f972c30..cc7761f6ffc9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1864,7 +1864,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	} else {
 		mutex_lock(&avm->process_info->lock);
 		if (avm->process_info->eviction_fence &&
-		    !dma_fence_is_signaled(&avm->process_info->eviction_fence->base))
+		    !dma_fence_check_and_signal(&avm->process_info->eviction_fence->base))
 			ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
 				&avm->process_info->eviction_fence->base);
 		mutex_unlock(&avm->process_info->lock);
@@ -2425,7 +2425,7 @@ static int import_obj_create(struct amdgpu_device *adev,
 
 	mutex_lock(&avm->process_info->lock);
 	if (avm->process_info->eviction_fence &&
-	    !dma_fence_is_signaled(&avm->process_info->eviction_fence->base))
+	    !dma_fence_check_and_signal(&avm->process_info->eviction_fence->base))
 		ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
 				&avm->process_info->eviction_fence->base);
 	mutex_unlock(&avm->process_info->lock);
@@ -2875,7 +2875,7 @@ static void replace_eviction_fence(struct dma_fence __rcu **ef,
 	 * replace the fence in restore_work that only gets scheduled after
 	 * eviction work signaled the fence.
 	 */
-	WARN_ONCE(!dma_fence_is_signaled(old_ef),
+	WARN_ONCE(!dma_fence_check_and_signal(old_ef),
 		  "Replacing unsignaled eviction fence");
 	dma_fence_put(old_ef);
 }
@@ -3049,7 +3049,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
 	 * Anyone signaling an eviction fence must stop the queues first
 	 * and schedule another restore worker.
 	 */
-	if (dma_fence_is_signaled(&process_info->eviction_fence->base)) {
+	if (dma_fence_check_and_signal(&process_info->eviction_fence->base)) {
 		struct amdgpu_amdkfd_fence *new_fence =
 			amdgpu_amdkfd_fence_create(
 				process_info->eviction_fence->base.context,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index c43d1b6e5d66..dadcf75b0174 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -765,7 +765,7 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 
 	idx = seq & (amdgpu_sched_jobs - 1);
 	other = centity->fences[idx];
-	WARN_ON(other && !dma_fence_is_signaled(other));
+	WARN_ON(other && !dma_fence_check_and_signal(other));
 
 	dma_fence_get(fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 49ca8c814455..598cb0148b63 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1895,7 +1895,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 no_preempt:
 	spin_lock(&sched->job_list_lock);
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
-		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
+		if (dma_fence_check_and_signal(&s_job->s_fence->finished)) {
 			/* remove job from ring_mirror_list */
 			list_del_init(&s_job->list);
 			sched->ops->free_job(s_job);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 24ba52d76045..29a9cddcab93 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6000,7 +6000,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 *
 	 * job->base holds a reference to parent fence
 	 */
-	if (job && dma_fence_is_signaled(&job->hw_fence)) {
+	if (job && dma_fence_check_and_signal(&job->hw_fence)) {
 		job_signaled = true;
 		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
 		goto skip_hw_reset;
@@ -6860,7 +6860,7 @@ struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
 		if (old == gang)
 			break;
 
-		if (!dma_fence_is_signaled(old))
+		if (!dma_fence_check_and_signal(old))
 			return old;
 
 	} while (cmpxchg((struct dma_fence __force **)&adev->gang_submit,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2f24a6aa13bf..20e0fac01594 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -719,7 +719,7 @@ void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 			 * and they will remain unsignaled during sa_bo free.
 			 */
 			job = container_of(old, struct amdgpu_job, hw_fence);
-			if (!job->base.s_fence && !dma_fence_is_signaled(old))
+			if (!job->base.s_fence && !dma_fence_check_and_signal(old))
 				dma_fence_signal(old);
 			RCU_INIT_POINTER(*ptr, NULL);
 			dma_fence_put(old);
@@ -745,7 +745,7 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
 
 		fence = rcu_dereference_protected(drv->fences[i],
 						  lockdep_is_held(&drv->lock));
-		if (fence && !dma_fence_is_signaled_locked(fence))
+		if (fence && !dma_fence_check_and_signal_locked(fence))
 			dma_fence_set_error(fence, error);
 	}
 	spin_unlock_irqrestore(&drv->lock, flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 8e712a11aba5..604e3f07a951 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -204,7 +204,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_ring *ring,
 	struct dma_fence **fences;
 	unsigned i;
 
-	if (!dma_fence_is_signaled(ring->vmid_wait)) {
+	if (!dma_fence_check_and_signal(ring->vmid_wait)) {
 		*fence = dma_fence_get(ring->vmid_wait);
 		return 0;
 	}
@@ -287,14 +287,14 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 	    (*id)->flushed_updates < updates ||
 	    !(*id)->last_flush ||
 	    ((*id)->last_flush->context != fence_context &&
-	     !dma_fence_is_signaled((*id)->last_flush))) {
+	     !dma_fence_check_and_signal((*id)->last_flush))) {
 		struct dma_fence *tmp;
 
 		/* Wait for the gang to be assembled before using a
 		 * reserved VMID or otherwise the gang could deadlock.
 		 */
 		tmp = amdgpu_device_get_gang(adev);
-		if (!dma_fence_is_signaled(tmp) && tmp != job->gang_submit) {
+		if (!dma_fence_check_and_signal(tmp) && tmp != job->gang_submit) {
 			*id = NULL;
 			*fence = tmp;
 			return 0;
@@ -372,7 +372,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 
 		if (!(*id)->last_flush ||
 		    ((*id)->last_flush->context != fence_context &&
-		     !dma_fence_is_signaled((*id)->last_flush)))
+		     !dma_fence_check_and_signal((*id)->last_flush)))
 			needs_flush = true;
 
 		if ((*id)->flushed_updates < updates)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index a6e28fe3f8d6..529e5ed31b4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -464,16 +464,16 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 		return false;
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (!dma_fence_is_signaled_locked(fence))
+	if (!dma_fence_check_and_signal_locked(fence))
 		dma_fence_set_error(fence, -ENODATA);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	atomic_inc(&ring->adev->gpu_reset_counter);
-	while (!dma_fence_is_signaled(fence) &&
+	while (!dma_fence_check_and_signal(fence) &&
 	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
 		ring->funcs->soft_recovery(ring, vmid);
 
-	return dma_fence_is_signaled(fence);
+	return dma_fence_check_and_signal(fence);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index c586ab4c911b..ec2293b70855 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -318,7 +318,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 		struct dma_fence *f = e->fence;
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
 
-		if (dma_fence_is_signaled(f)) {
+		if (dma_fence_check_and_signal(f)) {
 			amdgpu_sync_entry_free(e);
 			continue;
 		}
@@ -327,7 +327,7 @@ struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 			 * when they are scheduled.
 			 */
 			if (s_fence->sched == &ring->sched) {
-				if (dma_fence_is_signaled(&s_fence->scheduled))
+				if (dma_fence_check_and_signal(&s_fence->scheduled))
 					continue;
 
 				return &s_fence->scheduled;
@@ -361,7 +361,7 @@ struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync)
 		hash_del(&e->node);
 		kmem_cache_free(amdgpu_sync_slab, e);
 
-		if (!dma_fence_is_signaled(f))
+		if (!dma_fence_check_and_signal(f))
 			return f;
 
 		dma_fence_put(f);
@@ -387,7 +387,7 @@ int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone)
 
 	hash_for_each_safe(source->fences, i, tmp, e, node) {
 		f = e->fence;
-		if (!dma_fence_is_signaled(f)) {
+		if (!dma_fence_check_and_signal(f)) {
 			r = amdgpu_sync_fence(clone, f);
 			if (r)
 				return r;
@@ -415,7 +415,7 @@ int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job)
 
 	hash_for_each_safe(sync->fences, i, tmp, e, node) {
 		f = e->fence;
-		if (dma_fence_is_signaled(f)) {
+		if (dma_fence_check_and_signal(f)) {
 			amdgpu_sync_entry_free(e);
 			continue;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5c07777d3239..72bcb18d21ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -775,7 +775,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 
 	mutex_lock(&id_mgr->lock);
 	if (id->pasid != job->pasid || !id->pasid_mapping ||
-	    !dma_fence_is_signaled(id->pasid_mapping))
+	    !dma_fence_check_and_signal(id->pasid_mapping))
 		pasid_mapping_needed = true;
 	mutex_unlock(&id_mgr->lock);
 
@@ -1110,7 +1110,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		goto error_free;
 	}
 
-	if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
+	if (!unlocked && !dma_fence_check_and_signal(vm->last_unlocked)) {
 		struct dma_fence *tmp = dma_fence_get_stub();
 
 		amdgpu_bo_fence(vm->root.bo, vm->last_unlocked, true);
@@ -2200,7 +2200,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 		return false;
 
 	/* Don't evict VM page tables while they are updated */
-	if (!dma_fence_is_signaled(bo_base->vm->last_unlocked)) {
+	if (!dma_fence_check_and_signal(bo_base->vm->last_unlocked)) {
 		amdgpu_vm_eviction_unlock(bo_base->vm);
 		return false;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index a29374c86405..d33d219882a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -1165,7 +1165,7 @@ int kgd2kfd_schedule_evict_and_restore_process(struct mm_struct *mm,
 	if (!fence)
 		return -EINVAL;
 
-	if (dma_fence_is_signaled(fence))
+	if (dma_fence_check_and_signal(fence))
 		return 0;
 
 	p = kfd_lookup_process_by_mm(mm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index bd3e20d981e0..b622fcc7864c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -426,7 +426,7 @@ static void svm_range_bo_release(struct kref *kref)
 		mmput(mm);
 	}
 
-	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
+	if (!dma_fence_check_and_signal(&svm_bo->eviction_fence->base))
 		/* We're not in the eviction worker. Signal the fence. */
 		dma_fence_signal(&svm_bo->eviction_fence->base);
 	dma_fence_put(&svm_bo->eviction_fence->base);
diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index 38cc7a123819..2515c5a5726e 100644
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -133,7 +133,7 @@ static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
 
 	sa = list_entry(sa_manager->hole->next, struct drm_suballoc, olist);
 	list_for_each_entry_safe_from(sa, tmp, &sa_manager->olist, olist) {
-		if (!sa->fence || !dma_fence_is_signaled(sa->fence))
+		if (!sa->fence || !dma_fence_check_and_signal(sa->fence))
 			return;
 
 		drm_suballoc_remove_locked(sa);
@@ -253,7 +253,7 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
 		sa = list_first_entry(&sa_manager->flist[i],
 				      struct drm_suballoc, flist);
 
-		if (!dma_fence_is_signaled(sa->fence)) {
+		if (!dma_fence_check_and_signal(sa->fence)) {
 			fences[i] = sa->fence;
 			continue;
 		}
@@ -406,7 +406,7 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
 	sa_manager = suballoc->manager;
 
 	spin_lock(&sa_manager->wq.lock);
-	if (fence && !dma_fence_is_signaled(fence)) {
+	if (fence && !dma_fence_check_and_signal(fence)) {
 		u32 idx;
 
 		suballoc->fence = dma_fence_get(fence);
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..47d77ca239c0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1120,7 +1120,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			entries[i].fence = dma_fence_get_stub();
 
 		if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
-		    dma_fence_is_signaled(entries[i].fence)) {
+		    dma_fence_check_and_signal(entries[i].fence)) {
 			if (signaled_count == 0 && idx)
 				*idx = i;
 			signaled_count++;
@@ -1164,7 +1164,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 				continue;
 
 			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
-			    dma_fence_is_signaled(fence) ||
+			    dma_fence_check_and_signal(fence) ||
 			    (!entries[i].fence_cb.func &&
 			     dma_fence_add_callback(fence,
 						    &entries[i].fence_cb,
@@ -1723,7 +1723,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 					dma_fence_put(last_signaled);
 					last_signaled = dma_fence_get(iter);
 				}
-				point = dma_fence_is_signaled(last_signaled) ?
+				point = dma_fence_check_and_signal(last_signaled) ?
 					last_signaled->seqno :
 					to_dma_fence_chain(last_signaled)->prev_seqno;
 			}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..f3a5a2af3b0c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1284,7 +1284,7 @@ int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
 
 	if (!timeout) {
 		/* No timeout was requested: just test for completion */
-		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
+		ret = dma_fence_check_and_signal(fence) ? 0 : -EBUSY;
 	} else {
 		unsigned long remaining = etnaviv_timeout_to_jiffies(timeout);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 76a3a3e517d8..816237edb219 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -43,7 +43,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	 * If the GPU managed to complete this jobs fence, the timout is
 	 * spurious. Bail out.
 	 */
-	if (dma_fence_is_signaled(submit->out_fence))
+	if (dma_fence_check_and_signal(submit->out_fence))
 		goto out_no_timeout;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 1f55e62044a4..c882c10c9bd6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -95,7 +95,7 @@ static void fence_set_priority(struct dma_fence *fence,
 	struct i915_request *rq;
 	struct intel_engine_cs *engine;
 
-	if (dma_fence_is_signaled(fence) || !dma_fence_is_i915(fence))
+	if (dma_fence_check_and_signal(fence) || !dma_fence_is_i915(fence))
 		return;
 
 	rq = to_request(fence);
@@ -115,7 +115,7 @@ static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
 void i915_gem_fence_wait_priority(struct dma_fence *fence,
 				  const struct i915_sched_attr *attr)
 {
-	if (dma_fence_is_signaled(fence))
+	if (dma_fence_check_and_signal(fence))
 		return;
 
 	local_bh_disable();
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index d8f4a10d71de..ce20e6b15881 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -258,7 +258,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
 		goto out_put;
 
 	if (spin) {
-		if (dma_fence_is_signaled(spin_fence)) {
+		if (dma_fence_check_and_signal(spin_fence)) {
 			pr_err("Spinner was terminated by hangcheck.\n");
 			err = -EBUSY;
 			goto out_unlock;
diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
index 91c61864285a..44e73dfac38b 100644
--- a/drivers/gpu/drm/i915/i915_deps.c
+++ b/drivers/gpu/drm/i915/i915_deps.c
@@ -97,7 +97,7 @@ static int i915_deps_grow(struct i915_deps *deps, struct dma_fence *fence,
 	return 0;
 
 sync:
-	if (ctx->no_wait_gpu && !dma_fence_is_signaled(fence)) {
+	if (ctx->no_wait_gpu && !dma_fence_check_and_signal(fence)) {
 		ret = -EBUSY;
 		goto unref;
 	}
@@ -136,7 +136,7 @@ int i915_deps_sync(const struct i915_deps *deps, const struct ttm_operation_ctx
 	int ret = 0;
 
 	for (i = 0; i < deps->num_deps; ++i, ++fences) {
-		if (ctx->no_wait_gpu && !dma_fence_is_signaled(*fences)) {
+		if (ctx->no_wait_gpu && !dma_fence_check_and_signal(*fences)) {
 			ret = -EBUSY;
 			break;
 		}
@@ -183,7 +183,7 @@ int i915_deps_add_dependency(struct i915_deps *deps,
 	if (!fence)
 		return 0;
 
-	if (dma_fence_is_signaled(fence)) {
+	if (dma_fence_check_and_signal(fence)) {
 		ret = fence->error;
 		if (ret)
 			i915_deps_fini(deps);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 8f62cfa23fb7..231e31d5b4ca 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1932,7 +1932,7 @@ static bool __i915_spin_request(struct i915_request * const rq, int state)
 	timeout_ns = READ_ONCE(rq->engine->props.max_busywait_duration_ns);
 	timeout_ns += local_clock_ns(&cpu);
 	do {
-		if (dma_fence_is_signaled(&rq->fence))
+		if (dma_fence_check_and_signal(&rq->fence))
 			return true;
 
 		if (signal_pending_state(state, current))
@@ -1989,7 +1989,7 @@ long i915_request_wait_timeout(struct i915_request *rq,
 	might_sleep();
 	GEM_BUG_ON(timeout < 0);
 
-	if (dma_fence_is_signaled(&rq->fence))
+	if (dma_fence_check_and_signal(&rq->fence))
 		return timeout ?: 1;
 
 	if (!timeout)
@@ -2072,7 +2072,7 @@ long i915_request_wait_timeout(struct i915_request *rq,
 	for (;;) {
 		set_current_state(state);
 
-		if (dma_fence_is_signaled(&rq->fence))
+		if (dma_fence_check_and_signal(&rq->fence))
 			break;
 
 		if (signal_pending_state(state, current)) {
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 1d4cc91c0e40..73cd6717d83d 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -483,7 +483,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	if (dma_fence_is_signaled(dma)) {
+	if (dma_fence_check_and_signal(dma)) {
 		i915_sw_fence_set_error_once(fence, dma->error);
 		return 0;
 	}
@@ -551,7 +551,7 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 	debug_fence_assert(fence);
 
-	if (dma_fence_is_signaled(dma)) {
+	if (dma_fence_check_and_signal(dma)) {
 		i915_sw_fence_set_error_once(fence, dma->error);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 776f8cc51b2f..8b87707d6fec 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -430,7 +430,7 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 	if (!fence)
 		return 0;
 
-	if (dma_fence_is_signaled(fence))
+	if (dma_fence_check_and_signal(fence))
 		err = fence->error;
 	else
 		err = -EBUSY;
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..913b3164928e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -170,7 +170,7 @@ static int igt_fence_wait(void *arg)
 
 	i915_request_add(request);
 
-	if (dma_fence_is_signaled(&request->fence)) {
+	if (dma_fence_check_and_signal(&request->fence)) {
 		pr_err("fence signaled immediately!\n");
 		goto out;
 	}
@@ -185,7 +185,7 @@ static int igt_fence_wait(void *arg)
 		goto out;
 	}
 
-	if (!dma_fence_is_signaled(&request->fence)) {
+	if (!dma_fence_check_and_signal(&request->fence)) {
 		pr_err("fence unsignaled after waiting!\n");
 		goto out;
 	}
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 21c185d18bb2..ab4ca3dad5b0 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -365,7 +365,7 @@ static unsigned long job_count_remaining_native_deps(struct pvr_job *job)
 		if (!jfence)
 			continue;
 
-		if (!dma_fence_is_signaled(&jfence->base))
+		if (!dma_fence_check_and_signal(&jfence->base))
 			remaining_count++;
 	}
 
@@ -470,7 +470,7 @@ pvr_queue_get_paired_frag_job_dep(struct pvr_queue *queue, struct pvr_job *job)
 
 	xa_for_each(&frag_job->base.dependencies, index, f) {
 		/* Skip already signaled fences. */
-		if (dma_fence_is_signaled(f))
+		if (dma_fence_check_and_signal(f))
 			continue;
 
 		/* Skip our own fence. */
@@ -625,7 +625,7 @@ static void pvr_queue_submit_job_to_cccb(struct pvr_job *job)
 		    &job->paired_job->base.s_fence->scheduled == fence)
 			continue;
 
-		if (dma_fence_is_signaled(&jfence->base))
+		if (dma_fence_check_and_signal(&jfence->base))
 			continue;
 
 		pvr_fw_object_get_fw_addr(jfence->queue->timeline_ufo.fw_obj,
@@ -768,7 +768,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
 	*queue->timeline_ufo.value = atomic_read(&queue->job_fence_ctx.seqno);
 
 	list_for_each_entry(job, &queue->scheduler.pending_list, base.list) {
-		if (dma_fence_is_signaled(job->done_fence)) {
+		if (dma_fence_check_and_signal(job->done_fence)) {
 			/* Jobs might have completed after drm_sched_stop() was called.
 			 * In that case, re-assign the parent field to the done_fence.
 			 */
@@ -910,7 +910,7 @@ pvr_queue_signal_done_fences(struct pvr_queue *queue)
 		if ((int)(cur_seqno - lower_32_bits(job->done_fence->seqno)) < 0)
 			break;
 
-		if (!dma_fence_is_signaled(job->done_fence)) {
+		if (!dma_fence_check_and_signal(job->done_fence)) {
 			dma_fence_signal(job->done_fence);
 			pvr_job_release_pm_ref(job);
 			atomic_dec(&queue->in_flight_job_count);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 7934098e651b..13cfe6daeeda 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -408,7 +408,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	 * If the GPU managed to complete this jobs fence, the timeout is
 	 * spurious. Bail out.
 	 */
-	if (dma_fence_is_signaled(task->fence)) {
+	if (dma_fence_check_and_signal(task->fence)) {
 		DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
@@ -425,7 +425,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	if (pipe->bcast_processor)
 		synchronize_irq(pipe->bcast_processor->irq);
 
-	if (dma_fence_is_signaled(task->fence)) {
+	if (dma_fence_check_and_signal(task->fence)) {
 		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8557998e0c92..5dd662dee01b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,7 +717,7 @@ static void retire_submits(struct msm_gpu *gpu)
 			 * been signalled, then later submits are not signalled
 			 * either, so we are also done.
 			 */
-			if (submit && dma_fence_is_signaled(submit->hw_fence)) {
+			if (submit && dma_fence_check_and_signal(submit->hw_fence)) {
 				retire_submit(gpu, ring, submit);
 			} else {
 				break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2a2b319dca5f..de8afc3f94c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -159,7 +159,7 @@ nouveau_cli_work_ready(struct dma_fence *fence)
 	bool ret = true;
 
 	spin_lock_irq(fence->lock);
-	if (!dma_fence_is_signaled_locked(fence))
+	if (!dma_fence_check_and_signal_locked(fence))
 		ret = false;
 	spin_unlock_irq(fence->lock);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..99d6f128ab2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 			nvif_event_block(&fctx->event);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
-	return dma_fence_is_signaled(&fence->base);
+	return dma_fence_check_and_signal(&fence->base);
 }
 
 static long
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5657106c2f7d..f50e08428300 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -754,7 +754,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * If the GPU managed to complete this jobs fence, the timeout is
 	 * spurious. Bail out.
 	 */
-	if (dma_fence_is_signaled(job->done_fence))
+	if (dma_fence_check_and_signal(job->done_fence))
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 
 	/*
@@ -768,7 +768,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 */
 	synchronize_irq(pfdev->js->irq);
 
-	if (dma_fence_is_signaled(job->done_fence)) {
+	if (dma_fence_check_and_signal(job->done_fence)) {
 		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 05204a6a3fa8..f75f8c5289c6 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -63,7 +63,7 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
 
 	if (!wait_event_timeout(qdev->release_event,
-				(dma_fence_is_signaled(fence) ||
+				(dma_fence_check_and_signal(fence) ||
 				 (qxl_io_notify_oom(qdev), 0)),
 				timeout))
 		return 0;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a6d2a4722d82..ba4054fc818b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -548,7 +548,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	fence = rcu_dereference_check(entity->last_scheduled, true);
 
 	/* stay on the same engine if the previous job hasn't finished */
-	if (fence && !dma_fence_is_signaled(fence))
+	if (fence && !dma_fence_check_and_signal(fence))
 		return;
 
 	spin_lock(&entity->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c0420e90c468..03a18288e8c1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -382,7 +382,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
-	if (job && dma_fence_is_signaled(&job->s_fence->finished))
+	if (job && dma_fence_check_and_signal(&job->s_fence->finished))
 		__drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
@@ -1118,7 +1118,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
+	if (job && dma_fence_check_and_signal(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e218a7ce490e..d5841820c859 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -672,7 +672,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return 0;
 
 	if (no_wait_gpu) {
-		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
+		ret = dma_fence_check_and_signal(fence) ? 0 : -EBUSY;
 		dma_fence_put(fence);
 		return ret;
 	}
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 34bd2b14f932..2bdc7d72f5f6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -519,7 +519,7 @@ v3d_copy_query_results(struct v3d_cpu_job *job)
 
 	for (i = 0; i < timestamp_query->count; i++) {
 		fence = drm_syncobj_fence_get(queries[i].syncobj);
-		available = fence ? dma_fence_is_signaled(fence) : false;
+		available = fence ? dma_fence_check_and_signal(fence) : false;
 
 		write_result = available || copy->do_partial;
 		if (write_result) {
@@ -623,7 +623,7 @@ v3d_copy_performance_query(struct v3d_cpu_job *job)
 
 	for (int i = 0; i < performance_query->count; i++) {
 		fence = drm_syncobj_fence_get(performance_query->queries[i].syncobj);
-		available = fence ? dma_fence_is_signaled(fence) : false;
+		available = fence ? dma_fence_check_and_signal(fence) : false;
 
 		write_result = available || copy->do_partial;
 		if (write_result)
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 5298d995faa7..551760e44e81 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -207,7 +207,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
 
-	if (dma_fence_is_signaled(fence))
+	if (dma_fence_check_and_signal(fence))
 		ret = -ETIMEDOUT;
 
 	dma_fence_signal(fence);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 588d50ababf6..9525df31f4bc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -443,7 +443,7 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	u32 goal_seqno;
 
-	if (dma_fence_is_signaled_locked(&fence->base))
+	if (dma_fence_check_and_signal_locked(&fence->base))
 		return false;
 
 	goal_seqno = vmw_fence_goal_read(fman->dev_priv);
@@ -513,7 +513,7 @@ bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence)
 
 	vmw_fences_update(fman);
 
-	return dma_fence_is_signaled(&fence->base);
+	return dma_fence_check_and_signal(&fence->base);
 }
 
 int vmw_fence_obj_wait(struct vmw_fence_obj *fence, bool lazy,
@@ -886,7 +886,7 @@ static void vmw_fence_obj_add_action(struct vmw_fence_obj *fence,
 	spin_lock(&fman->lock);
 
 	fman->pending_actions[action->type]++;
-	if (dma_fence_is_signaled_locked(&fence->base)) {
+	if (dma_fence_check_and_signal_locked(&fence->base)) {
 		struct list_head action_list;
 
 		INIT_LIST_HEAD(&action_list);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2827cb4618e6..69926b6c401d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1235,7 +1235,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	dma_resv_for_each_fence(&cursor, ttm_bo->base.resv,
 				DMA_RESV_USAGE_BOOKKEEP, fence) {
 		if (xe_fence_is_xe_preempt(fence) &&
-		    !dma_fence_is_signaled(fence)) {
+		    !dma_fence_check_and_signal(fence)) {
 			if (!replacement)
 				replacement = dma_fence_get_stub();
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..0256a5126663 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2202,9 +2202,9 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 			snapshot->pending_list[i].seqno =
 				xe_sched_job_seqno(job_iter);
 			snapshot->pending_list[i].fence =
-				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
+				dma_fence_check_and_signal(job_iter->fence) ? 1 : 0;
 			snapshot->pending_list[i].finished =
-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
+				dma_fence_check_and_signal(&job_iter->drm.s_fence->finished)
 				? 1 : 0;
 			i++;
 		}
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..b55f4a4c9a4f 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -62,7 +62,7 @@ static void hw_fence_irq_run_cb(struct irq_work *work)
 			struct dma_fence *dma_fence = &fence->dma;
 
 			trace_xe_hw_fence_try_signal(fence);
-			if (dma_fence_is_signaled_locked(dma_fence)) {
+			if (dma_fence_check_and_signal_locked(dma_fence)) {
 				trace_xe_hw_fence_signal(fence);
 				list_del_init(&fence->irq_link);
 				dma_fence_put(dma_fence);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..195fa2bf9d44 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1127,7 +1127,7 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	while (rtfence) {
 		fence = rtfence->fence;
 
-		if (!dma_fence_is_signaled(fence)) {
+		if (!dma_fence_check_and_signal(fence)) {
 			/*
 			 * Is this a CPU update? GPU is busy updating, so return
 			 * an error
diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
index 372378e89e98..8ad267bf8948 100644
--- a/drivers/gpu/drm/xe/xe_range_fence.c
+++ b/drivers/gpu/drm/xe/xe_range_fence.c
@@ -60,7 +60,7 @@ int xe_range_fence_insert(struct xe_range_fence_tree *tree,
 
 	__xe_range_fence_tree_cleanup(tree);
 
-	if (dma_fence_is_signaled(fence))
+	if (dma_fence_check_and_signal(fence))
 		goto free;
 
 	rfence->ops = ops;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index b12776883d14..dc2ad171458b 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -201,7 +201,7 @@ struct dma_fence_ops {
 	 * once indicates as signalled must always return true from this
 	 * callback. This callback may return false even if the fence has
 	 * completed already, in this case information hasn't propogated throug
-	 * the system yet. See also dma_fence_is_signaled().
+	 * the system yet. See also dma_fence_check_and_signal().
 	 *
 	 * May set &dma_fence.error if returning true.
 	 *
@@ -382,8 +382,7 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
 /**
- * dma_fence_is_signaled_locked - Return an indication if the fence
- *                                is signaled yet.
+ * dma_fence_check_and_signal_locked - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
  * Returns true if the fence was already signaled, false if not. Since this
@@ -393,10 +392,10 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
  *
  * This function requires &dma_fence.lock to be held.
  *
- * See also dma_fence_is_signaled().
+ * See also dma_fence_check_and_signal().
  */
 static inline bool
-dma_fence_is_signaled_locked(struct dma_fence *fence)
+dma_fence_check_and_signal_locked(struct dma_fence *fence)
 {
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
@@ -410,7 +409,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 }
 
 /**
- * dma_fence_is_signaled - Return an indication if the fence is signaled yet.
+ * dma_fence_check_and_signal - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
  * Returns true if the fence was already signaled, false if not. Since this
@@ -423,10 +422,10 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * wraparound between time of issue and time of use by checking the return
  * value of this function before calling hardware-specific wait instructions.
  *
- * See also dma_fence_is_signaled_locked().
+ * See also dma_fence_check_and_signal_locked().
  */
 static inline bool
-dma_fence_is_signaled(struct dma_fence *fence)
+dma_fence_check_and_signal(struct dma_fence *fence)
 {
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
@@ -514,9 +513,9 @@ static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
 	 * here is overkill.
 	 */
 	if (dma_fence_is_later(f1, f2))
-		return dma_fence_is_signaled(f1) ? NULL : f1;
+		return dma_fence_check_and_signal(f1) ? NULL : f1;
 	else
-		return dma_fence_is_signaled(f2) ? NULL : f2;
+		return dma_fence_check_and_signal(f2) ? NULL : f2;
 }
 
 /**
@@ -535,7 +534,7 @@ static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
  */
 static inline int dma_fence_get_status_locked(struct dma_fence *fence)
 {
-	if (dma_fence_is_signaled_locked(fence))
+	if (dma_fence_check_and_signal_locked(fence))
 		return fence->error ?: 1;
 	else
 		return 0;
-- 
2.48.1

