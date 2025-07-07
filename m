Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E035AFB715
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D759510E321;
	Mon,  7 Jul 2025 15:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="deVvz7X8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54910E4CA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 15:18:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so22750305e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751901506; x=1752506306; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dDyUvZNv5CDa5hocwZakQH5cNmENDMsfcPjRy3ud2is=;
 b=deVvz7X8c/jd3KNIoYDNnozByBrA8tsJqdcSO5MNQwHrXCiZ5HgJJIwQ4XPWd2WqVw
 9rDuNcvf9nnKKGrwO/MPQ0OmOyRLavEQlnLV/KFBXPa1Us4KhXY1ZWopZJWVOrqAyxcJ
 p03uv3jr0zcGIl8kYmXDr3MuX9KH/eqrJzO8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751901506; x=1752506306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDyUvZNv5CDa5hocwZakQH5cNmENDMsfcPjRy3ud2is=;
 b=AFp2dBhnRBTpMWrkwM5pWI8pJ00rJI3o+9YR2NLwicctsE6D/IsY2Uz731nMhE4frp
 0HBE1YaR7NK0/69K45yO3CIyIRY0gd7desV4nanY/MKN7SY8kf8s15ocpI8trIumTWrG
 uKbBQ0FL76y+k7Uu3428pLZWm2/Gc9ykuvfUP9vFo8trMzy/jKf7cWcYB8t9pCPU1DaZ
 DveMAcg2mDFnEwPa0XCnGcsgYME99fLGf6I1RZe+RJiv7SsS5CBTi5AKB09SxWhnAqsd
 4UuP9Wd/8+hXh3CflYELoBzO+0LXQzi6iKROMw+Y66r/7NVyjiT85NqYmPfKh1t+uQhW
 nWfg==
X-Gm-Message-State: AOJu0Yy+x/MjwVLSPoDAaCRz6MjW1EjdNPpXlPZQQchZkpONu7UCe0AR
 te8zhJZaMKQJRmTh/WXhI82BJ0t8oxiTGySpY6YAUpcVb8d9l465YyDQBK+nXDx+61XgkNp0j0s
 VmAq98i4=
X-Gm-Gg: ASbGncuVjo0CLUlWkBgsBGkf4F56MDgBjg8Oi/dkzfPEqY/QDI/gZvIBduRb++fKVrS
 8RTOnHPJLujAGgzzTB1Y2xcuYuMqW+NQzFCnYGAxfiTmNrkAqj9NEliTItIBVA4Rj7B1Yat0H/g
 JC1zS7xcttWjXzBEPBYVcwlhk6Wa9D7DMRWORpp/EhHDlaEVZ4y+f6O+BaeKFBQ5KhLxCoy+DTO
 sIs824tAXYho+KdUEpNhiHoI0k4a1WpYCPTnNt/i3rnbBL/jntYjFgGz1kUVpbpc98P7ecdMe9n
 ZAvGwJKuSaYsXgwmMyl2KAVrr0aXy0/PN7mA8WA1ClWp2BtW30YKHfc5aTqLAmRwYaWOhhlSKg=
 =
X-Google-Smtp-Source: AGHT+IHkcWwX9LDmtC86uNJtoHdD49oLmsozTA8OJxJjZUo33P5D+GyfKtm4tZh+OpBnEJdv54iyJA==
X-Received: by 2002:a05:6000:41e4:b0:3a4:d53d:be20 with SMTP id
 ffacd0b85a97d-3b49aa60651mr5656442f8f.18.1751901506040; 
 Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b46d4c8619sm10369057f8f.0.2025.07.07.08.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 08:18:25 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Xe Development <intel-xe@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 1/2] drm/gem: Fix race in drm_gem_handle_create_tail()
Date: Mon,  7 Jul 2025 17:18:13 +0200
Message-ID: <20250707151814.603897-1-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
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
  idr_find(), which maps both ENOENT and NULL to NULL.

- drivers using idr_for_each_entry() should also be fine, because
  idr_get_next does filter out NULL entries and continues the
  iteration.

- The same holds for drm_show_memory_stats().

v2: Use drm_WARN_ON (Thomas)

Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Tested-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index bc505d938b3e..1aa9192c4cc6 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -316,6 +316,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	struct drm_file *file_priv = data;
 	struct drm_gem_object *obj = ptr;
 
+	if (drm_WARN_ON(obj->dev, !data))
+		return 0;
+
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
@@ -436,7 +439,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	idr_preload(GFP_KERNEL);
 	spin_lock(&file_priv->table_lock);
 
-	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
+	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
 
 	spin_unlock(&file_priv->table_lock);
 	idr_preload_end();
@@ -457,6 +460,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
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
index eab7546aad79..115763799625 100644
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

