Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A593398A471
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E210E469;
	Mon, 30 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DGgU+csn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7044B10E469
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:14:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cbe624c59so34610005e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727702096; x=1728306896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=elvkPMenrhFg0hMpzYGM7OQatjY1RD7hcaGVam8pvkA=;
 b=DGgU+csnTIZyQP4ouBkVly3Bz9cgK8ZIjLmgh4Gj+iPRmbcboe5m5GdUZgIjEmIfLc
 UKiiNDXU2KmugNb6JK1DekmJmEE82EvhNAq9f4XkYzT6NNpCXnI2CLTJXZ5JWtnDS8ce
 cIacoIu/snFBeXIccBZNRmDS7cMTBbLn2rUyO53H1ClcJUuiIrSBDRzpUtO3r3kyflsy
 7smMiYlsfN6yawvkvIVxDQaa+DcxDsOpyh1/S0pB7I7COLtsrE+ea2gnkGhLECrCYDyL
 0zQ0YafY9l9GSuZw/xfiTAlerOFe93D8Sw5Zj9kNH7Ayfb2xjhSrnHnsP8V+Q4ODs9RQ
 UHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727702096; x=1728306896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=elvkPMenrhFg0hMpzYGM7OQatjY1RD7hcaGVam8pvkA=;
 b=YCHuLe0goARhyooc/C1RCW6B9eXKHzTS4dOSGbAgExt4h2iWQTFk5QXA4Oe//YRpaT
 JE4mfwqGGPnWnUb7e66/UAbUusA3ML/DyOQSMxig3jwVkMysSp4LESDDtUWxFtQksKMW
 e1B84Xa+rbb+8K3ajVHf1hy3wwNlykOia7M5Ll7yxw7YHm+lUt1yT6j4Flv3jZb5wAh3
 MhAB5GpaY242nA0dyHfrPfSq2AP5OXwgT2FOIPVX33VfWx3m/vVb4yPf4RbZpeyvBCL5
 DyiJW5H/6wC06hMEgCUuFPUX4jduEypBQsUofjagPnTWbU4Z5WK8s58F5+iKRUi8wtrr
 j/Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9gfGIvGjG5jlAQ8jysbPymnW8uxKkOORvy1LRkzlZ49ObZkyktqwP2a3CHqhlKt6PTNznStIPy1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytOX+t+SS3F4HgCn+UMf0pyXBMGZzHXYNVvuyE6v969NX1Y2Xy
 AXmSIoC4XEtmIP99ophBeG7AYNo/v35Fkj8vkGDnUjzPsiquP/vy
X-Google-Smtp-Source: AGHT+IGUW2IuqUE+sZBcxAAjNzB7izLdtJM09yCQwHIg78YFrFmELieWa8OCSpZAg4PX+mzppbtf3w==
X-Received: by 2002:adf:ec8c:0:b0:37c:d02a:7e41 with SMTP id
 ffacd0b85a97d-37cd5aa9d1fmr7055197f8f.15.1727702095569; 
 Mon, 30 Sep 2024 06:14:55 -0700 (PDT)
Received: from EliteBook.amd.com (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ddd24sm152255435e9.1.2024.09.30.06.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:14:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tvrtko.ursulin@igalia.com,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: revert "Always increment correct scheduler score"
Date: Mon, 30 Sep 2024 15:14:51 +0200
Message-Id: <20240930131451.536150-1-christian.koenig@amd.com>
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

This reverts commit 087913e0ba2b3b9d7ccbafb2acf5dab9e35ae1d5.

It turned out that the original code was correct since the rq can only
change when there is no armed job for an entity.

This change here broke the logic since we only incremented the counter
for the first job, so revert it.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index b2cf3e0c1838..a75eede8bf8d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -586,6 +586,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
+	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -613,7 +614,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		rq = entity->rq;
 		sched = rq->sched;
 
-		atomic_inc(sched->score);
 		drm_sched_rq_add_entity(rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-- 
2.34.1

