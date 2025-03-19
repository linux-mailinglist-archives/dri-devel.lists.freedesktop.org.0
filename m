Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BCA691A3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8581710E51E;
	Wed, 19 Mar 2025 14:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fmwh/TUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6A410E536;
 Wed, 19 Mar 2025 14:56:08 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2235189adaeso17216025ad.0; 
 Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396168; x=1743000968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syWTjTZ+GTk6yKure/ngwPwmYsSOIjhNb/4/wpDEG8U=;
 b=Fmwh/TUHtplzL1EtwAk1OpA/Lw3xS1cHC3z+jPS2Xw4JlXYZy8PuZdI4lGPtSoe79u
 P9BvLwl9VtnEesdrkkYO+kmJVs48nsovkGicIdPHRxmTFf+8ERWwmILQs700Bo8Popfq
 saimKbVaMIlRjyA5ovqw8+jQFN8/veEe45mYfcZWEA+iHLHI6nHbr2DvzaSuk84PxzsH
 p0MKDUUZCGItgdiLMNBFECFG4rZiHyS0JPq7LTDVQZm6FcbdsLwJLaZ2HBZPSUQEEe+u
 2RQkRK1bblKlEEm7UKGsbSHC2WHhgDO0AkMX4NCAGBSiuT6QYr6ShQFvpktR2Vi821Mr
 VnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396168; x=1743000968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syWTjTZ+GTk6yKure/ngwPwmYsSOIjhNb/4/wpDEG8U=;
 b=ZuFK1K+opTcgZh+eNp+Rne70/DpFfo9dEWCph+6lsLKEkniVioXw4AQ6DeNcGn9Nd5
 niCYdqHOhD6nE5lkj31P9qmoEX+Ri9yVkC10jl09y6eRqXZlBRZwpr8ze4iZtrb2VNQ9
 2b5V1WnD9xVR1VL5TJ5JeSxuespsBl7SUJuV3M/OxJXhFAP1QsEiXO9vPObM748sNevI
 leW3lDxUw2b9eZ9ucCb4GbLe3RYdbpvEPzSXZgbxyOEr65wB0a8kYStXbZL7GUvxZmtT
 Wv+v1Q+exEtd+mWKX2BhwCXS2MMfDbh9Fcd2or8ct5pPYWprXo4LF5m34wPp/WIDKMCC
 snXQ==
X-Gm-Message-State: AOJu0YxPZtDSZEj7/1vA2vrUqc5bMsiz4Lto0YQ6sZSzIgfh62q+WX9Y
 c8DjnR+66q0RMUquninLHYGQ4ezSIW3wLUfMcKKuveENwvjjN0eYBTxa1Q==
X-Gm-Gg: ASbGncvTfcL1NPdwhKIseBmv/ycd/pLE5WA40ZK0SnTMqf/97w2or8cawP8ESg5kf/g
 JQTcnUSRahIMPCczaLs7WyTq+GZA/+8Iv60mjQ1jhnsA9xcimFewCZmJ0XITSj2x5FI54P8Cf0o
 p4qIPP3iCMB3CPRyIr6wLXTMouAeRXeuqmu5Uzttgzgdd9UgXupndxxD9I33edGzQxEIu2Hsi+X
 VzZeG6rsjUrU/A2LbkX3fzzocjRUrSMTpOVqV9VhBRmtfL5xcN4Uu0xFiQRjCixdKyrIHHiFhDb
 2JM0LnBovZnMqWTShybNnJyXzdndOTgdsrdqJr+0emwWVvB2boU7NJHd4J3+Y0+iHOWrLhmilFq
 mDCkx3uapjMJ97nIBzpFfi/SFGjLBAw==
X-Google-Smtp-Source: AGHT+IFcSZWcMU2Da/pZDo0aJtfjbW4/N0GwYAaFsHrjzlIK0U6ajFL0qhqT1uK3MnFdyHG3KtGiUg==
X-Received: by 2002:a17:902:c950:b0:223:fb95:b019 with SMTP id
 d9443c01a7336-2262cc4a926mr120904215ad.24.1742396168054; 
 Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68a448fsm114995215ad.72.2025.03.19.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:56:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 33/34] drm/msm: rd dumping support for sparse
Date: Wed, 19 Mar 2025 07:52:45 -0700
Message-ID: <20250319145425.51935-34-robdclark@gmail.com>
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..1876b789c924 100644
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
+		mutex_lock(&to_msm_vm(submit->vm)->vm_lock);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+		mutex_unlock(&to_msm_vm(submit->vm)->vm_lock);
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
2.48.1

