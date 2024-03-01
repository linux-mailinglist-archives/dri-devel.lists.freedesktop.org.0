Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B231686E8CC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 19:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4710EB20;
	Fri,  1 Mar 2024 18:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fgO1JQFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE90110E8E3;
 Fri,  1 Mar 2024 18:53:55 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2997a92e23bso1825123a91.3; 
 Fri, 01 Mar 2024 10:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709319234; x=1709924034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yIYqiiV52DrCvcmUn0qPP1S4nB6cxKqcd4qPrzkso9I=;
 b=fgO1JQFvQkLGzAHCCwnxaVOk6ripygKZmDzIg1PMHaH5n4mnmYIyEkF/g34dwPfmRl
 uSlqj9S4U6riYAmUgoityD/T3D7GXAaiGUKj2xyYnW66hyED1sWRvwDix7vO7+AdOKsu
 o3HYM/i+MxQbOPz8LxUAzKazKfEEr8yR3srkW/3HhfET4zwzSL89xsO3XqTkCgL+mTDq
 9S/MG9uW86I9Ezk75RMYTfb/DKWrst1lwnXgkWBkS3k288Qcq7Z/fG5Mb/QeE0s1o5cv
 n7f8PIz4RXoDs5yt1jCIZWzvvqoLOPa5sWL1gcQ9DrRh6D/0NMcBFlLE6NQMjqTIQ6R9
 pDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709319234; x=1709924034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yIYqiiV52DrCvcmUn0qPP1S4nB6cxKqcd4qPrzkso9I=;
 b=ltlBmUklo/gbkTAdrIC86ryqy2104wn9Gwt8WqGmSNM0jXGHVCMOwCk5gaX1yPfgOH
 649BGNUhvih2f35NzGeKjf7CI8h5FY8nwbEe+WDOQDsxHKltWKeRZV18Uz9k9DGuWgWF
 ar2yptsCaLEUMNk9kKLFQGraMLnx8SOaEzLcnwhbXC+iLhrxK68vYlDI7vpmvt1WwAOr
 Y2XMsb+EaSLQipbf2f2yq2P77HjC5Y/VCdjnh9UA+qmsI6zyGitUYp91MlYJQJifp4pJ
 YufHmISPlZ9do/IU0v+juioQaDUBHzlSmaMv1HwGZfPAFayrgQGl2BRCkkQM2B9U7J66
 zytQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURolugdCLgcQUSQxdz0wVzsEVn8k0DFkZwBxTWs+doB1OaZx72F2ydBEABciG7pf6NYHVHbYan+rT4b/8i9Wfk3/Lrmuf/kXKduyg9Wc0u
X-Gm-Message-State: AOJu0YwThJuzdU073ekMhkjVm/39LYJUvlCNh19xkvCwtd+8j3uL1SP/
 lhR5KPGpZ/6vaiUGvIs/xzI0WjZ2ZlliLvSQcU6rU4Gf5Rc7G4jXfYX4Sdrq
X-Google-Smtp-Source: AGHT+IFBLkTRqvmopJ44TtJLDd19SqEGIN2btaMvXJlxKW3m/Decir/GU7WF6Ioh8FWOIXcT9G9s9A==
X-Received: by 2002:a17:90a:bf01:b0:29a:a1c7:fc28 with SMTP id
 c1-20020a17090abf0100b0029aa1c7fc28mr2436127pjs.10.1709319234277; 
 Fri, 01 Mar 2024 10:53:54 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 sl6-20020a17090b2e0600b0029aaabcb82asm5706114pjb.10.2024.03.01.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:53:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC] drm/msm: Add GPU memory traces
Date: Fri,  1 Mar 2024 10:53:45 -0800
Message-ID: <20240301185346.10412-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Perfetto can use these traces to track global and per-process GPU memory
usage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I realized the tracepoint that perfetto uses to show GPU memory usage
globally and per-process was already upstream, but with no users.

This overlaps a bit with fdinfo, but ftrace is a lighter weight
mechanism and fits better with perfetto (plus is already supported in
trace_processor and perfetto UI, whereas something fdinfo based would
require new code to be added in perfetto.

We could probably do this more globally (ie. drm_gem_get/put_pages() and
drm_gem_handle_create_tail()/drm_gem_object_release_handle() if folks
prefer.  Not sure where that leaves the TTM drivers.

 drivers/gpu/drm/msm/Kconfig   |  1 +
 drivers/gpu/drm/msm/msm_drv.h |  5 +++++
 drivers/gpu/drm/msm/msm_gem.c | 37 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f202f26adab2..e4c912fcaf22 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -33,6 +33,7 @@ config DRM_MSM
 	select PM_OPP
 	select NVMEM
 	select PM_GENERIC_DOMAINS
+	select TRACE_GPU_MEM
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd..cb8f7e804b5b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -137,6 +137,11 @@ struct msm_drm_private {
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
 
+	/**
+	 * total_mem: Total/global amount of memory backing GEM objects.
+	 */
+	atomic64_t total_mem;
+
 	/**
 	 * List of all GEM objects (mainly for debugfs, protected by obj_lock
 	 * (acquire before per GEM object lock)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 175ee4ab8a6f..e04c4af5d154 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -12,6 +12,9 @@
 #include <linux/pfn_t.h>
 
 #include <drm/drm_prime.h>
+#include <drm/drm_file.h>
+
+#include <trace/events/gpu_mem.h>
 
 #include "msm_drv.h"
 #include "msm_fence.h"
@@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *obj)
 	return !msm_obj->vram_node;
 }
 
+static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
+{
+	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
+	trace_gpu_mem_total(0, 0, total_mem);
+}
+
+static void update_ctx_mem(struct drm_file *file, ssize_t size)
+{
+	struct msm_file_private *ctx = file->driver_priv;
+	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
+
+	rcu_read_lock(); /* Locks file->pid! */
+	trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
+	rcu_read_unlock();
+
+}
+
+static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
+{
+	update_ctx_mem(file, obj->size);
+	return 0;
+}
+
+static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
+{
+	update_ctx_mem(file, -obj->size);
+}
+
 /*
  * Cache sync.. this is a bit over-complicated, to fit dma-mapping
  * API.  Really GPU cache is out of scope here (handled on cmdstream)
@@ -156,6 +187,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			return p;
 		}
 
+		update_device_mem(dev->dev_private, obj->size);
+
 		msm_obj->pages = p;
 
 		msm_obj->sgt = drm_prime_pages_to_sg(obj->dev, p, npages);
@@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *obj)
 			msm_obj->sgt = NULL;
 		}
 
+		update_device_mem(obj->dev->dev_private, -obj->size);
+
 		if (use_pages(obj))
 			drm_gem_put_pages(obj, msm_obj->pages, true, false);
 		else
@@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_ops = {
 
 static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
+	.open = msm_gem_open,
+	.close = msm_gem_close,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2bfcb222e353..f7d2a7d6f8cc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -428,6 +428,14 @@ struct msm_file_private {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+
+	/**
+	 * ctx_mem:
+	 *
+	 * Total amount of memory of GEM buffers with handles attached for
+	 * this context.
+	 */
+	atomic64_t ctx_mem;
 };
 
 /**
-- 
2.44.0

