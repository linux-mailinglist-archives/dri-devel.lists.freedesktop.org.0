Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BEF29F92C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 00:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF196E928;
	Thu, 29 Oct 2020 23:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9589C6E928
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 23:37:56 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id n142so3622922ybf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 16:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EvbLiLq/KfCgi8ntZSDRIZyzl2afL2LhX0iQBAg9Qvw=;
 b=BsHZLuIDnvnjwf7CChCNCgPUpUZU92wRNjdfqZ8aIv5iLbOsd4HMDMwPENZDRzZDB2
 eghdCUM0s1FCJHcPrhZlqh7RfRpvlmCHzg8Bg9jlJgFnmnj0El2Gfns7CpNyseYtE3WY
 lMZiKFzRIXa/JTj5bsgXTFp8EmBey20JEGmXp/3NSDncdTbAxMvM7bAzt/+/qP3etEsS
 pBlLnHlzH2GEjRuYILY/MkJm+YwzqSCjbweOZ/PayAIHHD8+76rgm8w2AImrLbgOE/xk
 ViWCNL6TPYdm0j3sO+rTbdp4mylNYgCER/YfYz4thOSIhzUwBByib6JfsM/T/EcBz9+H
 d9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EvbLiLq/KfCgi8ntZSDRIZyzl2afL2LhX0iQBAg9Qvw=;
 b=IT5So3Wrhs9cxFjcypwv1wPeY2pr24gZwb0ZJLoAVz/80vM4O5/P9+Ib5NwQgb57Ah
 kfHvP4qYi+oCWwXzWuxjgN21S/Ia6GaK8FtlFDIjc6nnG9gLC3qjkQWsnm5TO9t2TfXH
 Z4o9bf/LEnxmh0AHqQeNS0F0C+x+zX8s2PlsRPqnY2VuwxqYd0WwoPXLNK/xqr9HSHVZ
 641P9Gzb7gaCu70EWcwVeCz/QrmAw4QtMPMVqgN5tmvbfgq2JVpSShq2oyGYNX4gS8Al
 1Iq2v0DgSnmAicRRjMVbHHI7IoC/hW7FRW+XktQXjuX8gbD2nSixBgorq62fE4/FOWc4
 5OSg==
X-Gm-Message-State: AOAM5304mumIiQX13hV6GDdvEscFmC7gUDtQpvszknOtj8Gu/6WOoK94
 UKK/Xgq/TNam2B/ZigoR4Ye6HXLxoG5Fv8kqhzgXuCqLXDHm4Q==
X-Google-Smtp-Source: ABdhPJwdCLX4JDoiV68tKGSS9EHBXukviIiBTsW25D6VAKT2Uq0IVDeyP2FPYXR3qQYontB2SCEzhdJ/HXtOnlRZgeA=
X-Received: by 2002:a25:3784:: with SMTP id e126mr9757569yba.141.1604014675578; 
 Thu, 29 Oct 2020 16:37:55 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 30 Oct 2020 09:37:44 +1000
Message-ID: <CACAvsv6MOjtgzKchpis1XrZYmu7-6CaxnHVzJKOXPH62_em7tw@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.10
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

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.10

for you to fetch changes up to d7787cc04e0a1f2043264d1550465081096bd065:

  drm/nouveau/kms/nv50-: Fix clock checking algorithm in
nv50_dp_mode_valid() (2020-10-30 09:34:13 +1000)

----------------------------------------------------------------
Karol Herbst (2):
      drm/nouveau/gem: fix "refcount_t: underflow; use-after-free"
      drm/nouveau/device: fix changing endianess code to work on older GPUs

Lyude Paul (3):
      drm/nouveau/kms/nv50-: Program notifier offset before requesting disp caps
      drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
      drm/nouveau/kms/nv50-: Fix clock checking algorithm in
nv50_dp_mode_valid()

Ralph Campbell (1):
      drm/nouveau/nouveau: fix the start/end range for migration

 drivers/gpu/drm/nouveau/dispnv50/core.h             |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c         | 41
+++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/core907d.c         | 36
+++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/core917d.c         |  2 +-
 drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h |  5 ++++-
 drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_connector.c         | 36
++++++++++--------------------------
 drivers/gpu/drm/nouveau/nouveau_dp.c                | 31
+++++++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_gem.c               |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_svm.c               | 14 +++-----------
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c   | 39
++++++++++++++++++++++++++-------------
 11 files changed, 145 insertions(+), 68 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
