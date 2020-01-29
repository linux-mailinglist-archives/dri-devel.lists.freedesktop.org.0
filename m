Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF914C625
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 06:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9B6E1B7;
	Wed, 29 Jan 2020 05:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc2f.google.com (mail-yw1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB686E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 05:55:37 +0000 (UTC)
Received: by mail-yw1-xc2f.google.com with SMTP id b81so5718939ywe.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=m3zWIg4noL5Yk/yrN3CdG2y2KqLJ0OcFuiU/Yp4BMfY=;
 b=YjIq7NQ94+ygDGxXKwlrWQcddRG1F4t6IA+iqNqRFEZE7t802n9E81sPEebqiBmlm1
 3mFcYfHhVuOY4rFFcJsAdao7c4bbE/UeEXDZtNFhnFgdWhPHYo4yS5QAvd9SLWkQPxtS
 vZf2/13YlNaPgajvO/MJRUNiss+xDY2fANr52x5MeRlsZ2fHitJ/jNpWIkULXoMPm/t4
 o9A0yJcaqqk+G0gmjMjOoLSnTQfm/k9faepqrq6dnuQouuPsyqH4hbTeIUCagmpww1Wj
 v43MsAo9dta/WdxqFepbgppno2Zt+qO2Vi1qLPm5sXN6ERFebijL6aq/c2UUOUz1Lbvc
 kLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m3zWIg4noL5Yk/yrN3CdG2y2KqLJ0OcFuiU/Yp4BMfY=;
 b=KhML1vkl/VoKzHJY3t0Nwja/9ycncS2ADSteCY335tqNyT//wxx7/jMEL+/wxnnt5W
 l0h7Ws7+bfBOJ8pBIa62NiQQiVkawsf4oilZDAw3+T0J94uKMs9LBf4i+a5cf2sylUML
 qMlHHx/XiX+WbO7Ms9iWyqCoL+MIetLEPcmuBglHyEW3GX0RCDH0TLyYvdO44t9BMz4x
 M6CsFgZzc5L3jBhrZMY8rY/YM69yjWycQpsUjXfuo6LaHLrn388gXMNUizFZp0GLXox7
 IJSOjAY/y0/bYONJpJq/eoL1D98vXOIbjJsmCj+B75ejmqOVAcmKMGry/39IhTHGE7jP
 ++Ig==
X-Gm-Message-State: APjAAAW39LYrcnJf3FpOQelZCe3pOQN5QWVWlrhghwtmHi/u5fcdbVYZ
 AhgZc14MFiez1igchztOnIC0ojmxCP1QRGWEfzgzG1ajd6o=
X-Google-Smtp-Source: APXvYqw5qVj5l1zNPPzQWGZy/sJykhwjCUQOqFWlyTzFWLxZvgQmPG4Hp3D1Wt2/P37RsNDrytn9/RKqStkvre5WHd8=
X-Received: by 2002:a0d:f844:: with SMTP id i65mr18171606ywf.341.1580277336790; 
 Tue, 28 Jan 2020 21:55:36 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jan 2020 15:55:26 +1000
Message-ID: <CACAvsv4xcLF6Ahh7UYEesn-wBEksd2da+ghusBAdODMrH7Sz2A@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.6
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

A couple of OOPS fixes, fixes for TU1xx if firmware isn't available,
better behaviour in the face of GPU faults, and a patch to make HD
audio work again after runpm changes.

Ben.

The following changes since commit ee8642162a9edd40daafd3fb894e3fd3f909e361:

  drm/nouveau: fix build error without CONFIG_IOMMU_API (2020-01-23
08:56:51 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux-5.6 linux-5.6

for you to fetch changes up to c3463aed05abf06bd5ebaac12f2c015db298b98f:

  drm/nouveau/fb/gp102-: allow module to load even when scrubber
binary is missing (2020-01-29 15:49:56 +1000)

----------------------------------------------------------------
Ben Skeggs (8):
      drm/nouveau: zero vma pointer even if we only unreference it
rather than free
      drm/nouveau: reject attempts to submit to dead channels
      drm/nouveau: signal pending fences when channel has been killed
      drm/nouveau: support synchronous pushbuf submission
      drm/nouveau/disp/nv50-: prevent oops when no channel method map provided
      drm/nouveau/disp/gv100-: not all channel types support reporting
error codes
      drm/nouveau/acr: return error when registering LSF if ACR not supported
      drm/nouveau/fb/gp102-: allow module to load even when scrubber
binary is missing

Takashi Iwai (1):
      drm/nouveau: Add HD-audio component notifier support

 drivers/gpu/drm/nouveau/Kconfig                    |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 111 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   2 +
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   7 ++
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  10 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  13 ++-
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/channv50.c    |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |  23 +++--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c     |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |  39 ++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |   5 +-
 include/uapi/drm/nouveau_drm.h                     |   1 +
 14 files changed, 201 insertions(+), 22 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
