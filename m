Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8832DFC5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 03:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246236EAC2;
	Fri,  5 Mar 2021 02:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19B6EAC2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 02:50:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lr13so639088ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 18:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YGRfRIp1eWtsLxeR92yoH2sHmF6Y+KibUhiFCncOcNc=;
 b=Tb0/lwlNMXmR3v/fA6ngU4Ygz3suanV5D6nJTt3c03Mp5SquA2r/DxmWSJpG/VzxNS
 qbVbMLB+RahOne4qUuEFeddc+g3hTqtIq/k3bh+d3849PhQldrnpy6L8qOAwaFuqiwml
 AJqZTe6BkF0CMM6P+tbGCu+DMLJ977imGZmSU/5KrnKMFNC9wh3xCqBvWeQxLqeY4VYL
 2uxmOng5tE72mkmHPR3KAQ1JX7chi2zoILn2NkkG8iEnDUvpn0D3McgyLEKL6QLXTJlI
 Yk9WSU6hr+SM8kvDzRZVTq9TFBVikWjsFbkub07x7mW5Yw5K1rO+ex8hWxidZ4IYxsdL
 lUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YGRfRIp1eWtsLxeR92yoH2sHmF6Y+KibUhiFCncOcNc=;
 b=KFfnl2fcYR2KQUiNSqs+DeCZpaz6MI3JgJFK+YgoYYh+NOmUL2fcaBsfiVK/ZfcQvv
 uh3qhCCy+QAVsR5ALBCMJOPY7vNdUyj50YiW6/ZbkeL4xCNyxHB4fO1KvZjzj9wm5Pv2
 S9gMHewX4ez0pegUgL9MsKgb0ACEH9QeYaIuqit9IGenBccQYiLHXoqfrgKCSFxD7aDu
 Idwx47wU4PThvumsIbL8loWRlKuLikMFkCibEie56LVqM4yz5PdK6Ly+Ur8Y3YjRCqW9
 mhDbn0yhrrXkr+nzFOFA/yLsTSql8S0PSaBCJpd2KH1Y8bAN7jSqWh7grTc7BPSpH9pB
 4hIw==
X-Gm-Message-State: AOAM530mLSHZa01MqWaFKqWYAltOUDWuBXJ1NSIJ4baFJvsUJbpCkEKc
 z855wMnis95NJD2atjlAMuWVFll/gHFpTqEi7DU=
X-Google-Smtp-Source: ABdhPJzk75s7U4TzmbLok5MFqP1CB3nJjhN1aRhMIInFffmBBqCRPE0uRwEtryEVXqbwac5itP5VPkxYlVO5ixbRaMI=
X-Received: by 2002:a17:906:81c9:: with SMTP id
 e9mr434637ejx.456.1614912627932; 
 Thu, 04 Mar 2021 18:50:27 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Mar 2021 12:50:16 +1000
Message-ID: <CAPM=9txjSRSZPBttCM9xnZj5_V5oJ0jAYf2PFuZgVyHaNBMo5Q@mail.gmail.com>
Subject: [git pull] drm fixes for 5.12-rc2
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

More may show up but this is what I have at this staged. These are
based on the commit in your tree where the swapfile issue is fixed,
and neither of the merged trees are in the bad area.

Otherwise just a single nouveau regression fix, and a bunch of amdgpu fixes.

Dave.

drm-fixes-2021-03-05:
drm fixes for 5.12-rc2

amdgpu:
- S0ix fix
- Handle new NV12 SKU
- Misc power fixes
- Display uninitialized value fix
- PCIE debugfs register access fix

nouveau:
- regression fix for gk104
The following changes since commit f69d02e37a85645aa90d18cacfff36dba370f797:

  Merge tag 'misc-5.12-2021-03-02' of git://git.kernel.dk/linux-block
(2021-03-02 18:18:17 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-03-05

for you to fetch changes up to a1f1054124936c717a64e47862e3d0d820f67a87:

  Merge tag 'amd-drm-fixes-5.12-2021-03-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-03-05
11:13:22 +1000)

----------------------------------------------------------------
drm fixes for 5.12-rc2

amdgpu:
- S0ix fix
- Handle new NV12 SKU
- Misc power fixes
- Display uninitialized value fix
- PCIE debugfs register access fix

nouveau:
- regression fix for gk104

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: Only check for S0ix if AMD_PMC is configured
      drm/amdgpu/pm: make unsupported power profile messages debug
      drm/amdgpu/swsmu/vangogh: Only use RLCPowerNotify msg for disable
      drm/amdgpu: enable BACO runpm by default on sienna cichlid and
navy flounder

Asher.Song (1):
      drm/amdgpu:disable VCN for Navi12 SKU

Ben Skeggs (1):
      drm/nouveau/fifo/gk104-gp1xx: fix creation of sw class

Colin Ian King (1):
      drm/amd/display: fix the return of the uninitialized value in ret

Dave Airlie (2):
      Merge branch '00.00-inst' of git://github.com/skeggsb/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.12-2021-03-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: correct Arcturus mmTHM_BACO_CNTL register address

Kevin Wang (1):
      drm/amdgpu: fix parameter error of RREG32_PCIE() in amdgpu_regs_pcie

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c               |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c                   |  2 --
 drivers/gpu/drm/amd/amdgpu/nv.c                           |  6 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c         |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c            | 15 ++++++++++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c          |  6 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c           |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c          |  3 +++
 10 files changed, 29 insertions(+), 16 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
