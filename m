Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89F1D257F
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 05:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4C6E0FE;
	Thu, 14 May 2020 03:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3F66E05A;
 Thu, 14 May 2020 03:40:57 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id r8so1751156qtm.11;
 Wed, 13 May 2020 20:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnJFyiL0KjHLvh34xBa7FotZdM6Mr0L7wodURNSL1xk=;
 b=eTEKZonlqLftE6GgM+/pvvqPpI0r14ps5AEaI3A/FwNpomvtO62wET+gmOdv+ohiuR
 ZJU+1Hz/0CUL0vxhoZiNM7bAhW4lw0LlV9NqPLizzzvQ50Pl6r7G0I+TNInFxD3q/jPH
 pg6Y9Nms28+rW4Q0BOIj5emsn9TcpdBIwxlY5rI8f/AQy10Jlw6uVSBlZos3ITyx+A2h
 VtOyeN7SZRKorDkj5TsKHVx6J4cDov4/r3OxEcVK7auQ2asxzsIBx+WKEUGcSL/vdp0S
 mwqxweXXZYUBoXtdcTkghPMNdxTixoa95GXFij6wrahRp5U9fsZc5kKrYKK5JJZBk/rY
 QJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnJFyiL0KjHLvh34xBa7FotZdM6Mr0L7wodURNSL1xk=;
 b=G8auMiIR5SeWtTHe7VQ32owzaHL/1rCtokRRkv1n9gLCp6ZZ85gpGBfj4ARednbAek
 SvnQ7gIxFl0AOrHqqpeWz1EhAC5OwKoIFR8mhMUjLlZJx887f9ZalxXQ/nUiDuHm+XVj
 EVeI2ESg41aYwoeLwT0+jvr82OwBqOMN5V53wTOeDOnsHALW5gEUGXzeNEz7eL8hz2az
 C9FV2TJTzauqYYlz5erECC1/Yi6mpPdJf7cgUVFELktadWSmgSDbf0Qg4S+Uy+7q9kMm
 LCvoM1rXQcMWhdxpVQqFl/8hrLsdcKdEhSnL3i/HXlafnyXpmzeOhCBzcS2VSipVT+ZZ
 dRbw==
X-Gm-Message-State: AOAM533wtnz6qB1TJf2VmUEx9ApjU8eE4BbdkBYuHVhwJmG4sgRSeN6T
 R32UXeeGv+3xubSYZhLDlM5vGN+2
X-Google-Smtp-Source: ABdhPJwcFHlImMh96wUlcU08GnAJzXWa0U6wVFY3Ecrru8rO6sCvS82fk/IqiLBHTA4vkuilHULPlQ==
X-Received: by 2002:aed:374a:: with SMTP id i68mr2377848qtb.69.1589427655915; 
 Wed, 13 May 2020 20:40:55 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id h134sm1700412qke.6.2020.05.13.20.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 20:40:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.7
Date: Wed, 13 May 2020 23:40:46 -0400
Message-Id: <20200514034046.3988-1-alexander.deucher@amd.com>
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

Fixes for 5.7.

The following changes since commit a9fe6f18cde03c20facbf75dc910a372c1c1025b:

  Merge tag 'drm-misc-fixes-2020-05-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-05-08 15:04:25 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-05-13

for you to fetch changes up to 650e723cecf2738dee828564396f3239829aba83:

  drm/amd/amdgpu: Update update_config() logic (2020-05-12 08:40:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-05-13:

amdgpu:
- Clockgating fixes
- Fix fbdev with scatter/gather display
- S4 fix for navi
- Soft recovery for gfx10
- Freesync fixes
- Atomic check cursor fix
- Add a gfxoff quirk
- MST fix

amdkfd:
- Fix GEM reference counting

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: force fbdev into vram
      drm/amdgpu: implement soft_recovery for gfx10

Evan Quan (4):
      drm/amdgpu: disable MGCG/MGLS also on gfx CG ungate
      drm/amdgpu: drop unnecessary cancel_delayed_work_sync on PG ungate
      drm/amd/powerplay: perform PG ungate prior to CG ungate
      drm/amdgpu: enable hibernate support on Navi1X

Felix Kuehling (1):
      drm/amdgpu: Use GEM obj reference for KFD BOs

Leo (Hanghong) Ma (1):
      drm/amd/amdgpu: Update update_config() logic

Nicholas Kazlauskas (1):
      drm/amd/display: Fix vblank and pageflip event handling for FreeSync

Simon Ser (1):
      drm/amd/display: add basic atomic check for cursor plane

Tom St Denis (1):
      drm/amd/amdgpu: add raven1 part to the gfxoff quirk list

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  22 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 163 ++++++++++-----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  10 +-
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c      |   6 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |   8 +-
 10 files changed, 119 insertions(+), 115 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
