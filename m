Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE7AE8D88
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F93410E7F1;
	Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jsjj11g2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D20E10E7DF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAJ73p026920
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F1yQ7yX6yaI
 pkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=; b=Jsjj11g2GaQ7eLpMX999DlmpRRZ
 Qdm/Ot9DBdj2iOFXnlkYR98in9o5uGBvdnv1k+wkco73TQPDbIYTGRVgUPmOQ7ow
 /n/2bFPspIRN5jh4DSRjlSD3kbTpCTjBL/I372r8pp8yrYw2mMtbEwJFFOjzMuak
 4zyG8LJ3c915BHAgGSBWBs2MsN7b/EXj2hzv8VC5kcPJgIYAu60BEB3ro7XTPB3i
 fXFfgFvyOsBMVZhj2IunSw2Y+xwnysfAszBTpzVcLrk5CPfadmwWaIZ5WFYwcNZL
 3V4RD6mV3Ltg9+zGKghl11tkcSygCgzTKoYbxK0BbxwWnOsua9PYFsyO3sw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7489ac848f3so384979b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877947; x=1751482747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1yQ7yX6yaIpkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=;
 b=TU84Kd3Ihtr3BxjPDdwFoyLk4xhC0Xqfv3U58D+s6bcpAHOTscbb1uaeSxzlOfjR8p
 kQqNudoaiTXP7DWqBRz4Kudne7MB3wtn6a9hkykp42e9E0BRsTPNbFNDbGBaoLlG+gtO
 VCBOI5/P0LoZPVvnGGTzRuTeWqcgHrMhmIj3ilhwf08aimsPzNhoY7sjpB0aWqnPwlfc
 +L7oDnVfdarBROn91f7kiEK9HNvjhjNX+u4D/WZkxRjZvCKHTBt4++jzWZw19c/KUWAv
 71wzD125dRwTjFis6PFCOnSqE78touCmvg8eZvSt+pN7PVTgpXfyrkuPd+fP0LhAtGd6
 YB8w==
X-Gm-Message-State: AOJu0YxIP/Wid8okeAhGFblGKKu05oOmECfa/VoDJcp+B1H1WYkYNdLp
 5MO/f2Ot8X2s4pZJVGOea3RCVUI3AwKlSFueYIOB32pB5s0fWr20OLzEu1FBf+i036ooFkiXEQf
 kVTGvM5eYRx2zuAlOrfBQK8rtqSpYHB+SPo8MmHvZqK+dc49f11MxRQDpFhnq6IRA1kpXOnfyJm
 0c2PE=
X-Gm-Gg: ASbGncuJZF1s/fjozZbmeljtrmd4N4NJpjn8NhqiHv2Ba36TLjkYtoxkMIHna7WK566
 iDLvH+yJTJiJB9GHJv35r0DAomxP6sl0KZIVwfaG+p6Zzhly9DwzzJz6NxiW/9LNkbIxkj1m8o5
 ZZRnAiGp/pbfK2Z5nNUpuuS0UAdtLKcNh/L4sCurc8Z+cVrvinjCsqZOWEGcgieeXbuJADg2u8o
 1aFlxV3V0Nbr+omlFGxXOEEcV/F+JiBvQ+O9TDQLWr6tTAI+zAT1KlDpKy3n70BR/w/6CG8ZgNG
 K+5P4YQc2v39AQMkpOex0v24KCbpn3eE
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id
 adf61e73a8af0-2207f1adf3bmr5936424637.9.1750877946422; 
 Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1LmWA4B37cTCZvJEIcBbu0dTeCfOuaoULsy1QTxM37zp0IXZvdQikKnG42zq3g+gUrjS54w==
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id
 adf61e73a8af0-2207f1adf3bmr5936371637.9.1750877945889; 
 Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f125d668sm11591495a12.54.2025.06.25.11.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
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
Subject: [PATCH v7 29/42] drm/msm: Extract out syncobj helpers
Date: Wed, 25 Jun 2025 11:47:22 -0700
Message-ID: <20250625184918.124608-30-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y86tLpetlv4tHsr74lkZue6A6MQNk9OP
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46fc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=ii7SkllToyZ1umWTbp4A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Y86tLpetlv4tHsr74lkZue6A6MQNk9OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX6QJjlZs2GH0g
 ti1WvrAPkcqfhEtZ62ZZkwuoGSuzoDt+LJpiRu1pnyuXGm8EZ7FJH6bQ0ub4tKD8+7tYCrcEbwu
 oFd19g3JXmIVLgrmU9xsIYkM2atTYQntvP3g9or2iVG8gtbpZQGyXextJKrGA9gSUiKFKw1p27G
 6wEMC4xvZW05eWUHatLV8Mr6mhHu99J30cKNFwhFShPBZDSL/6upYbSNLP5sMe2jImoKPrwMxUp
 rIX2RaT6GT1wFG8ajRQ2BEUV11AzgYKOyH/TqnhZ4hB/YPmUB3GhbaHIy4BLykGBZjjREIN2QGO
 9r24xyGq6e4eY3YSBis8gXBe4RJuWDME/9XWpgxeURduQQRW/s4kaHHUP1atuBR9XuNvVvZ5Yeq
 XdqHxeSeO4jQop81Nr+oLsdOgXtrA6wn3ou1y5cONc6Db5amOYKo0ViDbAxa+3JU72gDeIsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

We'll be re-using these for the VM_BIND ioctl.

Also, rename a few things in the uapi header to reflect that syncobj use
is not specific to the submit ioctl.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile         |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 192 ++-------------------------
 drivers/gpu/drm/msm/msm_syncobj.c    | 172 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_syncobj.h    |  37 ++++++
 include/uapi/drm/msm_drm.h           |  26 ++--
 5 files changed, 235 insertions(+), 193 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8..8af34f87e0c8 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -128,6 +128,7 @@ msm-y += \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
+	msm_syncobj.o \
 	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9562b6343e13..9f18771a1e88 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -16,6 +16,7 @@
 #include "msm_gpu.h"
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
+#include "msm_syncobj.h"
 
 /* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
  * error msgs for debugging, but we don't spam dmesg by default
@@ -491,173 +492,6 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	}
 }
 
-struct msm_submit_post_dep {
-	struct drm_syncobj *syncobj;
-	uint64_t point;
-	struct dma_fence_chain *chain;
-};
-
-static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
-                                           struct drm_file *file,
-                                           uint64_t in_syncobjs_addr,
-                                           uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride)
-{
-	struct drm_syncobj **syncobjs = NULL;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
-	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!syncobjs)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_in_syncobjs; ++i) {
-		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = SUBMIT_ERROR(EOPNOTSUPP, submit, "syncobj timeline unsupported");
-			break;
-		}
-
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
-			break;
-		}
-
-		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
-							   syncobj_desc.handle, syncobj_desc.point);
-		if (ret)
-			break;
-
-		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
-			syncobjs[i] =
-				drm_syncobj_find(file, syncobj_desc.handle);
-			if (!syncobjs[i]) {
-				ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj handle: %u", i);
-				break;
-			}
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			if (syncobjs[j])
-				drm_syncobj_put(syncobjs[j]);
-		}
-		kfree(syncobjs);
-		return ERR_PTR(ret);
-	}
-	return syncobjs;
-}
-
-static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
-                               uint32_t nr_syncobjs)
-{
-	uint32_t i;
-
-	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
-		if (syncobjs[i])
-			drm_syncobj_replace_fence(syncobjs[i], NULL);
-	}
-}
-
-static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
-                                                       struct drm_file *file,
-                                                       uint64_t syncobjs_addr,
-                                                       uint32_t nr_syncobjs,
-                                                       size_t syncobj_stride)
-{
-	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
-			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!post_deps)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_syncobjs; ++i) {
-		uint64_t address = syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		post_deps[i].point = syncobj_desc.point;
-
-		if (syncobj_desc.flags) {
-			ret = UERR(EINVAL, dev, "invalid syncobj flags");
-			break;
-		}
-
-		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
-				break;
-			}
-
-			post_deps[i].chain = dma_fence_chain_alloc();
-			if (!post_deps[i].chain) {
-				ret = -ENOMEM;
-				break;
-			}
-		}
-
-		post_deps[i].syncobj =
-			drm_syncobj_find(file, syncobj_desc.handle);
-		if (!post_deps[i].syncobj) {
-			ret = UERR(EINVAL, dev, "invalid syncobj handle");
-			break;
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			dma_fence_chain_free(post_deps[j].chain);
-			if (post_deps[j].syncobj)
-				drm_syncobj_put(post_deps[j].syncobj);
-		}
-
-		kfree(post_deps);
-		return ERR_PTR(ret);
-	}
-
-	return post_deps;
-}
-
-static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
-                                  uint32_t count, struct dma_fence *fence)
-{
-	uint32_t i;
-
-	for (i = 0; post_deps && i < count; ++i) {
-		if (post_deps[i].chain) {
-			drm_syncobj_add_point(post_deps[i].syncobj,
-			                      post_deps[i].chain,
-			                      fence, post_deps[i].point);
-			post_deps[i].chain = NULL;
-		} else {
-			drm_syncobj_replace_fence(post_deps[i].syncobj,
-			                          fence);
-		}
-	}
-}
-
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -668,7 +502,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
-	struct msm_submit_post_dep *post_deps = NULL;
+	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
@@ -745,10 +579,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
-		syncobjs_to_reset = msm_parse_deps(submit, file,
-		                                   args->in_syncobjs,
-		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride);
+		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &submit->base,
+							   file, args->in_syncobjs,
+							   args->nr_in_syncobjs,
+							   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
@@ -756,10 +590,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
-		post_deps = msm_parse_post_deps(dev, file,
-		                                args->out_syncobjs,
-		                                args->nr_out_syncobjs,
-		                                args->syncobj_stride);
+		post_deps = msm_syncobj_parse_post_deps(dev, file,
+							args->out_syncobjs,
+							args->nr_out_syncobjs,
+							args->syncobj_stride);
 		if (IS_ERR(post_deps)) {
 			ret = PTR_ERR(post_deps);
 			goto out_unlock;
@@ -902,10 +736,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->fence_id;
 	queue->last_fence = submit->fence_id;
 
-	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
-	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
-	                      submit->user_fence);
-
+	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, submit->user_fence);
 
 out:
 	submit_cleanup(submit, !!ret);
diff --git a/drivers/gpu/drm/msm/msm_syncobj.c b/drivers/gpu/drm/msm/msm_syncobj.c
new file mode 100644
index 000000000000..4baa9f522c54
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.c
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#include "drm/drm_drv.h"
+
+#include "msm_drv.h"
+#include "msm_syncobj.h"
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride)
+{
+	struct drm_syncobj **syncobjs = NULL;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
+	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!syncobjs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_in_syncobjs; ++i) {
+		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (syncobj_desc.point &&
+		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+			ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+			break;
+		}
+
+		if (syncobj_desc.flags & ~MSM_SYNCOBJ_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags: %x", syncobj_desc.flags);
+			break;
+		}
+
+		ret = drm_sched_job_add_syncobj_dependency(job, file,
+						   syncobj_desc.handle,
+						   syncobj_desc.point);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & MSM_SYNCOBJ_RESET) {
+			syncobjs[i] = drm_syncobj_find(file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = UERR(EINVAL, dev, "invalid syncobj handle: %u", i);
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			if (syncobjs[j])
+				drm_syncobj_put(syncobjs[j]);
+		}
+		kfree(syncobjs);
+		return ERR_PTR(ret);
+	}
+	return syncobjs;
+}
+
+void
+msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride)
+{
+	struct msm_syncobj_post_dep *post_deps;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
+			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!post_deps)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_syncobjs; ++i) {
+		uint64_t address = syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
+
+		if (syncobj_desc.flags) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags");
+			break;
+		}
+
+		if (syncobj_desc.point) {
+			if (!drm_core_check_feature(dev,
+			                            DRIVER_SYNCOBJ_TIMELINE)) {
+				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+				break;
+			}
+
+			post_deps[i].chain = dma_fence_chain_alloc();
+			if (!post_deps[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+
+		post_deps[i].syncobj =
+			drm_syncobj_find(file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = UERR(EINVAL, dev, "invalid syncobj handle");
+			break;
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			dma_fence_chain_free(post_deps[j].chain);
+			if (post_deps[j].syncobj)
+				drm_syncobj_put(post_deps[j].syncobj);
+		}
+
+		kfree(post_deps);
+		return ERR_PTR(ret);
+	}
+
+	return post_deps;
+}
+
+void
+msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+			      uint32_t count, struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; post_deps && i < count; ++i) {
+		if (post_deps[i].chain) {
+			drm_syncobj_add_point(post_deps[i].syncobj,
+			                      post_deps[i].chain,
+			                      fence, post_deps[i].point);
+			post_deps[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(post_deps[i].syncobj,
+			                          fence);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/msm/msm_syncobj.h b/drivers/gpu/drm/msm/msm_syncobj.h
new file mode 100644
index 000000000000..bcaa15d01da0
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#ifndef __MSM_GEM_SYNCOBJ_H__
+#define __MSM_GEM_SYNCOBJ_H__
+
+#include "drm/drm_device.h"
+#include "drm/drm_syncobj.h"
+#include "drm/gpu_scheduler.h"
+
+struct msm_syncobj_post_dep {
+	struct drm_syncobj *syncobj;
+	uint64_t point;
+	struct dma_fence_chain *chain;
+};
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride);
+
+void msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs);
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride);
+
+void msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+				   uint32_t count, struct dma_fence *fence);
+
+#endif /* __MSM_GEM_SYNCOBJ_H__ */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 1bccc347945c..2c2fc4b284d0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -220,6 +220,17 @@ struct drm_msm_gem_cpu_fini {
  * Cmdstream Submission:
  */
 
+#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SYNCOBJ_FLAGS ( \
+		MSM_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* The value written into the cmdstream is logically:
  *
  *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
@@ -309,17 +320,6 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
-#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
-#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
-		MSM_SUBMIT_SYNCOBJ_RESET | \
-		0)
-
-struct drm_msm_gem_submit_syncobj {
-	__u32 handle;     /* in, syncobj handle. */
-	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
-	__u64 point;      /* in, timepoint for timeline syncobjs. */
-};
-
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -333,8 +333,8 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
-- 
2.49.0

