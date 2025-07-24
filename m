Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D85B0FE36
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 02:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9353910E19F;
	Thu, 24 Jul 2025 00:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FKqGiGec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718610E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 00:40:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae36e88a5daso73911466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753317621; x=1753922421; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bYY19ksHI4zoByV1B9q9CP9AFpfJQb60S1A3kUxuBpc=;
 b=FKqGiGec6a/smhJyoQHy/ZkoT4WfkwYFJZY2+V1Dl2Gh+rxIppvUvqxCcP10j5RysU
 3gxPJlNHRZ8F+MmsDNh2PaJiKpKtn/wgvk8BcZaV+qqThUzSt8mFp0XzFTdNdGivHGVC
 zPhZq2Pth/cW4q0lHkPp4sUhGKmMcoF9wb4fdDuZgIFcVOhtf0DZH8gMVxUa2V+EuBI0
 nBgQqZFy6sLrDbYPzjNAq9L3Pm9XoMO0BlY7SDMfMKpgxPkF6rQJRQNjiT18nCzycoMD
 n9KMPZe0G4HrRPZVCFFWFo8qeaGIIZmUNwVM2K23CKURxTgbgyA2NpxUfj1GBFSG7ndY
 5i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753317621; x=1753922421;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYY19ksHI4zoByV1B9q9CP9AFpfJQb60S1A3kUxuBpc=;
 b=wbHWgYOLEf75YcIFSabCx0jBeOfLtZIzgFT3PU253KSg8FiO0INNhNQmEdIBkvbWaO
 xKXiUx+/Xo5A9Pc3pltMwbsbhlLfDsWLy+w6mhjVJGrWCRsfu9PFmQyQLpf+Kvs6/XZe
 iPdPBQJ896I3BkforxhnINeQqMRCytiTr9I3Qxb2L1Mfnw12ClV7BsEXmWTcqkgwQbiQ
 DPCeIqndN5cEhRINqBKf2Xhfe093QssabiG6eCutw3Meo3YayIeJ+5P7xd18545vML11
 I9M2wmlxxnegHy+kZgolypA9cls47GLfUfrRrgViteglm2m3iufhMjz9bo8JZbdNBs1C
 5OdA==
X-Gm-Message-State: AOJu0Yy2LzgqOcxXer2kymBX+t7pTsTwT547jqrYpt6Cy4wYv4V3emTP
 TOWFSHWZ+eayBxJEPjDLkZwugbrPTdJdFUjW9aTfWPhMuts/F3mDpXOZ4OybvWFoBwNpJlVtKE7
 R8ImBfC3GS8vRASkNQntxjJwP7FAkkb0=
X-Gm-Gg: ASbGncvMTSQAXk6PqL2z2e2HShBH3lfsD/T42n/WiILoKtgHJuIIVa0cVBcNGNAKqdo
 xwWT8GwlTJHcOrrKSuwPCiP/SRsNdD6PFhHYw5IWKZUaOTxpMXYa+UA1DBY2GKHovBdfWm7Ikrc
 pu2hRXjzrkEe4qkxVwK0F7waH4rFWY0sF8fD//9ONtaG0EL5Z5pSh5SXILN6KZ4+HUOb084R/7u
 tUn8w==
X-Google-Smtp-Source: AGHT+IG9y6VkIrO75qO4lo12ZQavYt3nvisHQqeDLTk6ayFcLfJXriUBF6ZrqPRyCZcfGoFOiPLtfxCavUhwKOR9u2o=
X-Received: by 2002:a17:906:f585:b0:ae9:bf1c:50a4 with SMTP id
 a640c23a62f3a-af2f866213bmr485570666b.36.1753317620362; Wed, 23 Jul 2025
 17:40:20 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Jul 2025 10:40:08 +1000
X-Gm-Features: Ac12FXzbqY7taRY-jUUQcQ_iVcWk0mzydt-j1ETeclZ5kTfsUCaTyBa2i1rwIlI
Message-ID: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
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

(this time for sure, plain text).

Hi Linus,

This might just be part one, but I'm sending it a bit early as it has
two sets of reverts for regressions, one is all the gem/dma-buf
handling and another was a nouveau ioctl change.

Otherwise there is an amdgpu fix, nouveau fix and a scheduler fix.

If any other changes come in I'll follow up with another more usual Fri/Sat MR.

Dave.

drm-fixes-2025-07-24:
drm fixes for 6.16-rc8

gem:
- revert all the dma-buf/gem changes
  as there as lifetime issues with it.

nouveau:
- revert an ioctl change as it causes issues
- fix NULL ptr on fermi

bridge:
- remove extra semicolon

sched:
- remove hang causing optimisation

amdgpu:
- fix garbage in cleared vram after resume
The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-24

for you to fetch changes up to 337666c522b9eca36deabf4133f7b2279155b69f:

  Merge tag 'drm-misc-fixes-2025-07-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-07-24 06:49:38 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc8

gem:
- revert all the dma-buf/gem changes
  as there as lifetime issues with it.

nouveau:
- revert an ioctl change as it causes issues
- fix NULL ptr on fermi

bridge:
- remove extra semicolon

sched:
- remove hang causing optimisation

amdgpu:
- fix garbage in cleared vram after resume

----------------------------------------------------------------
Arnd Bergmann (1):
      Revert "drm/nouveau: check ioctl command codes better"

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Reset the clear flag in buddy during resume

Ben Skeggs (1):
      drm/nouveau/nvif: fix null ptr deref on pre-fermi boards

Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2025-07-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_probe()

Lin.Cao (1):
      drm/sched: Remove optimization that causes hang when killing
dependent jobs

Thomas Zimmermann (7):
      Revert "drm/virtio: Use dma_buf from GEM object instance"
      Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
      Revert "drm/etnaviv: Use dma_buf from GEM object instance"
      Revert "drm/prime: Use dma_buf from GEM object instance"
      Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
      Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
      Revert "drm/gem-dma: Use dma_buf from GEM object instance"

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        |  2 +-
 drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +--
 drivers/gpu/drm/drm_prime.c                  |  8 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c        | 11 +++----
 drivers/gpu/drm/nouveau/nvif/chan.c          |  3 ++
 drivers/gpu/drm/scheduler/sched_entity.c     | 21 ++------------
 drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 ++--
 include/drm/drm_buddy.h                      |  2 ++
 16 files changed, 101 insertions(+), 38 deletions(-)
