Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B67D0775
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 07:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2837210E57C;
	Fri, 20 Oct 2023 05:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB310E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 05:01:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so524048a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 22:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697778096; x=1698382896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AWWQg2SqnfcJGluCbwJ/5a91X1rDHsY7zr/O6hdj2A8=;
 b=Hwd6Cna2Yg7X8BFVc/v+TF0/vmc2IcpiI3KqxO9xCWI9T5YDrpiVfjLX6G1qbIiZsH
 Y/SQP5hfF65SxBSCD9UPIyRaxPN5j3v/v6poKp6jJwEw3WQqrxIUe0bHqkrRsDNVAuI8
 mvAt5D/ztND4dE4ZEUolDKyP5NAaoaz6UahhA11i6n33sSRh55NLFOJ6YKMTvJTiVQF8
 UVW+vsbGZoR1z2D+eo6P7kbYmYUQgkrNdTsaHnmlkCuQMTE6Wq1e3rWRVpiL3v0sZAOe
 46zyrWZunTQa3ordH7t3RIwdDQsJ2260pHXINV9cYwZN91HAS1dgRbG76q0gL5mI3Hvy
 AWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697778096; x=1698382896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWWQg2SqnfcJGluCbwJ/5a91X1rDHsY7zr/O6hdj2A8=;
 b=O3cjWCLyp6AwN+APhiwykfkKEmmLmXMLbMx4JCgSTvCrN3dTnNoIu+AU3hEszLEspb
 SpDNY3aSqtfUryDbFYTKYtG0ulWNwGFM0YBmmMS2WoTPae4P2lYzmJkm7O+oc5kpqwVB
 nAGOE4odq29jHbiI+ynRL7ED3YAM+NSjLQnT1jkaYQ13IQeMowy9PJrKkHIccu2TvWUJ
 xZVkcHOxig8ZVcLYUrPIZMNKdtvQBt/DZExAOCU6wl9vefvaGgqQwMMMK1XwnRRcCZ+v
 wy0NYeJZwAU9AlF+kTd66GPC/5LFIVYSZ9IJKnWSTcTJt8wRW1Rfq9UuGMMcEq9byMAU
 ebmw==
X-Gm-Message-State: AOJu0Yy/o5PfoPjVTvWRWcofEdT6W06DLLOjUSj7nvwSrU1GSIoYUe8F
 1Mgouravx30b0ydvLNzL5i9y++1Fdq11wo20/vc=
X-Google-Smtp-Source: AGHT+IF0Q4OhtJlzRIozVY+WrK9DtGCgqdBcwfPvIfJ4wxDEUSC4J3TVA+tHVmIDHf5aeDB5Sl0/3CP6zyTAQ/PQpxk=
X-Received: by 2002:a17:907:80e:b0:9bf:b8f7:1fd3 with SMTP id
 wv14-20020a170907080e00b009bfb8f71fd3mr452341ejb.45.1697778096207; Thu, 19
 Oct 2023 22:01:36 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Oct 2023 15:01:24 +1000
Message-ID: <CAPM=9twE+5tjNxbr1FkiXBqeEzv9k4LZMo4ETmchaNioNT6quQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Regular fixes for the week, amdgpu, i915, nouveau, with some other
scattered around, nothing major.

Dave.

drm-fixes-2023-10-20:
drm fixes for 6.6-rc7

amdgpu:
- Fix possible NULL pointer dereference
- Avoid possible BUG_ON in GPUVM updates
- Disable AMD_CTX_PRIORITY_UNSET

i915:
- Fix display issue that was blocking S0ix
- Retry gtt fault when out of fence registers

bridge:
- ti-sn65dsi86: Fix device lifetime

edid:
- Add quirk for BenQ GW2765

ivpu:
- Extend address range for MMU mmap

nouveau:
- DP-connector fixes
- Documentation fixes

panel:
- Move AUX B116XW03 into panel-simple

scheduler:
- Eliminate DRM_SCHED_PRIORITY_UNSET

ttm:
- Fix possible NULL-ptr deref in cleanup

mediatek:
- Correctly free sg_table in gem prime vmap
The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb=
:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-20

for you to fetch changes up to 8b35ce3f7a9699e7580527fe4510d77f2a35f02d:

  Merge tag 'mediatek-drm-fixes-20231017' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes (2023-10-20 14:24:35 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc7

amdgpu:
- Fix possible NULL pointer dereference
- Avoid possible BUG_ON in GPUVM updates
- Disable AMD_CTX_PRIORITY_UNSET

i915:
- Fix display issue that was blocking S0ix
- Retry gtt fault when out of fence registers

bridge:
- ti-sn65dsi86: Fix device lifetime

edid:
- Add quirk for BenQ GW2765

ivpu:
- Extend address range for MMU mmap

nouveau:
- DP-connector fixes
- Documentation fixes

panel:
- Move AUX B116XW03 into panel-simple

scheduler:
- Eliminate DRM_SCHED_PRIORITY_UNSET

ttm:
- Fix possible NULL-ptr deref in cleanup

mediatek:
- Correctly free sg_table in gem prime vmap

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm/mediatek: Correctly free sg_table in gem prime vmap

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.6-2023-10-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-10-19' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-10-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'mediatek-drm-fixes-20231017' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

Douglas Anderson (1):
      drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple

Felix Kuehling (2):
      drm/amdgpu: Fix possible null pointer dereference
      drm/amdgpu: Reserve fences for VM update

Hamza Mahfooz (1):
      drm/edid: add 8 bpc quirk to the BenQ GW2765

Jacek Lawrynowicz (1):
      accel/ivpu: Don't enter d0i3 during FLR

Karol Herbst (1):
      drm/nouveau/disp: fix DP capable DSM connectors

Karolina Stolarek (1):
      drm/ttm: Reorder sys manager cleanup step

Khaled Almahallawy (1):
      drm/i915/cx0: Only clear/set the Pipe Reset bit of the PHY Lanes Owne=
d

Luben Tuikov (2):
      drm/amdgpu: Unset context priority is now invalid
      gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET

Randy Dunlap (1):
      drm/nouveau: exec: fix ioctl kernel-doc warning

Stanislaw Gruszka (1):
      Revert "accel/ivpu: Use cached buffers for FW loading"

Stephen Boyd (1):
      drm/bridge: ti-sn65dsi86: Associate DSI device lifetime with
auxiliary device

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Retry gtt fault when out of fence registers

Wludzik, Jozef (1):
      accel/ivpu: Extend address range for MMU mmap

 drivers/accel/ivpu/ivpu_drv.c                    | 11 ++++++--
 drivers/accel/ivpu/ivpu_drv.h                    |  1 +
 drivers/accel/ivpu/ivpu_fw.c                     |  9 +++---
 drivers/accel/ivpu/ivpu_gem.h                    |  5 ----
 drivers/accel/ivpu/ivpu_hw.h                     |  8 ++++++
 drivers/accel/ivpu/ivpu_hw_37xx.c                |  1 +
 drivers/accel/ivpu/ivpu_hw_40xx.c                |  1 +
 drivers/accel/ivpu/ivpu_mmu_context.c            |  9 ++----
 drivers/accel/ivpu/ivpu_pm.c                     |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          |  5 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c      |  5 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           |  3 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            | 14 +++++-----
 drivers/gpu/drm/drm_edid.c                       |  3 ++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c           |  6 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++-
 drivers/gpu/drm/panel/panel-edp.c                | 29 --------------------
 drivers/gpu/drm/panel/panel-simple.c             | 35 ++++++++++++++++++++=
++++
 drivers/gpu/drm/ttm/ttm_device.c                 |  8 +++---
 include/drm/gpu_scheduler.h                      |  3 +-
 include/uapi/drm/nouveau_drm.h                   |  4 +--
 23 files changed, 109 insertions(+), 72 deletions(-)
