Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E4540EC7E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215B96E9A0;
	Thu, 16 Sep 2021 21:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0A16E8EA;
 Thu, 16 Sep 2021 21:25:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1BAF52B011D0;
 Thu, 16 Sep 2021 17:15:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=v45RiqZN/i6oiIGNrZzNEXsh+f
 6NSgjMOWlZQrk26uM=; b=dxfey06DfqMg90n/+BtczlPU39glJAkDJIV7LMm06M
 m8BCYqXT72dMAQ+Khc41PNOMmUgC0ajzA/6ezi2HNPUd983XJTTW5dBR1vH2wuco
 nYvIr3r6/09L09j7eElkKgfHT19wwhi8QplgSS3j3UXmSptXTb6eIZ3p3NBTiVTT
 T5aql7+bz8wgJesu4F+COmS1DjH8KVQyERJqkQZOEKU+VYjCnicJ+kWceSFg53MP
 qhpBxwVVzaJB6T0SrPJTOptA/IdINjwyI7FdboH4CmoUTkRpoYNdreHHyFFi7inP
 zbxP0vZ3BGcRW95PcjCIls4bJJQpzJee2YajrXRCiNTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=v45RiqZN/i6oiIGNr
 ZzNEXsh+f6NSgjMOWlZQrk26uM=; b=IYPiGcVe1V5ahNOjZHFtPOqQZDa1XkRIy
 RzHMh6lWCr6RTHexSYUBUja/QS1VoEPBXA6TXH6AOtI2iD8xEhWAvlQ16TwQkls4
 4RagJ2Natj7UX1ccLlPx/vsOxc8j554vF1s27SfFBcOSnNZEcG3kkSEjn2AtxogS
 7O185Eo6QVy3ChKtaRQpx91otiONpnpZ6M1DIUmnZOh5YhDsNnlRkzzk4XBi7m2k
 z0d/Rqe2I9wySThumhWl36kOBAyw/AdtmomTSB45E0qI8m9PP2co4em/gpHjU8XR
 Nl+rNLlbLQrjuPsO0AivDyHFfQX9NHJfJPBZOFjlAbGYjvlvZtwSA==
X-ME-Sender: <xms:DrRDYS2YBBhC0muLD5cxiMUOIJrQxDCqFtrn1lTj7RiYEB1B49WyCw>
 <xme:DrRDYVFVH_IvVBSD9kC8ums35IM1hr2LEztXYPfUJlZK4J45fh7LZ4Zzhdu3_rs3d
 rDhakEox1dteuaOJw>
X-ME-Received: <xmr:DrRDYa5xChptJGJBVStNset8NVN8nR-xwwVJ9psf1GbDfe6gnJ5MXS7dKpYCnB4CF_8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohes
 uhelvddrvghuqeenucggtffrrghtthgvrhhnpeeiueevtdegtdffgeeggfeuteejkeekvd
 dvkeeiueekgfefgfeuueffgeelvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:DrRDYT0n4G0IUQlTXvjeSyD0-Lrv2Pwm9g3_-WefWJQCreB9NnDi9Q>
 <xmx:DrRDYVFHMXp3SYuyB_NQi3348HnS15JlQSB9tHw3ICJ-gCcChO6YJg>
 <xmx:DrRDYc-_oMpbbkvdnJyBWXH6WZurqNHcGB81qLgmDUpTqv7G5Q2LBQ>
 <xmx:DrRDYUCR8Wr9Fu8JLjjRoaFZbJEAF63ayA3Z3UvSTMWGs3MfkZd7BRDzrIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:15:55 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 00/15] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers where
 possible
Date: Thu, 16 Sep 2021 23:15:37 +0200
Message-Id: <20210916211552.33490-1-greenfoo@u92.eu>
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

Fernando Ramos (15):
  dmr: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  dmr/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  dmr/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
  doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup

 Documentation/gpu/todo.rst                    | 17 -------
 Documentation/locking/ww-mutex-design.rst     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 13 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 23 +++++----
 drivers/gpu/drm/drm_client_modeset.c          | 14 +++---
 drivers/gpu/drm/drm_crtc_helper.c             | 18 ++++---
 drivers/gpu/drm/drm_fb_helper.c               | 10 ++--
 drivers/gpu/drm/drm_framebuffer.c             |  6 ++-
 drivers/gpu/drm/gma500/psb_device.c           | 14 ++++--
 drivers/gpu/drm/i915/display/intel_audio.c    | 12 +++--
 drivers/gpu/drm/i915/display/intel_display.c  | 22 +++-----
 .../drm/i915/display/intel_display_debugfs.c  | 35 ++++++++-----
 drivers/gpu/drm/i915/display/intel_overlay.c  | 45 ++++++++---------
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  5 +-
 drivers/gpu/drm/i915/i915_drv.c               | 12 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++-
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 10 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
 drivers/gpu/drm/omapdrm/omap_fb.c             |  6 ++-
 drivers/gpu/drm/radeon/radeon_device.c        | 13 +++--
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  6 ++-
 drivers/gpu/drm/tegra/dsi.c                   |  6 ++-
 drivers/gpu/drm/tegra/hdmi.c                  |  5 +-
 drivers/gpu/drm/tegra/sor.c                   | 10 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         | 11 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 12 +++--
 28 files changed, 222 insertions(+), 180 deletions(-)

-- 
2.33.0

