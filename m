Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4F4F9E51
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889C210E308;
	Fri,  8 Apr 2022 20:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA74710E1C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 20:46:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so658282pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vG5dkO+I6Obd+V1pyvVcIeGd6jB36+6keYt8K0NMS4=;
 b=j/VJtunh4Q3+I/qoaTUIn04QK+ASVUOl46Dy39JgNs8XaoOgGJkZxoiTbQLLilh4gt
 ZDifDTFzt7GqhILJvjaIblRDkLpBkuMt7X3D+MYB8cJKeAJ82+Xopj9Fw6CBQF/sOro7
 2atmWWACjibGpwHBixlmC6rrhKrLBpOXZmpSfK1Pli/a8VwrVnXLTjPNYIh5vQb2AMao
 YOQGNNuLftKfUJzvc5CnzBxGoBvZE+vwDnIkNG5tAe5NY4o/whZ2ozgi8kRw3cA8zjpK
 dHfUDHsi3O5LcwHmq96i87oK3HthtkuXmamGMeOw7UWj2eka5UQ+SSV7mf5x2WNyfVp7
 Nttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vG5dkO+I6Obd+V1pyvVcIeGd6jB36+6keYt8K0NMS4=;
 b=XOiD1YsiA4QZ8zyiVjisbmLlowyZ7a1VG1dgOkd7yFb9Ql/WPghx+9sZQS92Q5ApCd
 Fr8zkbfnBQIBlM07yd4RrNB1BDKiJKDTHYZ+ab63QlvO0QwDiTRHBFGebkQ3H/MyBPK9
 jA1+I3KRNXFvdQeHKJLH/zHxNe2XzB01XHV2zWW1YSj4d1RJbmN62qKRiY+gSK/dYeI6
 dMqHs+UyXAthD8KCZBRwL52xYc9Ftd6KK5GDGDojoE8hFCLBRI1/xzfv+yUTSNMigv6h
 to+bXV5rwSInN/y0Z8si4ogdttIvvUa3nYs+hPMu3m/r73lWfXPhebU/ZxsY7iOQmvaW
 rsAw==
X-Gm-Message-State: AOAM533c2+FiQvgIRRLnZJmNOGhKLcdRm68eIhKIjIw9bwuEaggUlsDm
 jquB6cK+7s78vkz4EBoixRutCaznAmM=
X-Google-Smtp-Source: ABdhPJymLE+G2JM8W3tmXhAZNbPcYJEaII+hi6xMmBBWmQfBqCJ5TQXdNAQkWoS2LBj7+7RLDhG+vw==
X-Received: by 2002:a17:90b:1a85:b0:1c9:d81b:33f1 with SMTP id
 ng5-20020a17090b1a8500b001c9d81b33f1mr23640442pjb.212.1649450787916; 
 Fri, 08 Apr 2022 13:46:27 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:c6d0:c747:3e11:b8e3])
 by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm25683013pfw.144.2022.04.08.13.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:46:27 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/sched: use __string in tracepoints
Date: Fri,  8 Apr 2022 13:46:12 -0700
Message-Id: <20220408204612.596597-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220408204612.596597-1-olvaffe@gmail.com>
References: <20220408204612.596597-1-olvaffe@gmail.com>
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
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 2e6eda920fe1..b5d99df65d93 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -38,7 +38,7 @@ DECLARE_EVENT_CLASS(drm_sched_job_entity,
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
 			     __field(struct dma_fence *, fence)
-			     __field(const char *, name)
+			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -48,14 +48,14 @@ DECLARE_EVENT_CLASS(drm_sched_job_entity,
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

