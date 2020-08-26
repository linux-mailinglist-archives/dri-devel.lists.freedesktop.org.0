Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE52538E2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 22:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3D6EAA1;
	Wed, 26 Aug 2020 20:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866886EAA1;
 Wed, 26 Aug 2020 20:08:26 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id t20so2610004qtr.8;
 Wed, 26 Aug 2020 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSTKuGCAdnZ6n0lbk8YbkhincX1agpeYFNV8B1AeVKs=;
 b=XAjcAD4h+6i30aubB1DGb4gtu1sjFPONM1ry3pq0qfroMPks7clS+3fLlVylIlbTVA
 Zw88trSzRXrpbgKhO9cwB5b3CLSYrWCVb/TNquGRaOpk4/XfFMTZXVWPWaaL89TxBo6S
 A2RUbiZn8YrwrCJob3Zlk0WihmiTR7eu5nDXYvFV05loC864SIbdQFdUUzUTPCKn4Szi
 dduR34LtJCjxXV/fWS8joEu0BmdfaWMXy0F9gg44otYb/SE5M6GN3k40qnCj4qk4S0o4
 f44WU+ly2Nn8bWdA+9+lmUEnfTp5F33mg63M3KlbZ91F6RLh2pYfqGG84//2BrwzzZor
 h5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSTKuGCAdnZ6n0lbk8YbkhincX1agpeYFNV8B1AeVKs=;
 b=Hl/RuXKy+ZTHlB8C4lvxZagEaUvBYeNxX+Y+JB0uzPuaUrJiXqwtrCL7CCNKtR2tQ4
 KShhlp+UPBFdQIkGlCcSZM1PGtFrbs+G6yqQYaspQ9Log3XanrBl3yL5SUf+DnjMMahi
 DjU9pLn2s3GyAVEtiNK7tf+BZk08hORSeAIWX6GW9SgyoavhdvNs7nDhcqU0v/1eXlPq
 Fd7evhOhjYa+1W5OreRLerX6YiT6Amu35ef7fWe4klnsK1bGNj2hj841YF0EM1UR7g+t
 PQ5owfghtRZ6YGZViv9jD/jiKGtPqlr1uw8PbbqBmiFr5rLfW+C3E26pj6ZlRmhMwRGy
 PUuQ==
X-Gm-Message-State: AOAM531XBwhOcj3qSxJffebdIuUB6D9teluXMf4QLWdBhItTtHutntml
 TjSUhKiYEnx8Iuc2k6XQX544t1TDurU=
X-Google-Smtp-Source: ABdhPJyjz1W2CMA4LWbSv9iXFaartqLNpTgomG4p5ELSq/MeVuF9RAfpYauACdPrF+fZXeHSrcy6Kg==
X-Received: by 2002:aed:2f01:: with SMTP id l1mr6149547qtd.349.1598472505319; 
 Wed, 26 Aug 2020 13:08:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z14sm25470qth.5.2020.08.26.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 13:08:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.9
Date: Wed, 26 Aug 2020 16:08:01 -0400
Message-Id: <20200826200801.17735-1-alexander.deucher@amd.com>
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

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.9-2020-08-26

for you to fetch changes up to b67a468a4ccef593cd8df6a02ba3d167b77f0c81:

  drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init (2020-08-26 15:45:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.9-2020-08-26:

amdgpu:
- Misc display fixes
- Backlight fixes
- MPO fix for DCN1
- Fixes for Sienna Cichlid
- Fixes for Navy Flounder
- Vega SW CTF fixes
- SMU fix for Raven
- Fix a possible overflow in INFO ioctl
- Gfx10 clockgating fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Fix buffer overflow in INFO ioctl

Alexander Monakov (1):
      drm/amd/display: use correct scale for actual_brightness

Brandon Syu (1):
      drm/amd/display: Keep current gain when ABM disable immediately

Dinghao Liu (1):
      drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init

Evan Quan (4):
      drm/amd/pm: correct Vega10 swctf limit setting
      drm/amd/pm: correct Vega12 swctf limit setting
      drm/amd/pm: correct Vega20 swctf limit setting
      drm/amd/pm: correct the thermal alert temperature limit settings

Furquan Shaikh (1):
      drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps object to 0 in amdgpu_dm_update_backlight_caps

Jaehyun Chung (1):
      drm/amd/display: Revert HDCP disable sequence change

Jiansong Chen (5):
      drm/amd/pm: enable run_btc callback for sienna_cichlid
      drm/amd/pm: set VCN pg per instances
      drm/amdgpu/gfx10: refine mgcg setting
      drm/amdgpu: use MODE1 reset for navy_flounder by default
      drm/amdgpu: disable runtime pm for navy_flounder

Nicholas Kazlauskas (2):
      drm/amd/display: Reject overlay plane configurations in multi-display scenarios
      drm/amd/powerplay: Fix hardmins not being sent to SMU for RV

Samson Tam (1):
      drm/amd/display: Fix passive dongle mistaken as active dongle in EDID emulation

Sung Lee (1):
      drm/amd/display: Send DISPLAY_OFF after power down on boot

Tao Zhou (1):
      drm/amdgpu: add asd fw check before loading asd

Tong Zhang (1):
      drm/amd/display: should check error using DC_OK

Wayne Lin (1):
      drm/amd/display: Retry AUX write when fail occurs

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 93 ++++++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 10 +++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  8 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 53 +++++++-----
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  8 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  2 +
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  |  9 +--
 .../gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c   | 22 ++---
 .../gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c   | 21 ++---
 .../gpu/drm/amd/powerplay/hwmgr/vega20_thermal.c   | 21 ++---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 11 ++-
 18 files changed, 164 insertions(+), 116 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
