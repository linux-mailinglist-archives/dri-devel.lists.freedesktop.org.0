Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD391B30B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 01:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D810E1AF;
	Thu, 27 Jun 2024 23:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqxj6M3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5DB10E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 23:58:21 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57d15b85a34so41195a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719532700; x=1720137500; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Os/l/7RjSLQRoODmoguN2V2Kljaci69+SAiWEDn+JaI=;
 b=dqxj6M3qCG9HBYlTrR2vFNLy+AHvftKFCwpwcAjqIgA0Hi0QpAu1/bJ7qXcPV5SpbR
 +X4vhwZdr2p0Bs7y/sCx9ry1Oe3ctRQlYJ/NvHMWKp/WHZz8f2oXvnv7YvTbz1PImAZQ
 01ibXKdQcP40CA8l3AZY/IhS2yBvQOvIrg/21VTYqUMffYS4s408Ae0IucJwxx21Ck+W
 fMPVtzpQinAVUsFM8lc7NVuREF+qwMm2H9rTV8Y0Mh2vA4HRUzsEChrypTTvwQsrPbUr
 gU0G6HoVZ4CHnaKHzWo9H8dgJ07LsX+nIxuTk1M+C4jt8i0zXfFwUl+Lp9rPQ2+RXMdp
 3f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719532700; x=1720137500;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Os/l/7RjSLQRoODmoguN2V2Kljaci69+SAiWEDn+JaI=;
 b=I/XzXFLqq8rpeqd+cEEvpT/G8jn0n5eRGqYZJW0FZrw9DxN+wXCaJ6f9XxhFCrD7rh
 e52r/OaYOjDhjP8I7xfsxWx+vnYNc38JIgjFPo+W0+sfT/4eML6CZmUBTKgywWSTChQh
 94iF/kplEE3m3EZpbBkxnFbpCOJoopN36r3XK0pqiVp2PZbFJRwsjjGIb35gPOPqdX5e
 K04Ru/NtEucb34QBAIZ59tgcOSsvWQpVq85/PoEXbfZ/JFw5D128HKV4ciOD/BFfbdRI
 awEdyQCxz+RyaGYdlc2ki6Rcbmgtn6xQSlrA7TXVyBhaJn0Tfte8TeJulyzxB9b5JV1b
 WGiQ==
X-Gm-Message-State: AOJu0YzW8dYvCvrZOrqB+ec5mA+hDhSK+Pu7XjMpJNJrMhdxREKjCFpG
 FnucCUSOcjoX+OJLewyhzUNtt/NXAGguKVdnrTe90gzjo/ififz61Ovhb7JgsHCmRRumQ7mbzay
 0EpyveKg7xQkQyRhI+9PBodyf+RM=
X-Google-Smtp-Source: AGHT+IEJiGF8X5t1BC3wuLtEUWMcoVjEujVJtq4GEgIjlEkz6OuGpOs7B8hJTKQqIRTUNd3rmpGMjQ2Oly6ezaqmMNw=
X-Received: by 2002:a17:906:308d:b0:a6f:e05b:b1f1 with SMTP id
 a640c23a62f3a-a715f94a879mr874501566b.30.1719532699302; Thu, 27 Jun 2024
 16:58:19 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Jun 2024 09:58:07 +1000
Message-ID: <CAPM=9txzYPEzGHDvNBJb_WXfbktOSy0Y8odZGTRGpqJ00kPgRA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Regular fixes, mostly amdgpu with some minor fixes in other places,
along with a fix for a very narrow UAF race in the pid handover code.

I'm going to be travelling next week so expect a fixes pull from Sima,
I don't think I'll be completely offline but won't be too responsive.
(though Japan at this time of year might cause me to be indoors more
than expected!).

drm-fixes-2024-06-28:
drm fixes for 6.10-rc6

core:
- fix refcounting race on pid handover

fbdev:
- Fix fb_info when vmalloc is used, regression from
  CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM.

amdgpu:
- SMU 14.x fix
- vram info parsing fix
- mode1 reset fix
- LTTPR fix
- Virtual display fix
- Avoid spurious error in PSP init

i915:
- Fix potential UAF due to race on fence register revocation

nouveau
- nouveau tv mode fixes.

panel:
- Add KOE TX26D202VM0BWA timings.
The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-28

for you to fetch changes up to 4f2a129b33a2054e62273edd5a051c34c08d96e9:

  drm/drm_file: Fix pid refcounting race (2024-06-28 08:56:26 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc6

core:
- fix refcounting race on pid handover

fbdev:
- Fix fb_info when vmalloc is used, regression from
  CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM.

amdgpu:
- SMU 14.x fix
- vram info parsing fix
- mode1 reset fix
- LTTPR fix
- Virtual display fix
- Avoid spurious error in PSP init

i915:
- Fix potential UAF due to race on fence register revocation

nouveau
- nouveau tv mode fixes.

panel:
- Add KOE TX26D202VM0BWA timings.

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: fix parsing of vram_info

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2024-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.10-2024-06-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-06-27' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Jann Horn (1):
      drm/drm_file: Fix pid refcounting race

Janusz Krzysztofik (1):
      drm/i915/gt: Fix potential UAF by revoke of fence registers

Julia Zhang (1):
      drm/amdgpu: avoid using null object of framebuffer

Li Ma (1):
      drm/amd/swsmu: add MALL init support workaround for smu_v14_0_1

Lijo Lazar (2):
      drm/amdgpu: Fix pci state save during mode-1 reset
      drm/amdgpu: Don't show false warning for reg list

Liu Ying (1):
      drm/panel: simple: Add missing display timing flags for KOE TX26D202VM0BWA

Ma Ke (2):
      drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_hd_modes
      drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes

Michael Strauss (1):
      drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if
LTTPR is present

Thomas Zimmermann (1):
      drm/fbdev-dma: Only set smem_start is enable per module option

 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 25 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           | 18 +++++-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  5 +-
 .../display/dc/link/protocols/link_dp_capability.c | 10 ++-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |  5 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 13 ++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  5 ++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 73 ++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c                    |  6 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |  5 +-
 drivers/gpu/drm/drm_file.c                         |  8 +--
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |  1 +
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |  6 ++
 drivers/gpu/drm/panel/panel-simple.c               |  1 +
 18 files changed, 174 insertions(+), 24 deletions(-)
