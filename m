Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267E12DF44
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 16:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17E589BAE;
	Wed,  1 Jan 2020 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAAD89BAE;
 Wed,  1 Jan 2020 15:13:16 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id dp13so14209079qvb.7;
 Wed, 01 Jan 2020 07:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y90zCYcUYpO16j+v27QKuBV95399qcncA3SXtCyTg3k=;
 b=lsZWEVEVjcvE1mmf0ZjDhLrPTx7oOa2uLHr68U401n3sDDHmVUMrVUQXu5W5gcQ3ob
 0IoVHIYliqtmJIFSv02LRnPolboBC9qjsWVVKDlM/HsvQ+xHuN/Dm59hCOfHqdpphXA4
 6l6n3jRB9OZCRat53jKJoXER6vzh9BZah+4u3QOoLs3ocdsvSl/yFnIHamftg2bLrUM7
 b7dUL+0sKG5MrxYSKmbTyD1DzgNiEGYqWmh3v/ApGEBvROw+jMATJp/BiZajHf/a25Ab
 zx5xHshp889P2jA6eenGD/Gtv+lhGM9dwJC6W/rEngjEkHJoXSc/xCSIf1KSimXDJ23i
 PWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y90zCYcUYpO16j+v27QKuBV95399qcncA3SXtCyTg3k=;
 b=haaexTPs+ciSCk5ql65Rs1j1SSUVhMIgL+6nKWDTLfSHia4+xtnTKRvvSgS+Gjz+xg
 yH/3+pRXXGqtbmPm0T2L4C7JHdDTy3Ujmg/ow/rPRiT4u7kd7/j5dO/fZdvrJBKl5L3S
 WZbqNGp31nO8rpeedmAnmkv/sX3dJzU7a0a87DbNWEVRFa2yf/sNTv9biEXsv5EdZff8
 FePDHBGJ/ln/HQAV3sn/iE0STtmShd78wIMGWG5BC91rAKfF6chxXH8/N+gf1sCkSmvp
 oLY5/rMLFQ3xOE0jldkW6xspC8bg/e4bZDnWO7IPm0Bkw4epYSJsvhAIU4SMAmEF0tSZ
 pJkA==
X-Gm-Message-State: APjAAAWvVgIFMIW/wUK4t4fumfkr3xOqJbs6QCZ/MhJBryz5yyjQ1yYA
 YZq1Z7IU1tGhrFkJvduIlmTSM0UG
X-Google-Smtp-Source: APXvYqyafPzoQfYow4CGdyciHBazKSPgI56FnU4EwIxZqvCVoATz7AR0W/4s26ofAVwVkZzC6rtD8w==
X-Received: by 2002:ad4:44ee:: with SMTP id p14mr58769669qvt.114.1577891595367; 
 Wed, 01 Jan 2020 07:13:15 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 3sm15881358qte.59.2020.01.01.07.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 07:13:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.5
Date: Wed,  1 Jan 2020 10:13:07 -0500
Message-Id: <20200101151307.5242-1-alexander.deucher@amd.com>
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

Happy New Year!  Fixes for 5.5.

The following changes since commit e31d941c7dd797df37ea94958638a88723325c30:

  Merge tag 'drm-intel-fixes-2019-12-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2019-12-27 13:13:30 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.5-2020-01-01

for you to fetch changes up to 969e11529221a6a2a787cb3b63ccf9402f8d2e37:

  drm/amdgpu: correct RLC firmwares loading sequence (2020-01-01 09:26:09 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.5-2020-01-01:

amdgpu:
- ATPX regression fix
- SMU metrics table locking fixes
- gfxoff fix for raven
- RLC firmware loading stability fix

----------------------------------------------------------------
Alex Deucher (5):
      Revert "drm/amdgpu: simplify ATPX detection"
      drm/amdgpu/smu: add metrics table lock
      drm/amdgpu/smu: add metrics table lock for arcturus (v2)
      drm/amdgpu/smu: add metrics table lock for navi (v2)
      drm/amdgpu/smu: add metrics table lock for vega20 (v2)

Evan Quan (1):
      drm/amdgpu: correct RLC firmwares loading sequence

changzhu (1):
      drm/amdgpu: enable gfxoff for raven1 refresh

 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 12 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 15 ++++-----------
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c       |  1 +
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c     |  3 +++
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h   |  1 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c       |  3 +++
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c       |  3 +++
 9 files changed, 28 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
