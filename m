Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC694610A6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 09:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370A96E2A3;
	Mon, 29 Nov 2021 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A546E24D;
 Mon, 29 Nov 2021 08:56:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A46A41FD33;
 Mon, 29 Nov 2021 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638176208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5RcfXHZlatAU1H8GrAIfadrPN2mlQNL1BYn2z9EnbmQ=;
 b=h+rxYcxhDfzR3waONfxHvioXHLn4DvUkpQuOhPyw2+ilzmA8ENwPCLAcTgu3UWrOtdv+oD
 KajNGoMTwIGVF3j7BNdIj//FUNNcLHlHhy34pGejBSN1fEZlpyB98joNbOKbMTtTkUJfEV
 G7SRiAv3h6n+fqyMQobVUCfUFxO67Lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638176208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5RcfXHZlatAU1H8GrAIfadrPN2mlQNL1BYn2z9EnbmQ=;
 b=MXUaOMnMTad+MLFq2yWD0VuePZ7gJsN+YmYAuvdAgV5SuBPPHGgH6t4hWOs6J8FiKb9BBa
 FqMNmH6JuFHobCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65934133A7;
 Mon, 29 Nov 2021 08:56:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C/qjF9CVpGHwRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Nov 2021 08:56:48 +0000
Date: Mon, 29 Nov 2021 09:56:47 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YaSVz15Q7dAlEevU@linux-uq9g.fritz.box>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the second PR for drm-misc-next for what will become Linux 5.17.
It's a bit late, as I was on vacation last week. The most significant
change moves the nomodeset parameter entirely into the DRM subsystem.

Best regards
Thomas

drm-misc-next-2021-11-29:
drm-misc-next for 5.17:

UAPI Changes:

Cross-subsystem Changes:

 * Move 'nomodeset' kernel boot option into DRM subsystem

Core Changes:

 * Replace several DRM_*() logging macros with drm_*() equivalents
 * panel: Add quirk for Lenovo Yoga Book X91F/L
 * ttm: Documentation fixes

Driver Changes:

 * Cleanup nomodeset handling in drivers
 * Fixes
 * bridge/anx7625: Fix reading EDID; Fix error code
 * bridge/megachips: Probe both bridges before registering
 * vboxvideo: Fix ERR_PTR usage
The following changes since commit a713ca234ea9d946235ac7248995c5fddfd9e523:

  Merge drm/drm-next into drm-misc-next (2021-11-18 09:36:39 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-11-29

for you to fetch changes up to 69d846126e1653ca9043c3766c66684132586941:

  drm: Fix build error caused by missing drm_nomodeset.o (2021-11-27 21:05:58 +0100)

----------------------------------------------------------------
drm-misc-next for 5.17:

UAPI Changes:

Cross-subsystem Changes:

 * Move 'nomodeset' kernel boot option into DRM subsystem

Core Changes:

 * Replace several DRM_*() logging macros with drm_*() equivalents
 * panel: Add quirk for Lenovo Yoga Book X91F/L
 * ttm: Documentation fixes

Driver Changes:

 * Cleanup nomodeset handling in drivers
 * Fixes
 * bridge/anx7625: Fix reading EDID; Fix error code
 * bridge/megachips: Probe both bridges before registering
 * vboxvideo: Fix ERR_PTR usage

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: partially revert "svm bo enable_signal call condition"

Claudio Suarez (1):
      drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c

Dan Carpenter (2):
      drm/vboxvideo: fix a NULL vs IS_ERR() check
      drm/bridge: anx7625: fix an error code in anx7625_register_audio()

Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L

Hsin-Yi Wang (1):
      drm/bridge: anx7625: Fix edid_read break case in sp_tx_edid_read()

Javier Martinez Canillas (7):
      drm: Don't print messages if drivers are disabled due nomodeset
      drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call vgacon_text_force()
      drm: Move nomodeset kernel parameter to the DRM subsystem
      drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
      Documentation/admin-guide: Document nomodeset kernel parameter
      drm: Make the nomodeset message less sensational
      drm: Fix build error caused by missing drm_nomodeset.o

Martyn Welch (1):
      drm/bridge: megachips: Ensure both bridges are probed before registration

Randy Dunlap (1):
      drm: ttm: correct ttm_range_manager kernel-doc notation

 Documentation/admin-guide/kernel-parameters.txt    |   7 +
 drivers/gpu/drm/Kconfig                            |   6 +
 drivers/gpu/drm/Makefile                           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   9 -
 drivers/gpu/drm/ast/ast_drv.c                      |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   6 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  40 +++-
 drivers/gpu/drm/drm_atomic.c                       | 180 ++++++++-------
 drivers/gpu/drm/drm_atomic_helper.c                | 243 ++++++++++++---------
 drivers/gpu/drm/drm_atomic_uapi.c                  |   2 +-
 drivers/gpu/drm/drm_auth.c                         |  12 +-
 drivers/gpu/drm/drm_nomodeset.c                    |  24 ++
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
 drivers/gpu/drm/i915/i915_module.c                 |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   9 +-
 drivers/gpu/drm/tiny/bochs.c                       |   3 +-
 drivers/gpu/drm/tiny/cirrus.c                      |   4 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |  11 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   5 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   3 +-
 drivers/video/console/vgacon.c                     |  21 --
 include/drm/drm_drv.h                              |   1 +
 include/linux/console.h                            |   6 -
 29 files changed, 344 insertions(+), 285 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
