Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691555FE653
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 02:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B86310E453;
	Fri, 14 Oct 2022 00:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C0F10E453
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 00:29:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u21so4790167edi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 17:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8GV9617vBrf+UC3bV3cyJVifMG9hCF2QtrHm1U7am+0=;
 b=FK6Lz95b9zAyFw0nbrfTIgxGscONNcex57FhIQD3va4cUDoZy/mhLSTfvky+qIiTv/
 1HAHLpPSl7Ugk4lDw2bPEWVfp02RQrZB+6sEKT2u0DtzbtL8A3tuoUkxKRdwS6nWz5y2
 NwX9009nQaHH94eSjLxuU+q1Ug8JtKMSsEMGuht90PgOx3g6BnDkaO+4yfqc0AWjR1lm
 I61YZy/yKGaDCfvyG9BjDxoNqWKKMuH8VecxxMxIgimsQpcipeznUSXAeFv7o+gF8BNL
 0yLxPFn801/jrwYUmckQIsYRbheFbjVJNgQjyU3hkLgv3eInwTM6wFIMWD2F5RD/OdUl
 Ly6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8GV9617vBrf+UC3bV3cyJVifMG9hCF2QtrHm1U7am+0=;
 b=LqYmn1BrWA6Uk4miBxdPjCOMKfMBqlGdr7yvTF7b2042rr2TMn+/CtNm71cTG6OdWe
 QPS6lvczHg/U8AIu28WyMCEQws6HWODWx/FWGYCstnK/RHXCl5zigPGjlRZ6XWMTW3Is
 07dV46ntr/gA7hXnOb8nMkQp6rkBuyzmWXLt4nYS/TT1TiL7iBwoY/PcZw2LhVmHYjVI
 u3Fdk7YkodBmH9t6RY+b8YQr3IsDkRUDYsK9Td/jra9wV21rrfCmTZ34rpilC8X2ARjE
 NJj3GBaAeOTwVPtkgJJCkAv/QWbSv+9bCKpxvJMkW0jExtHh0gnZC2j3ms2J7k2EKXcI
 mFKQ==
X-Gm-Message-State: ACrzQf2fPNlS+KrTvMSMiUxaFQDbB5guzSkiI0CPNR9i6xD3qMswCxcP
 Cn3opzCcusOha5O4WPX0TJVmS0YCQYr6m3sRvi0=
X-Google-Smtp-Source: AMsMyM6nnNnSi8m8abM+8f1NluPrhdKA1g0+HUlTNvoM0uJ5zqmTEns92c9J+EC92oBZNYhzERXBtC7lLiQT6u7ud1A=
X-Received: by 2002:a05:6402:26c5:b0:45d:21fc:19e4 with SMTP id
 x5-20020a05640226c500b0045d21fc19e4mr298217edd.117.1665707370875; Thu, 13 Oct
 2022 17:29:30 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 14 Oct 2022 10:29:19 +1000
Message-ID: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1-rc1
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

Hi Linus,

Round of fixes for the merge window stuff, bunch of amdgpu and i915
changes, this should have the gcc11 warning fix, amongst other
changes.

Dave.

drm-next-2022-10-14:
drm fixes for 6.1-rc1

amdgpu:
- DC mutex fix
- DC SubVP fixes
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SDMA 6.x fixes
- Enable DPIA for 3.1.4
- VRR fixes
- VRAM BO swapping fix
- Revert dirty fb helper change
- SR-IOV suspend/resume fixes
- Work around GCC array bounds check fail warning
- UMC 8.10 fixes
- Misc fixes and cleanups

i915:
- Round to closest in g4x+ HDMI clock readout
- Update MOCS table for EHL
- Fix PSR_IMR/IIR field handling
- Fix watermark calculations for gen12+/DG2 modifiers
- Reject excessive dotclocks early
- Fix revocation of non-persistent contexts
- Handle migration for dpt
- Fix display problems after resume
- Allow control over the flags when migrating
- Consider DG2_RC_CCS_CC when migrating buffers
The following changes since commit bafaf67c42f4b547bf4fb329ac6dcb28b05de15e=
:

  Revert "drm/sched: Use parent fence instead of finished" (2022-10-07
12:58:39 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-10-14

for you to fetch changes up to fc3523a833c9c109e68209f1ecdd15864373e66a:

  Merge tag 'amd-drm-fixes-6.1-2022-10-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-10-14
07:47:25 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc1

amdgpu:
- DC mutex fix
- DC SubVP fixes
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SDMA 6.x fixes
- Enable DPIA for 3.1.4
- VRR fixes
- VRAM BO swapping fix
- Revert dirty fb helper change
- SR-IOV suspend/resume fixes
- Work around GCC array bounds check fail warning
- UMC 8.10 fixes
- Misc fixes and cleanups

i915:
- Round to closest in g4x+ HDMI clock readout
- Update MOCS table for EHL
- Fix PSR_IMR/IIR field handling
- Fix watermark calculations for gen12+/DG2 modifiers
- Reject excessive dotclocks early
- Fix revocation of non-persistent contexts
- Handle migration for dpt
- Fix display problems after resume
- Allow control over the flags when migrating
- Consider DG2_RC_CCS_CC when migrating buffers

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu: switch sdma buffer function tear down to a helper
      drm/amdgpu: fix SDMA suspend/resume on SR-IOV
      drm/amd/display: make dcn32_split_stream_for_mpc_or_odm static
      drm/amd/display: fix indentation in dc.c
      drm/amd/display: make virtual_disable_link_output static
      drm/amd/display: add a license to cursor_reg_cache.h
      drm/amd/display: fix transfer function passed to build_coefficients()

Alexey Kodanev (2):
      drm/amd/pm: vega10_hwmgr: fix potential off-by-one overflow in
'performance_levels'
      drm/amd/pm: smu7_hwmgr: fix potential off-by-one overflow in
'performance_levels'

Alvin Lee (5):
      drm/amd/display: Only commit SubVP state after pipe programming
      drm/amd/display: Block SubVP if rotation being used
      drm/amd/display: Disable GSL when enabling phantom pipe
      drm/amd/display: For SubVP pipe split case use min transition into MP=
O
      drm/amd/display: Fix watermark calculation

Aric Cyr (4):
      Revert "drm/amd/display: correct hostvm flag"
      drm/amd/display: Fix vupdate and vline position calculation
      drm/amd/display: 3.2.206
      drm/amd/display: 3.2.207

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix VRAM BO swap issue

Aurabindo Pillai (2):
      drm/amd/display: Do not trigger timing sync for phantom pipes
      drm/amd/display: Add HUBP surface flip interrupt handler

Bokun Zhang (1):
      drm/amdgpu: Fix SDMA engine resume issue under SRIOV

Candice Li (2):
      drm/amdgpu: Update umc v8_10_0 headers
      drm/amdgpu: Add poison mode query for umc v8_10_0

Charlene Liu (1):
      drm/amd/display: prevent S4 test from failing

Daniel Gomez (1):
      drm/amd/display: Fix mutex lock in dcn10

Dave Airlie (3):
      Merge tag 'drm-intel-next-fixes-2022-10-06-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-fixes-2022-10-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-6.1-2022-10-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Dillon Varone (8):
      drm/amd/display: Program SubVP in dc_commit_state_no_check
      drm/amd/display: Reorder FCLK P-state switch sequence for DCN32
      drm/amd/display: Increase compbuf size prior to updating clocks
      drm/amd/display: Fix merging dynamic ODM+MPO configs on DCN32
      Revert "drm/amd/display: skip commit minimal transition state"
      drm/amd/display: Use correct pixel clock to program DTBCLK DTO's
      drm/amd/display: Acquire FCLK DPM levels on DCN32
      drm/amd/display: Fix bug preventing FCLK Pstate allow message being s=
ent

Dmytro Laktyushkin (3):
      drm/amd/display: fix dcn315 dml detile overestimation
      drm/amd/display: add dummy pstate workaround to dcn315
      drm/amd/display: always allow pstate change when no dpps are
active on dcn315

Dong Chenchen (1):
      drm/amd/display: Removed unused variable 'sdp_stream_enable'

Eric Bernstein (1):
      drm/amd/display: Fix disable DSC logic in the DIO code

Fangzhi Zuo (1):
      drm/amd/display: Validate DSC After Enable All New CRTCs

George Shen (1):
      drm/amd/display: Add missing SDP registers to DCN32 reglist

Guenter Roeck (1):
      drm/amd/display: fix array-bounds error in
dc_stream_remove_writeback() [take 2]

Hamza Mahfooz (1):
      Revert "drm/amdgpu: use dirty framebuffer helper"

Ian Chen (1):
      drm/amd/display: Refactor edp ILR caps codes

Iswara Nagulendran (1):
      drm/amd/display: Allow PSR exit when panel is disconnected

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Jouni H=C3=B6gander (1):
      drm/i915/psr: Fix PSR_IMR/IIR field handling

Jun Lei (1):
      drm/amd/display: Add a helper to map ODM/MPC/Multi-Plane resources

Leo (Hanghong) Ma (1):
      drm/amd/display: AUX tracing cleanup

Leo Chen (1):
      drm/amd/display: Add log for LTTPR

Lewis Huang (1):
      drm/amd/display: Keep OTG on when Z10 is disable

Li Zhong (1):
      drivers/amd/pm: check the return value of amdgpu_bo_kmap

Martin Leung (3):
      drm/amd/display: block odd h_total timings from halving pixel rate
      drm/amd/display: unblock mcm_luts
      drm/amd/display: zeromem mypipe heap struct before using it

Matthew Auld (3):
      drm/i915/display: handle migration for dpt
      drm/i915: allow control over the flags when migrating
      drm/i915/display: consider DG2_RC_CCS_CC when migrating buffers

Max Tseng (1):
      drm/amd/display: Use the same cursor info across features

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display does not light up after S4 resume

Nicholas Kazlauskas (1):
      drm/amd/display: Update PMFW z-state interface for DCN314

Philip Yang (2):
      drm/amdgpu: Set vmbo destroy after pt bo is created
      drm/amdgpu: Correct amdgpu_amdkfd_total_mem_size calculation

Randy Dunlap (1):
      drm/amd/display: clean up dcn32_fpu.c kernel-doc

Rodrigo Siqueira (14):
      drm/amd/display: Drop unused code for DCN32/321
      drm/amd/display: Update DCN321 hook that deals with pipe aquire
      drm/amd/display: Fix SubVP control flow in the MPO context
      drm/amd/display: Remove OPTC lock check
      drm/amd/display: Adding missing HDMI ACP SEND register
      drm/amd/display: Add PState change high hook for DCN32
      drm/amd/display: Enable 2 to 1 ODM policy if supported
      drm/amd/display: Disconnect DSC for unused pipes during ODM transitio=
n
      drm/amd/display: update DSC for DCN32
      drm/amd/display: Minor code style change
      drm/amd/display: Add a missing hook to DCN20
      drm/amd/display: Use set_vtotal_min_max to configure OTG VTOTAL
      drm/amd/display: Drop uncessary OTG lock check
      drm/amd/display: Clean some DCN32 macros

Roman Li (1):
      drm/amd/display: Enable dpia support for dcn314

Ruili Ji (1):
      drm/amdgpu: Enable F32_WPTR_POLL_ENABLE in mqd

Shirish S (1):
      drm/amd/display: explicitly disable psr_feature_enable appropriately

Sonny Jiang (1):
      drm/amdgpu: Enable VCN PG on GC11_0_1

Tao Zhou (4):
      drm/amdgpu: remove check for CE in RAS error address query
      drm/amdgpu: define RAS convert_error_address API
      drm/amdgpu: define convert_error_address for umc v8.7
      drm/amdgpu: fix coding style issue for mca notifier

Tejas Upadhyay (1):
      drm/i915/ehl: Update MOCS table for EHL

Thomas Hellstr=C3=B6m (1):
      drm/i915: Fix display problems after resume

Tvrtko Ursulin (1):
      drm/i915/guc: Fix revocation of non-persistent contexts

Ville Syrj=C3=A4l=C3=A4 (7):
      drm/i915: Round to closest in g4x+ HDMI clock readout
      drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
      drm/i915: Fix watermark calculations for DG2 CCS modifiers
      drm/i915: Fix watermark calculations for DG2 CCS+CC modifier
      drm/i915: Reject excessive dotclocks early

Vladimir Stempen (2):
      drm/amd/display: properly configure DCFCLK when enable/disable Freesy=
nc
      drm/amd/display: increase hardware status wait time

Wenjing Liu (3):
      drm/amd/display: fix integer overflow during MSA V_Freq calculation
      drm/amd/display: write all 4 bytes of FFE_PRESET dpcd value
      drm/amd/display: Add missing mask sh for SYM32_TP_SQ_PULSE register

Yang Li (3):
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: Simplify bool conversion

Yang Yingliang (3):
      drm/amd/display: change to enc314_stream_encoder_dp_blank static
      drm/amdgpu/sdma: add missing release_firmware() in
amdgpu_sdma_init_microcode()
      drm/amd/display: fix build error on arm64

Yuan Can (1):
      drm/amd/display: Remove unused struct i2c_id_config_access

Yunxiang Li (1):
      drm/amd/display: Fix vblank refcount in vrr transition

Zhikai Zhai (1):
      drm/amd/display: skip commit minimal transition state

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  29 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  29 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              | 165 ++++++--------
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  78 ++++---
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |  63 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  71 +++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   7 -
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   4 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |  11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  85 +++++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 105 ++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  70 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  53 ++++-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   8 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 147 ++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   1 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 239 +++++------------=
----
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  40 +---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   1 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  66 +++++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  30 +++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  25 +--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   4 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |  20 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   2 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  15 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  16 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |  15 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |  13 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |   7 -
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |   4 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |  57 +++--
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |  14 +-
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.h   |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  42 ++--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  31 +++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  22 ++
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  88 ++++++++
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |   1 -
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   6 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   | 118 +++++-----
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  96 +++------
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |   1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  15 ++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 131 ++++++-----
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  21 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |   1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |  19 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  15 +-
 .../drm/amd/display/dc/inc/hw/cursor_reg_cache.h   |  99 +++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   5 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   6 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |   2 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |   2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 140 ++++++++++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   1 +
 .../drm/amd/display/modules/color/color_gamma.c    |   2 +-
 .../amd/include/asic_reg/umc/umc_8_10_0_offset.h   |   2 +
 .../amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h  |   3 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   5 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  18 ++
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  62 ++++--
 drivers/gpu/drm/i915/display/intel_psr.c           |  78 ++++---
 drivers/gpu/drm/i915/display/skl_watermark.c       |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  37 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   5 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   5 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   8 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  26 +--
 drivers/gpu/drm/i915/i915_reg.h                    |  16 +-
 116 files changed, 1830 insertions(+), 1081 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.=
h
