Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5D3F0A5F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1A36E81E;
	Wed, 18 Aug 2021 17:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5E6E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:03:45 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id a93so3937402ybi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KOHIFm7DxNQPJ+AIsQp6fOHHSgtmRlgAtGT6EK/cVFE=;
 b=PLiLI3j//MomHh0Xwejj0OajZTRm7p1IMcP8V4G46fWPgjBAL2n9jorerPoFDk15cz
 nOuD1jcYARWTXP7mxK3vrTgShVIvbU/oh2DM7wgdLqkGlA4agF+u1xcPE1bWyeVNx/p2
 y3Sp1Wu+lVHGirnEYwlEBM4ETn1nHSKFPnVIH+jV2tQnPIyXtaAT7b6t0U9Ff8Atd/MA
 OIUJjeTBr7/VRdS0Q2rQjha/7JjL7NS7QRX5PEVGUUXK4nROPr34WMjfsVgc7WXR8BPC
 /SBX3+TBjT2imL9wdwooeJI1R4wXcTXcDBZ9FT08x5U/S9iU6RIOzf5cu47U5xc2ZFKy
 VSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KOHIFm7DxNQPJ+AIsQp6fOHHSgtmRlgAtGT6EK/cVFE=;
 b=VCpeXUD21X3aTw2Iva0Li8Y1NX2ibjSCyNdo/ORNLwUjqN+HtI9AXqxMVLCbFBxua7
 1qsolQxAtWzzJdH1HJVGbpi3qb8Y4mHPmcnvruxlLGsW8jsiqc99GrFaX1k0DR5x7e9g
 NeFOVTL/tBG4sIk+zMsdA6D+znrOhq5YVjPa1VD1OXmXBrQJ+ZaEFzdgAd84TP6ILIAe
 B2idCvgwz9j4KHW9dJjhJCUGnz289vsLR2FppV8LUVTJMD5eEF4mkopBNp74vOEy9HyM
 FtF6CuQq76SBgnBOHVt8FDJkkQY0/8CnJcxuBwsfKTVmYPFR9sWbV4yXwE4urCfRxlBP
 Qhow==
X-Gm-Message-State: AOAM531oUNzYkYXUxnlg9VywPaXts6gfbgcZqnSNXJOXve6mQUSvezZW
 EoVD6FfXTlGiigOs6iErNEFUE/tRKPVvR8nmFrRlMdZ4hZeb4Q==
X-Google-Smtp-Source: ABdhPJwtXUSuosSPcWHgIrB6k7PUgclgKFlZG33hZTTTuTe9UWle3JYDC7SuhILW4pnTykVALwsz3icVe0/Wzcfr0a8=
X-Received: by 2002:a25:aaa2:: with SMTP id t31mr10107032ybi.178.1629277424847; 
 Wed, 18 Aug 2021 02:03:44 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 18 Aug 2021 19:03:33 +1000
Message-ID: <CACAvsv5jtUFkHsGe-pf-=RceDOgKygjPnCi=6d5vCLM_f5aeMQ@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.14
To: ML dri-devel <dri-devel@lists.freedesktop.org>
Cc: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Aug 2021 17:40:22 +0000
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

Hey,

Just a couple fixes for Ampere display issues, and a long-standing
race in MM paths.

Ben.

The following changes since commit 7c60610d476766e128cc4284bb6349732cbd6606:

  Linux 5.14-rc6 (2021-08-15 13:40:53 -1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.14

for you to fetch changes up to 59f216cf04d973b4316761cbf3e7cb9556715b7a:

  drm/nouveau: rip out nvkm_client.super (2021-08-18 19:00:15 +1000)

----------------------------------------------------------------
Ben Skeggs (6):
      drm/nouveau: recognise GA107
      drm/nouveau/disp: power down unused DP links during init
      drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences
      drm/nouveau/fifo/nv50-: rip out dma channels
      drm/nouveau: block a bunch of classes from userspace
      drm/nouveau: rip out nvkm_client.super

 drivers/gpu/drm/nouveau/dispnv50/disp.c                | 27 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/head.c                | 13 ++++--
 drivers/gpu/drm/nouveau/dispnv50/head.h                |  1 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h          |  3 +-
 drivers/gpu/drm/nouveau/include/nvif/class.h           |  2 -
 drivers/gpu/drm/nouveau/include/nvif/client.h          |  1 -
 drivers/gpu/drm/nouveau/include/nvif/driver.h          |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h     |  1 -
 drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h      |  1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c                |  2 -
 drivers/gpu/drm/nouveau/nouveau_chan.c                 | 19 +-------
 drivers/gpu/drm/nouveau/nouveau_drm.c                  |  3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c                  | 15 +-----
 drivers/gpu/drm/nouveau/nouveau_nvif.c                 |  4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c                  |  9 ----
 drivers/gpu/drm/nouveau/nouveau_usif.c                 | 57
+++++++++++++++++------
 drivers/gpu/drm/nouveau/nvif/client.c                  |  3 +-
 drivers/gpu/drm/nouveau/nvif/object.c                  |  3 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c              |  4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c      | 21 +++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c          |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h          |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c        |  9 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c         | 15 ------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild        |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.h    |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmag84.c      | 94
--------------------------------------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv50.c     | 92
-------------------------------------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.c         |  1 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifotu102.c |  2 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c        |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c         |  6 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h         |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c         | 27 +++--------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c          |  6 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c     | 16 +++----
 41 files changed, 144 insertions(+), 334 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmag84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv50.c
