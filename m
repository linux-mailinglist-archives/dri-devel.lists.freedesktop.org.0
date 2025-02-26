Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A5A45961
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5A510E86F;
	Wed, 26 Feb 2025 09:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Na87VAsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099410E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:05:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2232aead21aso867965ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 01:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740560728; x=1741165528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SYXJdYifFv8UK938F1cugEpkcZ70y4SI16ovjUtT/x0=;
 b=Na87VAshWshheBllZ9pntWDy/2fIZoEQG8qsEvE+DcfWLSTW2PKiHRT6VqVJBximoh
 h/PVVxWOmpFP2fPUyCWrfIyztTsLECMxdCDINMNOqk0HqHY4DKNEs2IASxxRoWxH7PG0
 3wFhuJhJKFGhNjK55KygVvlqBRBjSumN9ftOz2zhZWh99ytxrVvVnOYA5O73UyWLxT3H
 oHo5S34T/Otwj3MQltKqeQ8iKO5Q5+WwKcRz2qTrY1fRs5TJIWI90gq7R78tFUCKgJMG
 wtAna29JHDlcHjve7RFCANLTBpH42fB6mnbwr6EFmTmlapmOgozqUOXZxsaipENvS/kW
 gxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560728; x=1741165528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYXJdYifFv8UK938F1cugEpkcZ70y4SI16ovjUtT/x0=;
 b=GvV/D3s9c8ne6O/4Xq6UM7cOiZrwXWFECm2G6uv43oAHFaVyxJZceOY6ztnvBrrycy
 uyNcdf1d6lz8znaMcbZXHX5FjNIhwcfcH/PJi0jQyvAqYKSqu2AFimXo+h7awjKXwZyO
 sMWD3A0CTB/zlX/WnpmTUFGNoN8EQsWlHvlJWF9gGgSrnDAvx90GrQnjdttcaYQYJdAP
 Uq0ZS7dS5m8BwlededCPZZjubV5nFL/Vre+DaL6KWKqC7JWrESBdpvsmCoVuD4W3RWwl
 gGtM7JZwy/ZllBVppFSSAsLbRo4KjDsKxAZabl6vfj+TMHu9Syc1k3ybOiQaiZphNOKF
 3Z6g==
X-Gm-Message-State: AOJu0Yzp6LjVS47tkJLCNw/6jrRNEte1SACSqSdF748TUIq5nP5nAXz0
 DXUfR6M2PlaF1lnRm6HqpjyOGlacRLSDrq8evoZiqNS8SVzvecWT
X-Gm-Gg: ASbGnct9+y0uOFIqPMobdmJcyUyO0o/cTQXCSbMbih5m/eGVYgIFhzBgEv4qNugKhf2
 ix6il/pQur+hKLnatEiaSUeIDx6acdIXebZbc3ZfmGzAVHukjgGS5xKCRDrJDkvEHhVodlu5+wJ
 nOWoCDaR7riyPfSOk8+YnFzzLo106ONpUSpSKdQg7Q5ZBYVtGSp5d7pNaLEHlHODI6ZELWEcrpR
 fqUC+kxHdFb/Mo5jJ1/Joc20iM7OfDFv9sCOhKkoPdCoAczNtW+uVVAokpBR/tM1cVulUJvVhca
 DnSurNXywXVHZuifijL37DefE8OTHJvBquxRWGanxw==
X-Google-Smtp-Source: AGHT+IElRARJT6IGSF3WnJ8KTS/H4EEWiKqM5dhHa8FhymY79x6pVL3/9XVsHpGNfAz4c3x/59PSeQ==
X-Received: by 2002:a17:902:dace:b0:221:7854:7618 with SMTP id
 d9443c01a7336-2219ff78bafmr120632325ad.8.1740560728362; 
 Wed, 26 Feb 2025 01:05:28 -0800 (PST)
Received: from localhost.localdomain ([182.148.13.61])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825a9c86sm1072998a91.9.2025.02.26.01.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 01:05:28 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com, stable@vger.kernel.org
Subject: [PATCH V3] drm/sched: Fix fence reference count leak
Date: Wed, 26 Feb 2025 17:05:21 +0800
Message-Id: <20250226090521.473360-1-liuqianyi125@gmail.com>
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

The last_scheduled fence leaked when an entity was being killed and
adding its callback failed.

Decrement the reference count of prev when dma_fence_add_callback()
fails, ensuring proper balance.

Cc: stable@vger.kernel.org
Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
---
v2 -> v3: Rework commit message (Markus)
v1 -> v2: Added 'Fixes:' tag and clarified commit message (Philipp and Matthew)
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

