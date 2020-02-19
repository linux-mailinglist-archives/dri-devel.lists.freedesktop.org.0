Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD701649DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386226EC31;
	Wed, 19 Feb 2020 16:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232F76EBED;
 Wed, 19 Feb 2020 13:50:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id s10so721289wmh.3;
 Wed, 19 Feb 2020 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ve5AiTB+hwV3bTLLvFUvEQLHnunRESEQVviemNyPEOE=;
 b=Z+K7KO24dbA4S9kF/auLZ32y4UirHxa6Gm3qK6uPZxyAP0Caqm7NNV3L89uCWSNAcX
 /ycoycYk+nld0Z0UUanp4v+lVNuENBHKcVtjgoJPX+HJtcYL9QvAk9er4DzH9TGQdKnO
 nr4NmbMYgd3IzTz8aamnQ6dw3lajZQ+3EThMPW2USzBybhqXZrLBv6g5oVdyCsG5Lz60
 jrBHHHQKj0PmlasLXbclqBqMwfEGoZccS6JAU1ITkM+UrLG9Est/Ef4QrOUeU244q81e
 TKRS5xMj5jvx4hkRHbmEssV5u3k3lSdoVtUoqEozVAPdJItUclrqr+w/U0CvyWkU3BeT
 iBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ve5AiTB+hwV3bTLLvFUvEQLHnunRESEQVviemNyPEOE=;
 b=aHf/qUZwYabkaxTfRjsQXhobnAYINOhKDsejBIt+96cUW2gpF+locD/Ua5zry6qZA1
 YGasOPCS5TThzQaS+bCBeD2Xyp6je3/wwgoXkgwkSGMR2aiqQphWQ8/MuAMf7kY79YVN
 mgzXZDHzlru1CXI/iNpUmAIzor9CZjfe3j5A/KFnpiREArRUcBsWNt5ec+xu3N+Vgov9
 XvJSLjqiezhTRKJMey6EJxAjV8Ji6eFMYrzbLdcaniSn40/Juxk4hOMRBsvmaCXGVYAR
 o4Jdy2bxw21TULYKTNM3It72SmkDYm/k8p2DA4Wq91YZOiMDXg0i5ZGfuMEu+lDBc7x9
 fqeg==
X-Gm-Message-State: APjAAAVOHA38Rl+HajR80i0mmb4JDPvcJgTu+75+RvdOyN7ChRGkGnX4
 cYNPSy8Cn7V1tTqjYxrDF3qUVUPGITjmMQ==
X-Google-Smtp-Source: APXvYqz0/Caswsgey1+QmkeKr4GBw5HAH82YwpJRHVOELGkvgnKFthA/Srhkuy8pNjEHQTwACGzfLA==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr7517610wmc.12.1582120238419;
 Wed, 19 Feb 2020 05:50:38 -0800 (PST)
Received: from brihaspati.fritz.box (p5DE53754.dip0.t-ipconnect.de.
 [93.229.55.84])
 by smtp.gmail.com with ESMTPSA id y1sm3061881wrq.16.2020.02.19.05.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:50:37 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] do not store GPU address in TTM
Date: Wed, 19 Feb 2020 14:53:14 +0100
Message-Id: <20200219135322.56463-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 16:18:11 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this patch series I am trying to remove GPU address dependency in
TTM and moving GPU address calculation to individual drm drivers.

I tested this patch series on qxl, bochs and amdgpu. Christian tested it on radeon HW.
It would be nice if someone test this for nouveau and vmgfx.

v2:
* set bo->offset = 0 for drm/nouveau if bo->mem.mm_node == NULL

v3:
* catch return value of drm_gem_vram_offset() in drm/bochs
* introduce drm_gem_vram_pg_offset() in vram helper
* improve nbo->offset calculation for nouveau

Nirmoy Das (8):
  drm/amdgpu: move ttm bo->offset to amdgpu_bo
  drm/radeon: don't use ttm bo->offset
  drm/vmwgfx: don't use ttm bo->offset
  drm/nouveau: don't use ttm bo->offset
  drm/qxl: don't use ttm bo->offset
  drm/vram-helper: don't use ttm bo->offset
  drm/bochs: use drm_gem_vram_offset to get bo offset
  drm/ttm: do not keep GPU dependent addresses

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/bochs/bochs_kms.c           |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c       |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
 drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
 drivers/gpu/drm/qxl/qxl_kms.c               |  5 ++--
 drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
 drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
 drivers/gpu/drm/radeon/radeon.h             |  1 +
 drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
 drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
 include/drm/ttm/ttm_bo_api.h                |  2 --
 include/drm/ttm/ttm_bo_driver.h             |  1 -
 35 files changed, 99 insertions(+), 76 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
