Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E542CB58
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668866EB09;
	Wed, 13 Oct 2021 20:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D28E6EB09;
 Wed, 13 Oct 2021 20:48:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id D8351581176;
 Wed, 13 Oct 2021 16:48:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 13 Oct 2021 16:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=K+ngjCbNvg5biFXc4iBRazvtWT
 DSOI4XVs1u0aTjJbw=; b=Tvjc1tOnjj3zGJw0lJZ80K3vhPCpmQ4oICUTkyXtHN
 d7S1dTjM0HnRfgzQAGPwFDs9wkg/mNeRZq9Je/IyIvnILR5i8vUw0FDq7i8kdoXV
 8OHXQb6b0gaPZooAr41EXUe6kdR/u2VNxZ1tb16g76/ABq36qxZzcvpzyFsH0Nvy
 1v/g/4w7KD7gxDOjBICloby6BV/tSrE9+92QC/XD5Y2FsVwGd1M6M0a6rPleh2Dh
 XUEbfzqDWq6wqv3Q26I5gIBkYyfR06Y5/UMcqxiWJWL7MHEHqqwUAz4tmEiGb0HN
 rG9pP9UfmgTfvnZumPqlt+SruCihex0E4PYas5mlL+Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=K+ngjCbNvg5biFXc4
 iBRazvtWTDSOI4XVs1u0aTjJbw=; b=OT0uXg/paNJS3IjRzXVsRS3ataNv4/0v8
 iujH8IUrJogzX5gw5E1nzExfP/VmXpNF2YvQ4+Thm826+TxyEGUmrfG1bAWQvb6l
 5H1VXUXQgY2+GHvB4DzYN4tR4QMzddEJIpYRdFJ9XQa99otYc7hzGyeRSEumFnzQ
 66O0UA3Vsh7wKat3UHns2X0lStQvL+7yCZMmCtqWClFLfykwHR2pOrFEUjOpUDHi
 wjCuGJbmQznTkg2+Eu4Lb9VbAXetiym8lqt9C0K1e5dgqdQbbrZYNEO3TJwNP+DE
 v6wBXVOZWsFW0vo1ryZqbaFMdjcEOq4l3VzjXDxlSsVe3q+0KcF6g==
X-ME-Sender: <xms:NEZnYaCj1HzF6opwzNRsaxopnIaizVToTfF_GQ_o2D9sy-jd4jnNQw>
 <xme:NEZnYUiHARGY_-ZTWQ0rdC32Utq73HPHz7K1iaBLzSCii3qxCQqV0HGOrWtliaw7D
 PkFT2duxEkBraCMjQ>
X-ME-Received: <xmr:NEZnYdmh8boRq2KjNANujOFlMBrPY-6cbIDRh3M1u5jy8UEs33e2CLP4vLorS2dzgluD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohes
 uhelvddrvghuqeenucggtffrrghtthgvrhhnpeegtdehgeduteehkeeugedtuedugfffhe
 fguedtudefvddtgeevudeuleegkeeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 gvnhhfohhosehuledvrdgvuh
X-ME-Proxy: <xmx:NEZnYYxLOlfgjCsN1mknSxUY6OhEw46SW-6i569oRrbxhEE8YwYWFg>
 <xmx:NEZnYfS2Bc0lpW3Gb6nLbgi9EIH56SRdvdvEwM6YhPe2zSRll0cEpQ>
 <xmx:NEZnYTa6pC95ZCv7oO6YlghtPySmIb7yOZAu8Z0w90Q8ryfcN3GZ4A>
 <xmx:NEZnYU9n6XIbyHQQuIU_I61tKhKiUR7mz1O7X6E3BPRW9P_35jNWyQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:48:49 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 00/20] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers
Date: Wed, 13 Oct 2021 22:48:26 +0200
Message-Id: <20211013204846.90026-1-greenfoo@u92.eu>
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

Changes in v4:
  - Fix missing "Signed-off-by" in one commit
  - No extra comments received in one week
  - Rebase on top of drm-tip

Fernando Ramos (20):
  drm: cleanup: drm_modeset_lock_all_ctx() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/tegra: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/shmobile: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/radeon: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/omapdrm: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/nouveau: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
  drm/i915: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
  drm/gma500: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
  drm/amd: cleanup: drm_modeset_lock_all() -->
    DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
  drm: cleanup: remove drm_modeset_(un)lock_all()
  drm: cleanup: remove acquire_ctx from drm_mode_config

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 58 ++++++------
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
 30 files changed, 272 insertions(+), 289 deletions(-)


base-commit: 3fdfa1de4774903b9cb4fb308102b5a2d762d829
-- 
2.33.0

