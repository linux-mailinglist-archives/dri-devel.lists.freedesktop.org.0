Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4FAB7399
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585D210E6FA;
	Wed, 14 May 2025 17:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nFCIpoTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020AD10E6F3;
 Wed, 14 May 2025 17:57:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22e4d235811so1260435ad.2; 
 Wed, 14 May 2025 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245433; x=1747850233; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=nFCIpoTOukX4ljJI9LEX0wPAswLy9FJkD4XZhoNRGS9zBxuJWQL6EU6Xaa7W3eLtnG
 cS3piuSHLIgwktG69IB2WPm2jilXVfVb9rvdabgxdu7gYLqmhh/eeFPIREVgZVhF6PVj
 YwFoKL3pgIlwDzXlS/tNC856PAofkVBMOpHVlS9KWCd+DcHl2LL5pv7on4O4Bc0gkyoM
 LJjeO6ZJX216a6IKDlArpUgsseKlWf8QGeupQpP2UrzFwfONYU7+nyGS/zLq3vjRifvp
 IAAuiBoY010j43I8+EuIV7Q+sSqdK4O+J3ku7Yr3Vx4zu+HE5aqeUXK/TqHGr+NL4JW0
 91Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245433; x=1747850233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=NZSm7IUHlMrDnlH+XoAw044ssnYA2qiZcac8GA+xjwqhgXSLuBVJlIwzKKzvUZaxMc
 +nsY/RyTPp6Jhh2wy6fjR2tCDnPaPXknHM9VNalbjcR02k2pbaB2HcRP5zOA6PZiyKM6
 4OLlEXp6bCyCongACyx+a0k2nI3eU3ythRGJm/3B4L/aR831oqrodhF2djfBTgT1W4WL
 oxfb1uu9LDf0ki0JBhminpkQzPikR5gG8XRg3nWgYpHBLoyaoWBbuEjvOQByVQCLVQwh
 L+M7yPGaUFkv9URyuogBYKcFVUIfKTupmf9CXM4EtCcu10NSoYC+32vsZl7zOlkNup51
 fWTQ==
X-Gm-Message-State: AOJu0Yy6m+MEcIXclZvyn0sLmbpAXb7+DRHudL48yp7vT4vunuVC0/Pm
 BdCorKfDsNJZYUJvNnDVx41i8GUNKy69eEEp7RgarhGnyN7k+fQV80NYjQ==
X-Gm-Gg: ASbGncvZblXN4mmxZpPDzZti33M1X7JlpPJP11xZin2kACqv6yM/pTVV+c5GujgTKnY
 JYiqui+YO0ufGGPHUI+Ux45Se8QK1Bs8v31B0/sv3IAqjVHMOPMtnh+RiSei3hejVwsfMIkj1xf
 NxBFRy4iWPWgInk0rPB5yEzu4qKAdE2xl8fvWIznynRHNYzlncwV2foeRaoPEw9lnLY2XA20plM
 CVHMeH8R8Rn+UhgiZq6GUH0Ls1yct7nO+vHRMDQnUJFJMZMxoPygr9WNdL4frwc+ynVHtTvyFQE
 wR+de4IVQeir9JidZQ5SV6yKkj/q0fJcSm3qxIicH9px3TIhcMPsF93pXZRZADccIhOksQegIPx
 rlwbBMSeIv19wQb1L7tuAJ3EXfJrMyf7pEKRR
X-Google-Smtp-Source: AGHT+IF37JM7RU82Eh4gVcJCG45SjQ0Om0e94uP1ly014l7G76cINVXkAqGEtv39Wzw2dlqIT/fmAA==
X-Received: by 2002:a17:902:da8b:b0:224:2717:7993 with SMTP id
 d9443c01a7336-231981c916emr61269365ad.45.1747245433151; 
 Wed, 14 May 2025 10:57:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8273db4sm102829615ad.131.2025.05.14.10.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 28/40] drm/msm: rd dumping support for sparse
Date: Wed, 14 May 2025 10:53:42 -0700
Message-ID: <20250514175527.42488-29-robdclark@gmail.com>
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

