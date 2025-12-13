Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4588CBA2DE
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 03:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8D10E047;
	Sat, 13 Dec 2025 02:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fWdTDoA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1810E047
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 02:14:57 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8824ce98111so26324326d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765592097; x=1766196897; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ghR8RkkMCcQ7QXimfUpYMa2GwrJ+aLnHU5odT5vzyL4=;
 b=fWdTDoA2evc+TK77vxSYWj1WRIQ21OVWeOt/MYg4W/fU6mN0mO3nh2Zzo0XavwvpJ8
 vD/X0jLSWiRWZAdwoB9KW455WImMlR/GPlwwWL9EdewOAIvnlAXskM0hC3RZ9rewZcWk
 KA1I88ojD4ZiY30n//YUNuOU0Wf4UWtx0b8FdxcxpJ3Xep046DE76weWOdINNYpvkmu+
 96cMjoNuRP5DLn5C6JDsUrmFZGYHjTR2ijlilbPPR/y1YRi6OkIn3jJCIP8pcHyiDi7H
 I+1CcyDptg0Lj8C3BqZg/MpiCQyJAGepJquDzBGL9E6oPTQUl3nO4qxwI2gmho4UceuK
 Gx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765592097; x=1766196897;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ghR8RkkMCcQ7QXimfUpYMa2GwrJ+aLnHU5odT5vzyL4=;
 b=VBD4bZdOdjy7BvPrdhDyxYBUau18T0OPVnXt3vjyjg7n23aU1jZ+CB0OmmMmsHp0Nt
 9IbZkt1zYh+Re++r74QbFyniWYS8eXx3qbUiQQHK7+1dFqPXBToZLoTUAISK6ifdFkPs
 w9bklAVyNKwWVUKahin4LzTW/SNNi8qYtycEVPqfE8y0657DS44DSqjNq4szTrCI2u2N
 c7E7bieiwjVgk+E8fjVZYkYoVUWEGeY31xsyh1SfPSPnU5Bzcv1c2vbImvqlWpg3DJ84
 dxHomR5k16CdG6mUCDN7Hn1BzXx97le/1PokLA9IkRAMoDWcuJiNmFvRSrbg0QIeR5zB
 xiag==
X-Gm-Message-State: AOJu0Ywrr6PYFXCrq0l1IXxQxJkMzPEqjIqsG+MyUEZ3lnscMRE1+yxh
 joOYx9VfUKGBggyi8dqb2gLwB19IVAnXX7Kq3TmXWzm1qmHJ4fd8SmUkeiLrNhXzzOWWbAQS2pv
 U1tyqck4eAZPdyc4NoRnK0phJDJ1CqIs=
X-Gm-Gg: AY/fxX7ypcTd6WnLDeeoCdm0NwcZpVPXr4zrqRAGnC7BBCRwVmuoRw0M21/zjNx3B2P
 yBAur30+VZrHGWHra0WBq5/ZJ8Lqew0II00JaQF7m95OMFht4FSAQjII43TiezQ55BXZluG2gB5
 YTGOuquoIqFWu0ft3vOoAiALAG2+zrim2ZePBW2pY2of23/Os80d81w4k/16LN42Vvr7sXJP5hK
 bSL/1aYj9blBmx0B7U1By4wXqM+MwDAUSS+aLJYlMIQoLsLlg4rGYhX//VoMdvQ00Mfr18Mgw==
X-Google-Smtp-Source: AGHT+IGIlOSNlzc8qiSs3e5iKVh0nRB77dGU8VQ7GKp+XaD2yDo4Y1PsPkjcTt09AMUaidXGGC4J2qVXL1YQ42AahGE=
X-Received: by 2002:ac8:59c9:0:b0:4f1:b3cc:2d04 with SMTP id
 d75a77b69052e-4f1d05af1f0mr60791351cf.44.1765592096595; Fri, 12 Dec 2025
 18:14:56 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 13 Dec 2025 12:14:45 +1000
X-Gm-Features: AQt7F2qvZDhlb2zzwUZIah-GJWRSwpoCfIEbcdtQ_R45LDvm9qH7YA5eHsc_zkI
Message-ID: <CAPM=9twB2eNZdfk2gZ1Tp1vnCKrsKNKz0s=3B3ZV_FFF66H0Eg@mail.gmail.com>
Subject: [git pull] drm next fixes for 6.19-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is the weekly fixes for what is in next tree, mostly amdgpu and
some i915, panthor and a core revert.

I've got a separate fixes pull after this as well that is from the 6.18 base.

Dave.

drm-next-2025-12-13:
drm next fixes for 6.19-rc1

core:
- revert dumb bo 8 byte alignment

amdgpu:
- SI fix
- DC reduce stack usage
- HDMI fixes
- VCN 4.0.5 fix
- DP MST fix
- DC memory allocation fix

amdkfd:
- SVM fix
- Trap handler fix
- VGPR fixes for GC 11.5

i915:
- Fix format string truncation warning
- FIx runtime PM reference during fbdev BO creation

panthor:
- fix UAF

renesas:
- fix sync flag handling
The following changes since commit c7685d11108acb387e44e3d81194d0d8959eaa44:

  Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-12-05 10:27:57 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-13

for you to fetch changes up to 37a1cefd4d4e0b3d12f140e8a265757444fa6957:

  Merge tag 'drm-intel-next-fixes-2025-12-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-12-12 18:57:44 +1000)

----------------------------------------------------------------
drm next fixes for 6.19-rc1

core:
- revert dumb bo 8 byte alignment

amdgpu:
- SI fix
- DC reduce stack usage
- HDMI fixes
- VCN 4.0.5 fix
- DP MST fix
- DC memory allocation fix

amdkfd:
- SVM fix
- Trap handler fix
- VGPR fixes for GC 11.5

i915:
- Fix format string truncation warning
- FIx runtime PM reference during fbdev BO creation

panthor:
- fix UAF

renesas:
- fix sync flag handling

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Prevent potential UAF in group creation

Alex Deucher (2):
      drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
      drm/amdgpu: don't attach the tlb fence for SI

Alex Hung (1):
      drm/amd/display: Refactor dml_core_mode_support to reduce stack frame

Ard Biesheuvel (1):
      drm/i915: Fix format string truncation warning

Dave Airlie (3):
      Merge tag 'drm-misc-next-fixes-2025-12-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.19-2025-12-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2025-12-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

Dibin Moolakadan Subrahmanian (1):
      drm/i915/fbdev: Hold runtime PM ref during fbdev BO creation

Ivan Lipski (1):
      drm/amd/display: Improve HDMI info retrieval

Jay Cornwall (1):
      drm/amdkfd: Trap handler support for expert scheduling mode

Jonathan Kim (1):
      drm/amdkfd: bump minimum vgpr size for gfx1151

Ludovic Desroches (2):
      drm/gem-dma: revert the 8-byte alignment constraint
      drm/gem-shmem: revert the 8-byte alignment constraint

Marek Vasut (1):
      drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
!DRM_MODE_FLAG_P.SYNC

Mario Limonciello (2):
      drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
      Revert "drm/amd/display: Fix pbn to kbps Conversion"

Mario Limonciello (AMD) (1):
      drm/amd: Fix unbind/rebind for VCN 4.0.5

Rosen Penev (1):
      drm/amd/display: shrink struct members

Xiaogang Chen (1):
      drm/amdkfd: Use huge page size to check split svm range alignment

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  62 ++++++----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  37 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  46 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  59 +++++----
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   2 +-
 .../drm/amd/display/dc/dml2_0/display_mode_core.c  | 134 +++++++++++----------
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   3 -
 drivers/gpu/drm/amd/display/include/audio_types.h  |  14 +--
 drivers/gpu/drm/drm_gem_dma_helper.c               |   2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  11 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |  19 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 20 files changed, 267 insertions(+), 152 deletions(-)
