Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26646A9FB20
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5784E10EA56;
	Mon, 28 Apr 2025 20:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DrDauYR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01DC10EA4E;
 Mon, 28 Apr 2025 20:57:39 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7fd581c2bf4so4207630a12.3; 
 Mon, 28 Apr 2025 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873859; x=1746478659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=DrDauYR0ru7fPXQ+eLLZRIZ9yF9m0Y76feEXJO36LIZLRTpeSFQLKZbfWLdpSzWT2z
 +UoSmBftjyA1Fd+OXuRgPN/ZYxWip7Hg1+tOpoHzPkKMSf+35BOmsg/h8uPQ2bwoAgDW
 m2oHd1xE33x9TFbQ98x1yiGSjeYhOPdhg9+xHbvBYtFzq6jTradGQNn3mRYnSUVt5sWN
 XpMMFGc7bX55egNPL0ipXuKSsD/UwXnE7Sg/tKTArPR/XbEv5qVdvMA6uFa4QFd3eH8k
 grU27Ofe8BsFJOPbQQWSTwRBt8Q8k0KM2ybA+kpGwgIw35GRFx/fkCwTwnsspfueTe5I
 Sm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873859; x=1746478659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
 b=g64YeRbzAtIM6Ein5smTfP0qhBK9F/c0mmzkwbGMQMs+4plEoWEyCvO8ktDBp9iltV
 HUugV8vomPRkQNsvegQeSXiR3LDx7FbNvXZM/EpuSwunsyxjwYxU1+tovtiBdxnoOIL0
 JX5l4ahJZgrTnHfOa4W4wd3kKFNgvqqZZyBzvGGDFw1qQxbBe7qsOZqzSV/h7nHwQjFF
 +rzaDSKJ57LvpEEQ2gAfn8FqchKCNcr4xFUqVFkhNY4DTLxUroq1wtJDEXtkwrosTjiy
 5Fry8BTGbF2U4e3xiMzGYUU0+xNUGU4qYJvBilROuXRL1vyUHrKccO0S4VnOQ6LMJ1Wy
 vTWw==
X-Gm-Message-State: AOJu0YyXUacT+xTz4IYyaooWKlig1mLKogMdNLV+cJVlMqxO/otJ0hXj
 atV+IkvKUqi61mFjoolYMu+lguBF49cvj4ATHFAJB0i9qoN/S4QuVeJDfw==
X-Gm-Gg: ASbGncv07ayVqgnVdUkMWdwxrL5SipKPv3mMyDBdzrv7rndxIgIDeW8oeQN7RMuNKLE
 oEF6WoPyQmypjrywAKM6Qzv5gQuuYRk4aiSVv+OmR3aGm8/JWvCQ8qtM0L98B0GJGlfrmgOBXGC
 +fzEL6XIMMDWKCKyEc83AobbpeIrrq1nvdVtWpUiDnS2rekaxCu0ZeOV4jZXIw80tzXHjdQ+kdY
 v3rT70C+J3hpO6MsTw2C3baut5rqD8sZ5UzWxunENvm40eTlz/YkH0XctbFZLjIb+dm1Z/PgnQh
 MeSA7UWY8zEv6TWg2EK3MNkCVWYhbo08ZwBq/pP1zTffkUI+xTYavExa0aKvPT1nmlDPu9VcFww
 xke4n5qJ7t+ZqS08=
X-Google-Smtp-Source: AGHT+IFA4j1FCmA8GPwBPzKtphBOSMUEmDwzd7txi84H6lRlkSebQA9HsP1oOd1oXCDN8qelajX4jA==
X-Received: by 2002:a17:90b:548f:b0:2ff:58e1:2bb4 with SMTP id
 98e67ed59e1d1-30a21586c93mr1552123a91.22.1745873859063; 
 Mon, 28 Apr 2025 13:57:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f754fed6sm7783001a91.0.2025.04.28.13.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 23/33] drm/msm: rd dumping prep for sparse mappings
Date: Mon, 28 Apr 2025 13:54:30 -0700
Message-ID: <20250428205619.227835-24-robdclark@gmail.com>
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

