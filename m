Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8743F1621B4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD586E14B;
	Tue, 18 Feb 2020 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A936E054;
 Mon, 17 Feb 2020 15:01:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t3so20112988wru.7;
 Mon, 17 Feb 2020 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZwKNlGlgH9vI9bf0Wm+SGaOLEf/1HIsZf9f4U5ziC/E=;
 b=ehaZJHhvKbF8ezyaxIfMhTDIgJYeVpfpbKuo0MALepo30Dy1hf+En0XAAjGJwuI6Mr
 D6thB/yWYwPyI2PHX0SiAD5JJEz5hY+vE2Io9nK6Q/MCDa5mhvKvyYhBf+f0ntMmX2Yv
 sigoIiQkjNAk05gYTwXUjVgZtN1c23wq670YK/2tp1Gs5eD61uUHCKUAtMIp5yadlJwE
 f/FA1lcB5U0HrY/QRuR/C1QGbDFnF3ZbIGpVQJLsa8oQmQXL6Ks+HGLm6ANf0ynDrfqK
 Ye3fKMmnPW3vExV6yXHuxPAtEZ3pAwYw6Tj2+VJE93WQjKV1hxL1QSltdqt1fRKs4NJC
 mUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZwKNlGlgH9vI9bf0Wm+SGaOLEf/1HIsZf9f4U5ziC/E=;
 b=gns/R6U2KKSf5U6cIrZIzfNYpLm0Oau7u1KLpojOJB8kjdB/wKVX7GroKLw6Ckt+zN
 gX+ewGwrQD/7FigA6KcmFr31gzuNt1Xv7XlsYjm+wjINg7ANctjm1/Qum2eEyb9K+uaU
 HnIwtL6UJqUWPJuKeU/PI95hHbnCBsyyrcstrzwx/CETMilic+VoTQrO56CrXePDDRKz
 MDaOnv/8HLLyrI6oX8zSVP6JOGDgZKBtf08TnPpzJfMRFc55kK+9/bU99nA/KHH1UDa5
 wqVqAiC2ZrWjyG8LUq5WGTXGhqg/Ac3xlVBK7Q0U0TsGMtgEybZzTafAy1UFK3eA3nmy
 P58g==
X-Gm-Message-State: APjAAAW4hCz7PN3/wUAVSOQmCTMR21PpUgPGYtrzrecQLfeQL9+IChdI
 aNLkB6BrLL1ZRV/QB4JT6BXVFeEIyOZxYQ==
X-Google-Smtp-Source: APXvYqwBRNJ0pNFaAVJldUz1dzq8BAfahJTOMXCf1yD0MA+na0zy8YrojoBb94sv1+fzN96Luve2Gg==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr21638092wru.235.1581951713295; 
 Mon, 17 Feb 2020 07:01:53 -0800 (PST)
Received: from brihaspati.fritz.box (pD9566D64.dip0.t-ipconnect.de.
 [217.86.109.100])
 by smtp.gmail.com with ESMTPSA id j15sm1441099wrp.9.2020.02.17.07.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:01:52 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] do not store GPU address in TTM
Date: Mon, 17 Feb 2020 16:04:19 +0100
Message-Id: <20200217150427.49994-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
