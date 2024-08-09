Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CB94D7C8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 22:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31D310E9FA;
	Fri,  9 Aug 2024 20:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zm05+15Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483F510E9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 20:00:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso3299642a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723233620; x=1723838420; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q/ZW3nV5tNcjPS6iptoriBrB0i5jeyrg1616ntHGkoU=;
 b=Zm05+15QEBUC9niUIeZoTY2vcpPyC5KR4sksxmneJZ0RdtimFEYQr+BplO1stxpTdt
 /v9VG3oMJ9TKCz9yEXYYkiyGpXHjDDzAwoXYPLvtKh/TbxMwJDm/uWwvXGpq9gwk0y8Z
 ejDoYzA8eGIL6NtZOJDyxXFKZ1IXh0kB4eC94KCuamTeT3kJczioq5kh3Xj+HDuommhP
 U0YpXsSp4VbC6NOkSBzoZFHh9gscqXeGnjSoWx0svC3dOMr+sUnnqCywJ5K4u4gzJffd
 Ix+DdD9b2pwB9jUcNNKlvZjxn6A+QV8PFzQJmWwBvHIflfw1BXz0vfOhkmV0EdXJHURH
 w4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723233620; x=1723838420;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/ZW3nV5tNcjPS6iptoriBrB0i5jeyrg1616ntHGkoU=;
 b=GEiqUMSMXwsQkW2GtoNX6lsyhZx/6bwIm0bQQ1u1mqIiFYtSMtL3nDcdxyTPfhNFWN
 s3/myf7BzkZL+V1irWWzHQK+CJ1RgtlBizUicGWC8jeKhzyfh382fnMMZ4GvR4spSBSH
 tXNzgqKR8AP6DcMc8GHCgWTQ8yjrq7XDhw/1gSmVZjrf7+IU/OcA3lGY/GGBfSDjJKoR
 jnYYzEg/Kqd1XstSbIO9FZppvwCutipMTNIEJ5r1kz1L8EpqLiu3oMraIv37sim/E6x+
 T4YPl5TXNaB5TzpxwalfdOffFyw3AxMUSAtM11AhTUKwGzfKKonRseFNOaen0K8cRNu0
 Aoqg==
X-Gm-Message-State: AOJu0YzibK/44s2xr3gOzChsc3AdI7KQUpTHHTaPU0O2ocrEn2by6TIJ
 oeSAMNqdjG0ssPEP7HVrWQuuv/PrLyBqVyk8XQhg7FXLTSPOrVusUZPwQ1yz813vSWG+vV3PmTr
 9ue9qqnDNNI23G6XRb2ueiDiKWDA=
X-Google-Smtp-Source: AGHT+IER4wDD4pBbs3PQSGPA4ATqufxR+7PRC0XRU0hX1k+RT9NExlXC/+x7kc54KGWyv5Nh9Qjh9AVvd9sF6bJTD3U=
X-Received: by 2002:a17:907:7da3:b0:a7a:a0c9:124e with SMTP id
 a640c23a62f3a-a80aa53909emr188358066b.4.1723233620228; Fri, 09 Aug 2024
 13:00:20 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Aug 2024 06:00:08 +1000
Message-ID: <CAPM=9txFVKQ-E5rPvgUJSo_ypt4uWW4dCyozsb_A5HD8Ldc5zQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Weekly regular fixes, mostly amdgpu with i915/xe having a few each,
and then some misc bits across the board, seems about right for rc3
time.

Regards,
Dave.

drm-fixes-2024-08-10:
drm fixes for 6.11-rc3

client:
- fix null ptr deref

bridge:
- connector: fix double free

atomic:
- fix async flip update

panel:
- document panel

omap:
- add config dependency

tests:
- fix gem shmem test

drm buddy:
- Add start address to trim function

amdgpu:
- DMCUB fix
- Fix DET programming on some DCNs
- DCC fixes
- DCN 4.0.1 fixes
- SMU 14.0.x update
- MMHUB fix
- DCN 3.1.4 fix
- GC 12.0 fixes
- Fix soft recovery error propogation
- SDMA 7.0 fixes
- DSC fix

xe:
- Fix off-by-one when processing RTP rules
- Use dma_fence_chain_free in chain fence unused as a sync
- Fix PL1 disable flow in xe_hwmon_power_max_write
- Take ref to VM in delayed dump snapshot

i915:
- correct dual pps handling for MTL_PCH+ [display]
- Adjust vma offset for framebuffer mmap offset [gem]
- Fix Virtual Memory mapping boundaries calculation [gem]
- Allow evicting to use the requested placement
- Attempt to get pages without eviction first
The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-10

for you to fetch changes up to 06f5b920d1d0b686d794426264dc39aa8582db14:

  Merge tag 'drm-intel-fixes-2024-08-08' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
(2024-08-09 17:16:29 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc3

client:
- fix null ptr deref

bridge:
- connector: fix double free

atomic:
- fix async flip update

panel:
- document panel

omap:
- add config dependency

tests:
- fix gem shmem test

drm buddy:
- Add start address to trim function

amdgpu:
- DMCUB fix
- Fix DET programming on some DCNs
- DCC fixes
- DCN 4.0.1 fixes
- SMU 14.0.x update
- MMHUB fix
- DCN 3.1.4 fix
- GC 12.0 fixes
- Fix soft recovery error propogation
- SDMA 7.0 fixes
- DSC fix

xe:
- Fix off-by-one when processing RTP rules
- Use dma_fence_chain_free in chain fence unused as a sync
- Fix PL1 disable flow in xe_hwmon_power_max_write
- Take ref to VM in delayed dump snapshot

i915:
- correct dual pps handling for MTL_PCH+ [display]
- Adjust vma offset for framebuffer mmap offset [gem]
- Fix Virtual Memory mapping boundaries calculation [gem]
- Allow evicting to use the requested placement
- Attempt to get pages without eviction first

----------------------------------------------------------------
Andi Shyti (2):
      drm/i915/gem: Adjust vma offset for framebuffer mmap offset
      drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

Arnd Bergmann (1):
      drm/omap: add CONFIG_MMU dependency

Arunpravin Paneer Selvam (3):
      drm/buddy: Add start address support to trim function
      drm/amdgpu: Add address alignment support to DCC buffers
      drm/amdgpu: Add DCC GFX12 flag to enable address alignment

Cristian Ciocaltea (1):
      drm/bridge-connector: Fix double free in error handling paths

Dave Airlie (5):
      drm/test: fix the gem shmem test to map the sg table.
      Merge tag 'drm-misc-fixes-2024-08-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.11-2024-08-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2024-08-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-08-08' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

David Gow (2):
      drm/i915: Allow evicting to use the requested placement
      drm/i915: Attempt to get pages without eviction first

Dnyaneshwar Bhadane (1):
      drm/i915/display: correct dual pps handling for MTL_PCH+

Fangzhi Zuo (1):
      drm/amd/display: Skip Recompute DSC Params if no Stream on Link

Frank Min (2):
      drm/amdgpu: change non-dcc buffer copy configuration
      drm/amdgpu: correct sdma7 max dw

Joshua Ashton (1):
      drm/amdgpu: Forward soft recovery errors to userspace

Karthik Poosa (1):
      drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write

Kenneth Feng (1):
      drm/amd/pm: update powerplay structure on smu v14.0.2/3

Likun Gao (2):
      drm/amdgpu: force to use legacy inv in mmhub
      drm/amdgpu: add golden setting for gc v12

Lucas De Marchi (1):
      drm/xe/rtp: Fix off-by-one when processing rules

Ma Ke (1):
      drm/client: fix null pointer dereference in drm_client_modeset_probe

Matthew Brost (2):
      drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
      drm/xe: Take ref to VM in delayed snapshot

Rob Clark (1):
      dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02

Rodrigo Siqueira (6):
      drm/amd/display: Replace dm_execute_dmub_cmd with
dc_wake_and_execute_dmub_cmd
      drm/amd/display: Add missing DET segments programming
      drm/amd/display: Add dcc propagation value
      drm/amd/display: Add missing mcache registers
      drm/amd/display: Add missing DCN314 to the DML Makefile
      drm/amd/display: Add missing program DET segment call to pipe init

Simon Ser (1):
      drm/atomic: allow no-op FB_ID updates for async flips

 .../bindings/display/panel/samsung,atna33xc20.yaml |  9 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 36 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 27 +++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             | 18 +++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  7 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  3 ++
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  2 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |  1 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |  4 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h | 52 +++++++++++++++++---
 drivers/gpu/drm/drm_atomic_uapi.c                  | 15 ++----
 drivers/gpu/drm/drm_bridge_connector.c             |  8 +---
 drivers/gpu/drm/drm_buddy.c                        | 25 +++++++++-
 drivers/gpu/drm/drm_client_modeset.c               |  5 ++
 drivers/gpu/drm/i915/display/intel_backlight.c     |  3 ++
 drivers/gpu/drm/i915/display/intel_pps.c           |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           | 55 +++++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 13 ++---
 drivers/gpu/drm/omapdrm/Kconfig                    |  1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         | 11 +++++
 drivers/gpu/drm/xe/xe_hwmon.c                      |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                        | 15 +++++-
 drivers/gpu/drm/xe/xe_rtp.c                        |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |  2 +-
 include/drm/drm_buddy.h                            |  2 +
 32 files changed, 287 insertions(+), 56 deletions(-)
