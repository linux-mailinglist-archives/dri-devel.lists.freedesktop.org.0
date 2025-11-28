Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7364C923B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 15:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859A10E911;
	Fri, 28 Nov 2025 14:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uQXUmH+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E962C10E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:29 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4775d8428e8so14470875e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764339268; x=1764944068;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zhHL3BMFDuZhN/57WOJfnY5bammkP52DxCSg9ZesAV8=;
 b=uQXUmH+Mfj3/6Z2bTyWk6TTgd9HuCyn8FiMqBd6BHkJeL4FYYoanbKsRL/7LW9lVQs
 FNItmlt89QwZHP1YUy3VYzlOQgIPRB2JUlYxpKZVLbAjSrky2V1Svhgwb5PEZOxVHUSr
 rIH8shk3Uh+Ja0ctQajq/jKvNyMiBfjndUhpMaS3EV8qZV/M5BDnR/79XFgkb8BiJPUF
 DrNU0qw777uNxy+IkWcRjdZ3hMCLtxOwlSv7ashJCR2UZqzKkDvHrMU0hl+QB1rg9E9K
 SQDGUERvYxrf/uGdo90NG0yNit0+roqUjOiRxlhcS5wK83KUwqqW15xU276fDcOweA9J
 yb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764339268; x=1764944068;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zhHL3BMFDuZhN/57WOJfnY5bammkP52DxCSg9ZesAV8=;
 b=h605wzqUATt1FCLtV6ygt+l4WzugqkVf0uXlGh3YQMM52E9lGXWeG7wLVWAuX8dbhL
 gebkfcw6MdYWkQBOaVhye/cxlFXfLJX3pgYuC3G87XnfMRDD4lOgi5cG+PbGa+wQXlmZ
 hnqOeUmLjDjHQ4fcfj0y4nw9wFB/b8Tig9xfQsjN6X6pS84kxHjg7QoylHiSc4b2mJ1q
 YafAWwXdS3/LRAV1ucDIq0HwqAkY27GZ775Sz2mlhRLXaTIIZkLG0zjT3FYhMLpZcOvV
 1WSXAMb/0eY+A+BJ/GdtV+Mikie0Qs9/GYZWXmOftUoSkTfw12pO99JorUkjmhey7/i1
 Ui9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJCJYoHsYW3etBq1O3H8tJFEQiPz5VBIMI57Xle8riRFEKjL2sW7zYFBPLmWky1vjDS85Zv88oHp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZKv0SOa8LghhqQWXz37XY+ENSGCVUqcsoUt3x7m9BvkJgdFcr
 b5Pd0NFNLWz4rWati10YiEuamM5xSvX+2uflIpFcAMqT2y5ZtEneCeBaYZVZPY1gL21F30g7E7y
 XSGiV23RnIj1G5B5fkg==
X-Google-Smtp-Source: AGHT+IGWyokfoxvVAeT84HHEwKkD03sQllI97v9KLdFvEaRTwW3WBOhmDf1Nxj/s6YQQl7dQASa85gm3ScQahxM=
X-Received: from wmbjq9.prod.google.com ([2002:a05:600c:55c9:b0:477:5c35:1b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1994:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-477c0176437mr295297385e9.4.1764339268358; 
 Fri, 28 Nov 2025 06:14:28 -0800 (PST)
Date: Fri, 28 Nov 2025 14:14:14 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADauKWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3fSC0rJc3aLS4hLdJHNDy+TEZCPzxBQzJaCGgqLUtMwKsGHRsbW
 1AINOf21cAAAA
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=YUJy7negUaDa3i/z93UmgA296mGxFrrof52RqnC+Knc=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpKa4+Ob9zfXNKSCD2DFuIEJCWhazHrkpyvwSJo
 grxNOXFGJaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSmuPgAKCRAEWL7uWMY5
 Rs2LD/0QRiHXFNcsZ2UklzNBRGR+4GXh5VPmeo0TsfZfMCGPmTcBU9l1WecM8NywQUPp8ZomNB/
 rwHrXrvSsnUse/tDhhhk/e9OTimR8oPwJeESKrQv9nz6zzeAjX659YQu500CDt/WT2t2jsjjEAl
 CNtQRslkrFsfdypRq9MpxlittBcgMxXK/e0fJhVNpxGxYnk2pWI871g28GawhxjNJyrGBlf/g7g
 fUSepFjOCu3Xkho19aoO7I5fVZxjjbTG0EKs55RHfX1gwkmEO7aWO5kf4uhoemwqS2fHAvVeFNa
 BdVUXvDpPHF+pykOAyiNApNvuEwnYy9L1DhrctFxYr9YBQBo9G6kNvV/vi7ayj8vfTW5j55mFOz
 Id04xAmbps5UenSTRvSs3wNbVeT9ucvdli2v6FZEg5xrtxLg+vxNLgbR4+GwhHqfGlxOGW6ha6s
 cvrA4DL9Qgo7r1+bcqCAJuCDq0myOvN2O2j5cYQ7Z0DyYd2DKRpbxWsnVujocaMxY1/m2rMr4vj
 GYY+V3U+U2BdvMWNUWdYUvtgtQcpyefH1P1JcV1EzsB33B4TZx+UcIDUiliWIB7+4cfURnadtVI
 VUx0tRJwBnfii0nwY4yFFNBjzHPStgTKBzg6kfBXZ8Gfy6covgoZ8LEjfSTYaRUYArQyGr89AyP
 eGFLCahwk9vk6AA==
X-Mailer: b4 0.14.2
Message-ID: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
Subject: [PATCH 0/4] Rust GPUVM support
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
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina+kernel@asahilina.net>
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

This makes a few changes to the way immediate mode works, and then it
implements a Rust immediate mode GPUVM abstraction on top of that.

Please see the following branch for example usage in Tyr:
https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/53

For context, please see this previous patch:
https://lore.kernel.org/rust-for-linux/20250621-gpuvm-v3-1-10203da06867@collabora.com/
and the commit message of the last patch.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (4):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs
      rust: drm: add GPUVM immediate mode abstraction

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/drm_gpuvm.c            |  80 ++++--
 drivers/gpu/drm/imagination/pvr_vm.c   |   2 +-
 drivers/gpu/drm/msm/msm_gem.h          |   2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  10 -
 drivers/gpu/drm/xe/xe_vm.c             |   4 +-
 include/drm/drm_gpuvm.h                |  12 +-
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/drm_gpuvm.c               |  43 +++
 rust/helpers/helpers.c                 |   1 +
 rust/kernel/drm/gpuvm/mod.rs           | 394 +++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs        | 469 +++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs            | 148 +++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs         | 213 +++++++++++++++
 rust/kernel/drm/mod.rs                 |   1 +
 17 files changed, 1337 insertions(+), 49 deletions(-)
---
base-commit: 77b686f688126a5f758b51441a03186e9eb1b0f1
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

