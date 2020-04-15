Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B210C1AB3B1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 00:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D1D6EA9D;
	Wed, 15 Apr 2020 22:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64996EA9C;
 Wed, 15 Apr 2020 22:16:44 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id t3so15495242qkg.1;
 Wed, 15 Apr 2020 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=spCyqynhDluy496NZnvbXF3CDsF0fzY7DF2oe/sZn/4=;
 b=ZMIwcIz5N/IUsU56uUjEWMC/6RS9baF2je39UzzJ8glXSWifwnpaSQXljPahxDyOXy
 +cZOMVevIsICjpitoJOwg9g3gQfIJuUPBDUwXHsasDCIxTDdI0GwV3voiTwO6jFT5uRV
 zsjeIMRd/r54oxWJljZjc4WSwDlwgoJqCzqJ3zBL+46uYCimkGT3K/wlTDVPBQtmtxXt
 BdPo0agVrErs59vkC62oigUj59iedFBtJ1OOzxa05rb6t8Mffu4XSy8zqzvr6V0YHhsw
 LLi9X6yc+WmWrxvwjYq2OUgaj4g/8UvxPirsIC/4IhOD6LGzqJP9r5FxTj9YsZ7Id6xY
 YqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=spCyqynhDluy496NZnvbXF3CDsF0fzY7DF2oe/sZn/4=;
 b=EYQYWvnhVQf73GdRvA4Tg436wpnfq5ofPWm74biBJEgKOgwiiT9Mw0rf78tphNMD3u
 U41/zzq7p/YptzZVXmkzuWDCuV2BsIfypiniprTv5Tzf4+MhIckJYdh4LG6MzCp5BGep
 NwiP57BoYwjzxXQxw0kmDdK0OcgnnD1VrCzvs/NNklOrGIEfMBYSFl/8mAXWA6IBvcyA
 pIxgKhgF5gZikL+DvAvkgROekiRf3LjP3hOiXoOYImhxvLr9MenSBUNLZS0szaehCisA
 LHanppZ2mnOvIglAyZER3i7BnSUn7G+mAeTm79xbvVIIvX3quDKB4zAzKGRnWlIEcdtJ
 74AQ==
X-Gm-Message-State: AGi0PuZlyifKDW6N5kuq27JIvXEPIeyo+bMz7e80A39mYi7VjbhXh9Bv
 5ZJHV22KdnxooSmVyMWdzkbHx4m0
X-Google-Smtp-Source: APiQypIv1OuIW6JaCdd+NnGt/HRZopuuX9tSJ94rgNmGZll/TI8vXXAThgjmgemdVp1RglAwutEk4w==
X-Received: by 2002:a37:ad0b:: with SMTP id f11mr28109793qkm.125.1586989002400; 
 Wed, 15 Apr 2020 15:16:42 -0700 (PDT)
Received: from localhost.localdomain ([172.58.187.145])
 by smtp.gmail.com with ESMTPSA id o13sm13278057qkg.111.2020.04.15.15.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 15:16:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Wed, 15 Apr 2020 18:16:31 -0400
Message-Id: <20200415221631.3924-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.7.

The following changes since commit 7e7ea24f0b46cd3078bc9af29d1c1aced89d1c8e:

  drm/amdgpu/display: fix warning when compiling without debugfs (2020-04-08 17:53:11 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-04-15

for you to fetch changes up to 974229db7e6c1f2ff83ceaf3022d5128bf62caca:

  drm/amdgpu/gfx9: add gfxoff quirk (2020-04-14 12:48:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-04-15:

amdgpu:
- gfx10 fix
- SMU7 overclocking fix
- RAS fix
- GPU reset fix
- Fix a regression in a previous s/r fix
- Add a gfxoff quirk

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/gfx9: add gfxoff quirk

Evan Quan (2):
      drm/amd/powerplay: unload mp1 for Arcturus RAS baco reset
      drm/amdgpu: fix wrong vram lost counter increment V2

Likun Gao (1):
      Revert "drm/amdgpu: change SH MEM alignment mode for gfx10"

Prike Liang (1):
      drm/amdgpu: fix the hw hang during perform system reboot and reset

Sergei Lopatin (1):
      drm/amd/powerplay: force the trim of the mclk dpm_levels if OD is enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 22 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/cik.c                 |  2 --
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/nv.c                  |  4 ----
 drivers/gpu/drm/amd/amdgpu/soc15.c               |  4 ----
 drivers/gpu/drm/amd/amdgpu/vi.c                  |  2 --
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c |  5 ++++-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c        |  6 ++++++
 9 files changed, 33 insertions(+), 16 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
