Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB83B8F82
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5256EAB0;
	Thu,  1 Jul 2021 09:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E167C6EAAD;
 Thu,  1 Jul 2021 09:09:02 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C6C1227FB;
 Thu,  1 Jul 2021 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625130541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZkAhHualJpXvHlhErO3vffMp9/Q0lg7AVNAbWuLZI4=;
 b=jZ+T9/d8Tv40cx3Gfbjs4CnOND8QC7AnNxL7j2RmPyWfAwLiE3oB3ZbAqdRua/r1YBb/bW
 Y2YZ4b3hbBRy+wyVpx5OA6B7FUSOvUicnbAycR9VqZh31PvRwdrGFSazSaIXjwy5LYapQ8
 PkoQnziAOaY1BEBTdBq2xFprz4bzlwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625130541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZkAhHualJpXvHlhErO3vffMp9/Q0lg7AVNAbWuLZI4=;
 b=7rw2LrYVeR2gaE0jy7Ke80917hyYiKtfFL6tmKuNGX6P6jes/RdTdiyba7OcV/Q5yPYKVZ
 xBgP96FJo72Z3wDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 55AD611CC0;
 Thu,  1 Jul 2021 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625130541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZkAhHualJpXvHlhErO3vffMp9/Q0lg7AVNAbWuLZI4=;
 b=jZ+T9/d8Tv40cx3Gfbjs4CnOND8QC7AnNxL7j2RmPyWfAwLiE3oB3ZbAqdRua/r1YBb/bW
 Y2YZ4b3hbBRy+wyVpx5OA6B7FUSOvUicnbAycR9VqZh31PvRwdrGFSazSaIXjwy5LYapQ8
 PkoQnziAOaY1BEBTdBq2xFprz4bzlwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625130541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZkAhHualJpXvHlhErO3vffMp9/Q0lg7AVNAbWuLZI4=;
 b=7rw2LrYVeR2gaE0jy7Ke80917hyYiKtfFL6tmKuNGX6P6jes/RdTdiyba7OcV/Q5yPYKVZ
 xBgP96FJo72Z3wDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ZeQPFC2G3WDGKAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 09:09:01 +0000
Date: Thu, 1 Jul 2021 11:08:59 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YN2GK2SH64yqXqh9@linux-uq9g>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

this week's PR for drm-misc-next-fixes contains a number of BO-related
fixes in amdgpu, gma500 and radeon, and a documentation fix for dma-buf.

Best regards
Thomas

drm-misc-next-fixes-2021-07-01:
Short summary of fixes pull:

 * amdgpu: TTM fixes
 * dma-buf: Doc fixes
 * gma500: Fix potential BO leaks in error handling
 * radeon: Fix NULL-ptr deref
The following changes since commit eed75ce7c8260e0d5612ced4a88180ab991e207c:

  drm/amdgpu: fix amdgpu_preempt_mgr_new() (2021-06-21 15:24:29 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-07-01

for you to fetch changes up to f18f58012ee894039cd59ee8c889bf499d7a3943:

  drm/radeon: Fix NULL dereference when updating memory stats (2021-06-30 11:56:21 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * amdgpu: TTM fixes
 * dma-buf: Doc fixes
 * gma500: Fix potential BO leaks in error handling
 * radeon: Fix NULL-ptr deref

----------------------------------------------------------------
Jing Xiangfeng (1):
      drm/gma500: Add the missed drm_gem_object_put() in psb_user_framebuffer_create()

Mikel Rychliski (1):
      drm/radeon: Fix NULL dereference when updating memory stats

Nirmoy Das (1):
      drm/amdgpu: return early for non-TTM_PL_TT type BOs

Randy Dunlap (1):
      <linux/dma-resv.h>: correct a function name in kernel-doc

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  3 ++-
 drivers/gpu/drm/gma500/framebuffer.c    |  7 ++++++-
 drivers/gpu/drm/radeon/radeon_object.c  | 29 ++++++++++++-----------------
 drivers/gpu/drm/radeon/radeon_object.h  |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 13 ++++++++++---
 include/linux/dma-resv.h                |  2 +-
 6 files changed, 32 insertions(+), 24 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
