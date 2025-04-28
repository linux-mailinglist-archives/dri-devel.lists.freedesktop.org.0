Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13CA9FB26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD9710EA53;
	Mon, 28 Apr 2025 20:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yzg4bZjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B979A10EA57;
 Mon, 28 Apr 2025 20:57:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2241053582dso79951795ad.1; 
 Mon, 28 Apr 2025 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873863; x=1746478663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=Yzg4bZjhx3od8bbxrYYaQYD6TGVFZeZMp1Z3Ysv16DKtGijxb0Vd2jwoiUNHrYNcWY
 mACxELYDl8mAVwpoT19frcYh9JonUd8kPsx1I9Nr13i77oTuCB5d7/dnCVOCbo//Cp02
 DYMgdUYrrYqdIDWaLQrc8zTtT1UxsdUUNH5cQrRhuCvI9X7t1p7iY8aIvAvMHN1qC9ei
 mCQHcQKbCT0k8DMCu4VfjDe8x9tgSIxi2DOW0bASqoVQ3xlcF1Tn2leA84xEI+7fAopL
 leFK8Vxzz9xoKvw4NwRfqQqFlKQvV9B1++yVOx2cbr5FlIY+AURxnZHTFU2ISVP5XBPc
 G5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873863; x=1746478663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
 b=RefKDXOfsLlCNZTw1DDWOG3AoLgrbijbZMrMSKJh/D0K5+v221AmrVMAtInJx9JCxg
 sPkb0EWdvKu9AX6GxI4EHuQN3nc5Mv0jT57shFGVWHupxW3kJK0qtOmPY5jxK2JFu4zK
 5gWhHxzmUpA/KJvnDPDqw/OpAfeE9dZcQDf30pgOj48zaNIQM6bLjUDeX17ibvGxxOaQ
 4IwlKoLahlqTtwiJkyzrX/FW9RaPAY9x6SIU2V5busI8/mvKmINwt9gJN1ZyTE9XxAYx
 /oaEtH6/+n2FNFCXGYH5P/wIliXjJ2yXvUlulvVMQvY/RD+9wmR0yBdOW7XnRk7Xoj4Y
 Jz1w==
X-Gm-Message-State: AOJu0Yx9QozSpRbjjbjD/GAhxk+e5P0DaO2pnqy7v6Qfw/9PGN4QPoLW
 5lpbc+o05SJm259er5WcVr0i1yniJp/26lEanuatsOlFrTguWiImuzT2qw==
X-Gm-Gg: ASbGncswEBKLk/BBjvewSea2o7FXHdody4CBUl2IgNi+TPtrCW3TxZfTX7GutlDsv09
 PxEpKGD0vxGBcxe4F8PueWW1Kncv7pG2AP2eiMDktDh0TgO2VKyvoMqeGKSHizIr02GpUw0Dl9T
 t/n7cgX/oQXYwi10UuygzkqB0JsFCvITbP/6GBdDNPW4Gs8WwEd+tK3nMNFvZtbfU/FOyqy2PFM
 Y/n+aYf6Rs2hkpmmWlXEe1qOwqbqJpHnSADaT6LYoMMEMdEfbeuMnyvGijF0Bks/fBoCM2h0caB
 witq/J9rFscRRVVYAcq4kRAzuXOV3CHDixw14Wv0AByJB7+GV9NKGFc+TMsmDRPhG/EIFMsWARc
 bkI82rCyUBX+u6KA=
X-Google-Smtp-Source: AGHT+IGO0Wyb6MjGYuXyoTTC0xkygTgeuxFteeqaRiKWownIw9sbk+EtRyzAartKK1ODniQrSfUbHQ==
X-Received: by 2002:a17:902:ea01:b0:224:1ce1:a3f4 with SMTP id
 d9443c01a7336-22dc69f83eamr158682155ad.1.1745873862812; 
 Mon, 28 Apr 2025 13:57:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d77e77sm88284225ad.18.2025.04.28.13.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 25/33] drm/msm: rd dumping support for sparse
Date: Mon, 28 Apr 2025 13:54:32 -0700
Message-ID: <20250428205619.227835-26-robdclark@gmail.com>
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

