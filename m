Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28FB25D005
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 05:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D3A6E21D;
	Fri,  4 Sep 2020 03:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5BC6E21D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 03:53:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id m22so6704273eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 20:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8x3NTRCTKgtCNUxj9R1GgJk1hed7ywjOyhVq4HVWWIA=;
 b=tl4b+2Rt+YMPUu4mo7RZJIIZILFp6poZAYZsnmGMtJYF9ADqleaUmMgu9wFRp8HX4v
 4BhZfYACBaGyMeHRRbA+RRxGSEUDTd4ADVysrzdX49b5RIBb+lEaYiSKcm2q4+yDpJC8
 1AJQoCJXWJ+ta43TU0+HZ4k+XaH4YVUme/9m2j50hKSSchZBcSVwoAnvxPBZ5eLkVqTO
 LsQHeFVF+X6X25PBhwt7IwbEWsjuuqRp1vD2osXB7Uhhb9azMetn6ydKPgmIK4dZZ9Vn
 H3vRTkQBBqNjpcPSKfxBoZ9HZ1uysn8WB9nEm4k1IA8U0pYTlp29SRJo3gpV8YL13aBm
 y3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8x3NTRCTKgtCNUxj9R1GgJk1hed7ywjOyhVq4HVWWIA=;
 b=S/7XpFfp6iqLpSZd+ZcmYRHbLB/FiECfQ+cYWJdVwIwNS7Qr415aiu7FYQFSvmCVoE
 3qMxMRp9DR9YKkhfNHGDEAgex4vhPDsMw0iK/VrEsoiIvZ5cjRf1o1ZGDWN/ZKGWx3q3
 HKXU4uDzaLHfn+mKDpGI2K/2QgckqM8Vyjce5BxapPR4Uf8E/T3bJNvbLr4w6r8E6xSD
 t3QHGzFguo3n9nKRcsLrQhePl1lVycSwZ/Y/hixsVYaUu46qYN+EqabTBfsqX4G7xnMc
 QXlqmJuM6N5TB8gpLM7Dz+9phPfwTgBwfbNDk3UGMaJt8M91Eu5m3qgfIVfUKhvq2VTd
 7ewA==
X-Gm-Message-State: AOAM532Qr1dfD+PPXAGLeCGaay+TDHMDM37EcVkW1ToTxBV/SxnAbFhB
 zZnrJ/CnZ9pXL0TV0pfelxdHA7cC4EktbRCKgUI=
X-Google-Smtp-Source: ABdhPJw5WqGeSuLUM7iMduAWAG1PRIDEdlc6m2nlWiUW3tBxr0BW7oSQOFX30FfcGZrrUOOB18ivC8m6kL7iSZ5gHoE=
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr5238195ejb.340.1599191587006; 
 Thu, 03 Sep 2020 20:53:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Sep 2020 13:52:56 +1000
Message-ID: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Not much going on this week, nouveau has a display hw bug workaround,
amdgpu has some PM fixes and CIK regression fixes, one single radeon
PLL fix, and a couple of i915 display fixes.

Dave.

drm-fixes-2020-09-04:
drm fixes for 5.9-rc4

amdgpu:
- Fix for 32bit systems
- SW CTF fix
- Update for Sienna Cichlid
- CIK bug fixes

radeon:
- PLL fix

i915:
- Clang build warning fix
- HDCP fixes

nouveau:
- display fixes
The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-04

for you to fetch changes up to d37d56920004cae612fa32d1f92aaacca5e145f7:

  Merge branch 'linux-5.9' of git://github.com/skeggsb/linux into
drm-fixes (2020-09-04 11:14:49 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc4

amdgpu:
- Fix for 32bit systems
- SW CTF fix
- Update for Sienna Cichlid
- CIK bug fixes

radeon:
- PLL fix

i915:
- Clang build warning fix
- HDCP fixes

nouveau:
- display fixes

----------------------------------------------------------------
Ben Skeggs (3):
      drm/nouveau/kms/nv50-: add some whitespace before debug message
      drm/nouveau/kms/nv50-gp1xx: disable notifies again after core update
      drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.9-2020-09-03' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-09-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge branch 'linux-5.9' of git://github.com/skeggsb/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: avoid false alarm due to confusing
softwareshutdowntemp setting

Jiansong Chen (1):
      drm/amd/pm: enable MP0 DPM for sienna_cichlid

Kai-Heng Feng (1):
      drm/radeon: Prefer lower feedback dividers

Kevin Wang (1):
      drm/amd/pm: fix is_dpm_running() run error on 32bit system

Lyude Paul (1):
      drm/nouveau/kms/gv100-: Include correct push header in crcc37d.c

Nathan Chancellor (1):
      drm/i915/display: Ensure that ret is always initialized in
icl_combo_phy_verify_state

Sandeep Raghuraman (2):
      drm/amdgpu: Specify get_argument function for ci_smu_funcs
      drm/amdgpu: Fix bug in reporting voltage for CIK

Sean Paul (2):
      drm/i915: Fix sha_text population code
      drm/i915: Clear the repeater bit on HDCP disable

 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       | 10 +++++--
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   |  3 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c   | 14 ++++++++--
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         | 10 +++++--
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 14 +++++++---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c   |  2 ++
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  4 +--
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 32 ++++++++++++++++++----
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |  5 +++-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c         |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  6 ++++
 drivers/gpu/drm/nouveau/include/nvif/push507c.h    |  2 +-
 drivers/gpu/drm/radeon/radeon_display.c            |  2 +-
 include/drm/drm_hdcp.h                             |  3 ++
 14 files changed, 84 insertions(+), 25 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
