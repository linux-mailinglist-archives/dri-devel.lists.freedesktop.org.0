Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23A1A0681
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 07:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62A66E106;
	Tue,  7 Apr 2020 05:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55946E106
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 05:21:49 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 204so1164128ybw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3206icedz2htcik+EFGE/oNerGEy5A8lngL5vhkLTgs=;
 b=kMHkdhjcapCr91M91y6OBJsSUmikQdlWTL7zAq27CVyA5+KaKrJ2YWO/8sSw6k7ZHN
 NDcfuJf4+/Z1guUKcPJgH1ZuaBJZloNOLwkaFurX5Txkgg5rj+/MeBVUEtYDTurqn5Us
 Wa6wq4s8zGZWBCgChGODVL3whuE4y/0gVO8CATpwZFVrhDE6KVosICyb46saLtm7fr/c
 QjNFcGvRyjjHxCcucbVNxfC+dC9B1JU8/yFW9DRlGxBS1CZArjC+A6Yyabw1//2cHdaZ
 rKR1R5dA9lTYuNaTFbG9RJQXFieMva9ZrWSUuvxPYw/yzncnwyxxYetxKgJcTi5c0nri
 McUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3206icedz2htcik+EFGE/oNerGEy5A8lngL5vhkLTgs=;
 b=SriQNKp1b9gqQAMqlL2m/HVFYRS2R5egMaLUYrKgSVSj3+lzEA508O/KJhqSvqajbU
 9nX3snff65g87JfrJ3gbyJRmkEbaRko9qoIyTApw+VNZHVhlAnhGD6rqfZweBdvy/CLS
 BatDHGpC9g+hhYZQc/9shtpPKLkSm6TaEcgH9NLyD8OJb0gxvP38SCyo2xWXKoPNEHqz
 3kJBnEv6O1A20wMJAG03KTDkP08FXJgf74dlvZuGt3sat/1LVrwDzaNmhljNsV6OGJEp
 N8E8mRg5HfaH8z9CaeVuvOTKpwT8Fc/xbVDS/ecVWEpU49YKHA/62fnASkbnruo60IYs
 n4hA==
X-Gm-Message-State: AGi0PubXu2ELL9LCOm/QGQfdIay/WOPR8m3sZdEFS5k6GhfMIqBcmToH
 1p9aZad6iQ+SlzjiA1yg9wBMf3V5I0k07DGy54Q=
X-Google-Smtp-Source: APiQypIDkAY253qBcKPHDajMXk0PJMsj45naSGUnKxjwbpaiqJWgjkeIKMi7VxQ5QpkeAP+7CCV0rtP/xX4gy0v2/dI=
X-Received: by 2002:a25:ab26:: with SMTP id u35mr977209ybi.147.1586236907312; 
 Mon, 06 Apr 2020 22:21:47 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 7 Apr 2020 15:21:36 +1000
Message-ID: <CACAvsv5Ef5YKS9EPBH3YUubzvVr++_rzjgSqV_B5nC0L2kB6-Q@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.7
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

A couple of misc fixes/workarounds for some issues that are causing a
lot of pain for people.

Of most interest are the PCI power management and GR init WARs, which
effect a rather significant number of laptop systems that are in use
today.

Ben.

The following changes since commit 0e7e6198af28c1573267aba1be33dd0b7fb35691:

  Merge branch 'ttm-transhuge' of
git://people.freedesktop.org/~thomash/linux into drm-next (2020-04-03
09:07:49 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.7

for you to fetch changes up to 374b55802cd567e9f340b7f27d2c5e20b069ac3c:

  drm/nouveau/kms/nv50-: wait for FIFO space on PIO channels
(2020-04-07 14:37:50 +1000)

----------------------------------------------------------------
Ben Skeggs (5):
      drm/nouveau/ttm: evict other IO mappings when running out of BAR1 space
      drm/nouveau/gr/gp107,gp108: implement workaround for HW hanging
during init
      drm/nouveau/nvif: access PTIMER through usermode class, if available
      drm/nouveau/nvif: protect waits against GPU falling off the bus
      drm/nouveau/kms/nv50-: wait for FIFO space on PIO channels

Karol Herbst (1):
      drm/nouveau: workaround runpm fail by disabling PCI power
management on certain intel bridges

Ralph Campbell (3):
      drm/nouveau/svm: fix vma range check for migration
      drm/nouveau/svm: check for SVM initialized before migrating
      drm/nouveau/svm: remove useless SVM range check

Wambui Karuga (1):
      drm/nouveau: remove checks for return value of debugfs functions

 drivers/gpu/drm/nouveau/dispnv04/dac.c         |  3 ++-
 drivers/gpu/drm/nouveau/dispnv04/hw.c          |  1 +
 drivers/gpu/drm/nouveau/dispnv50/base507c.c    |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core507d.c    |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c    |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c    | 21 ++++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/cursc37a.c    |  9 ++++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c        |  1 +
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c    |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.h        |  1 +
 drivers/gpu/drm/nouveau/include/nvif/device.h  | 21 ---------------------
 drivers/gpu/drm/nouveau/include/nvif/timer.h   | 35
+++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/user.h    |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c           |  9 +++++++--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c      | 20 ++++++++------------
 drivers/gpu/drm/nouveau/nouveau_drm.c          | 63
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h          |  2 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c          |  9 ++++++---
 drivers/gpu/drm/nouveau/nvif/Kbuild            |  1 +
 drivers/gpu/drm/nouveau/nvif/device.c          | 14 +++++++++-----
 drivers/gpu/drm/nouveau/nvif/timer.c           | 56
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvif/userc361.c        | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 26 ++++++++++++++++++++++++++
 23 files changed, 263 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/timer.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/timer.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
