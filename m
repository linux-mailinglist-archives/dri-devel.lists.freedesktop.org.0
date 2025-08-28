Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00005B3AB42
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF2A10EAB7;
	Thu, 28 Aug 2025 20:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmhIWxle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0782910EAB7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:05:40 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b482fd89b0eso1176408a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756411539; x=1757016339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jmSGeUqi7bgVdyADhjktgbxkyZv4XRIq1wbeRuWB31M=;
 b=fmhIWxlefw3nPRpdRU5G3j/puy5jTXskQ+GL98U39qAAicPJ3GltsPeQAPO3IC9MiM
 46T82hU/fHFh8UQdunGdjTsta1P2fONcNJY8WclBPEtsYqlpuiJzzQ7tWlJskEJq2H+/
 6v1LE1VsME5xRScfELCbPag1tGplys1MpZUUnvLqOiIDyI7hIZC543XrvsUWgQaKD9SP
 8DnEro1ezqvF897Hw2mEo9LLYCtlvNgYJE8bOIpjjZGmAZ5RU+iWAqNTSwbC7jaYTfr2
 /KGel3C2WaP8HOhPMcfiVaTs8SkoUa6d9N9HKVXtDWJAPFY5QuNFucrTiPT5jLsk6Tek
 a15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756411539; x=1757016339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmSGeUqi7bgVdyADhjktgbxkyZv4XRIq1wbeRuWB31M=;
 b=sXnTWJjAndVaaw3//y12oPH4M4ML/8gLGK1NQyY0iERzfIKttaMJMtGJ7h9ojBM+xw
 t2Xw++/DsDDMJXOltl5ACV8NPH+uDWCS0+Ki4xrc/IMIwzsL6zrRDTL+am5x8ejn4zYM
 KzOHWmF3I8v1Y4MnHhkQKWHYK+JnHy4DTk2SvuQAOsu+ah2g1y3PJpmEgJz3d0XOEmMM
 DwwXuovsRqxz3z4+sBWPPVnifHLIj0uN3yB7ecmktVx12tpw+PseI+8Uu3wE33pseD8d
 xYfL/DMOsiRjRILqf0Z7M1mLQ2Ipu+gKhSwQ61X28rX6hUJXp4/8XMt3G6gbJaUy15IT
 cYPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvJHZblM3QXB0ke3vALSkysME2bgPUPqPWY2jommQ44pw3kp/8yzkWsV/OV6TuR3b1/oVZceFOzSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMxa3IocxKbW9OvHeZaz69aLH+4NygHQfZJbqzq18LLc24coXP
 sDRg0rEFp56sFDACS09nhCk8gOKOGJ/q+ne9qIIv+UCraBGqiwyjuQFWAu666UIr
X-Gm-Gg: ASbGnctK9gg+3S0qrLBmZShXUxB3wgVpLRk6AU6pC4AZpoyBXVjEwCvLjZaqtjXA5FU
 4umLLO2VmKr/Sl7cDnKcFmSUBK8kxUim7G+n1uWZ5bXu9X8uyPb5Z71D9JrV8Tz8DuPL3grYHKL
 1GF2Gk18ME0c/gTST0q+57iQSkS+JRk/Jpqd2ZsjcelOdgmabjbm8V+a3WV0l9lcUGRF+iDS3NO
 5rZgUH3mDhx5ctiHpujhO4Lzie3+8Dbp+ykGyH2tMJI7y7QNXDEt46GcMHlGnRnk9Gclj5pkAnd
 qFpNDHJWxrkrSQejbbE5J3/OOsUFkwSQ7S7tq3N0XtNyGis3MAEoihASgR8SAM6DleU3+rT7m4w
 ThAExg7mU0UeQOSDu0D+CQSmFUaLqrMm9Mr7twq4Tm8gMTXJitd4BdL6YZV+hbm/O
X-Google-Smtp-Source: AGHT+IEzxoHmzG3n4HuxC6z+DexJNDaIUy1dNEXlCE2cF0/EicLBDhy71dFO/24eaTNw02i5vYZGOw==
X-Received: by 2002:a17:902:c402:b0:246:464d:118a with SMTP id
 d9443c01a7336-246464d12bbmr286853515ad.46.1756411539067; 
 Thu, 28 Aug 2025 13:05:39 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-249065a4a76sm3522085ad.122.2025.08.28.13.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:05:38 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: assign unique names to queues
Date: Thu, 28 Aug 2025 13:05:32 -0700
Message-ID: <20250828200532.3534201-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
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
 drivers/gpu/drm/panthor/panthor_sched.c | 32 ++++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ba5dc3e443d9c..26616b6cb110d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -360,6 +360,9 @@ struct panthor_queue {
 	/** @entity: DRM scheduling entity used for this queue. */
 	struct drm_sched_entity entity;
 
+	/** @name: DRM scheduler name for this queue. */
+	char name[32];
+
 	/**
 	 * @remaining_time: Time remaining before the job timeout expires.
 	 *
@@ -3308,9 +3311,10 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
 
 static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
-		   const struct drm_panthor_queue_create *args)
+		   const struct drm_panthor_queue_create *args, u32 gid,
+		   u32 qid)
 {
-	const struct drm_sched_init_args sched_args = {
+	struct drm_sched_init_args sched_args = {
 		.ops = &panthor_queue_sched_ops,
 		.submit_wq = group->ptdev->scheduler->wq,
 		.num_rqs = 1,
@@ -3323,7 +3327,7 @@ group_create_queue(struct panthor_group *group,
 		.credit_limit = args->ringbuf_size / sizeof(u64),
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
 		.timeout_wq = group->ptdev->reset.wq,
-		.name = "panthor-queue",
+		.name = NULL, /* will point to queue->name */
 		.dev = group->ptdev->base.dev,
 	};
 	struct drm_gpu_scheduler *drm_sched;
@@ -3398,6 +3402,11 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
+	/* assign a unique name */
+	snprintf(queue->name, sizeof(queue->name), "panthor-queue-%d-%d", gid,
+		 qid);
+	sched_args.name = queue->name;
+
 	ret = drm_sched_init(&queue->scheduler, &sched_args);
 	if (ret)
 		goto err_free_queue;
@@ -3540,12 +3549,18 @@ int panthor_group_create(struct panthor_file *pfile,
 	memset(group->syncobjs->kmap, 0,
 	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
 
+	ret = xa_alloc(&gpool->xa, &gid, group,
+		       XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
+	if (ret)
+		goto err_put_group;
+
 	for (i = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i]);
+		group->queues[i] =
+			group_create_queue(group, &queue_args[i], gid, i);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
-			goto err_put_group;
+			goto err_erase_gid;
 		}
 
 		group->queue_count++;
@@ -3553,10 +3568,6 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group->idle_queues = GENMASK(group->queue_count - 1, 0);
 
-	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
-	if (ret)
-		goto err_put_group;
-
 	mutex_lock(&sched->reset.lock);
 	if (atomic_read(&sched->reset.in_progress)) {
 		panthor_group_stop(group);
@@ -3575,6 +3586,9 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	return gid;
 
+err_erase_gid:
+	xa_erase(&gpool->xa, gid);
+
 err_put_group:
 	group_put(group);
 	return ret;
-- 
2.51.0.318.gd7df087d1a-goog

