Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C2A194396
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 16:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5784D6E8EB;
	Thu, 26 Mar 2020 15:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D08F6E332;
 Thu, 26 Mar 2020 15:53:27 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g7so5656220qtj.13;
 Thu, 26 Mar 2020 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dK5dPboEGdKie2AJTZOrsNVoBbj3lrdu2qqLivSZiy8=;
 b=nXf7mCXGesbMlFe0Z96kgvi4l0UAv41jv+8G1OXJy/sxoU5O2TO0GXfRBxBHsb0Gj7
 zfGUHc4H0UcWnUMv697w2iIK4j11f8sOkl86NzGMlOb2bEjRmfNTUxCYQzcFpool+sW2
 EC+S6uCiTlUXWKooYYr0UPOn4oEZKCVy2wIfc1U8H0QT/FlsbPI9ZcKpWLZlZ2KMZHHK
 kfN5wp2dy9vTuDVtLlXQQYDa+hElJloHTqifpe0YB3QE40djEEbvuTjDrnUu+naRb94P
 GHzV3QMw6PnxMtibMUZGFrhvSrH01GK0nc4zhoGQAKPcOpqWfBFka1CBWPIfADG2K3qi
 QIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dK5dPboEGdKie2AJTZOrsNVoBbj3lrdu2qqLivSZiy8=;
 b=GqUs9GnjDQBhQ7STZFp+mor1ZeDQB3EBpDpdOUVkA+TrT51JZaJ80/rIEemB+GF9Rn
 jBGw9gt0WpBC/vEu7EzDYxBcFGJX5cvnEsOogb7bDX5LdU8LWF1VRnPIU/JSs1RQEmiA
 0+F42OssAmI8HkZ06sw+TTq2ne38u/LdJEOWWTTUGO40fBMc7Wn0CpcT7RhL6rHn1G6j
 V+q8lQ38uY+8P9iUBjhBRTR+FENmsDFj5RNVpGSSmfbh6XIzsC9pV6O98tfhOoEwlrbg
 flGLlksoDTKXy6IOYp4BrUOHEyI8QT7F6klJ7GE17OXk8iO+cRMJXEye6VtUdYDB0w/M
 sTCw==
X-Gm-Message-State: ANhLgQ2SpwL3l/OxpAHoLkkIyr6EfV3MbzVYFtrcyNTDdgZPew3dQngZ
 7mxLFbM4wi6ZkbXDDDTo38SuUXtd
X-Google-Smtp-Source: ADFU+vtA8R/oa6n0ykLngO4iPXk1taTFfyFziLK8z+SVFFaQGQcualouXZVgN9OG842mC1FYq80NZw==
X-Received: by 2002:ac8:ac4:: with SMTP id g4mr8547564qti.318.1585238005003;
 Thu, 26 Mar 2020 08:53:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id e66sm1618153qkd.129.2020.03.26.08.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 08:53:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon, scheduler drm-next-5.7
Date: Thu, 26 Mar 2020 11:53:10 -0400
Message-Id: <20200326155310.5486-1-alexander.deucher@amd.com>
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

The following changes since commit cb7adfd6ad12a11902ebe374bec7fd4efa2cec1c:

  Merge tag 'mediatek-drm-next-5.7' of https://github.com/ckhu-mediatek/linux.git-tags into drm-next (2020-03-20 13:08:38 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.7-2020-03-26

for you to fetch changes up to e862b08b4650be6d5196c191baceff3c43dfddef:

  drm/amdgpu: don't try to reserve training bo for sriov (v2) (2020-03-25 17:04:35 -0400)

----------------------------------------------------------------
amd-drm-next-5.7-2020-03-26:

amdgpu:
- Remove a dpm quirk that is not necessary
- Fix handling of AC/DC mode in newer SMU firmwares on navi
- SR-IOV fixes
- RAS fixes

scheduler:
- Fix a race condition

radeon:
- Remove a dpm quirk that is not necessary

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu/smu11: add a helper to set the power source
      drm/amdgpu/swSMU: use the smu11 power source helper for navi1x
      drm/amdgpu/swSMU: set AC/DC mode based on the current system state (v2)
      drm/amdgpu/swSMU: handle DC controlled by GPIO for navi1x
      drm/amdgpu/swSMU: handle manual AC/DC notifications
      drm/amdgpu/smu11: add support for SMU AC/DC interrupts

Dennis Li (1):
      drm/amdgpu: fix the coverage issue to clear ArcVPGRs

Evan Quan (2):
      drm/amd/swSMU: add callback to set AC/DC power source (v2)
      drm/amdgpu/swSMU: correct the bootup power source for Navi1X (v2)

John Clements (1):
      drm/amdgpu: protect RAS sysfs during GPU reset

Mario Kleiner (1):
      drm/amd/display: Fix pageflip event race condition for DCN.

Monk Liu (1):
      drm/amdgpu: don't try to reserve training bo for sriov (v2)

Yassine Oudjana (1):
      drm/[radeon|amdgpu]: Remove HAINAN board from max_sclk override check

Yintian Tao (1):
      drm/scheduler: fix rare NULL ptr race

Zhigang Luo (1):
      Revert "drm/amdgpu: add CAP fw loading"

shaoyunl (1):
      drm/amdgpu/sriov : Don't resume RLCG for SRIOV guest

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 12 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  9 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |  3 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |  9 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  8 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h         |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             | 24 --------------
 drivers/gpu/drm/amd/amdgpu/si_dpm.c               |  1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 18 +++++++++--
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c        | 38 +++++++++++++++++++++++
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  3 ++
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h     |  3 ++
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c        |  8 ++++-
 drivers/gpu/drm/amd/powerplay/smu_internal.h      |  3 ++
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c         | 31 ++++++++++++++++++
 drivers/gpu/drm/radeon/si_dpm.c                   |  1 -
 drivers/gpu/drm/scheduler/sched_main.c            |  2 ++
 21 files changed, 138 insertions(+), 49 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
