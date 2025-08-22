Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C9B31305
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2F210EAAA;
	Fri, 22 Aug 2025 09:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G5GnInWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C9810E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:28:50 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a1b0d221aso9172275e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755854928; x=1756459728;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TrBXsBfJN9Hl0C60LtHP8goa7t5Q56hpklQFi7rDf1M=;
 b=G5GnInWFpZYJ1ngufqU3zVSJmufwurS+oT9GN3cmxOfqxRlPVASv57xljNMdx9j1Gn
 CnenrgF/Rij2fPCRp4O+zcJW3RwYxvnRqzkYYS9A6dsYPNRI15/98g9CkefpxdJZB1Lu
 qzqOv5TEnMYc8OQX5rAmhz7lwtN7tf6TfQRNO6gkIUdk5Gjn2DpS9T3LlAEkD5oDyPd6
 1k/NKHE9WxLefUa2bV7Q2tm513CSomsFg/SXP2/kL3nfOK0hfj21oX+Mwtl+IJ0esN2H
 rn9cQr8dXZNPnCqcjtwNjnfymOQm8+H43/op0IzHJk40VdwmidKpwrafiwNfUswABsT3
 klMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854928; x=1756459728;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrBXsBfJN9Hl0C60LtHP8goa7t5Q56hpklQFi7rDf1M=;
 b=lAjvK/xum/O3A7i0FQngGc+/KHsY11/RcBND9djCR8IuQnGpVgi3i4JXLe1oI5fuym
 hxYxYKpUbabNOGu7ezkvInFJE0rsmj4CKBg4Cj3uRDn9dQl/fQbDJBQYBHeFRS3WTIZV
 NyCVkf58aGnuff2+fld4boGBSxWC9D4gbN1zLdINyeGndIm0XKhmRPEzReeCg/HEFbH/
 q9+lZXO1XkByGqOHc48VT8sZBzrVfOXfoF5/Vri3RWNiN3RPVShJdtBvjkkiKZuc4NmR
 DjXCpvXKiVD6ceOKTfX99J1kI4lL7+0c1fJY7P4pIjfj7EidweZmv4W9R8mfrYmDdc6A
 zU0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqbP/x+BbQKg8pFfczOBRfU4JFj4yHgPMqJZdfJAyra3gm5Kd2IPmqopuzLUYcPmARGOyPXni/an4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjeJ9LWgOBH/CmVw0r0QryTKTiVcmfTHt2BtAAtGtUy7xCgyi1
 0clex/O3esb6Cgk6WtAWJKj6bjK64++KS2hTzW6fZWY1Y0hVFLJbHM5fDAOSVO3jcKj8eifSVB7
 sk7o/YSQlml+X8LLBvw==
X-Google-Smtp-Source: AGHT+IED8wcDTUn+Pl5RltIzM8gjl/tmIptfRKwT5dyprtog5nBFWSTOA4EQbWXFpewTcpCsnhP5UIL7y4PF/Bo=
X-Received: from wmbeu9.prod.google.com ([2002:a05:600c:81c9:b0:459:dd37:a6bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c9:b0:458:b7d1:99f9 with SMTP id
 5b1f17b1804b1-45b517a0655mr17952605e9.11.1755854928516; 
 Fri, 22 Aug 2025 02:28:48 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:28:24 +0000
In-Reply-To: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3464; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=Kl3w8GhwSkTKnL4gpM3EUOD9jKMCH83Id+WyJ393gAc=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoqDhNzfZv5dJM175fnbqNeGceTMeDRW5pDdq+k
 uA1ND5WFxOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKg4TQAKCRAEWL7uWMY5
 Rlf2D/4/xi0frU0yUeXbZcDX1ScUrrZ9zjuUgR8Ow3W8K1zQqyzFnU07/S7HCg/80TBBvLfDsTb
 U8rKOyiqaOMkIJxi/CQ/QQ3zKZTKPJlUUwzWroZ48SzkjbGZ9ONBcua6H6qna6Zs2a9Mjj4UsGU
 879eChTLDjFwsOir565HgrdVVD2LC3S67e6np8Y8D7Ma8I6edYhq/vIKMU1nOlu8Zh9KhPq9sNW
 Q2mAhyB9JndoKQW/drIemw2iArNDnS0i25+MBR+6fJzfHfwv/ZkQyH+0M0R/n9VCLkXLZH16c0u
 EZFjs9/7UlkOoOgF522g5Qic/+hRDWLFpL+0dduz2Qzj63YQ0Iw5IihTM2eYKSr2FxF0ngI87Yk
 2MSSd+Mbn7RfCHp7oOLsnA/3o5F/ByIiE1UuOuziOffja/SbazXtuUijUEx9AUvCLOQftAZQ4mJ
 GAaaBQrXVwm14fxr+tPlkyEgtObdXzO2uKkVRoPpMHe1tEzkQZVqj+pNPJIsol0PJKb8ahK15la
 IxGzUej4znW0rwkkgjwEhNqXmNMhAQZQYgdQtYvSFe1AxBiBb4zRbqw+0+mG8XytrFHz9OLnK2A
 Txn6S1/a3nJfFCSFjinfwkUm1lFF1GQarGz2bgTR7kj39g6xwMI3+d7QbHB4n7WeR/KvrtMwvQ/
 VfbKwcalfrR0+Kw==
X-Mailer: b4 0.14.2
Message-ID: <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com>
Subject: [PATCH v2 1/3] drm_gem: add mutex to drm_gem_object.gpuva
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

There are two main ways that GPUVM might be used:

* staged mode, where VM_BIND ioctls update the GPUVM immediately so that
  the GPUVM reflects the state of the VM *including* staged changes that
  are not yet applied to the GPU's virtual address space.
* immediate mode, where the GPUVM state is updated during run_job(),
  i.e., in the DMA fence signalling critical path, to ensure that the
  GPUVM and the GPU's virtual address space has the same state at all
  times.

Currently, only Panthor uses GPUVM in immediate mode, but the Rust
drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
worth to support both staged and immediate mode well in GPUVM. To use
immediate mode, the GEMs gpuva list must be modified during the fence
signalling path, which means that it must be protected by a lock that is
fence signalling safe.

For this reason, a mutex is added to struct drm_gem_object that is
intended to achieve this purpose. Adding it directly in the GEM object
both makes it easier to use GPUVM in immediate mode, but also makes it
possible to take the gpuva lock from core drm code.

As a follow-up, another change that should probably be made to support
immediate mode is a mechanism to postpone cleanup of vm_bo objects, as
dropping a vm_bo object in the fence signalling path is problematic for
two reasons:

* When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
  the extobj/evicted lists during the fence signalling path.
* Dropping a vm_bo could lead to the GEM object getting destroyed.
  The requirement that GEM object cleanup is fence signalling safe is
  dubious and likely to be violated in practice.

Panthor already has its own custom implementation of postponing vm_bo
cleanup.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gem.c | 2 ++
 include/drm/drm_gem.h     | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af39720451ac24033b89e144d282dc..8d25cc65707d5b44d931beb0207c9d08a3e2de5a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -187,6 +187,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	kref_init(&obj->refcount);
 	obj->handle_count = 0;
 	obj->size = size;
+	mutex_init(&obj->gpuva.lock);
 	dma_resv_init(&obj->_resv);
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
@@ -210,6 +211,7 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
 	WARN_ON(obj->dma_buf);
 
 	dma_resv_fini(&obj->_resv);
+	mutex_destroy(&obj->gpuva.lock);
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..5934d8dc267a65aaf62d2d025869221cd110b325 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -403,11 +403,13 @@ struct drm_gem_object {
 	 * Provides the list of GPU VAs attached to this GEM object.
 	 *
 	 * Drivers should lock list accesses with the GEMs &dma_resv lock
-	 * (&drm_gem_object.resv) or a custom lock if one is provided.
+	 * (&drm_gem_object.resv) or a custom lock if one is provided. The
+	 * mutex inside this struct may be used as the custom lock.
 	 */
 	struct {
 		struct list_head list;
 
+		struct mutex lock;
 #ifdef CONFIG_LOCKDEP
 		struct lockdep_map *lock_dep_map;
 #endif

-- 
2.51.0.rc2.233.g662b1ed5c5-goog

