Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FAEA8497E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84110E9D8;
	Thu, 10 Apr 2025 16:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WPBIV2xY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF410EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:24:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so563090f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744302294; x=1744907094; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
 b=WPBIV2xYzXx2f1YnKFJWHS1hfjhzZukFalWUFE7oyKohHg8GdFngV1eeYRuPOjDtiF
 iV6cwuEbX+rvwB8hGRxwGstVvtEtTngWfdK9QJsIIfzc0PJRMpi+vBnBxfDwvTmMkXYn
 v1DIXqeZUuyW2htKu29edUJ8u4VUsXFwop6Sh+kakw0BAx3Qkoze5rspb+r7BF7cbNJt
 qefgL3VeHhNh3ylyMw+OWm18FuPg8zncDaqfIazYFEkdF9Gg9+2U+UuqQEKYlRo4bjSm
 vEq8qXAKCmMHk+fA8UVnbtlnoKFOvoMakFEOu/FtWLejzvCAp5Go1gGSkqTzNl2aGrtz
 jPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744302294; x=1744907094;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
 b=XeOtIzBXwaW5bViOnHEf9kcL0Mk9c2jPi0e34nJ9wg7hXs+ez1ffOSThDBXF2O/HI2
 zY6/NsWVTjGYMnQilXw13ECI40oKvYS1KBoDnAtMdIeDqfTQf6+AWkcOVAe9wPHuudg1
 PwV74fQPJSQLa92/InzUI7YlXpVkK3u/m3BTRFhfF+LRDlyq3nDqlNsup/BUhP0WJVVW
 seSeh1pb64LN1XrV0qyvC1TXkJecofpgluAU+j5uHtIQjW7+FihyhFlwxJC51/i57azw
 +whfS8ketnA1VCx0lZZPRbFKnMCpDiNtHK0aOB7LXjCFOQD3ZUl/R/Xp4JvUwQAJ6M97
 /WAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpE2/oOvJKJn7WTpohgbqhlPYxxp+ycLTyaxX4kuTJ/69mLrtS5xY05/eCPNc2SHOb+DMWXzir+gw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF3wVdQnkB5us/yGiEwl0pqRbHYPhrwyprxsXAE4XX6PtfZZNU
 giHWSl3BHzE7UJz+7SNJnPDP87d+hw4PXfTZ7wTVMe4XV4k9SldlxQVER4Log3s=
X-Gm-Gg: ASbGnctI64pGC0qPEPo3QPnmkKv8Go3zcFktsmjVvQK0W6X5xyEVOzXcweTSl+WkUmY
 ybOpbVyFbSJZHsHRENTuz4ZgF+lym80OM2VEzbb+hNZoa7tbOZZiCnNKOFU6WtZlaFWfHT4YH9I
 SyGnlK6PD81BzlaMzxHS3MF61ZrnhXC7iN/uGPN0BNtf0Or/5QFgyk8nla4cgjX40S4MdHaF59M
 ydTOqpIf35Taosokf72HFLw4ctCjzhxMzect2t1SQyLfu0ch8BEp4HQdd2Xw5X6eQCAnIBTewk0
 UPyJTrpyHQTG4z/GKMOMfbIByz1fUw5FUly28DohMbxuwg==
X-Google-Smtp-Source: AGHT+IE5gbRW9QyJ582gnS5/K6En7dv4OcdtzrH6WqFi8GhS+S5YHvq23DQaLTjIP0Syy2HVbmP5YA==
X-Received: by 2002:a05:6000:1785:b0:39c:dfa:e1bb with SMTP id
 ffacd0b85a97d-39d8f4dcf9amr2828748f8f.42.1744302293770; 
 Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39d89402a08sm5153257f8f.100.2025.04.10.09.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:24:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
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

The goto frees "fence_drv" so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a4953d668972..b012fece91e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
 			       &fence_drv->cpu_addr);
-	if (r) {
-		kfree(fence_drv);
-		r = -ENOMEM;
-		goto free_seq64;
-	}
+	if (r)
+		goto free_fence_drv;
 
 	memset(fence_drv->cpu_addr, 0, sizeof(u64));
 
-- 
2.47.2

