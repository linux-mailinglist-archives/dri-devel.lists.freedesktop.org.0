Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9FCA439EA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED010892F8;
	Tue, 25 Feb 2025 09:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UKfqDED0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AA0892F8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:41:58 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2217875d103so12386985ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740476518; x=1741081318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xl+Y1l5voHQwtJP92LWp/7002pAoHO14kkZNlQkkxFE=;
 b=UKfqDED0QA4lF4k6g+2nBG/TVruY1tn4Dw6t0OTJvdKMR1nRXCmAzTXDwtcEd/UxuU
 hCTSCJIGmhN6wDpkE79VwUgReQqy+HbekLVHGQU3iFcNEEG2UQWntzBIzN17OHM2xRh3
 vCMv1HK5tfJbklWH5TsFSMuUbuB+TWXFwzScugmv4go9wzKphTd1aZSKkth5rZSodqmO
 DBKlXV77k8kv1wlvTh/4h+W5+9ip8dI/zepyy5A5h5FSd0IlNe73rSagHg68mHRwSPzE
 98SHarbZhd/7wZxJjrYu9ZcsjsmqF+Jx5oRsMHuKNudWjHOynWMcmpgtt8xfTwFVxvf/
 H3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740476518; x=1741081318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xl+Y1l5voHQwtJP92LWp/7002pAoHO14kkZNlQkkxFE=;
 b=GxsZrn0pkslMBaj2nbFPrh3nlGPzBYh3sq3tA2AnEFT+uEdB9W1igItZKB5ns2QTeb
 cfNxqvgDUapM4KS9F7aEtCmehOQmj4qJ6UfvxyTugiJUHCD6hfvQ+SKNcX0GmQJGBWlB
 ir5zJppZ5wxyn7gUjiAUu2Tl6z+/uvHwgCMVQMb36vFQq1DVPbc2H3uh3MIWKkuUVuv8
 7X6fNQLk+qnkFBLftBKdYKcx+dU7TTrKJLJjEZni9VC8pP3RVPeVthZpLi+Qwh1nhHKA
 7V/TCfYFUx1OAJ7lZZJ4lQR185lTLuEljVLCcHBgIB4XvbyQdG+pxlhPdncIZMbjVKHS
 t+4A==
X-Gm-Message-State: AOJu0Yzztb3WUPfVfX+sb/wl7QUAsKUD0Yn5mmudh2OE0KOWA2qWlWpP
 RoJh8/7KgLUUpsNBqPophouzl3HU6ptOiAN788pZ0S/4fLfrewT2
X-Gm-Gg: ASbGnctLa7wy8QIx3LELMuJTl8iv0sqCmtXSUt1A+2PPoucNmGhAEqZWhaxjkZ9dfun
 TA1zTQASvqSndX6fDcE5f5rMrVzgE42R2INoiYH3RU3Ld5SQ1J+kOyK3BHZuj5MvH1IwdpT6BS6
 r1pYf7iGxcSohK1ZRrzt5BvJ9SFjwiQwF4tg/AipdIp2joX/d7kMlYanJVXGOtBGocYHQhZgw7Y
 7nWVFDavXLmpjJ8n15k703W9oyhd7G3/kUFFiHt1RQQwUJhKaTg6II3MxGVCNcVg1pIYPru/aRA
 2iD+MycKvFjplGNUKRo6TJUwioC0OA1EAtEOlDQTkw==
X-Google-Smtp-Source: AGHT+IGtCeMHEORvZ0nZqeqoPBF/JydV8dIFt56d4Ce/z/GzK8FrT+PFRSwZV3bo/lzU5Od9Izv+Zw==
X-Received: by 2002:a17:902:dace:b0:221:7854:7618 with SMTP id
 d9443c01a7336-2219ff78bafmr97636405ad.8.1740476517699; 
 Tue, 25 Feb 2025 01:41:57 -0800 (PST)
Received: from localhost.localdomain ([182.148.13.61])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0b0d61sm9986085ad.240.2025.02.25.01.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 01:41:57 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: matthew.brost@intel.com, airlied@gmail.com,
 ckoenig.leichtzumerken@gmail.com, dakr@kernel.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, phasta@kernel.org,
 tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com, stable@vger.kernel.org
Subject: [PATCH V2] drm/sched: fix fence reference count leak
Date: Tue, 25 Feb 2025 17:41:25 +0800
Message-Id: <20250225094125.224580-1-liuqianyi125@gmail.com>
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

We leaked last_scheduled fences when the entity was being killed and the
fence callback add fails.

To fix this, we should decrement the reference count of prev when
dma_fence_add_callback() fails, ensuring proper balance.

v2:
 * Make commit message more clearly. (Philipp and Matt)
 * Add "Fixes: " tag and put the stable kernel on Cc. (Philipp)
 * Correct subject line from "drm/scheduler" to "drm/sched". (Philipp)

Cc: stable@vger.kernel.org
Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")

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

