Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB08CCB4CD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDCA10EC51;
	Thu, 18 Dec 2025 10:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TM/OI0fP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2433410E881;
 Thu, 18 Dec 2025 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766052339; x=1797588339;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=NJrmPBsg5z4/WIRINNnAlaz+67SqTSo/cC/xf9b1eRc=;
 b=TM/OI0fPCQYzlULlJ04UE82vEZJ8RSyXMtMVH4UHODbF/ECfjF52Jzvl
 VfcfJHw7j9LSbt6AKegfTj++iq64XSslpigVxoEic5vm4vt3X4z+pc8Nk
 ZfgrgY6cQoXzFO+5VsoaSSCAy2e8S2bIKfMa6dhO2Rs1kfme0tTqRy+8r
 QPZ3U5a/zIf28F4Hq//NPUHqqbnTN4B5+823UXYDuZqVZqvbX/dnz+TUw
 /M/5tWQfnPu+VxjQxNoofah0xtPSirEP3yLfuntntNNXF+2DuJSlb1xhr
 6/UlZaQOlyewO1XbLx+UmdsDLm6cSjun5cFQfE7mFLLKU3KXneTUrOBOm Q==;
X-CSE-ConnectionGUID: +WfBa8IUTOy2Il/xnxtI/g==
X-CSE-MsgGUID: 7fIkDoHpTX2FdL/Uf6V31g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68074346"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68074346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:05:39 -0800
X-CSE-ConnectionGUID: k+hSyMbHQjKRzPqwN7dFhQ==
X-CSE-MsgGUID: xu4xCMtjQFCjBn5iyTzLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198147952"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.76])
 ([10.245.244.76])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:05:35 -0800
Message-ID: <21861d1b-54bf-4853-9c35-97abe3c5deba@linux.intel.com>
Date: Thu, 18 Dec 2025 11:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Here's all the accumulated fixes from drm-misc-fixes!

Kind regards,
Maarten Lankhorst

drm-misc-fixes-2025-12-18:
drm-misc-fixes for v6.19-rc2:
- Add -EDEADLK handling in drm unit tests.
- Plug DRM_IOCTL_GEM_CHANGE_HANDLE leak.
- Fix regression in sony-td4353-jdi.
- Kconfig fix for visionox-rm69299.
- Do not load amdxdna when running virtualized.
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-12-18

for you to fetch changes up to 2bfca4fe1f36eb6618e5712a8b5b41433bb6f10b:

  drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE (2025-12-16 11:28:52 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc2:
- Add -EDEADLK handling in drm unit tests.
- Plug DRM_IOCTL_GEM_CHANGE_HANDLE leak.
- Fix regression in sony-td4353-jdi.
- Kconfig fix for visionox-rm69299.
- Do not load amdxdna when running virtualized.

----------------------------------------------------------------
Guido Günther (1):
      drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE

José Expósito (3):
      drm/tests: hdmi: Handle drm_kunit_helper_enable_crtc_connector() returning EDEADLK
      drm/tests: Handle EDEADLK in drm_test_check_valid_clones()
      drm/tests: Handle EDEADLK in set_up_atomic_state()

Karol Wachowski (1):
      drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Marijn Suijten (1):
      drm/panel: sony-td4353-jdi: Enable prepare_prev_first

Mario Limonciello (AMD) (1):
      accel/amdxdna: Block running under a hypervisor

 drivers/accel/amdxdna/aie2_pci.c                   |   6 +
 drivers/gpu/drm/drm_gem.c                          |   8 +-
 drivers/gpu/drm/panel/Kconfig                      |   1 +
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   2 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c      |  40 +++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 143 +++++++++++++++++++++
 6 files changed, 193 insertions(+), 7 deletions(-)
