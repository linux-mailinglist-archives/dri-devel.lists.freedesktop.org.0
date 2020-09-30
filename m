Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CE27EEAA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 18:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2738A895B5;
	Wed, 30 Sep 2020 16:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3323895B5;
 Wed, 30 Sep 2020 16:13:35 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 16so1961546qkf.4;
 Wed, 30 Sep 2020 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPuDKc9IWffl0QbTVBOGP6nbwyu+JKRq9ThOGVvMPSc=;
 b=lBBp9W7CszX+TgzYdwi6tqB4+rp2OPk6btY4tVmqMoGU6g85IcKssnYasbE45KrImE
 wCIFTsYKYY+feAPZxySfBneWCNvRaELJ7YpDdNtbk0jU0rC2Q4R7SLu77h3CL6GgkL1c
 CnP/Wkc1OVRDFy8esfBLuojqq0pKZafwTU+0eQtZYgRcMinaulkOVTfl0jJ/LkRgBH/h
 3hAciYoIuzsZhA8RPeETNVJxCwkzDU+8ahKCBog2feXL0I9FWujL9lciNdQkCjmuZNQP
 baCRnO2v3oRn4fcgl0hEo1x0xRApuIzmExeL5hsRKTgsPfXN0GLalt42Euaq2RPi8BS0
 7n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPuDKc9IWffl0QbTVBOGP6nbwyu+JKRq9ThOGVvMPSc=;
 b=T2VLvfEBP+9dxG9z3SqbzRjkxDl8MF3MenPXhu9wJ7jf/yAmzCk/DBcDJvSVZvi3D1
 +bewc6EeGiDBKr4lbhDumZvW76m4gel80sXbfBYMI2+Irl990gQBif4HKueVzUN7URHI
 A2tITrchHzgBFoj3R71yvLgL3GjKW7y6xwL6+VAqqKxEaTa9YoWl8NmrC9oedcDFll6t
 jvX+mOBrnbd7ZXEfEoh2GM92ezXleEGmweVK4RyBnPy2SGqiPAPOrR5wZZo/QRhdZtf1
 ACVDjTGFSUeyb0K7S3LlLMR06urK+3eB3vxJAAeJGHo/Z1+I4on8Jzb7E7S+wICi3KAk
 yrBw==
X-Gm-Message-State: AOAM532Tn3zU6O4G7KCnr8VghWdL33m6dCwrewLVz7lzuRYvtLr07tjg
 fSVwa0gI4To68xoSk9o7xgEi7hUEuFQ=
X-Google-Smtp-Source: ABdhPJw49591e+FFNnm+D5M72kUhHTLY5trU3O2OZXv+tc+zO4y1kT6xwh4d9VyV3b97B9L0oXorTQ==
X-Received: by 2002:a37:a785:: with SMTP id q127mr3245090qke.256.1601482414590; 
 Wed, 30 Sep 2020 09:13:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id t140sm2608505qke.125.2020.09.30.09.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 09:13:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.9
Date: Wed, 30 Sep 2020 12:13:26 -0400
Message-Id: <20200930161326.4243-1-alexander.deucher@amd.com>
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

A bit bigger than usual since I missed last week.  Mostly updates
for new asics and a few of misc bug fixes.

The following changes since commit 1f08fde70075784d28d1687d0e75871e81cc1173:

  Merge tag 'mediatek-drm-fixes-5.9' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-fixes (2020-09-18 08:52:06 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-09-30

for you to fetch changes up to 95433a1305a000aa91f558b062ce614a3bb8ceb5:

  drm/amdgpu: disable gfxoff temporarily for navy_flounder (2020-09-30 09:47:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-09-30:

amdgpu:
- Fix potential double free in userptr handling
- Sienna Cichlid and Navy Flounder udpates
- Add Sienna Cichlid PCI IDs
- Drop experimental flag for navi12
- Raven fixes
- Renoir fixes
- HDCP fix
- DCN3 fix for clang and older versions of gcc
- Fix a runtime pm refcount issue

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu: add the GC 10.3 VRS registers
      drm/amdgpu: add VCN 3.0 AV1 registers
      drm/amdgpu: use the AV1 defines for VCN 3.0
      drm/amdgpu: remove experimental flag from navi12
      drm/amdgpu/display: fix CFLAGS setup for DCN30
      drm/amdgpu/swsmu/smu12: fix force clock handling for mclk

Dirk Gouders (1):
      drm/amd/display: remove duplicate call to rn_vbios_smu_get_smu_version()

Evan Quan (1):
      drm/amd/pm: setup APU dpm clock table in SMU HW initialization

Flora Cui (1):
      drm/amd/display: fix return value check for hdcp_work

Jean Delvare (1):
      drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config

Jiansong Chen (2):
      drm/amdgpu: remove gpu_info fw support for sienna_cichlid etc.
      drm/amdgpu: disable gfxoff temporarily for navy_flounder

Likun Gao (1):
      drm/amdgpu: add device ID for sienna_cichlid (v2)

Philip Yang (1):
      drm/amdgpu: prevent double kfree ttm->sg

Sudheesh Mavila (1):
      drm/amd/pm: Removed fixed clock in auto mode DPM

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 10 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 12 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  3 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              | 16 +++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  1 -
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      | 18 +++++++-
 .../amd/include/asic_reg/gc/gc_10_3_0_default.h    |  2 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |  4 ++
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    | 50 ++++++++++++++++++++++
 .../amd/include/asic_reg/vcn/vcn_3_0_0_sh_mask.h   | 34 +++++++++++++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         | 22 +++++-----
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  | 10 +++--
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |  8 ++--
 16 files changed, 154 insertions(+), 41 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
