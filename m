Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B385FB8B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FEB10E9A5;
	Thu, 22 Feb 2024 14:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K/fpQh/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E931C10E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708613342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s8TpxZTjZr2d03dGbwChs6T5WLDb0VkPdU8wL2K5D40=;
 b=K/fpQh/AeHuzR7hkceg2p6OLlDFkqHbaO9f6DvFuPxF4gHJ5SOiAN22uixGG4NB6Az5AYH
 XMq55DGXynxTUj2D6vrXHAcWfMZHkmpGs0Hjv8IEaB2M/rEgXSmAi5fc0BCWZ6JowvDpft
 Jw7wVnGFgvbtvYmD7ZanwXAsAXO/1GQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-UJj6JLvAMzGtRSaRemTHuQ-1; Thu, 22 Feb 2024 09:45:40 -0500
X-MC-Unique: UJj6JLvAMzGtRSaRemTHuQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a3bdd99a243so96919766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 06:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708613139; x=1709217939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8TpxZTjZr2d03dGbwChs6T5WLDb0VkPdU8wL2K5D40=;
 b=bkS+xUIuBGdcG/cXb2oruW1+Dme/FkB6eIK38RpukhwuAReJB6bpy/kJ6uEE0wzo05
 2CXzFWrk4fJrdwtF845p3abrM+D8+RY3XH9fCMLO6HxgDHTBACqhyQDgqyJJyzIMMfdD
 oOgy2KSYsqws8/PzsPK2fJs87lTsM0I4ptN0vm0Zws9jqZ1lg7IpJS3loCiLIQezZAod
 KA6AhCeSKAQBjCP2Gk7+b/sbNLc7LJzoGXZgdsW0rVYQ75dyQxgnQCr7+4Y+yLKdGrq+
 ucix/WK1WWnsDeNHZceZZZd91e3hv9N27LS9XEhTyOmqRwObTrGzGmcahfPeiUVbh3tL
 xyNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCLAzkWhisMujBZyE0FKP1S5Wz7cxwsvwVFOj+Iq3gT+c7yG8AZD0UBfQlGvBMwXrPE3q5MC/OAODRQhl75hXuAmccj33OB3ooYFZG02sT
X-Gm-Message-State: AOJu0Yz4BlBx/a69qXT1lOezDPdV6nFzocVq9SDnrSlDEGzGjfGFaU8r
 zeGnChLA/koU1PEsGT1mwd0sLDoCla/0fKPTNKnbHeTHtDrEvmkARsC7AMSFLjhZg+vGCO//yMD
 Psp5jFDSof0m/JlLeOeENVE+JsJn7qzzzIGhbFqZ49k2AhvceWHbx7m781PyjOFiTpw==
X-Received: by 2002:a17:906:1cc1:b0:a3f:54a1:565c with SMTP id
 i1-20020a1709061cc100b00a3f54a1565cmr2074945ejh.27.1708613139300; 
 Thu, 22 Feb 2024 06:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcCQEL4wP0waKbuv5CgqlVATS84CJWzgJK1lz6EFrdnGuHBoMTYwtP4milLTxD04B2xPi0gw==
X-Received: by 2002:a17:906:1cc1:b0:a3f:54a1:565c with SMTP id
 i1-20020a1709061cc100b00a3f54a1565cmr2074929ejh.27.1708613138955; 
 Thu, 22 Feb 2024 06:45:38 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 hu21-20020a170907a09500b00a3f596aaf9dsm1301706ejc.26.2024.02.22.06.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 06:45:38 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, kherbst@redhat.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/nouveau: use dedicated wq for fence uevents work
Date: Thu, 22 Feb 2024 15:44:29 +0100
Message-ID: <20240222144536.4382-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Using the kernel global workqueue to signal fences can lead to
unexpected deadlocks. Some other work (e.g. from a different driver)
could directly or indirectly depend on this fence to be signaled.
However, if the WQ_MAX_ACTIVE limit is reached by waiters, this can
prevent the work signaling the fence from running.

While this seems fairly unlikely, it's potentially exploitable.

Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to workqueue")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 +++++++++++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 +++
 drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_fence.h |  2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6f6c31a9937b..6be202081077 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -598,9 +598,15 @@ nouveau_drm_device_init(struct drm_device *dev)
 		goto fail_alloc;
 	}
 
+	drm->fence_wq = alloc_workqueue("nouveau_fence_wq", 0, WQ_MAX_ACTIVE);
+	if (!drm->fence_wq) {
+		ret = -ENOMEM;
+		goto fail_sched_wq;
+	}
+
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
 	if (ret)
-		goto fail_wq;
+		goto fail_fence_wq;
 
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
@@ -670,7 +676,9 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 fail_master:
 	nouveau_cli_fini(&drm->master);
-fail_wq:
+fail_fence_wq:
+	destroy_workqueue(drm->fence_wq);
+fail_sched_wq:
 	destroy_workqueue(drm->sched_wq);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
@@ -725,6 +733,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
+	destroy_workqueue(drm->fence_wq);
 	destroy_workqueue(drm->sched_wq);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 8a6d94c8b163..b43619a213a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -261,6 +261,9 @@ struct nouveau_drm {
 	/* Workqueue used for channel schedulers. */
 	struct workqueue_struct *sched_wq;
 
+	/* Workqueue used to signal fences. */
+	struct workqueue_struct *fence_wq;
+
 	/* context for accelerated drm-internal operations */
 	struct nouveau_channel *cechan;
 	struct nouveau_channel *channel;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 93f08f9479d8..c3ea3cd933cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -174,7 +174,7 @@ static int
 nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
-	schedule_work(&fctx->uevent_work);
+	queue_work(fctx->wq, &fctx->uevent_work);
 	return NVIF_EVENT_KEEP;
 }
 
@@ -194,6 +194,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	INIT_LIST_HEAD(&fctx->pending);
 	spin_lock_init(&fctx->lock);
 	fctx->context = chan->drm->runl[chan->runlist].context_base + chan->chid;
+	fctx->wq = chan->drm->fence_wq;
 
 	if (chan == chan->drm->cechan)
 		strcpy(fctx->name, "copy engine channel");
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..bc13110bdfa4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,9 @@ struct nouveau_fence_chan {
 	u32 context;
 	char name[32];
 
+	struct workqueue_struct *wq;
 	struct work_struct uevent_work;
+
 	struct nvif_event event;
 	int notify_ref, dead, killed;
 };

base-commit: 1f4c6f11a557642505e5f403e0dfabbaff9c529a
-- 
2.43.0

