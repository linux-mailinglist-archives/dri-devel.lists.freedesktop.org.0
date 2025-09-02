Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC4B40E59
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 22:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF8C10E82F;
	Tue,  2 Sep 2025 20:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B346bbO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C66910E82F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 20:06:28 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7724cacc32bso2291798b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756843588; x=1757448388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ayy33aEbiCOrojQ+KoYlyNeKLNvxYtR93pxbZ3I6xUs=;
 b=B346bbO39UdJ6/pFJPX22R2ulKyw80ViYBvwNBiFVKgdwZrQbJ0vUCrIT+Li9avJI6
 TxpFYPXYNAriD8UxIeuzWLuECtkYDn2UG0b58DzUtxP4ipDZ3tuQ/2f2DLTWuUX+/CAh
 ScVhkVSj/S0+2m4YerKM25i05lRgLZEkmoA6/Y8Q3TRayV91WlnCLoYYUmAZO4EYcc5X
 yAbNMEFhhFIuYP1lvJg3cd3N3vxzT7LB4q0/eOzgbCtMQwQaKiYio3/8izaDp86VdxNw
 TPEXL+4eMr7dDHoCreJ2YH4NMWALFfQBaRhLU7858Sph1dvut/ROZVzPT3ynSERAjMhR
 bV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756843588; x=1757448388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ayy33aEbiCOrojQ+KoYlyNeKLNvxYtR93pxbZ3I6xUs=;
 b=IkgwJ3981+rOO+DqMlxJvBqKsJFDLytX25xD7E4czDzfTz/Y9JMFIcT5z/02BQDKwU
 8TiAtnJgFtVbLgGEab9tgSzcrodO7IT07TdL16LJ1GK6mp2X36chjFsneIgi8E9k7f1C
 GOf5XwYhUNJeuDi033bbvAE/c50DUVbchyVb2ngsJ1YeKyzP34tXBlAT31d6B3J7nQPJ
 UQaop7PkBAhSgwlnFqjD0sKtqbnra7ab1kKlSCvgOzs3/aycJSYiHOiQkEz7N8x9TtZ+
 /NyTKFW41Ypq3ZA6Q7SbTxNkb43gU/zbvquQzwlOAqrcaFmGAOuI7y3ix46+D2Jv/Pyg
 baEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpUlb4PlZ22v9LJ/5EmSV/GQBpm+CBI6lC5fVxt7su6dymraB5DMqD/1YG66/Y/7+p6K2Fh/4T4dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1YrVfzsCxi2BkbLC3JW6PmFkIZCYWyQD/gkgVOnVxqQ+Acwq+
 hF7rXqMIA3+GGrj+IglloX+kDzFN64zdPR5VmiS8l7kzVWsWidpfyohDepJ3iwy8
X-Gm-Gg: ASbGncvIrTw+aeaZl9XRoUu6X0TI2Nfp75R3Oup1Olnf5u3vsQnzTin2C8Z/krprd1S
 swEixRdktLEKGvVCYjTSkiuXb5ER9g/RaF/oiazVwFykADhQl7HnoLHu2bUwK+SNDic0h/H27uU
 6JjcVDxSp42YEYp9M6sSbcInjZm47JhhjTu1+aEaayrEXdj66qKDC8oSVgJc9DjSQygz6C0FYUt
 fgj7RWKFfRijqwecHv9EjpqwiNAROiX+nDBsMA84//h8CEosG/D/ZMBqFsJabIQiawbrWXS5SUP
 S4MgD2Ow2SLZGjeOw+olx2IxPmd/rfzhaxYJWc0qyG6kfORhkQ2SK2w8IEchCG7DitST1fXlWii
 SV0ugj0gs1fEPGL4fdHwMod+94hhgDzqAP2I7p6fnd4RhtWBCK13i2QJAlVTLPVTliMckOrpXEL
 CRiIr3qkMDXPiNK0x46isrx8Z7QjG1LF4=
X-Google-Smtp-Source: AGHT+IFMzFQ1FkEPST51kLn+3qPNQ2XfQ/4Cjo0P7wmFjUPdDGLI6HmQWVl8iu/ZdMYPYOvP7uXkWQ==
X-Received: by 2002:a17:902:d4cb:b0:249:2318:7a2d with SMTP id
 d9443c01a7336-249448f6e79mr152558375ad.19.1756843587778; 
 Tue, 02 Sep 2025 13:06:27 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24903702999sm141252535ad.3.2025.09.02.13.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 13:06:27 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/panthor: assign unique names to queues
Date: Tue,  2 Sep 2025 13:06:24 -0700
Message-ID: <20250902200624.428175-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
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

Userspace relies on the ring field of gpu_scheduler tracepoints to
identify a drm_gpu_scheduler.  The value of the ring field is taken from
sched->name.

Because we typically have multiple schedulers running in parallel in
each process, assign unique names to schedulers such that userspace can
distinguish them.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---

v2:
 - include drm_client_id in the name to be truly unique
 - remove unnecessary NULL in drm_sched_init_args initialization
 - reformat to column width 100

v3:
 - switch to kasprintf for queue name
   - open to alternatives such as name[48], shorter prefix (e.g.,
     panthor-q), etc.
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c | 38 ++++++++++++++++++-------
 drivers/gpu/drm/panthor/panthor_sched.h |  3 +-
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9256806eb6623..be962b1387f03 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1105,7 +1105,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 	if (ret)
 		goto out;
 
-	ret = panthor_group_create(pfile, args, queue_args);
+	ret = panthor_group_create(pfile, args, queue_args, file->client_id);
 	if (ret < 0)
 		goto out;
 	args->group_handle = ret;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ba5dc3e443d9c..b328631c00489 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -360,6 +360,9 @@ struct panthor_queue {
 	/** @entity: DRM scheduling entity used for this queue. */
 	struct drm_sched_entity entity;
 
+	/** @name: DRM scheduler name for this queue. */
+	char *name;
+
 	/**
 	 * @remaining_time: Time remaining before the job timeout expires.
 	 *
@@ -901,6 +904,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (queue->scheduler.ops)
 		drm_sched_fini(&queue->scheduler);
 
+	kfree(queue->name);
+
 	panthor_queue_put_syncwait_obj(queue);
 
 	panthor_kernel_bo_destroy(queue->ringbuf);
@@ -3308,9 +3313,10 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
 
 static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
-		   const struct drm_panthor_queue_create *args)
+		   const struct drm_panthor_queue_create *args,
+		   u64 drm_client_id, u32 gid, u32 qid)
 {
-	const struct drm_sched_init_args sched_args = {
+	struct drm_sched_init_args sched_args = {
 		.ops = &panthor_queue_sched_ops,
 		.submit_wq = group->ptdev->scheduler->wq,
 		.num_rqs = 1,
@@ -3323,7 +3329,6 @@ group_create_queue(struct panthor_group *group,
 		.credit_limit = args->ringbuf_size / sizeof(u64),
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
 		.timeout_wq = group->ptdev->reset.wq,
-		.name = "panthor-queue",
 		.dev = group->ptdev->base.dev,
 	};
 	struct drm_gpu_scheduler *drm_sched;
@@ -3398,6 +3403,15 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
+	/* assign a unique name */
+	queue->name = kasprintf(GFP_KERNEL, "panthor-queue-%llu-%u-%u", drm_client_id, gid, qid);
+	if (!queue->name) {
+		ret = -ENOMEM;
+		goto err_free_queue;
+	}
+
+	sched_args.name = queue->name;
+
 	ret = drm_sched_init(&queue->scheduler, &sched_args);
 	if (ret)
 		goto err_free_queue;
@@ -3447,7 +3461,8 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
 
 int panthor_group_create(struct panthor_file *pfile,
 			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args)
+			 const struct drm_panthor_queue_create *queue_args,
+			 u64 drm_client_id)
 {
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_group_pool *gpool = pfile->groups;
@@ -3540,12 +3555,16 @@ int panthor_group_create(struct panthor_file *pfile,
 	memset(group->syncobjs->kmap, 0,
 	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
 
+	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
+	if (ret)
+		goto err_put_group;
+
 	for (i = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i]);
+		group->queues[i] = group_create_queue(group, &queue_args[i], drm_client_id, gid, i);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
-			goto err_put_group;
+			goto err_erase_gid;
 		}
 
 		group->queue_count++;
@@ -3553,10 +3572,6 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group->idle_queues = GENMASK(group->queue_count - 1, 0);
 
-	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
-	if (ret)
-		goto err_put_group;
-
 	mutex_lock(&sched->reset.lock);
 	if (atomic_read(&sched->reset.in_progress)) {
 		panthor_group_stop(group);
@@ -3575,6 +3590,9 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	return gid;
 
+err_erase_gid:
+	xa_erase(&gpool->xa, gid);
+
 err_put_group:
 	group_put(group);
 	return ret;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 742b0b4ff3a3c..f4a475aa34c0a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -21,7 +21,8 @@ struct panthor_job;
 
 int panthor_group_create(struct panthor_file *pfile,
 			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args);
+			 const struct drm_panthor_queue_create *queue_args,
+			 u64 drm_client_id);
 int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
 int panthor_group_get_state(struct panthor_file *pfile,
 			    struct drm_panthor_group_get_state *get_state);
-- 
2.51.0.338.gd7d06c2dae-goog

