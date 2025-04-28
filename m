Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C8A9FB1C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF910EA55;
	Mon, 28 Apr 2025 20:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LQs24qHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3819310EA4D;
 Mon, 28 Apr 2025 20:57:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-736b98acaadso5092059b3a.1; 
 Mon, 28 Apr 2025 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873857; x=1746478657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=LQs24qHZ5oh3B3NOod+jThc1PsV1fOW3OjistJsnaSwXrGPAuaA674L8H6SxUDINXl
 Q8iDtR9aXIvFjqwhG5o57E98C0mmk2BIJitdiXp89Gf2GG8FMQLyjGV7AB1osB5FEuzn
 pmr8tLcI336dGQjJVYV8CP0fpEp5BHeWVhtWtnIMtnN0PBisXtOc+3vQzK4Dr7/HlS7c
 Ndi+hRxZkBlQnOB3A32MNGop4mpKJ/vKn3qqITbrLJYnO1NAaPkYy5I34JULQBB6S8nG
 QYlhnLnqYVQ54pXOgGdUvo/WNqDe9eaGi3dLDvOYnWv3oKB0rb6gSPVoVLJkB5Xcx+S1
 EThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873857; x=1746478657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=Ru1Lbc6apW02Ov0IidQUFnJXU2l3n2FbapqyAC2704k4mLP1z0DWsVfacyN+lJ8tiI
 lz6Q47CbPrQV9zeIiMPKjvD7iHpT27CNeCBaSOGzN2XKbLoyoKDFLx5Fz9RnDk5NlA2F
 L8BgbNonWpRAIY7OWuIw85LFRrAkEp3BYhlOboYSsl8xKNtTKxk9LYDAhASJ9KSCiehz
 j+/p68Yo/ywhwFkNGaPLwwZlzjcGs+We2bXNS2s5/isEHg/tCOtJZmvkQ4Y4MJq3ow86
 lRaudQDERtaczEwSuHaCS0mS4o9sezXuz34ZyWnvKxqjyD+vYnG8VJGceNKBGnqVPkpP
 P7wQ==
X-Gm-Message-State: AOJu0YwMP7ZMFSap8/Cm2GCfeZVyLmRwUlBemfzh3A7HPuw5hc+FCfNB
 C3AuinVvyr+pYoQ9BeTlbdYqExzx5c1EUsaZfn4WbPi3bDdL7uyPAbDU7Q==
X-Gm-Gg: ASbGncvKWN5HC8Hb7TzIhytfzaVUpFM0tJnd+Z/j2hr9N3bFX4O6aNVJJqW1IYwL8lq
 pzIg+rl6BBa/M7iDoPkc0SbtOyKiYyXUzm4A6DrFu3YOEpzs/zLzcIb7sGrDc1K0ijPaL4HhrRO
 BxmO9uybJFyxKtyzRMvIbCJz9Jh78/ZZMvGuij7fBUnj8DJ+TlNHy7kwW4GFgmn5UT18FF5wNDL
 OjV+HuzISSZNSmT6yaR5vKGuJBg6UJCndDAKFukYiofvqaWcdT+Tz0PpG+Kfl9DB27X/BP6m9qF
 /NaI1CVqJabAhPgFdwKO/ymVYTu5vN3DKteYFOW3msjfhvwM9epxnu4mYOCv8Rjf+vAHmdDQ6Qb
 Apf/6SGAUs58+tTaauwTwAGP6yQ==
X-Google-Smtp-Source: AGHT+IHciT69EOji1g4AIfyF6h6GdBBIsM4KOMJEJ9YOsl4DGiZSqbMw/CcEgannlQY6BWVt6UP7nQ==
X-Received: by 2002:a05:6a20:c90e:b0:1f3:388b:3b4b with SMTP id
 adf61e73a8af0-2095b71c7a4mr725161637.15.1745873857233; 
 Mon, 28 Apr 2025 13:57:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f4b1749dsm7668348a12.0.2025.04.28.13.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:36 -0700 (PDT)
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
Subject: [PATCH v3 22/33] drm/msm: Crashdump prep for sparse mappings
Date: Mon, 28 Apr 2025 13:54:29 -0700
Message-ID: <20250428205619.227835-23-robdclark@gmail.com>
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

