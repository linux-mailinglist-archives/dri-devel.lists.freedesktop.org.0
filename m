Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCE9990A0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 20:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D3B10E0FD;
	Thu, 10 Oct 2024 18:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zEk7NgH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C5C10E129
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:35:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4305724c12eso9311525e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728585341; x=1729190141; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iy+C4p8CaCgRadOFK5HsELQcw6dO91MMQyaigcmnelk=;
 b=zEk7NgH2OkMOUAEJNhUngIiUwYUtkbPlimKqXxAj10iKaj+6HoXUoGjkYVMjdCf3iO
 1Ueq/iXflFluM4HwcuPunMYn00Rf5hx1RpJIgVlL7qf+RqSqKMMrtYb9Wd783Q0mHtlm
 2f3CwIv2olJ3vJBVO1YJjq5FG9RW+7qwJTUSXYmYsLgncO8JMqiZHlDt1r9OA5vj9bOm
 XcWjHzudQQ5s9HtuBLNx2dE9UJgZxyAi4zGj78IaFXM6BgJBNKWEu3QM6n8E1eJer08O
 VHg0gVqGc6DSQ44IQm96Ukv8rKU0KaRRU2NzqCG9PS92kMAVrHoj+hP4X26qtQ+C3f8i
 ogKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728585341; x=1729190141;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iy+C4p8CaCgRadOFK5HsELQcw6dO91MMQyaigcmnelk=;
 b=OGRY9JwE14ht0y4MeXzqaTY0cdEg0x22UjGNfXt336Hi4hspXkvOPb+KLvtDYhfhHS
 ojq0DKgXx/mJMMtscHr5JfiPNTbE9a/XwprUcF2Ntn6HYcZy6QeXB2OapyrefpWADoM5
 FnHWQwkHcB7e48ybW+lQmroiNbTPL+lsHUYiAbmPA1QRzRceXgxa6yDiH9/YzWJ4WYA2
 LADZvrpwPSpvwLVSm+NTkk/iSzchUdFz0RbuiDEsRdqAxz0DO0TiFWJlw1xyNv5NmLqo
 ricMK8zhxss1J2/OsdENOvrLtuK8t8wNiwXG4QjhkCA+DDWUUWkQDDkQ+gAdHsnSFEfA
 hSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUch7ctMT82kJ45ud6ugncZGjZinpNMQsMa8LUhNbcmkDAii0wSRDuVn04qenCYwHCIWV3nsEmGRBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7bnBW4rxNWWxxEGo8xDhnMLS9giUrWWZE3xZaAwZaB7Ee79pQ
 s9oZOKv327g6/OZs5cNY2ud7u4A1qm9RlAAoEwZIqCU4XFIgfo3wifcO6Cv+tNI=
X-Google-Smtp-Source: AGHT+IEG5XeqWq0+eyA+3/83jP6vMylO+zmJtnB5SbNtZ56GnxMRoNYSys5K69hCWruqjJKATBUPqg==
X-Received: by 2002:a05:600c:3b9b:b0:430:5846:7582 with SMTP id
 5b1f17b1804b1-430ccf1b335mr57690205e9.7.1728585340737; 
 Thu, 10 Oct 2024 11:35:40 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43118305ab8sm22967065e9.21.2024.10.10.11.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 11:35:40 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:35:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix off by one in
 current_memory_partition_show()
Message-ID: <f3cf409f-2b04-444f-88f0-9b4cfe290667@stanley.mountain>
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

The >= ARRAY_SIZE() should be > ARRAY_SIZE() to prevent an out of
bounds read.

Fixes: 012be6f22c01 ("drm/amdgpu: Add sysfs interfaces for NPS mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index ddf716d27f3a..75c9291ac3eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -1199,7 +1199,7 @@ static ssize_t current_memory_partition_show(
 	enum amdgpu_memory_partition mode;
 
 	mode = adev->gmc.gmc_funcs->query_mem_partition_mode(adev);
-	if ((mode > ARRAY_SIZE(nps_desc)) ||
+	if ((mode >= ARRAY_SIZE(nps_desc)) ||
 	    (BIT(mode) & AMDGPU_ALL_NPS_MASK) != BIT(mode))
 		return sysfs_emit(buf, "UNKNOWN\n");
 
-- 
2.45.2

