Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DED4FE99F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67410E5BA;
	Tue, 12 Apr 2022 20:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1439510E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 20:48:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id p10so85322plf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvRZWn4PeQ0CZZZ1Egqv0aUk2QF3sUgfPcDvTT43nzM=;
 b=Iw3CXGJsYMuEPgqbp5hf2A9VrkJV9QrzyZOizpo+WyoH4FQu5oaPlHg8RmWlU32asw
 eZvdKmOHW3MLgwEXAXYh0ZNlNCEwYzGyuEbhnzKhmT4yiejZlTQGsFSWXmRg2AnWXS68
 YLOoMUq2VvHEsSEcEUfA0XzoekSgrhKnZ0jp958p8yDFfu2xfWiWEqCz/82VW/H9fP6k
 ThtX7BQeV54n22z8DjHsiEkM8mqnvC575d7cDvTBcS3qVrxG5wqu5/Luxia6HV9RzbXU
 oluT+d6IJ3PCN/dfm4KtzkoywgvRKfoxWic9jj0k2F8n5F5PwcWQvjanIxnYwI/BE8nB
 WBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvRZWn4PeQ0CZZZ1Egqv0aUk2QF3sUgfPcDvTT43nzM=;
 b=WE5Vi4uvp0QeT9gX3+RhJNFz4bX/gVTbSZ7q9rHFn2U57I6sGSkekTcPFHpgrn6/2A
 dX3H14H+pCaErZ37KPEatqvnLM+tAsQ/jHKbWwZvhg8etGzhreSr8yJAEdymX3tv7TA6
 9uLQ4SITvniWIAsLiKMAzXG17OEPLnwiBDrEtYwtBqHM9mk0SUOq0Jq1dID2y1/I3fMV
 zlqFMZpGnktKTjvKG69Zpz27D7fOE9aYx2hlrAdSpQSYFOQAeYUwihYZlygx4mMcCtCe
 DSV3dGets5382z85cHBfReF9Wlb7y4SiVTZop/8lt1YfkwqFmpTZmLMVTXWl6ooOiwtj
 HY8g==
X-Gm-Message-State: AOAM531D3upqE+qI/0bDxEgu/hOyBbK6NG4xjNd5Q3DDi5MOEg342p85
 zti96csMc52R0zT78Lay/pqASKTMP4g=
X-Google-Smtp-Source: ABdhPJwIB1Csd7zLxDbLPSABQco67tsqHArKRSiwkTPIC7SGTP5YO4HkHoL0UO4oQEVM46Pj+TV8dw==
X-Received: by 2002:a17:90b:224f:b0:1c9:949e:2202 with SMTP id
 hk15-20020a17090b224f00b001c9949e2202mr6938934pjb.56.1649796523329; 
 Tue, 12 Apr 2022 13:48:43 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:1661:f107:58eb:51b7])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090a454a00b001c96a912aa0sm413548pjm.3.2022.04.12.13.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:48:42 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/sched: use __string in tracepoints
Date: Tue, 12 Apr 2022 13:48:09 -0700
Message-Id: <20220412204809.824491-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220412204809.824491-1-olvaffe@gmail.com>
References: <20220412204809.824491-1-olvaffe@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise, ring names are marked [UNSAFE-MEMORY].

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 188ae2105d57..3143ecaaff86 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -38,7 +38,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
 			     __field(struct dma_fence *, fence)
-			     __field(const char *, name)
+			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -48,14 +48,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
 			   __entry->fence = &sched_job->s_fence->finished;
-			   __entry->name = sched_job->sched->name;
+			   __assign_str(name, sched_job->sched->name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->hw_rq_count);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
-		      __entry->fence, __entry->name,
+		      __entry->fence, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -86,7 +86,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
-			     __field(const char *,name)
+			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
@@ -94,14 +94,14 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->name = sched_job->sched->name;
+			   __assign_str(name, sched_job->sched->name);
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
 	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __entry->name, __entry->id,
+		      __get_str(name), __entry->id,
 		      __entry->fence, __entry->ctx,
 		      __entry->seqno)
 );
-- 
2.35.1.1178.g4f1659d476-goog

