Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19630538E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 07:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1206E54C;
	Wed, 27 Jan 2021 06:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0906E54C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:52:45 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id w24so1052314ybi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 22:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0D+F8Y49MxjksfFCzvTGdApU38+e8pigQN+eeKNN4tk=;
 b=bZP7K3pIv+r6WLsqEbO8957rHR56BZpSnnn7xKywKVN34TfFT2/XAYQcOPj0Ix50cW
 7J9Gzu1Scw5MI6tyaejwP1eQ0tYxOGSnLPXpVfzq+A7sQETFnrA1qhcejAKEHKF2vuU/
 IYEV5nVGPNDNnvw3Qlo2EbHVa7bdKI6Sn2Oxl2FeFSKWPohMHrbmReZsY5I/4LFGbfiW
 HEBdiabqJstKHlds/zruRCuUSsDtwbzUEN1djoR6ODR3CjbE9pS0s7ViB82sXx0kw4Gh
 wiNExJshxhzyj8bIHdrUXp5/ofuudPu2vi0aam4NTN2x5WzfFCcmyGlJ5IAMfoELbgke
 bJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0D+F8Y49MxjksfFCzvTGdApU38+e8pigQN+eeKNN4tk=;
 b=QCrKkV7M6L9PPw6+s/J/22svhXXVdDBE3jd8mxNtEY0x+VWvTx/lFlO8IH/Kk1Pbhr
 amoa4COz9dgu7mN45YVjDemXJiy51Q3xG1Zf1eVa+1ONW5QNyckMXFMcHgWQPaViurtS
 6N5RwJyh+xk+TrdMh8sxM5yC6Yh5/8s6apWqukpsUOn8AKOnSM33Ig+JBWO+uGqG4MNW
 ZoC7PWH3dXSqCTeja18PoZjesr2yHkcUdS82A1T67i8ADRs1c3eLgKrF9kPBJHGW3TA3
 oJ0VGzqlLe45KsUzX7a5zYsKV6ygUQPBKEIXHyAY7GfN2doLfBBXyd8JA+fNARDayjmG
 +aKg==
X-Gm-Message-State: AOAM532dehatX0UjuRpVEfy9DbyaFJ8q1s/2LNDmm+flIZcuWz2djiiD
 ca1KHd76oa1iHkeaA2lilFS2eBToMBoLFwYWYPQ=
X-Google-Smtp-Source: ABdhPJy+/dRTtuA76Q2fpq3CaUuDcJSZeT+z5U38yod/0GAh6nFhSIEmjGrYea5fbLWXzlUHWJ5tL6YtzK0KRatrW38=
X-Received: by 2002:a25:ea53:: with SMTP id o19mr15421388ybe.94.1611730364391; 
 Tue, 26 Jan 2021 22:52:44 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 27 Jan 2021 16:52:32 +1000
Message-ID: <CACAvsv4Y0ZiAevSvgphLAOaZjFi75ECXqUD9ShBvRxZ6S-pb9Q@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.11
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

Mostly a regression fixes here, a couple of which could lead to
display hanging, and have been affecting a number of users.

Ben.

The following changes since commit 8ef23b6f6a79e6fa2a169081d2d76011fffa0482:

  drm/nouveau/disp/ga10[24]: initial support (2021-01-15 10:25:24 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux 04.01-ampere-lite

for you to fetch changes up to d2be5ff9f287b8815c36e95ea34dc4b09f313c3b:

  drm/nouveau/kms/gk104-gp1xx: Fix > 64x64 cursors (2021-01-27 16:36:13 +1000)

----------------------------------------------------------------
Bastian Beranek (1):
      drm/nouveau/dispnv50: Restore pushing of all data.

Ben Skeggs (1):
      drm/nouveau/nvif: fix method count when pushing an array

Karol Herbst (1):
      drm/nouveau/svm: fail NOUVEAU_SVM_INIT ioctl on unsupported devices

Lyude Paul (3):
      drivers/nouveau/kms/nv50-: Reject format modifiers for cursor planes
      drm/nouveau/kms/nv50-: Report max cursor size to userspace
      drm/nouveau/kms/gk104-gp1xx: Fix > 64x64 cursors

 drivers/gpu/drm/nouveau/dispnv50/base507c.c         |   6 ++-
 drivers/gpu/drm/nouveau/dispnv50/base827c.c         |   6 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c             |   8 ++++
 drivers/gpu/drm/nouveau/dispnv50/head917d.c         |  28 ++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c             |  17 +++++--
 drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h |   4 ++
 drivers/gpu/drm/nouveau/include/nvif/push.h         | 216
++++++++++++++++++++++++++++++++++++++++++------------------------------------------
 drivers/gpu/drm/nouveau/nouveau_svm.c               |   4 ++
 8 files changed, 174 insertions(+), 115 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
