Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8F572C1C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 06:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855F10EF7A;
	Wed, 13 Jul 2022 04:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902A110EF7A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 04:03:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mf4so16528855ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 21:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=WZlFRwFPD5O7mZi+QIDj16DoHeX+Ma86t2MkpmI46BA=;
 b=G8bqvGZxbrMv77zQFHOgoP8KLN5R2lxmj92a6g1I0tjaKPI6CWzk2ZFiVH7tgROVES
 JQV8+9Wv1HlGvQGMO5IxwFjQ01lpv/TWuLsjxLXpGNPIwVcHA3JWA9XlH2rvxNRWriGe
 8E8ohfFtUnuTP3F8UfxvmGiJsXo17HPhHfc/kOIhb8JgzC4H83Y5tuhrdS3OCam+gCSr
 U1QXBnI6mu1IzfHKfMHr+d9zbCt2kZS4cwxdiGC+3K0Qf71K0sTU3Gmm1KfNWk4YyZ0T
 INSvvFOgcF9Y7LCYcXkEIomqWIPyEyc0lRR1EjGKNte1Nv2jvB77XYPpL8pQL/om/P97
 1wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WZlFRwFPD5O7mZi+QIDj16DoHeX+Ma86t2MkpmI46BA=;
 b=jAllaUnRkEn58Y4sI1+TOu0TS81VDnX7PTswPdKFfGRZS9fgVmo7tf5yZIRFoKBKPK
 uxFReUlQK21JzTMEKf8zh0wzlh7/pi7CS5DXrmzALmZKHSTjC5yybuvkxa6NJykdOwgV
 MuXKH3ovlLCPXJ3F8tVJ+qu3kFkarhSpgVIAdRqPjw+tGE/GCPdZyade/eRiO2z4mAVc
 CDCKTVlh40XNk5IxCaBHU4QRCYR4rLfrk2kDegEvwvNt0JGFOzkJpSKM5gWcODXlQRc6
 SS50Kf1NU0m0hdnlCkL721tgiDd6d3FqERQArxHrhfwJPW8zEXN37AehddJGrXwUeWEN
 cwHg==
X-Gm-Message-State: AJIora8r475v6ZQNs4HS3yrLS7nQY6QAiNlMqQ5U8STPMalL3YMphC6C
 wrT/pJVRSwr/Sh40qY1Bwb7P7hGAKwsWpQ4DXBPpv/jKNMQ=
X-Google-Smtp-Source: AGRyM1s428zjhboxCHjRfN2YAd0MLbrSLrmSzi210PZCvqMDehTYqz9t5p49ZpWtV6Rvn/aBheL/uoGAm1KXYKFgS6I=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr1401814ejh.720.1657685019927; Tue, 12 Jul
 2022 21:03:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 13 Jul 2022 14:03:28 +1000
Message-ID: <CAPM=9txSS9Pdagpi=3JJeFOGy6ALWC31WZdQxLBkfGeL3O+T1A@mail.gmail.com>
Subject: nouveau next misc patches.
To: dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <skeggsb@gmail.com>,
 Karol Herbst <kherbst@redhat.com>
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

Sending myself a pull request just to keep the process going. This is
some misc nouveau patches Ben has queued up, been good to land them in
-next.

Dave.

topic/nouveau-misc-2022-07-13-1:
drm/nouveau next misc

This is a set of misc nouveau patches skeggsb left queued up, just
flushing some of them out.
The following changes since commit d9e019bb396fc9448b104a6f4cdb7acf8af02854:

  Merge tag 'drm-msm-next-2022-07-10' of
https://gitlab.freedesktop.org/drm/msm into drm-next (2022-07-13
10:55:53 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/nouveau-misc-2022-07-13-1

for you to fetch changes up to 89ed996b888faaf11c69bb4cbc19f21475c9050e:

  drm/nouveau/kms/nv50-: remove unused functions (2022-07-13 13:57:15 +1000)

----------------------------------------------------------------
drm/nouveau next misc

This is a set of misc nouveau patches skeggsb left queued up, just
flushing some of them out.

----------------------------------------------------------------
Ben Skeggs (12):
      drm/nouveau/nvif: add wrapper for open-coded nvif_object_constructed()
      drm/nouveau/nvkm: rip out event uapi
      drm/nouveau/nvkm: use list_add_tail() when building object tree
      drm/nouveau/nvkm: zero out engine pointer for subdev-provided classes
      drm/nouveau/nvkm: remove unused header
      drm/nouveau/device: remove pwrsrc notify in favour of a direct call to clk
      drm/nouveau/fifo: rip out cevent, never used
      drm/nouveau/fifo: remove rd32/wr32 accessors from channels
      drm/nouveau/ce/gv100-: move method buffer to ce ctx
      drm/nouveau: remove double WFI when destroying channels
      drm/nouveau/flcn: remove unused functions
      drm/nouveau/kms/nv50-: remove unused functions

 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  16 --
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  12 --
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   2 -
 drivers/gpu/drm/nouveau/include/nvif/object.h      |   6 +
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   3 -
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |  10 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   2 -
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h  |   3 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/fault.h    |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/secboot.h  |  66 ------
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  32 ++-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   1 -
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |  31 +--
 drivers/gpu/drm/nouveau/nouveau_usif.c             | 231 +--------------------
 drivers/gpu/drm/nouveau/nvif/object.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.c     |  24 +++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c     |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.c  |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  25 ---
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |  29 ---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |  37 ----
 .../gpu/drm/nouveau/nvkm/engine/fifo/changk104.h   |   2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c |  11 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c |  47 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |   1 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c     |   1 -
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |  10 -
 drivers/gpu/drm/nouveau/nvkm/falcon/v1.c           |  25 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |  20 +-
 34 files changed, 112 insertions(+), 556 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/secboot.h
