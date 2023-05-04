Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C426F6A7A
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195710E355;
	Thu,  4 May 2023 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1EC10E296;
 Thu,  4 May 2023 11:52:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9659e9bbff5so65104066b.1; 
 Thu, 04 May 2023 04:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201134; x=1685793134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ihFvY4+QgOpc61y6ymghaJ5PuSAmDxogzqeL7Ts3Tc=;
 b=BxdqNdpQJdv9d7TDCCA4CUYnGZmWg3Pws2DxSVwFSC/G9sqSTYhXxsMXT8AzqFf7+Y
 kANvsyZNdjMbmu0quBVJ9zK9JCjeWIYj/v6Fnbhm2LPec1iGc1cXaqkB1vfx9LQaMbHC
 4Hum7vYRrp3nJhEEr/hEuiwR/48pb8Jpyu1P16GCTbgjctm/ujSJlnKhVL2t/VgB6hrx
 BuRbe3uCaxAzJNnLOX/s4/6md/WP4n4lQ4neW3+2akPbjSWodz+atnBNI6BlDIh9nJUP
 BiXF9F3rycJFLL2GmsXtwRlRrtQ1txf0xc7De2J+2TpCwv75irNPdjYQHLn5nIzEVRwI
 ijhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201134; x=1685793134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ihFvY4+QgOpc61y6ymghaJ5PuSAmDxogzqeL7Ts3Tc=;
 b=WWhACCy5K3ocv/allPkc2MAANMVSi2ItKusAuzY+T+5PzszhIxRSBhn6FnRcq23Dkj
 0dEvwQfDsmsB6707r1QYchJrTtccthiMdY75BBdOGRuLC74RfGQEDJh7RlwbT+JdyJXU
 DnuBpk09/5i5fOjSlJrXDCLP73a84uK8hzjznNNmFH49FAr9Y3D+xRE9Exy+lQhLmxKy
 Y81e/HxGNY6RtW5Iqeh6bdErhJGnPctlsPLc6XHNw6cX/IwEfzQrGQaO6+asp0Dbp3b4
 4ce6NWVPu6vSDhHP2tfRq4V2wZgP/tVA5RUs2aDtNFhxuYbIr8m1cSfpc3nUs4+3nc5k
 PNmA==
X-Gm-Message-State: AC+VfDxNsl0Yo+T4RumVqmbJEHn6MXkVqYdHe7yiVtoYv9P/iCABjFEx
 x3/atBIeX7xGLLnkmdDE+8BxDRyLNWI=
X-Google-Smtp-Source: ACHHUZ5cc005mQQvaTx7N+q5079HZKwFGK/TVBuB2j8qy8PQZoEU8Y1Nd8lwKWlQRk/LOH5l9fJNQw==
X-Received: by 2002:a17:907:6d83:b0:94a:a6f0:876a with SMTP id
 sb3-20020a1709076d8300b0094aa6f0876amr6358622ejc.1.1683201134029; 
 Thu, 04 May 2023 04:52:14 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 09/13] drm/lima: switch to using drm_exec
Date: Thu,  4 May 2023 13:51:55 +0200
Message-Id: <20230504115159.2245-10-christian.koenig@amd.com>
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
 drivers/gpu/drm/lima/Kconfig    |  1 +
 drivers/gpu/drm/lima/lima_gem.c | 15 +++++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index fa1d4f5df31e..1d2871d9ddd2 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -9,6 +9,7 @@ config DRM_LIMA
        depends on COMMON_CLK
        depends on OF
        select DRM_SCHED
+       select DRM_EXEC
        select DRM_GEM_SHMEM_HELPER
        select PM_DEVFREQ
        select DEVFREQ_GOV_SIMPLE_ONDEMAND
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 10252dc11a22..f48c1edff07d 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -8,6 +8,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_file.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
@@ -292,7 +293,7 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 {
 	int i, err = 0;
-	struct ww_acquire_ctx ctx;
+	struct drm_exec exec;
 	struct lima_drm_priv *priv = to_lima_drm_priv(file);
 	struct lima_vm *vm = priv->vm;
 	struct drm_syncobj *out_sync = NULL;
@@ -329,8 +330,9 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		bos[i] = bo;
 	}
 
-	err = drm_gem_lock_reservations((struct drm_gem_object **)bos,
-					submit->nr_bos, &ctx);
+	drm_exec_init(&exec, true);
+	err = drm_exec_prepare_array(&exec, (struct drm_gem_object **)bos,
+				     submit->nr_bos, 0);
 	if (err)
 		goto err_out0;
 
@@ -360,9 +362,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 				   submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE ?
 				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
 	}
-
-	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
-				    submit->nr_bos, &ctx);
+	drm_exec_fini(&exec);
 
 	for (i = 0; i < submit->nr_bos; i++)
 		drm_gem_object_put(&bos[i]->base.base);
@@ -379,8 +379,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 err_out2:
 	lima_sched_task_fini(submit->task);
 err_out1:
-	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
-				    submit->nr_bos, &ctx);
+	drm_exec_fini(&exec);
 err_out0:
 	for (i = 0; i < submit->nr_bos; i++) {
 		if (!bos[i])
-- 
2.34.1

