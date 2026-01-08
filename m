Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D1D042B5
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A79710E345;
	Thu,  8 Jan 2026 16:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Jk+B4jyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B610E345
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:07:44 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-432586f2c82so1503624f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767888463; x=1768493263;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
 b=Jk+B4jyOvOuXxgeUpRzb7YIjkGjGJ1NbhNgZmxRYFmp81daBUzVdz1EEqT7bMGfzeY
 8hJQbIWG95wDR8BjSQ9mJ1hMnnGn/PvUqkHbPNkwKHmOND54J0x3ARvf7BYGH6K/ugvd
 VCt0ZjoygON1r6xGKIEMh7PEbHEKQStuRfBaboecjCaKUiEB571V+ETtR1R7LTnSSEdh
 P6Hir3y57P9wfM/wUAXeBibIDks5d4uvPPaIlCE30ZGRdkYKuHPgbDoppC7bPkdESaEB
 1NXCTvCYX7TOUXVZZOaZOOYLs3Fn0UOzYgJFPmJJgUvCBbOeuV8FX021gw0YdRB4jJY4
 1qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767888463; x=1768493263;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
 b=BymHdJDVvuXSnk9N/05f13Vj/Apaexgni/F6VSxLnJpgcReBXC6kBAobpm/HMDcNGE
 zCplU/adO7kgbd0WJiTp8VNshdX4YQO/rW3HzL1LA2of4EEHiuaCIItU6D5WKuAKxpNu
 s9vcg8qj4WTAO8q3OHKPAE2ztk56Ks7oLFfxdOJspraKVhmtzmhxCzS43Qdg5emk70Ul
 bCEL6h8KHDd+Ek+8m7lIQWQ/5nPdGf+MD3JSmMJW+q0qrgLS+7+EvHhCzBzdlTPmky6k
 tgSRc8zNCy9p88a7b+f7eluKVynsRSELpzLHfR0iS9NRVK5H40scnMmxFnTVulWmVG/d
 Lu+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmz5wawIFcP4We8Mib1xc2hLy622AAPLQ7MvZrr+ZPfil7MLsyKEz8C+QBfvvYyuJWhJCBaGRNsPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyDdLGmifhQJbu5cMEpVJKqVvtmvRVmZCm9joELOsg+bk3mebx
 zc4d+txIY1Jk44zulotWkZj0glo5g6CX9vPMTcsW2MjQEx8LZGg5L8uUQSNEqjGcAHdv2eIW+K2
 xwAEXb7kzrjkHePLf0w==
X-Google-Smtp-Source: AGHT+IELwgIWCY/J1hvJcROgHHhPtNfYmVFPy3DR5T4AF6N3+oYhJGrZ8GFSbPrxOSUZVlJIw2ilobL0+dO9O/E=
X-Received: from wrbay21.prod.google.com ([2002:a5d:6f15:0:b0:430:f9bd:2c6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2207:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-432c362bf78mr8482438f8f.5.1767888462740; 
 Thu, 08 Jan 2026 08:07:42 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:30 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAELWX2kC/23MQQ7CIBCF4as0sxYDo1J15T1MF0AHSmJLAy3RN
 Nxd7Nrl/5L3bZAoekpwbzaIlH3yYaqBhwbMoCZHzPe1ATlehMArc/OaRxbXtDDdiptRBlvVS6i
 HOZL17x17drUHn5YQP7udxW/9y2TBOCNtpdQWT2fiDxeCe9HRhBG6UsoXJH5RoKUAAAA=
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=snxThI8cYlPfWm0VQSv1csU1h0GPhmXiSH+DK97/5yY=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZH3Tr28HEcClQ+ZDYSEkR/L6fUjzsnzmv5F
 BeIx0yoLAKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WRwAKCRAEWL7uWMY5
 Rt0REAChUrcJne916D6faDvqGiRD5g231h04N9otKKhmpsWolA2a/ys2BTZD3POx29KNCGGwvon
 rqbEXw+izw0oLt8nyONEyDJ0FQEzYNg3U3XCwhcafeEAwjXPl/qShu2jZqWKJpckQbpZfrxMBP5
 RAjMWIalnaE9hAQGspLSNAatkA1Dp/mAA7/zZFc2+mRr3BzsnRMOHZNJoIxQWwdAmXAHjdy4nvC
 cUHwu1MetM2WGhE9cNzEB84RdpIc59o68meuQ4a0odTAt2r2yIdpcLSgQIGgefFrYhCstjzFy8/
 hIWLbWwxUfP6l3Ie0u09nLOHn8/tHETnuZ4soTrvi7bBIsBIhgibrnFyefgrRPUdl+g5vkZbS87
 xoqIjxnjwBJYD7QrIw04iFmCSArVo1bjZ8piHoXzCmwDJhI4rc326Lm5pO8ivgdz7o/i8UiBEF3
 MywNzDyTMwsUjle/HG2/Z5lhRpT+Chm5BCjtirWXP3EAp0h1wJcsH8AF1avryc5CqDVIBBU6kc5
 sweGcqQFhTo5Ra5bDr2K9LENRjSmkHwzmHFnipDJph8IELNzuEdGGeba2EGzaszhlCzmTENVrbb
 vx9a86rmbiUuivhvyCcNbH8dRQG7mvTc3kLjBaRKM8UmIVKm95dXUMV9sYrIm0rJurciOILvVyx
 gsvtgtvLv6p7qBA==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Subject: [PATCH v2 0/3] Rust GPUVM prerequisites
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

See v1 for the Rust code that uses these C changes.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (3):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs

 drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----------
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
 drivers/gpu/drm/xe/xe_vm.c             |  4 +-
 include/drm/drm_gpuvm.h                | 12 ++---
 8 files changed, 76 insertions(+), 49 deletions(-)
---
base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

