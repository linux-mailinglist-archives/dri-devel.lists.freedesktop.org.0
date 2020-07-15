Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DE221722
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 23:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0895E6E0ED;
	Wed, 15 Jul 2020 21:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926016E0ED;
 Wed, 15 Jul 2020 21:39:24 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id e13so3419598qkg.5;
 Wed, 15 Jul 2020 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBBD0VH8qc6z9d82dacw0YSnbMYgJ8PbKZRfAul0rVc=;
 b=SLTJaRxCSYhLUnqgJIvI/m8jyeRjqW0bCIA+GhDx7WFRr5oCSPMjVmtRHoLRFlORKW
 zq4+HuBwylcWjrb7YUy8fsKh3UYajmh3TnLhev/Q5qXIrU57JL4N5O4rzONvN8A+Iaws
 ygHNNh+TSszIztwduoESFJvROg2ZrOnPYTnbgeRnBar1TQOT0Ps7EuS4GghgeTCtFISV
 BQ87IBqHDJaKWO26zNgibrhV+vya4FoxQ+a2zaK1uIq2RNqy5i/X09PuVDhF0wWfK85z
 RifjEnRZLX4D8VVN+3tY/MLHbNKoLRmYVQeDKBMGGVOy/xaM2uSzzAkwTTxQzn99F1OE
 wirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBBD0VH8qc6z9d82dacw0YSnbMYgJ8PbKZRfAul0rVc=;
 b=o+wYGlhE2F88ijmMViZCrUORORF1qF7eDzcoqCC3xseBUhLTMLjbstInSf/XnSX2Kk
 tzLVIfYsIYK/jOi2rHH/qVc5hwNritn+uQ/piVRlBuN+ftxWB/fRqXLm9zzKLzaDfrgv
 JmZ2HB48ozVasPKa94F4Za2w2kc0D9y3XI29+QwF8uhJ8HUnnb0s+Eu67kd1WZRrA8j/
 +d4JBRDIL1IUt9kNWoKFH5jklBle8tP+NEnKu9jX8bjV3AHWZZVkI8ZO9zbaGj5ydYaq
 8q6RZHKqgfbGIEAnY8UPVi6L9SVLVtQRvhwvK8dyFWqPeYZnLpUrjTdURlUqr/hGvQGu
 2GFQ==
X-Gm-Message-State: AOAM532MWS5a/XGAZz41NJz5AW5T2TNIylTm+QLF4DvnsQBN8evYqHvC
 g4RI9FNCSfSW6NUlNuide7CjRlpc
X-Google-Smtp-Source: ABdhPJzcPxDL+JZKur+QdSIOMQZTPAMcFmuE40bJq/pygAhi4dFV3mZhFD4pCtLo+Fg8JDal+Jfpmg==
X-Received: by 2002:a37:6d46:: with SMTP id i67mr1050493qkc.404.1594849163408; 
 Wed, 15 Jul 2020 14:39:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id i10sm4653207qkn.126.2020.07.15.14.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 14:39:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.8
Date: Wed, 15 Jul 2020 17:39:14 -0400
Message-Id: <20200715213914.3994-1-alexander.deucher@amd.com>
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

Fixes for 5.8.

The following changes since commit 38794a5465b752118098e36cf95c59083f9f1f88:

  Merge tag 'amd-drm-fixes-5.8-2020-07-09' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-07-10 07:02:02 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.8-2020-07-15

for you to fetch changes up to 05051496b2622e4d12e2036b35165969aa502f89:

  drm/amdgpu/sdma5: fix wptr overwritten in ->get_wptr() (2020-07-14 15:42:17 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.8-2020-07-15:

amdgpu:
- Fix a race condition with KIQ
- Preemption fix
- Fix handling of fake MST encoders
- OLED panel fix
- Handle allocation failure in stream construction
- Renoir SMC fix
- SDMA 5.x fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/display: create fake mst encoders ahead of time (v4)

Jack Xiao (2):
      drm/amdgpu/gfx10: fix race condition for kiq
      drm/amdgpu: fix preemption unit test

Josip Pavic (1):
      drm/amd/display: handle failed allocation during stream construction

Xiaojie Yuan (1):
      drm/amdgpu/sdma5: fix wptr overwritten in ->get_wptr()

chen gong (1):
      drm/amdgpu/powerplay: Modify SMC message name for setting power profile mode

hersen wu (1):
      drm/amd/display: OLED panel backlight adjust not work with external display connected

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        | 20 ++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  9 +++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             | 26 ++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 14 ++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  | 11 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 53 +++++++++++-----------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  3 ++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 19 ++++++--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |  2 +-
 9 files changed, 101 insertions(+), 56 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
