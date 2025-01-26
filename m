Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE7A1C8B4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B6310E383;
	Sun, 26 Jan 2025 14:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.b="Q+oRiPo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1295389364
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 09:33:03 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso6181950a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 01:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1737883983; x=1738488783;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vb1mFO06Fp5J7u5+sDtga+BgWpigWXQ6nR/UywDM244=;
 b=Q+oRiPo5WshQzM3w6QccvKKp7uLsz1WL7BHu1AAcwSOAyziQh5Fp5hdQbawOzAoou+
 Uo4OGBorp3VCrn8leT8OoXqEDlaYv38EUj0RKGcQ7aZOd2m24jMn7YNy5g/Iyk00OCmO
 0JIxZp02R47fmNCIyVtikL+5ByaU3hLM1E2xSE308/2MzaTHw0HWRPlxHw9w+3PFGiet
 /etR42n4uVLp1C0vGu7cEOsNhSdRQjU1ToBuBGV5hOXkKZCQhZoet0LfLwDT3BXf2lfz
 u+LDyh1WlmWoslDfFVhIlipl/3FuyvmAnYqF6ggb3IFhCLMPri/y1blnqeClqX9aMKdI
 s9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737883983; x=1738488783;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vb1mFO06Fp5J7u5+sDtga+BgWpigWXQ6nR/UywDM244=;
 b=k9rzVkpmJFD0nKZM4cNzelBTX2YyErm4PSu9t+AjikLTDc8KkCutv3FBtO64VvYW35
 kKM/49L9M6BPJFNRVYxIiT/r8TXBynvGo5sGzNG/MCq7ga0liFU3m4FMQ33G5R5RX4Yk
 MWuPbbh3OAcXdwJsWNLpYRQwNf9HG7lzONFRO11MLYbYeL2vfHqY3kn7MGXOVhIF9TKO
 OpVyjwUJZ03iN2NoG2TlueqMys8oRAkGMYAQoyQ1uqaNV6fTFMYx2bCl+5HczvE1+EgR
 HIXG7J3sauENY7rJnvjSFGiFmCclguDTVgqCiHH+55XKhBOjJwbxPya4ltyRW04Zwoo7
 VEEQ==
X-Gm-Message-State: AOJu0YwPy9Yh8/8Eih+myil5SA6l/8A4CiI2xc73pJTB3HAqIvzEbdtL
 J+KP5F2OEJ7hgxkXYW+NnVPD18jQwN/T/hTJQZMRmaDVOb0DxxknwPMBdy1cqOU=
X-Gm-Gg: ASbGnctwv93MKw76+T0bASAQpEJ1vr8SXH8mOTq6UgtxF2tqe/byUSaeUiBhJw+WwxE
 ZpP3fw2XMShUpu2MOi0gloxB22qJlISG0u5doDtP8e8JxchA5HHntzjVfSpRsr4ghrNBjJfF65a
 Gqk+ZLXTmLvqUN5nKcMWNmqo9q6sINMy/a3BBEn2zyl66XSi6LGTc17NXDKoMJJbzCh7MjWqQTx
 7teltdSGNFQV4UJ01vj8RrsJvvlxCsuMet3NkV1wbcqKx3HaTHIdaQ7wZ305KNEX7lPXN/RmFHe
 GMN6Pi5nvd/nLq5H
X-Google-Smtp-Source: AGHT+IETqSTdsrEKC3E5A6snESLR+5atJTMds0J4jTsDRBV9zfXa9/kpzMOWIdyPy6bUYM9RXTHCFg==
X-Received: by 2002:a05:6a00:4fd3:b0:728:e1e3:3d88 with SMTP id
 d2e1a72fcca58-72daf9bec6amr53444587b3a.7.1737883983310; 
 Sun, 26 Jan 2025 01:33:03 -0800 (PST)
Received: from bytedance ([61.213.176.10]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b3f86sm5123548b3a.67.2025.01.26.01.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 01:33:02 -0800 (PST)
Date: Sun, 26 Jan 2025 17:32:56 +0800
From: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
To: christian.koenig@amd.com, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ttm: use ttm_resource_unevictable() to replace pin_count
 and swapped
Message-ID: <20250126093256.GA688734@bytedance>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

TTM always uses pin_count and ttm_resource_is_swapped() together to
determine whether a BO is unevictable.
Now use ttm_resource_unevictable() to replace them.

Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index cc29bbf3eabb..a8f9f7ed6c6e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -252,11 +252,16 @@ static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_
 	return ttm_tt_is_swapped(bo->ttm);
 }
 
+static bool ttm_resource_unevictable(struct ttm_resource *res, struct ttm_buffer_object *bo)
+{
+	return bo->pin_count || ttm_resource_is_swapped(res, bo);
+}
+
 /* Add the resource to a bulk move if the BO is configured for it */
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
+	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
 		ttm_lru_bulk_move_add(bo->bulk_move, res);
 }
 
@@ -264,7 +269,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
 void ttm_resource_del_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
+	if (bo->bulk_move && !ttm_resource_unevictable(res, bo))
 		ttm_lru_bulk_move_del(bo->bulk_move, res);
 }
 
@@ -276,10 +281,10 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
-	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
+	if (ttm_resource_unevictable(res, bo)) {
 		list_move_tail(&res->lru.link, &bdev->unevictable);
 
-	} else	if (bo->bulk_move) {
+	} else if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
 			ttm_lru_bulk_move_pos(bo->bulk_move, res);
 
@@ -318,7 +323,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
+	if (ttm_resource_unevictable(res, bo))
 		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
 	else
 		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
-- 
2.25.1

