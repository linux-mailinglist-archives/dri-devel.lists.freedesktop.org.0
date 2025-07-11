Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9899B026CF
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 00:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63B10EAD4;
	Fri, 11 Jul 2025 22:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JMz9QHEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD2710EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 22:11:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso20535455e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752271888; x=1752876688; darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMZOK0zGE3QkqzeUwZ/9p4zQ/N/Yvn8raXUpAZ5Ygfs=;
 b=JMz9QHEyFmn8DigTr50AgLOH8pwcUx2gGHULcvt9w/nY+QsiR6XU/EvpV8YHXcY9Bh
 mZxvmapTEpYgVgCaWTE3LBSsKrUHHXKnOMkV4Yge/EDkHQdsnM9enKjti48Mh+XjPUQk
 XFiXOKyhrad1VW7oMijCPOQqNixbg9rdPMLZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752271888; x=1752876688;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMZOK0zGE3QkqzeUwZ/9p4zQ/N/Yvn8raXUpAZ5Ygfs=;
 b=tvusCKQrUifYD0qO9KPvn/ckzUa+l8jOX13XDkoqrIQq/OF0k1PyDapfqcDQcbV3Mi
 hovMzyirbvRavy02eGSNJEkTvMc3l40UT1sHThZ9PYOeWoMlckpTg8DsAdUZ8rtp2Qze
 Re5mZvxcf/ZZIxV0RH1spUfvy6C+qhOj81ZNRNuw4O/UDP8sH5C9uE8E41x+thvaX6p1
 Tr22qM31aKf3eO0DqHQi9U5/+TudJ9bf822Pfs41kuQYPuysi3QjO8u0Odj9h2nYAFuz
 WKJ4BdRpagyYvJ1ZOtyc8JZskuKz9cNOad6Ur49dH8HFWvB/PriLa2hiKvKRidbsrgjB
 cEMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrDrx7klISqWyiIRePHGPjgsP4+UCEVBuOuYbLp8J1hEKJZk8NdGYZ+D7F5jNkXtg2U7v7OKs6+Tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2Qwkdy2fbG0MQ0ciNoDQ3tYlGUlnv0YfIBzW3DnGbaWwZLXLN
 iguAs+CkaaA6/TVqasQVXX950QdqZB7lAmfTr+XRcAHioI9QMGFqcOmfAQFOVyHmt6E=
X-Gm-Gg: ASbGncsiFXuJ58Z1qNqZUMcYBMp04SC/lR0fAGGTUjuQcg8ecW+gYsvHHzmTjUAYja+
 IGE0uEhKxmwUUU/ILAyqLmYQprmIScDexRLyAOUkWWnwmBtXiUkE8dCkOJKVyDK/fpBsIkhLEym
 a91V85o084fzO08tYjH0ciKAUQai+oUNpPtQLo9HAhH3zFoSeqnae4ENhRWBjtxuk+NwczjGf6P
 JfCYln2PC1pePRWU5uUZwQBYgtAWc95//xZElF1hST64Jft6PPhwg4fKyzfNbytdh8iHZlzuFBj
 Ldr6pyb/CdNQYTTIaESXneKloknaH8EzApcr+WV3QRvdnxR6iF8FnvKXJVBq5txl2aovOROhvgq
 i/V5wMzWG8Qkr18VYL+i/lBEB70mIwF4lbmtje/sWkV/Q
X-Google-Smtp-Source: AGHT+IENs36yvqEFOzAaZMmMAzahdZcvrKbkWM9wENAz8j26+W7id5gTIuIu7J6ieHmuNJ8X1FqSxA==
X-Received: by 2002:a5d:5f88:0:b0:3b5:e077:af24 with SMTP id
 ffacd0b85a97d-3b5f2dc21famr4032648f8f.14.1752271887721; 
 Fri, 11 Jul 2025 15:11:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd4b32d8sm58626325e9.17.2025.07.11.15.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:11:27 -0700 (PDT)
Date: Sat, 12 Jul 2025 00:11:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-fixes for 6.16-rc6
Message-ID: <aHGMDdZNDhjND0iT@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 6.12.30-amd64 
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

Hi Linus,

The much-anticipated handle_count regression fix from -rc5, but as
discussed, not the pile of reverts - we'll go with what we have for at
least this rc to not rush into yet another issue. The
gem_handle_create_tail fix is another one that's a bit more tricky, but
not something legit userspace will ever hit. Otherwise just the usual pile
of small driver fixes as expected.

Next week should be back to Dave.

drm-fixes-2025-07-12:
drm-fixes for 6.16-rc6

Cross-subsystem Changes:
- agp/amd64 binding dmesg noise regression fix

Core Changes:
- fix race in gem_handle_create_tail
- fixup handle_count fb refcount regression from -rc5, popular with
  reports ...
- call rust dtor for drm_device release

Driver Changes:
- nouveau: magic 50ms suspend fix, acpi leak fix
- tegra: dma api error in nvdec
- pvr: fix device reset
- habanalbs maintainer update

- intel display: fix some dsi mipi sequences

- xe fixes: SRIOV fixes, small GuC fixes, disable indirect ring due to
  issues, compression fix for fragmented BO, doc update

Cheers, Sima

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-12

for you to fetch changes up to b7dc79a6332fe6f58f2e6b2a631bad101dc79107:

  Merge tag 'drm-misc-fixes-2025-07-10' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-07-11 14:11:19 +0200)

----------------------------------------------------------------
drm-fixes for 6.16-rc6

Cross-subsystem Changes:
- agp/amd64 binding dmesg noise regression fix

Core Changes:
- fix race in gem_handle_create_tail
- fixup handle_count fb refcount regression from -rc5, popular with
  reports ...
- call rust dtor for drm_device release

Driver Changes:
- nouveau: magic 50ms suspend fix, acpi leak fix
- tegra: dma api error in nvdec
- pvr: fix device reset
- habanalbs maintainer update

- intel display: fix some dsi mipi sequences

- xe fixes: SRIOV fixes, small GuC fixes, disable indirect ring due to
  issues, compression fix for fragmented BO, doc update

----------------------------------------------------------------
Aaron Thompson (1):
      drm/nouveau: Do not fail module init on debugfs errors

Alessio Belle (1):
      drm/imagination: Fix kernel crash when hard resetting the GPU

Ben Skeggs (1):
      drm/nouveau/gsp: fix potential leak of memory used during acpi init

Danilo Krummrich (1):
      rust: drm: device: drop_in_place() the drm::Device in release()

Dave Airlie (1):
      nouveau/gsp: add a 50ms delay between fbsr and driver unload rpcs

Hans de Goede (1):
      drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too

Julia Filipchuk (1):
      drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2

Lucas De Marchi (1):
      drm/xe/guc: Default log level to non-verbose

Lukas Wunner (1):
      agp/amd64: Check AGP Capability before binding to unsupported devices

Matthew Auld (1):
      drm/xe/bmg: fix compressed VRAM handling

Matthew Brost (2):
      drm/xe: Allocate PF queue size on pow2 boundary
      Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"

Michal Wajdeczko (2):
      drm/xe/pf: Clear all LMTT pages on alloc
      drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF

Mikko Perttunen (1):
      drm/tegra: nvdec: Fix dma_alloc_coherent error check

Ofir Bitton (1):
      MAINTAINERS: Change habanalabs maintainer

Shuicheng Lin (3):
      drm/xe/pm: Restore display pm if there is error after display suspend
      drm/xe: Release runtime pm for error path of xe_devcoredump_read()
      drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()

Simona Vetter (4):
      drm/gem: Fix race in drm_gem_handle_create_tail()
      Merge tag 'drm-intel-fixes-2025-07-10' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-07-11' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-07-10' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Tamir Duberstein (1):
      rust: drm: remove unnecessary imports

Thomas Zimmermann (1):
      drm/framebuffer: Acquire internal references on GEM handles

 MAINTAINERS                                        |  2 +-
 drivers/char/agp/amd64-agp.c                       | 16 ++++----
 drivers/gpu/drm/drm_framebuffer.c                  | 31 +++++++++++++-
 drivers/gpu/drm/drm_gem.c                          | 48 +++++++++++++++-------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       | 16 ++++----
 drivers/gpu/drm/drm_internal.h                     |  2 +-
 drivers/gpu/drm/drm_panic_qr.rs                    |  2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  8 ++--
 drivers/gpu/drm/imagination/pvr_power.c            |  4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  6 +--
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |  5 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 27 +++++++++---
 drivers/gpu/drm/tegra/nvdec.c                      |  6 +--
 drivers/gpu/drm/xe/xe_devcoredump.c                | 38 ++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  1 +
 drivers/gpu/drm/xe/xe_lmtt.c                       | 11 +++++
 drivers/gpu/drm/xe/xe_migrate.c                    |  2 +-
 drivers/gpu/drm/xe/xe_module.c                     |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                        |  1 -
 drivers/gpu/drm/xe/xe_pm.c                         | 11 ++---
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  6 +--
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |  4 +-
 include/drm/drm_file.h                             |  3 ++
 include/drm/drm_framebuffer.h                      |  7 ++++
 rust/kernel/drm/device.rs                          | 12 +++++-
 rust/kernel/drm/driver.rs                          |  1 -
 27 files changed, 187 insertions(+), 89 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
