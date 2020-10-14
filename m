Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8B28E78F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 21:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76476EB45;
	Wed, 14 Oct 2020 19:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827F76EB33;
 Wed, 14 Oct 2020 19:54:12 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n6so601877ioc.12;
 Wed, 14 Oct 2020 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPj21y+YLaP86o0TSKftguqUy/J8gE3mb8bg9LyRXxA=;
 b=uRhwDG+mXFjNrwWG88p8b7dIR+9GNf+pWkyx/nrj9gd86zPheieD5GbNszWrbwR7Sn
 Rhztd0awD7xqGHF1he027hCZvFwihD2japWCLsVfcfFMp3iJYbWIKSGylc5BvOSUmeUD
 y5AttyMO0R1C/85sFHlV6NAOJwyU9nGzNFb/nWa2KdKcNgIR+FCh163wPTFC1R8OeqQQ
 HFn+6nBctBcKKQzf5zor4EBTJItuIXJLZvflO6hYe5DhminzBsSxhkFE89TF1yMRtnFT
 5qjsiXws8dva6StUTRnHzYKrDpG5C3BWfEt8Y3P1/NL2B/sAjo9D8ozxuHZhs3dUarEL
 zLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPj21y+YLaP86o0TSKftguqUy/J8gE3mb8bg9LyRXxA=;
 b=XIUwkO7lQo2cROyG4VmUnckE+HrqFfxX57YBIW7qLZcs4TWd7eiVHDJF7zwsf3JyN0
 /eJQWbobbT7IXl118a3d8cN+2pptlKZO7XF5J1ArXlcvn9SPYDziol5uqpQOh+rSJbkO
 r0Atl+DWVJ/URSlnpa1nAZkFg+RYRZauB/tngE0rn+QlbtSfY7ZN7Phmscr0NmnsDuhX
 BcJG/VeqbqUr0q/xu7rCAwinMrZduPmCKvfRImr2jLdJZ5DOInaeHleELKZlZg7YgbP7
 ohLfzj79CnMyBHVtMlu+keRs7UasEtIdEopLDhjOcy33r0t3aDP7IyiTHWBbwx1ujCxD
 06dg==
X-Gm-Message-State: AOAM533sebKTf2Jmv4j+9aU+ngUFjsjX/03awaptW9DdB9a7oTE/EhRr
 dyxRmk93zbN5awzT3HZ+GDgK61RgcfU=
X-Google-Smtp-Source: ABdhPJyNoTTMLzxlK4FzYY1FRVwNBnP/QH478TCDjXa5z/x3CAicKukaQZQChdbqof/6Q+egWkfZaQ==
X-Received: by 2002:a6b:4014:: with SMTP id k20mr791681ioa.177.1602705251493; 
 Wed, 14 Oct 2020 12:54:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id t5sm325300ilf.17.2020.10.14.12.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 12:54:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.10
Date: Wed, 14 Oct 2020 15:54:03 -0400
Message-Id: <20201014195403.4558-1-alexander.deucher@amd.com>
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

The following changes since commit 9c27bc97aff8bbe62b5b29ebf528291dd85d9c86:

  drm/amdgpu: Fix invalid number of character '{' in amdgpu_acpi_init (2020-10-09 15:16:10 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-10-14

for you to fetch changes up to 8f4729e880647c419de0bbe3ff21d7efb4e65676:

  drm/amdkfd: Use kvfree in destroy_crat_image (2020-10-14 15:29:28 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-10-14:

amdgpu:
- eDP fix
- BACO fix
- Kernel documentation fixes
- SMU7 mclk fix
- VCN1 hw bug workaround

amdkfd:
- kvfree vs kfree fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/swsmu: init the baco mutex in early_init

Evan Quan (1):
      drm/amd/pm: increase mclk switch threshold to 200 us

Kent Russell (1):
      drm/amdkfd: Use kvfree in destroy_crat_image

Mauro Carvalho Chehab (2):
      drm/amd/display: kernel-doc: document force_timing_sync
      docs: amdgpu: fix a warning when building the documentation

Rodrigo Siqueira (1):
      drm/amd/display: Fix module load hangs when connected to an eDP

Veerabadhran G (1):
      drm/amdgpu: vcn and jpeg ring synchronization

 Documentation/gpu/amdgpu.rst                       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             | 24 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 28 ++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.h              |  3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  2 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 10 ++++----
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  7 +++---
 11 files changed, 65 insertions(+), 20 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
