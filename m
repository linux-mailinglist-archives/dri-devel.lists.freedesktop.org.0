Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD9C9C700
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390B310E0AA;
	Tue,  2 Dec 2025 17:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTry5WHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075210E0AA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 17:40:38 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-343f52d15efso5333430a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764697238; x=1765302038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Suwn07MxhDyTv/iXiBDND9uQRJx8LmwrIL1oz7+9Bq4=;
 b=fTry5WHA5vf4ZjN+ryhJyCy95X+FlaApGrM0sYhuQwdR4f7Emhn5WR+V7NFL5r5dwM
 weblgdontjThNfF+R1s6zbWGWRkY5rhNHPcmYAXHjiUH7o2xvceYHObPLAXZQ9g6c+sg
 QmNuqNzJaPaWMraY7mj3I+miwHjHezoArKOd3csh4JbYqyglnwZDHE8Cj9u5sVhgaayn
 0MPNvbIfYxBmWulnbnfnkCXugVrooDXy5QbKcm/vK2tB/Kc8IxreGKMv/wDgxWzC4uaR
 zMzbBdX8jGMKPxrBvO3IT/K6XY7M8hWYSk1JnIkb1u3KvC0020RkU9D0osuv4vZXpfLZ
 7cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764697238; x=1765302038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Suwn07MxhDyTv/iXiBDND9uQRJx8LmwrIL1oz7+9Bq4=;
 b=ZUCe8/g6o10ast0xd+EreXr44d92FIGLGqj1mhN+bSLs8lTWmKPAJPFIk+NQw/GNii
 z7olfPpc3ekhPTiucPNMctoRapAJ7QRDINddc91kUH4Azx1Wi0Vbr1QsytfNCiQzWjXl
 JeJHLI4MPURd6tkGC0uDOpK/xHEuHPSGyHnJIHK5ASqL/+WGYpWXtUc2iLb+lMcivfWo
 tnG/UL/ZcQbIIHDUIoUzmFSsYsJiUqFF2NWamt+1yG0kGTQFuSCoSZIoUcXRfMVkCdpj
 qtNK/1YvTOYdch8H2WVK9jOlr9U1LuWa9Our5606SIN0pdQtNcLaHo0voV5u5Cbv0KXB
 vzNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT0JStbj0VhQgisxMvesMS1KY/3g9u49ULr2KRnDz+zwFfLFBeWOa69tFJ97GFrHTPqC7SQyL6YbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe0+h1YKvjFcTWKUDaD7q868RWDL8zyuFUuViQN2MVKO3p9mUs
 jznV48k8fBm/h8uiBSnH9muYr19pTsu7A3CeAJdk+1EoHw8NswXCx1So
X-Gm-Gg: ASbGncsCqzkVwiaf8pMuGwVpqfWlcEaW+oMLLtOcvd8u1bvuYOt5D/f5eQwgpyRFMjV
 zQTbf9Bv3AQ81hRIjmtJ5FT7Z6xrSuBUYLX6jwig3qD63+Fahnmv6Gb1KpKPLK6WCJxCLYg4xIS
 x4cclkGOMXTx17tSXvShRkYXTg/7UE+xI5kY2uJ9491MI6bfG7FCkuyhwQgDYlf8Rw+t2O52l8p
 Y/XWxpPM+ZGH6V12LQfvrYWW7p14i4tJQ2PXvSipjG97Fgd1UdI1aJmfY8rquE2D1a+v9HU5rki
 Aji6kus6ZQq2zAv0NfeKwqteibx0E/kbBeI/gvPfHgA+NM6F56TNlpMiSUAvw93ah/nqDk21Fju
 u7LvT665yGQTiuUwLjCJsmCHybMzIUT2ysd11uqorsMwqEYiA9vLn79BypLPXsWJ5axD8sDw0sZ
 TQ7j+904Dqt8F4UIPxWp51qfpUn+lAndjKOH4s7lF0k2o=
X-Google-Smtp-Source: AGHT+IGsp7LsWwQMfABLmuwuvA0AoHSFc0ja3NjzOdkUI/BfNG5pJHaQm6YkUQPDreSQz4bIpkk4zw==
X-Received: by 2002:a17:90b:3bcc:b0:340:a5b2:c305 with SMTP id
 98e67ed59e1d1-3475ebe6a4amr28136136a91.2.1764697237591; 
 Tue, 02 Dec 2025 09:40:37 -0800 (PST)
Received: from localhost (78.31.125.34.bc.googleusercontent.com.
 [34.125.31.78]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-34910ba5912sm43844a91.7.2025.12.02.09.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 09:40:37 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ashley.smith@collabora.com
Subject: [PATCH] drm/panthor: fix queue_reset_timeout_locked
Date: Tue,  2 Dec 2025 09:40:28 -0800
Message-ID: <20251202174028.1600218-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
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

queue_check_job_completion calls queue_reset_timeout_locked to reset the
timeout when progress is made. We want the reset to happen when the
timeout is running, not when it is suspended.

Fixes: 345c5b7cc0f85 ("drm/panthor: Make the timeout per-queue instead of per-job")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 389d508b3848e..47e81fc45fb56 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1052,18 +1052,6 @@ group_is_idle(struct panthor_group *group)
 	return hweight32(inactive_queues) == group->queue_count;
 }
 
-static void
-queue_reset_timeout_locked(struct panthor_queue *queue)
-{
-	lockdep_assert_held(&queue->fence_ctx.lock);
-
-	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
-		mod_delayed_work(queue->scheduler.timeout_wq,
-				 &queue->timeout.work,
-				 msecs_to_jiffies(JOB_TIMEOUT_MS));
-	}
-}
-
 static bool
 group_can_run(struct panthor_group *group)
 {
@@ -1080,6 +1068,18 @@ queue_timeout_is_suspended(struct panthor_queue *queue)
 	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
 }
 
+static void
+queue_reset_timeout_locked(struct panthor_queue *queue)
+{
+	lockdep_assert_held(&queue->fence_ctx.lock);
+
+	if (!queue_timeout_is_suspended(queue)) {
+		mod_delayed_work(queue->scheduler.timeout_wq,
+				 &queue->timeout.work,
+				 msecs_to_jiffies(JOB_TIMEOUT_MS));
+	}
+}
+
 static void
 queue_suspend_timeout_locked(struct panthor_queue *queue)
 {
-- 
2.52.0.158.g65b55ccf14-goog

