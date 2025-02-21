Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC8A3ECCF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 07:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E373B10EA24;
	Fri, 21 Feb 2025 06:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jSSEVVPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5424B10EA25
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 06:27:31 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fc288da33eso448651a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 22:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740119251; x=1740724051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5PUlkILcaVGQL/e6xHLxhEm/6slgd71dKud2+gLheo=;
 b=jSSEVVPpiKjbfOZtFYYD9sRB3mpWpwR4qAvCfg5GLKXJ9qhuLiYCMRJi62eeLD2wt1
 cRrEL34xwhusSccw0OdhFV6YMiVInezHi4A8em49FIGN4bLY12d0ga4FqBZZ364y6/31
 QIjH2/lKCKaQwpEc1pCLRd9CnUXswuZKq7tY+V4wEx1RjoTaDrPYf6CuA4Vk/r3Cvx+J
 msTsNBSFsaYfN/zWYkhAlfhclBWwIJ/3ykcKclViiukoGCc0ebgEJCgTWm6iR1UWhlFB
 qjLS0JK5OA7zKfVphzOaZsQHLSCZmIlqbXUuqB+gIskzuBRUrZ9lGgOoCXsEuBC2h8iG
 Xirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740119251; x=1740724051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5PUlkILcaVGQL/e6xHLxhEm/6slgd71dKud2+gLheo=;
 b=xAAih9xdMpcUYgRTinNvqfxgcNHOxYRF5NfOlBaj15rooSrqzIHqwkdmtQQZh2y05k
 dGudLTFonkYAcC8/EAycz7xIOwRmnfvqmfavusYqS6iu1HB11OPGKz5mv5tKIPSKlzHw
 fJoMVPGHdkrk0zRF3pHWbOh0+64mrmwX6y73pJF41LOA9k5v8B1a1dyZmgZKbx6logqh
 rrqVfo5yAh6zOmVkvkCMPJuaGz1YnBqLhlr9gq0kpIfyElObJqYcwTi4pRmDbmknK1hs
 5YbxLs/MjYSYJautl3OKnO4MFu5tYtTUWI0V2AiKWACpIIRuAOxnzr5yg5RQT4W3im8e
 iCpw==
X-Gm-Message-State: AOJu0YwRATydt8T5gmV8uO22kUdmwnCbk7exFGYWGT1kxp53leKPYc4D
 hpMAQZXgkcMwXGUhb5/IM4Yk4QLadmWwB/PdKsWb6VgfXYPFn/fe
X-Gm-Gg: ASbGncsDs4ARwcfWRVdYLNLxHTHmFiz1O3KSMRff4T/zAQSp3MRNmrGr4ZoMSvmWp24
 5LLUuyyC57xwoip3gkKcO1mUwJwAaqEy61AHMhX37p8qYEFsx/5WPcM+gJRNooPy6I5dQSgcZgf
 2IVe44HUZV8DJPwjMPqEfYMcSx5eBdsDh91RvqXeH1th5kZSxIlrGdiHCyT+S3lfGde3d71De5v
 rBQ02w3DEZIPXe5g8m6DSJsDOPIpQtz62zZ5fRm/2xtEDyb6HMYbUXnBsmDUcq+dD5HfZPgf2yR
 DDkJbFqDPDwAFDfoRRaI9oM3om6cis6OQH1vH1NiuHY=
X-Google-Smtp-Source: AGHT+IHd2gCWe8oAr3s+MMnLxjBGDFBvdc4Lu1UIZ3GzVVQeCS76/zsPHEsRIOs4vDSz8aWvvFD/7Q==
X-Received: by 2002:a17:90b:38c3:b0:2f4:465d:5c91 with SMTP id
 98e67ed59e1d1-2fce7b4f242mr1239593a91.8.1740119250695; 
 Thu, 20 Feb 2025 22:27:30 -0800 (PST)
Received: from localhost.localdomain ([182.148.15.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb10fb21sm508197a91.39.2025.02.20.22.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 22:27:30 -0800 (PST)
From: qianyi liu <liuqianyi125@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com
Subject: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Date: Fri, 21 Feb 2025 14:27:02 +0800
Message-Id: <20250221062702.1293754-1-liuqianyi125@gmail.com>
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

Problem: If prev(last_scheduled) was already signaled I encountred a
memory leak in drm_sched_entity_fini. This is because the
prev(last_scheduled) fence is not free properly.

Fix: Balance the prev(last_scheduled) fence refcnt when
dma_fence_add_callback failed.

Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..1c0c14bcf726 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -259,9 +259,12 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		dma_fence_get(&s_fence->finished);
-		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
-					   drm_sched_entity_kill_jobs_cb))
+		if (!prev ||
+		    dma_fence_add_callback(prev, &job->finish_cb,
+					   drm_sched_entity_kill_jobs_cb)) {
+			dma_fence_put(prev);
 			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
+		}
 
 		prev = &s_fence->finished;
 	}
-- 
2.25.1

