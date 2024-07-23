Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B093A072
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A710E5A6;
	Tue, 23 Jul 2024 12:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eb3N4gKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4015B10E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:18:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso39675905e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737078; x=1722341878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUZldjCk6CAvoKiy4Qt4KMQRgII+urD/Fno6McOQQ7I=;
 b=Eb3N4gKyGIwKwNfrT3xjv54W01wUkdwCbJpwAUCjEL0j3aO/g+FRBEgwYhynQE7ckj
 Hm4gcoVNgmwK5J4SRv/qkha1972UbOiPXuYwvAFdKGMntmddUv/7/y92UjbJvM/XAswU
 drO7/Bexko9KK1mRnKAq68NvkoT3kHsI/IHA3zoC2C6eif3agVYKHPsiG9ymKzmXTi4Q
 GJjkjWIUo62/EayHqP5bJgwPB+lSadt63OtWyVS8gMHlEnElwMnhE52wm4SOcgCUNLcL
 jaJbwf1EbnV1bTvM3Q/GkSFa8VSUBltWGsrr3OxZ4c5i3D90n6lM1L+bKVuo+J3gmv04
 0D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737078; x=1722341878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUZldjCk6CAvoKiy4Qt4KMQRgII+urD/Fno6McOQQ7I=;
 b=ASSAMIKF+0OQ3kyNiEdYS7WUHdYkKsB0t56mxkKKNh5brFReQu3LPEqjOIB8BWjWw3
 Rt79NdxowDfJav99rffbT9ut0jZ/XAzn0X+ZMxePNZb2YwS1oi2MU8AVcpSFrfXmaawM
 Q5Aj8BmWN+RbPIY8J9WbkIt6iQ8lMT8xT1l06MxTwzZoH8pCuV8yv6DjmCsD3RfALzHb
 V6TL2XyA9hTEsKZ4/yV7V923dfoS+y95SxuWQKRVgp36tmA4Ko8dExMJ6hVy5v8QYqm6
 ynknWzwknVn5HjVC/ooe6zNp5WqhpJX9FSCiObUVQ+KCynIQUIssp9lsseL5Sm2x82hU
 S+7w==
X-Gm-Message-State: AOJu0YyDorYKH22iGhVW53Nl1jkFi/kUU9ySQHzGUqUevf237JNBu/fL
 t+fBwwdgg/WlfejIbscDwN6Le2hycPfTfxTSvgvfN/AqUgjUfTG6
X-Google-Smtp-Source: AGHT+IET571dQTjR4rt2yhVnfbGT2dxzDFbwyByZKKHoJj9VzNBjh5TZXVQMDXuMBadFevTY9uPtjA==
X-Received: by 2002:a05:600c:314b:b0:425:80d5:b8b2 with SMTP id
 5b1f17b1804b1-427dc527fc3mr56440755e9.16.1721737078286; 
 Tue, 23 Jul 2024 05:17:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/ttm: make ttm_bo_get internal
Date: Tue, 23 Jul 2024 14:17:50 +0200
Message-Id: <20240723121750.2086-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prevent drivers from using this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_internal.h | 10 ++++++++++
 include/drm/ttm/ttm_bo.h              | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
index 6a7305efd778..9d8b747a34db 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
@@ -27,6 +27,16 @@
 
 #include <drm/ttm/ttm_bo.h>
 
+/**
+ * ttm_bo_get - reference a struct ttm_buffer_object
+ *
+ * @bo: The buffer object.
+ */
+static inline void ttm_bo_get(struct ttm_buffer_object *bo)
+{
+	kref_get(&bo->kref);
+}
+
 /**
  * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
  * its refcount has already reached zero.
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 31ec7fd34eeb..8c1577d8793c 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -229,16 +229,6 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
-/**
- * ttm_bo_get - reference a struct ttm_buffer_object
- *
- * @bo: The buffer object.
- */
-static inline void ttm_bo_get(struct ttm_buffer_object *bo)
-{
-	kref_get(&bo->kref);
-}
-
 /**
  * ttm_bo_reserve:
  *
-- 
2.34.1

