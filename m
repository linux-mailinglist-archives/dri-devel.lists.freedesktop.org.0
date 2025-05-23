Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33263AC273A
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7930710E0A3;
	Fri, 23 May 2025 16:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WDb17eO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A50E10E835
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:09:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so75397765e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016596; x=1748621396; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
 b=WDb17eO2UAOHGn9rBt0BFt6MQBHefcEzrQIkaClD/jU3n6DNWKype+/9/m/wM4cMol
 o/lRQ4HmzKh6q7B8tYsZ50RLwyPUeXG9yDjpx16x2sFKLQj8tUhlIjvt4EgVa8L0eRnp
 GqEKCMEhhGokBYf1YVhqGkEptjroPN07PkpJXEQu8yX8w45OprTzfu25VoyamLQCuTpY
 PvzMBV6blgosC+/AAusdnn1l2UZK35p0TO0+7PXIzUA+u2A+npzL7vhlk9hAr8oV2drX
 Wv2YS7eOwfdSxCUSTPNbDdbTOKVjAjKI+UJr6SeCssj6SfQEZx4/AAShJKQyw0D/dOtq
 evgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016596; x=1748621396;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
 b=a/vGTrkgUgBgkSKQ8WFFvhvVvDZy1STolpexc9MzayHVWoRVD21wha99QQvs+x+20b
 batqwhdA+ib1n9xNmtOcTN6TT5Qlc4d0gV3EAmgVW3vhoPv7bInIGkXuqyb6wymTGd/u
 1g0B4QMMUmd7TXNcyLnk40jS+EQCbz5ahRBIwfk2OdpY5BIGtX7e4iJOV+SL74CxYDtx
 1jYeyM8KI9d/U7fCa21idNzUHVj5JBqkQah35NghLy/L9dwv4K2tb7qF8hDmgMVkG+W4
 nbDoaS/bdBFxvS6rl3AGdeLMEUvuTn2hduRm067SPsBEE5WRMM/q9VFqB8vv0nUCSG/7
 u2zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ7RlMmUIQ+XkXf45XK2JiNVhZpcykE9FsrEx+3+Xp800DpGh5Ykn7xxG5ivwYcb0Ri8BY3jOoszk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3CzOrmA9/87FixfcxwD6GPNEN/HZipEEwcvIjkXwmry6yJSPD
 N2DjZX6BDrNk+ohhzvwMAgsPzd0dY3+6Hhx8G54O18QBfWzwMOvJ0tZo5lZEjaahqrk=
X-Gm-Gg: ASbGncv18nz0H+qlOimeq4UHbpDl5beSTDtmDpc8NaHL34bNJs3vU0Fe9Wc2ayZwbcm
 742nQlG4glLvRLJ3FwsEU37YQ1UonqvVhsSNac7qbT5c5m6dRd2pQbuEhgoRGL7jqKZqxWt8yOl
 PBP891OOMrUpWbglyC3HQ7m/6qcTGB0zGXYh7ayVCuxD2XCB1uROTVh9LZ+b1CbHxCQhZiQD9iQ
 od+sgAzZ4/RNdIx9F4npGAtTpGjEf2JUd8FVbyJMWZIPIZ+sGH7IZTIk2KEvh38txHnkoTAOJGO
 NjKkepW5HdVQb1nCf/cOhMpwrWLMLZ0VynxqfksI7rEytub2KL2JGw+cuPFzztLis/Y=
X-Google-Smtp-Source: AGHT+IGqMESqzvP/96nvyjOYKe0RppaRLZiQpOwJY6/fZFSF8xVdTA+Yk7GHTTmFzbVLBQ3RWhPt3Q==
X-Received: by 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-442fefdad81mr267539755e9.1.1748016596132; 
 Fri, 23 May 2025 09:09:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f78aeb8csm144108785e9.28.2025.05.23.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:09:55 -0700 (PDT)
Date: Fri, 23 May 2025 19:09:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arvind Yadav <arvind.yadav@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
 Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix integer overflow in
 amdgpu_gem_add_input_fence()
Message-ID: <aDCd0MrLste5b2HM@stanley.mountain>
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

The "num_syncobj_handles" is a u32 value that comes from the user via the
ioctl.  On 32bit systems the "sizeof(uint32_t) * num_syncobj_handles"
multiplication can have an integer overflow.  Use size_mul() to fix that.

Fixes: 38c67ec9aa4b ("drm/amdgpu: Add input fence to sync bo map/unmap")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 2c68118fe9fd..0ecc88df7208 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -58,7 +58,7 @@ amdgpu_gem_add_input_fence(struct drm_file *filp,
 		return 0;
 
 	syncobj_handles = memdup_user(u64_to_user_ptr(syncobj_handles_array),
-				      sizeof(uint32_t) * num_syncobj_handles);
+				      size_mul(sizeof(uint32_t), num_syncobj_handles));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
-- 
2.47.2

