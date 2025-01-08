Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE0A05753
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEB310E82E;
	Wed,  8 Jan 2025 09:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVXGJ8aF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9F10E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:50:02 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so12811427f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 01:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736329741; x=1736934541; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
 b=sVXGJ8aFpI90842DSBhoeUe9TjmVc+3kl58/ZrYf03FHG+xBUGsUBL21Y9dM5snaUn
 5HDqLjjsqOiDhJArbHPdEm+4oG1ELEiW70VWW1F9jTe0vCTmHN96Ktf/2f4/IHK1XH2C
 PQaChwf7QYaWRqailUXscXXp+PsNDtmFPc491vm6wGtvSMXnvAtsRRyqUgDuZckstR1G
 sKZKGMn0UDBVDPoKqg5y/qAsBWrwSEfSaog11u9DCnSEl4/ekqMH0r7Bj3rTa1diWGV4
 TNAg1vKmqAv+TyEFnLxFoftuNzplQE2lZG9bdSBjkhq8GlP2Da/6ni6MNxCc8RUHNayu
 NP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736329741; x=1736934541;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
 b=V225zhmK+Ha98NEPCBYJHW/y864Zv3VftPTuLPH3VYKVXbbUGqUhLBH4l9gZAAD/z3
 XbN+j3jArsytSnX3WeIFrKh5QuBQcW30NMG1fNaQX03StFOO/Oun47noQ1xXehdiJqSX
 nlm0uCOsr79ahtd+gpHiBTzVkBXe5DZjTHfeqnynSIzA4+IpAhVPtpZCzx2xMzn3hWcM
 f/t63u6nIImMFPmQdYcpVgHsIcruNw3J9jCME6ttUFw2QHpG2AYho4Zk8LzvbaQqS0fU
 gcjyrLYrdvLaqgNUWAgFSBTfG3EuP/4lKh4CRlcmmaebENxPANFnBTzQjCYaiadY++xa
 Jg7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bkUIjr9X7Zd5nhe5pgSTZZGqFfo43ml2N2w9v2l8l+3QTupQY0xLBxUe2x6Fs3bGzEmUxFM8DuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV/ZzhvbRtCTe/bODpI75kXbmaFzoP7TAeV+NXbdzilmU/S0bT
 WD8ed7XQEODG20XaSAw20EMwoDxXO4r2dpo0qruEs2CoZA+OxtstSGdqQ2nY5VYEQSt/HwCPhM1
 n
X-Gm-Gg: ASbGncu5htpKPX/PnqJa0Yb6R9HDLD7l/lnVCkM+TELIhv4SfIiD9vu/6+l2n9VFv3q
 s5xi/scl3J6BrZPBdjJujiLRzO997T8g1NuSVBcJkUMaw0E2l0Ta3oADJsYAZ648YjJehqQq37k
 20qZqJvPg8hbhvY2gMTINVlTCNU00nBL7K59YtuQt2YlvYv1I1oB7QKkt7O+0pk7Z3/u1OdNzez
 Vzw36R/zc5yieNrVnX6rRyMN40cg5NuXltzylOCkf6are1APzY5odOJMIIkDA==
X-Google-Smtp-Source: AGHT+IHkhtjxU/+Fjus/E3cnU1FkrZVIFQ90dsX1DLhvXda8HEgNw6w3TvBh5/m1vuuiaw6SkOOZIQ==
X-Received: by 2002:a05:6000:490e:b0:385:ef39:6cf7 with SMTP id
 ffacd0b85a97d-38a872ec3c7mr1392758f8f.32.1736329291503; 
 Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2c27b54sm14879005e9.0.2025.01.08.01.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Date: Wed, 8 Jan 2025 12:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>, "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix shift type in
 amdgpu_debugfs_sdma_sched_mask_set()
Message-ID: <d39a9325-87a4-4543-b6ec-1c61fca3a6fc@stanley.mountain>
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

The "mask" and "val" variables are type u64.  The problem is that the
BIT() macros are type unsigned long which is just 32 bits on 32bit
systems.

It's unlikely that people will be using this driver on 32bit kernels
and even if they did we only use the lower AMDGPU_MAX_SDMA_INSTANCES (16)
bits.  So this bug does not affect anything in real life.

Still, for correctness sake, u64 bit masks should use BIT_ULL().

Fixes: d2e3961ae371 ("drm/amdgpu: add amdgpu_sdma_sched_mask debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 632295bf3875..174badca27e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -362,13 +362,13 @@ static int amdgpu_debugfs_sdma_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << adev->sdma.num_instances) - 1;
+	mask = BIT_ULL(adev->sdma.num_instances) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
 	for (i = 0; i < adev->sdma.num_instances; ++i) {
 		ring = &adev->sdma.instance[i].ring;
-		if (val & (1 << i))
+		if (val & BIT_ULL(i))
 			ring->sched.ready = true;
 		else
 			ring->sched.ready = false;
-- 
2.45.2

