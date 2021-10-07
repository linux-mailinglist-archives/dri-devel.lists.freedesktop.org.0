Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33F425BA4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4966E02A;
	Thu,  7 Oct 2021 19:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE5D6E02A;
 Thu,  7 Oct 2021 19:38:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 67C112B0094F;
 Thu,  7 Oct 2021 15:38:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=6t8F0nLbX20nu7PWPH1NYpcD+G
 PaasA0AhXVP4bdQeg=; b=JbSx3GOKH7vNl/FpGltwtg3AZUy1DFEpk3vm8eY//O
 flkCLZKAm8pPdCWBAQZpW94diYSRzFrR3Q647227ZtfVDITndVrC7RiaroK/Jjlm
 BwHRKB6smGYnqEYFWJZsQA++pvidooGK2KnGD8HYTBvsubgAPl5Gt3A0wiI5B7CB
 SoB7I3zY9EOgCTDVQqmQdREcGqhIOZkuehrHlNKeXzMuoU6e6oLL9lTAgb+yG4y8
 wVBYEotGsHDBQkCD2/javESwZseMnfGAd3yswIhIHElKQ89y/6L3HgBtfKGiv3+J
 oCcAMPAlMBFivDABJIDrc0hfsmnAy5Npx4XFb4Qe/3VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6t8F0nLbX20nu7PWP
 H1NYpcD+GPaasA0AhXVP4bdQeg=; b=iG6I+j5yTt5uTX97E5jqD+NlIyG1tt0Gr
 WqnzfiVN+ztTSf1Y5J5wz4lDegm2I4U73EJkRF0juBICjZOXvEq2YT2IzqeCuH4F
 DmCoOzxmZVfccL3VDC8zrG6zrTNH8IJW3gBC5SXzzouKm4+k7as2nUr0NgQ1ghpW
 p6Wj1b3v6t60FREAj0522MNCqEC1pqSPRt54NIkT6P045gBAkzIjiB0nw7KzZObL
 DvzAVvIVQVBdbSrpB4NfAcT5orhnGxNvF2H91HRBuAvrD42PZwqxas1zfPyCHk2O
 8yTzX+huaav75fF7FcNQCcZn6yI0I4ZsCXYPNzi4QpqCCkvvmIQFA==
X-ME-Sender: <xms:mExfYbwmvcaV46OjSqvV9VROtDRm8RPeRJcnHp2YmY_I9_KrjLJi2w>
 <xme:mExfYTSCnJSVph4UbD6EjE6C_hjJbxPf21ISFtthzvPfX4jcjegOPJ03svLjq-iAQ
 nn0EILsxqB7pDralA>
X-ME-Received: <xmr:mExfYVWA7voDTH6AIU6RKfSH5j83Q8KMumChFhVVHZSXM-MVIXr1Jg6aVkjI9hZRptCB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohes
 uhelvddrvghuqeenucggtffrrghtthgvrhhnpeegtdehgeduteehkeeugedtuedugfffhe
 fguedtudefvddtgeevudeuleegkeeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 gvnhhfohhosehuledvrdgvuh
X-ME-Proxy: <xmx:mExfYVhuGGjP9MEfT54i62c-DRcV6tdOSW8sUV78GTVjqd8TCcCvGg>
 <xmx:mExfYdDP7YrsM-FuWPRVLcD4rfVWdP-cu0HNBnrzPlDn6mt4jXGFJg>
 <xmx:mExfYeL3nESssM1W-pZKF0UTOQHTt8CUORKOamz4ZAu5OEtG9RzGxA>
 <xmx:mUxfYRvVBbxdR19es_j0r8Pto48kGjVLX3PU0iHxCySaTVM2IE0UHYE420c>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:37:57 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 00/20] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers
Date: Thu,  7 Oct 2021 21:37:35 +0200
Message-Id: <20211007193755.29579-1-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
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

Hi all,

One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
"use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
patch series is about.

You will find two types of changes here:

  - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
    "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
    already been done in previous commits such as b7ea04d2)

  - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
    in the remaining places (as it has already been done in previous commits
    such as 57037094)
    
Most of the changes are straight forward, except for a few cases in the "amd"
and "i915" drivers where some extra dancing was needed to overcome the
limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
once inside the same function (the reason being that the macro expansion
includes *labels*, and you can not have two labels named the same inside one
function)

Notice that, even after this patch series, some places remain where
"drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
all inside drm core (which makes sense), except for two (in "amd" and "i915")
which cannot be replaced due to the way they are being used.

Changes in v2:
  - Fix commit message typo
  - Use the value returned by DRM_MODESET_LOCK_ALL_END when possible
  - Split drm/i915 patch into two simpler ones
  - Remove drm_modeset_(un)lock_all()
  - Fix build problems in non-x86 platforms

Changes in v3:
  - Fix in drm/i915 driver to make sure global context is no longer used
  - Fix in drm/amdgpu driver to make sure global context is no longer used
  - Split amdgpu driver to make it easier to understand
  - Remove acquire_ctx from drm_mode_config 
  - Rebase on top of drm-tip
  - WARNING: There is some discussion going on regarding whether the new macros
    should be used (or not) in the i915 driver, as a different set of functions
    has been proposed in the past (see here:
    https://lore.kernel.org/dri-devel/YVriZxCeipBUgc8O@intel.com/).
    In that case I will need to create a v4 where i915 files are left unchanged.
    Let me know your thoughts regarding this.

Fernando Ramos (20):
  drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
  drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
  drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
  drm: cleanup: remove drm_modeset_(un)lock_all()
  drm: cleanup: remove acquire_ctx from drm_mode_config

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 59 ++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 25 ++---
 drivers/gpu/drm/drm_client_modeset.c          | 14 ++-
 drivers/gpu/drm/drm_crtc_helper.c             | 18 ++--
 drivers/gpu/drm/drm_fb_helper.c               | 10 +-
 drivers/gpu/drm/drm_framebuffer.c             |  6 +-
 drivers/gpu/drm/drm_modeset_lock.c            | 94 +------------------
 drivers/gpu/drm/gma500/psb_device.c           | 18 ++--
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 25 ++---
 .../drm/i915/display/intel_display_debugfs.c  | 46 +++++----
 drivers/gpu/drm/i915/display/intel_overlay.c  | 46 ++++-----
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  7 +-
 drivers/gpu/drm/i915/i915_drv.c               | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 10 +-
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 15 ++-
 drivers/gpu/drm/omapdrm/omap_fb.c             |  9 +-
 drivers/gpu/drm/radeon/radeon_device.c        | 21 +++--
 drivers/gpu/drm/radeon/radeon_dp_mst.c        | 10 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  6 +-
 drivers/gpu/drm/tegra/dsi.c                   |  6 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  6 +-
 drivers/gpu/drm/tegra/sor.c                   | 11 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         | 11 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 12 ++-
 include/drm/drm_mode_config.h                 | 10 --
 include/drm/drm_modeset_lock.h                |  2 -
 30 files changed, 272 insertions(+), 290 deletions(-)


base-commit: 58a206ae5bf2f81a11e4408d10a3e1b445d6eebb
-- 
2.33.0

