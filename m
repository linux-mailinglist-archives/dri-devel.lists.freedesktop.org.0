Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361A67C595
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 09:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA2D10E0F2;
	Thu, 26 Jan 2023 08:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DA910E0F2;
 Thu, 26 Jan 2023 08:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 276F221FE9;
 Thu, 26 Jan 2023 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674720926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gXOV+pEf7vPtWXkJeBQxfCU5ok8+pSVM4xDu5xwy2gQ=;
 b=W2E9BvM5DiZC3dlHa/2mEYHiZajXs/QovGSiitYzWaleioV50h/5Fbh9QZPmqNnZjMMbuf
 5ab8lARG/cGzYtIf2OeMuD5CHtW6fvDyFWIy4uJ5Eb1CTsvotZjtO1Aa/eCWZ5R7+kF3Hz
 ScV67xgh7zmpDE1PUvmWpXMPIdNYxQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674720926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gXOV+pEf7vPtWXkJeBQxfCU5ok8+pSVM4xDu5xwy2gQ=;
 b=mq4q7PDMQtOfhvL4sad0taPk6U8z6/Yo+pb7wsk7zEPr7OA1WgG6wDr+zm8fl3xhplbGYP
 FIHp6+kTWXsXpIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D222713A09;
 Thu, 26 Jan 2023 08:15:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NftkMp020mNZMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 08:15:25 +0000
Date: Thu, 26 Jan 2023 09:15:24 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <Y9I2nOzHxTxPeTjg@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave and Daniel,

after the PR earlier this week, here's drm-misc-next's final PR
before -rc6. The committed TTM changes all seem to be reverted.

Best regards
Thomas

drm-misc-next-2023-01-26:
drm-misc-next for v6.3:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * fbdev-helper: Streamline code in generic fbdev and its helpers

 * TTM: Fixes plus their reverts

Driver Changes:

 * accel/ivpu: Typo fixes

 * i915: TTM-related fixes

 * nouveau: Remove unused return value from disable helper
The following changes since commit 68de345e101ce9a24e5c8849e69dd0dba2e8c9b2:

  Merge tag 'drm-misc-next-2023-01-24' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-01-25 12:14:08 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-01-26

for you to fetch changes up to 6ca80b9e5cc0120c37e2e7dd367b08e3e0eb8289:

  drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info' (2023-01-26 08:52:36 +0100)

----------------------------------------------------------------
drm-misc-next for v6.3:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * fbdev-helper: Streamline code in generic fbdev and its helpers

 * TTM: Fixes plus their reverts

Driver Changes:

 * accel/ivpu: Typo fixes

 * i915: TTM-related fixes

 * nouveau: Remove unused return value from disable helper

----------------------------------------------------------------
Christian König (7):
      drm/i915: audit bo->resource usage v3
      drm/ttm: stop allocating dummy resources during BO creation
      drm/ttm: stop allocating a dummy resource for pipelined gutting
      drm/ttm: prevent moving of pinned BOs
      drm/ttm: revert "prevent moving of pinned BOs"
      drm/ttm: revert "stop allocating a dummy resource for pipelined gutting"
      drm/ttm: revert "stop allocating dummy resources during BO creation"

Colin Ian King (1):
      accel/ivpu: Fix spelling mistake "tansition" -> "transition"

Deepak R Varma (1):
      drm/nouveau/devinit: Convert function disable() to be void

Thomas Zimmermann (11):
      Merge drm/drm-next into drm-misc-next
      drm/client: Test for connectors before sending hotplug event
      drm/client: Add hotplug_failed flag
      drm/fb-helper: Introduce drm_fb_helper_unprepare()
      drm/fbdev-generic: Initialize fb-helper structure in generic setup
      drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
      drm/fb-helper: Initialize fb-helper's preferred BPP in prepare function
      drm/fbdev-generic: Minimize hotplug error handling
      drm/fbdev-generic: Minimize client unregistering
      drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy()
      drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'

 drivers/accel/ivpu/ivpu_hw_mtl.c                   |   4 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |   4 +-
 drivers/gpu/drm/drm_client.c                       |  10 ++
 drivers/gpu/drm/drm_fb_helper.c                    |  58 ++++++---
 drivers/gpu/drm/drm_fbdev_generic.c                | 131 ++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  27 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  56 +++++++--
 drivers/gpu/drm/msm/msm_fbdev.c                    |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c  |   5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c  |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c    |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c    |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c    |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c    |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c |   5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h |   2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   4 +-
 drivers/gpu/drm/radeon/radeon_fb.c                 |   4 +-
 drivers/gpu/drm/tegra/fb.c                         |   7 +-
 include/drm/drm_client.h                           |   8 ++
 include/drm/drm_fb_helper.h                        |  16 ++-
 26 files changed, 222 insertions(+), 167 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
