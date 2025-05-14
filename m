Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F055AB7395
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CF10E6F8;
	Wed, 14 May 2025 17:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvFhO7uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4625B10E6F4;
 Wed, 14 May 2025 17:57:17 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af5085f7861so5084826a12.3; 
 Wed, 14 May 2025 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245436; x=1747850236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OGsDvIqo5XclOUc6BEWJUo/roXo2xV2Id3WLdmBtZI=;
 b=NvFhO7uSyJSW9Zt/7W+Jz9YuKdh6fz110DsKQtn+ykLqDKuPNN6PgFkb5Uwy8Jj6E1
 Ng6yZ9To8XzZcG1+rlW8ATui6qfclUHaZajKO2w1SGwaYjLDH6LuCga4aYYHd7E0MNEl
 NwC1tV45C9qmspQ3M1bUKuhAfabw0xBV3oZ6RUQtsAdhO+oADQ40lSafu45tuaooP4al
 dl2rwKct3k5iytFZkichQz0OtXZUsGP5ob7Lu0yEimO0DtYBAiBj9MtlNkJpAk4NTOkN
 F5K3RkNUjt+LsMX0cMshJicEzDVZMgeRpHN68yzU4BQ7WtAk8kKAtfCFSex4AflJDZWZ
 0q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245436; x=1747850236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OGsDvIqo5XclOUc6BEWJUo/roXo2xV2Id3WLdmBtZI=;
 b=QNylwwSMSCIfMZEaGKtSSua1Fnz57aXgPvb7LbQrSxUusN1OMAMNhxpSPVpEdTuC0L
 bCdP8rauJ4T4E9DVphTOa5AK8El4ZEU1rhCCfjYQe+YA0It+V4xwGvWKgKUDQIGAmLvN
 0whb/DYH1rT9bw5sE05oZhnp6dyaaaOS1wuq8VI7RR5GKU8mDAJAk5f9cw0oOXMqKnhr
 ufgE5rgB5vHAsdakmQv/faX1XiKRIW9tKe0CmGFGXFdwuBC76+WDUSD/TDBoFQzL5nat
 0FdhiRH9lxRZ8BGSpoje7wr+3FjQjR+r+dKEvVziQNyYIa8et9cqPG0Neb1+jQ8Waa4M
 FISw==
X-Gm-Message-State: AOJu0YzInlNFJguhI5g39HiAXM8hjWbOHyqdAt+rNN47Q1zFxLlEA5iM
 lemwW/RVka+YZVsGPgU8YEAWywdTbaAtem3oIISdkDS5jGAMnqgJ0UYHiQ==
X-Gm-Gg: ASbGncveFfsorl6QLtRIAbKIW49Cnh5OgqTH/Hj1LXOYdP9U658UJeHA3pjrp1urgQM
 5XmJj46jdlTpw1lQpZXQ0TnngaSDtwXsb194mKihMcQXzb3pCY8vYEQ3G8zF0RwpxJxfOPHvfHQ
 EdGzCz+Q1+yVG5UG26omhQ+pj8BOBMmv6L0MsGFU2vauKueIdvVcU21kGPXGhUOQbOs8oXpDBH8
 vJ/K1PSoPcYwhJcLOYk+74APptafGOfIOA3/YlCbmriRyFzXFQJoCvxFvS0UOroeW2ECK40RY9p
 2bTQDCFb3t6rsumHVYfQYTvt5XqIekWtWLkjQ37toPk3pwEX4yMUvTR9DYyFZP/Ly2R3/l/m9gT
 QNL+IsAwGUK5QibhB+zJkLozZOw==
X-Google-Smtp-Source: AGHT+IH9wQlkOPqNW8YQ4kpaCIbRl6H97vWaWszv+E6r2pcAe/TcyCnVu8w4qjCvYmmtQ9fmJR4z9g==
X-Received: by 2002:a17:903:2349:b0:224:584:6eef with SMTP id
 d9443c01a7336-231981d0230mr72619145ad.41.1747245436406; 
 Wed, 14 May 2025 10:57:16 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271bf6sm102661035ad.141.2025.05.14.10.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 30/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 14 May 2025 10:53:44 -0700
Message-ID: <20250514175527.42488-31-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cf152a31d836..f68cccc38df7 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -76,8 +76,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -879,7 +879,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

