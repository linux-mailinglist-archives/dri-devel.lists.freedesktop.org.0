Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AEF2EC636
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 23:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC76D6E284;
	Wed,  6 Jan 2021 22:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7C6E250;
 Wed,  6 Jan 2021 22:27:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id v3so4788859ilo.5;
 Wed, 06 Jan 2021 14:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cfivIbb4vClwBT8GFO5dGsDNdti6rRfErFk1Qp1zfQ=;
 b=A0tjFadvZgQ/aNebTq5gTl4Pao6jGpPRS20lB5hcFXH/GFj6KSpijdKooERq7n/g/D
 jWxZqwVSm/22XdjcHJeWrSpV7D7SiUmpjK3DMTL7516aGTUJC8lB/Gx7brPMjOuky6Ro
 bBQzvQhouShJjGa60K0ryP4mBGRys6sacKCLEwa/bS4h55s9E/PZX3AsbV9b6dXokKfT
 kBg5rEFrlB/McRQBo5peVA2qzF9VZmJYcqZiGLlg1TRwMMhJ/bHzn8V83Ov7NXSCyEYO
 7+ZHNvg7PoR/gKXY14liyZV0Scx3Zjtg2ivKiiEj9WaC4QNe+xiJ0xR20WyBA7XZfdpH
 aeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cfivIbb4vClwBT8GFO5dGsDNdti6rRfErFk1Qp1zfQ=;
 b=f/XEdQFuIYAoyp5bS/MMO+o8krjL78/cVb79jbcUjU9InGmOvsUKOOO7GbIBfiBqlb
 1jEWnJ93FyslTTXxxUUolFHO+1X/hzyi/xcvsMm77rBlTgN2IM4H9YH2P0NCG1oCQAiX
 Ukk45ur76v64JLStiVIIiZlVjfQ7qVSUY9xGKOVLYXKxY/5e0ChLAi8dFiHz+xFrpf7d
 Q/Rjvockj2Z8mV9FA14KpxvdaIV3y0/s/UGF/IhLVpGc12CZi3JkBZmHqvkNnce7rC6R
 GlTc2+CkNmi54VweR3C7YMmcefjenEjUPO6iqewwf3JIaK4DJSDsNhYaO7k2+JguneXh
 2jvQ==
X-Gm-Message-State: AOAM531+mF2fWuMQ1GO6TEwuhvWdtaaXMdGsqPZrnmNemAWSQTrNLr4M
 4jyj2klm2rvIGZjXBuzNQ1Ovc0cn1BU=
X-Google-Smtp-Source: ABdhPJz9xcHwIKTOgqbrJI8VYNb710RWrS6vUWEcLIqOCL7ccEaj1vKCcNaYXL0fzSBrFvSzj12Geg==
X-Received: by 2002:a05:6e02:b27:: with SMTP id
 e7mr6242154ilu.279.1609972056013; 
 Wed, 06 Jan 2021 14:27:36 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.241])
 by smtp.gmail.com with ESMTPSA id h1sm2829383ilj.8.2021.01.06.14.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 14:27:35 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.11
Date: Wed,  6 Jan 2021 17:27:21 -0500
Message-Id: <20210106222721.3934-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

New URL.  FDO ran out of disk space, so I'm attempting to move to gitlab.
Let me know if you run into any issues.

Thanks

The following changes since commit 5b2fc08c455bbf749489254a81baeffdf4c0a693:

  Merge tag 'amd-drm-fixes-5.11-2020-12-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-12-24 10:31:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-01-06

for you to fetch changes up to 5efc1f4b454c6179d35e7b0c3eda0ad5763a00fc:

  Revert "drm/amd/display: Fix memory leaks in S3 resume" (2021-01-06 16:25:06 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.11-2021-01-06:

amdgpu:
- Telemetry fix for VGH
- Powerplay fixes for RV
- Powerplay fixes for RN
- RAS fixes for Sienna Cichlid
- Blank screen regression fix
- Drop DCN support for aarch64
- Misc other fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/display: drop DCN support for aarch64
      Revert "drm/amd/display: Fix memory leaks in S3 resume"

Arnd Bergmann (1):
      drm/amd/display: Fix unused variable warning

Dennis Li (3):
      drm/amdgpu: fix a memory protection fault when remove amdgpu device
      drm/amdgpu: fix a GPU hang issue when remove device
      drm/amdgpu: fix no bad_pages issue after umc ue injection

Hawking Zhang (1):
      drm/amdgpu: switched to cached noretry setting for vangogh

Jiawei Gu (1):
      drm/amdgpu: fix potential memory leak during navi12 deinitialization

John Clements (2):
      drm/amd/pm: updated PM to I2C controller port on sienna cichlid
      drm/amdgpu: enable ras eeprom support for sienna cichlid

Kevin Wang (1):
      drm/amd/display: fix sysfs amdgpu_current_backlight_pwm NULL pointer issue

Xiaojian Du (4):
      drm/amd/pm: correct the sensor value of power for vangogh
      drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
      drm/amd/pm: fix the failure when change power profile for renoir
      drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  25 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   8 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   2 +-
 drivers/gpu/drm/amd/display/Kconfig                |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   4 -
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |  21 ---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   7 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   7 -
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   4 -
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   4 -
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   5 -
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   4 -
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   4 -
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 -
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   4 -
 drivers/gpu/drm/amd/display/dc/os_types.h          |   4 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   | 166 +++++++++++++++++++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   3 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   1 +
 27 files changed, 200 insertions(+), 113 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
