Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CA25B9F4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 07:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD066E15C;
	Thu,  3 Sep 2020 05:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355D6E15C;
 Thu,  3 Sep 2020 05:00:35 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 60so1011276qtc.9;
 Wed, 02 Sep 2020 22:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/tCmau4bdOdcCo4NX7tG9PpqG4aAPw25Y4FcAG4Ag6E=;
 b=a9iQkVmLcYp+EtcTEWqOenIWeGF32wlVtCA+0fk7WCoYqL5Ydearf5zqzn/uj+sRfU
 HbNdrJ2XS5luovqrivrIjrNjwkecc/MVtiiW+s/uGcqVqh/HKbb21hXpY+tCwQTrnZgf
 1vtyRfpU6bni4YV8ZHAznPdN676Dx821MXXeFy+mldCN+NDenvbzUuqnjbK04YbkOEIf
 nlvPFoy+FLEQAcnDpsbr1Rr/OE+lG7erWkCIk9+4VZTdfqZVYw7p77r4kaptRvfyHPmi
 Q3FuRVnCIt68bzeJjykhViRMC+zE3CTuaEtFmbVQMsBSaqxOrlVljk0mzKINWgqOhN84
 yazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/tCmau4bdOdcCo4NX7tG9PpqG4aAPw25Y4FcAG4Ag6E=;
 b=EU5kfCCsPVu0BrXVTi4hc2zqaLCn9kvjmsKA0cDeGxgq5vRmCin6CTnS5iGvyUkfes
 /ZyxhlNg3tQgDKATp+xI1pA4lnyGyyda6FzNbfa5kn7tfhz/h4MPMbnS3eUpUFswSjTv
 8y1Yu8jcqnLP1Ap6RZaOPsXuqguDhm8no5t6uQn/SHp8SE2acNPtZzDY/g1V6sqLU+zL
 CTxsGyRCY3JXG/ct3vSMR9BqWX6glHnuYMCwmNtZNZZ5DFSLdLo1D60dt5mcw++C7vsO
 9jwuNa33fmd62JCySwrXROuAIukV3L36CGhrcckEL84gNgiKDQhfxxOkVMCKRa9ssOfM
 LA9A==
X-Gm-Message-State: AOAM531iXrjq/pckUW2QT/8SfGPA8Eti2eB+9s9kDgwEHeyheYPHJSux
 UWi6zJYJRk1ivQs0pXITOF3QYUZ40/c=
X-Google-Smtp-Source: ABdhPJyWdKcyKxER+910mJMNXkNQdk3jLfd6XVYHCnf8qr3TO2QE2bnFBGh9z4bbGM+ynI0811JvIA==
X-Received: by 2002:ac8:c4e:: with SMTP id l14mr1739153qti.149.1599109234308; 
 Wed, 02 Sep 2020 22:00:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id j190sm1428385qkd.22.2020.09.02.22.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 22:00:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.9
Date: Thu,  3 Sep 2020 01:00:22 -0400
Message-Id: <20200903050022.3960-1-alexander.deucher@amd.com>
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

Fixes for 5.9.

The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-09-03

for you to fetch changes up to fc8c70526bd30733ea8667adb8b8ffebea30a8ed:

  drm/radeon: Prefer lower feedback dividers (2020-09-03 00:37:30 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-09-03:

amdgpu:
- Fix for 32bit systems
- SW CTF fix
- Update for Sienna Cichlid
- CIK bug fixes

radeon:
- PLL fix

----------------------------------------------------------------
Evan Quan (1):
      drm/amd/pm: avoid false alarm due to confusing softwareshutdowntemp setting

Jiansong Chen (1):
      drm/amd/pm: enable MP0 DPM for sienna_cichlid

Kai-Heng Feng (1):
      drm/radeon: Prefer lower feedback dividers

Kevin Wang (1):
      drm/amd/pm: fix is_dpm_running() run error on 32bit system

Sandeep Raghuraman (2):
      drm/amdgpu: Specify get_argument function for ci_smu_funcs
      drm/amdgpu: Fix bug in reporting voltage for CIK

 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c         | 10 +++++++---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c     |  3 ++-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c | 14 ++++++++++++--
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c           | 10 +++++++---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c   | 14 ++++++++++----
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c     |  2 ++
 drivers/gpu/drm/radeon/radeon_display.c              |  2 +-
 7 files changed, 41 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
