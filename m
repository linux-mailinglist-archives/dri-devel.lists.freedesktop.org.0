Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B037A59193
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3A10E3F0;
	Mon, 10 Mar 2025 10:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RQ8qLKDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212B10E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:47:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso23867935e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603627; x=1742208427; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dxe2UdMnuICWXIR/40yTHRWRgSj119FGmCYLgFhERXk=;
 b=RQ8qLKDc5svHoBtbsJlpdO+sl2G4W1JqPV+KeEvhgNG93WNseQhskto8aC7lXCiZc9
 sb+DRcsVpN8OUSEfN+4U9rMpdSsFE+TnYkoTZY1A5SwtR5OmhnZA5vubl1G5bdWQ8+UY
 Hs1cTcpmtrTl4fd/WApm+uzPdAiQwkF3/s7LiIktBj0cO0myUbxtSgd+BaKGUUPFLldk
 qjZclxpg/bjJgCdThzvyEdv6CT1WwxNOvOFKXXvOcE42wxWwk50BN0IiA/RGQqk53QzO
 s3X7bbWULEhCcfScIUa68KGGYgjbSUynB89MFxrZ+km1mULXZZ6utTmTRKy8c8T5nZiZ
 ZY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603627; x=1742208427;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxe2UdMnuICWXIR/40yTHRWRgSj119FGmCYLgFhERXk=;
 b=h4Ca2tXKAlL3VtbHq30ypJlvpTLt8hKrvFonU/BdBm3IPw+0B2yPRDd18B7LKh9PQc
 T5xEtVFTo4qjrRTI6/zXWdci6FUeoLJGT/JfLrWwAHqO424tn83d9IUQ/QXsDy2hEw8z
 TSXM3OIS/h+De4Ng3tk/w1D6h1KJHX15TP2SPMfOIq/lfEysbduN9/oZWHU7eVo7fMku
 dTT22/P57cQwGSNsz1RNyLU053DAG2u+CrruP9I53OAcu0dHFRiuw1njHH7PMHzZ1DWm
 oFodNt2vux91GuM3pm8yDkMd4h6SiWbMIRjBMeJMMthhBerR9jtb7usCXchxoueT9m27
 bpFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOxB3WaqIMUQvyDO7RHvZeRBVBZ0fI3eoMmvRfe8jIav72XxTgCaqWcbIS/e8DI34TRTG8803WhqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywad8jCOzOKJ6fPIAgv7lqPYbu0yZPKsVsS0oZbjH5tUEG6FxG5
 chBWZNsToy6oKPea6FQGc4SZRJvgwrNRpOWSqxq2G3UxASKMSG6zMgq8s4qjbRE=
X-Gm-Gg: ASbGnctOJ0aFF/IbdDPV/4kyO+IZgWrXJr1zTK0HYchcFHsuoOlXxpOSd6c8pOYe4On
 Fnjg4BLELa05mnDgYgN9LH5VjuUP6sCHokXvL3arX/UnKm4PbpYnQXCFwp/pxrjDaA2AlYv/T70
 fyUtoGAKbZ6Wh1h7a0SQDwvNtGnmNswosIhQl3+y4p2KnJeGMyH994tkZ7wFfKo9emtOTqor4o8
 wkb1Ij+tTONibO4+XkG0ifnp7ulZLNkXyqLQSVgUWDcWhNao3xx3OEOMmFRhQjgKorIKNBKnorE
 eW9rqlIBI+0MuqOM+qvh5ihLQqHGcj2TjT6Lo+RbZgI6vykdvw==
X-Google-Smtp-Source: AGHT+IHZYEMjLRapPZhjVBke2kOIMDf3xY9p9R2H2E6KyfQ0Ja2SOjNPA2cXqXY6FK9cu+NqkjeCfw==
X-Received: by 2002:a05:600c:474c:b0:439:9b19:9e2d with SMTP id
 5b1f17b1804b1-43c601e1393mr91960565e9.16.1741603626942; 
 Mon, 10 Mar 2025 03:47:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43bdd8dad73sm142867745e9.19.2025.03.10.03.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:47:06 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/gfx: delete stray tabs
Message-ID: <92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These lines are indented one tab too far.  Delete the extra tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a194bf3347cb..984e6ff6e463 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -2002,8 +2002,8 @@ void amdgpu_gfx_enforce_isolation_handler(struct work_struct *work)
 		if (adev->kfd.init_complete) {
 			WARN_ON_ONCE(!adev->gfx.kfd_sch_inactive[idx]);
 			WARN_ON_ONCE(adev->gfx.kfd_sch_req_count[idx]);
-				amdgpu_amdkfd_start_sched(adev, idx);
-				adev->gfx.kfd_sch_inactive[idx] = false;
+			amdgpu_amdkfd_start_sched(adev, idx);
+			adev->gfx.kfd_sch_inactive[idx] = false;
 		}
 	}
 	mutex_unlock(&adev->enforce_isolation_mutex);
-- 
2.47.2

