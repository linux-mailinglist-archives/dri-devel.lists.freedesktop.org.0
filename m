Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0373BB008B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 12:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6961E10E341;
	Wed,  1 Oct 2025 10:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dRA5C9/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07FA10E345
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 10:41:49 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-46e31191379so43277345e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759315308; x=1759920108;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q4AkcJXKNZTBwi85jKp+KXwdlDEEaE6EAE6141OGSoI=;
 b=dRA5C9/MOvgwSpesjPzmMnPbSBAYSGSxPhD7vf/CpKapGhCR6xobQI0fjmkteThRpI
 JzKk5jZq2rORCl3o9OMwl1itNm+m73VEYAXbQ1PEERM/DdMkejOfSS+O91H/lxFEf0Zk
 RHS8qIXKBFM17pSGe4BvJYJOFR+Gc4y7n3J9R4/XXFuLfD2jVZQbBt/3R2Z0pcY3jWGe
 DTUNpRhE1c5US4jSKMUWpcZpl+VJB7Lo/xmhvCEiffYF+9wbmtCXDBBZO86u3w3hy9TV
 pdSvIzEAvvNSnrTiOuHHUQV9f4wEgGwg1wBZaBtOpiJhLSFL+Wi/IoaM5hrF/doQmmnS
 K+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759315308; x=1759920108;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q4AkcJXKNZTBwi85jKp+KXwdlDEEaE6EAE6141OGSoI=;
 b=xS0tzo+9SiUqB5mA0CCnLyxHCau/g4J6R9AMKxstXPjXCTyyPmZ1ZU688iDWNOhkxM
 XvjMgG8EGNbH1vI1qWqHpC3lx3AKm64RFk/ts6FCWLph1VbFMoKVlWTqHdAwychUlaWJ
 1dTMjvdnTTJixRj3tUEEaZ2jfdpRCj3BqpQuwDCnjCvfRw6tl7mxHlfpc5Awk0ohuLNa
 VLoryBb2GQgH1kniFZS5DxqaZNOm9U4aEd7THwSXYQwI3aY5ZhtaB+u84TBYbOBW5iPI
 /ugwccLC3oc3Q29Wc6pp9jx8LrBYM5ir0w6KWus6CvkzwXpYBoGfJUS5y+2DxD7Mg1q4
 Iung==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVECoSfzFFVCotzkE3iaXHCbr8mmwn6Py1gdQIo67kDI0uE8chjbpFs+FjyuGBzGwgiqdxEHzu74M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI3kqn8OZQoEcD3aPLuzyAIpkDEHCs8hRobuT5ifdMOJo/JkX+
 bahFCbbLQitaCo36buoevwH7w/21fIJVBG1cTXfdQGtK/ZU/GTEXV/2TwJUzyWSJN3GmdfBPD9q
 8XM73HqdK4L3e6KiuUQ==
X-Google-Smtp-Source: AGHT+IGcmZb44kUZq9xm+3p/jxi0dJbJMOnTYuGcLSzG5k94a12SYjK9rXC/hs1AahMddzAyDeqHtr6Uml54uVQ=
X-Received: from wmhn17.prod.google.com ([2002:a05:600c:3051:b0:46e:4c7c:5162])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5009:b0:46e:436c:2191 with SMTP id
 5b1f17b1804b1-46e612dad75mr26829995e9.25.1759315308065; 
 Wed, 01 Oct 2025 03:41:48 -0700 (PDT)
Date: Wed, 01 Oct 2025 10:41:35 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF8F3WgC/23MSw6DIBSF4a2YOy4ND6nQUffRdIByUZIqBhrSx
 rj3oqOadHhO8v0LJIweE1yrBSJmn3yYyhCnCrrBTD0Sb8sGTrmkmkqSxzYQiw4jEc44Ta3izEk
 oYI7o/HuP3R9lDz69Qvzs7cy2928mM0JJY5AZoXh7aepbH0L/xHMXRtg6mf9afbC8WK2EtI2oN
 VX6YNd1/QKo59qP4QAAAA==
X-Change-Id: 20250905-vmbo-defer-3faf90d821f5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2783; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=CYKvLAiGqs++D4GTcDP3BiBOeQPlODqXyzh5jaw8M0o=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo3QVlY/GHVqJ/AVp07a8vNu/sGadftMNeocEXI
 xHxNOEhvQqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaN0FZQAKCRAEWL7uWMY5
 RkUvD/wL0NxeTLlUXgmCpoqQuEkfJtg+jiefX3y8GEOK55Q/rzQGJRI5dgeoJN1jwzO6eKi2oul
 iO1zo72lQo3sKnlksRBEd9nXquUYdm1EtInbRdCqpCCzgiwl0cqjvZnGfTIPfer53XkjVxFgmtG
 QIMaGcXhtCckI3WcwKhkNVlWSUTRq08dERIBWGE3a6yEa/F6aJZW8hphUgAvbPN/n623fdvystt
 OpXo17yocNkUWBxz+iU2qV5gbnZaB6up8ONo935QGBxWQOzK2BRsEpkNe74+Nrl/J247MJfuB+I
 sAj9wCK9+uxfbp3LthFHU0SffeZQvnpnR0cDepUI0lSGry6S1lCcyscINuDqU+wbs23epZr+kGY
 yzMrMG3Mdipor6G8UcZKq3Bc/oFfudwjObAEEB4a9CAMfnrrFWBB+6hTU8ZcllpUlVB7eKHio9g
 4rYdaFC4cytGEGlVsNDzAQ+Y1GDnuDdlF3whVi1e9becd7+gHiH2VH7ZU+dpx2amyrVdfqIUMJp
 4EGtRez8xTrvMv3zseWpyhEPaHYGthWCLVm0EKNT9BabO2BDC/JiuL82tRZHssS2kPI43dNi000
 hgda664j1McYDESA3yVlmnck8iE+RR/edmhLjG2gsfIg5n4IFaCoECz61eYAaNysbSonemAbXMO
 f4L+/q/FXFoKoDw==
X-Mailer: b4 0.14.2
Message-ID: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
Subject: [PATCH v3 0/2] Defer vm_bo cleanup in GPUVM with
 DRM_GPUVM_IMMEDIATE_MODE
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
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
immediate mode, we must manage the vm_bos and vas during the fence
signalling critical path.

The first part of that work was the introduction of a fence signalling
safe mutex for the GEMs GPUVA list in commit e7fa80e2932c ("drm_gem: add
mutex to drm_gem_object.gpuva").

This is series the second part of that work: Dropping a vm_bo object in
the fence signalling critical path is problematic for two reasons:

* When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
  the extobj/evicted lists during the fence signalling path.
* Dropping a vm_bo could lead to the GEM object getting destroyed.
  The requirement that GEM object cleanup is fence signalling safe is
  dubious and likely to be violated in practice.

Panthor already has its own custom implementation of postponing vm_bo
cleanup. Take inspiration from that by moving the logic into GPUVM, and
adjust Panthor to use the new GPUVM logic.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Unpin in panthor on drm_gpuvm_bo_create() failure.
- Use llist for bo_defer list.
- Rename drm_gpuvm_bo_is_dead() to drm_gpuvm_bo_is_zombie().
- Rename drm_gpuvm_bo_defer() to drm_gpuvm_bo_defer_free().
- Link to v2: https://lore.kernel.org/r/20250909-vmbo-defer-v2-0-9835d7349089@google.com

Changes in v2:
- Fix missing kfree in Panthor.
- Rework mutex_lock() calls to be less confusing.
- Add note about resv lock in drm_gpuvm_bo_is_dead() docs.
- Link to v1: https://lore.kernel.org/r/20250905-vmbo-defer-v1-0-7ae1a382b674@google.com

---
Alice Ryhl (2):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()

 drivers/gpu/drm/drm_gpuvm.c           | 184 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 110 ++++----------------
 include/drm/drm_gpuvm.h               |  16 +++
 3 files changed, 219 insertions(+), 91 deletions(-)
---
base-commit: b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde
change-id: 20250905-vmbo-defer-3faf90d821f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

