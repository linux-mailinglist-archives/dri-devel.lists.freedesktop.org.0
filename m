Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E315D36A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631B76E8FB;
	Fri, 14 Feb 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87186E264;
 Thu, 13 Feb 2020 11:59:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so6333929wrw.8;
 Thu, 13 Feb 2020 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4Eig6zvROX0g8vFn99ixdNmLa1x2V9b6JIdaz3m8U8=;
 b=oNvDTmCAayz38sKIn2VGyRI2XNJHaMFiHWUCxP16oOkegMatlW1L/i5YmrZEbnSGnR
 MhfLsqihHI7IHPNlmdyly5qTlBCf+omi5Rzg0AMh3+y0+sEItxraCUohnOJt680XvEHg
 cNHuDQfXmZXwAbl4TDrnJ0wzBUzgz0H20Qs+XWOyQ9Afb9G8vDJ9/tGQ8qHvG6uMKOdA
 lxXNq4uFDjgrI0LyC+bPy9FI395rsWNO2Dmyj4HWoD0EfLcO1PVaYZSmyfSBQXo7hHYF
 KaJgMM95lKLd11FHDLW4SKw0TEJnYd4EG2dCHHW4l45mTIQ5uF5zQA1QJQhsho8T7WlW
 9/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4Eig6zvROX0g8vFn99ixdNmLa1x2V9b6JIdaz3m8U8=;
 b=fJuDQWrRVOGF2ZNczULwkxAV6ll/34hiTUEZDuQ1ZaMPKTfqHTwaBPqvZAtOq/VVrN
 9hfqpR7GZuSfmkq2/S+Z1pCVr5CyqUyDB+mFOsgawbpyULpICa9K3ZOdF/44yEFC5Qgv
 bANRFbizliE+94WvLs7SXL5eVuPMr4UtaVf8hjlVN76YTn/rqL/oYJC0Ry/msQ+Ma/QU
 W1NJITzsUAKGdvjuVGtgl7WwgJQgBLkOIUxdgelNIRZT/0KM+jf1UoGFtnCn/2bBxswm
 YUsQZiTjfTij01co5Av7dEZzMRWEDx+6Q3lZF+9+pS4/MEziCX6dBPTViZ2MC0MWUGTc
 f99g==
X-Gm-Message-State: APjAAAVvXpALKu+xuvzIqcDYCAbppr6y4Bk/lh/++zK3SWIU9zxpB4vq
 toWola5RUcjXP1avLja+8XhqxP9/bfXYOw==
X-Google-Smtp-Source: APXvYqzTvldfY512qh/JjyfKfrvYrihwEEj2rl6GCVwerLpLVP1tp/Yg82IxMsTVtuTXuiKiUlN7ng==
X-Received: by 2002:a05:6000:1:: with SMTP id
 h1mr19829946wrx.380.1581595171949; 
 Thu, 13 Feb 2020 03:59:31 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2A5E004DB99F42976E8A13.dip0.t-ipconnect.de.
 [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13])
 by smtp.gmail.com with ESMTPSA id y131sm2803985wmc.13.2020.02.13.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 03:59:31 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/6] do not store GPU address in TTM
Date: Thu, 13 Feb 2020 13:01:57 +0100
Message-Id: <20200213120203.29368-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
This is required[1] to continue the work started by Brian Welty to create
struct drm_mem_region which can be leverage by DRM cgroup controller to manage memory
limits.


I have only manage to test amdgpu driver as I only have GPU for that.
I might be doing something really stupid while calculeting gpu offset for
some of the drivers so please be patient and let me know how can I improve
that.

[1] https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg272238.html

Nirmoy Das (6):
  drm/amdgpu: move ttm bo->offset to amdgpu_bo
  drm/radeon: don't use ttm bo->offset
  drm/vmwgfx: don't use ttm bo->offset
  drm/nouveau: don't use ttm bo->offset
  drm/qxl: don't use ttm bo->offset
  drm/ttm: do not keep GPU dependent addresses

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
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
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
 drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
 drivers/gpu/drm/qxl/qxl_kms.c               |  3 +++
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
 33 files changed, 99 insertions(+), 72 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
