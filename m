Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EDC32248
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B0B10E29E;
	Tue,  4 Nov 2025 16:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="e3IH48UT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D3B10E29E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 16:52:21 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4710022571cso53844855e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 08:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762275140; x=1762879940; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3I7l2wLDDwEsKZizWvufJnUJgFCRc38UnTb6EWKRbEM=;
 b=e3IH48UTnyHtGTm4wc3wLWipzMhViorecC/cUEDFBJleUcWinU9eHByOnJMMiRD65/
 Pgvf+8p9U0/wVut5H6EMB60ZNYUgTCIjZsmzEIzZdIZs1w37kz8f6ILCiFaVhny39PVD
 S2JrMGkyXakGVWFGQ8fiZfpYMV6Jf6hNUPF0PyUCHx2Kp3sHxzbiRPNHlJi9S+w0ac6J
 vXDCzPZzk++0eIUFqUiYegPEu3RhnxTWIBxczIUJCrQzqW+Up3JeZOzeH8WhVgAU6DYU
 genNHq0Yfg1Ah/GaI/Tf+BywMlyS2xPYoFrgia6BBOVmO/fZ2B2it9FisHlLNrt+AOnD
 p6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762275140; x=1762879940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3I7l2wLDDwEsKZizWvufJnUJgFCRc38UnTb6EWKRbEM=;
 b=CkHqtwps3tzhYO44uQwnxAaoie1K6mI9xSTVX+u5G8u5HfJUmX2GAZ6N6I2U3DAbrh
 40SAhAoabnfv+QF0NFytKS60OMABfjFms4FZNoSsyGzCZ0p2yM4IQMTjIYFYNRPbbfS9
 t5YK7PDLpxXUmadb1t+1urWED3vGkPyDbO6TFpDPa8HkgxFU+AE7aA+wpm+EZCVB81YU
 YzujskIYgQvnu9rsR1ybBZ/hBLfWECN21nJradwmUm6vLJiA4H2FLYvtftPHht/ISR8k
 LzTvhNtPvBkgHlhA0KZgxnxNczhkI9yjR/olIVQ96kIQSdubAktHwb6PC58uIbOYEYdd
 SQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3+0rN0zQ5Cxa/ZDdTk53yRvEM2o3T9M7eS6WQ/+KawGAaVNHiG4ACcQS2gaizq261tEhUQJCDUv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS1fRn/w5lsRPvrk7LXpT9yOGeFWZ31fHP138mLLz0rdzMw8Qh
 A0eQyEdrXJ36XJfxfejuDhbzxWZIsaNI1ueskbUxuyK1uVhGSUpX9GVejUL5yQBSJKY=
X-Gm-Gg: ASbGncvL9fte8FpH1vwIMFJwVaid8yHsxYDjE1WOsTOWV725WOpupnxalfD6BuY91mf
 6K7ChUc+aq3oU0XKep1EKkchCYeb7VzhK9cf4RZjdSKV4ABotPnVIpUltdwayNaqxOD46hdGpio
 wqQ0FWboS3JxTYBX4ZDbbXQX+i2ZGvi8SrenjXR4u6LC65WGwSkguOvqv6enuN5oemmks9tkcAJ
 BBZZ0BaP1zdRUHhY7iYMQucnLQOmkynAVUbfllOCdThJoCdnYuHb1WZjWk4ihSmgFka42gjYUPH
 DTDWYaR0dPLKqKLLsM8fQIj/oRNkzesO7UfTr6b02WkpAxiK1AiTf39R8sLF5yWNuNfS5+UjbmR
 /8L6N5c3i/dolzg115t5Bsfk3h4RN+pU5B87+SQhcGvkgzs7CbDiuX5fsi7wCCrACDNf7+zykdH
 36ACjsuOKU8x6xNpwfxnaR7as=
X-Google-Smtp-Source: AGHT+IG3f1EiisRZ2Ghmy4+ZkeArsqoIDEncz9VaV8Ksohr2DwWKIXQ/Q+IucAz4uItuId/2mUvT7A==
X-Received: by 2002:a05:600c:4e43:b0:477:e66:406e with SMTP id
 5b1f17b1804b1-4773088be60mr168636915e9.29.1762275140054; 
 Tue, 04 Nov 2025 08:52:20 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394f17sm224276905e9.14.2025.11.04.08.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:52:19 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian Konig <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/sched: replace use of system_wq with system_percpu_wq
Date: Tue,  4 Nov 2025 17:52:09 +0100
Message-ID: <20251104165209.309545-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..13192e99637a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1315,7 +1315,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->name = args->name;
 	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
-	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_wq;
+	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_percpu_wq;
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-- 
2.51.1

