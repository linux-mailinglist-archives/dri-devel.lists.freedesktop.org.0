Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033CABC667
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0A810E478;
	Mon, 19 May 2025 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZgNjo4Mn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E12810E487;
 Mon, 19 May 2025 17:58:35 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b26df8f44e6so4481834a12.2; 
 Mon, 19 May 2025 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677514; x=1748282314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=ZgNjo4MnHi6dvLF+RGQ69FF3pZu7pXn/2GcxqFT8WgHCOUideAl5sK0pZhzWa0sqXw
 jFvP7GCyMDvK+KEZO48/063zvtxaQ3wRU054wCSQsUnEx3mx72tb8K5VI3aeII0ZITv/
 B9h7nTYoPu3mV/gDLu+9UJreYBXdmFtm3+gFUZxng3dYy/yibvI1ILQRDcTRvO+9oiFf
 LO5XC0RH84WOao5LOsY8QmhfQLv7ioSYvX67bFkzelbYg5F06iGr1fHwuhARuI56g+jA
 N0GwyCES4Ywg/kdFPEqABiN59P/DqNYA9LHJzK3TA6TrvXXRsvLqFrZvr+UJcNyIwFF8
 JdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677514; x=1748282314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=F/B4aWmFcR044AYd1ffytVSYgOMcUFeZHqRceA5yIKDPE5ycta+U0YEy84sniPpCfX
 GNPV/SF6YQ25oq3QPsE/DnuwA4zHhbe21M4QeYszbI/rLWvakATFC00RlMFIzac3A+dE
 RbBbfpklNWHOx6dth/VxHhYA00h7QZuFYWH37iDjRIjCa9m/idUo/m1Q0xQcIe8Ony+c
 S+FiZJ9if7vH/auPBxJmRcDKVTfnc6En+Rb/UGc7U7MmUSoqchc67mZ42x5wOKR3lOEl
 HyFuu5oio0/vlgyXUPazTQ4g1SwmKtG2CRgpPTYCh5I6clHH51fN+a23Jcx2yU+s4Uie
 wPWg==
X-Gm-Message-State: AOJu0YzxfIYkxcUU5Lwe9Gp5+r3PRf3AbfPTC23zcCDU9pwFscuskSeT
 xA3RNgJbPtAopLmKih7W/QxkZvITyqDv1EswVtLniNZ70hepmZFSiPHCBijnsQ==
X-Gm-Gg: ASbGncvDAKl17BE2OBaUp3bDOXfBPwyh7n57Z7nNgnB8eBL719w+RA8BzZ3eqgkZW30
 DDVMQZ15jDZl4JLQ9C0LjUxNAFCM0jq+82osDww6ZrlqeUxmK45xOpVNmBaTxB9+z7Kgd9txSTL
 wtVYTVh7zVsvGPLOP7QqesN1z/m/DgsLtmJ4UGLBvR5SLtfUvxLD0O74r8WrA0kgY5DmCDPXnlp
 5KH29rp3mbxiPTmFnKqS4SQeRJDdRe0zjsTnnuWxcMmc9TJOwGMFeIQWgFM7y4qgy8gv5JG7+Ua
 d2K+qMdPNdH2lIhOHkitPe+jYOXdsXCHFSL9l2L8+CVx4XzrXxbCsNloaoVi87PQDNauETtXMyx
 6hZDnQe6ED5wUgvNd0w4CrL/P/Q==
X-Google-Smtp-Source: AGHT+IHrmLudJpGr4AV2O9eH5ch69mKTZqWzfXo1Zl0S1OWsw1bZvzg52Ne9++UTY1xHmvTFxaiFnA==
X-Received: by 2002:a17:903:fa4:b0:22f:f747:8fbe with SMTP id
 d9443c01a7336-231d458284bmr197335365ad.53.1747677514284; 
 Mon, 19 May 2025 10:58:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebb9f6sm63061805ad.207.2025.05.19.10.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 28/40] drm/msm: rd dumping support for sparse
Date: Mon, 19 May 2025 10:57:25 -0700
Message-ID: <20250519175755.13037-16-robdclark@gmail.com>
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0

