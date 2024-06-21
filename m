Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D7912EAB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B3E10E1A3;
	Fri, 21 Jun 2024 20:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bjyv1cLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B1710E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:41:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42278f3aea4so22322745e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719002487; x=1719607287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=st2T2bvKPqL7KgdIH6KuergYO7qJ2AF6CEAr7toPRDc=;
 b=bjyv1cLBfwP2s/63JRaQWUz4IdnyHyfDNMySiKdX6S8tBWzAK8stsZ2ckMZOiLrhN7
 mr2U+lXVT6I0Hc3AwaFWLoG9Yt23+4A2zYE+NJfALoTU4kT/bjHqCs3wrJp29ArgVgS9
 UneuxvC742GUQj+sqpWv+XkMdrBKxBIo9TjJwbIuyqERiMdZuYusEX2nmlZ9KduPdytI
 OLARy8rBogb/4htT5lDiuk87u01uxlhg2ci/ik7zOJIIHQllPGipga2YeBolxGFcSHHm
 2Pz4pt20aLhMr+GFZiZIkuINkVtZ1z2lsaIp79PF6UNo1sJRuD5qklT6rGEl7rVooync
 o0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719002487; x=1719607287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=st2T2bvKPqL7KgdIH6KuergYO7qJ2AF6CEAr7toPRDc=;
 b=L3Er3FwUXRhHbZXo5fp9U0RDDka6Hhe3Mxv96+0mS5xrTaH/z/BI0CT1YM7vIMpHoy
 oMNb6fIMGT2Opk1tX46kxDBTiB7ME3ibuiHZUv0HTSekI38NkybubKvo+acY4UQW0+kb
 8Eds4l9/TxQyI5x9ArjIhFuWLQPSNRAhx6fVkevP1vqlZK8qgprPZtK/FhgDFEn5gHLU
 vaSg1UbMgq44frTbLl94mAmPRGGSH3ZE1ETBRDiOQ1vP8cxU8AuzegVLVXOw1UXAYCtP
 niT5MAMG5pkMXTzrOX3RqmiBL0OLgrD1zksEjG6fQXj1YxF8UY1JkmNPvhadTqYprJF3
 kE1w==
X-Gm-Message-State: AOJu0Yyr+7iFTswTD277Yc59lKHeUnGeHwzuPGyVpSKv3HjClHInH3Fp
 bcVbPrpCAEBVme7SgzmlfzCxVfu5ml9PQOqxPJl6o72aqbfKLezsiicVd94MmgLdpN87jq9iN8C
 bobxWyAfOiDuL6wbTfdO5ifcCmuU=
X-Google-Smtp-Source: AGHT+IHQuZkZM5HM+eDRCVeWgklAl25KFBbRpNSyaHjvVx2sydx9BN7BLwY8bMQZkkbrDDiWh80cvAqHEUjNwY9hGpw=
X-Received: by 2002:a05:600c:22c3:b0:424:7615:ecc0 with SMTP id
 5b1f17b1804b1-4247615eed9mr65575685e9.6.1719002486940; Fri, 21 Jun 2024
 13:41:26 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 22 Jun 2024 06:41:13 +1000
Message-ID: <CAPM=9tyhLY-=pyy=RU0kyTQmV=_cFujRQ0Z=KY+o8V6KxcA7Ew@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Hey Linus,

Still pretty quiet, two weeks worth of amdgpu fixes, with one i915 and
one xe. I didn't get the drm-misc-fixes tree PR this week, but there
was only one fix queued and I think it can way another week, so seems
pretty normal.

Dave.

drm-fixes-2024-06-22:
drm fixes for 6.10-rc5

xe:
- Fix for invalid register access

i915:
- Fix conditions for joiner usage, it's not possible with eDP MSO

amdgpu:
- Fix display idle optimization race
- Fix GPUVM TLB flush locking scope
- IPS fix
- GFX 9.4.3 harvesting fix
- Runtime pm fix for shared buffers
- DCN 3.5.x fixes
- USB4 fix
- RISC-V clang fix
- Silence UBSAN warnings
- MES11 fix
- PSP 14.0.x fix
The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f=
:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-22

for you to fetch changes up to d1913b86f7351238106068785e9adc63d76d8790:

  Merge tag 'drm-xe-fixes-2024-06-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-06-21 11:59:31 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc5

xe:
- Fix for invalid register access

i915:
- Fix conditions for joiner usage, it's not possible with eDP MSO

amdgpu:
- Fix display idle optimization race
- Fix GPUVM TLB flush locking scope
- IPS fix
- GFX 9.4.3 harvesting fix
- Runtime pm fix for shared buffers
- DCN 3.5.x fixes
- USB4 fix
- RISC-V clang fix
- Silence UBSAN warnings
- MES11 fix
- PSP 14.0.x fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/radeon: fix UBSAN warning in kv_dpm.c
      drm/amdgpu: fix UBSAN warning in kv_dpm.c

Christian K=C3=B6nig (2):
      drm/amdgpu: revert "take runtime pm reference when we attach a buffer=
" v2
      drm/amdgpu: cleanup MES11 command submission

Daniel Miess (1):
      drm/amd/display: Change dram_clock_latency to 34us for dcn351

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2024-06-19' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.10-2024-06-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2024-06-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Hamza Mahfooz (1):
      drm/amd/display: prevent register access while in IPS

Harish Kasiviswanathan (1):
      drm/amdgpu: Indicate CU havest info to CP

Jani Nikula (1):
      drm/i915/mso: using joiner is not possible with eDP MSO

Likun Gao (1):
      drm/amdgpu: init TA fw for psp v14

Michael Strauss (1):
      drm/amd/display: Attempt to avoid empty TUs when endpoint is DPIA

Michal Wajdeczko (1):
      drm/xe/vf: Don't touch GuC irq registers if using memory irqs

Nathan Chancellor (1):
      drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V with clang

Paul Hsieh (1):
      drm/amd/display: change dram_clock_latency to 34us for dcn35

Roman Li (1):
      drm/amd/display: Remove redundant idle optimization check

Yunxiang Li (1):
      drm/amdgpu: fix locking scope when flushing tlb

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 34 ----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 66 ++++++++++--------=
-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          | 15 -----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 15 ++++-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 76 ++++++++++++++----=
----
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  5 ++
 drivers/gpu/drm/amd/display/Kconfig                |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 +++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |  2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 72 ++++++++++++++++++=
++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |  2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 ++
 drivers/gpu/drm/radeon/sumo_dpm.c                  |  2 +
 drivers/gpu/drm/xe/xe_guc.c                        |  4 +-
 18 files changed, 198 insertions(+), 122 deletions(-)
