Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74EABC669
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCEE10E483;
	Mon, 19 May 2025 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MFEJf7nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F7B10E435;
 Mon, 19 May 2025 17:58:38 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-231fd67a9aeso20279275ad.1; 
 Mon, 19 May 2025 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677518; x=1748282318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yw8+5Lu92Jvnuz9rkyDiNgf2Y33qWiuGoKmOSlycwFo=;
 b=MFEJf7nfnZ1VXubPRjg0r/oAh5OAyT+A5M2HYOpesanG8s+Lr+/3DyBDHw//KjzzqW
 j+OL1idEx4E+SCCin39sPtJUkdLiDmyzQGw++FhcfOFtnhGjkxzzdJlYanc9Cj2VgP3g
 YljQJCK1Un1vUCeeYBzhwdRNgVrOUJ8/sAB2fVQjmXyv3z7EwDSgWcQ+Tt+RiOtS7Aer
 qkoOC5QcwWQbjpHNxBi0SZ4k3iysNOEXqOH4U/e7QnzgaL9GtMObEstZlFpMBvtEv0NQ
 cJbgjGG0UNngznEqrNQ/fh6if3xETSQ3GCrfkxDVXKAtTiuJgZwc5MIor36nW2brSP/U
 REaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677518; x=1748282318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yw8+5Lu92Jvnuz9rkyDiNgf2Y33qWiuGoKmOSlycwFo=;
 b=uczBp0Zi18DuYWDBSCFb9ZTearllgi/j9+4Z6AohkKhZaBQjKKbzwN8Xc+8v1Mvgax
 bYDpdO0kgHSzPI4gBqo+HfBcadzvg8figvzyFa71IaLW9ylekJQ3Jl9XTbVNP+nGa4y8
 64RyzY2kV5BdyTkfcAnPY3kORn2lU1VXQUZZkJjAwrsgv7dfa3fELj/QAS7Yxs7Tua04
 7xYNKJY93dzXv6vWoTge85tGEkSOJNVXYszo1eUGcrD7R5ZcAtHOVt5tBJHfhBitfWwC
 TtZ4H9kNdWCiiRdJQoob0TjT6T2BS1cKJQ/CrqVcNwi59PeBL0sHktWvtHeQ62yOpdGg
 hXKg==
X-Gm-Message-State: AOJu0Yy83G6qgFQpunjCrUW26DxJSm0kSV8PmWH1rH9DzYKzME15dELx
 4KJ881izAdF5FzWLbXl1pVl6YUj/RJ1O2LTX9Vetfx6BnpcAdyCBDz+XCabv+w==
X-Gm-Gg: ASbGncsy5Ypfdg5M1ujtWYGhvpvLdOlP0k5+BnIxCz1f7DH5cSQHSo4jXEJIhINirMd
 5Wf/OOQK903UbCx25J9BY9jcXFzBn9wjWlFT8G6Cc1CNz7weW+1cbMRaOBVtmI6YfQDEq2EcSxN
 DE9ebXhQJby+ax2Lg7R4Jn68o80r9MFyGy/wVy5kT4TfkOrJrv5jKzu6gGRaORvdD2rqEozfgxV
 X7j+BsVxagn6OXOqVyMb36hpnC9OFG3FwDyQDN+hUGYXhsKU19jNLKig4UdCuy7mY6/qvr6mdjM
 866gPr/kkiG8OxKsmB6ALlbPJBxVIyhHOxbSojDWlu7KfvEKtIpXh4uNXpb+QGb+PMNsyXkGbcY
 QWGDRYoE3U2qobZX7whAfmxmS5g==
X-Google-Smtp-Source: AGHT+IGs6KrnF1n7CohVGZ2xmw1s8L1aM9us0S4M1mcH1itEFyn1K0EgB83X+frh9MTVQgjtuCFIYQ==
X-Received: by 2002:a17:902:f543:b0:21f:1348:10e6 with SMTP id
 d9443c01a7336-231d4d2041dmr208599415ad.13.1747677517708; 
 Mon, 19 May 2025 10:58:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e97dadsm63119275ad.141.2025.05.19.10.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 30/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Mon, 19 May 2025 10:57:27 -0700
Message-ID: <20250519175755.13037-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 65ec99526f82..cf509ca42da0 100644
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

