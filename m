Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9F2F71CA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 05:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B406E10A;
	Fri, 15 Jan 2021 04:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322E6E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 04:56:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q22so11541106eja.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 20:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mxwbkeVE3TgRsWHUczpony1YcNS7sLgn9lbDauIHtGc=;
 b=TmnfiBZSVRmLTMNpRC4dLHAnf4NQzSh0Gg9aReKgB3BLaTU2keXxdfFKXtIY3UmaVH
 g5ouY/5co7B4m3HNJdCrRD7DhoJstjlqY/3+x+Ahwqoj70WFL+1IoQAZZ2TpiTn0fMvi
 9oTB8GeShvWyO+aG8IUQh7RlCKhU65G/2d9TP3kTWPDFmxSZRz4ruCkCXayZHQrtvQ/P
 lbWfF9txdZaH5RScrfngamCGQBqhFIQm8Cw5Q28Gu5VKTV/GgOK4+lvImhbqXwXrCOp0
 OvMVI1OA7hKOI/cOazMopEm3gostPW5+2Bz19XpjlX4cE+ViAIgBFsWEJmFxweOdZU6j
 2COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mxwbkeVE3TgRsWHUczpony1YcNS7sLgn9lbDauIHtGc=;
 b=J47iEe/oMbxpmH6uzZyNVJGmSHjIIDzBoWpgAvCsOlqipp19sExR4jEON/0spkJGPU
 2by006x6if7udVoBEEVOE3Uds2lsqGAWMrgC9xS1hDW1urcg4jTLsUMuf69hG7DiY9Xn
 oU3WR9TRYlWuT49uy6INZMTGE398b6vAexvwbO61XwkOyjYwy0r8O4dTS1Us3+SdrQRY
 IOIWly2soPXFWNem9cVuXe2P76JYkaCjlEtuZfQYZdgwDIzPvkp8X6cQgaVodQj53t6u
 8ZzokTaU1LDv2MetBcZEzJxNOirGti3S8/p3T5nLLwDAmTxwYbONLLuzhKIS8Gye3152
 9Izw==
X-Gm-Message-State: AOAM530pmtVKlLp022yLu4xh09NE8b3IZa5HZVMNtgps8mqa0eg7ydCQ
 q/SVLGGQO9zrt9BqQgBWW3sdef7bHWz0p99Wwe0=
X-Google-Smtp-Source: ABdhPJyTBylAV36nGjc4nKUA4yCSvn1UGW1Yyt5iV/ifkbmWkXmd/e7GVLv5ClN5CRbaUWXl/i61psRzuRPCPw72ntk=
X-Received: by 2002:a17:906:30c4:: with SMTP id
 b4mr7466243ejb.456.1610686575540; 
 Thu, 14 Jan 2021 20:56:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Jan 2021 14:56:04 +1000
Message-ID: <CAPM=9twv04YWugPc1h87PHBd=QY7sLykCt=tNyM+6gnoAaXOSQ@mail.gmail.com>
Subject: [git pull] drm nouveau ampere modesetting support
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

As mentioned in the previous pull, Ben has requested if we can include
Ampere modesetting support under fixes, it's for new GPUs and
shouldn't affect existing hardware. It's a bit bigger than just adding
a PCI ID, and I'm fine if you think we should hold it off until later.

Dave.

topic/nouveau-ampere-modeset-2021-01-15:
drm nouveau ampere display support.

This is a pull request to add display support for new Ampere hardware.

It has no effect on older GPUs.
The following changes since commit c8f6364f35f32786dd40336cfa35b9166d91b8ab:

  Merge branch '04.00-ampere-lite-fixes' of
git://github.com/skeggsb/linux into drm-fixes (2021-01-15 13:26:44
+1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm
tags/topic/nouveau-ampere-modeset-2021-01-15

for you to fetch changes up to 584265dfec70e78ce2085b82ed389f27e06fbca0:

  Merge branch '04.01-ampere-lite' of git://github.com/skeggsb/linux
into topic/nouveau-ampere-modeset (2021-01-15 14:48:18 +1000)

----------------------------------------------------------------
drm nouveau ampere display support.

This is a pull request to add display support for new Ampere hardware.

It has no effect on older GPUs.

----------------------------------------------------------------
Ben Skeggs (15):
      drm/nouveau/core: recognise GA10[024]
      drm/nouveau/pci/ga10[024]: initial support
      drm/nouveau/bios/ga10[024]: initial support
      drm/nouveau/devinit/ga10[024]: initial support
      drm/nouveau/mc/ga10[024]: initial support
      drm/nouveau/privring/ga10[024]: initial support
      drm/nouveau/imem/ga10[024]: initial support
      drm/nouveau/fb/ga10[024]: initial support
      drm/nouveau/timer/ga10[024]: initial support
      drm/nouveau/mmu/ga10[024]: initial support
      drm/nouveau/bar/ga10[024]: initial support
      drm/nouveau/gpio/ga10[024]: initial support
      drm/nouveau/i2c/ga10[024]: initial support
      drm/nouveau/dmaobj/ga10[24]: initial support
      drm/nouveau/disp/ga10[24]: initial support

Dave Airlie (1):
      Merge branch '04.01-ampere-lite' of
git://github.com/skeggsb/linux into topic/nouveau-ampere-modeset

 drivers/gpu/drm/nouveau/dispnv50/Kbuild            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/core.c            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/curs.c            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wimm.c            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   8 ++
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c        | 106 ++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |   1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   5 +
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/devinit.h  |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gpio.h |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mc.h   |   1 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |   1 +
 drivers/gpu/drm/nouveau/nvif/disp.c                |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  75 ++++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |  33 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |  46 +++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |   4 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h    |   2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/rootga102.c   |  52 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    | 140 +++++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/sortu102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c    |  76 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |  40 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |  40 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h       |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c  |  40 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c   | 118 +++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/Kbuild      |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |  74 +++++++++++
 46 files changed, 892 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
