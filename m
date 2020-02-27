Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20594170F29
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 04:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AF189DE6;
	Thu, 27 Feb 2020 03:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88189DE6;
 Thu, 27 Feb 2020 03:41:16 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id g21so1266724qtq.10;
 Wed, 26 Feb 2020 19:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6orLO/3pGNWLNM0H5+qwC2tjFm4CPyDoE73ZPpZfueI=;
 b=q9KyqVFCIDzxuKJxocmZRwG/PtU9oHcPqrWDDe0ds/OXHBAqB3ya90ZYmC9IYo9ITr
 sFXdFnG4mo3W/czOVrVdfRqeNgB0GUFBMLj+aCYy5WkTGyBO2objC3Z1yNBk1QmBEpxo
 /Qqz8WIRQXFnwXOOjLrmZPssMY2x+EINnzcOAPuUBF8wdUMOvYkQvC1SIAivVKBTZf/f
 Hh9rHXHma+4PRRtr8Y3h/BGCSdcAjQe8Cvvn+tacAvwalvGKNW98SgMKVckwYFkSHtTT
 bdqpO150Vq4slcITyCOEfAZNcPIYx/s44QbWln4snyp7B1mjPK/jii3mE+9DSKdNatLh
 6d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6orLO/3pGNWLNM0H5+qwC2tjFm4CPyDoE73ZPpZfueI=;
 b=m6sZsopbU3KYbQsXCFQoNYoiZXXmActzLlwUb5lwQ2rl9PrdoJR6LHg+YdJ5zZpeMp
 +SFbBU8XxC1Yxf0VtXXI8uFl19O3O1kHA87qsbyRcVeSnCSNH5DNA9hYj9MBbhkfQsAm
 UFgXNqnXa123V1UQ6ov4rMq/3sPnrHWbP8kWmuZclYyOqcecGqm0OSTB16g2K8xc6JqH
 oes6tKg+1pRtO+GX6V6jKeLJLhfqOg2bAYyXhKoC+4ERjrZE6IDhvGnmdAkBXFIc//s7
 Cdhp2brjGPVuAMoAE4A54OqnJxRCjx1kUYG/Vobe4BlOpbgYe/Vcbylc7S9UrXA+6FKt
 bjmA==
X-Gm-Message-State: APjAAAWwG4IaxZe2FRi8E0kr1XID0KczEVZipmFhil5CqOj0ubOZ/+af
 yUHcIi0bxGTNRUy4mhlrxx0zaLrQ
X-Google-Smtp-Source: APXvYqynVNnyIpxc+WoMMkxSraAn4Yq6rgaFEv7kcdMQ7bVDiGbIUTT0SZHIh/yWsgFiFSr+LPFN/w==
X-Received: by 2002:ac8:1c64:: with SMTP id j33mr2456669qtk.69.1582774875788; 
 Wed, 26 Feb 2020 19:41:15 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id j22sm2306404qkk.45.2020.02.26.19.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 19:41:15 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] radeon, amdgpu 5.6 fixes
Date: Wed, 26 Feb 2020 22:41:06 -0500
Message-Id: <20200227034106.3912-1-alexander.deucher@amd.com>
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

The following changes since commit 97d9a4e9619a822c5baf6a63e6f5b80fee4d4213:

  Merge tag 'drm-intel-fixes-2020-02-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-02-21 12:46:54 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-02-26

for you to fetch changes up to eb12c957735b582607e5842a06d1f4c62e185c1d:

  drm/radeon: Inline drm_get_pci_dev (2020-02-26 14:02:41 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-02-26:

amdgpu:
- Drop DRIVER_USE_AGP
- Fix memory leak in GPU reset
- Resume fix for raven

radeon:
- Drop DRIVER_USE_AGP

----------------------------------------------------------------
Daniel Vetter (2):
      drm/amdgpu: Drop DRIVER_USE_AGP
      drm/radeon: Inline drm_get_pci_dev

Monk Liu (1):
      drm/amdgpu: fix memory leak during TDR test(v2)

Shirish S (1):
      amdgpu/gmc_v9: save/restore sdpif regs during S3

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              | 37 ++++++++++++++++++-
 .../drm/amd/include/asic_reg/dce/dce_12_0_offset.h |  2 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  6 ++-
 drivers/gpu/drm/radeon/radeon_drv.c                | 43 +++++++++++++++++++++-
 drivers/gpu/drm/radeon/radeon_kms.c                |  6 +++
 7 files changed, 92 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
