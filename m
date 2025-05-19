Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F352CABC66D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B3710E4A2;
	Mon, 19 May 2025 17:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="abHHim/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78CA10E467;
 Mon, 19 May 2025 17:58:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so5119646b3a.2; 
 Mon, 19 May 2025 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677510; x=1748282310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=abHHim/NdaEwT6RJ+9L7HjSoAvbnXGK9vyRejR+qVeDzz/avEc8+SmVm31q3g1pg0D
 Kj1RubQr5VtOuyWTV8mzT4RODlPUzoqq6toI/lt86ZJWYBN1MrL03F6d6f4DUm8FSLRR
 yI8lomp3iK0caU/3DCu9h4aYYG5AfwYsDTtXxCGVemr8KBMOwkbrXJ7Q0U4memd/LLVd
 x9bwO+iTEpDj3GYWCDYijURnMUnLIA5KVKtKizvfXrUYtoBxIXDn1R8fkpB8btm5QnGl
 pFcFTmSR7qE0dENA1RRbZtkUD4iE/0lTr9yrtvNjAOgTW50GqWycnQP42Uzxrhcd9o3d
 U2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677510; x=1748282310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=Sq1ZUecXtcI+OhfdFABbRONl99onv7kI5Kk/iZbUenvmjUg9ta9VktMMxOxDzlEg0L
 QChXrPchvoQAoIyvxJyLQEt4Raof5bkI8DVYXwEx89pj5gTmEqXmMPIcRsJJlPfbJhvB
 UODQC6iO7tEKONQ4ytz2UvyckwGlMLq18RUjWMd/oC9g/m26wlAvzlXSbiLREmOSM25T
 4TcZziUXm9La8jHIxytZG5bGHzU/Wga4XzOUJEOEII0HX1Q2TzUZ8yfJwg1pQrKSs3gc
 UVRF8cZS6JJFXdDZsKjIAlVfrhF4NYaQXGNi8+guaGHQtLNnfsItOuzucJghOi2O5J61
 b5uA==
X-Gm-Message-State: AOJu0YydGwAk1Ar6eV+sZLIHwTdTkAcXkKOJ4qp3IcreXDEkZhJzIFoE
 uOd/nf8oDSmrAiSXGhSlfm8mnXbABGttZmrzUsIuZPWGu2vvpuMVw/1lu77UMw==
X-Gm-Gg: ASbGnctFdXXS5uYT8FSXb52ArhzoAd2jgI2WlLgDYcAUB8zagFmePGBFl3yokE8OGhu
 F7Oa1J/OI0dOkPKoz9lfBmCrHXmO1IDOigDlHq/lfJnwvYc9Ay5CDDkBznnqiqV4VFWSZy4LEd1
 0bAfAa0GZyqsAeM+74Mpa02Bz8O95EFnqtwlk+yiey1l6VMsV7f6kg8k1tgQcoO7mh/yaejP6ER
 rSvIkQDUfeX6qxSfRBpM4VLaW67Z22pEcXK0n1cwijqnGTm64gcsGhAMWQV6iJO8cZXbrE86FLb
 cdWIDwxE7qN0bjrzpQuBoH8VzHSWngsPNRw8gc10uiaRH91GW037Dbe90ZabBLpeNu7jfH8fnPu
 AEdP/AFhglsHKXLX7UbocA+vSVJh1UUD+6HZv
X-Google-Smtp-Source: AGHT+IHFOJVq8mjGt4OQPxx9qu1OTBNCaGJXJ80cWCN7v0fVRfy0Hrt32g1zLejmVT6bVKwJz/WjxA==
X-Received: by 2002:a05:6a00:a86:b0:736:a8db:93b4 with SMTP id
 d2e1a72fcca58-742a97a71d6mr18340281b3a.2.1747677509539; 
 Mon, 19 May 2025 10:58:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742bab0bc35sm4789417b3a.13.2025.05.19.10.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 25/40] drm/msm: Crashdump prep for sparse mappings
Date: Mon, 19 May 2025 10:57:22 -0700
Message-ID: <20250519175755.13037-13-robdclark@gmail.com>
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0

