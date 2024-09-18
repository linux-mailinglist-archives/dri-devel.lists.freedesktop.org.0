Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167997BD2D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3E10E5A3;
	Wed, 18 Sep 2024 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RkQSIZlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730EE10E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:40:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so943394266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726666799; x=1727271599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ISbgXs47Os4/xsVjaiwdh7WAhROR4D/ImIhSH1DGQnI=;
 b=RkQSIZlOuVvzakjff2klyT/45fgarGpGJjyynKnUvLIHKYV7wyZESd9DHA5SFi41XI
 wDNbGD3+rg37QUQmZwqvo70UFniLUaYJnZn5vlIBLSCyp+aWzeC2jcrHd4LQ1Cvf0XoO
 G+Lkp96YND7eJbAE2tMDG7rj2533ofuvQEEdE222Tb2BqBzbLjT2lhCNC27M49DPaCXr
 lhSmyj1RX7cbrD+SGIWNpKMkJriMchpuqhyyxuW+gu6w8Z4izKaEwcgchQJML2QPdQT/
 mkdZaJ1CLKUDc4tnp6eHs0ZSFoDG/0h5AeA2s+tsU8kgSxuQTRAjKE/MqtCoNAY4r91b
 w/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726666799; x=1727271599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISbgXs47Os4/xsVjaiwdh7WAhROR4D/ImIhSH1DGQnI=;
 b=MULq7vG+ketNwtA4AlEE47jFQ+GO7FDLUo4S1UlCZuZT0uC11VcRFR0XcTfkQ2OgCo
 NAJWPXrZiLrgFqNGOzPELs6rJcSdq4IiiIfLqDHpe6ENXjyB4tX5wnL3lG3jw4+mIspu
 YU9yRS9Oh+OTHEcP41Op7ZbUb3fq3BYL6ZlLdbDEJTcbY9OcLWMz+f/Rda0cC8EkwR1Y
 oN6YeVYWG5DEZdDdnTuU39/Vn1UsWoVdyo0GTafcbqymWvQKmqJ0JzwyYc8vd+C3ArjP
 tJ4KelhGaboYOZC3UdJqTyx5M6R7jzzXy0eiwk7ltBBb38k2NlAPqAv0blcDXPeTVhmY
 PyOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU34yutaGWZs04mlgUE1Hf9IDl4wlvspbMdawG4/Qyq5pdUWJ1LGxuqlIgyXc1W3VR/jzWoTXTVpI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm9zFxR0SegQNRu/PbYZG7azLn+Ihs41KXGHJDZeuvGvsayv0K
 oCc9bb0xCrj4IpzRKKgY2oSvj+dvKntV9LrUl8oMASHwgGSrHz8n
X-Google-Smtp-Source: AGHT+IE8foPRGQgx2xFdYO+/wh6fHjmSBWwyEqLqJH3gMBsX60K4WhEEYR6GpFXxx01WwaUt+93ilw==
X-Received: by 2002:a17:907:3e94:b0:a83:94bd:d913 with SMTP id
 a640c23a62f3a-a90294a9ccamr2495388366b.10.1726666798301; 
 Wed, 18 Sep 2024 06:39:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:155d:1400:17ae:e091:3b52:93d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096a08sm592666266b.2.2024.09.18.06.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 06:39:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dakr@kernel.org, pstanner@redhat.com, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com
Subject: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Date: Wed, 18 Sep 2024 15:39:55 +0200
Message-Id: <20240918133956.26557-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

Tearing down the scheduler with jobs still on the pending list can
lead to use after free issues. Add a warning if drivers try to
destroy a scheduler which still has work pushed to the HW.

When there are still entities with jobs the situation is even worse
since the dma_fences for those jobs can never signal we can just
choose between potentially locking up core memory management and
random memory corruption. When drivers really mess it up that well
let them run into a BUG_ON().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f093616fe53c..8a46fab5cdc8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
+	/*
+	 * Tearing down the scheduler wile there are still unprocessed jobs can
+	 * lead to use after free issues in the scheduler fence.
+	 */
+	WARN_ON(!list_empty(&sched->pending_list));
+
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
+		list_for_each_entry(s_entity, &rq->entities, list) {
+			/*
+			 * The justification for this BUG_ON() is that tearing
+			 * down the scheduler while jobs are pending leaves
+			 * dma_fences unsignaled. Since we have dependencies
+			 * from the core memory management to eventually signal
+			 * dma_fences this can trivially lead to a system wide
+			 * stop because of a locked up memory management.
+			 */
+			BUG_ON(spsc_queue_count(&s_entity->job_queue));
+
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will removed from rq in drm_sched_entity_fini
 			 * eventually
 			 */
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.34.1

