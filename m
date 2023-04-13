Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317BB6E156D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 21:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960510E00A;
	Thu, 13 Apr 2023 19:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D810E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 19:51:50 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bl22so28650788oib.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681415509; x=1684007509;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=59xyDC9ZSWXV341Wu5FNueXR+XJowtVJP0DizkPdfFs=;
 b=h9jPzG/dcUSmvNi2dPyu84iaDmvWbVQHQVlXKglMJlv167YBUDEm3FpOtlXxt9EaCd
 MtzpzGHTAMLorPU0WONEv6DOwGEIIK0J3mCMAxcLoel7xd3QYAhD9PMqpqrg9lWKXrHu
 lhSlWQq/SS+sv66P1t6xdTedXwVFW5r7jmweA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681415509; x=1684007509;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59xyDC9ZSWXV341Wu5FNueXR+XJowtVJP0DizkPdfFs=;
 b=PUjirq4s20oMH8aiesUAxYbYe2KtpLgbe+THMIZ3kr8h2FWt6nw15coK7Sk+66OTA8
 QIt3e0o4mxi/hlmcXPKidegZ0kQfO649Fpnzj1ypGO1tTb50EKNr0B17oqjtS7fx72sX
 okpbQCjeZR7pL8XsWl6mkA7vEZlyPBADC+43FyQspc0wV9cKlyCmzFr0zciLQ3MEc7nq
 Ce/G4SuIxvsv5++WnY54ilKgJsomSd4HlO/bT/DfMWlR30Dq7a3ITILkdpv9E7x8rdrM
 S66istxZa4jkxf/bx8rVkdiuyrpypGm7XB6L7WwcHLmt2SLz4kPiazhT0RazDrbvtM24
 8GFQ==
X-Gm-Message-State: AAQBX9ej1NFb35wfYd9iQi5MMYTnWwzDT/5/H8yZl9QqICoDAkCbaosT
 BBzCXexljyh/ua1da4MtV/PiUPUljxZPB33P+Hb7h26k27Kc9b+2
X-Google-Smtp-Source: AKy350YRwloX6wrMPpX0c5vx9aI9nT3Rkz9UU+Qv6sNaS8uYAcGc+/V8sEso/1ex7VLILj3PMw+fF58bqdYPBRFPhxU=
X-Received: by 2002:aca:120c:0:b0:38b:f7fa:40ac with SMTP id
 12-20020aca120c000000b0038bf7fa40acmr785143ois.8.1681415509145; Thu, 13 Apr
 2023 12:51:49 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 13 Apr 2023 21:51:38 +0200
Message-ID: <CAKMK7uHy7FMdpEZLu2TTzgnGOrntBcQi_B0c=X+oT_fyUhcTDw@mail.gmail.com>
Subject: [PULL] drm-fixes for 6.3-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

People seem back, still not much.
-Daniel

drm-fixes-2023-04-13:
drm-fixes for -rc7

- two fbcon regressions
- amdgpu: dp mst, smu13
- i915: dual link dsi for tgl+
- armada, nouveau, drm/sched, fbmem

The following changes since commit 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d:

  Linux 6.3-rc6 (2023-04-09 11:15:57 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-04-13

for you to fetch changes up to cab2932213c5cd72a9e04e5e82002e81b946592b:

  Merge tag 'drm-misc-fixes-2023-04-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-04-13
20:47:58 +0200)

----------------------------------------------------------------
drm-fixes for -rc7

- two fbcon regressions
- amdgpu: dp mst, smu13
- i915: dual link dsi for tgl+
- armada, nouveau, drm/sched, fbmem

----------------------------------------------------------------
Asahi Lina (1):
      drm/scheduler: Fix UAF race in drm_sched_entity_push_job()

Christophe JAILLET (1):
      drm/armada: Fix a potential double free in an error handling path

Daniel Vetter (6):
      fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
      Merge tag 'amd-drm-fixes-6.3-2023-04-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-04-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      fbcon: Fix error paths in set_con2fb_map
      fbcon: set_con2fb_map needs to set con2fb_map!
      Merge tag 'drm-misc-fixes-2023-04-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Evan Quan (1):
      drm/amd/pm: correct the pcie link state check for SMU13

Horatio Zhang (2):
      drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
      drm/amd/pm: correct SMU13.0.7 max shader clock reporting

Jani Nikula (1):
      drm/i915/dsi: fix DSS CTL register offsets for TGL+

Karol Herbst (1):
      drm/nouveau/fb: add missing sysmen flush callbacks

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Wayne Lin (1):
      drm/amd/display: Pass the right info to drm_dp_remove_payload

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 57 ++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  6 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 87 +++++++++++++++++++---
 drivers/gpu/drm/armada/armada_drv.c                |  1 -
 drivers/gpu/drm/i915/display/icl_dsi.c             | 20 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c     |  1 +
 drivers/gpu/drm/scheduler/sched_entity.c           | 11 ++-
 drivers/video/fbdev/core/fbcon.c                   | 18 ++---
 drivers/video/fbdev/core/fbmem.c                   |  2 +
 13 files changed, 175 insertions(+), 35 deletions(-)

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
