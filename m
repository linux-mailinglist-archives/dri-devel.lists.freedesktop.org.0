Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3517CE8B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 14:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF86E6E209;
	Sat,  7 Mar 2020 13:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CCA6E209;
 Sat,  7 Mar 2020 13:55:23 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c19so267185pfo.13;
 Sat, 07 Mar 2020 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YDLqY5SRIFpQGH6H4wVXBgd/Ks0Adv2mnc3/HPnToBk=;
 b=UAMtYLbUDAI96whvrcIylR1WhZlL+I2VuN9fKeZmc2BwWHFgWR6UpIJBeI+dtxe+es
 5jThaoPXx5xISZC9AgfUEkXcLbcZkFdli8zWkKWqFqeuzI1Brmh7NodA8fRFGpeZHh3b
 JpF6zsXzRpb7wndU7w4fPjEtG0Hv4tVoVplZf72xMOF8Qs3wL3EDl6X4MKFWUX+aDQiP
 0EOAd6KMEc0QvhZf7tCE+5TWtuDneZlDB3/er3U9SyRrlNWBUIB86jt9nK0l1Mt9sEka
 vRAbiVlUYMvN9kVLqsdM3AdIHZg9/3HU7OHQwGebwTHHaUdcPNrgQLIC4mb87apNu66V
 DHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YDLqY5SRIFpQGH6H4wVXBgd/Ks0Adv2mnc3/HPnToBk=;
 b=tqDDvF5zTvavdbKWapG+yxVHrw9X1IuLjqvUMmMqqefPAkwtbRhGd0yevpsKAMTX05
 obCpCmSTWnEGrSKxuJ5hs403IHdPLyj3AjxeF6uer1/QMOSkK2EBEtq61MdAMHIlwk7+
 AmrW27rZS3qa6DWc9/JtMH4C8RxudytaeJHIer1lEoOMH9MGP5jGfcwnnOA1KfOq3ipR
 mig9MzZf4Qtn3iXj6SktKH+V1nXmOIZtZVuWw/9Uf1uxNF/BZflqeTS/V5dNxpIlJTWf
 1HJTH0+Z8Z+o9XiqgzohBtmrHp5TRkDBmXRais6GsWK8LKkUmmsq/fM6QCycjEz1lJCI
 scYQ==
X-Gm-Message-State: ANhLgQ0oHehHkWOYUpRawEy+XAlp1ODT5A/uYeWOC4A6pXbQp1zR9y49
 9o8IlP1BJnk4HGOLJEw4oAL/oP+99Zs=
X-Google-Smtp-Source: ADFU+vt1WltdrayXarQY4AGRSSwyWunR0u9AXAVmJwSEIKB3kNKIK660OwgC1ZjWGsYkLEaL3UZ0MQ==
X-Received: by 2002:a62:7c90:: with SMTP id x138mr8718931pfc.5.1583589322327; 
 Sat, 07 Mar 2020 05:55:22 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id r199sm13073929pfc.101.2020.03.07.05.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 05:55:21 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lima: add trace point for tasks
Date: Sat,  7 Mar 2020 21:54:38 +0800
Message-Id: <20200307135438.9981-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

track lima task start which can be combined with
dma_fence_signal to identify task execution time.

example command to record:

trace-cmd record -i \
  -e "lima:lima_task_submit" -e "lima:lima_task_run" \
  -e "*fence:*fence_signaled" -e "drm:drm_vblank_event" \
  -e "drm:drm_vblank_event_queued" sleep 4

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/Makefile     |  3 +-
 drivers/gpu/drm/lima/lima_sched.c |  5 +++-
 drivers/gpu/drm/lima/lima_sched.h |  1 +
 drivers/gpu/drm/lima/lima_trace.c |  7 +++++
 drivers/gpu/drm/lima/lima_trace.h | 50 +++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_trace.c
 create mode 100644 drivers/gpu/drm/lima/lima_trace.h

diff --git a/drivers/gpu/drm/lima/Makefile b/drivers/gpu/drm/lima/Makefile
index a85444b0a1d4..6e7b788408e8 100644
--- a/drivers/gpu/drm/lima/Makefile
+++ b/drivers/gpu/drm/lima/Makefile
@@ -14,6 +14,7 @@ lima-y := \
 	lima_sched.o \
 	lima_ctx.o \
 	lima_dlbu.o \
-	lima_bcast.o
+	lima_bcast.o \
+	lima_trace.o
 
 obj-$(CONFIG_DRM_LIMA) += lima.o
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index f295479e3733..98d0d410b7d7 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -3,7 +3,6 @@
 
 #include <linux/kthread.h>
 #include <linux/slab.h>
-#include <linux/xarray.h>
 #include <linux/vmalloc.h>
 
 #include "lima_drv.h"
@@ -12,6 +11,7 @@
 #include "lima_mmu.h"
 #include "lima_l2_cache.h"
 #include "lima_gem.h"
+#include "lima_trace.h"
 
 struct lima_fence {
 	struct dma_fence base;
@@ -177,6 +177,7 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *conte
 {
 	struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
 
+	trace_lima_task_submit(task);
 	drm_sched_entity_push_job(&task->base, &context->base);
 	return fence;
 }
@@ -251,6 +252,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	if (last_vm)
 		lima_vm_put(last_vm);
 
+	trace_lima_task_run(task);
+
 	pipe->error = false;
 	pipe->task_run(pipe, task);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index e29f5e3b675b..e5db1919f446 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -6,6 +6,7 @@
 
 #include <drm/gpu_scheduler.h>
 #include <linux/list.h>
+#include <linux/xarray.h>
 
 struct lima_vm;
 
diff --git a/drivers/gpu/drm/lima/lima_trace.c b/drivers/gpu/drm/lima/lima_trace.c
new file mode 100644
index 000000000000..ea1c7289bebc
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_trace.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
+
+#include "lima_sched.h"
+
+#define CREATE_TRACE_POINTS
+#include "lima_trace.h"
diff --git a/drivers/gpu/drm/lima/lima_trace.h b/drivers/gpu/drm/lima/lima_trace.h
new file mode 100644
index 000000000000..9308b948b69d
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_trace.h
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
+
+#if !defined(_LIMA_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _LIMA_TRACE_H_
+
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM lima
+#define TRACE_INCLUDE_FILE lima_trace
+
+DECLARE_EVENT_CLASS(lima_task,
+	TP_PROTO(struct lima_sched_task *task),
+	TP_ARGS(task),
+	TP_STRUCT__entry(
+		__field(uint64_t, task_id)
+		__field(unsigned int, context)
+		__field(unsigned int, seqno)
+		__string(pipe, task->base.sched->name)
+		),
+
+	TP_fast_assign(
+		__entry->task_id = task->base.id;
+		__entry->context = task->base.s_fence->finished.context;
+		__entry->seqno = task->base.s_fence->finished.seqno;
+		__assign_str(pipe, task->base.sched->name)
+		),
+
+	TP_printk("task=%llu, context=%u seqno=%u pipe=%s",
+		  __entry->task_id, __entry->context, __entry->seqno,
+		  __get_str(pipe))
+);
+
+DEFINE_EVENT(lima_task, lima_task_submit,
+	     TP_PROTO(struct lima_sched_task *task),
+	     TP_ARGS(task)
+);
+
+DEFINE_EVENT(lima_task, lima_task_run,
+	     TP_PROTO(struct lima_sched_task *task),
+	     TP_ARGS(task)
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/lima
+#include <trace/define_trace.h>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
