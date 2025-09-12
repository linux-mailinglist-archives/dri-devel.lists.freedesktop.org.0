Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27353B541AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 06:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98CA10E088;
	Fri, 12 Sep 2025 04:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NRjZe6bX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A810E088
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:25:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-625e1dfc43dso2469058a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757651104; x=1758255904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTpfDhKZKGj4qUCT1cR1rKoQBELJN9ms9wYW6BhTZYw=;
 b=NRjZe6bXyyzPPj+hvpn+AvRpFIDDhFhD700IUVtJkYIfcTBiIr+/nD8X4Ifwq9jod5
 SHkVuM+hFts/bWYO0YxbPLywySyLttKaE9SfJH4s+iLsCJ7uKbpdl+8HJ9DM5qhkLc5R
 EpQcgi2S4XOpZDrP5aD6IlyHHgayFlRZeBqJljTbhPh6fY3xizzy1sTNR2bqKn2SgCMu
 vP9iTGUtvWJ/axaAg0nEwpkybBioEr8HMPEnPIKHJljMd8ThARtLa6hSs6G9GEF1ocnk
 A0q0pk1PJUfakNrAjtomgi3Ey7Z367mMGeY0owOECzxzlBj6Ov5VLFPLxxMaMntoQoqC
 ZQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757651104; x=1758255904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTpfDhKZKGj4qUCT1cR1rKoQBELJN9ms9wYW6BhTZYw=;
 b=R4nOAnioJsZuidpwAyKQ+Ty/KK+9QP4hJk91fQEltE4PHLnotY6YGvvrQ3X+A/Gclq
 05nBczVSz6ber+mf/I899iNySYjQYroIBvgjhd65uEY1sgKExJUvoUP9LEh65FqjKIit
 dBvjdgA7yhyROeHhPp8Cviy7D7nwB1yjoD5JeQV/RwF+5C5X9PcQV5xTaKgW2OtQziWv
 iKzdIEcUWCppBgfoK+IgiN6fCdTtRAMuQOLaACQsMzeDeLuSjSFqJ0LY8AxIkYSKnk41
 KdXoLzOlkRrlCKFDiqxztc/d3Kbqm5adWbS/j8De71ipGmhp0XVSX5kzHc1eGELrjbMa
 1aJg==
X-Gm-Message-State: AOJu0YyKzQFsz2VTCf8iz66+aCpZnteItQyV806bkuhKd896btj+Vj1R
 985kBN+zfNrV/m/4fNzqyS3RbPcQbA+PX137a8MIyaPRaiufKettYukWIBFgRQ7lxK55jJhezFu
 pfKgZhUhBqEprKMGZhj32RHndnDirCK8=
X-Gm-Gg: ASbGnct/+ha7hq7ghxgxl7jDPSnrmyYRmlGoPQzWa1Y6WXYlYwhUEur3QybJb9jbgwK
 cHs4kSCNZiWZiBJ3IDdsf4ZbmJKnEHmJwrrjaeb3OY9Sb+czT72pQgpFGTKprqjiEbxLCmVG5h/
 cKgXAB7+hwnCFCCHpEUb7NyhrrbZXTnTp3pwXxO9KTtjN7I63g1/p0eLmJTbgORGvrwCgoXeZsN
 0CL/sXWcmJXQEUI
X-Google-Smtp-Source: AGHT+IEXSRmeO+SUrxw7GBflD78Eg9mdvfufxQ0v5uU+9KneT3xXzPsYzNp4K9z7+TbLn+gMKd+63JZZo3o6I4PAFY8=
X-Received: by 2002:a17:907:d28:b0:afe:93e2:3984 with SMTP id
 a640c23a62f3a-b07c354e9a9mr140643366b.8.1757651103880; Thu, 11 Sep 2025
 21:25:03 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Sep 2025 14:24:52 +1000
X-Gm-Features: AS18NWBUzsEWSObkvBAOENiHkso8qf9n9rBTgoeb2zFWGbzoXcbQBC4RuM1QR04
Message-ID: <CAPM=9tw1QOZSBq+QhAbpyc9UvY7KYTfA+K=JQyo+_u+nBcTdGw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc6
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

Weekly pull fixes for drm, mostly amdgpu and xe, with a revert for
nouveau and some maintainers updates, and misc bits, doesn't seem too
out of the normal.

Regards,
Dave.

drm-fixes-2025-09-12:
drm fixes for 6.17-rc6

MAINTAINERS:
- add rust tree to MAINTAINERS
- fix X entries for nova/nouveau

nova:
- depend on 64-bit

i915:
- Fix size for for_each_set_bit() in abox iteration

xe:
- Don't touch survivability_mode on fini
- Fixes around eviction and suspend
- Extend Wa_13011645652 to PTL-H, WCL

amdgpu:
- PSP 11.x fix
- DPCD quirk handing fix
- DCN 3.5 PG fix
- Audio suspend fix
- OEM i2c clean up fix
- Module unload memory leak fix
- DC delay fix
- ISP firmware fix
- VCN fixes

amdkfd:
- P2P topology fix
- APU mem limit calculation fix

mediatek:
- fix potential OF node use-after-free

panthor:
- out-of-bounds check

nouveau:
- revert waitqueue removal for sched teardown
The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c=
:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-12

for you to fetch changes up to 9a3f210737e958c3f45a4ce0d7f1ff330af3965f:

  Merge tag 'drm-xe-fixes-2025-09-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-09-12 09:44:07 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc6

MAINTAINERS:
- add rust tree to MAINTAINERS
- fix X entries for nova/nouveau

nova:
- depend on 64-bit

i915:
- Fix size for for_each_set_bit() in abox iteration

xe:
- Don't touch survivability_mode on fini
- Fixes around eviction and suspend
- Extend Wa_13011645652 to PTL-H, WCL

amdgpu:
- PSP 11.x fix
- DPCD quirk handing fix
- DCN 3.5 PG fix
- Audio suspend fix
- OEM i2c clean up fix
- Module unload memory leak fix
- DC delay fix
- ISP firmware fix
- VCN fixes

amdkfd:
- P2P topology fix
- APU mem limit calculation fix

mediatek:
- fix potential OF node use-after-free

panthor:
- out-of-bounds check

nouveau:
- revert waitqueue removal for sched teardown

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix a memory leak in fence cleanup when unloading
      drm/amd/display: use udelay rather than fsleep

Chia-I Wu (1):
      drm/panthor: validate group queue count

Danilo Krummrich (3):
      gpu: nova-core: depend on CONFIG_64BIT
      MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructur=
e
      MAINTAINERS: drm-misc: fix X: entries for nova/nouveau

Dave Airlie (6):
      Merge tag 'drm-rust-fixes-2025-09-05' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-09-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.17-2025-09-10' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-20250910' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-misc-fixes-2025-09-11' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-09-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David Rosca (2):
      drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
      drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time

Eric Huang (1):
      drm/amdkfd: fix p2p links bug in topology

Fangzhi Zuo (1):
      drm/amd/display: Disable DPCD Probe Quirk

Geoffrey McRae (1):
      drm/amd/display: remove oem i2c adapter on finish

Jani Nikula (1):
      drm/i915/power: fix size for for_each_set_bit() in abox iteration

Johan Hovold (2):
      drm/mediatek: fix potential OF node use-after-free
      drm/mediatek: clean up driver data initialisation

Julia Filipchuk (1):
      drm/xe: Extend Wa_13011645652 to PTL-H, WCL

Lijo Lazar (1):
      drm/amdgpu: Wait for bootloader after PSPv11 reset

Mario Limonciello (AMD) (1):
      drm/amd/display: Drop dm_prepare_suspend() and dm_complete()

Michal Wajdeczko (1):
      drm/xe/configfs: Don't touch survivability_mode on fini

Ovidiu Bunea (1):
      drm/amd/display: Correct sequences and delays for DCN35 PG & RCG

Philipp Stanner (1):
      Revert "drm/nouveau: Remove waitque for sched teardown"

Pratap Nirujogi (1):
      drm/amd/amdgpu: Declare isp firmware binary file

Thomas Hellstr=C3=B6m (3):
      drm/xe: Attempt to bring bos back to VRAM after eviction
      drm/xe: Allow the pm notifier to continue on failure
      drm/xe: Block exec and rebind worker while evicting for suspend
/ hibernate

Yifan Zhang (1):
      amd/amdkfd: correct mem limit calculation for small APUs

 MAINTAINERS                                        |  13 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  44 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  19 +---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  12 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  60 +++++------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  34 +++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  74 ++++++-------
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 115 ++++-------------=
----
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   3 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   3 -
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   1 +
 .../drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c    |  78 +++++++++-----
 drivers/gpu/drm/i915/display/intel_display_power.c |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  23 ++---
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  15 ---
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   1 -
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  35 +++----
 drivers/gpu/drm/nouveau/nouveau_sched.h            |   9 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   8 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |  10 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  16 ++-
 drivers/gpu/drm/xe/xe_bo.h                         |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   6 ++
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   2 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   9 ++
 drivers/gpu/drm/xe/xe_pm.c                         |  42 ++++++--
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   3 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  42 +++++++-
 drivers/gpu/drm/xe/xe_vm.h                         |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h                   |   5 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   3 +-
 drivers/gpu/nova-core/Kconfig                      |   1 +
 40 files changed, 364 insertions(+), 347 deletions(-)
