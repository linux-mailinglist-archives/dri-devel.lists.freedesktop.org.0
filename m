Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B818A7BB10F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 06:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8E610E1D4;
	Fri,  6 Oct 2023 04:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECDD10E1D4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 04:58:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99de884ad25so306916066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 21:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696568330; x=1697173130; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QjM0/Xrho/1FsrlLPD/qSWsu6B38wg4wh+AhjT9LTBY=;
 b=RxCxpQqRjVc5FvRXQCFvNiFxwqR5uQ612ywZ49v/8RmdVxwEd43GR30+TaYgHMeOFa
 SILUgjSvW/HGQMaLlH9gv4Iwe63b2H7MGQd521NqCQ3MH4q/t8s6jJ/LVujI4Xwa7JVi
 e3p3JaoviqD6xhk89pB5ktLftQHR1KxI2xhcw/PYgXvAKEeOxcsPe6p9oO57URvf+Gvp
 KM+fh3gdi8YjfeP0Mg4Uv6t3R168ZN5GaiCr+lS9RbZ6V3X8wRzhfk4/EvfQ4OryulBq
 akG+PnmU4yMxSoCJHkndKb2DdRVQfI+h4W0L2PR8oJ3Tz8/pFmg2OWxYiFGVi3bClEja
 K0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696568330; x=1697173130;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QjM0/Xrho/1FsrlLPD/qSWsu6B38wg4wh+AhjT9LTBY=;
 b=DIRZI/KNveRsOwRexcOqicIYsSGpsIMIcoFbgOC0Kqb1asLNsp2k4UpxMEQJ3geEDc
 y3A7HmYuxHvenz01DZEwA2ofeLkGM8fAW0RxjmtNVeHuV/Xuudq3+jv9LJSpUepYn/N1
 6tmEQanwRh/NvuGO9O41pMtp/SfMbiFRd738G5y07M/9wjzyaycAOH7Fz8yGqwPVGm+l
 iIJ9gmLB4VKvJe9F+8TPSIsx/p+2/U357q/fRHBH3irQpw2kypSdeYoFzvDVvsp6pGau
 IiFvHXSLrOIcjG1o1kQmbRYUclMplmvej+lwNjIl1WdL2TI5HiNEm13HAJKBLqBmaqyK
 YSoQ==
X-Gm-Message-State: AOJu0YzSwW9Ay9TtCZMVoXE31pxSZ9MwVWcRzkPVrDEYUChHLZC/Hye0
 pa21+BcJuSjJc1LuJBLpApvhWnfgKwW9ITxbFjlCAvov
X-Google-Smtp-Source: AGHT+IEUaO5nhV0VxSuIsCXm8e8ey4jBrnKDPa3Z535adOENEt98qF3prSVDgVn1VMatECG+TbFP7rPdTNg2N50B2jc=
X-Received: by 2002:a17:906:310b:b0:9b5:f25d:9261 with SMTP id
 11-20020a170906310b00b009b5f25d9261mr6501872ejx.22.1696568329877; Thu, 05 Oct
 2023 21:58:49 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Oct 2023 14:58:38 +1000
Message-ID: <CAPM=9txQG3XyUMBvFf5pj8ng0sKekGMw5A7nhU_eMN5ubkVGcA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.6-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular weekly pull, all seems pretty normal, i915 and amdgpu mostly.

There is one small new uAPI addition for nouveau but getting it in now
avoids a bunch of userspace dances, and it's for a userspace that
hasn't yet released, so should have no side effects.

Dave.

drm-fixes-2023-10-06:
drm fixes for 6.6-rc5

i915:
- Fix for OpenGL CTS regression on Compute Shaders
- Fix for default engines initialization
- Fix TLB invalidation for Multi-GT devices

amdgpu:
- Add missing unique_id for GC 11.0.3
- Fix memory leak in FRU error path
- Fix PCIe link reporting on some SMU 11 parts
- Fix ACPI _PR3 detection
- Fix DISPCLK WDIVIDER handling in OTG code

tests:
- Fix kunit release

panel:
- panel-orientation: Add quirk for One Mix 25

nouveau:
- Report IB limit via getparams
- Replace some magic numbers with constants
- small clean up
The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-06

for you to fetch changes up to 67f35a41d3748b7bab8787d20b50cf33fafa2ae0:

  Merge tag 'drm-misc-fixes-2023-10-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-10-06
12:48:06 +1000)

----------------------------------------------------------------
drm fixes for 6.6-rc5

i915:
- Fix for OpenGL CTS regression on Compute Shaders
- Fix for default engines initialization
- Fix TLB invalidation for Multi-GT devices

amdgpu:
- Add missing unique_id for GC 11.0.3
- Fix memory leak in FRU error path
- Fix PCIe link reporting on some SMU 11 parts
- Fix ACPI _PR3 detection
- Fix DISPCLK WDIVIDER handling in OTG code

tests:
- Fix kunit release

panel:
- panel-orientation: Add quirk for One Mix 25

nouveau:
- Report IB limit via getparams
- Replace some magic numbers with constants
- small clean up

----------------------------------------------------------------
Arthur Grillo (1):
      drm/tests: Fix kunit_release_action ctx argument

Chris Wilson (1):
      drm/i915: Invalidate the TLBs on each GT

Danilo Krummrich (3):
      drm/nouveau: chan: use struct nvif_mclass
      drm/nouveau: chan: use channel class definitions
      drm/nouveau: exec: report max pushs through getparam

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2023-10-05' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.6-2023-10-04' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-10-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Kai Uwe Broulik (1):
      drm: panel-orientation-quirks: Add quirk for One Mix 2S

Kenneth Feng (1):
      drm/amd/pm: add unique_id for gc 11.0.3

Luben Tuikov (1):
      drm/amdgpu: Fix a memory leak

Mario Limonciello (2):
      drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
      drm/amd: Fix detection of _PR3 on the PCIe root port

Mathias Krause (1):
      drm/i915: Register engines early to avoid type confusion

Nirmoy Das (1):
      drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval

Samson Tam (1):
      drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to
master OTG pipes only

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  1 +
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |  4 +--
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  4 +--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  1 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 41 ++++++++++++----------
 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 16 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           | 11 +++++-
 drivers/gpu/drm/i915/i915_gem.c                    |  9 +++--
 drivers/gpu/drm/nouveau/nouveau_abi16.c            | 21 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c             | 15 ++++----
 drivers/gpu/drm/nouveau/nouveau_dma.h              |  3 ++
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  7 ++--
 drivers/gpu/drm/nouveau/nouveau_exec.h             | 10 ++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  2 +-
 include/uapi/drm/nouveau_drm.h                     | 10 ++++++
 17 files changed, 120 insertions(+), 39 deletions(-)
