Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72372AB7393
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9F610E6EA;
	Wed, 14 May 2025 17:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="exTE5VVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2E910E6EF;
 Wed, 14 May 2025 17:57:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso224859b3a.0; 
 Wed, 14 May 2025 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245430; x=1747850230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=exTE5VVKHT4OlGemPCOvb0vDY2ZFF72igowLM+sbSj2H6MEtvcIhzWXtTXsa+Rp8WW
 UfygHSaect+Mj8nFhKi4xHQKCWn7rdmmgl5UWn3ClC8gAZaGh+e0Cu9ldb34Db0w1Te4
 2YiNbfobr60+zGSRts2p0mkhHLChhsZnfE36oOcwgUiADZSZxHL8kfafeTwHYdpJB3Y6
 1OEgWSrPTnTB9vOVJauvqU34AQUHS+grxoEjpd45yh1x8XPVJJAeDWTs/jXwA3LVNq0+
 CvA3esXDOjLTHnGZcgH92Y/9ssAh5ehGrV4xzoOZKUc8+0y/XTGRaKGGh7iNxpbr8uu+
 cTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245430; x=1747850230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=Iii0I3ewGe+gbED+lEfdNecvdi+Xsbhm5SvkTrPSqFyY3c4dIN0m61ETZk2bwqylLY
 FV2JziCiJokT421T6VCHJLJ/yv018Eyr/uNkKclWEwerHTgc1A9y7fHJc9Bi7ZTEWZG7
 zzwTQlbKCFZB2iBTFHuL60gZgvfq1zQZC1KLIhhgijdWZgQ0JP4IdzBbGmdWItDmvEms
 Adz19z2rQ6fZQrPYzbkmHfuc11+QUkBA6JBNXhY81py2BRPbq7PaUL6b1NaJK8/I+irj
 VGFpAUfUMpxxok938mU/4LKA0B4FUkr6DJj4fT/EYCCpv/rrQuSBf8MeCAnhhDjozXwk
 SwXg==
X-Gm-Message-State: AOJu0YycEphxWHCQdXIihB+sUjEyPEWyL1FEYPVGhP8z6rpcTtyhSvle
 URxYUrqXytBRgrz/htIAQB3UjvLY0+U/FeChmRDqSGdCAZsvwsM0w5Jg5Q==
X-Gm-Gg: ASbGncti+GO4yk2lM3hjKJ1VNTTa9t74CPLLRgyF8bsNVUbDBumTT0Yo6tesb9SevIP
 8AcIVQZIW0Hjltt1b/K2yfDAP03eTeBSGKmvb7NSjsijxxow0MHwHn9uagVuUCNd0j8ZE+ydRlN
 m1Ny3i1MENB4kGImpdx1tHcjMZ0chK1q3BV1R+AbnAeh3lKFmRSGRrQi3CwGmFiZ9vvU3ozkX+0
 1Teh3S+dkb9gkZDZw1yknsz/+tJwJZC/pFU34pzejb68rcZsZwt2E2st8yHUTFwzdxtnOqtzpxw
 t1ExilTudrm+r3lQhS81YYBopcBVVyEWPtxS+F1M6L0AKuIyuOCFmg52fdyXbTvJrewPvlo7lVw
 GhdWH5hgnpaNsE9Z1h6wxT+UQCA==
X-Google-Smtp-Source: AGHT+IERdBLJnsCnw0JeOkTwexRLqCKnv6uxUFKnFKJqf9D0Ew2AiXRI1GIuglRISh+thcuyBqTkHQ==
X-Received: by 2002:a05:6a00:13a1:b0:740:b372:be5 with SMTP id
 d2e1a72fcca58-74289290623mr5862001b3a.9.1747245429872; 
 Wed, 14 May 2025 10:57:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7423770510asm9662944b3a.26.2025.05.14.10.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 26/40] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 14 May 2025 10:53:40 -0700
Message-ID: <20250514175527.42488-27-robdclark@gmail.com>
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 67f845213810..f7b85084e228 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -402,14 +402,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.49.0

