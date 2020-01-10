Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878811378A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 22:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E36EAA4;
	Fri, 10 Jan 2020 21:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61FD6E0D4;
 Fri, 10 Jan 2020 21:43:37 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id a203so3375786qkc.3;
 Fri, 10 Jan 2020 13:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvmcDSuShXiSweQPC79ycgk/HUZg6rwImRoRri+PWko=;
 b=q6trPoAtJ0qMKHv7ZhunruqY9Xy15+r2j838OhMlINwAuO+SrwBL5AiqffLkr28Yjv
 PR6TlfHrVbtYTlYyRbWgJaDGrLLsqH1G1WjQnMz+4SXSyO4ut1OQtpBHTL5JjpuMxvNF
 YEkYd9ObqnuNmencqAKQF4sHQ4Mc7l+LoXAYOOAFHXAuhALxmFwCCH/k5Iz/jNrmE8xA
 r12Y+zk9P7hR/ev0S+XlzaR8Zie2lNuw/1fIPArVnJVORQJfvXmoCiznTfu+sc+9urOg
 KjEIfY8cY6IDN9ow8P2h3ByseASt6mtJnyOd6o+mgIxM68QTWnQCQje5RYfOloRucO8i
 jAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvmcDSuShXiSweQPC79ycgk/HUZg6rwImRoRri+PWko=;
 b=LHb0mJB9IYiH27esUw6L31mnsqDMYbgouJC7cRd80x+jar5LqKyqUDvIzIE2dv8ZAz
 TSKfkpxGeFf8IQglykOeRRs5/sbuR13IlqMRIccm/Cjs/dvcL233XCo20vlLwusMOi+q
 vTq5LyOrQtrb3L5kkAyIPAAKA5lqZEbiDOPbj9TH3uVsCOozUQKRs+T4H3RkLlLdr9GR
 sZ9Lpr7ecszm3ExJcsH3Y2lOA11upeIq63OkPpMhBxdhdBysSC7X2NqBKSEkEPixVkPr
 EkoITO4Athr4WrEJiXCQ1ePV8pzYfr3fnOpuLSpgHv84ESK2KJxlIfSQ+1IYNTS2y7IR
 IIJQ==
X-Gm-Message-State: APjAAAX2CITdjHorsHHI6oX2hVzjlnUB3KomV+M/h/V2Nlaplh76zZMi
 VPm/P3B91RXAc8Qrmp87qCJVYVQ9
X-Google-Smtp-Source: APXvYqwrSA1obPC5x7I1Th1JsvoUxK2HtxlpUwNzXbTRlfmk43PCeI1JBYmJdMrbfeqgaMJIy4k7uw==
X-Received: by 2002:a37:aa11:: with SMTP id t17mr691902qke.69.1578692616794;
 Fri, 10 Jan 2020 13:43:36 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id l35sm1700798qtl.12.2020.01.10.13.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 13:43:36 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] drm DP MST DSC support
Date: Fri, 10 Jan 2020 16:43:28 -0500
Message-Id: <20200110214328.308549-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Same pull as yesterday, but with a fix for 32 bit.

The following changes since commit 0f899fd466b693a129b16994c1b2b4db2fcde4a4:

  drm/amdkfd: Improve kfd_process lookup in kfd_ioctl (2020-01-09 16:08:19 -0500)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.6-2020-01-10-dp-mst-dsc

for you to fetch changes up to 485b747ea6ecf491bf07c69a4ea36c0ccf3c8435:

  drm/amd/display: Fix compilation warnings on i386 (2020-01-10 16:34:20 -0500)

----------------------------------------------------------------
amd-drm-next-5.6-2020-01-10-dp-mst-dsc:

drm:
- Add MST helper for PBN calculation of DSC modes
- Parse FEC caps on MST ports
- Add MST DPCD R/W functions
- Add MST helpers for virtual DPCD aux
- Add MST HUB quirk
- Add MST DSC enablement helpers

amdgpu:
- Enable MST DSC
- Add fair share algo for DSC bandwidth calcs
- Fix for 32 bit builds

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/display: protect new DSC code with CONFIG_DRM_AMD_DC_DCN
      drm/dp_mst: fix documentation of drm_dp_mst_add_affected_dsc_crtcs

David (Dingchen) Zhang (1):
      drm: add dp helper to initialize remote aux channel.

David Francis (9):
      drm/dp_mst: Add PBN calculation for DSC modes
      drm/dp_mst: Parse FEC capability on MST ports
      drm/dp_mst: Add MST support to DP DPCD R/W functions
      drm/dp_mst: Fill branch->num_ports
      drm/dp_mst: Add helpers for MST DSC and virtual DPCD aux
      drm/amd/display: Initialize DSC PPS variables to 0
      drm/amd/display: Validate DSC caps on MST endpoints
      drm/amd/display: Write DSC enable to MST DPCD
      drm/amd/display: MST DSC compute fair share

Mikita Lipski (11):
      drm/dp_mst: Add new quirk for Synaptics MST hubs
      drm/dp_mst: Manually overwrite PBN divider for calculating timeslots
      drm/dp_mst: Add DSC enablement helpers to DRM
      drm/dp_mst: Add branch bandwidth validation to MST atomic check
      drm/dp_mst: Rename drm_dp_mst_atomic_check_topology_state
      drm/amd/display: Add PBN per slot calculation for DSC
      drm/amd/display: Check return value of drm helper
      drm/amd/display: Recalculate VCPI slots for new DSC connectors
      drm/dp_mst: Add helper to trigger modeset on affected DSC MST CRTCs
      drm/amd/display: Trigger modesets on MST DSC connectors
      drm/amd/display: Fix compilation warnings on i386

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 121 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  19 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 420 ++++++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   7 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   3 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   1 +
 drivers/gpu/drm/drm_dp_aux_dev.c                   |  12 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  45 ++-
 drivers/gpu/drm/drm_dp_mst_topology.c              | 392 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   4 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |  12 +-
 include/drm/drm_dp_helper.h                        |   8 +
 include/drm/drm_dp_mst_helper.h                    |  20 +-
 18 files changed, 1031 insertions(+), 51 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
