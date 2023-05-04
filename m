Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0D6F6A84
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B2B10E2A5;
	Thu,  4 May 2023 11:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EED210E36A;
 Thu,  4 May 2023 11:52:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-953343581a4so55721066b.3; 
 Thu, 04 May 2023 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201138; x=1685793138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mnq21xeC5PBktOwpUZOwl+9/mQAce86nMhSFfY6zwFE=;
 b=Bbff5qtduchfb2V1ztt66+foiFPQV7Gq7wGzE33mu5rUf8XBfpkm+ddxa03r0xKpxG
 CvNYcBqs77twcLhfbjod34BJsZGxK4sYaF1yuCEGHcLz+XvMlFnvYCAQF9DZ/YExCiX6
 MRgVZGX/MicpDk7+FDiQ7gRWFG9GCOPM5OFYSaCwJNg3yJyNL3kTcvhq7g9vqpL7mPcr
 xKR8VaqvAkZJ011F2GjK4m/vvyNQtxx861fRWtrueVJhqff5u7jGg8YHigEgzYyJQM0P
 Pxf6LyMZrnRnbh+EGlZDDuOif9OsTTb7Pn0xK7bsADI1K4U5DuYGewgRvVO5YPAGg+sF
 ftVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201138; x=1685793138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mnq21xeC5PBktOwpUZOwl+9/mQAce86nMhSFfY6zwFE=;
 b=RlEi9BZUE49Hj6S0+3dzD+vYCdymtq+7kNDGS9cBJpg6QWzEw4Z+7SxjS9AhKrxI+l
 Dyb8+cU2AlF3eXq+sZ7mVUiJAgGifs1xIzXOrBovQwCahcUv5h8R7GfblqXTizEUYlS1
 7R7RNn7wdEEpxnt0D9h1sX1MCKplldIkvnDcVuuKXbNI0iSFw7RdI/Lz5EEk7V/x+OtX
 kRPIafkhV7k8nahEhe30xsjo3+9WbLdvsHwF+uBiCxZQjBJZGXxm64o1RZClzgbpX7u7
 /FB5CKsJ2VtuoR7oetrNMbzXSPXTRmi+niz7pH0AW3h6DSE5bbCehHFYQjR2Z0qpAN1t
 EI/w==
X-Gm-Message-State: AC+VfDy7/f7+4dXqmfXfK+dForbCvjt1rufU9wTZmg5+2TXmqooOXtrL
 8AjKI5+kVeuygd9TxdE4TbI=
X-Google-Smtp-Source: ACHHUZ7/ppLO43UZTLfNrCGA+/U7sy6Puxmfa+eyl3b3vWy5s98BGmkoDgrmjGZM0JXTWbFVcIBlLw==
X-Received: by 2002:a17:907:daa:b0:94f:3eec:f6b5 with SMTP id
 go42-20020a1709070daa00b0094f3eecf6b5mr6245199ejc.57.1683201137457; 
 Thu, 04 May 2023 04:52:17 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] drm/v3d: switch to using drm_exec
Date: Thu,  4 May 2023 13:51:58 +0200
Message-Id: <20230504115159.2245-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 43 ++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..75880ffc0cf1 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -10,6 +10,7 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/v3d_drm.h>
@@ -249,20 +250,16 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
  * to v3d, so we don't attach dma-buf fences to them.
  */
 static int
-v3d_lock_bo_reservations(struct v3d_job *job,
-			 struct ww_acquire_ctx *acquire_ctx)
+v3d_lock_bo_reservations(struct v3d_job *job, struct drm_exec *exec)
 {
 	int i, ret;
 
-	ret = drm_gem_lock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_init(exec, true);
+	ret = drm_exec_prepare_array(exec, job->bo, job->bo_count, 1);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < job->bo_count; i++) {
-		ret = dma_resv_reserve_fences(job->bo[i]->resv, 1);
-		if (ret)
-			goto fail;
-
 		ret = drm_sched_job_add_implicit_dependencies(&job->base,
 							      job->bo[i], true);
 		if (ret)
@@ -272,7 +269,7 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 	return 0;
 
 fail:
-	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_fini(exec);
 	return ret;
 }
 
@@ -477,7 +474,7 @@ v3d_push_job(struct v3d_job *job)
 static void
 v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 					 struct v3d_job *job,
-					 struct ww_acquire_ctx *acquire_ctx,
+					 struct drm_exec *exec,
 					 u32 out_sync,
 					 struct v3d_submit_ext *se,
 					 struct dma_fence *done_fence)
@@ -492,7 +489,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 				   DMA_RESV_USAGE_WRITE);
 	}
 
-	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_fini(exec);
 
 	/* Update the return sync object for the job */
 	/* If it only supports a single signal semaphore*/
@@ -669,7 +666,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_render_job *render = NULL;
 	struct v3d_job *clean_job = NULL;
 	struct v3d_job *last_job;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
 	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
@@ -731,7 +728,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto fail;
 
-	ret = v3d_lock_bo_reservations(last_job, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(last_job, &exec);
 	if (ret)
 		goto fail;
 
@@ -775,7 +772,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 last_job,
-						 &acquire_ctx,
+						 &exec,
 						 args->out_sync,
 						 &se,
 						 last_job->done_fence);
@@ -791,8 +788,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
 fail_perfmon:
-	drm_gem_unlock_reservations(last_job->bo,
-				    last_job->bo_count, &acquire_ctx);
+	drm_exec_fini(&exec);
 fail:
 	v3d_job_cleanup((void *)bin);
 	v3d_job_cleanup((void *)render);
@@ -819,7 +815,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_submit_ext se = {0};
 	struct v3d_tfu_job *job = NULL;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
@@ -870,7 +866,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		job->base.bo[job->base.bo_count] = bo;
 	}
 
-	ret = v3d_lock_bo_reservations(&job->base, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(&job->base, &exec);
 	if (ret)
 		goto fail;
 
@@ -879,7 +875,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
-						 &job->base, &acquire_ctx,
+						 &job->base, &exec,
 						 args->out_sync,
 						 &se,
 						 job->base.done_fence);
@@ -914,7 +910,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	struct v3d_submit_ext se = {0};
 	struct v3d_csd_job *job = NULL;
 	struct v3d_job *clean_job = NULL;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret;
 
 	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args->cfg[6]);
@@ -957,7 +953,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto fail;
 
-	ret = v3d_lock_bo_reservations(clean_job, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(clean_job, &exec);
 	if (ret)
 		goto fail;
 
@@ -983,7 +979,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 clean_job,
-						 &acquire_ctx,
+						 &exec,
 						 args->out_sync,
 						 &se,
 						 clean_job->done_fence);
@@ -996,8 +992,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
 fail_perfmon:
-	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
-				    &acquire_ctx);
+	drm_exec_fini(&exec);
 fail:
 	v3d_job_cleanup((void *)job);
 	v3d_job_cleanup(clean_job);
-- 
2.34.1

