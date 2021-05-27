Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46388393087
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8446E11F;
	Thu, 27 May 2021 14:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8196E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 14:13:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id z130so306797wmg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdxyhH0wur5KLNsCWXopmQq3ABiHKSl14hPvrAXcvf0=;
 b=V8ZVqM1wglTxhFo/0B6oKs8+QOJiZDVSbbHIDKpC2JgrmNI0KVDuXzu4eePuVZ81N8
 H5tN3Ouz1Jtu+tkaKTIwa4BRuWiop9m3p5mdxNKw4U9sdI6TZuM3jeSqFalEWluWHejI
 o8S+v3M4BxtfE6nqlLN40rKkIxd8cehLN9OQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdxyhH0wur5KLNsCWXopmQq3ABiHKSl14hPvrAXcvf0=;
 b=LCBqDCUb2hvD6I5S7JRYe9F94PLH5U3e5J/KcV97vyciCv4/9xszeEewB+VV056G7O
 5yDh/fhefRI095Oy0MtUM+6h9Sh+2PWF6QJPUuj6YZWfXCwQD7bvWoIr7IXPu/8v+//j
 5gkozZ/xr8Jmhbfi0Vb43WaOv/eQzSy6JoorPhIo7nZLVBZs9WVJPLmfKPwsFhxHcWLK
 LpMSFYHiAqyn3HxPAciuCz3EmScACLojvjSwNhVMm96g4LJObqcjDTxT4ZWlfm/RXslf
 MOH9heWcRsHh7QtNGmTtqXlxaN6kl7+kvTy9MoVBI3ICJ8wyl2+zdiAe8IptOt1MU/OE
 Evig==
X-Gm-Message-State: AOAM530Qui4LZ7Y/jEY+5Axef039goQhH9fFEgqbFWb9dxolSFqYMZqO
 e0MI36MXJeubLEfwLuurBDrYGg==
X-Google-Smtp-Source: ABdhPJzYLGwLAkIzasJBNl1i0oRV26gEea/yJ2DSZXXiFXqUWgjtJ1FiDncBfhhjemk0ayK56PqOpQ==
X-Received: by 2002:a05:600c:2f9a:: with SMTP id
 t26mr8899200wmn.166.1622124823103; 
 Thu, 27 May 2021 07:13:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm3381136wrt.65.2021.05.27.07.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:13:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 0/4] shmem helpers for vgem
Date: Thu, 27 May 2021 16:13:33 +0200
Message-Id: <20210527141337.3857901-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Another round at attempting to use shmem helpers for vgem and also getting
them to not use VM_MIXEDMAP. I found an igt which had some funky encoded
expectations, so now neeeds a cover letter to test intel-gfx-ci how to
test this.

I also noticed that etnaviv and tegra are also using VM_MIXEDMAP (aside
from ttm based drivers).

Test-with: 20210527140732.5762-1-daniel.vetter@ffwll.ch

Cheers, Daniel

Daniel Vetter (4):
  dma-buf: Require VM_PFNMAP vma for mmap
  drm/vgem: use shmem helpers
  drm/shmem-helper: Switch to vmf_insert_pfn
  drm/shmem-helper: Align to page size in dumb_create

 drivers/dma-buf/dma-buf.c              |  15 +-
 drivers/gpu/drm/Kconfig                |   1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c |   8 +-
 drivers/gpu/drm/vgem/vgem_drv.c        | 340 +------------------------
 4 files changed, 21 insertions(+), 343 deletions(-)

-- 
2.31.0

