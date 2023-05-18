Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D11708733
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 19:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE3F10E36A;
	Thu, 18 May 2023 17:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E59610E0FB;
 Thu, 18 May 2023 17:48:25 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-45700c4b74dso64978e0c.0; 
 Thu, 18 May 2023 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684432104; x=1687024104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JTh5R9z4cB01EQbbTfSZ7cANfaD/KXruWBvLA5Na1Jg=;
 b=gHDXKx45lz9ER6hkJ4w5sqpncZz3JtWNrVX3OadqIKQJfHOmlY1IauvwpbpxHIQ4zc
 LpHC3GIqNOrh8y7ZuAL34/y8XyW8nYAPJEEGG+CoLju5CorIWI1WKUVvMNAk8Cn6ugMx
 pYWQzjMoMXJEOp2FqO+cYNQeqH47g2ymcLEKzSuMoRlCI+CuHvjxAiTkVCuuos1jw6r0
 siXhz0G+YrXcEI8GITE0e9Vr1pGWLAwES/CgK5q0/FT/k92FZ9tRHFdShsOMTZHoG7gL
 2W0bMaUcw85d/4HbDat9hrwG4CFADe06ff4z/gSbINFtZR5crugUKjxpuCDigZGL0Pkg
 i3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684432104; x=1687024104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JTh5R9z4cB01EQbbTfSZ7cANfaD/KXruWBvLA5Na1Jg=;
 b=c/w/OhF38GiyEHPE8h6KlaeJ0JcGafcJjo4RVLXmUKG3/jc8868r+K2XzB0ySyfDnm
 ARSTLwyuc53PpK4bKZUXBwJMKvz+Gy+KZjY1qc3rbrEG92GXNBsoItAUF/IJaR3qbimp
 x0+FyM1+xJ9QSyIFkIkMgzyIEqnq3tmpC8IabwYNuSHgCOeaiXFsDR0Pp5vbj9uMuCjb
 eMruhaoRUAFs6rEA1zyIl4RCwg8trtnzxVUAj5NU98NcTbmdSkfR37vc6EH7DzRa+h5f
 oahiJZhSdwCVKoHRogvmTBHeWvK9ca6LkCCkefiPG/UkCEpt/5dRBOPPjeivChjue/rq
 hPJQ==
X-Gm-Message-State: AC+VfDx9ptRF5jXXWhsyiua2R4iBwssjcVWkO0Pwr0/qYC4irwz/aGyX
 c0fNYEIJSEeBR+5ZOKgPLha88oiZSCo=
X-Google-Smtp-Source: ACHHUZ75YbTCQpoWo2SxJFCmNv6io2LMRwUIOrBqn+7zyeJ24KmmWezh1v7nlxPwNPip0jc1xXAbdg==
X-Received: by 2002:a1f:4316:0:b0:43f:c650:acae with SMTP id
 q22-20020a1f4316000000b0043fc650acaemr1247694vka.16.1684432101289; 
 Thu, 18 May 2023 10:48:21 -0700 (PDT)
Received: from tr4.. ([71.219.129.39]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a122e00b007590aa4b115sm534707qkj.87.2023.05.18.10.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 10:48:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-6.4
Date: Thu, 18 May 2023 13:48:11 -0400
Message-Id: <20230518174811.3841-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.4.

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-05-18

for you to fetch changes up to 6d600229df1ed06f46ba68ac706d9f44ba8c5fb4:

  drm/amd/display: enable dpia validate (2023-05-18 09:58:35 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-05-18:

amdgpu:
- update gfx11 clock counter logic
- Fix a race when disabling gfxoff on gfx10/11 for profiling
- Raven/Raven2/PCO clock counter fix
- Add missing get_vbios_fb_size for GMC 11
- Fix a spurious irq warning in the device remove case
- Fix possible power mode mismatch between driver and PMFW
- USB4 fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx11: update gpu_clock_counter logic
      drm/amdgpu/gmc11: implement get_vbios_fb_size()

Bas Nieuwenhuizen (1):
      drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.

Evan Quan (1):
      drm/amd/pm: fix possible power mode mismatch between driver and PMFW

Guchun Chen (1):
      drm/amdgpu: skip disabling fence driver src_irqs when device is unplugged

Guilherme G. Piccoli (1):
      drm/amdgpu/gfx11: Adjust gfxoff before powergating on gfx11 as well

Jesse Zhang (1):
      drm/amdgpu: Differentiate between Raven2 and Raven/Picasso according to revision id

Mustapha Ghaddar (1):
      drm/amd/display: enable dpia validate

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  8 +++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 19 +++++++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 33 +++++++++-------------
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 21 +++++++++++++-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  3 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 18 ++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 20 +------------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 9 files changed, 80 insertions(+), 46 deletions(-)
