Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4153B287B1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206C710E9CF;
	Fri, 15 Aug 2025 21:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSMuF6qL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE910E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 21:24:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so405678566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755293086; x=1755897886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+qIOb7MhZrTM3Gz78VAP2PB6SLSWwwc3h6Nvb8V9Yw8=;
 b=fSMuF6qLVXCGtP1JfapIAzyuyrLdqzQ4050Rji05otdqwN5CYg3HwPthWpCx+AoGlL
 /Sh291eXlQD29IkbUh/buT881OdZ2o+01mUWSNjM8zVs0qL+guDqvnwnciJT5BOT6ead
 c7/6JhtOfnZPt7xRyeit052GvzmiNZTZUG8t3V5BeSwZcYavviF48jwkt2VWeO1SK9yM
 BrECJ+6/GUbMIdQc4kavqopid+PEHP9pwCnXS/c31wDY+Xk+iUKo+y0qzbR+rp6NECw3
 UbTRsnheUiszF9w9mNW2FwHbCbtUk/xS8MxqLusJzyoood0W8MPfpFRf4qR/ny9tatXv
 i1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755293086; x=1755897886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qIOb7MhZrTM3Gz78VAP2PB6SLSWwwc3h6Nvb8V9Yw8=;
 b=TDQ4SLTlOuaT6IzEdJW88by16XQpEl33PGAJo/Vkuoq5DsKld2zA9yEi5RztbMRhpY
 Ii8F10wJbhe//aXyWgsbQ0+fEgXuLcWEn+qj/Vn5Ix3MrjlRkxNkGWnJW4G6FZaURVAs
 fzBWFW+aGZJnf2T4D46UMG3bPnsefe40eIxECNqlpB7Q/UVRZ6r4ZO510TooTrEa2rhm
 1kkhOPcLZrgMZnH7s0x/TG1ru+q38vlm7DaDFWwGMORbetJ8p+o7/F4fmPafzVXqzW0o
 T1MhNpl7L4IIT7klh+mp4KcLtRL4LB+XmaDYYNx+TRFWNdxyqJ97C5xH1RpQsEhb4O3v
 Jgvg==
X-Gm-Message-State: AOJu0YwgSU4SqaeV/36qqZk74oiYfpYiIawJMFPYYeq7WrL8U+nHrgwb
 U4f7p0dmHpSnuG6SGDC6TwhF8nBzzARyvLAbPy1df/s/OsaK+G68MKlDWqKbF1bbD9aaL7kZff5
 BpQuQc0W7iUxWpWOFiEY55MYQD/Tsi+E=
X-Gm-Gg: ASbGncsvLOSWqbcMJ2NHlqN6YfyeSSzBr3f4QieB3W2ha9F+7t6J7taZGyJHm4PpsWW
 oQJ0zcjhxH6ORRz2MJhk5NTSvUa+U00Jgyn7+G1MqI0rplp/X8XsyPNHzc/cqkd3zg7TPPE+xde
 9MqLrR2x3Hz8iagQOY6WvLw2+uLotcXnGHurFkVjoa4uTNPtfVl2sNEPzK1mukA/8ZC4vAwOJT4
 Vq1rw==
X-Google-Smtp-Source: AGHT+IE6pRkR/84obWyVnodDN8VDnr+5+cDXMo6Igk/em5zWcMgiul9+ruHVvYBSchwOZOf+qVWqCEldj/tmMZ1NlSc=
X-Received: by 2002:a17:907:3e12:b0:ae0:a483:39bc with SMTP id
 a640c23a62f3a-afcdc3d5787mr334171766b.46.1755293085346; Fri, 15 Aug 2025
 14:24:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 16 Aug 2025 07:24:32 +1000
X-Gm-Features: Ac12FXzcsWgm2tWARMaCU44DETAAph3R26z-4uVWJpMBPaXG3-N6W3_AWU5vGJs
Message-ID: <CAPM=9tyB2nWb_L8DvXFQ3PUo516j2Z6UW9-t3d9o0yBM7TzBuw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Relatively quiet week, usual amdgpu/i915/xe fixes along with a set of
fixes for fbdev format info, which fix some regressions seen in with
rc1.

Thanks,
Dave.

drm-fixes-2025-08-16:
drm fixes for 6.17-rc2

bridge:
- fix OF-node leak
- fix documentation

fbdev-emulation:
- pass correct format info to drm_helper_mode_fill_fb_struct()

panfrost:
- print correct RSS size

amdgpu:
- PSP fix
- VRAM reservation fix
- CSA fix
- Process kill fix

i915:
- Fix the implementation of wa_18038517565 [fbc]
- Do not trigger Frame Change events from frontbuffer flush [psr]

xe:
- Some more xe_migrate_access_memory fixes (Auld)
- Defer buffer object shrinker write-backs and GPU waits (Thomas)
- HWMON fix for clamping limits (Karthik)
- SRIOV-PF: Set VF LMEM BAR size (Michal)
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-08-16

for you to fetch changes up to 00062ea01d35eaca34d561e5c76cd988dc8c3b83:

  Merge tag 'drm-xe-fixes-2025-08-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-08-15 09:50:26 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc2

bridge:
- fix OF-node leak
- fix documentation

fbdev-emulation:
- pass correct format info to drm_helper_mode_fill_fb_struct()

panfrost:
- print correct RSS size

amdgpu:
- PSP fix
- VRAM reservation fix
- CSA fix
- Process kill fix

i915:
- Fix the implementation of wa_18038517565 [fbc]
- Do not trigger Frame Change events from frontbuffer flush [psr]

xe:
- Some more xe_migrate_access_memory fixes (Auld)
- Defer buffer object shrinker write-backs and GPU waits (Thomas)
- HWMON fix for clamping limits (Karthik)
- SRIOV-PF: Set VF LMEM BAR size (Michal)

----------------------------------------------------------------
Adri=C3=A1n Larumbe (1):
      drm/panfrost: Print RSS for tiler heap BO's in debugfs GEMS file

Andy Yan (1):
      drm/bridge: Describe the newly introduced drm_connector
parameter for drm_bridge_detect

Dave Airlie (4):
      Merge tag 'drm-misc-next-fixes-2025-08-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.17-2025-08-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-08-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-08-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Dmitry Baryshkov (1):
      drm/bridge: document HDMI CEC callbacks

Frank Min (1):
      drm/amdgpu: Add PSP fw version check for fw reserve GFX command

Imre Deak (3):
      drm/omap: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/nouveau: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()
      drm/radeon: Pass along the format info from .fb_create() to
drm_helper_mode_fill_fb_struct()

Jack Xiao (1):
      drm/amdgpu: fix incorrect vm flags to map bo

Johan Hovold (1):
      drm/bridge: fix OF node leak

Jouni H=C3=B6gander (1):
      drm/i915/psr: Do not trigger Frame Change events from frontbuffer flu=
sh

Karthik Poosa (1):
      drm/xe/hwmon: Add SW clamp for power limits writes

Liu01 Tong (1):
      drm/amdgpu: fix task hang from failed job submission during process k=
ill

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next-fixes

Matthew Auld (3):
      drm/xe/migrate: prevent infinite recursion
      drm/xe/migrate: don't overflow max copy size
      drm/xe/migrate: prevent potential UAF

Micha=C5=82 Winiarski (1):
      drm/xe/pf: Set VF LMEM BAR size

Thomas Hellstr=C3=B6m (1):
      drm/xe: Defer buffer object shrinker write-backs and GPU waits

Vinod Govindapillai (1):
      drm/i915/fbc: fix the implementation of wa_18038517565

YiPeng Chai (1):
      drm/amdgpu: fix vram reservation issue

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c      |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 19 +++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       | 15 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  3 +-
 drivers/gpu/drm/bridge/aux-bridge.c          |  2 ++
 drivers/gpu/drm/drm_bridge.c                 |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c     |  8 ++---
 drivers/gpu/drm/i915/display/intel_psr.c     | 14 +++++---
 drivers/gpu/drm/nouveau/nouveau_display.c    |  9 ++---
 drivers/gpu/drm/nouveau/nouveau_display.h    |  3 ++
 drivers/gpu/drm/omapdrm/omap_fb.c            | 23 ++++++-------
 drivers/gpu/drm/omapdrm/omap_fb.h            |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c         |  5 ++-
 drivers/gpu/drm/panfrost/panfrost_gem.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_display.c      |  5 +--
 drivers/gpu/drm/radeon/radeon_fbdev.c        | 11 +++---
 drivers/gpu/drm/radeon/radeon_mode.h         |  2 ++
 drivers/gpu/drm/xe/regs/xe_bars.h            |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c                | 29 ++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c              | 42 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_pci_sriov.c            | 22 ++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.c             | 51 ++++++++++++++++++++++++=
+---
 include/drm/drm_bridge.h                     | 48 ++++++++++++++++++++++++=
++
 24 files changed, 257 insertions(+), 67 deletions(-)
