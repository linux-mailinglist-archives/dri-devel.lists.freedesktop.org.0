Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D852F86DB36
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 06:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5408E10EB10;
	Fri,  1 Mar 2024 05:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFlPhdJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61610EB10
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 05:41:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so473980066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 21:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709271675; x=1709876475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DOjC4nxpEij9WxAX1kxnNARpFgG4U26yhskqesqGE6Q=;
 b=FFlPhdJAtNcYFJFL8NXry5H4U0V6Re517sBm+d2RKPZ8MVgmSLb4ZUCgjQ/ihqPinc
 Q3YvXpS8b5B1XwhLxVAqHo/ZLBLg7sZdybfJIO7yFX54Zl5Figgb+0yffu+libUrIqbB
 a0s2R36WHoheImybCqGvj+FVKAtUw4/l9ZPISSPSPSSKV58xxu7F2aSsuK7uDgcku7vM
 kcK/vmK/1lzCoNl1CS0vaKsijxkc9IB5DeLo3I0J4GFf9va7Mu+Q9mbDY1F/KfEteIVF
 U6oQezZ5VLlTeYI9yJE+eHqfdgZArG9uBhazPeGIAtaZ03U/enLMh4o+Ygi/iqbn2NnC
 UmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709271675; x=1709876475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOjC4nxpEij9WxAX1kxnNARpFgG4U26yhskqesqGE6Q=;
 b=rdBzbdc6Y0zOe0sRB6RcS25u1cXgH7OY96Rd5KUc4dBn7FtOcLzfzGTIhkooRHn1+n
 SXnp+TQl10WpFHY4K9fHxiDQ362MlNi39YQb8kkhUSX6O8ucxLo9E7Pwyrch35aZ5VzC
 CBynysjg5BJx3PJwrTyZS9TSTOpbkxz/RsELaRaF9Sc90U6K3bW2dlcQ9C+1PT4s0Gn8
 tT14aYu7u398gw18S24TriE5tTBJPDnXTRlmyrGl6mxKn9XL1mb28dmh2zkVPxxZJ4iK
 ErUfzklsp2uJq0bJLoGZhaH2MvEezl3qUgwWm2SuuWr7hn4gri7h6iuEXVlE4fo/uzv6
 j1YA==
X-Gm-Message-State: AOJu0YzswgI07I6+IykK4cjiWWBuqXwlip/2CFLfeco2uGHlWDi4OLJw
 uNXuVLVe8lMQplxzYWP3YRNtST07+ECr855sKWcEhbNwS1p1P40CnRHF8Gqsxyt2OG0SYkUjkcX
 8szs0C3E19dCGBlyhu9apT/n+VZA=
X-Google-Smtp-Source: AGHT+IG9v4HM3fFKna7+0z/CzZAAQDHmA47gTT+yDJADeC0NIo6pUe6imnkssYpQqp9TtA4uy3JLF/vZ5VgJZWOYwKE=
X-Received: by 2002:a17:906:cb90:b0:a44:cd4:95e0 with SMTP id
 mf16-20020a170906cb9000b00a440cd495e0mr795658ejb.1.1709271674998; Thu, 29 Feb
 2024 21:41:14 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 1 Mar 2024 15:41:03 +1000
Message-ID: <CAPM=9tyc=L_69XMch05z=R+Kw2BC-jRCgnYMXMRtUN+RkCW=2w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc7
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

Hi Linus,

Regular weekly fixes pull, I'll be travelling for a few days but I
don't think it should interfere with anything apart from my
responsiveness if things go wrong :-P.

Bunch of fixes, xe, amdgpu, nouveau and tegra all have a few. Then
drm/bridge including some drivers/soc fallout fixes. The biggest thing
in here is a new unit test for some buddy allocator fixes, otherwise a
misc fbcon, ttm unit test and one msm revert.

Seems to pretty normal for this stage.

Regards,
Dave.

drm-fixes-2024-03-01:
drm fixes for 6.8-rc7

buddy:
- two allocation fixes + unit test

fbcon:
- font restore syzkaller fix

ttm:
- kunit test fix

bridge:
- fix aux-hpd leaks
- fix aux-hpd registration
- fix use after free in soc/qcom
- fix boot on soc/qcom

xe:
- A couple of tracepoint updates from Priyanka and Lucas.
- Make sure BINDs are completed before accepting UNBINDs on LR vms.
- Don't arbitrarily restrict max number of batched binds.
- Add uapi for dumpable bos (agreed on IRC).
- Remove unused uapi flags and a leftover comment.
- A couple of fixes related to the execlist backend.

msm:
- DP: Revert a change which was causing a HDP regression

amdgpu:
- Fix potential buffer overflow
- Fix power min cap
- Suspend/resume fix
- SI PM fix
- eDP fix

nouveau:
- fix a misreported VRAM sizing
- fix a regression in suspend/resume due to freeing

tegra:
- host1x reset fix
- only remove existing driver if display is possible
The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b=
:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-01

for you to fetch changes up to f6ecfdad359a01c7fd8a3bcfde3ef0acdf107e6e:

  drm/nouveau: keep DMA buffers required for suspend/resume
(2024-03-01 15:27:04 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc7

buddy:
- two allocation fixes + unit test

fbcon:
- font restore syzkaller fix

ttm:
- kunit test fix

bridge:
- fix aux-hpd leaks
- fix aux-hpd registration
- fix use after free in soc/qcom
- fix boot on soc/qcom

xe:
- A couple of tracepoint updates from Priyanka and Lucas.
- Make sure BINDs are completed before accepting UNBINDs on LR vms.
- Don't arbitrarily restrict max number of batched binds.
- Add uapi for dumpable bos (agreed on IRC).
- Remove unused uapi flags and a leftover comment.
- A couple of fixes related to the execlist backend.

msm:
- DP: Revert a change which was causing a HDP regression

amdgpu:
- Fix potential buffer overflow
- Fix power min cap
- Suspend/resume fix
- SI PM fix
- eDP fix

nouveau:
- fix a misreported VRAM sizing
- fix a regression in suspend/resume due to freeing

tegra:
- host1x reset fix
- only remove existing driver if display is possible

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/pm: resolve reboot exception for si oland"

Arnd Bergmann (1):
      drm/xe/mmio: fix build warning for BAR resize on 32-bit

Christian K=C3=B6nig (1):
      drm/ttm/tests: depend on UML || COMPILE_TEST

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2024-02-29' of
https://anongit.freedesktop.org/git/drm/drm-misc into drm-fixes
      Merge tag 'drm-xe-fixes-2024-02-29' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-msm-fixes-2024-02-28' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-6.8-2024-02-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      nouveau: report byte usage in VRAM usage.

Dmitry Baryshkov (1):
      Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD
status changes"

Francois Dugast (1):
      drm/xe/uapi: Remove unused flags

Jiri Slaby (SUSE) (1):
      fbcon: always restore the old font data in fbcon_do_set_font()

Johan Hovold (3):
      drm/bridge: aux-hpd: fix OF node leaks
      drm/bridge: aux-hpd: separate allocation and registration
      soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free

Jos=C3=A9 Roberto de Souza (1):
      drm/xe/uapi: Remove DRM_XE_VM_BIND_FLAG_ASYNC comment left over

Lucas De Marchi (1):
      drm/xe: Use pointers in trace events

Ma Jun (1):
      drm/amdgpu/pm: Fix the power1_min_cap value

Maarten Lankhorst (1):
      drm/xe: Add uapi for dumpable bos

Matthew Auld (3):
      drm/buddy: fix range bias
      drm/buddy: check range allocation matches alignment
      drm/tests/drm_buddy: add alloc_range_bias test

Matthew Brost (3):
      drm/xe: Fix execlist splat
      drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
      drm/xe: Use vmalloc for array of bind allocation in bind IOCTL

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Mika Kuoppala (2):
      drm/xe: Expose user fence from xe_sync_entry
      drm/xe: Deny unbinds if uapi ufence pending

Mikko Perttunen (1):
      gpu: host1x: Skip reset assert on Tegra186

Paulo Zanoni (1):
      drm/xe: get rid of MAX_BINDS

Prike Liang (1):
      drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series

Priyanka Dandamudi (2):
      drm/xe/xe_bo_move: Enhance xe_bo_move trace
      drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace

Rob Clark (1):
      soc: qcom: pmic_glink: Fix boot when QRTR=3Dm

Ryan Lin (1):
      drm/amd/display: Add monitor patch for specific eDP

Sid Pranjale (1):
      drm/nouveau: keep DMA buffers required for suspend/resume

Srinivasan Shanmugam (1):
      drm/amd/display: Prevent potential buffer overflow in map_hw_resource=
s

Thierry Reding (1):
      drm/tegra: Remove existing framebuffer only if we support display

 drivers/gpu/drm/Kconfig                            |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  45 +++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   5 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  29 +++
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   9 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  70 +++++--
 drivers/gpu/drm/drm_buddy.c                        |  16 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   4 +-
 drivers/gpu/drm/tegra/drm.c                        |  23 ++-
 drivers/gpu/drm/tests/drm_buddy_test.c             | 218 +++++++++++++++++=
++++
 drivers/gpu/drm/xe/xe_bo.c                         |  11 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   1 +
 drivers/gpu/drm/xe/xe_drm_client.c                 |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  88 +--------
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  10 -
 drivers/gpu/drm/xe/xe_execlist.c                   |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  12 ++
 drivers/gpu/drm/xe/xe_lrc.c                        |  10 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  58 +++++-
 drivers/gpu/drm/xe/xe_sync.h                       |   4 +
 drivers/gpu/drm/xe/xe_sync_types.h                 |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                      |  59 ++++--
 drivers/gpu/drm/xe/xe_vm.c                         |  80 +++++---
 drivers/gpu/drm/xe/xe_vm_types.h                   |  11 +-
 drivers/gpu/host1x/dev.c                           |  15 +-
 drivers/gpu/host1x/dev.h                           |   6 +
 drivers/soc/qcom/pmic_glink.c                      |  21 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |  16 +-
 drivers/video/fbdev/core/fbcon.c                   |   8 +-
 include/drm/bridge/aux-bridge.h                    |  15 ++
 include/uapi/drm/xe_drm.h                          |  21 +-
 39 files changed, 659 insertions(+), 293 deletions(-)
