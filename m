Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5837AECD4B
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C0810E349;
	Sun, 29 Jun 2025 14:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeMTCVdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63ED10E345
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TA0Quo005828
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=u3Vk/605sFT
 lfOKNcEzCbK6kAX2mmjGgvJ9lJRRpvp8=; b=YeMTCVdyxNA3qlzrcTJVCUiMQ3p
 Qu3dk9TZxD87mYJISmVQ1AY3UFybjOD9fcG2K6tJI8T3ZC1RbhrpRrHkJh2PuZqu
 yrE8m/jeWniy5HU4+CvO2D5lkpZwt02qvlvzQINnnGgt6dZ1/+uC5ks33GFEoGaN
 Psmq9nX0VvXJcwXEMu3RBDH1pXWqiHyeRN8ORN/RNzzS0mpaR5iy9gi4ce8iDa+e
 FD4vnTGgUnBe9UuvBspfyRMbYb3NIhI8PApAv64VzH7jVgQhwYZ2RLcU1dqcEHRk
 7BG/q6pZFOGv0gsFxIPAY0bT71tAuxR2Rxc9Sy74jJhI5rL3xXZCDqloK4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748e1e474f8so2470547b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206086; x=1751810886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3Vk/605sFTlfOKNcEzCbK6kAX2mmjGgvJ9lJRRpvp8=;
 b=URupeVNPETVgT4io9IH+4JJ3ewzyfJRxxr2u34A6Hng/EJfnS1ryDHCi85V1s6P5wc
 vMjOt0qet/vPkypZ91irmU4p8N2jHQVjkN2MAeDmgngfRNHppu59+tgROBCG5LolEW0/
 B0NJ55FV4xecYxfmslvidCI89e7sRQ06rcWIRK0ocYF+1Ez4ccwKqr0Vy0VFH+YOD64g
 XvRIuscDxI8KYCvSrx86HA31/Ksm05Biyt0o83v66Z2QSgYWt/47yNG+BxqMMhTW7WdJ
 U+Q2M5Ex/AGKHS2GHNHiPSlsfvn/6TNCAkhY+Bc6P3CHzgirlNOR5O7UrXSMJvc1+Oyf
 Y43Q==
X-Gm-Message-State: AOJu0YzOsiUFwRBXfz4MU9Px8+MovBD5uChdHu2HCs3Jc+K+yQuHhjj0
 6mvzV25ztiZVoyG0kUtPboxVrS1Rw+YXSWuQN8cVnPi5khch1QmwS+YabhxDIoQS6rXlWv0FtAk
 hDhJGif8JADS9AZu0y8f6m/5VpvYjBPPCzN5XOYkP441IfBW1I8CcpfBZgZDE90DtR7yHa6sqt8
 Tb2Fs=
X-Gm-Gg: ASbGncvcOZCmM0sGfWM5QTgcbVkk5BEYLHjZ+oPVmsr8gCGHK/PH9UymQEf+o1e1V8C
 BEtoSEncLgoqr2Z8K5sU+C7ahCmKDJzi2xE3c7X9+Aj/3bmDW+uzKCV2J25gvSDvED5dbpYj5MS
 LwtLCi/3dGMjjY3DKdVl9bOUjJMK2zQsiJ1tnWXVfUcjqXQGTlcIeYVC9GN1U+/QRZCynKufD+U
 5Ct8bN+R4S87fDN8zZHy+XA9jopVBf0HBimjw75Du0fVJVIYHZoeWd0ggB2yMCt+e1EOvIc/Rj9
 BnVRc9YCbAviBmGp98blecEWisMoXJzW
X-Received: by 2002:a05:6a00:4fc1:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-74af6fcf6c5mr13031011b3a.15.1751206086276; 
 Sun, 29 Jun 2025 07:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPF0r+KbIJLkMpnGJMuJ/yjrmjEcP7CR6qcDhirZTEZTfTvp71Z0FYiOLb8KvVz889YuZrRA==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-74af6fcf6c5mr13030958b3a.15.1751206085614; 
 Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540ae41sm6917244b3a.19.2025.06.29.07.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v8 31/42] drm/msm: Add VM_BIND submitqueue
Date: Sun, 29 Jun 2025 07:03:34 -0700
Message-ID: <20250629140537.30850-32-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX5TK5WGXwit//
 BABu8DXyQSOf+gsW35KjfGfJLhvv94DOP0jVAG3q1hls/ZBxcfm84bMoqaATuJgcWFQ21ptFqJI
 Y+GNTXOnamzeTJHqA+mPNYkSqLG5vUKNoUfQ1nKAQhMH/kHSo4lJ5HbVNePcrszAJnKE9dWXRT4
 Q1iG71H7J7gdYp/TMMS0j1jYR5KH5KloyqPnBKk7k4rLG/ZQwPxMMqu/FEW2Q8QmBCOESdA5S+K
 R8YZfsuuPIymIH517fLPmuzou/ypyZzI1xNXP67st6dctrAxPRubwOc8rknr66NjMbR3ieOwNC1
 f8fW6knYilWz8amDwy1eM9QltsZpGwPqLtVfRSrfApB7tMLdN+aDVAUpdw1z/7+hVLmMNp+KX70
 zTU2UVl/p96C6dftsD3cAsAbVWbtLfwcRfUtQn9UFy20kViy+7SRoIRz2ChoGV3hEihhHEDc
X-Proofpoint-GUID: RSZnhrbcTo9tgnASmhIVXfGqIMJGZ4G1
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148c7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PnHp71_pcMtKiH-pJVMA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: RSZnhrbcTo9tgnASmhIVXfGqIMJGZ4G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

This submitqueue type isn't tied to a hw ringbuffer, but instead
executes on the CPU for performing async VM_BIND ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h         | 12 +++++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 60 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_vma.c     | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  3 ++
 drivers/gpu/drm/msm/msm_submitqueue.c | 67 +++++++++++++++++++------
 include/uapi/drm/msm_drm.h            |  9 +++-
 6 files changed, 197 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3a5f81437b5d..af637409be39 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -53,6 +53,13 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+	/**
+	 * @sched: Scheduler used for asynchronous VM_BIND request.
+	 *
+	 * Unused for kernel managed VMs (where all operations are synchronous).
+	 */
+	struct drm_gpu_scheduler sched;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
@@ -71,6 +78,9 @@ struct msm_gem_vm {
 	 */
 	struct pid *pid;
 
+	/** @last_fence: Fence for last pending work scheduled on the VM */
+	struct dma_fence *last_fence;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
@@ -100,6 +110,8 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
+void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+
 struct msm_fence_context;
 
 #define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9f18771a1e88..e2174b7d0e40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/dma-fence-unwrap.h>
 #include <linux/file.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
@@ -258,30 +259,43 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
+	struct drm_exec *exec = &submit->exec;
 	int ret;
 
-// TODO need to add vm_bind path which locks vm resv + external objs
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_exec_until_all_locked (&submit->exec) {
+			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+
+			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+
+		return 0;
+	}
+
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_exec_lock_obj(&submit->exec,
 					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
-			goto error;
+			return ret;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				goto error;
+				return ret;
 		}
 	}
 
 	return 0;
-
-error:
-	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
@@ -367,9 +381,18 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 
 static void submit_attach_object_fences(struct msm_gem_submit *submit)
 {
-	int i;
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct dma_fence *last_fence;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
+					 submit->user_fence,
+					 DMA_RESV_USAGE_BOOKKEEP,
+					 DMA_RESV_USAGE_BOOKKEEP);
+		return;
+	}
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
@@ -379,6 +402,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
+
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
@@ -537,6 +564,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -726,6 +758,18 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit_attach_object_fences(submit);
 
+	if (msm_context_is_vmbind(ctx)) {
+		/*
+		 * If we are not using VM_BIND, submit_pin_vmas() will validate
+		 * just the BOs attached to the submit.  In that case we don't
+		 * need to validate the _entire_ vm, because userspace tracked
+		 * what BOs are associated with the submit.
+		 */
+		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
+		if (ret)
+			goto out;
+	}
+
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e16a8cafd8be..cf37abb98235 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -16,6 +16,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
 		vm->mmu->funcs->destroy(vm->mmu);
+	dma_fence_put(vm->last_fence);
 	put_pid(vm->pid);
 	kfree(vm);
 }
@@ -154,6 +155,9 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -195,6 +199,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		goto err_free_vm;
 	}
 
+	if (!managed) {
+		struct drm_sched_init_args args = {
+			.ops = &msm_vm_bind_ops,
+			.num_rqs = 1,
+			.credit_limit = 1,
+			.timeout = MAX_SCHEDULE_TIMEOUT,
+			.name = "msm-vm-bind",
+			.dev = drm->dev,
+		};
+
+		ret = drm_sched_init(&vm->sched, &args);
+		if (ret)
+			goto err_free_dummy;
+	}
+
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -206,8 +225,60 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	return &vm->base;
 
+err_free_dummy:
+	drm_gem_object_put(dummy_gem);
+
 err_free_vm:
 	kfree(vm);
 	return ERR_PTR(ret);
 
 }
+
+/**
+ * msm_gem_vm_close() - Close a VM
+ * @gpuvm: The VM to close
+ *
+ * Called when the drm device file is closed, to tear down VM related resources
+ * (which will drop refcounts to GEM objects that were still mapped into the
+ * VM at the time).
+ */
+void
+msm_gem_vm_close(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	struct drm_gpuva *vma, *tmp;
+
+	/*
+	 * For kernel managed VMs, the VMAs are torn down when the handle is
+	 * closed, so nothing more to do.
+	 */
+	if (vm->managed)
+		return;
+
+	if (vm->last_fence)
+		dma_fence_wait(vm->last_fence, false);
+
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
+
+	/* Tear down any remaining mappings: */
+	dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
+	drm_gpuvm_for_each_va_safe (vma, tmp, gpuvm) {
+		struct drm_gem_object *obj = vma->gem.obj;
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			drm_gem_object_get(obj);
+			msm_gem_lock(obj);
+		}
+
+		msm_gem_vma_unmap(vma);
+		msm_gem_vma_close(vma);
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			msm_gem_unlock(obj);
+			drm_gem_object_put(obj);
+		}
+	}
+	dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b38a33a67ee9..5705e8d4e6b9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -564,6 +564,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+
+	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
+	struct drm_sched_entity _vm_bind_entity[0];
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8ced49c7557b..8617a82cd6b3 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -72,6 +72,9 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	if (queue->entity == &queue->_vm_bind_entity[0])
+		drm_sched_entity_destroy(queue->entity);
+
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -102,7 +105,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 
 void msm_submitqueue_close(struct msm_context *ctx)
 {
-	struct msm_gpu_submitqueue *entry, *tmp;
+	struct msm_gpu_submitqueue *queue, *tmp;
 
 	if (!ctx)
 		return;
@@ -111,10 +114,17 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
-		list_del(&entry->node);
-		msm_submitqueue_put(entry);
+	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
+		if (queue->entity == &queue->_vm_bind_entity[0])
+			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		list_del(&queue->node);
+		msm_submitqueue_put(queue);
 	}
+
+	if (!ctx->vm)
+		return;
+
+	msm_gem_vm_close(ctx->vm);
 }
 
 static struct drm_sched_entity *
@@ -160,8 +170,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
-	extern int enable_preemption;
-	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -171,26 +179,53 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		unsigned sz;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
-		return -EINVAL;
+		/* Not allowed for kernel managed VMs (ie. kernel allocs VA) */
+		if (!msm_context_is_vmbind(ctx))
+			return -EINVAL;
 
-	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
-	if (ret)
-		return ret;
+		if (prio)
+			return -EINVAL;
+
+		sz = struct_size(queue, _vm_bind_entity, 1);
+		queue = kzalloc(sz, GFP_KERNEL);
+	} else {
+		extern int enable_preemption;
+		bool preemption_supported =
+			priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+		if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
+			return -EINVAL;
 
-	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+		ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+		if (ret)
+			return ret;
+
+		queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	}
 
 	if (!queue)
 		return -ENOMEM;
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->ring_nr = ring_nr;
 
-	queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-					 ring_nr, sched_prio);
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		struct drm_gpu_scheduler *sched = &to_msm_vm(msm_context_vm(drm, ctx))->sched;
+
+		queue->entity = &queue->_vm_bind_entity[0];
+
+		drm_sched_entity_init(queue->entity, DRM_SCHED_PRIORITY_KERNEL,
+				      &sched, 1, NULL);
+	} else {
+		queue->ring_nr = ring_nr;
+
+		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
+						 ring_nr, sched_prio);
+	}
+
 	if (IS_ERR(queue->entity)) {
 		ret = PTR_ERR(queue->entity);
 		kfree(queue);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2c2fc4b284d0..6d6cd1219926 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -385,12 +385,19 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
 		0)
 
 /*
-- 
2.50.0

