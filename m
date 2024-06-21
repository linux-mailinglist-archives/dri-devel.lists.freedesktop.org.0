Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46681912956
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5227110F1E2;
	Fri, 21 Jun 2024 15:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YPhEtZJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B810F1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:32 +0000 (UTC)
Received: by mail-ed1-f99.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso2562582a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983290; x=1719588090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gXSIdZv0D0mNb/eb7+9Hk9KrKi7NwEu+jEPVy55LLuA=;
 b=YPhEtZJz9Ach8YVLfCs8jeeB/zkKN9MITTHLIDn78SbFAuAzW/e3kr6fQiaScoG27+
 ZkfgWJBZV/KamrV85gjsQDupQhz5ym00fb4nGpsdUOhwS5v5cHo+v6UK/9pVXjSwLeg8
 96C3zZ2tACtEbSrjwTQTpCiE91UCT9zwZ1+lIIzikquUPCAwSvILpe/fXQNmrK7BvF37
 UadZxi9aoK/i4xgXolXuAZ9PEAADkunfFasl7bEUPtErcCZdGp7Cb3q4+RIZSdCgJSTk
 pwwBx0X+HdgAyYeykcMURpOT18BsJ56Xo9Nn12T/yzwyZMnABtk5eG4CRQSwQlyezCu7
 24PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983290; x=1719588090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXSIdZv0D0mNb/eb7+9Hk9KrKi7NwEu+jEPVy55LLuA=;
 b=YXGaVMHlkgh11TdTEEKP6TLUBoxqlxC9XyJl5jF3yy4zEllwx72FQ1c/tsWNECgVmV
 Id5yv55TSiGfxJRfnitwstsgw1Kyv7rfMvVU8Oqw6ISNa7OlTo6RGqi/lYXa6CfM5AyL
 NRoUc3ECKLm2QMxMQGcFnaY/24d8phTvCTkj4C7pSgJLoB2NQevgu5xj5grpVP6evZeJ
 Z/JhoeKekrw59w8/39Q1+sMKabV5dis78/GusZrj89uUD4GJyaFLygdKhWLjo0U/YRJS
 mGSj9lqan8mCz9LXdQZPwY8gTHc2NiSPS9cqaZiXotpVis0cb1IT/AosDLtDMcrrL/Bc
 wedg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0/Rq3j44tvAd5yg+kDC4FQqD0ZayayjtBHIX/uayvjYMGMLM4Kr8qtDMoXn8Kj5Rg4/YFs7DQcP5CCHmeN1yef3EDTNsI2Do7Cuh5iEpT
X-Gm-Message-State: AOJu0Yx4ToxCfGcco67XfoUdOAeKK6RTI2rqofx5HURxwFSTjg4OMtdJ
 CTqrUqvh0k8lKLgqxDjGXyOmGZWsfZzviwCmXiXBuWPOIyxvdMADAmC93KHaEq+atgapWC/3Y2c
 kdR6Z6yju/ECT9jAnJTex3ULVigrtDatS
X-Google-Smtp-Source: AGHT+IFKy7VmOT8K3yxAHMNb+50wk08RrEx/3pcae9tNhGOsjVGCppGQrQnGSgqvx7SqmDfHZj6Jij46TwhL
X-Received: by 2002:a50:c35e:0:b0:57c:74fb:6e31 with SMTP id
 4fb4d7f45d1cf-57d07ee71dcmr5083790a12.35.1718983290325; 
 Fri, 21 Jun 2024 08:21:30 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 4fb4d7f45d1cf-57d305f0781sm33171a12.24.2024.06.21.08.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:30 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/31] Preparatory patches for BCM2712 (Pi5) support
Date: Fri, 21 Jun 2024 16:20:24 +0100
Message-Id: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

This set is a number of minor fixes that we've had downstream for a while,
and then lays down the some infrastructure changes to facilitate adding support
of BCM2712. I'm just finalising those patches so they should follow on fairly
soon.

Thanks
  Dave

---
v1 -> v2

- Sorted Maxime's email address (git log hid the old address due to mailmap)
- Added my missed SoB to Dom's patch
- Extended commit subjects to standardise and include what part of vc4 was being
  updated.
- Added Fixes tags to all appropriate patches
- Dropped "Limit max_bpc to 8 on Pi0-3" as that is already fixed by b47a72f30768f
- Added "drm/vc4: hvs: Correct logic on stopping an HVS channel" as it is a
  pre-2712 fix that I found as I was then adding the 2712 stuff on top.

Dave Stevenson (8):
  drm/vc4: crtc: Force trigger of dlist update on margins change
  drm/vc4: hvs: Set AXI panic modes for the HVS
  drm/vc4: hvs: Don't write gamma luts on 2711
  drm/vc4: plane: YUV planes require vertical scaling to always be
    enabled
  drm/vc4: hvs: Fix dlist debug not resetting the next entry pointer
  drm/vc4: hvs: Remove incorrect limit from hvs_dlist debugfs function
  drm/vc4: plane: Move the buffer offset out of the vc4_plane_state
  drm/vc4: hvs: Correct logic on stopping an HVS channel

Dom Cobley (7):
  drm/vc4: plane: Keep fractional source coords inside state
  drm/vc4: plane: Handle fractional coordinates using the phase field
  drm/vc4: hdmi: Avoid log spam for audio start failure
  drm/vc4: plane: Add support for YUV444 formats
  drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
  drm/vc4: hdmi: Avoid hang with debug registers when suspended
  drm/vc4: hvs: Remove ABORT_ON_EMPTY flag

Maxime Ripard (15):
  drm/vc4: hdmi: Warn if writing to an unknown HDMI register
  drm/vc4: hvs: More logging for dlist generation
  drm/vc4: hvs: Print error if we fail an allocation
  drm/vc4: plane: Add more debugging for LBM allocation
  drm/vc4: plane: Use return variable in atomic_check
  drm/vc4: crtc: Move assigned_channel to a variable
  drm/vc4: Introduce generation number enum
  drm/vc4: Make v3d paths unavailable on any generation newer than vc4
  drm/vc4: hvs: Use switch statement to simplify
    vc4_hvs_get_fifo_from_output
  drm/vc4: hvs: Create hw_init function
  drm/vc4: hvs: Create cob_init function
  drm/vc4: hvs: Rename hvs_regs list
  drm/vc4: plane: Change ptr0_offset to an array
  drm/vc4: hvs: Rework LBM alignment
  drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers

Tim Gover (1):
  drm/vc4: hvs: Enable SCALER_CONTROL early in HVS init

 drivers/gpu/drm/vc4/tests/vc4_mock.c       |  14 +-
 drivers/gpu/drm/vc4/vc4_bo.c               |  28 +-
 drivers/gpu/drm/vc4/vc4_crtc.c             |  35 +-
 drivers/gpu/drm/vc4/vc4_drv.c              |  22 +-
 drivers/gpu/drm/vc4/vc4_drv.h              |  29 +-
 drivers/gpu/drm/vc4/vc4_gem.c              |  24 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c             |  25 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h        |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c              | 351 +++++++++++++--------
 drivers/gpu/drm/vc4/vc4_irq.c              |  10 +-
 drivers/gpu/drm/vc4/vc4_kms.c              |  14 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c          |  20 +-
 drivers/gpu/drm/vc4/vc4_plane.c            | 281 +++++++++++------
 drivers/gpu/drm/vc4/vc4_regs.h             |   1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c        |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c              |  10 +-
 drivers/gpu/drm/vc4/vc4_validate.c         |   8 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |   2 +-
 18 files changed, 538 insertions(+), 343 deletions(-)

-- 
2.34.1

