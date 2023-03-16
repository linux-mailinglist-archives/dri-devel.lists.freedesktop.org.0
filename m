Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E044F6BD26E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB5D10E25B;
	Thu, 16 Mar 2023 14:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE37F10E08C;
 Thu, 16 Mar 2023 14:33:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BD55219ED;
 Thu, 16 Mar 2023 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678977229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=npd/roBYej733KrkHpI8tW4sbpxSyKVLYetRazLFdjE=;
 b=LuD58BerFAs6u6JpKhZp7BiVNE8jJo4R+WsYEEPGsuIHX812XkNw6gWD6DFfvrdsl2L8Fl
 irIrOQ8XV+Y5WGuZw2JClAtZHRJj/RKdKFcaVIm+gcyZjS5LV5eMwBEIlDDWmvpLLRk8Yk
 xwCQ2eL0wi80tSzaoZHUdXL6321Vei0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678977229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=npd/roBYej733KrkHpI8tW4sbpxSyKVLYetRazLFdjE=;
 b=XkD/bA90iciCuhAIJyLlLiPuZ1rbs8bm5vyoTBc0km+R2UJLy67XMETN8SJBpJl9BlxF7F
 ZYsaii24cr24zJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33834133E0;
 Thu, 16 Mar 2023 14:33:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jXuqC80oE2TbawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 14:33:49 +0000
Date: Thu, 16 Mar 2023 15:33:47 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230316143347.GA9246@linux-uq9g>
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

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-03-16:
Short summary of fixes pull:

 * fix info leak in edid
 * build fix for accel/
 * ref-counting fix for fbdev deferred I/O
 * driver fixes
The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-03-16

for you to fetch changes up to 4028cbf867f70a3c599c9b0c9509334c56ed97d7:

  drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion again (2023-03-15 10:06:46 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

 * fix info leak in edid
 * build fix for accel/
 * ref-counting fix for fbdev deferred I/O
 * driver fixes

----------------------------------------------------------------
Christian Hewitt (1):
      drm/meson: fix 1px pink line on GXM when scaling video overlay

Dan Carpenter (1):
      fbdev: chipsfb: Fix error codes in chipsfb_pci_init()

Dmitry Osipenko (3):
      drm/shmem-helper: Remove another errant put in error path
      drm/msm/gem: Prevent blocking within shrinker loop
      drm/panfrost: Don't sync rpm suspension after mmu flushing

Johan Hovold (2):
      drm/edid: fix info leak when failing to get panel id
      drm/sun4i: fix missing component unbind on bind errors

Liu Ying (1):
      drm/bridge: Fix returned array size name for atomic_get_input_bus_fmts kdoc

Marek Szyprowski (1):
      drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion again

Oleksandr Tyshchenko (1):
      drm/virtio: Pass correct device to dma_sync_sgtable_for_device()

Stanislaw Gruszka (1):
      accel: Build sub-directories based on config options

Takashi Iwai (1):
      fbdev: Fix incorrect page mapping clearance at fb_deferred_io_release()

Thomas Hellström (1):
      drm/ttm: Fix a NULL pointer dereference

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/accel/Makefile                  |  4 ++--
 drivers/gpu/drm/drm_edid.c              |  2 +-
 drivers/gpu/drm/drm_gem.c               |  9 +++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c  |  9 ++++++---
 drivers/gpu/drm/meson/meson_dw_hdmi.c   |  2 +-
 drivers/gpu/drm/meson/meson_vpp.c       |  2 ++
 drivers/gpu/drm/msm/msm_gem_shrinker.c  | 11 +++++++++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c       |  6 ++++--
 drivers/gpu/drm/ttm/ttm_device.c        |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  4 ++--
 drivers/video/fbdev/chipsfb.c           | 14 ++++++++++----
 drivers/video/fbdev/core/fb_defio.c     | 17 +++++++++++++----
 include/drm/drm_bridge.h                |  4 ++--
 include/drm/drm_gem.h                   |  4 +++-
 include/linux/fb.h                      |  1 +
 16 files changed, 65 insertions(+), 28 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
