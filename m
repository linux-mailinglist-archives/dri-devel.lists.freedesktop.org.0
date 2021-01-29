Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7630863A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 08:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14AE6E1BB;
	Fri, 29 Jan 2021 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83F96E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:11:25 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id b11so7990773ybj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Wj/zvEKQrkYXql1ULcCkwPMaUIMudgcDBFNHwFEttqQ=;
 b=vRAUrVbIgOAYjzatve7WB2jhjmtQ3hq30LsQMdjJbeJafxnP+vt8GxH8lEujQ69vPE
 scXY9QPepLXusRGjGGF3b1KGSMu578PjcvhvFxMwDoGLsSfswLr06mbrdn3Cgl0Yol1W
 JDVFMOReVDwuExP46mGB4Wq8HF4LWz0I+ocQLUJVZXoTskdaq3P7NUQxtISNPmFpyJ3Z
 hrQcLv57Tewmkd5mC5YyjnGN72HUEfK0lgGw+VrlXkox9WsFrZTcJWw1Q6bI+Fw+ttUe
 fX/vIPTjY9jQF1vLEAKI7BLPZIc+7yF3dVVO0WkN/sP+s8e3zZhOEcqr+rhWaItF4m9W
 +LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Wj/zvEKQrkYXql1ULcCkwPMaUIMudgcDBFNHwFEttqQ=;
 b=jQ1DSRGSZVZ/BpqrhjCV4AOpaI4+pjCzX30gIbvN2/tG62g12L8x22pmDRrceceD3c
 vvO7P+8nCTegZgZB5TmmscyVGchKWePRYaFrNef109MjJ31/LyS5GwNevud35Gp2oOms
 w3GZA+jRWYpEtSw5FbJCbzg5+mjoFdEO2LYvcGmvLvUOrIanlK/kcm5O7dxrsD3MrTo4
 xm58uVz/WB1gw+szX1hUfjv2le/vVDWKTD5oGZDKxZC1I5kh5YDjTvCxYgUE74tUaEY4
 jqMPziEl9cXzkzl71vLZY/Crgb/bLcTgGKm6Ac0B7iyFwyj7TXS2W7KmlMxG4SjpkyWf
 0CiQ==
X-Gm-Message-State: AOAM530d00IYAYtHn5B/3vZierbBP2GNFx+SNdobf0w7CidHYR5IQOfJ
 e4EkvqV3wrQHoNqPjxms8jeZghrog0lzLRPd9R4=
X-Google-Smtp-Source: ABdhPJwSYJhOe18Ds/AQUBvF6Exak+zZD7FdSlSGwwqaWzC3ZvJE7IsUC83Oi5ZSNB5r7ELa6KtezsF7VrwddsdyWlc=
X-Received: by 2002:a25:3104:: with SMTP id x4mr4402585ybx.141.1611904284872; 
 Thu, 28 Jan 2021 23:11:24 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 29 Jan 2021 17:11:13 +1000
Message-ID: <CACAvsv7yLfhuVbYa-4g0vxVt93OaC7Sodiz2R-TDHu-MoofEdw@mail.gmail.com>
Subject: nouveau-next 5.12
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

Nothing too major here, I actually thought I'd sent most of these
right before the new year, but that apparently got lost in the bustle:
- Turing MMU fault recovery fixes
- Fix mDP connectors being reported as eDP to userspace
- Fixes for audio locking, and other bit-rot from DRM changes since
atomic support was written
- Misc other minor fixes.

Ben.

The following changes since commit bc96ad6722f86a377ed2872c9a4854c90caf78ca:

  Merge tag 'v5.11-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next (2021-01-25 14:35:44 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.12

for you to fetch changes up to d1f5a3fc85566e9ddce9361ef180f070367e6eab:

  drm/nouveau/kms: handle mDP connectors (2021-01-29 16:49:15 +1000)

----------------------------------------------------------------
Alistair Popple (5):
      drm/nouveau/mc/tu102: Fix MMU fault interrupts on Turing
      drm/nouveau/mc/tu102: Remove Turing interrupt hack
      drm/nouveau/fifo/tu102: Move Turing specific FIFO functions
      drm/nouveau/fifo/tu102: FIFO interrupt fixes for Turing
      drm/nouveau/fifo/tu102: Turing channel preemption fix

Ben Skeggs (3):
      drm/nouveau/kms/nv50-gp1xx: wait for less EVO pushbuf space for
core updates without notify
      drm/nouveau/kms/gv100-: wait for less NVD pushbuf space for core
updates without notify
      drm/nouveau/kms/nv50-: add module option to select EVO/NVD push
buffer location

Frantisek Hrbata (1):
      drm/nouveau: bail out of nouveau_channel_new if channel init fails

Karol Herbst (1):
      drm/nouveau/kms: handle mDP connectors

Lyude Paul (9):
      drm/nouveau/kms/nv50-: Don't call HEAD_SET_CRC_CONTROL in head907d_mode()
      drm/nouveau/kms/nv50-: Log SOR/PIOR caps
      drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in
->disable callbacks
      drm/nouveau/kms/nv50-: Rename encoder->atomic_(enable|disable) callbacks
      drm/nouveau/kms/nv50-: s/armh/asyh/ in nv50_msto_atomic_enable()
      drm/nouveau/kms/nv50-: Reverse args for
nv50_outp_get_(old|new)_connector()
      drm/nouveau/kms/nv50-: Lookup current encoder/crtc from atomic state
      drm/nouveau/kms/nv50-: Use nouveau_encoder->crtc in get_eld callback
      drm/nouveau/kms/nv50-: Fix locking for audio callbacks

 drivers/gpu/drm/nouveau/dispnv50/core507d.c             |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c             |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                 | 230
+++++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/head907d.c             |  11 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c                  |   1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c             |   1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h                   |   1 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h               |  13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c        |  46 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h        |  32 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c        | 364
+++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c       |  21 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c           |   3 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h           |   1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c          | 113 +++++++++--
 16 files changed, 675 insertions(+), 167 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
