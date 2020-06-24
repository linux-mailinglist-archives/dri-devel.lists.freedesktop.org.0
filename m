Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C5207F32
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 00:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877336E0D0;
	Wed, 24 Jun 2020 22:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D05B892FE;
 Wed, 24 Jun 2020 22:12:16 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id u17so3114413qtq.1;
 Wed, 24 Jun 2020 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67p7vtOZyPUiKQMGdl0SDJU9bXmMxLzL4Z6M8Z2tVLY=;
 b=Dp58GycaWyhb4IppRFn9IsUcNzEmPx65ZhM1KFmmWpbgKQjwDWv7ZFOQmH5N2FW9Ui
 9eZyyg7pshLCjC5IzEspFRIl/ZRNCOKWJeW+hF5V5NmIq6+/a0LZYtTgZ7h8h57HbmSe
 UZdl6AY5Vp6P+ydMDOCm+H+U//UossNVbNhXfE3JWa/hQVu4fSmSONjrx09S3g9WHrfU
 2dXIu5lvBx6bPy2FbtEtykmEUfdiBl0Dqzg+ISCJu2l6g5OnOjuowAZB8vYWHDiP0yyC
 OM77qIYJKcjn6w/yh44d+BEu5iDH/paApIixbQdbm/8TwW2c9afRaEQK0Uf46nPAsZes
 grhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67p7vtOZyPUiKQMGdl0SDJU9bXmMxLzL4Z6M8Z2tVLY=;
 b=afbBQXTam3WcV5HSR4f23Ab8HR01YMorvdtU3ojak/grzBu5I9onnmcFHJwjcn0bXo
 ph3lulPGa/vmxHunP9d6p9xwQwh9Y4tFXYD+kYghH8/W4ijATZNqKWXkHTgtjrlbtBm4
 9rnDPdc/BZgpea1IfBwfE/1cq+oze8vyoHfpzy19f19wt+csF7Pgp4m0ce8gpt3PrLk+
 X7i36dOE+FFzlrc1+ISnD3gKhKFg5Totw2+/NJ5FHTnALo7YyI5w+7ts3/LGa+lLOH3L
 /PbnPjtT++z3mWw87iRos1aVD92dY7kcuMhneYJ5I822Ww+0hDpDhcN0y01ObJH472eS
 qEzQ==
X-Gm-Message-State: AOAM533JG/Ow9oP+fdejNqo5Cn4zJXglrXmjmZwnpQI1KOaQt++cJZDj
 PzATz/+cvwU8ysVL1yd/uQv61LHO
X-Google-Smtp-Source: ABdhPJwZ8zoWAG5qQLE+QTaVowHt87AG6UtSubNCFWClIvzkth/7wZeyO6bETMc94VOjfnbRIZarAQ==
X-Received: by 2002:ac8:34bd:: with SMTP id w58mr29062479qtb.359.1593036735378; 
 Wed, 24 Jun 2020 15:12:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.51.205])
 by smtp.gmail.com with ESMTPSA id t57sm863492qtc.91.2020.06.24.15.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 15:12:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-5.8
Date: Wed, 24 Jun 2020 18:12:07 -0400
Message-Id: <20200624221207.17773-1-alexander.deucher@amd.com>
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

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.8-2020-06-24

for you to fetch changes up to b5b78a6c8d8cb9c307bc6b16a754603424459d6e:

  drm/amd: fix potential memleak in err branch (2020-06-24 18:03:16 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.8-2020-06-24:

amdgpu:
- Fix missed mutex unlock in DC error path
- Fix firmware leak for sdma5
- DC bpc property fixes

amdkfd:
- Fix memleak in an error path

radeon:
- Fix copy paste typo in NI DPM spll validation

----------------------------------------------------------------
Bernard Zhao (1):
      drm/amd: fix potential memleak in err branch

Denis Efremov (1):
      drm/radeon: fix fb_div check in ni_init_smc_spll_table()

John van der Kamp (1):
      drm/amdgpu/display: Unlock mutex on error

Stylon Wang (2):
      drm/amd/display: Enable output_bpc property on all outputs
      drm/amd/display: Fix ineffective setting of max bpc property

Wenhui Sheng (1):
      drm/amdgpu: add fw release for sdma v5_0

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c                    | 6 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c                  | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 4 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 6 ++++--
 drivers/gpu/drm/radeon/ni_dpm.c                           | 2 +-
 6 files changed, 16 insertions(+), 6 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
