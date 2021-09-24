Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222DC416C54
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DE76EE6E;
	Fri, 24 Sep 2021 06:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9146EE03;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 172CB580591;
 Fri, 24 Sep 2021 02:43:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=8JxUh0idl2OqTGZk5RBguL60tV
 5G7pyRJ1PUXb3KSO8=; b=UazL6jNFbUYv1RK8ZFvI998QvQhhzP8gyc4/g2VeN2
 sHUeRdspdNoQLtL/1myW6NPN2N47+4fLHR8PHba6d6Bg0SZ4DQGaTBqy/jQhM+iw
 9jsxicANK3u3q/F5W3GG3XXy6QTKJD3nO1R62NZ/Mgw2ai+Y0vKHEVxd7vXxxO0I
 FkeqYHghU+mksumRTOK96yc+EpBQBEsX2LLzxOqHXArQzlzQP/2IexbbUSNcWrDq
 t9vweO5LmYIEwF0DxYYMD+8PG1bZTNMb/iy6MBCrkgjGJqk+IjUPtus/FCNETpbr
 219hS8JrZp8AbeQu/Pr8IrVeT+vKo+qujJazXqZ8SCeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8JxUh0idl2OqTGZk5
 RBguL60tV5G7pyRJ1PUXb3KSO8=; b=AnHvEYhKcDFMV8oGVr0u7Pe14AyyyiQhH
 wwTKp1bF/EWMUIo4sHWX5rNMTm81OoaWLYX2Uf8D8dFAMBFHRGUGujhXtdr+eKJ0
 Grl4PmTYvsr9GAfbgFvzejBfvttqA/vMFyBQdj3npM6wiNUuxpBBYxtkVNIKW7aN
 Kl+Zkts+x0e6LPi3S8QuRdDgSfgeTD+j9O65ytmPzT0MGF+mjFVhsNSOwmzNTwwr
 AKx5Zox0RUeJa6KAI7F2aztC4zKYv5S36AoEVIddLtfcfi9+BN/SyWcDnFEPDLI1
 1El5NHxQt4UEC1yQEyPmulIOfB84GjGYvredlE6tX8+qcB/emWXBQ==
X-ME-Sender: <xms:lHNNYT_YRaW0CDRib44K7f-o632_sljDgiGxqOXLY-_sFsjU2RsZYA>
 <xme:lHNNYfvID2OaXtn6bhfFWVfB0awSYBFtpfVd9YwGdJkQuLQEsVrS7pxsa_QBLwMig
 0WGjklEspF0YWtg7Q>
X-ME-Received: <xmr:lHNNYRBtDkXyi-hazgRBv0OnErKymeGM5e56I1El9ltnUG1IqMYyAVoLX3jdUm9NCsVt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohes
 uhelvddrvghuqeenucggtffrrghtthgvrhhnpeeiueevtdegtdffgeeggfeuteejkeekvd
 dvkeeiueekgfefgfeuueffgeelvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:lHNNYfc7xAwlJbnY8z6DIhlqmNFgLD9ew_CIMHQANpyzpg_6StXmBQ>
 <xmx:lHNNYYM2ZXPseFBG9iF6TFZxCXpI5fDGDS19zPEbDCcNZdCoQLF_7A>
 <xmx:lHNNYRmEvGydt9qLP9-zeLKD-u-Svya9Gx_HhArCcgKaWzFThkQR-Q>
 <xmx:lXNNYXpITK9_ctPoDq7MDCrPzR7CHLI9wCWmLCE3vPi5EE66LK8v7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:29 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/17] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers
 where possible
Date: Fri, 24 Sep 2021 08:43:07 +0200
Message-Id: <20210924064324.229457-1-greenfoo@u92.eu>
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

Fernando Ramos (17):
  drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
  drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm: cleanup: remove drm_modeset_(un)lock_all()
  doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup

 Documentation/gpu/todo.rst                    | 17 ----
 Documentation/locking/ww-mutex-design.rst     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 25 ++---
 drivers/gpu/drm/drm_client_modeset.c          | 14 ++-
 drivers/gpu/drm/drm_crtc_helper.c             | 18 ++--
 drivers/gpu/drm/drm_fb_helper.c               | 10 +-
 drivers/gpu/drm/drm_framebuffer.c             |  6 +-
 drivers/gpu/drm/drm_modeset_lock.c            | 94 +------------------
 drivers/gpu/drm/gma500/psb_device.c           | 18 ++--
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 23 ++---
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
 include/drm/drm_modeset_lock.h                |  2 -
 30 files changed, 265 insertions(+), 292 deletions(-)


base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
-- 
2.33.0

