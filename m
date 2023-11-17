Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82B7EF6B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55AF10E0DF;
	Fri, 17 Nov 2023 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B618A10E0BD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:02:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-407acb21f27so2536045e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700240544; x=1700845344; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ow9OG3Ho599DwrQn5RuSxC3AecXtcreiBqNQqgL1o2k=;
 b=DcRZabeYsNVk4piiZW+uJc4bL3EccwD3O/9F+SYQoIWhZq5uEd9EBLSAJse5UFmCxl
 qQp+yX7nZeVQalPG2jKZplNm9T9Xt0hEgnB1HdMrgiwY3/+3Bi1wCOoq/5H1VlGF65sh
 DAT3cq1ExKIxqQ8JzAqDdcMDQTAAsgxSqI57Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700240544; x=1700845344;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ow9OG3Ho599DwrQn5RuSxC3AecXtcreiBqNQqgL1o2k=;
 b=FfIoPf0L5rL289IpeiYIjIcEnnL4LGjxbRY16dy7UvVBzt8EUDrXgitZ5JQWtq5Mkg
 uojYRdqebXYiF9F4sfCPzh8s8umt6gtfmYDFwqMPVoKupc/iExrJ+v/Pp1FymYPie6KJ
 JOUtqbCrsa1yL1MWmqk/4oPo5peD+2DxAQjNBiXgSBsN2DtOhWGjzDTnnEVfURwBWRLA
 PpWFYEWaFHJJEE9WZnf8AZQRpUVG8AFq1WPoYYhZuchCo41PPxqj0TsxzsMmlhj2bm7n
 sym6iI3STSnSSjSAJCYDOo254j9TMBZ7tABOeEB2HqTvm4Y3Ota2+ygzeOKLit6MfWRm
 hj6w==
X-Gm-Message-State: AOJu0YyLp7ysqQtGlvRuEWRiC82gT6p4eIopNy8L8io+rWybjx9VzhVu
 esw66MCTFVEkW8AyPaylW/22aw==
X-Google-Smtp-Source: AGHT+IH2yL0XcTOe7QQP6qTBjrb4VED/n/+ZjGfLRRj9qIxcEOTI+mcJ5TAl1LSNPiCDBWL4ulJ7fg==
X-Received: by 2002:a05:600c:d9:b0:405:1ba2:4fcf with SMTP id
 u25-20020a05600c00d900b004051ba24fcfmr8910828wmm.4.1700240543753; 
 Fri, 17 Nov 2023 09:02:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003fe61c33df5sm7956560wms.3.2023.11.17.09.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 09:02:23 -0800 (PST)
Date: Fri, 17 Nov 2023 18:02:21 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes for -rc2
Message-ID: <ZVecnXhAAVeIMvSv@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is a "blast from the bast" fixes pull, because it contains a bunch
of AGP fixes for amdgpu. Otherwise nothing out of the ordinary.

Next week is back to Dave unless he's knocked out by some conference bug.

Cheers!

drm-fixes-2023-11-17:
drm-fixes for -rc2

- amdgpu: fixes all over, including a set of AGP fixes
- nouvea: GSP + other bugfixes
- ivpu build fix
- lenovo legion go panel orientation quirk

Cheers, Daniel

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-11-17

for you to fetch changes up to 86d8f905f24d223e15587365f07849635458c5d9:

  Merge tag 'amd-drm-fixes-6.7-2023-11-17' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-11-17 11:46:07 +0100)

----------------------------------------------------------------
drm-fixes for -rc2

- amdgpu: fixes all over, including a set of AGP fixes
- nouvea: GSP + other bugfixes
- ivpu build fix
- lenovo legion go panel orientation quirk

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/gmc11: fix logic typo in AGP check
      drm/amdgpu: add a module parameter to control the AGP aperture
      drm/amdgpu/gmc11: disable AGP aperture
      drm/amdgpu/gmc10: disable AGP aperture
      drm/amdgpu/gmc9: disable AGP aperture

Arnd Bergmann (1):
      accel/ivpu: avoid build failure with CONFIG_PM=n

Asad Kamal (2):
      drm/amd/pm: Update metric table for smu v13_0_6
      drm/amd/pm: Fill pcie error counters for gpu v1_4

Brenton Simpson (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo Legion Go

Dan Carpenter (2):
      nouveau/gsp/r535: uninitialized variable in r535_gsp_acpi_mux_id()
      nouveau/gsp/r535: Fix a NULL vs error pointer bug

Daniel Vetter (2):
      Merge tag 'drm-misc-fixes-2023-11-16' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.7-2023-11-17' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dave Airlie (2):
      nouveau: use an rwlock for the event lock.
      nouveau: don't fail driver load if no display hw present.

Duncan Ma (1):
      drm/amd/display: Negate IPS allow and commit bits

Fangzhi Zuo (1):
      drm/amd/display: Fix DSC not Enabled on Direct MST Sink

José Pekkarinen (1):
      drm/amd/display: fix NULL dereference

Le Ma (1):
      drm/amdgpu: finalizing mem_partitions at the end of GMC v9 sw_fini

Lewis Huang (1):
      drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox

Lijo Lazar (1):
      drm/amd/pm: Don't send unload message for reset

Mario Limonciello (1):
      drm/amd/display: fix a NULL pointer dereference in amdgpu_dm_i2c_xfer()

Muhammad Ahmed (1):
      drm/amd/display: Add null checks for 8K60 lightup

Nicholas Kazlauskas (1):
      drm/amd/display: Guard against invalid RPTR/WPTR being set

Nicholas Susanto (1):
      drm/amd/display: Fix encoder disable logic

Paul Hsieh (1):
      drm/amd/display: Clear dpcd_sink_ext_caps if not set

Shiwu Zhang (1):
      drm/amdgpu: add and populate the port num into xgmi topology info

Srinivasan Shanmugam (1):
      drm/amdgpu: Address member 'ring' not described in 'amdgpu_ vce, uvd_entity_init()'

Tianci Yin (1):
      drm/amd/display: Enable fast plane updates on DCN3.2 and above

Victor Lu (1):
      drm/amdgpu: Do not program VF copy regs in mmhub v1.8 under SRIOV (v2)

Yang Wang (1):
      drm/amdgpu: fix ras err_data null pointer issue in amdgpu_ras.c

YuanShang (1):
      drm/amdgpu: correct chunk_ptr to a pointer to chunk.

 drivers/accel/ivpu/ivpu_pm.c                       |  3 --
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 10 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  5 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |  6 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 24 ++++++-----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  5 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 29 ++++++-------
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 18 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 +--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  3 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 10 ++---
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  1 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    | 10 ++---
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  3 ++
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        | 22 ++++++----
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 50 +++++++++++++++++-----
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    | 10 ++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 10 ++++-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  6 +++
 drivers/gpu/drm/nouveau/include/nvkm/core/event.h  |  4 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |  5 +++
 drivers/gpu/drm/nouveau/nvkm/core/event.c          | 12 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  6 +--
 32 files changed, 182 insertions(+), 98 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
