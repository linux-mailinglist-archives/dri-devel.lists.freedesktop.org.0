Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF74A93FD7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 00:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C148B10E1C1;
	Fri, 18 Apr 2025 22:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRATzOqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A4110E1C1;
 Fri, 18 Apr 2025 22:18:04 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85db3475637so97386739f.1; 
 Fri, 18 Apr 2025 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745014683; x=1745619483; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RS1FSpT2MlnZ7LD4PcV6/Q3ZAeJ8XPNoKk60igAHuvQ=;
 b=eRATzOqU+uyDFb6mtS6Z5D1Wu2qt5Nljr6S//RQJDTVzB1JTys4Gj+/gfdt1rkkyWg
 dDqrO/9tlhvn76NOwbiK7841gmOXqxT+BLwDSfmE+2rn4wgPZOdEz3X/pC/S3tTkPVBO
 7B8eO0mjPxc3HiDsqI8Sm6FT6bsmi0Yuzlvvw5Ytx/tlrSrRHTSL9FNNKdRnl+AHF63E
 ualk7tA7y+H8+rhCNUs2q/UWdwDoRTrUAuNkgnvcRUUiQX3/spGLIBWeiH7jEL/Fmf/U
 BjDPMqQK01dvp3aYeXIenu8yb2X+ih+Pk2KSA/MSAA+x9A5fjmD85V3zkwK6gdQ2JMIW
 uI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745014683; x=1745619483;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RS1FSpT2MlnZ7LD4PcV6/Q3ZAeJ8XPNoKk60igAHuvQ=;
 b=wifvR4QJQ7aPBqqimX+WcKOWYIhV8hXrEwk+OZJZ322+rj8FcSj2SL2EzI7mEPNgcc
 SYBbAGKY3hTT74cwBRa78w+xEYpZ9MmJrVDBm3qc/1VCLoBkDYEtjCJVpT9NDZE5hdho
 AOH66uy4u/UB+wmoNAUUtUSlHY3XKE7Du9zbvC9dA41aY0Dvte3UX/0rICFaGJFjio5s
 Z4i9JdMRNQz3kii46WKz3HVxL8L7VdboGBcdA/gs8bG4KZh5vMDMYTkkkDcnx2MOepqi
 ksiA0EpNTGqztC3ltQgWYCk0a2RvVHtqR1Jf7kK8FuAERnTrucQ3qg5WM0Y1d9dT7xQI
 vnfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzmFoFc1M+xDWyOxj88b+GPSi0uRCI4iK2yAIwWXR/KKAoGkCeKauggDxqzGXhqgJwZZWAsdAAFCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0xxqzyuEBdd6r+2M0pw/OFplqx+/NxJoKA+iconAr7fBl/Qy1
 4Ppal+u7J9SCxHPsJAKln4y0iwVPLd94RLwcuESlkfFh+ow6+XCgGiUlRxYPjoN2bliWRHUOfvU
 hINmXjH3lKf1xGYn1JbYLblrnHkE=
X-Gm-Gg: ASbGnctQj8FDZUaifKo5sP0M6aalcllX+DTTdeFTS/X7EB2TPX2XmtkioccHr6xAVt8
 VY8KzUynVJjEGgOe8aysJdz7w0gPiIOT+PLQN9FNtzGox2OOgDzes75yOVFsaqL763/ssAaatVM
 0DONQe6Mw4RXaK3PvopGHwRTOVpktwRGhBOGuiUUznVr6Wrps6LpJ+QPBx
X-Google-Smtp-Source: AGHT+IEfUxsOUwDFYpKLoaEmUzZ5X3ueiW+fXEta1tk63WYohjmHx0iZcS/k63/0pUUlXY5jfKd05JxFjQ17rgsUXqg=
X-Received: by 2002:a05:6e02:174c:b0:3d6:d838:8b93 with SMTP id
 e9e14a558f8ab-3d8bf27aca2mr33660785ab.7.1745014683628; Fri, 18 Apr 2025
 15:18:03 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Apr 2025 15:17:52 -0700
X-Gm-Features: ATxdqUFZ_tO0K7cdxfy-S6NFR2m3x7fcs4Yr_m40G6w-4lUTP8wPeq_iH8w8-U8
Message-ID: <CAF6AEGtVKXEVdzUzFWmQE8JmK3nx_hp+ynOd-5j3vnfcU-sgOA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-04-18 for v6.15-rc3
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Dave, Simona,

A few fixes for v6.15, as described below.

The following changes since commit 83ee6d2ec52f1378f3473ee8657d559bebdbda44:

  dt-bindings: display/msm: dsi-controller-main: Add missing minItems
(2025-03-08 03:06:00 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-04-18

for you to fetch changes up to 9d78f02503227d3554d26cf8ca73276105c98f3e:

  drm/msm/a6xx+: Don't let IB_SIZE overflow (2025-04-18 15:15:24 -0700)

----------------------------------------------------------------
Fixes for v6.15-rc3

Display:
- Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
  case of multi-rect
- Fix to validate plane_state pointer before using it in
  dpu_plane_virtual_atomic_check()
- Fix to make sure dereferencing dpu_encoder_phys happens after
  making sure it is valid in _dpu_encoder_trigger_start()
- Remove the remaining intr_tear_rd_ptr which we initialized
  to -1 because NO_IRQ indices start from 0 now

GPU:
- Fix IB_SIZE overflow

----------------------------------------------------------------
Chenyuan Yang (1):
      drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check

Dmitry Baryshkov (1):
      drm/msm/dpu: drop rogue intr_tear_rd_ptr values

Jun Nie (1):
      drm/msm/dpu: check every pipe per capability

Qasim Ijaz (1):
      drm/msm/dpu: reorder pointer operations after sanity checks to
avoid NULL deref

Rob Clark (1):
      drm/msm/a6xx+: Don't let IB_SIZE overflow

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 +--
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  4 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 74 ++++++++++++----------
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  7 ++
 10 files changed, 53 insertions(+), 55 deletions(-)
