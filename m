Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF325209A7E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D826E32D;
	Thu, 25 Jun 2020 07:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443B96E365
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:25:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so3201478wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4r2nh1YZbdvKhKNbHCCI24ldCz0Z0YtzguyN7GOK0ng=;
 b=MCQLYs1mbKJcb1JrQ2ngzzRFM86XLvMqzjmFiJcqeEYH6RqxMVriDpuksrI/yaX98E
 8k5SYSoDZguKB84YmhCe477zKNzLM1hBRWoDnDhrFhp0ZTmXjI3Jc8UMhEe05/3b9lUA
 ozpUif16Di1ZpJYHmNdLu1yqOmCrNUKNGweMgCHuAGQX2cWvrctEaZxXLxCpphZ9WTtI
 81xea+AqQIT1JIOOTi8S316M+lkvbRjKRfXlxBw+gjCZDDdUiBecsfrIF538CgxtuvDq
 alkRJRi0MkP61+QtLLFG2Di5Z/Pn3/cHU2FMExHdX/MP+Qfi4/si9hpcn8ZLnHYO3R3a
 4t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4r2nh1YZbdvKhKNbHCCI24ldCz0Z0YtzguyN7GOK0ng=;
 b=GDwcYu8i4bz0dl4zDqIK5ldIstMkvSHiBJlFZptDhhXZaNeMgekwrHnW0HTRTdMqze
 UGF6+RXUkroycaq/YT3DEZZAqXPchzsiKVGx1Gj9sr1h5BPf94vvvZL9hd8yqOs0hAWR
 JyYOr4SV1j3nbAUg17Z5ww1/fQHjhnPyvxx/v5/sDG+Z1HUysdUHLoyuW3FpHU1pkB1p
 HOiDQyhnvV794pyXFsb/2Ror8yyCUnvn7NdJObFNmK09OQzejYpaZ97YI1ENhyS5U/fi
 9xtDGwIZlWG7BicCB55U7QoBX+NUK4shGyWQzLWllGFV7CRbEyMc4qYtMWVxivWD8I3j
 u7mw==
X-Gm-Message-State: AOAM5303lOj0UqNO5a06otUD17h1RyOom5C+KTZ/xOTqiS388qIfzG5K
 7jG2Ta7ecY6eVDn6EFA9v2rWysI1aPVPU1OX
X-Google-Smtp-Source: ABdhPJzT4i8TYPbYXTZJMmFSiBxqsGqg4eqgoXMG37cACB5PILIqfR+YD5/9mgngLY9prmHxQWn1gQ==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr18394372wmi.98.1593023128288; 
 Wed, 24 Jun 2020 11:25:28 -0700 (PDT)
Received: from brihaspati.fritz.box (pd9567914.dip0.t-ipconnect.de.
 [217.86.121.20])
 by smtp.gmail.com with ESMTPSA id a22sm8734086wmb.4.2020.06.24.11.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 11:25:27 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND] [PATCH v6 0/8] do not store GPU address in TTM
Date: Wed, 24 Jun 2020 20:26:40 +0200
Message-Id: <20200624182648.6976-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this patch series I am trying to remove GPU address dependency in
TTM and moving GPU address calculation to individual drm drivers. This
cleanup will simplify introduction of drm_mem_region/domain work started
by Brian Welty[1].


It would be nice if someone test this for nouveau. Rest of the drivers
are already tested.

v2:
* set bo->offset = 0 for drm/nouveau if bo->mem.mm_node == NULL

v3:
* catch return value of drm_gem_vram_offset() in drm/bochs
* introduce drm_gem_vram_pg_offset() in vram helper
* improve nbo->offset calculation for nouveau

v4:
* minor coding style fixes in amdgpu and radeon
* remove unnecessary kerneldoc for internal function

v5:
* rebase on top of drm-misc-next
* fix return value of drm_gem_vram_pg_offset()
* add a comment in drm_gem_vram_pg_offset() to clearify why we return 0.

v6:
* rebase to drm-misc-next
* removed acked for vmwgfx as there was a small conflict

Nirmoy Das (8):
  drm/amdgpu: move ttm bo->offset to amdgpu_bo
  drm/radeon: don't use ttm bo->offset
  drm/vmwgfx: don't use ttm bo->offset
  drm/nouveau: don't use ttm bo->offset v3
  drm/qxl: don't use ttm bo->offset
  drm/vram-helper: don't use ttm bo->offset v4
  drm/bochs: use drm_gem_vram_offset to get bo offset v2
  drm/ttm: do not keep GPU dependent addresses

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 23 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 30 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
 drivers/gpu/drm/bochs/bochs_kms.c           |  7 ++++-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 11 +++++++-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  3 ++-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++
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
 drivers/gpu/drm/radeon/radeon_object.h      | 16 ++++++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
 drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
 include/drm/ttm/ttm_bo_api.h                |  2 --
 include/drm/ttm/ttm_bo_driver.h             |  1 -
 36 files changed, 125 insertions(+), 78 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
