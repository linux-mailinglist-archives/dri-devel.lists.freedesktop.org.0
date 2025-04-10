Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E4A84988
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AA910EA04;
	Thu, 10 Apr 2025 16:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nBUdxBcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C3110EA0E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:26:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso7941425e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744302360; x=1744907160; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
 b=nBUdxBcOUXWckLyX8jw2qn66VuxrxwpXrWKJU8AVhEzIJW3+QxVu/AGgnwP3wns/LH
 VO31gs5GLEL7ErIx06VzOgXRUFkFuZs65iriCYP1YojQ11Wy2XoWLu/qk2p5TL7AibhY
 p8U/cy+7wZM+7+qcK7w437AZSrI9WBZ7jHjWqQgMm6uj1/dkL3J2csnyU3X4hinYOczr
 7CDh3VzKCjLk3LL8pWW17zdtgLfWpV1lqHaJ+Ja1ZqwG7/GZ9orDqJpDJwTUQ1nn6iRw
 5oGfxW9IMigXE24MYu7+e7wxhh68vxHs//65xw4gewEEXCcMqZrU2noDPP9Urn+RG4HW
 2hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744302360; x=1744907160;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
 b=etq8tKLWF+Aekur15i/3RmyvysiLdiCUFgLLlQITWKTiLQJm1F23WCsNvHKkEvCkbc
 BdsYwwXwThFhOV+tzgblbMmmq8fHyZ2cRK0jUtoO2b/V6SpwV721Tq5UFFG7Bw0HHG4L
 NHtkvnP93tUMcOGFzGfxB1TGwMYh7+rViWbUhw3WZTOphbwYon5aeRA1Y/kUVSWlE8is
 /L6uLoEMnLdTIT2HWPcw4J3RDfdFVUKXgxUIh/HHeVwUxJzLLlYtnWzZ79zaAHzwBcgQ
 24TWIPKtKBP0VZ1FhVO05Qs23j8y7b9q38dK9eDOwBDDnyKcW8koBhG7q7HLTvP6yIeX
 EmBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXobbevXfAJc+2ML+972Zyl3E3QdZ3Rp5X02Kfyoh31FHMhv2Zydp+VzARwcaVztPeLrjGP0+RWwM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzfA5Q5cF9uxtWdDnv4C/AnFh+Y8atDTgrwyFncyKAHMh6QR1y
 3T3FPLKju4gMMRXe02LJkNrFXvXZdzjsTi7qeKsWkx0UWf2dbTdVvCmNdiQXNsA=
X-Gm-Gg: ASbGncvZJOFSLS2lvQ8zklJM2u1g2B+FviWeQ9No0cQHRwANmWx+HQrtInAULV7T43e
 U0FTpeLa9CR5eDa8/Lb4NrEjWLaqDabHclOr1itui0tdK/q8KZDNZxMSI+Vu6Xb1k+hL0/kING9
 k0PwTJngTK+E5hYigZ/v/NrzNgZEttwOearh8g9BFP3WYQdhTZsxAUOjR/L7TTZcZxbyB03A84K
 AY4FEFHpDG//CawDlU47qHh08hjRvWVdXjD8lXpz/++d45yGW8DbSXegb1KJSbXxZVi7stL5tTg
 W+Nx9F84pfEgvOhugiEXswsI2RDcreGROvT5mzT4zLeX3Q==
X-Google-Smtp-Source: AGHT+IHlDUACoR6HuZ5lIjnATvfRIBZPmJdAtBlTqtWbFzHfLPmS+68O7mhgc9NM65uSvBvM+8cTrw==
X-Received: by 2002:a05:600c:19d0:b0:43e:afca:808f with SMTP id
 5b1f17b1804b1-43f2ffa2ee7mr34541075e9.31.1744302360514; 
 Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39d893773c1sm5166880f8f.24.2025.04.10.09.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:25:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/syncobj: Fix leak in
 drm_syncobj_import_sync_file_fence()
Message-ID: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
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

We need to cleanup if the chain = dma_fence_chain_alloc() allocation
fails.  Now that we have multiple error returns in this function, switch
to using an unwind ladder for cleanup.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..c136d0c772dc 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -745,21 +745,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret;
 
 	if (!fence)
 		return -EINVAL;
 
 	syncobj = drm_syncobj_find(file_private, handle);
 	if (!syncobj) {
-		dma_fence_put(fence);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto err_put_fence;
 	}
 
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto err_put_syncobj;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
@@ -769,6 +772,13 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
 	return 0;
+
+err_put_syncobj:
+	drm_syncobj_put(syncobj);
+err_put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-- 
2.47.2

