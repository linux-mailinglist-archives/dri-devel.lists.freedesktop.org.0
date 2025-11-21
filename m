Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E92EC780CB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 10:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17610E7FE;
	Fri, 21 Nov 2025 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+iLZyrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587F810E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:07:45 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b23b6d9f11so170902785a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 01:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763716064; x=1764320864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8w+qEx8Of4tt5SBa3RlWUJo6fDITu39rR+y8g85KD5s=;
 b=d+iLZyrZMYXdUtb4+9doUg9KG6NIS18JTkZUI9O9olKWKaJtXGdgz07voayqolQy0V
 Pvzd8SbUr20DgUnoO7dp9uCj8iJhi4PzOTtUvQKjWWu1DMfvdht77NaWcvYClvlqWQtm
 SW4DuQfVFTxaVrvFTQGZNBPldti8bESjEqpd5qO8Uro8OXXKlXP6XXAA2pJZ8CNqwZ5c
 DeUJqC3p+MvnMnSBviB9rqeNLbwzu7MHc7Qbw2DcocYYCW2v0dQcZ8qPdwIzWrTHsQoj
 xvF2/6ufqYXrDQzKApgXuGRIA0b6rMlgvxwZvYCqTUAcisw+G2khZOGtM4v3+HCjzdlN
 qRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763716064; x=1764320864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8w+qEx8Of4tt5SBa3RlWUJo6fDITu39rR+y8g85KD5s=;
 b=aT0cyvL70l2CD/pNTIK+2g01ii6+oFJPLYxWgwCLTo2kfFXWTIXTO5DJvVspbkfJSM
 OhHEWCZB6DMkzOm5mqV8Hk3TynuMLppoDNWa1FbBxNtdoXdcnbfIrO1848PmHBNG45GN
 dPenxsLVK8hLJO2CK5JwcH/HXjkqDf3wmwsuSF1cZB5Do0t0dvGlWxYtr1IMd7N/n6nh
 8lhv/f72MNdGPGGQxOulNP3/hWqwsVaITHOJZqKcY6JegQxjAnBG/jsepTiC3/nL4owU
 +4FaFP6LtccmBMxQh7lFY4DKl1CEdzw5gMowIFRGcVp51UWlEcZ64naM0DE2s99zJt0E
 gA2w==
X-Gm-Message-State: AOJu0YxaiihkQMvFw+Uk2OI3OfvHZzxmgfagtBW2qS2/P3gQFygoPkKX
 CmMGake91CIoAopWzvjA030iqsb+B9n8FDFvjbgAZxQmrE5QYDS6kd30m+FuGChDnAC9n0ejYIQ
 eOg+S4QWSHih/i07HKZBRtCIzvQgSdyBOLiYy
X-Gm-Gg: ASbGncvUPn0kGl3YQrxPTMdhQLH+d+7I8gvjGNc2fKBp14drbW7jgVNGzWwrUi3uLQ1
 8z9VUXHZj/JM4Zk6GWauX9hgvoRfBZooA7It7h7HD0ug+BxiSoiCp09nt54VI7e8vuxsq9pX3Py
 wlM96a8lB0M7hNNrBfhmBZit9v9Oj1s23U83qdGRgJ5CA9f2+t2k4xAtUnPCv3AejuoAB2hJ/PP
 GY13lfWg5vcxCON4S0fhkRwVjfN28b7ni+D9rAupzqxKKac6Vzdpas6l2MDqqmGbjZEtv4kHdSw
 QwmS
X-Google-Smtp-Source: AGHT+IGCJrNokDGqYwUz8SfagHlf8h6UdOaTeEcHyjUxNC2ONEOyObmVngc1kLfz5meb8GeqRXDA/fAGgBmKJsWcH0g=
X-Received: by 2002:a05:620a:318c:b0:897:56e7:6aa3 with SMTP id
 af79cd13be357-8b33d26417amr138365985a.56.1763716064140; Fri, 21 Nov 2025
 01:07:44 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Nov 2025 19:07:32 +1000
X-Gm-Features: AWmQ_bkkuoXazg66XTOOT_FLImD5cTX6ksfdh_l-9FkRbAMoUAZMxAM-jPxyITg
Message-ID: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

A range of small fixes across the board, the i915 display
disambiguation is probably the biggest otherwise amdgpu and xe as
usual with tegra, nouveau, radeon and a core atomic fix.

Looks mostly normal,

Regards,
Dave.

drm-fixes-2025-11-21:
drm fixes for 6.18-rc7

atomic:
- Return error codes on failed blob creation for planes

nouveau:
- Fix memory leak

tegra:
- Fix device ref counting
- Fix pid ref counting
- Revert booting on Pixel C

xe:
- Fix out-of-bounds access with BIT()
- Fix kunit test checking wrong condition
- Drop duplicate kconfig select
- Fix guc2host irq handler with MSI-X

i915:
- Wildcat Lake and Panther Lake detangled for display fixes

amdgpu:
- DTBCLK gating fix
- EDID fetching retry improvements
- HDMI HPD debounce filtering
- DCN 2.0 cursor fix
- DP MST PBN fix
- VPE fix
- GC 11 fix
- PRT fix
- MMIO remap page fix
- SR-IOV fix

radeon:
- Fence deadlock fix
The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c=
:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-21

for you to fetch changes up to 40b53db87c998b36649292a3b0daff4fa65cf481:

  Merge tag 'drm-xe-fixes-2025-11-21' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-11-21 18:33:07 +1000)

----------------------------------------------------------------
drm fixes for 6.18-rc7

atomic:
- Return error codes on failed blob creation for planes

nouveau:
- Fix memory leak

tegra:
- Fix device ref counting
- Fix pid ref counting
- Revert booting on Pixel C

xe:
- Fix out-of-bounds access with BIT()
- Fix kunit test checking wrong condition
- Drop duplicate kconfig select
- Fix guc2host irq handler with MSI-X

i915:
- Wildcat Lake and Panther Lake detangled for display fixes

amdgpu:
- DTBCLK gating fix
- EDID fetching retry improvements
- HDMI HPD debounce filtering
- DCN 2.0 cursor fix
- DP MST PBN fix
- VPE fix
- GC 11 fix
- PRT fix
- MMIO remap page fix
- SR-IOV fix

radeon:
- Fence deadlock fix

----------------------------------------------------------------
Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-11-20' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-11-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.18-2025-11-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-11-21' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Diogo Ivo (1):
      Revert "drm/tegra: dsi: Clear enable register if powered by bootloade=
r"

Dnyaneshwar Bhadane (4):
      drm/i915/xe3lpd: Load DMC for Xe3_LPD version 30.02
      drm/pcids: Split PTL pciids group to make wcl subplatform
      drm/i915/display: Add definition for wcl as subplatform
      drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A

Fangzhi Zuo (2):
      drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
      drm/amd/display: Fix pbn to kbps Conversion

Ivan Lipski (2):
      drm/amd/display: Add an HPD filter for HDMI
      drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5

Ma Ke (1):
      drm/tegra: dc: Fix reference leak in tegra_dc_couple()

Mario Limonciello (1):
      drm/amd: Skip power ungate during suspend for VPE

Mario Limonciello (AMD) (2):
      drm/amd/display: Move sleep into each retry for retrieve_link_cap()
      drm/amd/display: Increase DPCD read retries

Matt Roper (1):
      drm/xe/kunit: Fix forcewake assertion in mocs test

Nam Cao (1):
      nouveau/firmware: Add missing kfree() of nvkm_falcon_fw::boot

Prateek Agarwal (1):
      drm/tegra: Add call to put_pid()

Robert McClinton (1):
      drm/radeon: delete radeon_fence_process in is_signaled, no deadlock

Shikang Fan (1):
      drm/amdgpu: Add sriov vf check for VCN per queue reset support.

Shuicheng Lin (2):
      drm/xe: Prevent BIT() overflow when handling invalid prefetch region
      drm/xe: Remove duplicate DRM_EXEC selection from Kconfig

Srinivasan Shanmugam (1):
      drm/amdgpu/ttm: Fix crash when handling MMIO_REMAP in PDE flags

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Timur Krist=C3=B3f (1):
      drm/amdgpu/vm: Check PRT uAPI flag instead of PTE flag

Venkata Ramana Nayana (1):
      drm/xe/irq: Handle msix vector0 interrupt

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/plane: Fix create_in_format_blob() return value

Yifan Zha (1):
      drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 138 +++++++++++++++++=
++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  59 ++++-----
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   4 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   8 ++
 .../display/dc/link/protocols/link_dp_capability.c |  11 +-
 drivers/gpu/drm/drm_plane.c                        |   4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  14 +--
 .../gpu/drm/i915/display/intel_display_device.c    |  13 ++
 .../gpu/drm/i915/display/intel_display_device.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  10 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c           |   2 +
 drivers/gpu/drm/radeon/radeon_fence.c              |   7 --
 drivers/gpu/drm/tegra/dc.c                         |   1 +
 drivers/gpu/drm/tegra/dsi.c                        |   9 --
 drivers/gpu/drm/tegra/uapi.c                       |   7 +-
 drivers/gpu/drm/xe/Kconfig                         |   1 -
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                        |  18 +--
 drivers/gpu/drm/xe/xe_pci.c                        |   1 +
 drivers/gpu/drm/xe/xe_vm.c                         |   6 +-
 include/drm/intel/pciids.h                         |   5 +-
 29 files changed, 246 insertions(+), 105 deletions(-)
