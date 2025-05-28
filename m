Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40041AC6560
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E630E10E5B4;
	Wed, 28 May 2025 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Oo3kEPWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C7210E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so54027915e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423599; x=1749028399; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9q66come6SeS35Z4+H4REbaGVF8j8A5bWLsS2teBos=;
 b=Oo3kEPWMVPThRXoawAEAlsKEZlDZERdsK0oVFTaAT3cuaJSNBIMXrQFlBfuZceNFa8
 I/xzlG7Ltdq7b5hh9L4RUGnKr+5qYWK1Uxf95bjYbWSyhPNlKx0Lt/hZ0r/UZj7B2A9u
 euMCayR0ti17RULTzjbqA+sp0zqqfcB1YAY2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423599; x=1749028399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9q66come6SeS35Z4+H4REbaGVF8j8A5bWLsS2teBos=;
 b=jMCvx8rd7W1wwIRM6COiabgk76Po7J15VSnvvviFIYjGokNIhqTgwHPGY8Htnxa3a0
 Hg4T5hKhzGlOTeiJjFBbR7rbdMgMJ9lWaUQ9OIweo2H8qnGa4nJhR22ZrmOTAtUcgKoL
 d+JNh4/n181+E/uEH85lqMCPdq4C1dV0pzfOOMXWLJyBPAJFycC6yDf1JdMkIlZT+I3m
 hIOFQ+L4DUdeVt6Bsw3dtmSD9CqrUBN2JNYUbOv/bQUFesk2yO+FCXlIYs2t+7jnFDmq
 mlwIIc9Wwfs1Mw+QgBfFfsQymdUsM2LSDNpWIycv6AxRKeDNylbLzKx0+rZzVyZKwzH0
 cYiA==
X-Gm-Message-State: AOJu0YwaD53jVSvOTsAycIwzV/ZQRYVFUQuHCu57Jc51noS5eSKLQgzq
 RJ4m5PoXKTHKMy+7tX9wi6nf0oyVPrDM4JL4DP7eRZXH331Vtx9E8P1pwt5AACVHFXInlBs7wB8
 BQeXA
X-Gm-Gg: ASbGncuID6Og4M+G76woj4iZlYChfhavGlNoeG6214xC89m5OOgxcp05C+uPuDo9Qwb
 F5u3B4XlyK4kuLRw21clB27prn/4zX+Ziytchr+2YIPnbIE33PB1CvKJOuPjSRk0XnaXuff3kme
 YIBsk8Eno2fkogIsnxsiYoO/N+hwagsGjIE1H/ZClmWNjy9XQGxHdkJdzTDzuaTDlSFpMr6UW+s
 aTcXKsK/aDIEol6oysBV5euQv58MMfpB8WA0UUfB9548/YyQ62s/pIGd1fKxB6yQzApt1eAkGb7
 JxtcoTGCgR9inNjNliOWDeYhrrDGK/mekbpKJRV5OdaftAMh7SiAyS6Ji9Mj6EY=
X-Google-Smtp-Source: AGHT+IHCdJjf/CaKt4eUMaaCGYd4N1EV7jgocpxCcj39hada3ZW2Jiep3JAak6Ekwh7yr4ee9sg8zg==
X-Received: by 2002:a05:600c:630a:b0:43d:fa59:be39 with SMTP id
 5b1f17b1804b1-44fd2eec75fmr20647115e9.33.1748423599246; 
 Wed, 28 May 2025 02:13:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:18 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 1/8] drm/gem: Fix race in drm_gem_handle_create_tail()
Date: Wed, 28 May 2025 11:12:59 +0200
Message-ID: <20250528091307.1894940-2-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
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

Object creation is a careful dance where we must guarantee that the
object is fully constructed before it is visible to other threads, and
GEM buffer objects are no difference.

Final publishing happens by calling drm_gem_handle_create(). After
that the only allowed thing to do is call drm_gem_object_put() because
a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
(which is trivial since we have a linear allocator) can already tear
down the object again.

Luckily most drivers get this right, the very few exceptions I've
pinged the relevant maintainers for. Unfortunately we also need
drm_gem_handle_create() when creating additional handles for an
already existing object (e.g. GETFB ioctl or the various bo import
ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
the only exported function to stop these issues from happening.

Now unfortunately the implementation of drm_gem_handle_create() isn't
living up to standards: It does correctly finishe object
initialization at the global level, and hence is safe against a
concurrent tear down. But it also sets up the file-private aspects of
the handle, and that part goes wrong: We fully register the object in
the drm_file.object_idr before calling drm_vma_node_allow() or
obj->funcs->open, which opens up races against concurrent removal of
that handle in drm_gem_handle_delete().

Fix this with the usual two-stage approach of first reserving the
handle id, and then only registering the object after we've completed
the file-private setup.

Jacek reported this with a testcase of concurrently calling GEM_CLOSE
on a freshly-created object (which also destroys the object), but it
should be possible to hit this with just additional handles created
through import or GETFB without completed destroying the underlying
object with the concurrent GEM_CLOSE ioctl calls.

Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
Release driver references to handle before making it available
again"), which means a cool 9 years have passed until someone noticed
that we need to make this symmetry or there's still gaps left :-/
Without the 2-stage close approach we'd still have a race, therefore
that's an integral part of this bugfix.

More importantly, this means we can have NULL pointers behind
allocated id in our drm_file.object_idr. We need to check for that
now:

- drm_gem_handle_delete() checks for ERR_OR_NULL already

- drm_gem.c:object_lookup() also chekcs for NULL

- drm_gem_release() should never be called if there's another thread
  still existing that could call into an IOCTL that creates a new
  handle, so cannot race. For paranoia I added a NULL check to
  drm_gem_object_release_handle() though.

- most drivers (etnaviv, i915, msm) are find because they use
  idr_find, which maps both ENOENT and NULL to NULL.

- vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
  pointers might exist due to drm_gem_handle_delete(). This needs a
  separate patch. This is because idr_for_each_entry terminates on the
  first NULL entry and so might not iterate over everything.

- similar for amd in amdgpu_debugfs_gem_info_show() and
  amdgpu_gem_force_release(). The latter is really questionable though
  since it's a best effort hack and there's no way to close all the
  races. Needs separate patches.

- xe is really broken because it not uses idr_for_each_entry() but
  also drops the drm_file.table_lock, which can wreak the idr iterator
  state if you're unlucky enough. Maybe another reason to look into
  the drm fdinfo memory stats instead of hand-rolling too much.

- drm_show_memory_stats() is also broken since it uses
  idr_for_each_entry. But since that's a preexisting bug I'll follow
  up with a separate patch.

Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: stable@vger.kernel.org
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c | 10 +++++++++-
 include/drm/drm_file.h    |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..e4e20dda47b1 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	struct drm_file *file_priv = data;
 	struct drm_gem_object *obj = ptr;
 
+	if (WARN_ON(!data))
+		return 0;
+
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
@@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	idr_preload(GFP_KERNEL);
 	spin_lock(&file_priv->table_lock);
 
-	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
+	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
 
 	spin_unlock(&file_priv->table_lock);
 	idr_preload_end();
@@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 			goto err_revoke;
 	}
 
+	/* mirrors drm_gem_handle_delete to avoid races */
+	spin_lock(&file_priv->table_lock);
+	obj = idr_replace(&file_priv->object_idr, obj, handle);
+	WARN_ON(obj != NULL);
+	spin_unlock(&file_priv->table_lock);
 	*handlep = handle;
 	return 0;
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..d344d41e6cfe 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -300,6 +300,9 @@ struct drm_file {
 	 *
 	 * Mapping of mm object handles to object pointers. Used by the GEM
 	 * subsystem. Protected by @table_lock.
+	 *
+	 * Note that allocated entries might be NULL as a transient state when
+	 * creating or deleting a handle.
 	 */
 	struct idr object_idr;
 
-- 
2.49.0

