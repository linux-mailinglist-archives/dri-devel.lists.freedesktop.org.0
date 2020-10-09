Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8826D289BC1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 00:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242B16EE2F;
	Fri,  9 Oct 2020 22:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459106EE2F;
 Fri,  9 Oct 2020 22:28:40 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id b69so12252030qkg.8;
 Fri, 09 Oct 2020 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lt5Jd7YC7DH6niYBHptmYTDZ+Xfw81ve5JyVXKnAgM=;
 b=FpLJx0OnLOZfd85S5tft5nlCm3Q6mGYdYb74yMtcKTShc2ZSGXmR15q+ruQT2BECzL
 wFAPw/ghEn7UkvSl4KF1hhzRQV2+L8b0EyNR8+EsQR4l65LGCgQ9hkwjS/A5z+v/BT0a
 YShP10WBFpvDjpnG0XL4XHAPiaSTSDPF2bMSHN1y1pwOtwa/W58K/FVfFW84cqInV2uJ
 tXiIL7l0XEVYWsK0w2MNhWpZ51j2APmpVhvvNzJoMuwngrCWfASrkcKYXVEGsfHjtT81
 RlKUWHSq6Gy5ajNeaTleK/P8HjJSR6+l/wxxlh3J2Ni5nSLH2NewpBm+g0LhEJTBZ4DA
 4FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lt5Jd7YC7DH6niYBHptmYTDZ+Xfw81ve5JyVXKnAgM=;
 b=jqKyXo2W/FBT87Ijn2O5fQHyovulChrtTz1veO4VTOkBeWZ9SyQU58XZNK44C9AmiH
 X7R0K7NoG9iJK6Pb5RvXnVdv+p+oDvi4aFdBlmewaj03+Jx+ktWuNqoQ5nphd/y4RL61
 djeNTS2Dyfp98uezDVZu5nn+OyhOpLEqb3L2dXxdo8/l5WWPkNDFhfvh2SWnnh8fIbGb
 uSRukGpIWHQfAW5ckIUCccXdf07EivytSJ4hBdC1Vzf3FgJpSFMnhNZ3DcVBVygJkHjE
 AtilNi/AqkRjBG80YmzDdNj5V1VzVNPPILfR/bFcxSSMsn/FJkrg5QeSxi9gaHaDPJyV
 8rug==
X-Gm-Message-State: AOAM530lgDjU2RtcPDOW7emA97PxrlIgTMUdJ+lJYVhU4YxoqfLqRycH
 wCfjECn8d1B+If5yvBwuMXQVr6A99hQ=
X-Google-Smtp-Source: ABdhPJzSsAK5K+uzJPPMBd5wUXWQEuZ0DzdduiCxtBHrseOPA60b0it7m3EtFwZltKGkXWonb4IjnA==
X-Received: by 2002:a05:620a:6d8:: with SMTP id
 24mr189590qky.294.1602282518965; 
 Fri, 09 Oct 2020 15:28:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id d7sm7139003qkg.29.2020.10.09.15.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 15:28:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.10
Date: Fri,  9 Oct 2020 18:28:10 -0400
Message-Id: <20201009222810.4030-1-alexander.deucher@amd.com>
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

The following changes since commit f2fa07b39fafb2a5f49c71a504862c5efa57d03e:

  drm/amd/amdkfd: Surface files in Sysfs to allow users to get number of compute units that are in use. (2020-09-30 15:26:27 -0400)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-10-09

for you to fetch changes up to 9c27bc97aff8bbe62b5b29ebf528291dd85d9c86:

  drm/amdgpu: Fix invalid number of character '{' in amdgpu_acpi_init (2020-10-09 15:16:10 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-10-09:

amdgpu:
- Clean up indirect register access
- Navy Flounder fixes
- SMU11 AC/DC interrupt fixes
- GPUVM alignment fix
- Display fixes
- Misc other fixes

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/swsmu: add interrupt work function
      drm/amdgpu/swsmu: add interrupt work handler for smu11 parts
      drm/amdgpu/swsmu: fix ARC build errors
      drm/amdgpu: prevent spurious warning

Alex Sierra (1):
      drm/amdgpu: align frag_end to covered address space

Alvin Lee (1):
      drm/amd/display: Don't allow pstate if no support in blank

Chris Park (1):
      drm/amd/display: Change to correct unit on audio rate

Dirk Gouders (1):
      drm/amdgpu: fix NULL pointer dereference for Renoir

Dmytro Laktyushkin (1):
      drm/amd/display: Fix OPTC_DATA_FORMAT programming

Emily.Deng (1):
      drm/amdgpu: Remove warning for virtual_display

Evan Quan (1):
      drm/amd/pm: setup APU dpm clock table in SMU HW initialization

Fangzhi Zuo (1):
      drm/amd/display: HDMI remote sink need mode validation for Linux

Hawking Zhang (4):
      drm/amdgpu: add helper function for indirect reg access (v3)
      drm/amdgpu: switch to indirect reg access helper
      drm/amdgpu: support indirect access reg outside of mmio bar (v2)
      drm/amdgpu: enable GDDR6 save-restore support for navy_flounder

Rodrigo Siqueira (1):
      drm/amd/display: Avoid set zero in the requested clk

Ye Bin (1):
      drm/amdgpu: Fix invalid number of character '{' in amdgpu_acpi_init

kernel test robot (1):
      drm/amdgpu: kfd_initialized can be static

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  36 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 228 +++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  51 +----
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  61 ++----
 .../amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  11 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   8 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   8 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   2 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  37 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  15 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  10 +-
 25 files changed, 308 insertions(+), 206 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
