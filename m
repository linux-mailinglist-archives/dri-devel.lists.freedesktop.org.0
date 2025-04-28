Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF50A9FB35
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C18410EA66;
	Mon, 28 Apr 2025 20:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AL5AQhyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7610EA5A;
 Mon, 28 Apr 2025 20:57:49 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-73972a54919so4476262b3a.3; 
 Mon, 28 Apr 2025 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873869; x=1746478669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7fMWMaiNk7CyDgGL1rTP0tQ8oRJwKaw/NfqTzANkw8=;
 b=AL5AQhyUpZk175QCMv1DIbxlZm0NFKCEQt+ZNx4oc/1IPH5wXzb/k9zykeeyO0dZeM
 bsJI3lzJJx3e1tVQZeCyrjtyzlKzL/frG4rpdfEYxmZZgdMXP6cxQcbx0ZiiuapCx5Ll
 0foQz/wZ3xLITvyZL3Nbl2U3dQdD2l1RpftuUjb/6JTbPjgobUXfBhPRwsD15NwRgI5b
 SH6gSMU/AtWyNXB9tdYZe0ik7f5knLtHRaMVCDmEcbltQT+8Lr4aDcJC660Lv5bZ7nFa
 1UrziNGYiNJcEY3VuPtcEI6vHgPQh+qmVWpzBbLIC+OhE0uL1Uq3CAJdYqGRzCFUYzLv
 23rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873869; x=1746478669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7fMWMaiNk7CyDgGL1rTP0tQ8oRJwKaw/NfqTzANkw8=;
 b=JtYCGsrmFOvvb7I1ySGasoVBU+Ue+cOEiUbnzVUqQZPf0Y4SLMIN7lRzDpXGG+HP+5
 UvIlHx1K8Uj9kyTN4aCZL5K5DPPX9Xxo0GQDkWtcUgirvD6rYoUrhZ8Hj+lSGmkGdfXe
 Ne5/8/CtwECUuv5HAbMm8k8GUJHlHe4dWHAYUFPUsS1UuI11Kx9ZXPz7c5Rvkqs/vZtC
 p1zfnrlDbbtuOYcxaouYiWuJmyuTaBDp5otUBgHbgsjavYqXB25zXcALKBAyKnKW2Vtn
 maO81Q7dF/7CLaGrhimWGa17gNXOadzsQM8k2xD0kzG+lDVfNbsESM4xlRNKRaUPUQLd
 6KEg==
X-Gm-Message-State: AOJu0YzdVGsmUo5W1fNCOgQ2MJ4DHF3hLx83NMgsQZJXSkEvaaKG6ytt
 RD4bm/O1TWgO+1KqMngEkVbqaKOJOmJ0Wt4pYPh9VpVqqsWR4ErIBAayKA==
X-Gm-Gg: ASbGncvf5MrVO6Cf39whMuJGHiZ/PUWwMLYHJE7JBZjE/eyE2TIcl9kY9L6DQPeOsmF
 LN44qYUaYjror+fKWHBSiTi3MSJyPuMTyUl+JzyQd8xB/KfZ6agKeZaWlV5zuOPzN811ts0k8MW
 41JPjOD4ZkyOmW+6MnIgQ4Raou5wmpbKPZTzaTGAIwwcSvw3uhXynSUeWGDvcv74YmXYazxEt7R
 IivIyf3R/3xVlBErrymLLsM0aIF9XvZjLHQInMizcrQI1I+qu2/dzxzsxcYOxPlU6n+jMwGktYM
 D9Y6l6yWC1OVhtAl7AKq6oTT99M9WQtFjoT3r+UksmROWi1eGxfmvVTlW8Rvtz88QQuv0Hshi+h
 hijtbYBtuTF8Grf0=
X-Google-Smtp-Source: AGHT+IH81aqJwbOAIqUmEsnXEyHpJU/DOAKm+XZHhRkt0te+xH2CPPCuBSxjNdo1RiiUpAVVfT/zEA==
X-Received: by 2002:a05:6a00:1414:b0:736:339b:8296 with SMTP id
 d2e1a72fcca58-740271e02b1mr1655188b3a.18.1745873868834; 
 Mon, 28 Apr 2025 13:57:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acc944sm8821132b3a.170.2025.04.28.13.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 27/33] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Mon, 28 Apr 2025 13:54:34 -0700
Message-ID: <20250428205619.227835-28-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index d0f44c981351..b4b299e3f3d3 100644
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
index 4cd75001aca8..71dfafe2528d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -74,7 +74,7 @@ evict(struct drm_gem_object *obj)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

