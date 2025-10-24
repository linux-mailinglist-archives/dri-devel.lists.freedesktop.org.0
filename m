Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104FC08227
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE9A10EB3F;
	Fri, 24 Oct 2025 20:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TGtsRaKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565D10EB44
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:58:59 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so20659485e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761339537; x=1761944337; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtLfn8FJtqlvARmUmpRqk3iH9kDF4BPeI9fdVEa1U6A=;
 b=TGtsRaKV/xkwnSgphUecQv/aO//NoD2TeaMT4RD+JwTaPwm6ZxVrxBF+A1/lLCLHrg
 POzV+cMLeTp1KOpNv2R8zdsS3ZKmNnGq2GwE2iOqNVLHFuhdijS0MopriE1VqlXPwY9E
 SMBz0Me59kxxi+xIIYNCoO3z5BfL+6BihsHyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761339537; x=1761944337;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtLfn8FJtqlvARmUmpRqk3iH9kDF4BPeI9fdVEa1U6A=;
 b=DlGteWtKIrAyAJkr+lVCIBqjBj+GS3fSiMRnhontMH6MAbMraZBsOhcbInvjh6tyud
 EEzJBFpJZEmI7TVp4K/KYOdXPR9chUeT36tlSgkpPVtDvIcKwvyZkTZYRLWTsDSJp/zI
 O47fECDPK26jmmfuNSvSU74NDJ67NgYlWbR5qi7LOEzOo5h+ZnMCEPksfzZ+637psYYu
 s80FCG/xnS90YmhQPIxnKVEF7f3exGEXRA0qINYqh53e6vX78BDVGE8QTIs2dJoSYM4y
 qTTOzJZpvs6OoSeE4eXXcBMCbFIuLY1+GRTueCBwW9l0yOfebKKwYRDVKOd3K31NMbpw
 OxuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUukYQXASe5AlD0DExBtrIsK3f6QBvmspPuyD4WAnz1+BNc7ev9MEYeM68ri7LT78NWvHLkcomkXbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGNPP8MAiohxQHeAmt/9NHgtrsMQgh3eqb1020yC0dvLTWh4t/
 6LKciB/rwKcqQ/z7lGtSLpGVVDZncV28Xvyiels+lujEFUb6N1TE2NLJntmSWBFmR8Q=
X-Gm-Gg: ASbGncsLOHUJPlAxGl+yok5l34YbMq3BzroXJT5ooZdBUMr0+FQlQTig8pvNe7a9kMW
 V3SyiaLRRcJFZC48lJix48eK9s3fqX0JwG1hbhAUFq/8LFE3AE4HW8EYAr0xlQ9THJxVbL1kNNU
 rcdceiBUooWj/+6zFaZXxsp2unY0k06t+V7WCw0g4bRMnghgDZ/mvs96mdmG4vguQGNjkR9njec
 EjdbjTc1wDoy3X4zwjsNrV0EbBRHjfjxcaWBaJWFokNYEJGClFarzaMy6vBENuCdyXGjvQ7M2Rg
 NlPBp20X3CK0XjHsGYYiBayTuK/UE7qFFNrG69Rhm7H4Am07C4pWeByxhDcmSaMjM02MQ8vJbHo
 GlHeop1C2OcIrLQ8e1y5yUYhGWsW0gSIgGKAnttzXB/LKN/JiRB6VoLe5CDLi6CF8WsOj1TCQNV
 d2nc7bkXBMENaIlpLtZSYnKg==
X-Google-Smtp-Source: AGHT+IFouaNi4btVpzaPutAtdKRahw851DTPgHr7NokdJllOOD6EswA132FiLK1g0REt+rMNyIvegg==
X-Received: by 2002:a05:600c:1d9b:b0:46f:b32e:528f with SMTP id
 5b1f17b1804b1-4711787639amr215959405e9.5.1761339537409; 
 Fri, 24 Oct 2025 13:58:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02cd6dsm1540155e9.2.2025.10.24.13.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 13:58:56 -0700 (PDT)
Date: Fri, 24 Oct 2025 22:58:54 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-fixes for -rc3
Message-ID: <aPvojo5uhoAatX2Y@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

Very quiet, all just small stuff and nothing scary pending to my
knowledge.

On the Link: tag discussion there's now an open MR for our tooling. By the
time you see this it might already be merged, so hopefully starting next
week we'll see patches show up in drm with the new style. But it'll
probably take some time until it's percolated to everyone:

https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/94

Cheers, Sima

drm-fixes-2025-10-24:
drm-fixes for 6.18-rc3

- drm_panic: bunch of size calculation fixes
- pantor: fix kernel panic on partial gpu va unmap
- rockchip: hdmi hotplug setup fix
- amdgpu: dp mst, dc/display fixes
- i915: fix panic structure leak
- xe: madvise uapi fix, wq alloc error, vma flag handling fix

Cheers, Sima

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-24

for you to fetch changes up to 18b1ce0b29c41833363b58ad030b76dabf984899:

  Merge tag 'drm-xe-fixes-2025-10-23' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2025-10-24 13:39:21 +0200)

----------------------------------------------------------------
drm-fixes for 6.18-rc3

- drm_panic: bunch of size calculation fixes
- pantor: fix kernel panic on partial gpu va unmap
- rockchip: hdmi hotplug setup fix
- amdgpu: dp mst, dc/display fixes
- i915: fix panic structure leak
- xe: madvise uapi fix, wq alloc error, vma flag handling fix

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Fix kernel panic on partial unmap of a GPU VA region

Alok Tiwari (1):
      drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228

Aurabindo Pillai (1):
      drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler

Charlene Liu (1):
      drm/amd/display: increase max link count and fix link->enc NULL pointer access

Jani Nikula (1):
      drm/i915/panic: fix panic structure allocation memory leak

Jocelyn Falempe (6):
      drm/panic: Fix drawing the logo on a small narrow screen
      drm/panic: Fix overlap between qr code and logo
      drm/panic: Fix qr_code, ensure vmargin is positive
      drm/panic: Fix kmsg text drawing rectangle
      drm/panic: Fix divide by 0 if the screen width < font width
      drm/panic: Fix 24bit pixel crossing page boundaries

Matthew Brost (1):
      drm/xe: Check return value of GGTT workqueue allocation

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix NULL pointer dereference

Simona Vetter (4):
      Merge tag 'amd-drm-fixes-6.18-2025-10-22' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-10-23' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-10-23' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-10-23' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Thomas Hellström (2):
      drm/xe: Retain vma flags when recreating and splitting vmas for madvise
      drm/xe/uapi: Hide the madvise autoreset behind a VM_BIND flag

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  8 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  3 +-
 drivers/gpu/drm/drm_panic.c                        | 60 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_fb.c            | 25 +++---
 drivers/gpu/drm/panthor/panthor_mmu.c              | 10 ++-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  3 +
 drivers/gpu/drm/xe/xe_pt.c                         |  4 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  5 ++
 drivers/gpu/drm/xe/xe_vm.c                         | 96 +++++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h                   | 10 +--
 include/uapi/drm/xe_drm.h                          | 15 ++++
 14 files changed, 153 insertions(+), 95 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
