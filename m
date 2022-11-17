Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487862E44D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2810E66C;
	Thu, 17 Nov 2022 18:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0080C10E669;
 Thu, 17 Nov 2022 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668709839; x=1700245839;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=tB08k/1miQXzJsaL6NP5r5QUMOwxfR2ggP9BM5NyC6Y=;
 b=lMWUibhxGd3I/JGwZI4yRPfpblUANT91f69XQ8ckV75r62V/hMr8o4hp
 iqhRkJTI/DDl89wPKjdcvEPSJr2uTce0Et6Ebx7iDkheXvC9ofulxRtKY
 9yV6iy/WzWiX8NUewSPQvrnplQoN7S2/bj49rON5XCU80BVWYqfiTlOC6
 Q7TgmwR1ONf/W45LSwdYIajGWUbYmm6tET1fr1AU/IerFo3sP8Ck+Legn
 NN9b+cbzWO2XiqR9SaEpkHMNwpcTlYbKLOQ5RYGtS/9ctqF0Jp0BK9Rqj
 wOZhd00YcTi1pUjD4fODCWPLmQ4SAi3nbDcQQb7tbmeJHOcqrwl4lseRh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339771403"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
 d="scan'208,217";a="339771403"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 10:30:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="639914158"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
 d="scan'208,217";a="639914158"
Received: from pduchene-mobl.ger.corp.intel.com (HELO [192.168.178.111])
 ([10.251.220.186])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 10:30:34 -0800
Content-Type: multipart/alternative;
 boundary="------------mGzW0usBMkLE0XdbPI8HR0k5"
Message-ID: <c7d02936-c550-199b-6cb7-cbf6cf104e4a@linux.intel.com>
Date: Thu, 17 Nov 2022 19:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------mGzW0usBMkLE0XdbPI8HR0k5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,

A few fixes for v6.1-rc6.

Most important one apears to be reverting a change that breaks DP-MST.

drm-misc-fixes-2022-11-17:
drm-misc-fixes for v6.1-rc6:
- Fix error handling in vc4_atomic_commit_tail()
- Set bpc for logictechno panels.
- Fix potential memory leak in drm_dev_init()
- Fix potential null-ptr-deref in drm_vblank_destroy_worker()
- Set lima's clkname corrrectly when regulator is missing.
- Small amdgpu fix to gang submission.
- Revert hiding unregistered connectors from userspace, as it breaks on DP-MST.
- Add workaround for DP++ dual mode adaptors that don't support
   i2c subaddressing.
The following changes since commit f352262f727215553879705bacbcb208979f3eff:

   drm/panfrost: Split io-pgtable requests properly (2022-11-09 14:17:39 +0000)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-17

for you to fetch changes up to 5954acbacbd1946b96ce8ee799d309cb0cd3cb9d:

   drm/display: Don't assume dual mode adaptors support i2c sub-addressing (2022-11-15 23:31:02 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc6:
- Fix error handling in vc4_atomic_commit_tail()
- Set bpc for logictechno panels.
- Fix potential memory leak in drm_dev_init()
- Fix potential null-ptr-deref in drm_vblank_destroy_worker()
- Set lima's clkname corrrectly when regulator is missing.
- Small amdgpu fix to gang submission.
- Revert hiding unregistered connectors from userspace, as it breaks on DP-MST.
- Add workaround for DP++ dual mode adaptors that don't support
   i2c subaddressing.

----------------------------------------------------------------
Aishwarya Kothari (1):
       drm/panel: simple: set bpc field for logic technologies displays

Christian König (1):
       drm/amdgpu: use the last IB as gang leader v2

Erico Nunes (1):
       drm/lima: Fix opp clkname setting in case of missing regulator

Gaosheng Cui (1):
       drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms

Shang XiaoJing (2):
       drm/drv: Fix potential memory leak in drm_dev_init()
       drm: Fix potential null-ptr-deref in drm_vblank_destroy_worker()

Simon Rettberg (1):
       drm/display: Don't assume dual mode adaptors support i2c sub-addressing

Simon Ser (1):
       Revert "drm: hide unregistered connectors from GETCONNECTOR IOCTL"

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            | 23 ++++++----
  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h            |  1 +
  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 51 +++++++++++++----------
  drivers/gpu/drm/drm_drv.c                         |  2 +-
  drivers/gpu/drm/drm_internal.h                    |  3 +-
  drivers/gpu/drm/drm_mode_config.c                 |  3 --
  drivers/gpu/drm/lima/lima_devfreq.c               | 15 ++++---
  drivers/gpu/drm/panel/panel-simple.c              |  2 +
  drivers/gpu/drm/vc4/vc4_kms.c                     |  8 ++--
  9 files changed, 64 insertions(+), 44 deletions(-)

--------------mGzW0usBMkLE0XdbPI8HR0k5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Dave, Daniel,<br>
    <p>A few fixes for v6.1-rc6.</p>
    <p>Most important one apears to be reverting a change that breaks
      DP-MST.<br>
    </p>
    <pre>drm-misc-fixes-2022-11-17:
drm-misc-fixes for v6.1-rc6:
- Fix error handling in vc4_atomic_commit_tail()
- Set bpc for logictechno panels.
- Fix potential memory leak in drm_dev_init()
- Fix potential null-ptr-deref in drm_vblank_destroy_worker()
- Set lima's clkname corrrectly when regulator is missing.
- Small amdgpu fix to gang submission.
- Revert hiding unregistered connectors from userspace, as it breaks on DP-MST.
- Add workaround for DP++ dual mode adaptors that don't support
  i2c subaddressing.
The following changes since commit f352262f727215553879705bacbcb208979f3eff:

  drm/panfrost: Split io-pgtable requests properly (2022-11-09 14:17:39 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-17

for you to fetch changes up to 5954acbacbd1946b96ce8ee799d309cb0cd3cb9d:

  drm/display: Don't assume dual mode adaptors support i2c sub-addressing (2022-11-15 23:31:02 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc6:
- Fix error handling in vc4_atomic_commit_tail()
- Set bpc for logictechno panels.
- Fix potential memory leak in drm_dev_init()
- Fix potential null-ptr-deref in drm_vblank_destroy_worker()
- Set lima's clkname corrrectly when regulator is missing.
- Small amdgpu fix to gang submission.
- Revert hiding unregistered connectors from userspace, as it breaks on DP-MST.
- Add workaround for DP++ dual mode adaptors that don't support
  i2c subaddressing.

----------------------------------------------------------------
Aishwarya Kothari (1):
      drm/panel: simple: set bpc field for logic technologies displays

Christian König (1):
      drm/amdgpu: use the last IB as gang leader v2

Erico Nunes (1):
      drm/lima: Fix opp clkname setting in case of missing regulator

Gaosheng Cui (1):
      drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms

Shang XiaoJing (2):
      drm/drv: Fix potential memory leak in drm_dev_init()
      drm: Fix potential null-ptr-deref in drm_vblank_destroy_worker()

Simon Rettberg (1):
      drm/display: Don't assume dual mode adaptors support i2c sub-addressing

Simon Ser (1):
      Revert "drm: hide unregistered connectors from GETCONNECTOR IOCTL"

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            | 23 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h            |  1 +
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 51 +++++++++++++----------
 drivers/gpu/drm/drm_drv.c                         |  2 +-
 drivers/gpu/drm/drm_internal.h                    |  3 +-
 drivers/gpu/drm/drm_mode_config.c                 |  3 --
 drivers/gpu/drm/lima/lima_devfreq.c               | 15 ++++---
 drivers/gpu/drm/panel/panel-simple.c              |  2 +
 drivers/gpu/drm/vc4/vc4_kms.c                     |  8 ++--
 9 files changed, 64 insertions(+), 44 deletions(-)

</pre>
  </body>
</html>

--------------mGzW0usBMkLE0XdbPI8HR0k5--
