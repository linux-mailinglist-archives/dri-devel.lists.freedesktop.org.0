Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B536CACDC95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D710E00B;
	Wed,  4 Jun 2025 11:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JKxJV0Rb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDAD10E68F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:32:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so32730525e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749036756; x=1749641556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=lAOABtGlF2dhtUgyjHo7qrVTWx8c+ZxqnYgFTHjRius=;
 b=JKxJV0RbPVCLxwXR0gRmsp8gmNyMGVtxV2LswnodlP0y5xJArhpxPM3v9MZlexNR4U
 JNqr1NuT6Q3gzySA2AsbVgHOdVy4neHJsGtXeRVHcX5Jwd1qnbI5FE+aEvFBYUzpoLFl
 PtfdD8VS78Bzr3tj+Y2s6gL7Nyls82aYo00tvdtxwS1AnWaIYHIG/1wgIV93JqJ4tSVy
 nQbW2slsAQ+Sw2xQEJzhd1PHDK95EHxRAoghvVibemCI2n2Cuz6WvxL31mz0lHiWne+B
 v9pTdA0F4aukJ8xoehZj4V7d0HWx88QmlOSqHOXZyyeX0QRgGJGrcC7NMZSfWNwX7UZ1
 z8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749036756; x=1749641556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAOABtGlF2dhtUgyjHo7qrVTWx8c+ZxqnYgFTHjRius=;
 b=cweRXx5Kzvm2epTdFcbCrqW2rQUazmbaCwA6veb0IZzh7s54gP7Ikl8qrjPh979pSX
 UMbws8QUbzas4n4+EKmZxyqkdOH1R0QGIGZWNb2Mb3RRDXE0vE5s3nFc4G8L896BzYLU
 9oaw7fhsnoeqUcTFoBc2iOButYUrpQPUyIM6boSFBBJSBSaIRd3Tfkx6Nl63mZq0Ion4
 4Yl6sC88Iv+dH3QGH0xdgNlcgQ6DZHtEziXTQu872kgytei0Kn7Aayf3g7FJpLsMcMzU
 XRUuMYbiuHqfgtLFsO42Bdu8vk2gFaWsg7NVpFJHfYusb3aEFEs1v5XSfDZbwcx5q3LV
 THzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtOcs0MScBLMJdHFYYRmnV5ssB1D11MuC8wT9CrHgIjS5QsGqI08fLGM7Z5rQDFnfpJsZhHLlERbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlcAZXzFEy54UCE34ThXtR1/02SMbl2VciuyZXZNuKGO24SePO
 o4jnUgVF3v6trzFJ/zcLIjX1kPsunJVQ+6N/yq+hiBu5DN2IUq/eXgkMB+LK9A==
X-Gm-Gg: ASbGnct7zhUeHh+Tl88yhegfGPtQEB2fzxHoiDqrevTGj+7kFDSZRulLoV7N7lSOL1M
 AYzC/RNncu6U8VIblyz/3G5oPgDQecxMmXpsrKQ2Mgd6Ol6zaHHiKqSR6+HHdxWYMlwV7VnwH8+
 hdbY8fAr5kEOsanRH0ZbJ9uYgsSAwq8bf328ZpRurd8vB3S0vfx//ih+obeTZAdGcUeIf+k/6y4
 HRBw2PpdbaBYI6II9NldZwPlP6b3gKQ465Cw49YBqoku6Rce5RY6HIXJWtCP5G6N2CAijMG42fu
 Yx9KYwEwZvgQegJVn7RtgK/jacMAiTnMCewo6JZJd0tnGy1F8vRNV/oA/S8ZTjFjDNpEJ7cUNBw
 =
X-Google-Smtp-Source: AGHT+IHBFyKB6jFDzXhkdJqPzSNRl6e3DDtQwRIh3tfnktC5Am59xAKSnF99Tvkp8dThRbzX8KdGrw==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-451f0a72bf1mr23160695e9.9.1749036755744; 
 Wed, 04 Jun 2025 04:32:35 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1541:ac00:3016:28e3:d8d8:81ac])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f8f1e7sm197750545e9.1.2025.06.04.04.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 04:32:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Date: Wed,  4 Jun 2025 13:32:34 +0200
Message-Id: <20250604113234.2520-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

This was added by Sima +10 years ago as a solution to avoid exporting
multiple dma-bufs for the same GEM object. I tried to remove it before,
but wasn't 100% sure about all the side effects.

Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
it obvious that this is a superflous step. We try to look up the DMA-buf
by handle handle and if that fails for some reason (must likely because
the handle is a duplicate) the code just use the DMA-buf from the GEM
object.

Just using the DMA-buf from the GEM object in the first place has the
same effect as far as I can see.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c      |  2 +-
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
 3 files changed, 10 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..2eacd86e1cf9 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
-	drm_prime_remove_buf_handle(&file_priv->prime, id);
+	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
 	drm_gem_object_handle_put_unlocked(obj);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index e44f28fd81d3..504565857f4d 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 struct dma_buf *dma_buf,
 				 uint32_t handle);
 
 /* drm_managed.c */
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d828502268b8..f4facfa469db 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -90,7 +90,6 @@ struct drm_prime_member {
 	uint32_t handle;
 
 	struct rb_node dmabuf_rb;
-	struct rb_node handle_rb;
 };
 
 static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
@@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
 	rb_link_node(&member->dmabuf_rb, rb, p);
 	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
-	rb = NULL;
-	p = &prime_fpriv->handles.rb_node;
-	while (*p) {
-		struct drm_prime_member *pos;
-
-		rb = *p;
-		pos = rb_entry(rb, struct drm_prime_member, handle_rb);
-		if (handle > pos->handle)
-			p = &rb->rb_right;
-		else
-			p = &rb->rb_left;
-	}
-	rb_link_node(&member->handle_rb, rb, p);
-	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
-
 	return 0;
 }
 
-static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prime_file_private *prime_fpriv,
-						      uint32_t handle)
-{
-	struct rb_node *rb;
-
-	rb = prime_fpriv->handles.rb_node;
-	while (rb) {
-		struct drm_prime_member *member;
-
-		member = rb_entry(rb, struct drm_prime_member, handle_rb);
-		if (member->handle == handle)
-			return member->dma_buf;
-		else if (member->handle < handle)
-			rb = rb->rb_right;
-		else
-			rb = rb->rb_left;
-	}
-
-	return NULL;
-}
-
 static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				       struct dma_buf *dma_buf,
 				       uint32_t *handle)
@@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 }
 
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 struct dma_buf *dma_buf,
 				 uint32_t handle)
 {
 	struct rb_node *rb;
 
+	if (!dma_buf)
+		return;
+
 	mutex_lock(&prime_fpriv->lock);
 
-	rb = prime_fpriv->handles.rb_node;
+	rb = prime_fpriv->dmabufs.rb_node;
 	while (rb) {
 		struct drm_prime_member *member;
 
-		member = rb_entry(rb, struct drm_prime_member, handle_rb);
-		if (member->handle == handle) {
-			rb_erase(&member->handle_rb, &prime_fpriv->handles);
+		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
+		if (member->dma_buf == dma_buf && member->handle == handle) {
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
 			dma_buf_put(member->dma_buf);
 			kfree(member);
 			break;
-		} else if (member->handle < handle) {
+		} else if (member->dma_buf < dma_buf) {
 			rb = rb->rb_right;
 		} else {
 			rb = rb->rb_left;
@@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
 		goto out_unlock;
 	}
 
-	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
-	if (dmabuf) {
-		get_dma_buf(dmabuf);
-		goto out;
-	}
-
 	mutex_lock(&dev->object_name_lock);
 	/* re-export the original imported/exported object */
 	if (obj->dma_buf) {
-- 
2.34.1

