Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B194E08A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 10:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B09E10E17B;
	Sun, 11 Aug 2024 08:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nn+e2kVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DCF10E137
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 16:47:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-44fffca4fb7so11744791cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723308469; x=1723913269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSrIqckjKKhZLuz7xVD/WDlvau1h+4xDYADVj4tSgBw=;
 b=nn+e2kVxTvZ5T8mog/o8F6J1+Q04VHCLzcoo1CVOf0M8EJrjnaAWTWb/nu88TfcDx3
 mVNLdpNXuGOo2fdJRwz1wYnltRYITtIK+Vgj6rCOm0d4OqiWczQA0OSxiAJ9wbHj6NON
 MOlYVt2y39OQzFTwqS6IWgYqfYNlww/c/IaaEfEzYx6aM9RDu/G/RiGIkkyqU7v/2kWO
 YsVd4grzdPblRhEki8hLREtoaGJUq5FwMbVw/oI1BET9tjzLwZrI3jo3mLXvdH7lf8Qp
 uaemXJUjRUOOHdA0LHJwbNv4Kdz4sXTB4UTmcVp+oZlReOaY+t/GkCglRXbArQEPex+9
 wyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723308469; x=1723913269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSrIqckjKKhZLuz7xVD/WDlvau1h+4xDYADVj4tSgBw=;
 b=lpK+0Mc8yVlHCB4r+oY5lziTFL+8JG2ks4r/AolpKtDIBTKgp2P8ICYkqzY0KFGjRW
 GKOIClpCf3UiO4MAQHplpLN6VHEYadwkwII3lUqamUTsTxGfXTn0zF7mm7+ctAAB0r9e
 XE9XRK/q+13Sk+9gqxppiUeTcpkV0hLSJR88tZHaMwWp5lXW6wIsApqEIpgXmJ7jAGDK
 7EjivwPw5R5Noh+2QANHfud8vOoz5b8KVjJa1MfNqq5OeJj2JJ/Bnjp75Kg7RKlHcMJs
 PqbBdy++zhaX3GJelMTbtK3yNmWKHEQLR4uV6mPx/UVwJUX+py/njzYYmy8WEQ0UIkNt
 wWSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4+9dAUUr7y1XIDrbr/QEPfpCyX2EwpaUeAPqoIa1EuQRrzSrLEW6FZ4T/ao55zOsK+HgZphJRqX6Pz2l+fkUT5zXpyoqrlNpADk2ZJb3a
X-Gm-Message-State: AOJu0YySbydKxX1Ao1yGWRl7u/dGHu7x+3Y7UcSwT9zZzRxiWmyOjWsg
 sf0RKkLV0fdi8wN+cCs7uOhJPmZMEIHEw1wuqyj0H7BGsEs74r6k
X-Google-Smtp-Source: AGHT+IFz2Jshgrpl5KOEjXozayq/D+WVuWsjHGFvNc9h56XVAzz8cP2NFCkykpIgeToGOCoLvQrejA==
X-Received: by 2002:a05:622a:2446:b0:446:5d60:5cff with SMTP id
 d75a77b69052e-45312517759mr64685411cf.10.1723308469335; 
 Sat, 10 Aug 2024 09:47:49 -0700 (PDT)
Received: from archlinux.cogeco.local ([2001:1970:55e8:2e00::a73f])
 by smtp.googlemail.com with ESMTPSA id
 d75a77b69052e-4531c291a06sm7722471cf.85.2024.08.10.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 09:47:49 -0700 (PDT)
From: Dennis Lam <dennis.lamerice@gmail.com>
To: christian.koenig@amd.com, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Dennis Lam <dennis.lamerice@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs:mm: Fixed typos/spelling mistakes in drm translation
 table manager documentation
Date: Sat, 10 Aug 2024 12:45:20 -0400
Message-ID: <20240810164637.39436-1-dennis.lamerice@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <dennis.lamerice@gmail.com>
References: <dennis.lamerice@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Aug 2024 08:34:58 +0000
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

---
Spelling errors fixed: successe, inistilize, and ddestroy.

 drivers/gpu/drm/ttm/ttm_pool.c     | 2 +-
 drivers/gpu/drm/ttm/ttm_resource.c | 2 +-
 include/drm/ttm/ttm_device.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..b6bad150aab6 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -423,7 +423,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
  * Fill the ttm_tt object with pages and also make sure to DMA map them when
  * necessary.
  *
- * Returns: 0 on successe, negative error code otherwise.
+ * Returns: 0 on success, negative error code otherwise.
  */
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		   struct ttm_operation_ctx *ctx)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..ec76151bc070 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -174,7 +174,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
  * ttm_resource_init - resource object constructure
  * @bo: buffer object this resources is allocated for
  * @place: placement of the resource
- * @res: the resource object to inistilize
+ * @res: the resource object to initialize
  *
  * Initialize a new resource object. Counterpart of ttm_resource_fini().
  */
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..3e8f7f74f7b6 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -247,7 +247,7 @@ struct ttm_device {
 	struct ttm_pool pool;
 
 	/**
-	 * @lru_lock: Protection for the per manager LRU and ddestroy lists.
+	 * @lru_lock: Protection for the per manager LRU and destroy lists.
 	 */
 	spinlock_t lru_lock;
 
-- 
2.46.0

