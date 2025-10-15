Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA82BDEE2C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ABA10E7FF;
	Wed, 15 Oct 2025 14:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K8l9S2cA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7146D10E7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:01:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so2974234f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760536891; x=1761141691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9aopWYIGKKMTITdYGGPITlLtWGXJZ9UMU4iliXxCKLM=;
 b=K8l9S2cASC/fHPpi7rIOsy5/7PuwJqy7aGTTUAyeE7hM0jUmDZCE+wDtyk+DhEhfAc
 XD2bN/Roa23YZgumfTSwupWmEPalhzw428wFLYvraVNigXzT9IfKeLdPEe8wO4jHp+dL
 7qmMVG+38jkFbmpFq2WE2zGgeIBhJa5bMrPmGIeehJ8PvZXJVRR/U7+eKEdEj3/fF45H
 cF6+a819Mo56Z4AIscXSGqWpAl8YTTofw6Tt6l4AClrgT7Yz/nkcgGISow11Y4IyhbZh
 CJmrI0JC4fsEKbVSi1AbCQMDXER8srFiFIf9M+qNzbtb4odQpsHfn2jguoyvcfswi2vb
 GHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760536891; x=1761141691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9aopWYIGKKMTITdYGGPITlLtWGXJZ9UMU4iliXxCKLM=;
 b=XotJ6qUtWk9S0h9qkMCu699LbfkkL62Zg8bv//6PmkaxVhQvTjV/nXaCj3A3MwQ+DN
 KNcLzDc/0XqQbEeNAPzPTb0Y+77IKQW8k5aD0w4K8s1aDRNCkrBcVO1q+1VBKjDcX9py
 eTxRh4nGVVUl0Xts7ftoZMi4Y/ax6Jw59/qLe4k2r7Xg1Z6EvCF6HAA/pS037rGf3Bar
 5Qdjnfr3l1gRidLtbgmti+P33EpAMmYMhNHqjQbsvodeHxsjLNQuKoD8N8zFhUU1jXIP
 VxLnytlfL48/PgSHXwPROkz7WAWltdBOv4tJAm6tyvh5WjvJZtNzb3ApEzzFAz4QI9IH
 W4CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAW2kC/Nr0MXKcTHPBeB7qWGDu5KEolTbIkHwhYrXoKZ9ShEtmzIkHJ9zPJfTAXwHzGEoysv4+qmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv0gw2wA4UCN7zgi28L+9DgftLVle7LhqsFMW3u4CoFrxSpNuk
 qKer0ktX0Y9oO9e6pc5az+GnrYMJBoT7N55/cYfAfo69kwMhIqgyiumu
X-Gm-Gg: ASbGncsp6mDCo7ArMiPIv7vcaKGQAO8CO20loZ/Xudw8yGma8wAfBp5Tc5s1/3tKOa9
 WnFxNuiumMFkHDQHv0e3Rgc03zFp9P8rMf4l/BA9uTiYtNLWIVJ7KsZw85FQA1PCh4j8Q4NBt9C
 b2oI8Ce04oxG35Is3g9vpM8R6Lz+JJ8iKeUO5oxkgWSz9VvLldt2Sk3jF6dsvj59OYNzBnn5t5m
 C/ZI1vaRyjHXS1VNYiHEAowHLdrfrwkWGlE4EPqgmsC2uNR8EBSmIp9cuhYGj9YTrfKeYIv+rln
 m9asblIMOdwcdb/53ipVcWVRNXCRQMlSdbel49UqWTIl8Q3dgDfPyayaJdKELL0RscPynY+yCJ4
 3FfO2kxUYuL4OXqxEFK8ybRhcR9WnuvOA0OqBdruWZiCC5pnwNY7aDml8IWcs0iYJpg==
X-Google-Smtp-Source: AGHT+IGNCuw0Pd9XYHRNCJ6sSBPfv8Ks+EA1UeX9sxlWDGvDzG/hCu8/nkyCUB0/fmNV0y5ew+BazA==
X-Received: by 2002:a05:6000:2501:b0:3ee:1125:5250 with SMTP id
 ffacd0b85a97d-42666ab97e2mr18015704f8f.24.1760536889922; 
 Wed, 15 Oct 2025 07:01:29 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9300:e9ea:32fe:4eed:f926])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d49bsm30770151f8f.10.2025.10.15.07.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:01:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, dakr@kernel.org,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
Date: Wed, 15 Oct 2025 16:01:28 +0200
Message-ID: <20251015140128.1470-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

From: David Rosca <david.rosca@amd.com>

The DRM scheduler tracks who last uses an entity and when that process
is killed blocks all further submissions to that entity.

The problem is that we didn't track who initially created an entity, so
when a process accidently leaked its file descriptor to a child and
that child got killed, we killed the parent's entities.

Avoid that and instead initialize the entities last user on entity
creation. This also allows to drop the extra NULL check.

v2: still use cmpxchg
v3: improve the commit message

Signed-off-by: David Rosca <david.rosca@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5a4697f636f2..3e2f83dc3f24 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
+	entity->last_user = current->group_leader;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 
 	/* For a killed process disallow further enqueueing of jobs. */
 	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
-	if ((!last_user || last_user == current->group_leader) &&
+	if (last_user == current->group_leader &&
 	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
 		drm_sched_entity_kill(entity);
 
-- 
2.43.0

