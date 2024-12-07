Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C089E80BB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AA210E629;
	Sat,  7 Dec 2024 16:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRGVbtEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F5210E48A;
 Sat,  7 Dec 2024 16:18:07 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-215bebfba73so29694645ad.1; 
 Sat, 07 Dec 2024 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588287; x=1734193087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5h1uhcGe1shthBGxBVlrXLlTzIKG363gSG371Gar4pg=;
 b=DRGVbtEu23bsuF2qYOGDG+vzRLPydTeutIm7U6WoAG4a7WtzN64d6WKAjytTv1wXi/
 wPcZltts0XjuLnHxYwOgM8qBoY4PiHi0m2glkLJGfA0z5M3x8uSjy9T4qpgdjjg4BjkC
 bKKl2TZv/brg6tVveY+YzKItNMRJ0pbEj+mu/36eliYdnxJeKttfPihz+k6CR1VQs+tn
 EnVi/DCVoUyfnKPqMyBBZV2tRiBN+G+M9enGNZPykPCGpluQ8q1sRDkKKp5cr5pq/cEc
 lmluwM4GQs+JPmx0NCMhJbk0JhE8f2vJjKrggzhfSka7WZ0F75JPWrQjluF6kuTDzv3n
 lW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588287; x=1734193087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5h1uhcGe1shthBGxBVlrXLlTzIKG363gSG371Gar4pg=;
 b=MQxJypJVUYyGP4tnj1Yo+kVqqMrlLPzFby1kVRb/AJdQq4FLoi5i7VzToXTZXReOZi
 oXaFxBJFG1Lp3KttOUFpDNy983Dbwv0NHtBS2uaLDbHSx0z3woFJijkB6I5Giuta3sxY
 tKmY1CZsCg/6zogEJSplqXXwHot/jvGJ/oWxGPl/cO5/0AhLa0gmmtvjhhiwPcCpp7ML
 9tsOVemx+hf5HcMtoejqufTRFUVbhkLmc9z+Bl17jhqLvjvFUFzKwXeAGPBg67fLaLyJ
 BR4QWLwK782UfW8SdRMUVc08svkg9jCcw7MTCVGP6gU0nNttMZ2UQWdKf9PJH0DFFw89
 0y2g==
X-Gm-Message-State: AOJu0Yxc1S5+mp0ngaAfWncKgeyPulyQmlHWgTg+xXQc/yufBku6tILK
 CVX1+M+VOX/DwymfjaCWY5Z1jz63nh7MGiCDHgaiuU+7Z1ACT9y8XVxJQg==
X-Gm-Gg: ASbGncuCA2SfUNVjeq9sEgtEnDrz7oqdKRvnozhAuFxQczYhOABebEp24EGTtY0UdCY
 TyqtI0uuH/wiM8F1JmbOC32jHN5fRrRqoeivZzBWjPiiCjSSKLcGSV45gMjw9FYgrS1REXVGZLx
 ZXTw5NUiEoj26dH2ZQMJe3MzcXI/Dsvh2nh9tota8yQIvgGCImAwxZt0Xl6owyS1/+KqCu5UTHO
 9XFizpES4/h/ui28kuArNLVTcMnnuqHyVAexDSAm00KfrnQZaZMYYcuOXgG11Q2LoR3fSiG3UZt
 w7sWbb6R
X-Google-Smtp-Source: AGHT+IHoc0cdu0fl4BkIxjrGdBeLkPtIQTBBV4VaO5/T66Kf51XXGOzTpAEPXBeRnjy6Om3Oobigjg==
X-Received: by 2002:a17:903:240a:b0:212:fa3:f627 with SMTP id
 d9443c01a7336-21614d457ebmr125472915ad.16.1733588286604; 
 Sat, 07 Dec 2024 08:18:06 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21631bd2c2dsm9980865ad.263.2024.12.07.08.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:18:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Subject: [RFC 16/24] drm/msm: Extend SUBMIT ioctl for VM_BIND
Date: Sat,  7 Dec 2024 08:15:16 -0800
Message-ID: <20241207161651.410556-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
index 79bbe552f23e..9ac74f9a139e 100644
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
2.47.1

