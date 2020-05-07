Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C91C9411
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE696EA18;
	Thu,  7 May 2020 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5C6EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u127so7225771wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7INWt/3YCHbgx5xU3QqSeD5DolfJhaoAwjPypOQ5tY=;
 b=ruIbYQWxH6T53y5WyFpfNJ4KKHMRce3+sjWZhsFPcZePkMvfK8kmZct0Q6rVYOLgmF
 TJPe/MSGRvOCH9UiCNPBra3IyWqEf2efFsxwbuq6IIwtkYuY1qJnRMpSg9xv4CidqbAT
 QHGqEjiElB7PoQd6qvbQilmXmmkWkdppDak939E5GZpBVWzFMUD1g+O28sYA33g2GFYP
 +uopjIxD9vMUqm8OMmWFttCpsvGyQK/IM72PFsDwNlxNhR19nazGDmSY+BrShghXI1Zx
 uuPlZYGf2crdG4nZ5mZEg03/DYdNE8SJ1F63uYLXOFviZlk4tLn2WdF9u2gWl4j2RCJJ
 jRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7INWt/3YCHbgx5xU3QqSeD5DolfJhaoAwjPypOQ5tY=;
 b=OzWc3qcau5QWL0zvEdrxOzM3AGgweFNhRXPhMoEz/m9GUvSJ+htTVtPvrLewDR/vwk
 MHn4GrgiXY3tckPlvxNpnB+zLAHxTkbjFapVBJGS8Agbbh2YkSO19Jnqk266aIYzdFjk
 RgvOiix/oaaY02RIQHbUcGfYsr1Df8wNjJEcWv7qwoA+/uYnkJLbNDnTy+bqv0NluESI
 JNebwxTYhk8v2Hk4fif9x0A6odcykPOnwVKLu17ysd0uB2fxUvr3CiHKnIicrcYDSGiY
 IIYKoWk0WJLk/GGvF22fGpQ5H8AyQGN3YpI7xsqF8L5p0YBXiN2UgaSnr4WZMlFWttOZ
 qSoA==
X-Gm-Message-State: AGi0PuaOPwl7WqlxY9LJG3ag8BKZSpFC60luu+t46agRH/EX+YujEmCs
 UoOlzDxvsHCB4KISuRFbGLQDbYMQ
X-Google-Smtp-Source: APiQypKDuVnlZdp+qB8oLPnoAvt25gdewSNXurOkuaaDTlt1uWohdP3MXj/j9FE8HRF/4KOgJkp7Cw==
X-Received: by 2002:a1c:9d84:: with SMTP id
 g126mr10188667wme.184.1588864292964; 
 Thu, 07 May 2020 08:11:32 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:32 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 30/36] drm/v3d: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:16 +0100
Message-Id: <20200507150822.114464-31-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 6 +++---
 drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
 drivers/gpu/drm/v3d/v3d_irq.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index edd299ab53d8..8b52cb25877c 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -185,7 +185,7 @@ int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 	args->offset = bo->node.start << PAGE_SHIFT;
 
 	ret = drm_gem_handle_create(file_priv, &bo->base.base, &args->handle);
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 
 	return ret;
 }
@@ -208,7 +208,7 @@ int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return 0;
 }
@@ -229,6 +229,6 @@ int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 
 	args->offset = bo->node.start << PAGE_SHIFT;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return 0;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 09a7639cf161..915f8bfdb58c 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -358,7 +358,7 @@ v3d_job_free(struct kref *ref)
 
 	for (i = 0; i < job->bo_count; i++) {
 		if (job->bo[i])
-			drm_gem_object_put_unlocked(job->bo[i]);
+			drm_gem_object_put(job->bo[i]);
 	}
 	kvfree(job->bo);
 
@@ -384,7 +384,7 @@ v3d_render_job_free(struct kref *ref)
 	struct v3d_bo *bo, *save;
 
 	list_for_each_entry_safe(bo, save, &job->unref_list, unref_head) {
-		drm_gem_object_put_unlocked(&bo->base.base);
+		drm_gem_object_put(&bo->base.base);
 	}
 
 	v3d_job_free(ref);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 51b65263c657..c88686489b88 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -72,7 +72,7 @@ v3d_overflow_mem_work(struct work_struct *work)
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
 
 out:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 }
 
 static irqreturn_t
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
