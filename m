Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CB2F6BE3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 21:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A3E6E072;
	Thu, 14 Jan 2021 20:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C811D6E072;
 Thu, 14 Jan 2021 20:14:10 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id j26so4475091qtq.8;
 Thu, 14 Jan 2021 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RPbl9mK2lHqtPxJYaVs7f9iaLeSoE19/DXnFWnPze78=;
 b=jxL0Yp2GK02I05yc0ZALbdmDOboGxKPQX82PDnnZJa/46Va918XcXYvV9jj8O7maRP
 uWGgveAnL06gGAi+zX9+4Vf+bQC/ApsAEpNDH/lY0OKFQbiOBkdQggPFG9J36t9Pfvin
 KMtvOsno7wjHqP5/tIxm1xl5MTAI4aqRgdEUgJkSaxL4KosibnSh9Fzy+XkcRq/RzZsY
 gdPN+sODNuz5GIF9m0ENswNVuQ6rIhKNRfZIgc4eYQSr81ZslSO4kw3MKB4MiGi8/6sF
 RxJYRXydWko7TnkGlUpg/lQm2rOia5JT4UmgAZw0oAvS2hnMqF5o1cCRBG+NIBrJyayd
 pzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RPbl9mK2lHqtPxJYaVs7f9iaLeSoE19/DXnFWnPze78=;
 b=qNDJ4wtjuqlV8g2dNOnhWRT/Ppuw6gVNK5AnkEa1UQEeY2pOnKm0SaNrcTjqoNfXjW
 5+ihnAJzhXJRm3w8Ud1vhKCEAYqoqVU6YJ7GnMSRH1H2w5G828Sg0A1bCKTrleOPxdNC
 H1i8eUTJ7zeNdXjqzbmco295bEcXxZRmF8qR2pU/uLUbsEzHtXMMC8Wg8f2bOWw+qeV1
 nLq+rY1BATvXoUseVPQS7WcwsE/fMH+fbo1RBMatvKRIoXIABETKvQDoKrWwHapGIYVT
 Ha4f87nZxIygZKBiD9kMgEKw33Y84YBYdGpeZJsKl7MkaoI+NS3BWYJ+RKTX0B5kkDKR
 MfZw==
X-Gm-Message-State: AOAM531Aby8dfcWr+HHRKETcpjQzWTuVuexDIBBVHu55D2C8qiWu+LWJ
 yTp0EB3m/keOhIXgKyV/NbdclVERNXA=
X-Google-Smtp-Source: ABdhPJw/0SAtNvLbH/6QPg/7sGxDmkd17woxAavvh8nyyF8sxLeTCITmmYKuJHkWpMaPt+HUS0GHAQ==
X-Received: by 2002:ac8:7949:: with SMTP id r9mr8650298qtt.112.1610655249689; 
 Thu, 14 Jan 2021 12:14:09 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.242])
 by smtp.gmail.com with ESMTPSA id n66sm3588886qkn.136.2021.01.14.12.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:14:09 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.11
Date: Thu, 14 Jan 2021 15:13:54 -0500
Message-Id: <20210114201354.3998-1-alexander.deucher@amd.com>
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

Fixes for 5.11.

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-01-14

for you to fetch changes up to 2f0fa789f7b9fb022440f8f846cae175233987aa:

  drm/amd/display: Fix to be able to stop crc calculation (2021-01-14 14:06:43 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.11-2021-01-14:

amdgpu:
- Update repo location in MAINTAINERS
- Add some new renoir PCI IDs
- Revert CRC UAPI changes
- Revert OLED display fix which cases clocking problems for some systems
- Misc vangogh fixes
- GFX fix for sienna cichlid
- DCN1.0 fix for pipe split
- Fix incorrect PSP command

amdkfd:
- Fix possible out of bounds read in vcrat creation

----------------------------------------------------------------
Alex Deucher (1):
      MAINTAINERS: update radeon/amdgpu/amdkfd git trees

Alexandre Demers (1):
      drm/amdgpu: fix DRM_INFO flood if display core is not supported (bug 210921)

Huang Rui (1):
      drm/amdgpu: fix vram type and bandwidth error for DDR5 and DDR4

Jeremy Cline (1):
      drm/amdkfd: Fix out-of-bounds read in kdf_create_vcrat_image_cpu()

Li, Roman (1):
      drm/amd/display: disable dcn10 pipe split by default

Likun Gao (1):
      drm/amdgpu: set power brake sequence

Nikola Cornij (1):
      drm/amd/display: Add a missing DCN3.01 API mapping

Prike Liang (1):
      drm/amdgpu: add green_sardine device id (v2)

Qingqing Zhuo (1):
      drm/amd/display: NULL pointer hang

Rodrigo Siqueira (4):
      Revert "drm/amd/display: Fixed Intermittent blue screen on OLED panel"
      Revert "drm/amd/display: Fix unused variable warning"
      Revert "drm/amdgpu/disply: fix documentation warnings in display manager"
      Revert "drm/amd/display: Expose new CRC window property"

Victor Zhao (1):
      drm/amdgpu/psp: fix psp gfx ctrl cmds

Wayne Lin (1):
      drm/amd/display: Fix to be able to stop crc calculation

Wesley Chalmers (1):
      drm/amd/display: Initialize stack variable

chen gong (1):
      drm/amdgpu/gfx10: add updated GOLDEN_TSC_COUNT_UPPER/LOWER register offsets for VGH

mengwang (1):
      drm/amdgpu: add new device id for Renior

 MAINTAINERS                                        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  53 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  48 ++++++-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 142 ++-------------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  38 ------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  54 +-------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |   2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   4 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   1 +
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |  11 +-
 17 files changed, 125 insertions(+), 265 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
