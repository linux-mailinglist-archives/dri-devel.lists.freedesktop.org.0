Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE5A59197
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C0710E3F5;
	Mon, 10 Mar 2025 10:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gAY+69F4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14A710E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:47:20 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so3367491f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603639; x=1742208439; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S/usSyZvOMqcO02UgIaZS38RjkJHQ2qzt+JqdGQEbLM=;
 b=gAY+69F4DL7VigeqCE0RN9F5kkDVPH7KAcFkfJ6DQMNowERtbW8Vdp5+C2uBSnznB/
 +8ycTUa5Kz7Kkr7n4be9FlEvUElDVZlBppLiKgK+agTRZiyYfpbu80QAE03MAx5tBYno
 cnKFUIMhqieq1nftzHfis92JZzAuGe6YA3EezwfBoTsZMDTVmx/DFY/06T0KgrO/x5PO
 lIYM2tclfykGd7SgLNLCMSzrOWpC2h/v5IQ5zBLa0dd9GCw0slZ8KtedRRZklwGn327e
 9AZvrvGg3W8gedyoEeQPIBLrKUXj3enNVKnulVeblVWDlsmgK0tNfv41b1hZdiwKeZVg
 UdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603639; x=1742208439;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/usSyZvOMqcO02UgIaZS38RjkJHQ2qzt+JqdGQEbLM=;
 b=C84jUfUqmoeKQm57FFCJvir34mabtaC8Zr4xzNuZv4YaBvOu3yMCiqE7nPqEBck0zf
 a2ETsBuXkNMbMAUpv/IKlQwjov1VKaxf8hMAYSsCl2qhxN6HLaao+MrgWz2S/wN8bc2U
 lic5QfmIptcPZ7sOZSNhY9zpRHbI6+awSqhF8q/uKnSA0qOcVBCXsVqtzRoxsjc3As19
 C+67wA/0qCHPth2TktX4BbknAc+mbb2s6x28BWaPyeB8rzUOPnTRj5uGUVRPu2PqbbO7
 8jKKhgey77cZnXyByW3bb7k/MVSaeq01IOp/JQRChW9RQZU1YOjjg/9Lc1um4E1TgZU+
 Igxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdeiXMx+Npni4aDFT0hek3WYDRhP1W9LQP+TvitScbupd2sz5cZtZuX2cKEZcm5TqxYv3ZKkeUaA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjk4+MfPKMn0N8D0w4iVsbKc5GW48Cr1fTwYI4q1yDf7h7cQ1/
 3f5VwM3D4kSvFXqfqivsXkMsmOFZRvc5EHI+WJVlrT7c7I6y9xVCspJN63yixw4=
X-Gm-Gg: ASbGnct5cY26WWg9fLFsM0ryVO3cVKMTKt/+y5Jna743XRzR5JbnM7lKsD96i+/XfvQ
 6cOPIhwMmo5ldqs9PgSShYoj6brJK18pkzmeNkm25/oO/K7GYm9rcrGuGFTi+s23+Gwxncn78E5
 hRu3IFvahgFVxDrrlZSawyOP045f+eTK1vtmUi9TdwlIBqHMtDlz+TRZm1AGwc6x/p9jAwF5uUU
 iRtR63S3s6G+UhNZtVtSHjmStEI/c0lXntUOCBdP/ezQ+a0HhkPPu6T0TQY/MxOExs571BXqLtP
 13su1XiXFu3agJCA2feTOBTf5xNszqYYHoG7earcyE52CrJ7c9gTBVe2erW6
X-Google-Smtp-Source: AGHT+IG0DRVFzL2VYuk4+0xwXKcyqK/IIpus26os/g6Pm2aV01RIKQYEWia+Sq3ARp2iOSgT/MR1WQ==
X-Received: by 2002:a05:6000:4105:b0:391:41c9:7a8d with SMTP id
 ffacd0b85a97d-39141c97c1bmr2940385f8f.54.1741603638928; 
 Mon, 10 Mar 2025 03:47:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0195casm14715253f8f.53.2025.03.10.03.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:47:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tim Huang <tim.huang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Le Ma <le.ma@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Use tabs for indenting in
 amdgpu_sdma_reset_engine()
Message-ID: <2503b45f-751e-4b50-96fd-8dad33821c40@stanley.mountain>
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

This line has a seven space indent instead of a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 39669f8788a7..3a4cef896018 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -621,5 +621,5 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *adev, uint32_t instance_id, b
 	if (suspend_user_queues)
 		amdgpu_amdkfd_resume(adev, false);
 
-       return ret;
+	return ret;
 }
-- 
2.47.2

