Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF50B44CA1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 06:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9967910EB15;
	Fri,  5 Sep 2025 04:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDiGD3HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0053510EB15
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 04:13:05 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b0475ce7f41so329345766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 21:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757045584; x=1757650384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KrWnGnxa3ZyzmRkYI/9k6bgQOkZyS8I4F7Ovw9oMlQU=;
 b=JDiGD3HOVVpIOQPOKSF+Iwz9yjYLc5dQKFc0RA6M7FN4NhQaAl+EcB292WQj9BFChA
 XfopCcW6pT8saNrxzPOvo2cw1MJqcWTanW+9kUspQoAq3OF2EhSs3aB4lqzOrvpB+Vo5
 yk7qOkpARAMWQtEMCVyOuez036SdBu6vXsvVj9JZWU5tMbxdH64te1Riq/GeIWZXDpT6
 KAWKix+W46cT127/gQXWI8/0Kfg69hzWS/JtbbdJBvQELBgw0ihHZ9CC3z6WZlDq0uE4
 mLA2xcdhFx1NeSnDVHe8fKL1RTQnnEB+h4Hvx6wD8o5YvN88OoIvGq9pIFDyOX2efRS1
 rkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757045584; x=1757650384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KrWnGnxa3ZyzmRkYI/9k6bgQOkZyS8I4F7Ovw9oMlQU=;
 b=QBwwIlC54WmdFEZuGZvi9XxTowKwJEyKiBFZLBHkk6zm8QUgalMYmKwuVj48Kqqe6R
 WqGM0LUvbU1yL0x6Ei7K3C34tM1UBs1mvvad+mXwwNf9ndQq8ZNAKrLmBq+e22bxpJWH
 zWetroveoXQxej5aNd7EMOTNmmh16Omri+mxTHrKAjXFTyQ0iF1L5WyreKRhf0of88b7
 4VQdLtECiCw86MfAtZGB50vp359sMKpB+af3s+8PUot6PNFC/EX/5NqFPz5FG3+B/78T
 T4amPMpTxqgoyDn+MesFyE9b/8QP2LZaQxpDAy35d5aUfJll/9GPHwqZrqaPi4zY9ZGZ
 M0Pg==
X-Gm-Message-State: AOJu0Yzk/LSzHvORK9TKqWZk1x9Gg8fYWdB7N3KQr2Hvad6EivjWFuas
 oNGRkmW2B5IvXjVxCblgWbdo31sRYodFwPF1QJbUqzc9Wr8joGqCAfVt19FVhkzXD0hJoQeWyy6
 /K76d1PLw6JFDgFBwyUYUDZgWPwrcXLR/J8a/
X-Gm-Gg: ASbGncv2CRICBzOKjsEhC0cfwg2bMOVFCEZxY8q54hcKzSvlrZcMuTFrq7f/Pg5E4GE
 SYUqPbAXkYAFAShVCVF7A0PzVMsTGXOEmStX5VPo1uYeUjs8hS5BYxE4VVYIiocwdpEvLW46nGP
 n/OTLhA8dSfC3t92ITFRwR74ONFqUzlFuXEOZa6sXnhdRtirP70vg2fAXHUWf9Z59nAkYs9pfJB
 MQy8WDOeQl2eHYIed0EBVc17FA=
X-Google-Smtp-Source: AGHT+IEGYPmHKSHEICSzF+d8fZa9yfkbd7BcogyVCTDPOqRiOrrEPpLDzglQacZqaoB1+90R1sj1QHtFClLH0IlvIec=
X-Received: by 2002:a17:907:3f13:b0:b04:830f:822d with SMTP id
 a640c23a62f3a-b04830fb950mr457621766b.63.1757045584035; Thu, 04 Sep 2025
 21:13:04 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Sep 2025 14:12:52 +1000
X-Gm-Features: Ac12FXzUJUH7iKinFb4_on0LQunMxw-L-dNUA679WdcIPzHioIDA3Nj8jaClEvc
Message-ID: <CAPM=9txcDaRBOKZEWzAcDsdT=APUzcSicYA=-fno+52zGz0bOA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Linus,

Weekly drm fixes roundup, nouveau has two fixes for fence/irq racing
problems that should fix a bunch of instability in userspace.
Otherwise amdgpu along with some single fixes to bridge, xe, ivpu.
Looks about usual for this time in the release.

Regards,
Dave.

drm-fixes-2025-09-05:
drm fixes for 6.17-rc5

scheduler:
- fix race in unschedulable tracepoint

bridge:
- ti-sn65dsi86: fix REFCLK setting

xe:
- Fix incorrect migration of backed-up object to VRAM

amdgpu:
- UserQ fixes
- MES 11 fix
- eDP/LVDS fix
- Fix non-DC audio clean up
- Fix duplicate cursor issue
- Fix error path in PSP init

nouveau:
- fix nonstall interrupt handling
- fix race on fence vs irq emission
- update MAINTAINERS entry

ivpu:
- prevent recovery work during device remove
The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0=
:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-05

for you to fetch changes up to 8b556ddeee8da9420699ce221b6267f395e7d72b:

  Merge tag 'amd-drm-fixes-6.17-2025-09-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-09-05
08:06:34 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc5

scheduler:
- fix race in unschedulable tracepoint

bridge:
- ti-sn65dsi86: fix REFCLK setting

xe:
- Fix incorrect migration of backed-up object to VRAM

amdgpu:
- UserQ fixes
- MES 11 fix
- eDP/LVDS fix
- Fix non-DC audio clean up
- Fix duplicate cursor issue
- Fix error path in PSP init

nouveau:
- fix nonstall interrupt handling
- fix race on fence vs irq emission
- update MAINTAINERS entry

ivpu:
- prevent recovery work during device remove

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/mes11: make MES_MISC_OP_CHANGE_CONFIG failure non-fatal
      drm/amdgpu: drop hw access in non-DC audio fini

Colin Ian King (1):
      drm/amd/amdgpu: Fix missing error return on kzalloc failure

Dave Airlie (4):
      nouveau: fix disabling the nonstall irq due to storm code
      Merge tag 'drm-misc-fixes-2025-09-03' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-09-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.17-2025-09-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Faith Ekstrand (1):
      nouveau: Membar before between semaphore writes and the interrupt

Ivan Lipski (1):
      drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG

James Jones (1):
      MAINTAINERS: Update git entry for nouveau

Jesse.Zhang (1):
      drm/amdgpu/sdma: bump firmware version checks for user queue support

Karol Wachowski (1):
      accel/ivpu: Prevent recovery work from being queued during device rem=
oval

Mario Limonciello (1):
      drm/amd: Re-enable common modes for eDP and LVDS

Michael Walle (1):
      drm/bridge: ti-sn65dsi86: fix REFCLK setting

Pierre-Eric Pelloux-Prayer (1):
      drm/sched: Fix racy access to drm_sched_entity.dependency

Thomas Hellstr=C3=B6m (1):
      drm/xe: Fix incorrect migration of backed-up object to VRAM

 MAINTAINERS                                        |  2 +-
 drivers/accel/ivpu/ivpu_drv.c                      |  2 +-
 drivers/accel/ivpu/ivpu_pm.c                       |  4 +-
 drivers/accel/ivpu/ivpu_pm.h                       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  5 --
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |  9 +++
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |  2 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  | 72 ++++++++++++++++++
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |  2 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  3 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 11 +++
 drivers/gpu/drm/nouveau/gv100_fence.c              |  7 +-
 .../gpu/drm/nouveau/include/nvhw/class/clc36f.h    | 85 ++++++++++++++++++=
++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |  2 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   | 23 ++++--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c |  1 +
 drivers/gpu/drm/scheduler/sched_entity.c           | 11 ++-
 drivers/gpu/drm/xe/xe_bo.c                         |  3 +-
 29 files changed, 234 insertions(+), 48 deletions(-)
