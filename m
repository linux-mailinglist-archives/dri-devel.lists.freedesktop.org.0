Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B60AB7397
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EE910E6F7;
	Wed, 14 May 2025 17:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="np4jp5NU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396910E6F3;
 Wed, 14 May 2025 17:57:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-742596d8b95so187556b3a.1; 
 Wed, 14 May 2025 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245428; x=1747850228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=np4jp5NUiv0oidwYq2BZ93cw0AyMD4bmHzEawgsc00hvgckweBv4tMt85xsbqG7zqh
 itGV4iwiP6ZD9Gb89GdYO3jht0CaPrhRtL4xosjMsrcDvkjFbC8lCW+tpAGPHw+7Sxks
 hEKueg9t1eelrTJ0k3YF6BHpV3PedbMPB2+zNA39+wvsmZUZcWGhOflWNrDAxtfHDJpP
 Vxhk5wiKSig8owlbDzIP96tH5287Jc9PQgaZt6f29A38bX+anw5mhuNiwFSuylYmiuCP
 19GEEYemgRjAb12Qzv++ArOc383dbz1F+ansCbsefLQXF9L8sdImfJ8Zabd+77ugXPzE
 IZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245428; x=1747850228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=Lv2tIUC/q8BLc2Cj877aT3wEhDCabvtCBZhGpgBeMhkv4IYT+uGjCLn/UQ6F+dRdJh
 TvpSjAQli5xUnZxDZY+PEQGDK9hQf49Y6P30ll4qAPuBh3PjZdIm+iADVRx45iyIxZC/
 tpfO5LEKwbXJ1mhlCs7wUe8OGfnoGbmPwWTc2oaL7CAJ0k+aPLnF4iuJoK397/ViuKVV
 fqOuzajOjiLaRqlvdDY7TQGNzTxNCIbjeoPmiGIz7EI+uceyB3/yXwmCLKEuo3OxW8Rv
 4GQdqZf1+6xtpVjc6KlkNvKi23+SylP18rXTizDWnMqvnTztY1U83H/iii+ILso48BgC
 f/qw==
X-Gm-Message-State: AOJu0YxdlSWf0HJm2wUCGO2P00yUQfdi9tLqrhAb9ARWyfkV+69h358y
 fItKeFy0MVu1ESHt/hYzeLJJBwy0duYJs+CoZ8361Z6IwWo7VfFwXs1BNw==
X-Gm-Gg: ASbGncspCHSZDnzoWihxDta9F9REVkEaa1CIbxf/r5HplcD73TSHIlQjeI7U8E3ng7u
 xPu3dAKxXdCxgpXmE9WrGayJH4/aOswehcPTH27n7LsEqxRrrzs6t5pJzCwmT7SNBYFUEe/7MNy
 hTb/AnxgdAzRMmEoPDJWAjQW5eejn/jcj0orv4vW1q66HJgEkNooQwiZUwLIoHLz+0BP1qEkyGI
 Ac7BST0Ak/zaAIkNes9Z8JdyajfIQKA1ktMifH7RQBOHG5j1T6JJRXD4cehSXKdBVlaBdvG7xXf
 60PrFCAJYPb1VpUhtlzm4NRjKRdj213XgVah/SjPmLU/6BKuGJ//lSpGH0LCdDYgrn3dxi14gS4
 LpSzBfKTUde/VT3lgPkt5I+IzQA==
X-Google-Smtp-Source: AGHT+IFvqGDDbKYn/ol2Sh9+UeUz8WXB4kWezbNzsAEeALL/EHqt45gf7BNh7xw8UU3lGlwevYccsQ==
X-Received: by 2002:a05:6a00:ac0a:b0:736:692e:129 with SMTP id
 d2e1a72fcca58-7428936236emr6894905b3a.24.1747245428509; 
 Wed, 14 May 2025 10:57:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7423770424bsm9657937b3a.30.2025.05.14.10.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:07 -0700 (PDT)
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
Subject: [PATCH v4 25/40] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 14 May 2025 10:53:39 -0700
Message-ID: <20250514175527.42488-26-robdclark@gmail.com>
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

