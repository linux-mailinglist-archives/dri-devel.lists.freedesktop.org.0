Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F0BABC666
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82E510E474;
	Mon, 19 May 2025 17:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PIfQwI3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D83D10E46F;
 Mon, 19 May 2025 17:58:32 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso4856673b3a.0; 
 Mon, 19 May 2025 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677511; x=1748282311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=PIfQwI3OOZHknLvgXBcvzo/0kUmopnSTEV9XrynjxGzFn/BKuzfWSFcz8mO1O34OOs
 VKAk8hsIm/CuBAZfegNlXNiEXrgLtXHbMS68n573Ppx87D9UQz1PVCrlc7u8XM0pPt8g
 /g8WPzeJpHbAWE6BEwvyGqj9wliX0GVvtbgR3QBudp+0g9ZmULPWq4Cklt4YltbJbnES
 3lhZfXjQZQPbHjYCruDZelwIQZZr88RB4bLjuQ6JzWYnhY9tsi3C89YlXsNczZIZQhTF
 Tz9+gawAL8PD9wt9kNsAbNmZyvhId/Wavaf+CmHgC90GqZsha22Y91plFDS4JZOc3jyo
 yIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677511; x=1748282311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=PEMgj61OiKuzEjAy0vg5yiAIwh9wCCSMtq7pAfu8XkeAu4HcQ9LtieQLHIUk/AsSm2
 d0HxJbnM+KgIz64Dbml9rEDBbquAny06pFIa+S5NAQYyRtRDMGiNFVbg6ZtGSLNuXZZ+
 rHqLaLWeQXd1ppusnGCzTeuHnWCM1M+r+iRL9Gaqj8fpDsXlZsVZXdCOH6X97ZUbukXg
 6ex0S2EiwVPzHjmcudqglHTC2VV4PSCuriirhAFcA+TppZd/7LaiTffOZ1H269oRiqBz
 ambOyMCadSEgg+9fCS7bXnpVfLT3NmLwZqQY1SKvDxACUqMSjaKLT9OzXlhRjORvClB5
 Xy0Q==
X-Gm-Message-State: AOJu0Yy3nvDvn2FBZeEyJqvKx5b0UPW+0MYTGTFLyXFwis15C9JIzU1x
 yZOs8qHqNXtqQU2/gWb7vsfKj1kdUZuDyPysxrhwyy7V7Ud3wUm2ksxMt0ScSw==
X-Gm-Gg: ASbGnctU4lYT2sZeDaRBBnEQ0xSufS7n77g4GxZSdP4vZz51/uRevV71y2A/hjNasrt
 iiCMACUvbVxciMdQSkp04k3jRkAGz2vNrCEm95ReMjAQWzN9r6y1cU2BIPpi7PKXxmW/rQCjDgk
 +WRtlfdza7yv5eq0AJjfeSqMM2W7i8R5BwcM4R27I3wr7kVu7xylzLXdmv/7Gk9XjitZk6rPGWp
 siq985cEYpDGAVoSEb5SdQk4rkeaf9j0BhCrqxHhyO0suG0K9cvyTarK+hdCA9HZvaaPc/TfYvD
 Rw3V8jUfVIIZX9W6XEAJoPSUjMI5B19kyIYk10+4hA1tNDgbdiRg6A4a69qMFmjZTrHxevXPKYv
 tHY/gOV6wDfTD+u5cKlbKkKnVyQ==
X-Google-Smtp-Source: AGHT+IGcNbZUzGfoylGoUZxjRkQzz9FJ2idEjJZ6ivfqPV/jiUM1EgTwpooQaYWRwMgYCi0RdliOzw==
X-Received: by 2002:a05:6a20:4309:b0:1f3:1d13:96b3 with SMTP id
 adf61e73a8af0-2162188cb19mr18253281637.5.1747677511282; 
 Mon, 19 May 2025 10:58:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb0a44e7sm6583580a12.73.2025.05.19.10.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 26/40] drm/msm: rd dumping prep for sparse mappings
Date: Mon, 19 May 2025 10:57:23 -0700
Message-ID: <20250519175755.13037-14-robdclark@gmail.com>
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

