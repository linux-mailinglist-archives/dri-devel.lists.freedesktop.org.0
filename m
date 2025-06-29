Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA8AED09C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D8B10E37E;
	Sun, 29 Jun 2025 20:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="afLT6cbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60410E37D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFTJC3014721
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=TTDBcr8gQGD
 rmhJvWe0CWecl72QZMUM5Ntt1GhawWEM=; b=afLT6cbFl56GzOL8/6vAKsnFaN0
 uMWkd1OepIexcxHUSXw9hTwviuvQ2W3qHlMEG1QNT5j7Bzqv1oUiIqMvQIbod9Xn
 cM2ZBRQZdHBCNCQCvh5330boS3Ac682sjR/WFRHrE7k71kUWmR95fFCI4A8N+udd
 AgMvl6tNdj+B3qz8YfupIEw1rPcRmfajuZ9mm2wQt4p97fzV5UWDg2YC4Lom9ADW
 6lgmoQMLSDZ6GhoI3IUXkhNCAAOFvGX+FPreMU2/20I1drx4Ib8pGMF16yobMcyK
 QIUQTWiNMNh94dm3IJE5ZNPHNW2w5I6mWnQu2HeS6ZG6u//e7s1MBDXjF2A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2eb60594e8so896867a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228231; x=1751833031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTDBcr8gQGDrmhJvWe0CWecl72QZMUM5Ntt1GhawWEM=;
 b=wWvAbQrVu8gfSEZ65lAkADEp3aOA9XgVilcNEsdEjN2TnHnZmT6ShCOtqk6uRSsL2B
 +99ajkrzRn21zmiSwB/0ukqF2G2d/xAbHvqZiCMtAGgjHRmj5q+yYOskBqbbMqzrQWgB
 L2jQXQZaEPrp4TJCyxR9mEp7QItb9d6/MCam+EMZSO5cd9KRmu4q+7sKmNRCe7rfhwjd
 //Ej2j+8dTqJvPPIyEBpFetd0qZyTXaO4Wbc7haiKwpmY0RRWezc/vX7ZEGN+WFn9KCO
 xALqeE+DdmpgkYuXqbZGoQnBiSWjjcpJ4PyylfmiztXJYEC3+U1Vj1zs2NgnPFr26uUm
 BNEg==
X-Gm-Message-State: AOJu0YxkFMguma+JXdWgHcrcc1f3sUYOdzXgSKiZyeeujMgsoOsb8Xzd
 lqbMBdFwYMw3R+EawwnHtSprxwUK56CMUxYzYFGUZlI3kf2tExalJSwJIh9BNNMQeT+cDuXmL4F
 r4IL1i8paHzPj+XDnQXzoQRsT5+pU5U9QRMK2w5366mcgKKB0afS+9D6T6PB0fCEM/EnRDZ8pMX
 TA070=
X-Gm-Gg: ASbGncsgzGWGm7+1yswfPoutTpCEWUyz+4gURO53K4inq8Xs29R7oho+bohkTJmWzJZ
 DSlUpy/AZq6+7ARtqW2ElGlt2PCoFkHNnO5t0CykPxUs1w54RKqu7rDlKZj21p0V6jgKZhswzQk
 HZ+HZ37LATxUWzpLAPKuRme8qPwseuPvLp4QPvj62LFzBeQ7+shR8vWTfNKAzd2tlFte5wySfTP
 RX602Ae0ssm5tva3MvlovN84ORLP2gKB0ywx498XkZ41LkULguaOA8J3eLVW2U2Kn18CrRl9sic
 x+7YMukQWmhXzXGsWvbg7dko1EvhiR36cQ==
X-Received: by 2002:a17:90b:4c0b:b0:313:db0b:75d7 with SMTP id
 98e67ed59e1d1-318c925932bmr15001114a91.27.1751228231050; 
 Sun, 29 Jun 2025 13:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSkMZ6IRCYGxj1n3cea7BaF2COQ0zFrtcOt+Od0Poe0j+1jvJhGBt1evGrnxhBYQ+fQu5NA==
X-Received: by 2002:a17:90b:4c0b:b0:313:db0b:75d7 with SMTP id
 98e67ed59e1d1-318c925932bmr15001092a91.27.1751228230561; 
 Sun, 29 Jun 2025 13:17:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c1392096sm7344622a91.8.2025.06.29.13.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 36/42] drm/msm: Add VM logging for VM_BIND updates
Date: Sun, 29 Jun 2025 13:13:19 -0700
Message-ID: <20250629201530.25775-37-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f48 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Ivokvn2EMlC-zZWxPmsA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: woJwzeHu8N51hr-ocZutHLJKF8BWptE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX7cDGUD7Ryyq5
 zKXIDfbAYMtnC43M8lPGN108ITClt1GmIYb+nok5G9anGAUbG2S7RI8cranKR7cS9d4Apbb63jv
 QiMVdu7lQ5goo2n53NT559k0UDQUD0jPub8/W/20lH+xW0PlM/iW6TrWMg8eHOvie7u5ZKmFgkG
 nORVZBGSpr6SNBRAQt4//TW8sdJvXi+o3wCtbxKY+Pypf0w8ZZMnoLAnzn+HVcYPyOiW23/Uo14
 gyUmhpL71tHW+zhe65E/T9N0vsqPb6FCcXIDtMde2C5LHknulYnEdzOQFv6VUt8VoRfI+lxi+Un
 vdDBr08iW719/7F36I0pBJw0GA3bAwBt0TQj9YyrwGS32L3Rr+RuqfRaDcv2rmmrSI2SkUTZaqA
 CVUsgPnA2WqJdjRrCVAXvzD4c8s79e2M7mPIqP4Y448jXVxDWW3BVISqpgIwdCIMQL+D5iGw
X-Proofpoint-GUID: woJwzeHu8N51hr-ocZutHLJKF8BWptE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

When userspace opts in to VM_BIND, the submit no longer holds references
keeping the VMA alive.  This makes it difficult to distinguish between
UMD/KMD/app bugs.  So add a debug option for logging the most recent VM
updates and capturing these in GPU devcoredumps.

The submitqueue id is also captured, a value of zero means the operation
did not go via a submitqueue (ie. comes from msm_gem_vm_close() tearing
down the remaining mappings when the device file is closed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  11 +++
 drivers/gpu/drm/msm/msm_gem.h           |  24 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c       | 124 ++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c           |  52 +++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |   4 +
 5 files changed, 202 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ff25e3dada04..53cbfa5a507b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -833,6 +833,7 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state)
 	for (i = 0; state->bos && i < state->nr_bos; i++)
 		kvfree(state->bos[i].data);
 
+	kfree(state->vm_logs);
 	kfree(state->bos);
 	kfree(state->comm);
 	kfree(state->cmd);
@@ -973,6 +974,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
+	if (state->vm_logs) {
+		drm_puts(p, "vm-log:\n");
+		for (i = 0; i < state->nr_vm_logs; i++) {
+			struct msm_gem_vm_log_entry *e = &state->vm_logs[i];
+			drm_printf(p, "  - %s:%d: 0x%016llx-0x%016llx\n",
+				   e->op, e->queue_id, e->iova,
+				   e->iova + e->range);
+		}
+	}
+
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
 
 	drm_puts(p, "ringbuffer:\n");
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ee464e315643..062d1b5477d6 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -24,6 +24,20 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
+/**
+ * struct msm_gem_vm_log_entry - An entry in the VM log
+ *
+ * For userspace managed VMs, a log of recent VM updates is tracked and
+ * captured in GPU devcore dumps, to aid debugging issues caused by (for
+ * example) incorrectly synchronized VM updates
+ */
+struct msm_gem_vm_log_entry {
+	const char *op;
+	uint64_t iova;
+	uint64_t range;
+	int queue_id;
+};
+
 /**
  * struct msm_gem_vm - VM object
  *
@@ -85,6 +99,15 @@ struct msm_gem_vm {
 	/** @last_fence: Fence for last pending work scheduled on the VM */
 	struct dma_fence *last_fence;
 
+	/** @log: A log of recent VM updates */
+	struct msm_gem_vm_log_entry *log;
+
+	/** @log_shift: length of @log is (1 << @log_shift) */
+	uint32_t log_shift;
+
+	/** @log_idx: index of next @log entry to write */
+	uint32_t log_idx;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
@@ -115,6 +138,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
 void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+void msm_gem_vm_unusable(struct drm_gpuvm *gpuvm);
 
 struct msm_fence_context;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6ec92b7771f5..9564e40c542f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -17,6 +17,10 @@
 
 #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
 
+static uint vm_log_shift = 0;
+MODULE_PARM_DESC(vm_log_shift, "Length of VM op log");
+module_param_named(vm_log_shift, vm_log_shift, uint, 0600);
+
 /**
  * struct msm_vm_map_op - create new pgtable mapping
  */
@@ -31,6 +35,13 @@ struct msm_vm_map_op {
 	struct sg_table *sgt;
 	/** @prot: the mapping protection flags */
 	int prot;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
 };
 
 /**
@@ -41,6 +52,13 @@ struct msm_vm_unmap_op {
 	uint64_t iova;
 	/** @range: size of region to unmap */
 	uint64_t range;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
 };
 
 /**
@@ -144,16 +162,87 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 		vm->mmu->funcs->destroy(vm->mmu);
 	dma_fence_put(vm->last_fence);
 	put_pid(vm->pid);
+	kfree(vm->log);
 	kfree(vm);
 }
 
+/**
+ * msm_gem_vm_unusable() - Mark a VM as unusable
+ * @vm: the VM to mark unusable
+ */
+void
+msm_gem_vm_unusable(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	uint32_t vm_log_len = (1 << vm->log_shift);
+	uint32_t vm_log_mask = vm_log_len - 1;
+	uint32_t nr_vm_logs;
+	int first;
+
+	vm->unusable = true;
+
+	/* Bail if no log, or empty log: */
+	if (!vm->log || !vm->log[0].op)
+		return;
+
+	mutex_lock(&vm->mmu_lock);
+
+	/*
+	 * log_idx is the next entry to overwrite, meaning it is the oldest, or
+	 * first, entry (other than the special case handled below where the
+	 * log hasn't wrapped around yet)
+	 */
+	first = vm->log_idx;
+
+	if (!vm->log[first].op) {
+		/*
+		 * If the next log entry has not been written yet, then only
+		 * entries 0 to idx-1 are valid (ie. we haven't wrapped around
+		 * yet)
+		 */
+		nr_vm_logs = MAX(0, first - 1);
+		first = 0;
+	} else {
+		nr_vm_logs = vm_log_len;
+	}
+
+	pr_err("vm-log:\n");
+	for (int i = 0; i < nr_vm_logs; i++) {
+		int idx = (i + first) & vm_log_mask;
+		struct msm_gem_vm_log_entry *e = &vm->log[idx];
+		pr_err("  - %s:%d: 0x%016llx-0x%016llx\n",
+		       e->op, e->queue_id, e->iova,
+		       e->iova + e->range);
+	}
+
+	mutex_unlock(&vm->mmu_lock);
+}
+
 static void
-vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int queue_id)
 {
+	int idx;
+
 	if (!vm->managed)
 		lockdep_assert_held(&vm->mmu_lock);
 
-	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+	vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova + range);
+
+	if (!vm->log)
+		return;
+
+	idx = vm->log_idx;
+	vm->log[idx].op = op;
+	vm->log[idx].iova = iova;
+	vm->log[idx].range = range;
+	vm->log[idx].queue_id = queue_id;
+	vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
+}
+
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -161,10 +250,7 @@ vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 static int
 vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 {
-	if (!vm->managed)
-		lockdep_assert_held(&vm->mmu_lock);
-
-	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+	vm_log(vm, "map", op->iova, op->range, op->queue_id);
 
 	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
 				   op->range, op->prot);
@@ -382,6 +468,7 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
 static int
 msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 {
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
 	struct drm_gem_object *obj = op->map.gem.obj;
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
@@ -412,6 +499,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 			.range = vma->va.range,
 			.offset = vma->gem.offset,
 			.prot = prot,
+			.queue_id = job->queue->id,
 		},
 		.obj = vma->gem.obj,
 	});
@@ -445,6 +533,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.unmap = {
 				.iova = unmap_start,
 				.range = unmap_range,
+				.queue_id = job->queue->id,
 			},
 			.obj = orig_vma->gem.obj,
 		});
@@ -506,6 +595,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 static int
 msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
 {
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
@@ -520,6 +610,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
 		.unmap = {
 			.iova = vma->va.addr,
 			.range = vma->va.range,
+			.queue_id = job->queue->id,
 		},
 		.obj = vma->gem.obj,
 	});
@@ -584,7 +675,7 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	 * now the VM is in an undefined state.  Game over!
 	 */
 	if (ret)
-		vm->unusable = true;
+		msm_gem_vm_unusable(job->vm);
 
 	job_foreach_bo (obj, job) {
 		msm_gem_lock(obj);
@@ -695,6 +786,23 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
+	/*
+	 * We don't really need vm log for kernel managed VMs, as the kernel
+	 * is responsible for ensuring that GEM objs are mapped if they are
+	 * used by a submit.  Furthermore we piggyback on mmu_lock to serialize
+	 * access to the log.
+	 *
+	 * Limit the max log_shift to 8 to prevent userspace from asking us
+	 * for an unreasonable log size.
+	 */
+	if (!managed)
+		vm->log_shift = MIN(vm_log_shift, 8);
+
+	if (vm->log_shift) {
+		vm->log = kmalloc_array(1 << vm->log_shift, sizeof(vm->log[0]),
+					GFP_KERNEL | __GFP_ZERO);
+	}
+
 	return &vm->base;
 
 err_free_dummy:
@@ -1161,7 +1269,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 			 * state the vm is in.  So throw up our hands!
 			 */
 			if (i > 0)
-				vm->unusable = true;
+				msm_gem_vm_unusable(job->vm);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ccd9ebfc5c7c..c317b25a8162 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -259,9 +259,6 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 {
 	extern bool rd_full;
 
-	if (!submit)
-		return;
-
 	if (msm_context_is_vmbind(submit->queue->ctx)) {
 		struct drm_exec exec;
 		struct drm_gpuva *vma;
@@ -318,6 +315,48 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 	}
 }
 
+static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_vm *vm)
+{
+	uint32_t vm_log_len = (1 << vm->log_shift);
+	uint32_t vm_log_mask = vm_log_len - 1;
+	int first;
+
+	/* Bail if no log, or empty log: */
+	if (!vm->log || !vm->log[0].op)
+		return;
+
+	mutex_lock(&vm->mmu_lock);
+
+	/*
+	 * log_idx is the next entry to overwrite, meaning it is the oldest, or
+	 * first, entry (other than the special case handled below where the
+	 * log hasn't wrapped around yet)
+	 */
+	first = vm->log_idx;
+
+	if (!vm->log[first].op) {
+		/*
+		 * If the next log entry has not been written yet, then only
+		 * entries 0 to idx-1 are valid (ie. we haven't wrapped around
+		 * yet)
+		 */
+		state->nr_vm_logs = MAX(0, first - 1);
+		first = 0;
+	} else {
+		state->nr_vm_logs = vm_log_len;
+	}
+
+	state->vm_logs = kmalloc_array(
+		state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
+	for (int i = 0; i < state->nr_vm_logs; i++) {
+		int idx = (i + first) & vm_log_mask;
+
+		state->vm_logs[i] = vm->log[idx];
+	}
+
+	mutex_unlock(&vm->mmu_lock);
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
@@ -351,7 +390,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
-	crashstate_get_bos(state, submit);
+	if (submit) {
+		crashstate_get_vm_logs(state, to_msm_vm(submit->vm));
+		crashstate_get_bos(state, submit);
+	}
 
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
@@ -452,7 +494,7 @@ static void recover_worker(struct kthread_work *work)
 		 * VM_BIND)
 		 */
 		if (!vm->managed)
-			vm->unusable = true;
+			msm_gem_vm_unusable(submit->vm);
 	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5705e8d4e6b9..b2a96544f92a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -20,6 +20,7 @@
 #include "msm_gem.h"
 
 struct msm_gem_submit;
+struct msm_gem_vm_log_entry;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
 struct msm_context;
@@ -603,6 +604,9 @@ struct msm_gpu_state {
 
 	struct msm_gpu_fault_info fault_info;
 
+	int nr_vm_logs;
+	struct msm_gem_vm_log_entry *vm_logs;
+
 	int nr_bos;
 	struct msm_gpu_state_bo *bos;
 };
-- 
2.50.0

