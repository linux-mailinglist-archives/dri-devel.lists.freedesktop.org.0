Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2EA5B8FE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 07:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0010E011;
	Tue, 11 Mar 2025 06:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HbWim7JM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE4710E011
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:02:58 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2240ff0bd6eso10499055ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741672978; x=1742277778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JulbF52Nzw24BwpCt4Ixlc53AouAB03xm9qoZqBqETw=;
 b=HbWim7JMPIt5waVy010Nri7+8aJHPS0sVy0pdYPoIf8Z8CPxFDUjZzITYOzXhLp6jm
 3Hn2d5hA2oJ5T/Tz5HwVjcnx+MKlSij3WsQivQGuAsvWbiYdTo/0bYJo7HMuMreDHmpd
 gHGHNYpaVpfLsRASMqRGx70TLvugxqVvgMpPA9wG4ujzR1phfngrVyh67lbddeGSA0U2
 PaR6KTogcbqiC2zuGLSI0cOjjgVauHYl/kcX3T/6OP/pN3rBvW3gJGBoE9MgbdbgwKwq
 QdEaXvJsIu0osshILmi4zoMnqL45NBm+DoqJoF3dJcTr7s72f85SKLPP0xgiByay8df3
 Oe3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741672978; x=1742277778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JulbF52Nzw24BwpCt4Ixlc53AouAB03xm9qoZqBqETw=;
 b=Zmdm8424rq9r9mgt0SvCNsBkxsTyUfpxWWn62kAnyDtxu2tCns2hebaD9o0Tg2faSI
 nBSJjbgep7cXEjV0KypCLAtPUGUg5WTStVDUNlXfKCSFpZv5x/BwAK7a1kfFH6KDGBiL
 0Ydvxo2aaex/Z0mrHPft253B7B1M0KZcM+MgYNGOIuMi2FcCqhaWb2ozxZwGq1eYIkZn
 cSzv0bZsf9sxrNTc+n86zFjd4CFBk9lci2NONbQ4P8YVHRuUJGR8qKFnoy8NusnqkjYJ
 3Ho4JaLs1+/gYVbToR2XXGnVjAlej9jiy6bSMYeUywoEOC/LVG3NIxI1pQSymY8JEgYF
 jlDQ==
X-Gm-Message-State: AOJu0Yzf6Y7uZTeEHcyaKd/qRc2k/JnUdRnRoJAvp3XlpxawKMhXzNzR
 +SvrghBpa/yZZlf0KX1UMvg5eBjkObtLfYFt5/Shu88v3M95t4YGCNEUD5CL
X-Gm-Gg: ASbGncvwxYxbpxALdnqkfMSL8PwowH2cTOu8qA8ACnvi/kwCPW8XyOVRPEucj4+OY+x
 SPWLK9XnENHSSfwGTT+GpSd36Gs8srfG847PRpWi85zm7UQnAdthLqUSy1wAGtKfmPur/TNSpdM
 DPHqJzGfw3k5VTXw2i8nsg/ljzudrsoqgX/funmmSCEmWv7KNTs7wKpouqJU3Os7daorEWfu0BQ
 ur+CszxCSmHTjaqGxu6UXhEMGiyOrb/7bwl/Grv0uYAXR0Rbl0lZKWxO+eIlodFpeJfOEWjo4+p
 xDkpJrXkaAdvHPRmKNHw8jq0q9k0umdWV0Nn6HckRaTbfgDmh/c1hHR8IUTwrQ==
X-Google-Smtp-Source: AGHT+IE4gF9L12lkMnnuy83IJhQOl+v0FkPavSfxpwEcmbXeQ7gR2r0o8PwM4B1Z0tBb/fM5R+7Ywg==
X-Received: by 2002:a17:902:e802:b0:215:8d29:af0b with SMTP id
 d9443c01a7336-225932f6a0cmr12423375ad.14.1741672978048; 
 Mon, 10 Mar 2025 23:02:58 -0700 (PDT)
Received: from localhost.localdomain ([182.148.13.253])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91b8asm88833735ad.171.2025.03.10.23.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 23:02:57 -0700 (PDT)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org, airlied@gmail.com, ckoenig.leichtzumerken@gmail.com,
 dakr@kernel.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 matthew.brost@intel.com, mripard@kernel.org, phasta@kernel.org,
 tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com, stable@vger.kernel.org
Subject: [PATCH V4] drm/sched: Fix fence reference count leak
Date: Tue, 11 Mar 2025 14:02:51 +0800
Message-Id: <20250311060251.4041101-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: qianyi liu <liuqianyi125@gmail.com>

The last_scheduled fence leaks when an entity is being killed and adding
the cleanup callback fails.

Decrement the reference count of prev when dma_fence_add_callback()
fails, ensuring proper balance.

Cc: stable@vger.kernel.org
Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
---
v3 -> v4: Improve commit message and add code comments (Philipp)
v2 -> v3: Rework commit message (Markus)
v1 -> v2: Added 'Fixes:' tag and clarified commit message (Philipp and Matthew)
---
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..da00572d7d42 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -259,9 +259,16 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		dma_fence_get(&s_fence->finished);
-		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb))
+		if (!prev ||
+		    dma_fence_add_callback(prev, &job->finish_cb,
+					   drm_sched_entity_kill_jobs_cb)) {
+			/*
+			 * Adding callback above failed.
+			 * dma_fence_put() checks for NULL.
+			 */
+			dma_fence_put(prev);
 			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
+		}
 
 		prev = &s_fence->finished;
 	}
-- 
2.25.1

