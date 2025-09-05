Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8549B4575A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 14:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348EE10E2D7;
	Fri,  5 Sep 2025 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YfBn6iKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF5D10E2D7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 12:11:37 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45b9912a07dso11463515e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757074296; x=1757679096;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZOPSONkb/oHrdvEnVNIWH6qwbQDR8wyTn/LimFEqbTE=;
 b=YfBn6iKJLp91db3auZILnA2lmTjWS0jDfmWnfZ3aTDdZb6rLdNRH0UlgcrNbq9wk1G
 aZ02V0qjCePQ+Tw/EbJuxopQ4qdbVD02gq5MZ/rG/K7Lyn0lbtXdii9EUYVWZcO0e1Rl
 MrSkgc8++jgjzDYuOcRn2HBUx479nrG8/sQtPZVcpJzUeQEZiRVMPinJBSbwAPXNRTG/
 TzU7u4a8RiDycwgIgeKVT4OBlm1OD0rw/D90YKDgPunrD8ItT26fiA4OJQwSOUtBHbGo
 pTIknrIxhkHsV1twGWiRoSFi911Fp7vB+nQdsuu43mPFKiPsMQD1r1ZcdwdEnARSf6FK
 mmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757074296; x=1757679096;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZOPSONkb/oHrdvEnVNIWH6qwbQDR8wyTn/LimFEqbTE=;
 b=fjAmk2r8BO7J9A2O8gG8/rToHEKDrClztZG7Ji2bTM8WgSe0Ipr4nX3xlaM+oR2bB5
 3L0/wIHUUf2fLrqYfoU4D6RCmpuY7TzVgnvnKrdn72cqzLCX5Jgw41eVDkFukVwvW99a
 /SNJlS516u7qbj/dgrOCp6w+7PLobFKfrul8l38cDzEpA2VNp7zTGIlJNBHiVvWv1OXS
 DdQuUaLIDvZoZf63euuy2fj0X0kjDcJeWo8PGxYkW2kK/4nsVJAIU9BCs5sAhB8+YoIy
 jOKNl8FoM8BBzp7Bcqkga8b0yckQOJHIDX62D19Sm6mnX2QOJlDaE7A83YyXuYR4cl6y
 YutA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1nn+IH1ZdgEFi5JXBSonEFYvLzSkwjVNdAO9dfA9gcUjz26K9KAkDZtn8cJUr+9efb3mJQnqiVgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhLYT6Vv1JZVlai5tKKWwb1RfDP3QiehD+EYuyrNw3fSNgHvnR
 pC1mBcEqPWXSAfsRdAlBScF622dEPpTucy4vQd2SL+UhK9/VwNKbhvly3tMPZA0simJIQTVLUXV
 z5lhjSjm6U0u1jTIh4A==
X-Google-Smtp-Source: AGHT+IHsrGQX8qcCZ9HxIK99VE+RHo02K97912TeGraChWZB2JeehQ4Mi9OmJ8LtBxrYUIHXz75LaPtSikynI1Q=
X-Received: from wmbds21.prod.google.com
 ([2002:a05:600c:6295:b0:45b:88d8:5042])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470b:b0:45b:90fc:1ede with SMTP id
 5b1f17b1804b1-45c8e725fbdmr99877055e9.6.1757074295980; 
 Fri, 05 Sep 2025 05:11:35 -0700 (PDT)
Date: Fri, 05 Sep 2025 12:11:27 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG/TumgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3bLcpHzdlNS01CJd47TENEuDFAsjwzRTJaCGgqLUtMwKsGHRsbW
 1AJu26iRcAAAA
X-Change-Id: 20250905-vmbo-defer-3faf90d821f5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=av2PCZN3iHw31m2KXa/hGZSNvzXXs4uH3KJeadBo61w=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoutNyxOpFZ42DS+TtcDs65lWJgcI/hgupquxoE
 NNEcJ4qa8SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaLrTcgAKCRAEWL7uWMY5
 RpvTD/48s9S0nMHsl6JehxEXr8PtHD7thHl/lFxQWMfgSrMadcAmIJHO+zwYADWnzmomYuJky2n
 gNQvGc++T3PO/n2sAU9PhqruPaukq5/lCRv/maHDgqhIE3xfN9OYftlTwVAdPf4yN9uGrKPSxkJ
 bAeP+WcoY3QwXAV7805QTP+9gv5hK2sc4AymngGBMfiuwVQqsn35huTRpv8lhD/qRlx5SnVH2G2
 yzO4mFdQVlBRfqIz9dSM0R2EoPpt8fRCLQ3RoRRYs2af6pGpL5+JKAu+GwSHUQXkQcNop+wdycF
 7gLhpE6RVpXEWumcinMC0UVYea+0CVXIYk4kuYPou8wEYDuWlas+PV1aEpkdYnAiBQoIHBoMFm+
 pwmLLHTVHFXsjjCise4kQ2UyRNpZoctvkgGskOfWpgvgcVNt+IH7l3Ukimv+0Rf7LupUrdZ3kOq
 fDjDWwXfu9BCSgCH8zvwZCuTHqdLRqdwFXCIB+Zjqd8L8eDdsUkwoehj/xQfZ2s9Ro35RjDGw64
 kfw3LMXZRXlOLuFOVUbZWLECPYklrRcHXkeA8XTOPdVl3GAfJd7G+xcomZ05f/z+2HAoEwX53Xg
 hu576GcCaXnIrA3e9tiGLrSSOFJkOShBBfziv4M3rt5d5zAinz9AtybVyuloRybGPJFp1GepKRz
 ECEpmW5DmEnP3/A==
X-Mailer: b4 0.14.2
Message-ID: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
Subject: [PATCH 0/2] Defer vm_bo cleanup in GPUVM with DRM_GPUVM_IMMEDIATE_MODE
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
Alice Ryhl (2):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()

 drivers/gpu/drm/drm_gpuvm.c           | 167 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 112 ++++-------------------
 include/drm/drm_gpuvm.h               |  26 ++++++
 3 files changed, 211 insertions(+), 94 deletions(-)
---
base-commit: 4c67b73907214994f87cad795195c46fe63c1e1c
change-id: 20250905-vmbo-defer-3faf90d821f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

