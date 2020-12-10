Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A62D51ED
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76C6E82B;
	Thu, 10 Dec 2020 03:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7097A6E82B;
 Thu, 10 Dec 2020 03:48:57 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id j26so2641499qtq.8;
 Wed, 09 Dec 2020 19:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak+eNnFCXGoJQKScEOUu10VvCNiuAu5QoYZ6KDEUfuw=;
 b=o5qTetK52DepN0vRw371RwJkd0gu+03dx5+rk++X62UdDmMLiCDCGWZoMr5nh9wS9N
 9U8KkXbjqyOs+0jdtXPTmiRLOnZCvo7XNmvYPR5WlBDL7MQob77MRGYCuEKugey1ttZc
 9pvlxpYL5Ja7khlKeReAUeOVVTVIHoGT/LXuhiG4dyOUrAiGVf6T3iNI7+PmTicf0iKd
 2Hlr570Uy1paopZhu6xJUocgnS1GUQFqVwebe8AVoLONi/QsoecE8tRORb/8Q35hLVQX
 Y4oLB9hvdnkfIk72nXstWBR5LvQtXlYm2JjLckfbiiEgt+O4a7VCubGFEj5zHPpG88X4
 0WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak+eNnFCXGoJQKScEOUu10VvCNiuAu5QoYZ6KDEUfuw=;
 b=PlyZHEtDqFrIHS1DLgE9v4Rqa33GPNhC3uWgPxpfUlC4qnkFsplUFdwytxaUxSbULe
 xtTpOKBIbE2JPM1/6I0+4x6RO/Npg3dL1k/L+IR1dh7MBvKVuYsfzGMB/Y7+RRvVwWj8
 +/V7wtPAU18/TBxs16p0GfvqEli3UyiXk9ouFKO2n27cUhu5fHIWFlmOhT/07UlKnxEc
 0nc1PSzMYv6tQG1QjmWCibQo1wWQGUlwc5cBRfk/hQfRE+3ADF4PWQbIWhaDY5NtV/Eo
 gHuDf0BwlYsjchPcXVSxgG/p/nvpVXjZUEoccQQKxI+2y01hbA6/+yzmqssQl9cROxAn
 8rAw==
X-Gm-Message-State: AOAM530B54rh7SvjMsAD2X0Inx+XkxhxMyxWYk/xz0/GKgpxVU+X6BGR
 drkcM4Mj+eWvyT3hcATVeQdYXqx/6iU=
X-Google-Smtp-Source: ABdhPJwJwlpiW6RISlBS3rBcPVXRIQZyxLw/Q3rdsBfhEvJJw5+fbQmDBsH/N8SknLbRhkoP6m8UsQ==
X-Received: by 2002:aed:3b23:: with SMTP id p32mr6724583qte.13.1607572136459; 
 Wed, 09 Dec 2020 19:48:56 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id y1sm2886663qky.63.2020.12.09.19.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:48:56 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.10
Date: Wed,  9 Dec 2020 22:48:48 -0500
Message-Id: <20201210034848.18108-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

Fixes for 5.10.

The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-12-09

for you to fetch changes up to c5b58c8c860db330c0b8b891b69014ee9d470dab:

  drm/amd/pm: typo fix (CUSTOM -> COMPUTE) (2020-12-09 22:38:10 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-12-09:

amdgpu:
- Fan fix for CI asics
- Fix a warning in possible_crtcs
- Build fix for when debugfs is disabled
- Display overflow fix
- Display watermark fixes for Renoir
- SDMA 5.2 fix
- Stolen vga memory regression fix
- Power profile fixes
- Fix a regression from removal of GEM and PRIME callbacks

amdkfd:
- Fix a memory leak in dmabuf import

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/powerplay: parse fan table for CI asics
      drm/amdgpu/disply: set num_crtc earlier
      drm/amdgpu: fix size calculation with stolen vga memory

Andrey Grodzovsky (1):
      drm/amdgpu: Initialise drm_gem_object_funcs for imported BOs

Arnd Bergmann (1):
      drm/amdgpu: fix debugfs creation/removal, again

Changfeng (1):
      drm/amd/pm: update smu10.h WORKLOAD_PPLIB setting for raven

Chris Park (1):
      drm/amd/display: Prevent bandwidth overflow

Evan Quan (1):
      drm/amd/pm: typo fix (CUSTOM -> COMPUTE)

Felix Kuehling (1):
      drm/amdkfd: Fix leak in dmabuf import

Stanley.Yang (1):
      drm/amdgpu: fix sdma instance fw version and feature version init

Sung Lee (1):
      drm/amd/display: Add wm table for Renoir

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  41 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  13 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   6 --
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   9 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  93 ++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   7 +-
 drivers/gpu/drm/amd/pm/inc/smu10.h                 |  14 ++-
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   | 103 ++++++++++++++++++++-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   2 +-
 14 files changed, 250 insertions(+), 62 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
