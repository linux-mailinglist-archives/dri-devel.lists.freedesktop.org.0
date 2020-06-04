Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB81EDC9C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 07:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E1C6E16F;
	Thu,  4 Jun 2020 05:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424E6E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 05:00:30 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id v15so2293308ybk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VtiTCssO88BBU0c/G4Sg0T1COj71XCtCYSihC3/yz7c=;
 b=mUkcvP+dtGhgIg3uZ+Qpp0Tsk57x8/feR/++pHLSl14uqlsmmtFxPy1gxvl1fhqLuo
 F+zC/Jjl10tu/IjIleJIdwrfphaSAVhCVTQ5lE/r8edpA2hPpEMGaT7GZFhTH7blrBsj
 c4XySZrqQ3i6bIpMaIS2rF7bkucmiRnlMqZcWPQQ+Ut8GGmlVhteQ3D//EaWr8QWA/Q1
 NBsfpuBXYp+uOdcK9wqsUMGZfXngUnP80PkJuL3wdJoEBDFBwCxF5Ki5ln+eNm49CtV3
 xKw4IjSunXvlOc0934nYJg77w1pyYjWFP7Z03jR+vfOO/d+nWcLFBR3VBazkwyoOPW6b
 EjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VtiTCssO88BBU0c/G4Sg0T1COj71XCtCYSihC3/yz7c=;
 b=i8IJpAdgWlCy332TfZyAYHsr33fwIlfY0e4FlAmw7p8xSavVREpU0N40/+AClviBdZ
 oOrSwRRI35jRfmK/+2noTKV4OwhiFXC+UiuC0q22Y1j2D93d3U1+ELIFwN9d4T3J8xWw
 zE3Rx1Y/7igK8sCzcJBOGJTwkXTBeu92C3bzO2wALp7B/6A+jFoXfdpGbg/3V3flOTnu
 N2Xhg3dnmjQRRa4/GX5wFpeMQFi3YKzqtDZwcjZx6d037uT66s9ceTblVnnWCV8m8Nez
 zIEq9RsWBtTQacJ+z193G04v97Jxa6hNWhtthnzn8kTw+NBWuJGD8GALUitdldPdv3cQ
 sZQg==
X-Gm-Message-State: AOAM533uyPJuppQd5wiIKtGqddxRjFIj4qOnqTXLuPtDnBE2fraqj+bT
 k6S7oxQqSCxDJX2S6KNs4MGA4SrHpyM4QW1nizESdvxp1E4=
X-Google-Smtp-Source: ABdhPJzc6Hx7I38Xx8RF+f1Ff8e469f16hEhb0Q5INqz9iPoHjOWz2tOB+uDzLkWbhp1tchZ7PuT4aG2g2r8gjqjDNI=
X-Received: by 2002:a25:6ad5:: with SMTP id f204mr4734221ybc.147.1591246829684; 
 Wed, 03 Jun 2020 22:00:29 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 4 Jun 2020 15:00:18 +1000
Message-ID: <CACAvsv4PW6tAZY6Uvrhi5OV+4rDXvrtNcoq2w_i35YajByj+ew@mail.gmail.com>
Subject: nouveau-fixes 5.8
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

Hey Dave, Daniel,

Another -fixes pull for nouveau, mostly more HDA fixes, but also a fix
for display hangs on Volta/Turing, and a GK20A regression fix.

Thanks,
Ben.

The following changes since commit 0ad679d157aa69ddf0ee46b564c9fbb646cf6d4e:

  drm/nouveau/kms/gt215-: fix race with audio driver runpm (2020-06-01
17:28:42 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.8

for you to fetch changes up to dd67cab5db7e940dad66653a04d780d53bd380d5:

  drm/nouveau/kms/nv50-: clear SW state of disabled windows harder
(2020-06-04 14:23:22 +1000)

----------------------------------------------------------------
Ben Skeggs (6):
      drm/nouveau/disp: provide hint to OR allocation about HDA requirements
      drm/nouveau/disp: split part of OR allocation logic into a function
      drm/nouveau/disp: modify OR allocation policy to account for HDA
requirements
      drm/nouveau/disp/gp100: split SOR implementation from gm200
      drm/nouveau/disp/gm200-: detect and potentially disable HDA
support on some SORs
      drm/nouveau/kms/nv50-: clear SW state of disabled windows harder

Thierry Reding (1):
      drm/nouveau: gr/gk20a: Use firmware version 0

 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 17 ++--
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  5 +-
 drivers/gpu/drm/nouveau/include/nvif/cl5070.h      |  3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    | 73 ++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c    |  4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c    | 36 ++++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c    | 93 ++++++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c    | 35 +++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/sortu102.c    | 32 +++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c     |  2 +-
 15 files changed, 270 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
