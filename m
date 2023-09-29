Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C27B2A2D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 03:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D4810E0B8;
	Fri, 29 Sep 2023 01:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A9910E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 01:46:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b27bc8b65eso1191030066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 18:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695951984; x=1696556784; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wjUlQwEjtZqxZu1kpUu5uRZmclkQBq6AV4M8yVChIbs=;
 b=LrE3is+j5tnU3ojRWMaE9dan9OeuNg8IB56zA9kYCbVYLk6QFcIAHgZrurGn9Mkhvz
 WAavd/r5oq2MRwxQQyLiDS77+46itksCS+zdShPDxCqTtibR0bOcIvtBy2bLnh1UmQKU
 QyLSaMuubyGQK4YVgIymQc6qk71PVY1ebwTvG5IcwQVNY01JhupU7jdTshKf9tsz9LpX
 EVJ2WsRcXM30XLAz+7j2/gNQ/7f+bQLyRfAQvVR7GAQbTw4ruJRvKOjYV+broNHexDpo
 EYHjqZYITy1F2k87KXWbixVW4UVUA94Bm7nuLG4v0XRA1fcPJ1qbhVRl3ft4CPzRn0dv
 EllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695951984; x=1696556784;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wjUlQwEjtZqxZu1kpUu5uRZmclkQBq6AV4M8yVChIbs=;
 b=ecLxjFCs+viujjbsrNlRwLNTOTh26nI6V+b6bzOFqNo1OGBxM24D1GgnLmOEur2TYo
 hbhNMSLpV994/fDFvGvL8uPsa5pxARwo8zMjZqLMtSgLHW3hSt9np0oI61pKQWW7N2+e
 8PgVkCTZTUtJ66SQoF3bXldudk9vz9zUJnj3K98Jph0fUe3y02yL4KwDW73wszhfS49Q
 oK5noVUVmXqj6z2BO874eDydRXYgzg9yP2NTIpy4xNDxiLyl4QBxzcJ2SRtbfgUGlaZX
 Af3DPVvNix2XrXm4nkYmmqg7PcuKxHhbwQ4OnxK/cefyqkZ/mAB/1fmZA4OtQF8bdjbN
 zOew==
X-Gm-Message-State: AOJu0Yzfmhap0DSrIHDFozzJ5zG6vdLTjYHSxMwkWq1jVrhk/zcv/IG2
 oXVsfuQWNpTwYGLT8WWcsWs8H9tSWVt+fDXuMp4=
X-Google-Smtp-Source: AGHT+IG2KqTMcUpCdlErMwRz6hm4et4Spza854iJ+jKDKEAqLuSC7NzdrY9evQ7GP66ES+T5kBGHyeSkgIljsWjx/hk=
X-Received: by 2002:a17:906:3cb1:b0:9a5:852f:10bd with SMTP id
 b17-20020a1709063cb100b009a5852f10bdmr2468967ejh.62.1695951983947; Thu, 28
 Sep 2023 18:46:23 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Sep 2023 11:46:12 +1000
Message-ID: <CAPM=9twU2jO7zfje1XSmW55VnyKxWenszkLRFi-yLX7hQNG2+A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Regular pull, this feel suspiciously light so I expect next week might
be a bit heavier? lets see how we go. This is from a code point of
view ivpu and i915 fixes.

The only other patch is adding Danilo Krummrich to the nouveau
maintainers, he's agreed to take on more of the roll after Ben
retired.

Regards,
Dave.

drm-fixes-2023-09-29:
drm fixes for 6.6-rc4

MAINTAINERS:
- add Danilo for nouveau

ivpu:
- Add PCI ids for Arrow Lake
- Fix memory corruption during IPC
- Avoid dmesg flooding
- 40xx: Wait for clock resource
- 40xx: Fix interrupt usage
- 40xx: Support caching when loading firmware

i915:
- Fix a panic regression on gen8_ggtt_insert_entries
- Fix load issue due to reservation address in ggtt_reserve_guc_top
- Fix a possible deadlock with guc busyness worker
The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-29

for you to fetch changes up to 06365a04fd32af25f90d8ccb4fecdda1f0e1ab78:

  Merge tag 'drm-intel-fixes-2023-09-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-09-29
10:28:21 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc4

MAINTAINERS:
- add Danilo for nouveau

ivpu:
- Add PCI ids for Arrow Lake
- Fix memory corruption during IPC
- Avoid dmesg flooding
- 40xx: Wait for clock resource
- 40xx: Fix interrupt usage
- 40xx: Support caching when loading firmware

i915:
- Fix a panic regression on gen8_ggtt_insert_entries
- Fix load issue due to reservation address in ggtt_reserve_guc_top
- Fix a possible deadlock with guc busyness worker

----------------------------------------------------------------
Danilo Krummrich (1):
      MAINTAINERS: update nouveau maintainers

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2023-09-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-09-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Jacek Lawrynowicz (1):
      accel/ivpu: Don't flood dmesg with VPU ready message

Javier Pello (1):
      drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top

Karol Wachowski (4):
      accel/ivpu/40xx: Ensure clock resource ownership Ack before Power-Up
      accel/ivpu/40xx: Disable frequency change interrupt
      accel/ivpu/40xx: Fix missing VPUIP interrupts
      accel/ivpu: Use cached buffers for FW loading

Matthew Wilcox (Oracle) (1):
      i915: Limit the length of an sg list to the requested length

Stanislaw Gruszka (2):
      accel/ivpu: Add Arrow Lake pci id
      accel/ivpu: Do not use wait event interruptible

Umesh Nerlige Ramappa (1):
      i915/guc: Get runtime pm in busyness worker only if already active

 MAINTAINERS                                       |  1 +
 drivers/accel/ivpu/ivpu_drv.c                     |  3 +-
 drivers/accel/ivpu/ivpu_drv.h                     |  2 ++
 drivers/accel/ivpu/ivpu_fw.c                      |  8 +++--
 drivers/accel/ivpu/ivpu_gem.h                     |  5 +++
 drivers/accel/ivpu/ivpu_hw_40xx.c                 | 28 ++++++++++++-----
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h             |  2 ++
 drivers/accel/ivpu/ivpu_ipc.c                     | 11 +++----
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c         | 11 ++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c              | 23 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 38 +++++++++++++++++++++--
 11 files changed, 100 insertions(+), 32 deletions(-)
