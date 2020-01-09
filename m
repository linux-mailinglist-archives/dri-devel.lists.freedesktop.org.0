Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AE1363C3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 00:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33E08996F;
	Thu,  9 Jan 2020 23:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B98994D;
 Thu,  9 Jan 2020 23:25:37 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id j9so287890qkk.1;
 Thu, 09 Jan 2020 15:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYc7pk33Ry+0kN3E11mqQ239909IqM/Uj0PIdqgtl3w=;
 b=hhvmSKaX1wE86TDguffhXGE66en9yr755PdZtv12zfsa3VrUQkqU0dIeDB4/TmBfP9
 t3xYlUPkGPM23vEiNW93B9cIPX0hifmnGwNeOafjBLZ0EWtPwA/Re90SFfWncvdeA6DM
 0Nuxslh5ggBGa+Lj9bSszQ3LuDkGemKOemORxH1FtIQSK+BCpkpE3pfJrRonQFj1Sb+F
 eFkugbkx3xx3bFb8ZA4mYBwA6gvbuSsjSsGhVKw/n+GtESQ1og2C08PCyZfgs43OscPX
 AS+b9cnZpZnDy1uGqjs//yGtjC4X44Q4qGvo3+1w76Ns4+JoslvcZfPIOw066ep9EJJf
 ef7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYc7pk33Ry+0kN3E11mqQ239909IqM/Uj0PIdqgtl3w=;
 b=XBZej/CPhUyj+/nv/SIbaR6QSMsmj3c9NXHTqVWqVfzDyjlzvA5t+NvXoEcwiPgxoD
 B2DpiOkcH76xvD616agoM0iNkwY2yUSDz5jvosasllJj7cgBa9+mZM8F7ZnH9nxwedy6
 3LIW7+JjoQHUw5LKolyGB9yG6068fE2yrFcvDWYejRc3NFMdxvHmUxGBCvBFy7NrBezj
 HenE9GeyW4/euueUj0CnhKO3+BQbb5I6oocqZOCIz0SOkOD5EVyFFzS5otCKZzr8d9A/
 St7IOeKkdleRv6nODYsGY9Kp/rl8/PHz52n7z3LGKXiSCW3H1ViZkyNOnb68kt1xZ9QE
 z5+g==
X-Gm-Message-State: APjAAAUTkNc8bbH9qKYWqwWlP3kKwzCQGLCMhM3cMaqYepAoOX5kOkpM
 JgqR5Qj1EpMgWGi+FV0jG592hQOc
X-Google-Smtp-Source: APXvYqwW1mCuwv3WwNosEqFLyPGuvvGY0twcKPEktcgQmnwpjKPd4jzBURBJCQUwTkAe+Q5NzUYI8g==
X-Received: by 2002:a37:6346:: with SMTP id x67mr372680qkb.476.1578612336232; 
 Thu, 09 Jan 2020 15:25:36 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id l49sm93900qtk.7.2020.01.09.15.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 15:25:35 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] drm DP MST DSC support
Date: Thu,  9 Jan 2020 18:25:28 -0500
Message-Id: <20200109232528.4483-1-alexander.deucher@amd.com>
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

Ideally this would have gone through drm-misc, but it had dependencies
on some changes in the DC code which were in my latest PR, so I sent
this as a separate PR on top of my amdgpu PR.

The following changes since commit 0f899fd466b693a129b16994c1b2b4db2fcde4a4:

  drm/amdkfd: Improve kfd_process lookup in kfd_ioctl (2020-01-09 16:08:19 -0500)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.6-2020-01-09-dp-mst-dsc

for you to fetch changes up to 9edb435aed968a2c792f6d847f524587697edf37:

  drm/dp_mst: fix documentation of drm_dp_mst_add_affected_dsc_crtcs (2020-01-09 18:07:48 -0500)

----------------------------------------------------------------
amd-drm-next-5.6-2020-01-09-dp-mst-dsc:

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

Mikita Lipski (10):
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
