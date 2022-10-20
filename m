Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243C605EEE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 13:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0039710E849;
	Thu, 20 Oct 2022 11:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A610E849;
 Thu, 20 Oct 2022 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666265676; x=1697801676;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=ONmZUjDAq1r3PAfnWVRhh80AKNVE1AVquqATmZp3NAM=;
 b=cYihlZi+LqcVqV3Kv8njEY+0Amhw4jaTsaBJGqpBaZ8Wc3m5ZUEzSs8n
 xMwBkFKHqzWLTaJeZ7oppVkL6SFkcSm4sLOLX3M90JB46ehdoLu7/MUKr
 GoCfhK9qHjmTkfIwKCO+dumNFuPDijf+s0Jnmb2u6BHhswqDHmHgUNE9q
 +R1g1MG9C7c1HarysAp11empCQflQGxXe8KmKNm7NAY1St75CaJJ93O3r
 29HBDAbL9TO06zSc/sDzlwC4BYz0wWmGEri+f0ErdgewpxEGW02fjIXfQ
 wZm8JxHorL2YAdmNyNqhyNnaWuG1wzWOlscZPHzJz0E9vU8UNuP9bTQkG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="370895091"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="370895091"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 04:34:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="580855867"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="580855867"
Received: from lzygo-mobl.ger.corp.intel.com (HELO [10.252.43.232])
 ([10.252.43.232])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 04:34:32 -0700
Message-ID: <c4d05683-8ebe-93b8-d24c-d1d2c68f12c4@linux.intel.com>
Date: Thu, 20 Oct 2022 13:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.1.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2022-10-20:
drm-misc-fixes for v6.1-rc2:
- Fix a buffer overflow in format_helper_test.
- Set DDC pointer in drmm_connector_init.
- Compiler fixes for panfrost.
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-10-20

for you to fetch changes up to 72655fb942c1e3d9e71e48e87ee439abe52f3a90:

  drm/panfrost: replace endian-specific types with native ones (2022-10-20 11:02:11 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc2:
- Fix a buffer overflow in format_helper_test.
- Set DDC pointer in drmm_connector_init.
- Compiler fixes for panfrost.

----------------------------------------------------------------
Christian König (2):
      drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
      drm/amdgpu: use DRM_SCHED_FENCE_DONT_PIPELINE for VM updates

David Gow (1):
      drm: tests: Fix a buffer overflow in format_helper_test

Maxime Ripard (4):
      drm/vc4: Add module dependency on hdmi-codec
      drm/vc4: hdmi: Enforce the minimum rate at runtime_resume
      drm/vc4: hdmi: Check the HSM rate at runtime_resume
      drm/connector: Set DDC pointer in drmm_connector_init

Steven Price (2):
      drm/panfrost: Remove type name from internal structs
      drm/panfrost: replace endian-specific types with native ones

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c    |  9 ++++++-
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c       | 36 +++++++++++++-------------
 drivers/gpu/drm/scheduler/sched_entity.c       |  3 ++-
 drivers/gpu/drm/tests/drm_format_helper_test.c |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                  |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                 | 29 +++++++++++++++++++++
 include/drm/gpu_scheduler.h                    |  9 +++++++
 include/uapi/drm/panfrost_drm.h                | 36 ++++++++++++++------------
 9 files changed, 89 insertions(+), 38 deletions(-)
