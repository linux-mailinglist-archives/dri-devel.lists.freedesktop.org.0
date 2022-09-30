Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B55F01B5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 02:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B210EC3B;
	Fri, 30 Sep 2022 00:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE66210E71A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 00:12:58 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y189so324210iof.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Mc1yUxLf68mdjipnfvOYI/nSXzD1WDAJ8f0qHaCzrCY=;
 b=jUympOnSEUyRQ7hba3Isg0fn+ppGfJ6wX9uEUD8x61FewiuHeDYWiDPujXuRj9sysO
 aeWPP0TaJyT48YIwEXScrp0/pL0FV3HpK8MH/+Ndga/TfbnrEpkpqFY9M7DKxDKw2GTl
 ev+7gWWZEwaAIJZntN4n9OfYXBpibgpFwpe/faIzlCFrUwxrhDhj5jkP0SluoxKV+3h3
 nAmdknRzeCfhrzsEKgQ9osJ5NkIGuUBGzr9ZNqmKarBt5b8Jy5rhLdM4KYxrHycLvk9n
 lk2IRvwwg33e79DWKGbx9VjxHlh8CrfuQxYGQaDhzv7WKr0bG2NCN+tyYNVcDXTvEv/2
 KCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mc1yUxLf68mdjipnfvOYI/nSXzD1WDAJ8f0qHaCzrCY=;
 b=G5SQKg2gV+wmxJYtnNplHFKe96kulmMnpdhEoH9AdSYFErKPRIW1x6BVQvvV3yQdN4
 l85s0vzylKbL7+xx0FXFXhxLywN4tArpSLnRQMRaRvz8Pblown0t4vGwMJtJTxQ4Ms7q
 OYQUVsc7rAgexkFIG3eZ2hwaRbWLuS42oDvTU+tjLHKj/94LBNOyQwqOpui8zCB3GKUb
 2xBKWtH7SN9YBGGrgIWhOEhQlAYvzb1RKXOVdfwKl6o/li3Fxk/KbvGHydtWom8+yEGd
 siioiyMbGPeyNVZPlNw3qxiihjSXiEy1JO9zE9oPh7z9ErfZDPfIR8l9fVUhha38zbgs
 eBKA==
X-Gm-Message-State: ACrzQf2C90UKyGfsz/WHCp+QCv3G29i0i9oKeOkloynF7GTIKBKY7rQD
 r5sflb4y/lcSExljoflYuuqrVx3kTr2YdBdlFDY=
X-Google-Smtp-Source: AMsMyM4cRwQfnJJcv0tOIvxC8XnUQYtIxRa/cNgXcgm/JhwIX+ZdQ19s+6vBRcwlDo1PYBdvbUeX4U9Qqq71v8xqhQk=
X-Received: by 2002:a02:cf27:0:b0:359:fec8:544a with SMTP id
 s7-20020a02cf27000000b00359fec8544amr3298988jar.214.1664496777794; Thu, 29
 Sep 2022 17:12:57 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 30 Sep 2022 10:12:45 +1000
Message-ID: <CAPM=9txBybqG30QMLH-fyovjw_m7eiFyE6rBr9Q-=rMb_sak3A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.0 final
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

Last set of fixes for 6.0 hopefully, minor bridge fixes, i915 fixes,
and a bunch of amdgpu fixes for new IP blocks, along with a couple of
regression fixes. Hopefully all set for merge window next week.

Dave.

drm-fixes-2022-09-30-1:
drm fixes for 6.0 final

amdgpu:
- GC 11.x fixes
- SMU 13.x fixes
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 9.x fix
- Fence fix
- SR-IOV supend/resume fix
- PSR regression fix

i915:
- Restrict forced preemption to the active context
- Restrict perf_limit_reasons to the supported platforms - gen11+

bridge:
- analogix: Revert earlier suspend fix
- lt8912b: Fix corrupt display output
The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-30-1

for you to fetch changes up to 6643b3836f3908c4f77883b2fae72451e85cf3ca:

  Merge tag 'drm-intel-fixes-2022-09-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-30
09:28:58 +1000)

----------------------------------------------------------------
drm fixes for 6.0 final

amdgpu:
- GC 11.x fixes
- SMU 13.x fixes
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 9.x fix
- Fence fix
- SR-IOV supend/resume fix
- PSR regression fix

i915:
- Restrict forced preemption to the active context
- Restrict perf_limit_reasons to the supported platforms - gen11+

bridge:
- analogix: Revert earlier suspend fix
- lt8912b: Fix corrupt display output

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Update DCN32 to use new SR latencies

Aric Cyr (1):
      drm/amd/display: Fix audio on display after unplugging another

Ashutosh Dixit (1):
      drm/i915/gt: Perf_limit_reasons are only available for Gen11+

Bokun Zhang (1):
      drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV

Brian Norris (1):
      Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in
suspend/resume time"

Chris Wilson (1):
      drm/i915/gt: Restrict forced preemption to the active context

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2022-09-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.0-2022-09-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2022-09-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Eric Bernstein (1):
      drm/amd/display: Remove assert for odm transition case

Evan Quan (3):
      drm/amdgpu: avoid gfx register accessing during gfxoff
      drm/amd/pm: enable gfxoff feature for SMU 13.0.0
      drm/amd/pm: use adverse selection for dpm features unsupported by driver

Francesco Dolcini (1):
      drm/bridge: lt8912b: fix corrupted image output

Graham Sider (3):
      drm/amdkfd: fix MQD init for GFX11 in init_mqd
      drm/amdgpu: pass queue size and is_aql_queue to MES
      drm/amdkfd: fix dropped interrupt in kfd_int_process_v11

Jiadong.Zhu (2):
      drm/amdgpu: Correct the position in patch_cond_exec
      drm/amdgpu: Remove fence_process in count_emitted

Leo Li (1):
      drm/amd/display: Prevent OTG shutdown during PSR SU

Nicholas Kazlauskas (3):
      drm/amd/display: Do DIO FIFO enable after DP video stream enable
      drm/amd/display: Wrap OTG disable workaround with FIFO control
      drm/amd/display: Add explicit FIFO disable for DP blank

Philippe Schenker (2):
      drm/bridge: lt8912b: add vsync hsync
      drm/bridge: lt8912b: set hdmi or dvi mode

Samson Tam (1):
      drm/amd/display: fill in clock values when DPM is not enabled

Taimur Hassan (3):
      drm/amd/display: Avoid avoid unnecessary pixel rate divider programming
      drm/amd/display: Fix typo in get_pixel_rate_div
      drm/amd/display: Avoid unnecessary pixel rate divider programming

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 27 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  4 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  4 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  8 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 11 ++-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 14 ++++
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    | 47 ++++++++++++
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  | 25 ++++--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  | 53 +++++++++++++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    | 10 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 43 ++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |  2 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |  2 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 89 +++++++---------------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ----
 drivers/gpu/drm/bridge/lontium-lt8912b.c           | 13 +++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       | 15 ++++
 .../gpu/drm/i915/gt/intel_execlists_submission.c   | 21 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        | 15 +++-
 28 files changed, 340 insertions(+), 106 deletions(-)
