Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE8A691A6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CD110E51F;
	Wed, 19 Mar 2025 14:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AljFnt9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757DA10E535;
 Wed, 19 Mar 2025 14:56:05 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22438c356c8so121929315ad.1; 
 Wed, 19 Mar 2025 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396164; x=1743000964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZyxZF1nI8E1mZeUh1efMDQKSRZ1oVsI+H9k2RwI1Ak=;
 b=AljFnt9uvqCJDpbcSE5ryoC47koXOH2vnGWTv3pq6AzbID3EMmTLTAULyCLOyX9YS7
 GJ3QA0wpmUolL1ffzuIxDuH+l+j8mns08ARLdT/swdhRhrHKAV8nPwC1wo53FAIxLWzl
 efe2/c5abHnO5zQo7jOYZaW59wu2HMOfha0nzETU1zOZIjaN5t4C/R/0JFaF+fbzaicV
 l+Os5ZZum7NrnC1DDFpjeEJolmc0La1m77InTHomj603sDD4wEIAMLZIb7ETOjHq4Ozo
 Oxy7NdYnSUa0mG47vHigBAqc/lp4w8W6M8p6/Zc1uftvTPuHLwjGxdV09dkt0VX1qIF8
 bX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396164; x=1743000964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZyxZF1nI8E1mZeUh1efMDQKSRZ1oVsI+H9k2RwI1Ak=;
 b=TjOjPpl5DUWks+auretVSyDc9nqc3UtJufayVFMwLUs8mhrNiNFDfWLedWeMLF1kO2
 JTchPJClRVZx6cJb7RxJeP/rxG9kPZiiXXTHkhGjqGCa+/3kl5CACy9nVVg2ffzH40tE
 YcIdrTFzjs+84W+rbzfHVg5Xp8tWujGfkL++XR8MmJ3KKyV5BlW6nuXSKINlc420gZrN
 dvofssdPPXOvmNVWWhrlT3+lb/1uo6JnVvIPv8leHRdg3WGDKU8DwnK+XgornyhOx1uI
 YtjjnUfp8uCan81d8UekHmEdBRAIuO99vP9dadg+mOXsibjc8Q4SgE+nYkAbzCeuselm
 uL8A==
X-Gm-Message-State: AOJu0YzFqIQKo3fdjmklOSfNuke7ughtUyJNj19OChU2QG0DZaOPf9aY
 cya1KGf02le+I9gM7YMjjVLV8oO0gtseQQNJdEylWb44Zmowcu0DanI+uQ==
X-Gm-Gg: ASbGnct0/2LGQ2whTphCn6ijuYmAkJizrNLbIOvYEtde2Ohl4x+bPf9W7cx1cvAdOkX
 NKIK8SfkjnMjJvDW5gikM/EZwcGY/2zFXvgXqvdgC34sv/PS3D3YXH9eFGdOH3jx5HMEcYbHla+
 SiLGHjZFEZUjWqT7eFAA1rs3GEV+OeP0gvvmB/WTaYbT3tJaYGB14o3DgiuGsIOI03UzcNy9KYX
 p2syc6XcYYBQMH9fez6GPGOIl3xxadh/hP09e60FLz0o7Mcgod2sQmi3UdFFgKIyWZ2X/c1A/DR
 vJU/krVjgMBI7AlKJZ1KZaL1UJQMkPEgCMXgS6bz4QUryi7R9leDeXWigSNBriHH3PmIJbR/pUG
 cAwWcG9MQl6M2DwW2PzY=
X-Google-Smtp-Source: AGHT+IFqEszybvbaGro60Kzsz4sWMwuybNXHGvQpUzUdz3uKHnJ5bvPgXOMr2/uENrWiEeOfd1OvXg==
X-Received: by 2002:a17:902:ce84:b0:224:1294:1d26 with SMTP id
 d9443c01a7336-22649935818mr29989425ad.13.1742396164506; 
 Wed, 19 Mar 2025 07:56:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbec04sm115037555ad.191.2025.03.19.07.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 31/34] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 19 Mar 2025 07:52:43 -0700
Message-ID: <20250319145425.51935-32-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
index 0409d35ebb32..bdd9b09b8ca9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -420,14 +420,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
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
2.48.1

