Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F114F8FFB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0730510E3B8;
	Fri,  8 Apr 2022 07:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E0B10E3B8;
 Fri,  8 Apr 2022 07:58:20 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu29so13789912lfb.0;
 Fri, 08 Apr 2022 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LDg0VuOdkCKm0C8uZKp3vKpTf/VpsO8U9ed6vcjhQTo=;
 b=TAfmtGR4a9a3jgYPSlQ7/KHOY55cHJ2ZPH+9tvKC7XSRQzemgPxT5uuo5NqPmlMrYb
 g7/2IJN9Xzw2TASKcNKcaffTQV8aDR6Vbb4hDIMyK0Mdujx5V4YWTFmXzhnZvDk2UlIi
 tgWzh1dy3QsKgBEpmqFUlP9Bmrxw6qzurk0R1TofqqHib2TrmWnkKE2A/1xWbAcemmnw
 Lbuk3qPIMCx7WSAaZSshBYhR7x+Rhla24TRiM++omihK0V4+pxuPlvFwQyA3OKBaaoKd
 c3z1qXih8x1kjR1ndEVUZej/p/Cne/Zo0XrpIJQLX+9KhYKPnvy4amdrAX6U/aqAnFD6
 9oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LDg0VuOdkCKm0C8uZKp3vKpTf/VpsO8U9ed6vcjhQTo=;
 b=XLjM4ciLnc4+1MZ2YLPirlR0Gj7Ko+hCO2RPlcrCZkpgkjwq5xrQNVxMOOn+Jld8Q7
 AcnrQ1rU6Hnr+seQ5tYvBE2Jt/dXFLgT1Z5D55xvXiq+Z+6OFKJC0MRx4xRuEKCwF2Z3
 YbmcL7FxR1SLQfZyLTnvc7junG8MK3FbCdzkMsWYUAruK79JjRHVTycJrt5gWzrocdmE
 h5I9+WebGu8IFeInCSOFuk//bHcIM8OmI0aYqbXjzqeNiJM1E4ypUPHuDddP8bQE5cZi
 tEeOBN+jhvrggg4Gui5WJHNbzqqeRTMHFocZbp9KjWC6PkiGcDM0qtErrZghdQedPilU
 fbfA==
X-Gm-Message-State: AOAM530DWAnRWLH7YZULmEjvLzqa+suC4tOulb0Bi2QMdLrn3uaspGLc
 419lyqm0GJSPUbSMrR7ZXNNNDo2GZ5rpnA==
X-Google-Smtp-Source: ABdhPJyYta5aydqTXUvGMWiC0TCQ8PlSIHqgPbTB0TDQ6KifZ6JROMRtolpO3so0hsiB92awnmsKrg==
X-Received: by 2002:a19:f00f:0:b0:443:ae5c:47d0 with SMTP id
 p15-20020a19f00f000000b00443ae5c47d0mr12061146lfc.332.1649404698181; 
 Fri, 08 Apr 2022 00:58:18 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:149d:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 g9-20020a2e9cc9000000b0024afe85d0c8sm2170520ljj.121.2022.04.08.00.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:58:17 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo.Siqueira@amd.com,
	Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Fix incorrect enum type
Date: Fri,  8 Apr 2022 10:58:17 +0300
Message-Id: <20220408075820.10396-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, yipechai <YiPeng.Chai@amd.com>,
 David Airlie <airlied@linux.ie>, Victor Skvortsov <victor.skvortsov@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of the 'amdgpu_ring_priority_level' type,
the 'amdgpu_gfx_pipe_priority' type was used,
which is an error when setting ring priority.
This is a minor error, but may cause problems in the future.

Instead of AMDGPU_RING_PRIO_2 = 2, we can use AMDGPU_RING_PRIO_MAX = 3,
but AMDGPU_RING_PRIO_2 = 2 is used for compatibility with
AMDGPU_GFX_PIPE_PRIO_HIGH = 2, and not change the behavior of the
code.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index b3081c28db0a..1d9120a4b3f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4745,7 +4745,7 @@ static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 		+ ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
 		+ ring->pipe;
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
-			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
+			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
 	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 			     hw_prio, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 5554084ec1f1..9bc26395f833 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 		+ ring->pipe;
 
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
-			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DEFAULT;
+			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
 	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 			     hw_prio, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 71cf025a2bbd..029c97c92463 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2278,7 +2278,7 @@ static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 		+ ((ring->me - 1) * adev->gfx.mec.num_pipe_per_mec)
 		+ ring->pipe;
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
-			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
+			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
 	return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 				hw_prio, NULL);
-- 
2.35.1

