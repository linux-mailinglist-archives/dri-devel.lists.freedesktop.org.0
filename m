Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93058A6916D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2110E52E;
	Wed, 19 Mar 2025 14:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P9hO1uLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250D10E532;
 Wed, 19 Mar 2025 14:55:40 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-224019ad9edso25546365ad.1; 
 Wed, 19 Mar 2025 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396140; x=1743000940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFp5gYDsJKKjusUsNUKNLygAl2cHqL42U7ejjcZcvPI=;
 b=P9hO1uLh/lVKuhfNPmOkUWc2UcGHFv9MkDe2wNgAl73mvPbdAlPUNSFNMxIDRGGK45
 jHnkSvKAoVzzoVZFfo17mrRogE339AkDWu0SncAUz1p+QsA7+7vZ0Jch8DsVNqypCn4v
 eb1F4I7q0+WYTCO+3dl7qrNQS+eoZYTZyVLJ+M9dKgM9A3xiVqc+c7SRCogErC9kF39Q
 mxxfDLtxkJ846VC3NjqvX3s8xvwGdbNyh3dGOaTQvOUFHGWHPGfpX2DZwVoLCJ6Mw+CP
 vGr0ZD7oyi0zJ0JnkZb3CuNg4pVeK0eRgtlfigl7U3KhIBso+qxCvkdqeHjWG3eY0O28
 WJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396140; x=1743000940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFp5gYDsJKKjusUsNUKNLygAl2cHqL42U7ejjcZcvPI=;
 b=ewF+djKxFeuTu3N51kI8qcaeczjvfcElNMfqIP/vUBGhMnfgc+lIbT2TVUmaeLLP84
 Wc5PPIzA3uIjwujbQfILnLnluUVwbQ19oB5wAW0ZXW35Q2WfhG/w3tjClMEBH8xH/FdR
 NQo2f6m0gn+frAVH3nblrqLiN9Ay4uXANQlIBZyf2DLWr8Vxw48X0e8o87bcyTnS3xSl
 kgBMdToHqfRgC2B53fJqKx4bSTQwjN0pzvieu4ajjBM8fKm/ugwGYTNFUuXSpkCLzNbE
 D9d9grj1pIT60ORH2Eh5h+h5q+pZihv8B7QLaL0itBBLV3MTVrWl2qTOULNynXVr+uNP
 zmVg==
X-Gm-Message-State: AOJu0YyG/D5sTsEuIGGPRbC36bwgCckASjpD3Er3BcXw0pr7jftRwp9k
 pz/mAJJfqyy/9B5ZCK6XKwBXoo7D4CbBiFcDpVTmr3SUOuwWw8S+ZiTp+A==
X-Gm-Gg: ASbGncso7NLL7IK1IhMbQnx2Nyw+Dr3WN5gz7k5UQuS168xOrfLqZNWgajGeWILPD3w
 aEyb32Cl6+kzhSr2i+OXMQ7Zdi+6tfVltyYnbopMiMqDx8xpAoQUkRw2YbD7qDWixN6WWGLZL0Y
 1y6mdf+xnmHwqPYTpvVB73CpLl4EIp5TxVzXxlboWUNOLuiuB9DWyrgjEPj2rcmpDcz3MP28EqB
 5w1WUmORYrvp9C4/ME/r4IsIK9OzFIh1UuPQj46fM0E8aUEkeLpJzWZMTjKCli01cYYbCg4WL+a
 AB4UW2UDKDLwgesrj2rxrn+3IiHxuZuCseTOBekJSvhz1IVmaZCuVQ9ty3hrnKNUJOLMF/kQjfn
 Jf4uUk1fRmUir7q3KKa4=
X-Google-Smtp-Source: AGHT+IEqIieP8fKBMjMJOk9V0T6bFwZVD5WXsDeLdLV0AxJjABCMvE+1HFXmwXd0HLstQOzQ1r9vkA==
X-Received: by 2002:a17:903:41d0:b0:224:24d3:6103 with SMTP id
 d9443c01a7336-22649a80c3fmr53570765ad.35.1742396139817; 
 Wed, 19 Mar 2025 07:55:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68a8796sm114893425ad.99.2025.03.19.07.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
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
Subject: [PATCH v2 17/34] drm/msm: Extend SUBMIT ioctl for VM_BIND
Date: Wed, 19 Mar 2025 07:52:29 -0700
Message-ID: <20250319145425.51935-18-robdclark@gmail.com>
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

This is a bit different than the path taken by other clean-slate
drivers.  But there is a lot in similar with BO pinning in the legacy
"EXEC" path and "VM_BIND" MAP path.  Also, we want the same fence and
syncobj handling.

(Why bother with fence fd's?  Because for virtgpu nctx for, guest
syncobj's exist only as dma_fence's between the guest kernel and host.)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 10 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c | 65 ++++++++++++++++++++++++----
 include/uapi/drm/msm_drm.h           | 49 ++++++++++++++++++---
 3 files changed, 103 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7cb720137548..8e29e36ca9c5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -345,13 +345,13 @@ struct msm_gem_submit {
 		uint32_t nr_relocs;
 		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
-	struct {
+	struct msm_gem_submit_bo {
 		uint32_t flags;
-		union {
-			struct drm_gem_object *obj;
-			uint32_t handle;
-		};
+		uint32_t handle;
+		struct drm_gem_object *obj;
 		uint64_t iova;
+		uint64_t bo_offset;
+		uint64_t range;
 	} bos[];
 };
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9cef308a0ad1..bb61231ab8ba 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -115,23 +115,37 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	kfree(submit);
 }
 
+static bool invalid_alignment(uint64_t addr)
+{
+	/*
+	 * Technically this is about GPU alignment, not CPU alignment.  But
+	 * I've not seen any qcom SoC where the SMMU does not support the
+	 * CPU's smallest page size.
+	 */
+	return !PAGE_ALIGNED(addr);
+}
+
 static int submit_lookup_objects(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
-	unsigned i;
+	unsigned i, bo_stride = args->bos_stride;
 	int ret = 0;
 
+	if (!bo_stride)
+		bo_stride = sizeof(struct drm_msm_gem_submit_bo);
+
 	for (i = 0; i < args->nr_bos; i++) {
-		struct drm_msm_gem_submit_bo submit_bo;
+		struct drm_msm_gem_submit_bo_v2 submit_bo = {0};
 		void __user *userptr =
-			u64_to_user_ptr(args->bos + (i * sizeof(submit_bo)));
+			u64_to_user_ptr(args->bos + (i * bo_stride));
+		unsigned copy_sz = min(bo_stride, sizeof(submit_bo));
 
 		/* make sure we don't have garbage flags, in case we hit
 		 * error path before flags is initialized:
 		 */
 		submit->bos[i].flags = 0;
 
-		if (copy_from_user(&submit_bo, userptr, sizeof(submit_bo))) {
+		if (copy_from_user(&submit_bo, userptr, copy_sz)) {
 			ret = -EFAULT;
 			i = 0;
 			goto out;
@@ -141,14 +155,27 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 #define MANDATORY_FLAGS (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
 
 		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
-			!(submit_bo.flags & MANDATORY_FLAGS)) {
+		    !(submit_bo.flags & MANDATORY_FLAGS))
 			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
+
+		if (invalid_alignment(submit_bo.address))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid address: %016llx\n", submit_bo.address);
+
+		if (invalid_alignment(submit_bo.bo_offset))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid bo_offset: %016llx\n", submit_bo.bo_offset);
+
+		if (invalid_alignment(submit_bo.range))
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid range: %016llx\n", submit_bo.range);
+
+		if (ret) {
 			i = 0;
 			goto out;
 		}
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
+		submit->bos[i].bo_offset = submit_bo.bo_offset;
+		submit->bos[i].range = submit_bo.range;
 	}
 
 	spin_lock(&file->table_lock);
@@ -167,6 +194,15 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		drm_gem_object_get(obj);
 
+		if (submit->bos[i].bo_offset > obj->size)
+			ret = SUBMIT_ERROR(EINVAL, submit, "bo_offset to large: %016llx\n", submit->bos[i].bo_offset);
+
+		if ((submit->bos[i].bo_offset + submit->bos[i].range) > obj->size)
+			ret = SUBMIT_ERROR(EINVAL, submit, "range to large: %016llx\n", submit->bos[i].range);
+
+		if (ret)
+			goto out_unlock;
+
 		submit->bos[i].obj = obj;
 	}
 
@@ -182,6 +218,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
 	unsigned i;
 	size_t sz;
 	int ret = 0;
@@ -213,6 +250,19 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			goto out;
 		}
 
+		if (msm_context_is_vmbind(ctx)) {
+			if (submit_cmd.nr_relocs) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "nr_relocs must be zero");
+				goto out;
+			}
+			if (submit_cmd.submit_idx || submit_cmd.submit_offset) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "submit_idx/offset must be zero");
+				goto out;
+			}
+
+			submit->cmd[i].iova = submit_cmd.iova;
+		}
+
 		submit->cmd[i].type = submit_cmd.type;
 		submit->cmd[i].size = submit_cmd.size / 4;
 		submit->cmd[i].offset = submit_cmd.submit_offset / 4;
@@ -665,9 +715,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
-	if (args->pad)
-		return -EINVAL;
-
 	if (to_msm_vm(ctx->vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
@@ -677,7 +724,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
 		return UERR(EINVAL, dev, "invalid pipe");
 
-	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
+	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS)
 		return UERR(EINVAL, dev, "invalid flags");
 
 	if (args->flags & MSM_SUBMIT_SUDO) {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 072e82a80607..1a948d49c610 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -245,7 +245,10 @@ struct drm_msm_gem_submit_cmd {
 	__u32 size;           /* in, cmdstream size */
 	__u32 pad;
 	__u32 nr_relocs;      /* in, number of submit_reloc's */
-	__u64 relocs;         /* in, ptr to array of submit_reloc's */
+	union {
+		__u64 relocs; /* in, ptr to array of submit_reloc's */
+		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
+	};
 };
 
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -264,6 +267,19 @@ struct drm_msm_gem_submit_cmd {
 #define MSM_SUBMIT_BO_DUMP             0x0004
 #define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
 
+/* Map OP for for submits to a VM_BIND submitqueue:
+ *  - MAP:      map a specified range of the BO into the VM
+ *  - MAP_NULL: map a NULL page into the specified range of the VM, handle
+ *              and bo_offset MBZ.  A NULL range will return zero on reads
+ *              and discard writes
+ *              see: VkPhysicalDeviceSparseProperties::residencyNonResidentStrict
+ *  - UNMAP:    unmap a specified VM range, handle and bo_offset MBZ
+ */
+#define MSM_SUBMIT_BO_OP_MASK          0xf000
+#define MSM_SUBMIT_BO_OP_MAP           0x0000
+#define MSM_SUBMIT_BO_OP_MAP_NULL      0x1000
+#define MSM_SUBMIT_BO_OP_UNMAP         0x2000
+
 #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
 					MSM_SUBMIT_BO_WRITE | \
 					MSM_SUBMIT_BO_DUMP | \
@@ -272,7 +288,16 @@ struct drm_msm_gem_submit_cmd {
 struct drm_msm_gem_submit_bo {
 	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
 	__u32 handle;         /* in, GEM handle */
-	__u64 presumed;       /* in/out, presumed buffer address */
+	__u64 address;        /* in/out, presumed buffer address */
+};
+
+struct drm_msm_gem_submit_bo_v2 {
+	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
+	__u32 handle;         /* in, GEM handle */
+	__u64 address;        /* in/out, presumed buffer address */
+	/* Remaining fields are only used with MSM_SUBMIT_OP_VM_BIND/_ASYNC: */
+	__u64 bo_offset;
+	__u64 range;
 };
 
 /* Valid submit ioctl flags: */
@@ -283,7 +308,8 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
 #define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
 #define MSM_SUBMIT_FENCE_SN_IN   0x02000000 /* userspace passes in seqno fence */
-#define MSM_SUBMIT_FLAGS                ( \
+
+#define MSM_SUBMIT_EXEC_FLAGS            ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
 		MSM_SUBMIT_FENCE_FD_OUT  | \
@@ -293,6 +319,13 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
+#define MSM_SUBMIT_VM_BIND_FLAGS         ( \
+		MSM_SUBMIT_FENCE_FD_IN   | \
+		MSM_SUBMIT_FENCE_FD_OUT  | \
+		MSM_SUBMIT_SYNCOBJ_IN    | \
+		MSM_SUBMIT_SYNCOBJ_OUT   | \
+		0)
+
 #define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
 #define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
 		MSM_SUBMIT_SYNCOBJ_RESET | \
@@ -307,14 +340,17 @@ struct drm_msm_gem_submit_syncobj {
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
+ *
+ * For MSM_SUBMIT_VM_BIND/_ASYNC operations, the queue must have been
+ * created with the MSM_SUBMITQUEUE_VM_BIND flag.
  */
 struct drm_msm_gem_submit {
 	__u32 flags;          /* MSM_PIPE_x | MSM_SUBMIT_x */
 	__u32 fence;          /* out (or in with MSM_SUBMIT_FENCE_SN_IN flag) */
 	__u32 nr_bos;         /* in, number of submit_bo's */
-	__u32 nr_cmds;        /* in, number of submit_cmd's */
+	__u32 nr_cmds;        /* in, number of submit_cmd's, MBZ for VM_BIND queue */
 	__u64 bos;            /* in, ptr to array of submit_bo's */
-	__u64 cmds;           /* in, ptr to array of submit_cmd's */
+	__u64 cmds;           /* in, ptr to array of submit_cmd's, MBZ for VM_BIND queue */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
 	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
@@ -322,8 +358,7 @@ struct drm_msm_gem_submit {
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
-	__u32 pad;            /*in, reserved for future use, always 0. */
-
+	__u32 bos_stride;     /* in, stride of bos array, if zero 16bytes used. */
 };
 
 #define MSM_WAIT_FENCE_BOOST	0x00000001
-- 
2.48.1

