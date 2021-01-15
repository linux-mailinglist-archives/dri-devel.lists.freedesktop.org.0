Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060852F6FD3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 02:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CF66E14D;
	Fri, 15 Jan 2021 01:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9896E150
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 01:07:04 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id o144so3607645ybc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8WT/s/ifiTWsg/66kZ4BHnLh8daTsJ90mGC3dSdGXMQ=;
 b=ElWxnYA3LmzuW2MvHo2w+BmE5ROnQuO3xCCkhMvUTcCYBz4NrpwC+EGUkPQcdwY6V4
 PP1wwE/D/G1lt+LK5wJ+CVZ7C7tet/XLhQeeEjY0YfIXkhDEOJtaRr3URC7MCrRj/5A5
 7puGJZ5CgqXw8DDVQ8MBguumZ2zrvGe1eaHStMlJcEc4vi7LlOM4VoDf0A3ewrhlRGrR
 c/8TblcxO7amsQsi6ixLS58uhnbvPlqm+Jn/AcKEtDi6iINzbDRg6Msav6AEYqwWSnTm
 eZY3nX7TCa0CvHfy24SBFeIrjoBqN+e+UxVvflXdyDFw/Td8qER+ydbYg6qwiO6AQD3l
 8eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8WT/s/ifiTWsg/66kZ4BHnLh8daTsJ90mGC3dSdGXMQ=;
 b=gy5udMbk/VP9ltLTgx4GhSs80GI2v46ZJaSL7xahSISp0Qjb4frHDCC/f6lx9EbH8D
 oSHlMVxA1xhTaSSIGaiBKKiZ0cyIKoBUAj/drrjsasPoIAio8F1NIRv2vgPQ+mOU14RY
 fMxn0NaqlyI4421oskPzeGL6+w57W2xRVBxbz+pLdUpiYvUokE40H/rziXIacWu06GER
 MY3yCqyCW7dNWe4mHG0UtYR4d8elHhAcWtomAkkJJBXSb+WBPnrU7f+zs97Sg9UEnZEz
 G3FplMUag+C89QarjbdvH3/6kueSUWfgrYz19gqzB8+ufgK86LKy0MILgbATfi3a3T8u
 LZ2w==
X-Gm-Message-State: AOAM530C5ZXUm5f10wSVM7wFpB3PilJP5bMjfVuV7fWxOwsWDy4E8x+G
 LK7Upso+KlZ8zhjBaUl4KXtfClYQm/Q8xGqy7IdKqZHFRlnRtg==
X-Google-Smtp-Source: ABdhPJxWEAbESt6wyNbP46iXUxaQ6Dfrat2oeBM/8quWQL5QqKwbqiIvpYccYJz2F1XTVXLOy4R67dyx7zztbCIGArQ=
X-Received: by 2002:a25:3104:: with SMTP id x4mr14828591ybx.141.1610672823755; 
 Thu, 14 Jan 2021 17:07:03 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 15 Jan 2021 11:06:52 +1000
Message-ID: <CACAvsv5LmMP+HbDUQBf_dy1-0eS9fA32k8HWo4y5X4-7rsw-yw@mail.gmail.com>
Subject: [PULL] nouveau: ampere modesetting
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave,

This series of patches to add modesetting support for Ampere has been
pulled out of a larger, more invasive series.  As there's currently no
firmware available for us to use, the rest of it isn't important right
now, and it'd be nice to have something non-invasive to provide what
support we currently can (and is possible to backport to earlier
kernels).

No other chipset should be impacted by these patches, as the changes
are largely confined to adding Ampere versions of the code handling
each IP block.

I'd like to extend thanks to NVIDIA for providing hardware, and for
their assistance with confirming/clarifying some of the changes.

Ben.

The following changes since commit caeb6ab899c3d36a74cda6e299c6e1c9c4e2a22e:

  drm/nouveau/kms/nv50-: fix case where notifier buffer is at offset 0
(2021-01-15 10:25:17 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux 04.01-ampere-lite

for you to fetch changes up to 8ef23b6f6a79e6fa2a169081d2d76011fffa0482:

  drm/nouveau/disp/ga10[24]: initial support (2021-01-15 10:25:24 +1000)

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

 drivers/gpu/drm/nouveau/dispnv50/Kbuild                |   1 +
 drivers/gpu/drm/nouveau/dispnv50/core.c                |   1 +
 drivers/gpu/drm/nouveau/dispnv50/curs.c                |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wimm.c                |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c                |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.h                |   8 +++
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c            |  10 ++--
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c            | 106
+++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h          |   1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h           |   5 ++
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h     |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h     |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h  |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h       |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gpio.h     |   1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mc.h       |   1 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c            |   1 +
 drivers/gpu/drm/nouveau/nvif/disp.c                    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c      |  75
++++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c      |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild        |   3 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c          |  33 ++++++++++---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c       |  46 +++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h         |   4 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h        |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootga102.c   |  52
+++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    | 140
++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sortu102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c       |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c |   3 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild     |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c    |  76
++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h     |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild          |   3 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c         |  40 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c         |  40 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h          |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h           |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c      |  40 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/Kbuild        |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c       | 118
+++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/Kbuild          |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c         |  74
+++++++++++++++++++++++++++
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
