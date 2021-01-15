Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B733D2F6FD2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 02:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357F36E140;
	Fri, 15 Jan 2021 01:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6546E140
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 01:07:02 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id k4so3569723ybp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ptMG8h/t27FZ04Kp7gTFbJoVOkYkpr/EhrsbG2AgIbM=;
 b=AzOzgEXs9RbZ6SHFH5yRscm8btBA3c+bF96dTQAf5BCV9IPi5OY+8Rs6YP3JpX1APn
 zju2/DAQpfWZogB846RY/6guay5Wv6eFYuMafPylKhNbuQazOU9DgDWnV1eE0ag2ItaM
 tHy9JVxViPjL6oecW7jrYStdvhXo1I5g5pUyD8HCw0dXRNBleqmwJtSt2+7Mzv5kpL+6
 /O98RjnEL4oFv31zbHqyT5lBhCsXAHKZ0UsdGEzWS8+aSH9ZDXx5sXkg9DK4OMCjpkC2
 EkMnX0ymHmC+QnHuJvSzOSzsM0592naT0MATIYrJySo5XPOvlVgGCQuxhF371eNHUta0
 1L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ptMG8h/t27FZ04Kp7gTFbJoVOkYkpr/EhrsbG2AgIbM=;
 b=CwQ65MN7Ru6dlClsTPaeIAFik+K4Ln26/wi/kCWcSGmIxV040actNJJc9XqAbu+Dle
 ArUmxe7jkgvgjsXI5peETE+VVsgQcQAfFQYIt5+IO6ICPVQ3sTp0OLvvkFOeRf7Fx+xD
 3Qa0ma0sI1U5t0WOkbNAYExgONwiMUJBwytiCTC7O0oi0XzWsRqHg98qUOhLZWIU696T
 BwFyJHwq3eFWdYX37a8ccI3hXD3oXfhajWjIIse+jXTd7+nAgOGLnZX7v8MJcnBOeEEs
 Pk8Q3HVS9W4Eo4Fiz2IY/AbJW5G3bnXgfRYt494HHS3WvlEmwb/GHJblIHLyypdCQCuQ
 w/2g==
X-Gm-Message-State: AOAM530POLYXR+TiJQvtw02Bgd5uxReF3wvav8Lu+jWk776h8Kt27M4h
 7ZtIjinOYP2ZaPb1SuPTTBmD7ON4pQkFYrntou0jhNTKM+5NrQ==
X-Google-Smtp-Source: ABdhPJzRcB8FYVP5ll1w6Dgwi8d/GN8xG2CjTABF2rnp4zReYwZM7PbTZMTD43/kYGhcSHdRULpgqD+rSbQS+5CG4t4=
X-Received: by 2002:a25:b703:: with SMTP id t3mr16361227ybj.96.1610672821296; 
 Thu, 14 Jan 2021 17:07:01 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 15 Jan 2021 11:06:50 +1000
Message-ID: <CACAvsv4P90mcF_ByAh+ghz+ZVD2N2bPbD7xHYYArE1kYrvsGcQ@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.11
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

As requested, here's a tree with the non-Ampere-specific fixes split
out, as most of them are potentially relevant to already-supported
GPUs.

I'll send another pull request with bare-bones GA102/GA104 support shortly.

Ben.

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://github.com/skeggsb/linux 04.00-ampere-lite-fixes

for you to fetch changes up to caeb6ab899c3d36a74cda6e299c6e1c9c4e2a22e:

  drm/nouveau/kms/nv50-: fix case where notifier buffer is at offset 0
(2021-01-15 10:25:17 +1000)

----------------------------------------------------------------
Ben Skeggs (7):
      drm/nouveau/bios: fix issue shadowing expansion ROMs
      drm/nouveau/privring: ack interrupts the same way as RM
      drm/nouveau/i2c/gk110: split out from i2c/gk104
      drm/nouveau/i2c/gk110-: disable hw-initiated dpcd reads
      drm/nouveau/i2c/gm200: increase width of aux semaphore owner fields
      drm/nouveau/mmu: fix vram heap sizing
      drm/nouveau/kms/nv50-: fix case where notifier buffer is at offset 0

 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c        |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h  |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 12 +++++------
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h      |  7 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   | 10 +++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 17 ++++++++++------
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.c    | 45
++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c    |  7 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.h      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/priv.h     |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c   | 10 +++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c   | 10 +++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c     |  6 +++---
 17 files changed, 112 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
