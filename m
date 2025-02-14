Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA9A35555
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 04:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60CA10E1FD;
	Fri, 14 Feb 2025 03:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCtcvDlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF59610E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:34:17 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7c501bbecso234764266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 19:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739504056; x=1740108856; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ef52lVD5tbaEZhkFJicIhClRxVWfvA0fP+kz/Eg8/ZY=;
 b=lCtcvDlI6pC6JCEvkzSlocohK29kT6NbV3ZrOJxWF0WmwQoYgdp598itqMCpr55kmY
 DpefEKzcyWzFeWuF3tOEcp9nrKcQK4VHfvJxpjQ4Ot6qBpKpCj4ar9wCQ7JSLHEBErGy
 3046U87tb+vuwzh4wpFUI9BWn85g9HemfTVB0DSBzCWhfliXrNk70WDXWQlqY/F2eaNI
 8+Xo8ZKGQxrv0jjEk95u5vwoRDUYLLykHa4w6a3ehD18hOvEhtRWPdP2oYlm2FOyFRQG
 0OlHNIz6VwttG5j2c5ywADNPdQ/+htcvE8YzEWewi3Fd0EAXj3bB6GN6msfagZL974XK
 yivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739504056; x=1740108856;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ef52lVD5tbaEZhkFJicIhClRxVWfvA0fP+kz/Eg8/ZY=;
 b=hsb2XmB8eF/4mjS3uck1Xnb7nCbuEx0SaCLo0EMnY+Yq83eMC4lOxr39gPap7vPjz5
 BK3Tjb+Ug1vkk9cEqy5SSKnY4EM7f2IE4hyla/qGmL7Zoe0auVbQ+pOp1O3xq/atdRVO
 vVAbl/F1cCiRhbpTOLBOFdTEklaxOzb/UOn6X+NGeI3nwbOeOWLceB8QryPYeGqqnvPV
 p0oQPZ+7+oycQxSVzevGqe9SLvYyIi9BWL1L0r+bp0sXS2efri0aI99Id6MDEO8n6Ogs
 IberMmkFwHe9ayOM+o9jWe2QW0lRQ3BWPT244pyqfp+A7vqUOFu25SEWwNj+RZsUk5Vs
 wgqA==
X-Gm-Message-State: AOJu0YxXBzpx7lKNKjjAMSTgsAdsIn0GXnzt6+g0ciPlkx1BArFBsixm
 zQCTHcBvUUhzGUHrsRShrrGUXlUDXBObiB2thg4k3Vb0pgXyRYd+ZTssgNumU/vn5KInT3Y8DGk
 U9CdHx5oBJQLbyvW5MSz8l8ubzx0=
X-Gm-Gg: ASbGncs8rioPsi6J8Bg9xsCbwR4bb+IRZ5e5+s0JhF7ilJsB6tEESN5ZC67auTxpDE/
 TGZPFR5eA0oxP6gkbayTnvTPtXMmLCn0N/gWnQQQuYj8EpE+PGxDM3uvRiEIWa6jtYVNXwuM=
X-Google-Smtp-Source: AGHT+IFlURw+eXoPbSOgy1n/F/niJ/VuJ7bAChakLddym2av0Es1RzARThj+8CTS1YydSLt34l2lerM4R2qZjwFFKdQ=
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id
 a640c23a62f3a-ab7f3473720mr1011985966b.42.1739504055920; Thu, 13 Feb 2025
 19:34:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 14 Feb 2025 13:34:04 +1000
X-Gm-Features: AWEUYZl_qKYZfWnQCqMRQwD-8nIedPayc98_RI7-SUbGemV0yuUiFb-cZEKyM2Y
Message-ID: <CAPM=9txeA4G80xej2orc-_y1=cEBaxY2Hw-48v0sw485UjuWyQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

Weekly drm fixes pull request, nothing too unusual, the hdmi tests
needs a bit of refactoring after lockdep shouted at them, otherwise
amdgpu and xe lead and a few misc otherwise.

Thanks,
Dave.

drm-fixes-2025-02-14:
drm fixes for 6.14-rc3

amdgpu:
- Fix shutdown regression on old APUs
- Fix compute queue hang on gfx9 APUs
- Fix possible invalid access in PSP failure path
- Avoid possible buffer overflow in pptable override

amdkfd:
- Properly free gang bo in failure path
- GFX12 trap handler fix

i915:
- selftest fix: avoid using uninitialized context

xe:
- Remove bo->clients out of bos_lock area
- Carve out wopcm portion from the stolen memory

tests:
- fix lockdep with hdmi infrastructure tests

host1x:
- fix uninitialised mutex usage

panthor:
- fix uninit variable

hibmc:
- fix missing Kconfig select
The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-14

for you to fetch changes up to 04485cc34868892a823b909c6d5468ba21b63569:

  Merge tag 'drm-xe-fixes-2025-02-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-02-14 12:15:59 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc3

amdgpu:
- Fix shutdown regression on old APUs
- Fix compute queue hang on gfx9 APUs
- Fix possible invalid access in PSP failure path
- Avoid possible buffer overflow in pptable override

amdkfd:
- Properly free gang bo in failure path
- GFX12 trap handler fix

i915:
- selftest fix: avoid using uninitialized context

xe:
- Remove bo->clients out of bos_lock area
- Carve out wopcm portion from the stolen memory

tests:
- fix lockdep with hdmi infrastructure tests

host1x:
- fix uninitialised mutex usage

panthor:
- fix uninit variable

hibmc:
- fix missing Kconfig select

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/pm: fix UVD handing in amdgpu_dpm_set_powergating_by_smu()
      drm/amdgpu/gfx9: manually control gfxoff for CS on RV
      drm/amdgpu: bump version for RV/PCO compute fix

Arnd Bergmann (1):
      drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-02-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.14-2025-02-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-02-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-02-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Imre Deak (1):
      drm: Fix DSC BPP increment decoding

Jiang Liu (2):
      drm/amdgpu: bail out when failed to load fw in psp_init_cap_microcode()
      drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table()

Krzysztof Karas (1):
      drm/i915/selftests: avoid using uninitialized context

Lancelot SIX (1):
      drm/amdkfd: Ensure consistent barrier state saved in gfx12 trap handler

Maxime Ripard (4):
      drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
      drm/tests: hdmi: Remove redundant assignments
      drm/tests: hdmi: Reorder DRM entities variables assignment
      drm/tests: hdmi: Fix recursive locking

Nirmoy Das (1):
      drm/xe: Carve out wopcm portion from the stolen memory

Rupinderjit Singh (1):
      gpu: host1x: Fix a use of uninitialized mutex

Su Hui (1):
      drm/panthor: avoid garbage value in panthor_ioctl_dev_query()

Tejas Upadhyay (1):
      drm/xe/client: bo->client does not need bos_lock

Zhu Lingshan (1):
      amdkfd: properly free gang_ctx_bo when failed to init user queue

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  36 +++-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   3 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |   4 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   4 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
 drivers/gpu/drm/xe/xe_drm_client.c                 |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |  70 ++++----
 drivers/gpu/host1x/dev.c                           |   2 +
 drivers/gpu/host1x/intr.c                          |   2 -
 include/drm/display/drm_dp.h                       |   1 +
 18 files changed, 200 insertions(+), 144 deletions(-)
