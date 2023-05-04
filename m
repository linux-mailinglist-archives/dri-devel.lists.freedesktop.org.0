Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD6F6F6A7E
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7F10E374;
	Thu,  4 May 2023 11:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474B210E36F;
 Thu,  4 May 2023 11:52:18 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so16459660a12.0; 
 Thu, 04 May 2023 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201136; x=1685793136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xecl9Lr+27K/5gjSt9ro+Gbq04z5Nynp+kKmwNVSYUQ=;
 b=anMROPWRjnrwepLITP/4a7B54fpfwcxIwdWdRhak/ItX/EWmNIfyXsaTrMauhcYR0V
 +NKHru9C62CWTX7mv2An9bzlCrNAteUyWEQOvDXLQY2YRHH9vDkSNp+Ew8KSIHiQWaDB
 ORxd9TGLHqVoT199tRC77bEQ6JKvmiCBhUVx6e3MTy9mnFA+Aj5vTgJLjKqjomntwCj5
 Ym7jeDVbPwkUi7OmvdFQSmATZKKYJXaZmxYd5rnShsfdl037zrRicnx3QYFEjWpHh7x9
 PeNuOpBg+Dz5iOwEYJlk6IsKPfpvG+W2AYHouUIKvpdlRlXJ9Bdm6wQCL8O1J83vUxz6
 /wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201136; x=1685793136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xecl9Lr+27K/5gjSt9ro+Gbq04z5Nynp+kKmwNVSYUQ=;
 b=KuJ0QSFBIkTNC6MXkSAX9iVEBOuJ+NsyWuxS4T0KG4MvY7lH2pPbXvIPoAq5N2qi36
 A+kq8Fkdg/E2fta7gTBock92xnSWaM/GBxyAj0nu0KO6v3FDN82J3nk5Tgh75aMC1agC
 diceHm+LJbyge15ogRAQGtj1QHQT3kAID2kUvO3WVC1nIXT++rctUlMRWVijWyy1jPHg
 U+LB6mLOP71UDV2KtGglMf6y63XuvLuyTMdae+t3tik5Lj+n3S1Kxf1F8RgO6Zsqdza3
 LQZVMa6IdLkhV84LSSOTpXhYvb0TKZS3iTaVlI4QNAA5zjXGyrqzQXh5vVR00u4KKL/f
 pRPQ==
X-Gm-Message-State: AC+VfDwB7UhMxi28HAcYr2A57VuVGxf8yEpH+kE30HxWT61u2UbuH0Nq
 iuL3Pjcz8wpGC3xRBj9nWhE=
X-Google-Smtp-Source: ACHHUZ7B6CHHSqsee1byKwISDp8U/2HTVWyHaOA6U01bgGu+jXTzG4CULnGPPzfpUYVBwVc4nROJgg==
X-Received: by 2002:a17:907:1c8f:b0:94f:705e:d9e4 with SMTP id
 nb15-20020a1709071c8f00b0094f705ed9e4mr5217581ejc.31.1683201136243; 
 Thu, 04 May 2023 04:52:16 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/panfrost: switch to using drm_exec
Date: Thu,  4 May 2023 13:51:57 +0200
Message-Id: <20230504115159.2245-12-christian.koenig@amd.com>
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
 drivers/gpu/drm/panfrost/Kconfig        |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index e6403a9d66ad..e86a1a2fd8e1 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -7,6 +7,7 @@ config DRM_PANFROST
 	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
 	select DRM_SCHED
+	select DRM_EXEC
 	select IOMMU_SUPPORT
 	select IOMMU_IO_PGTABLE_LPAE
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..7086a6044355 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-resv.h>
+#include <drm/drm_exec.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/panfrost_drm.h>
 
@@ -275,13 +276,13 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
-	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
-					    &acquire_ctx);
+	drm_exec_init(&exec, true);
+	ret = drm_exec_prepare_array(&exec, job->bos, job->bo_count, 1);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	mutex_lock(&pfdev->sched_lock);
 	drm_sched_job_arm(&job->base);
@@ -305,7 +306,7 @@ int panfrost_job_push(struct panfrost_job *job)
 				      job->render_done_fence);
 
 unlock:
-	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
+	drm_exec_fini(&exec);
 
 	return ret;
 }
-- 
2.34.1

