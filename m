Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3919B689
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 21:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734A96E99A;
	Wed,  1 Apr 2020 19:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056C86E998;
 Wed,  1 Apr 2020 19:46:31 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id g2so390429plo.3;
 Wed, 01 Apr 2020 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39ipV2O3rr3FBtmBygY0WKVMtey2G9312dcajPORw6s=;
 b=PIoJ+ybePB7qfESkeCojyVERn+eBjmilbtGTnAFb+uDFyNEk5lCYgx1U4b7W8XoO85
 bVdcBwe/MJYng2rZIeVmZIUkhQx3xXcRrFKT194ilxTZa8q14uNXws6oMPURoKvTD79w
 K9rManS2c4Eo6mP4pNDNXua1ftiguA8wv1l2T1WRHlfLx3ekmAnwN046Fe7ThlfNTWZC
 sTIszly6onV2EtclfQA/PPpHoMFqSBSG0nOYGFJb35Y2+UsydL/PoPt7g4TwetEtJ8sn
 JSynTAg5dQTBKfpnAPLe1ZFQDwF+Xx4s88i3As4C7rBJeAceuaefP9+HLU6CqgEDyVZY
 k1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39ipV2O3rr3FBtmBygY0WKVMtey2G9312dcajPORw6s=;
 b=VskJ/dLcv10FoRyxVdd3P3aTBNLfvEPthFoH0i4ajtuWXa05+TeDOl7d+HhZOEXJ70
 W2ZlO/lfblbmPfM+Es25128iM1XPSR39Nti+mZZbPVaEwZyQ9kQOMs3Iq8c4EZ5OsIDM
 FARhI1tK6sOc+QbGU6HIrCZPFPpohxnZ8HA9FP5hm0u6fDmE/6mRvrSIaJO3wdrCFPW/
 9LlRdA9V78eKhA3Sj0Q/EKQVyN3IiOpoFOszv0Lm4oi6iQSHam1Q9pKcC5+2eFSh0hB+
 CuwnyHCQv0OFuRbryirp81nX2B6w9iirJDUkRFY3JU9r7uPTaKh/uJPfw5yaCPdt3OZI
 TvCg==
X-Gm-Message-State: AGi0PuZUUKrsSVT0Wg/BuLNrJLXVjD0o7oJDNVi+dXExPovkKL0/eEYx
 MlxVEkl5qVufw19/u+azxlfroSRE
X-Google-Smtp-Source: APiQypKuG9xnSiokEzirl8JqM1CoxFOJ0sAoEddkgR8O8N0QyQ1dVecIbV7+bOXy7ZXJhKHOzu0+yw==
X-Received: by 2002:a17:90a:cb87:: with SMTP id
 a7mr7011555pju.80.1585770391301; 
 Wed, 01 Apr 2020 12:46:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id 11sm2141736pfv.43.2020.04.01.12.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 12:46:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-next-5.7
Date: Wed,  1 Apr 2020 15:46:19 -0400
Message-Id: <20200401194619.4217-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.1
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

The following changes since commit 59e7a8cc2dcf335116d500d684bfb34d1d97a6fe:

  Merge tag 'drm-msm-next-2020-03-22' of https://gitlab.freedesktop.org/drm/msm into drm-next (2020-03-31 16:34:55 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.7-2020-04-01

for you to fetch changes up to 3148a6a0ef3cf93570f30a477292768f7eb5d3c3:

  drm/amdkfd: kfree the wrong pointer (2020-04-01 14:44:22 -0400)

----------------------------------------------------------------
amd-drm-next-5.7-2020-04-01:

amdgpu:
- HDCP fixes
- gfx10 fix
- Misc display fixes
- BACO fixes

amdkfd:
- Fix memory leak

----------------------------------------------------------------
Aric Cyr (1):
      drm/amd/display: LFC not working on 2.0x range monitors (v2)

Bhawanpreet Lakha (3):
      drm/amd/display: Don't try hdcp1.4 when content_type is set to type1
      drm/amd/display: Correctly cancel future watchdog and callback events
      drm/amd/display: increase HDCP authentication delay

Dmytro Laktyushkin (1):
      drm/amd/display: Fix dcn21 num_states

Eric Bernstein (1):
      drm/amd/display: Update function to get optimal number of taps

Evan Quan (2):
      drm/amd/powerplay: drop redundant BIF doorbell interrupt operations
      drm/amd/powerplay: move the ASIC specific nbio operation out of smu_v11_0.c

Isabel Zhang (1):
      drm/amd/display: Revert change to HDCP display states

Jack Zhang (1):
      drm/amdkfd: kfree the wrong pointer

Kevin Wang (1):
      drm/amdgpu: fix hpd bo size calculation error

Nicholas Kazlauskas (1):
      drm/amd/display: Use double buffered DRR timing update by default

Stylon Wang (3):
      drm/amd/display: Support P010 pixel format
      drm/amd/display: Support plane level CTM
      drm/amd/display: Enable BT2020 in COLOR_ENCODING property

Yongqiang Sun (1):
      drm/amd/display: Not doing optimize bandwidth if flip pending.

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  4 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 +++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 14 +++++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 33 +++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 ++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  6 ++++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  | 18 ++++++++++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |  3 ++
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  3 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  5 +--
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  | 40 ++++++++--------------
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |  2 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |  7 ++--
 .../drm/amd/display/modules/freesync/freesync.c    | 34 ++++++++++--------
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |  5 ++-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    | 28 +++++++++++----
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |  2 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    | 39 ++++++++++++---------
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |  1 +
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       | 15 +++++++-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         | 18 ++++++++--
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          | 24 +------------
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 14 +++++++-
 27 files changed, 223 insertions(+), 114 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
