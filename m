Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D1BB4FD51
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA510E738;
	Tue,  9 Sep 2025 13:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aLoLubQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E42110E737
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:36:37 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3e38ae5394aso3445376f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757424995; x=1758029795;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kXmltCaa+AaoNYSNTm6MtPTiMQ0YZbzrD/4xtNxBMMM=;
 b=aLoLubQQMmK8NRFgfmMhyxZwb3bFpYk/6cA/FF4Vzk/62nXzAznqfGAkBPibNfkmkR
 ZRxJRZCwExIfuHXvvFkrivei8dBTFkj+H8XKTpgIQzJYySul4nzUWEZRE2wiSYXypoFg
 6XvxdKTao2sGtXpMjhpA0Q1+2gSqnHnXRcHzMDd1x7bTiYd2+2rw8P3lJm/tchknIZc/
 mQTIPTD5as9yoFQ0pAkG4+nlomlXSS7H4v0t05az1Acscd4slJ26aGrNbAinrRyJX3Nw
 AhedfJ9dksah5NTx+JWDipXyPRP2tumGGcb70hUXILmBMIDP/729SUYkTdUoSXXa0yxK
 8w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757424995; x=1758029795;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXmltCaa+AaoNYSNTm6MtPTiMQ0YZbzrD/4xtNxBMMM=;
 b=Nm8qamlfry0HYUk7AMJMRbRRLqZs946aoo9u9s6Rhe60lYvTb7FOX7eNgUdLz2pszQ
 GoTDJQa01T9wH+KIyenuO5UIZGkNusSHcWbO1F9hnuidzE/giTb5Qjym0UXy0C7JHb1z
 tnVTof9Br5aTj71weqowz8sZJwVYdrr+hmufkaY+rhhLbN8z7YaqvrdUo29p9KJifaV5
 QpZbtBLxZWYgdX4RIgF9bnjFvm+D+TAeBjR6zsPb4inreChtfhbXP9VyXhk1s5qa2Jv7
 cRjCE7ReJIyxT89eJBJY7bdGWpv87tRe5a0ySo0PLgTjN/TMtVBAlDFas6T3BYuAryDJ
 5Q6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFc4qEkzhyz9+ozhPD2l4W+Ydqy1MqaiPFkpn5TfVGiIY59h4Temy6J8kkskxN6/qAc039yKkSkcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2WGY+yuky1WiLiDyqur6d8Sy0OYO0Z56Xu/FfPPJwyKUnZQP4
 CsnQ3yagCzxWLPMU9NQC7ZjLQpTesUx+Yu7+xTF+c7+1UquH9FEUsgg0UpQjR5/nNzIhXiaTIc7
 zJm7ntCUtJYkC/mQBJA==
X-Google-Smtp-Source: AGHT+IGpd7wVDU7QaP3WDSMkWRZay0a703HdaORpePC2ExBYXtfISIk0y/IycXtdZ8Fxh2p+uKHUoHh4HXK5Hec=
X-Received: from wrp30.prod.google.com ([2002:a05:6000:41fe:b0:3e7:5322:fa12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:a2de:0:b0:3e6:e931:b3e7 with SMTP id
 ffacd0b85a97d-3e6e931f910mr6330514f8f.61.1757424995549; 
 Tue, 09 Sep 2025 06:36:35 -0700 (PDT)
Date: Tue, 09 Sep 2025 13:36:21 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFUtwGgC/23MQQ6CMBCF4auQWTumLVbAlfcwLApMyyRCSWsaD
 endraxd/i953w6RAlOEW7VDoMSR/VpCnSoYZ7M6Qp5KgxJKi05oTMvgcSJLAWtrbCemVkmroRy
 2QJbfB/boS88cXz58DjvJ3/qXSRIFNoakqVs1XJvL3XnvnnQe/QJ9zvkLO1FwoaUAAAA=
X-Change-Id: 20250905-vmbo-defer-3faf90d821f5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=GeUdJBt+v1KLgbpRUvyZgBAL3FGBKi3BqI0ivCr3XSw=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBowC1dGqdohxONBkmeGDCsxY+w9d40QZKFJNsMn
 blUuB2WgMKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaMAtXQAKCRAEWL7uWMY5
 Rjl0D/9V49VT0Tbg6rT/l8FP+PvPvgDkL+20mqG6MQUaTYe15pW4fvIT38lA36TeEmLzYOOblJ/
 iNZu+LQs1SUSMY0XT3Lpd47Gd6suiwvO8aCo2+xsyMBmiA22jM4Wl7Ug+o/pWTMgOTv7kPqWsYI
 9x4izNqiAEeQW15SlpoGt2eVDbkqvz/JyZ3v9Y9Rmcv0TGs74YALbMW1Sozp/0EOgR2lAgklLyj
 uND73E1B+Kw+ObTcou+8WkikX7Kbg513yQdvJaAxWADEV8E2hALAYpGItOduFdNaM/HFtjvfLjE
 AGKeTZH0ZXRvlWPqCisAwJDw+gxUJvjvTkvuM79FioAaULVwmuPgjg65Xb8gMDT+UbyNexjQx5L
 QixxOGM6gEm/QVF4zWdmTfRnLpvuEn9G4VNNP5hALbxXKcN5iRBUCHbvCsmKntReOi4opHZmgDv
 71XTIAdFgQAHThObOuzMfbtU+V8qpbn9pVPxCkA+lbphh/HowtYrMVhR7v7DzJoQfvGIPQAqjkv
 nURbgyocHZ0MTNQeBhzmPrSoBCM6ZkXE6V7gvNnLPzmhZAhXY2HwB2UfwDl1BerLCFZ4mYlTSa4
 jnOsP21rmP/tkucFd1XQgh72IZGyLGk2zz8jvTFEOfJqz6tf/UgnPqEEtxTN69KhW7y/rw7vAGw
 D8A+EpkPjoC26qw==
X-Mailer: b4 0.14.2
Message-ID: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
Subject: [PATCH v2 0/2] Defer vm_bo cleanup in GPUVM with
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
Changes in v2:
- Fix missing kfree in Panthor.
- Rework mutex_lock() calls to be less confusing.
- Add note about resv lock in drm_gpuvm_bo_is_dead() docs.
- Link to v1: https://lore.kernel.org/r/20250905-vmbo-defer-v1-0-7ae1a382b674@google.com

---
Alice Ryhl (2):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()

 drivers/gpu/drm/drm_gpuvm.c           | 174 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 113 ++++------------------
 include/drm/drm_gpuvm.h               |  26 +++++
 3 files changed, 219 insertions(+), 94 deletions(-)
---
base-commit: 7156602d56e5ad689ae11e03680ab6326238b5e3
change-id: 20250905-vmbo-defer-3faf90d821f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

