Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C52AEC1B4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 23:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345EF10E0B1;
	Fri, 27 Jun 2025 21:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fY8s8ecs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6154710E0B1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 21:06:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so16367266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751058369; x=1751663169; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eSYaoh4Yj9Zkb3jRb/C3UshHoF2mGwDZUBrBeoxNDNU=;
 b=fY8s8ecsO3XhEHGL18h/2fXFtUqkJ5miyn3ADnt/kH2F8UlT5wMDV9oGOvWHqmgTZK
 tYfmp/JSuadxmVK+wOjNvTzA6q68MBxThjl4dxpiKN1CDKDxvbjMya7sQGuJHsXHCWWG
 uPrDc/UmzSTMYNhKry5dXBk1zhcsyHYhK58ML0clC2U+mxe9+gRh/73J9C9u0q0tDAQU
 YmDBauHCSvQp3j/OEwZebcfSFJhPDDjzuvgUwrY0eEXGwAujDLgLgeSne1whCS+gcmey
 f67n9YMU67+eSSFGRpt+XsQaypl7uOKdCapU9e9lVkMqQCq61E2mpSWXvF2v13+bw78J
 1iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751058369; x=1751663169;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSYaoh4Yj9Zkb3jRb/C3UshHoF2mGwDZUBrBeoxNDNU=;
 b=mHsF5AYrbaXj4gkFLyj3xXF4fnfBWq+X1tXhJTgKFxfX2DkG6jpun5F43LD4hTYwMa
 F5hZ2LzpyGudCmUBETa3zC0m80u3sWUpWpEjBjy25zsUL7yvZtQ+FpG7pvs47nBL0fkP
 Pxm6hc0SDYOEJBZv6e+9SOhEpCpf4eQ2yJ5Qxy95AwIvuTM/6g3c9X0NiQvX9LcFrzna
 R4yt++GodDRZeKaHzHr2zAocEsruZnae176NF7gXwBljiWT/5c3HV45zqEttdXgM45/e
 +2Gr+RlSShQn8OIvq4p4kPEZ8kXLnr9qPqND3pcqY4yp9QbwdqlIExUTvdQqNfO9CJNk
 QWgw==
X-Gm-Message-State: AOJu0YxlIDm59D4X1YE3N+OeprQY2FHfPhQFAgurwXGvp2jKfAZWyg1g
 8Jrbnqhv1YMI7L5Hf0UO0JAmRY0x/c3nz6Jx0Dua1RApix6Wjl9lcI0lXDG+0463M/yzgT74VGk
 0O4P2r55TtqZaQ68UNi78MTGKrOlIncbcOHVeH58=
X-Gm-Gg: ASbGncvYvq0D4Z9vQBEMCKVzxeuRIh5vnba7zS0Np8JwM+LrAb/WXbC8UPgrts11Ddp
 WCnuukrdWFI2zA7Ka/QqRipDSoR2Ik9j1NHGtiSZllW1z1dFpwb+19thegN8AGJcH5Eam221XGQ
 SjawNkayuIm0HR6sncNSttLMnYRutkAUMm/8GB3xdQhFPUcMNS8o0Y
X-Google-Smtp-Source: AGHT+IGZUTI57KVsgYCiHEJrvVeih/CZV0VDCz3mpT5lhxBjBjnrXq8uakq9lpRyXmdoT6S7lzgYSnGN4HYTC+LSuDA=
X-Received: by 2002:a17:906:7308:b0:ae0:ad5c:418b with SMTP id
 a640c23a62f3a-ae3500ff37cmr431380066b.45.1751058368343; Fri, 27 Jun 2025
 14:06:08 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 28 Jun 2025 07:05:56 +1000
X-Gm-Features: Ac12FXxKVxFQX5SfCokGjJXthgR-g7tweuzjxWnSMqqMKCFfZTX517Ve6UycV34
Message-ID: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc4
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

Regular weekly drm updates, nothing out of the ordinary, amdgpu, xe,
i915 and a few misc bits. Seems about right for this time in the
release cycle.

Dave.

drm-fixes-2025-06-28:
drm fixes for 6.16-rc4

core:
- fix drm_writeback_connector_cleanup function signature
- use correct HDMI audio bridge in drm_connector_hdmi_audio_init

bridge:
- SN65DSI86: fix HPD

amdgpu:
- Cleaner shader support for additional GFX9 GPUs
- MES firmware compatibility fixes
- Discovery error reporting fixes
- SDMA6/7 userq fixes
- Backlight fix
- EDID sanity check

i915:
- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

xe:
- Missing error check
- Fix xe_hwmon_power_max_write
- Move flushes
- Explicitly exit CT safe mode on unwind
- Process deferred GGTT node removals on device unwind
The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-28

for you to fetch changes up to 9fbceb37c95939182e1409211447a1d3f3db9274:

  Merge tag 'drm-misc-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-06-28 06:53:00 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc4

core:
- fix drm_writeback_connector_cleanup function signature
- use correct HDMI audio bridge in drm_connector_hdmi_audio_init

bridge:
- SN65DSI86: fix HPD

amdgpu:
- Cleaner shader support for additional GFX9 GPUs
- MES firmware compatibility fixes
- Discovery error reporting fixes
- SDMA6/7 userq fixes
- Backlight fix
- EDID sanity check

i915:
- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

xe:
- Missing error check
- Fix xe_hwmon_power_max_write
- Move flushes
- Explicitly exit CT safe mode on unwind
- Process deferred GGTT node removals on device unwind

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support

Ankit Nautiyal (1):
      drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_u64

Arnd Bergmann (1):
      drm/i915: fix build error some more

Chaoyi Chen (1):
      drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.16-2025-25-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Haoxiang Li (1):
      drm/xe/display: Add check for alloc_ordered_workqueue()

Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS

Jayesh Choudhary (1):
      drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type

Karthik Poosa (1):
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Louis Chauvet (1):
      drm: writeback: Fix drm_writeback_connector_cleanup signature

Maarten Lankhorst (1):
      drm/xe: Move DSB l2 flush to a more sensible place

Mario Limonciello (2):
      drm/amd: Adjust output for discovery error handling
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value

Matthew Auld (1):
      drm/xe: move DPT l2 flush to a more sensible place

Michal Wajdeczko (2):
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe: Process deferred GGTT node removals on device unwind

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Takashi Iwai (1):
      drm/amd/display: Add sanity checks for drm_edid_raw()

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 28 ++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 19 ++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 10 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             | 19 +++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             | 12 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  4 ++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 69 +++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  7 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            |  2 +-
 drivers/gpu/drm/drm_writeback.c                    |  7 ++-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  2 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  2 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         | 11 ++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  5 +-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c                       | 11 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 10 ++--
 drivers/gpu/drm/xe/xe_hwmon.c                      | 34 +++++------
 21 files changed, 189 insertions(+), 81 deletions(-)
