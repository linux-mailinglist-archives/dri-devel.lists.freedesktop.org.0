Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022DB13DEB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6CB10E16B;
	Mon, 28 Jul 2025 15:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lReySQEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADFE10E05B;
 Mon, 28 Jul 2025 15:06:58 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-32f1df58f21so44675551fa.3; 
 Mon, 28 Jul 2025 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753715217; x=1754320017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HJszQOndFuu7X55L0f8onIu967meyAt9CHoug67HFK0=;
 b=lReySQEtq46sZ5x3rv12eej97GzlzQvNumMfW1OlJa7Cs7uNp4CXh5kvQ05DHGBdGh
 QOFsOPaVBGtt3ldwFDVdTRuW2uTso8hS1SHeedIuIf6f56zbgmse13T1lEFcAd1XtrWS
 GLA3zVvj5QRwXg6I3KIad742N0jqvyOqkpfpbzb15qtT5btziRSCXRck+m9fIEDvkUzK
 48gvVchfxus3qTKHk5OtGQg5PV3J484JjjEDBzRtaT2S07tpBQZYvPyQMju5DHdb2aBM
 4HIWBY8xcZ75E7Q+AwIDtq2cayrtwdO1bmvtNysk18hbESoW2mu/T/KUpPbTbSlfwhd9
 wQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753715217; x=1754320017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJszQOndFuu7X55L0f8onIu967meyAt9CHoug67HFK0=;
 b=MjFEaUrBNQ5aYjkJ+P6AmAaa87iT5LmvkXRnlOgiGTtS2hqGhcLECGwX4nObl7+Wjx
 QRnlNojlxh8yF0Dk+tVyPxRUynHc6C1Y7hfPeq6DokU4YIVeOGeyMwd+D8RJRyrAdiqd
 wMPUpCSnEXaLLwBK0kfZ+gTrF7/HM2W+eHECdT/Bh7lNlIGAMZgXE9K+n7wT5bo9HiJ/
 EbLUvH/zZOqvlsLM223gESwj/GYHoNpEBOhorp/kXmkewVPDG5BvpM9sLVk0hrIl1nuC
 KeZAeKOAM39NcgUemvnRhrZKtfaqX5fKYYbG4clgY6vqU1dGPI87AIc5WL0zkLxahZCx
 BQ+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdBn+Pnt5lgq67t9qd/iN+yvhE0ZNk8Od3GFqXDlMeORA6KMP9sVHHKF6cMU4g1wgzqYU6vRR@lists.freedesktop.org,
 AJvYcCWmXHLyy4dh6DDBsFv4IyFuA0KzleptXNjE7RRBO3YDp4fUEbgIhTO4qRcD4ygsTzAuYkzhuZmX5VKy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMlcOyBikvgSkmEJwxfSg0Ph9evmvRLg6IRZWBsc2eZR0F2J8T
 H3w5tFBO34ffTT9/uIT3FLfNlsnWi+ky9vKjfc9iocKeN4kzkLlnxeOMoidJ2fi0bP3lJA==
X-Gm-Gg: ASbGncspnl8bWByG8+YQHs4oCT8Eo9xn/NgIQbpjdHKyEzJC6sNq3iAKBr1QIDLHFLp
 m92SJvqDuiKWwXRtd5Pwit8v720PNAVbN6M8jHMcwUbXL0wokQVHod7VkFR9L7lejWNMcHO0Qa/
 xEYar9K/I5t/gH8a2lFGV1pIHyDEUSnTqfYqfzbjyf5aRnU4dpCq+gRXcTiqUX1TC5WaBCIIDiN
 lpLbfW4pyi75zx5DyjFvlrHz1ypP1SnRUFgSIiwfdmWCf7sn+LcgmIv3rDTJ+W+FXIibi1iv6rZ
 K/m+4bQpmAClEJ50J+n8Dl50IceTbhF07In1kxo48hYUeirzHWGZIBgbkzwyNvq9otHx/LqkC9V
 JxOzoXyEqzGdMbko0rfi06ZLRk/coT48zWuQ7B/AWyAXrqsg+1k4gYxbAjo8jFqbW+2zzjwbQ39
 oalzQx3nYP2d3Z7K4XnHWUIajGwg3NmC4ybpE93GBfMQ==
X-Google-Smtp-Source: AGHT+IHTAGHnztb4WZkeLEMfCy8Eg7GH1Kw0R/ccfG9KJKsktGejCZ0Izyuxe5tETPnBfOl5dqnv1Q==
X-Received: by 2002:a05:6000:310a:b0:3b5:e2c9:fa05 with SMTP id
 ffacd0b85a97d-3b7765edebdmr8146672f8f.18.1753714907818; 
 Mon, 28 Jul 2025 08:01:47 -0700 (PDT)
Received: from hsukr3.localdomain
 (dynamic-2a02-3100-4704-2d00-fd39-2814-e22d-3359.310.pool.telefonica.de.
 [2a02:3100:4704:2d00:fd39:2814:e22d:3359])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f31fsm153973475e9.10.2025.07.28.08.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:01:46 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: sean@poorly.run, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Victor Skvortsov <Victor.Skvortsov@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Tony Yi <Tony.Yi@amd.com>,
 Mirsad Todorovac <mtodorovac69@gmail.com>,
 Sukrut Heroorkar <hsukrut3@gmail.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [RFC PATCH] Replace dev_err with drm_err
Date: Mon, 28 Jul 2025 16:58:28 +0200
Message-ID: <20250728145841.378172-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Jul 2025 15:09:48 +0000
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

Hello,

This patch converts  dev_err logging to drm_err, as recommended
in gpu/todo.rst for drivers supporting multiple DRM instances.

Before proceeding further, I'd like to confirm if this is the
right direction for amdgpu.

The below change builds successfully. I am happy to send this
as a formal patch if it's acceptable.

Thank you.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 13f0cdeb59c4..effffba39b5a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -460,7 +460,7 @@ static int amdgpu_virt_read_pf2vf_data(struct amdgpu_device *adev)
 		return -EINVAL;
 
 	if (pf2vf_info->size > 1024) {
-		dev_err(adev->dev, "invalid pf2vf message size: 0x%x\n", pf2vf_info->size);
+		drm_err(adev_to_drm(adev), "invalid pf2vf message size: 0x%x\n", pf2vf_info->size);
 		return -EINVAL;
 	}
 
@@ -471,7 +471,7 @@ static int amdgpu_virt_read_pf2vf_data(struct amdgpu_device *adev)
 			adev->virt.fw_reserve.p_pf2vf, pf2vf_info->size,
 			adev->virt.fw_reserve.checksum_key, checksum);
 		if (checksum != checkval) {
-			dev_err(adev->dev,
+			drm_err(adev_to_drm(adev),
 				"invalid pf2vf message: header checksum=0x%x calculated checksum=0x%x\n",
 				checksum, checkval);
 			return -EINVAL;
-- 
2.43.0

