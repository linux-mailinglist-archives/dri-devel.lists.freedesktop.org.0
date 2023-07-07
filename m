Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB774ABD5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672CD10E518;
	Fri,  7 Jul 2023 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0610E516;
 Fri,  7 Jul 2023 07:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9977D1FE7B;
 Fri,  7 Jul 2023 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688714595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vCCnhZV0wEJpff3h3x/Ypcli1t4YjDj3+AqnyUyyuv8=;
 b=ENq70gwRS5IiT1DppbmNNakHKnwY7451FwTwVFsxVwbmQWglrzyiLwUf+7FWmKoHgPDtX5
 ss8oOIp+WbAlKR2OT/7kwSyxFo8zqHQ6gu9sQLktxlLDr/G+RXBaxsC4GRBVGBQlbbS7ry
 NUC/Yo93Fgu8iACfMw3XH6VYME9lZZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688714595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vCCnhZV0wEJpff3h3x/Ypcli1t4YjDj3+AqnyUyyuv8=;
 b=NLtwsXhUWyJa1MAmykOTHpBONJjpyA1fL93Mf/l8/OIMsJwVnJMfJSQU6zCbA2C2dXJShX
 SSLBy6Z8yLiCyXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CB6C139E0;
 Fri,  7 Jul 2023 07:23:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 09SUFWO9p2RNGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 07:23:15 +0000
Date: Fri, 7 Jul 2023 09:23:13 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230707072313.GA7529@linux-uq9g>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

I just noticed that there hasn't been a fixes PR for drm-misc for
some time. So here's the overdue update.

Best regards
Thomas

drm-misc-fixes-2023-07-07:
Short summary of fixes pull:

 * bridge:
   * dw_hdmi: Connector fixes

 * ti-sn65dsi86: Fix possible use-after-free
   * dma_buf:

 * Fix signalling time
   * Return errno pointers

 * ipu: IRQ fixes

 * nouveau: Fix usage of drm_dp_remove_payload()

 * panel:
   * simple: Fix connector type for Innolux At043tn24; Fix display
             mode for Powertip PH800480T013

 * scheduler:
   * Wait for dependencies
   * Fencing fixes

 * ttm:
   * Fix bulk move
   * Fix resource leaks
The following changes since commit 54d217406afe250d7a768783baaa79a035f21d38:

  drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2 (2023-06-20 16:00:09 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-07-07

for you to fetch changes up to 00ae1491f970acc454be0df63f50942d94825860:

  dma-buf: fix an error pointer vs NULL bug (2023-07-06 19:50:23 +0530)

----------------------------------------------------------------
Short summary of fixes pull:

 * bridge:
   * dw_hdmi: Connector fixes

 * ti-sn65dsi86: Fix possible use-after-free
   * dma_buf:

 * Fix signalling time
   * Return errno pointers

 * ipu: IRQ fixes

 * nouveau: Fix usage of drm_dp_remove_payload()

 * panel:
   * simple: Fix connector type for Innolux At043tn24; Fix display
             mode for Powertip PH800480T013

 * scheduler:
   * Wait for dependencies
   * Fencing fixes

 * ttm:
   * Fix bulk move
   * Fix resource leaks

----------------------------------------------------------------
Adrián Larumbe (1):
      drm: bridge: dw_hdmi: fix connector access for scdc

Boris Brezillon (2):
      drm/sched: Make sure we wait for all dependencies in kill_jobs_cb()
      drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_scheduled()

Christian König (2):
      drm/ttm: fix warning that we shouldn't mix && and ||
      dma-buf: keep the signaling time of merged fences v3

Dan Carpenter (1):
      dma-buf: fix an error pointer vs NULL bug

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime

Fabio Estevam (1):
      drm/panel: simple: Add connector_type for innolux_at043tn24

Karol Wachowski (2):
      accel/ivpu: Fix VPU register access in irq disable
      accel/ivpu: Clear specific interrupt status bits on C0

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Fix drm_dp_remove_payload() invocation

Marek Vasut (1):
      drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags

Thomas Hellström (2):
      drm/ttm: Don't leak a resource on eviction error
      drm/ttm: Don't leak a resource on swapout move error

Yunxiang Li (1):
      drm/ttm: fix bulk_move corruption when adding a entry

 drivers/accel/ivpu/ivpu_drv.h             |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c          | 20 +++++++++------
 drivers/dma-buf/dma-fence-unwrap.c        | 26 +++++++++++++++++---
 drivers/dma-buf/dma-fence.c               |  7 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  9 ++++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     | 35 ++++++++++++++++----------
 drivers/gpu/drm/drm_syncobj.c             |  6 ++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   |  8 ++++--
 drivers/gpu/drm/panel/panel-simple.c      |  2 ++
 drivers/gpu/drm/scheduler/sched_entity.c  | 41 +++++++++++++++++++++++++------
 drivers/gpu/drm/scheduler/sched_fence.c   | 40 +++++++++++++++++++-----------
 drivers/gpu/drm/scheduler/sched_main.c    |  3 +--
 drivers/gpu/drm/ttm/ttm_bo.c              | 23 ++++++++---------
 drivers/gpu/drm/ttm/ttm_resource.c        |  5 +++-
 include/drm/gpu_scheduler.h               |  5 ++--
 include/linux/dma-fence.h                 |  2 +-
 16 files changed, 156 insertions(+), 77 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
