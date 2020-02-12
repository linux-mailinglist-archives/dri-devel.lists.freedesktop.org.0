Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0515B412
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 23:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E68C6E125;
	Wed, 12 Feb 2020 22:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC86E123;
 Wed, 12 Feb 2020 22:47:55 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id d18so2948628qtj.10;
 Wed, 12 Feb 2020 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQrEreTWqOWP/+xmyt9zTOrfCx5TeeXNk02OM3R4VVo=;
 b=lbCsJSG+cxHu/86luhnxSbxp7xZinMzYI7JofIUO0d3LOhQfGDHNywkW891rVUxObI
 DG78lj90N40PD1EnqSi6zGvs0M37dJgVugXT8aNRastBfQK/F7Y2xfbmVSr+38O7DSeF
 d7VdwILueTpfTgcbutPE5tJTv5vMe1LTZwgMQQNPWkLYxSfFcbUesaHZ+TpmeVpoP6Of
 Wu+RwpHwzLt4JESnaIQLfsGwQBpOSrD6Nb9qEh9aUTgCqXNulQ6uCoBSZvUfaMfKtJbp
 RcJ+Ls6wyD1S3ifxgUE5vPUez0F9JWgQ74IC7MtOpv2MfHtMGkqxPkhlGDWgT31VmBQj
 JPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQrEreTWqOWP/+xmyt9zTOrfCx5TeeXNk02OM3R4VVo=;
 b=QdToEb79tmPjtVLC6LONEeVrUU7KjCuH0L8Q8+WpAdBQu1ZYQGyZVJ2zHVqUpaWoO4
 d1+3p2Os9ouJSXsDh3+bzheo/CPiYzpNES7WCLVR0zvHYhzQ4IKKQArFvnhkOgm9gZQY
 XahB9tDMmYFKX/5k55oJViZL7DZea77h9QcnfTq0Bf1dbYoO4DPQJeBcggnsywOUA090
 eYNwCH2OPWviN1JIWApfDLmqiD0/G7n+ef8fv9kB7senw9s7zR3IdkkLor+GmUogOQi/
 0iU2pQsoGJygwU9ZtVYSFlUlVGLAX6+yyK9ONY71ZAJsD1SCMDZG+taughDZwpE1fJlF
 uYBQ==
X-Gm-Message-State: APjAAAVsD5UWa8c1fgbpmgNejRdhjmJEg3U/in/NvB/SI6DNfuoQF5zJ
 FnuSQsLdLh/dk6n8d44wIq37Xjtw
X-Google-Smtp-Source: APXvYqwu3XITSrGB5RitqU3T9SCzRETSkpZMG26BAGvgE55iGlFwTY2Y0tyzxc2vxbynaurEE8/BAw==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr9309065qto.369.1581547674470; 
 Wed, 12 Feb 2020 14:47:54 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id b7sm335771qtj.78.2020.02.12.14.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 14:47:53 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu 5.6 fixes
Date: Wed, 12 Feb 2020 17:47:46 -0500
Message-Id: <20200212224746.3992-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

Fixes for 5.6.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-02-12

for you to fetch changes up to e33a8cfda5198fc09554fdd77ba246de42c886bd:

  drm/amdgpu:/navi10: use the ODCAP enum to index the caps array (2020-02-11 15:42:33 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-02-12:

amdgpu:
- Additional OD fixes for navi
- Misc display fixes
- VCN 2.5 DPG fix
- Prevent build errors on PowerPC on some configs
- GDS EDC fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: update smu_v11_0_pptable.h
      drm/amdgpu:/navi10: use the ODCAP enum to index the caps array

Aric Cyr (1):
      drm/amd/display: Check engine is not NULL before acquiring

Daniel Kolesa (1):
      amdgpu: Prevent build errors regarding soft/hard-float FP ABI tags

Guchun Chen (2):
      drm/amdgpu: limit GDS clearing workaround in cold boot sequence
      drm/amdgpu: correct comment to clear up the confusion

Isabel Zhang (1):
      drm/amd/display: Add initialitions for PLL2 clock source

James Zhu (2):
      drm/amdgpu/vcn2.5: fix DPG mode power off issue on instance 1
      drm/amdgpu/vcn2.5: fix warning

Jonathan Kim (1):
      drm/amdgpu: fix amdgpu pmu to use hwc->config instead of hwc->conf

Nicholas Kazlauskas (1):
      drm/amd/display: Don't map ATOM_ENABLE to ATOM_INIT

Roman Li (1):
      drm/amd/display: Fix psr static frames calculation

Sung Lee (3):
      drm/amd/display: Do not set optimized_require to false after plane disable
      drm/amd/display: Use dcfclk to populate watermark ranges
      drm/amd/display: DCN2.x Do not program DPPCLK if same value

Yongqiang Sun (1):
      drm/amd/display: Limit minimum DPPCLK to 100MHz.

 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            | 15 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 14 +++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 14 ++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  6 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  8 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  5 ++-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |  4 --
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |  6 +++
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 20 ++++++----
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  6 +++
 .../gpu/drm/amd/powerplay/inc/smu_v11_0_pptable.h  | 46 +++++++++++++++-------
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         | 22 +++++------
 16 files changed, 108 insertions(+), 66 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
