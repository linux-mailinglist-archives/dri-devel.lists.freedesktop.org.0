Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE82BBDF4C
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29D110E070;
	Mon,  6 Oct 2025 12:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ElicBdxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D20010E070
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:06:05 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3ecdc9dbc5fso2638796f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759752364; x=1760357164;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/OB7xMh5+T9ypw6dAsTTgtORxWZ55dw+sNCcskl6+uI=;
 b=ElicBdxw85OLW75TYPEoQrTgarmhXV9+aLF6DelauQNsgmdFUeOxfZUWH8n9v9acjt
 1+rBicaBeFgjWUxBC8Utw3BDr6DKnx2Eh+FwU3MgwCTvhnX6p62Oc+w78dtMvgJ9NWDH
 KO/Hnaw+kP9MWsUQMp3yjcoi6kcdr5Ct7kN/K6UwCtGrOKl32bKksI65rLsA93/M05a0
 3iqwZE6Eo1Lg0IfE0z9nXQI8jh5AiKPUovVaA3g3xzXCT+yp3fwgKS/kXEdmsu+7jEae
 SSG8l/VJkMtbV+2nPsRX45JaG5Ro68rjlqF5NevHmbE1gTKvUIwz4tK4BVdM08I0kvcy
 Zz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752364; x=1760357164;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/OB7xMh5+T9ypw6dAsTTgtORxWZ55dw+sNCcskl6+uI=;
 b=vSIEE+Xfy6SMZrmeay/WoM6TaCg4cUnUnIvU9uuG4WGrrgD0yXs5mv/Sm35hN9TXt7
 brAFKiUMsE57npT8VA7bSEXWOAd8c6mz6of4Pcung/2Of2mfYdgt41cj28y3UmFa/U8+
 TxSkHxwO6SvqMBUlBbwGxJasDqFxK3XjsViA0TkQhKcTsyZRMJdyFEheFN3SbEbjcMPr
 u58ydto82NXGL5htJ2kalMYb1daaozfltQfv/mwI5JFJz+rtbPNmIRCgDQKnI+3owcfZ
 CgjeflOL5R11zpHuLdBPJ7WQEpNSu5rSZ4tSIe/4P+kCZ1zecFynwFCT0/wGB9EyV40H
 +gVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQXdowVU7m4AKSDtyYFzc1WXlkZyfTk02CTqr+/NpNIrbQJlkLInab2y+XS5yAyKNDoVZV/Wsw6Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ9+ySswjheqZ1eOylWedvoerX0e7/fW1dDv/fApon5Wc5OmZd
 nALS0Wmh9xfmK2Qs/6L4cmAlp6zfHvJA20urX58E/Mx7xxjbQxUFHUc5ImQwtF45VuMp3coK3KM
 en0Z7fM3dKl9/QixeaQ==
X-Google-Smtp-Source: AGHT+IGZiwn/2wr4en+CfzEIAktdUh7Xr9CEeu2eqUOcO9id7QGmI8fMYngV1eXRgRmIk6O9kosqt6M4YuIVHFI=
X-Received: from wrrd12.prod.google.com ([2002:adf:fd8c:0:b0:3ec:df8a:fad0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400f:b0:414:a552:86b1 with SMTP id
 ffacd0b85a97d-425671c2cd5mr8127141f8f.63.1759752363933; 
 Mon, 06 Oct 2025 05:06:03 -0700 (PDT)
Date: Mon, 06 Oct 2025 12:05:54 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKKw42gC/23N0Q6CIBTG8VdxXEc7gCh01Xu0LlAPypbSoLGa8
 91DL1quLr+z/f5nJhGDw0hOxUwCJhedn/IoDwVpBzP1SF2XN+HAJWiQNI2Npx1aDFRYYzV0ijM
 rSQb3gNY9t9jlmvfg4sOH19ZObL3+zSRGgdYGmRGKN1Vdnnvv+xseWz+StZP4t9U7y7PVSsiuF
 qUGpX+s+FgGwHZWZGuExaqp8ncld3ZZljey9oPqHQEAAA==
X-Change-Id: 20250905-vmbo-defer-3faf90d821f5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=0nkElAd5E12QHlg7Kb8WPr3y/YHY+cnYvzDlo0JgOKs=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo47ClY4kic2ueCmjFDZtvoHdJ9lRrq9D/h2+aK
 c5IeVhtg/WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaOOwpQAKCRAEWL7uWMY5
 RrT9EAC0eBYJqZ0YqLg7uTb+b64n+6kwas/1IE95oVSribxOWjqYBvkfZJcY58pw0jTPloLNvMi
 QisNu+vuY96By4D7jTRyd5V46+5jSM30A/Ll0iwefwlZd+Qdl977XgdsgydphsFZlCrcOEb8z6l
 CA7mDys9ZOxDeVxML2FT//LX/Henv3DFOcA/yiqiXn+L5oMQSskfYpltLBsXFlsqYnXi641s8xF
 uwvAbiGKXosPdqqpVHRN2y8CIWgnVsYO8a7ojpaotas3tQyHS6UVA4xAnhZFbaB2sUolAxuKi/d
 JvRb1ZZ0cr/xpkHY4CixAFRimX1R4YNE8D2KJxMFmXZJZievFlPbmgMRYO8hMs6RO4gdnJIHIUv
 s+JM0Al2XuB53wsPU0n323zrzEjnl1Eg1MrewjbygLK2nEW0waSPHcw/9LH5EwHbV44uieQf5Yn
 cnkb2jgAZUj6XYEaeK+tpSa6251n1RUkhaxoO7I+QLmbaBwejm5RGGJsS6RFr/ABC4QsWZaRwiw
 MNVWX5ai9ew9QMZy/c8xIMoLJTqq1COhGMWuUox+je59lZBfr6gfduUsUTmZd9uwkeB9cPxJEqu
 7GqRpp9BGq38ODG9DR1WI8KEDWaw/Gew3f567FubQ2DomJEVWb762jPeSyffVpvEaipypC3PA7m
 URQQFoOae7CXIlw==
X-Mailer: b4 0.14.2
Message-ID: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Subject: [PATCH v4 0/2] Defer vm_bo cleanup in GPUVM with
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
Changes in v4:
- Go back to using kref_put_mutex().
- Change terminology of deferral methods to 'zombie' and improve their
  docs.
- Link to v3: https://lore.kernel.org/r/20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com

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

 drivers/gpu/drm/drm_gpuvm.c           | 191 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 110 ++++----------------
 include/drm/drm_gpuvm.h               |  16 +++
 3 files changed, 226 insertions(+), 91 deletions(-)
---
base-commit: b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde
change-id: 20250905-vmbo-defer-3faf90d821f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

