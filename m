Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAE69E083
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 13:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBDB10E7DD;
	Tue, 21 Feb 2023 12:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE3010E6E4;
 Tue, 21 Feb 2023 12:36:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D62120EC2;
 Tue, 21 Feb 2023 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676982968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pgoPqE8qjKq95A5sm46bkKbLS7p2SXRySQcXMkKvNAc=;
 b=LVfuGw/EneIi3lp43hsxaU6JhP7De9wzKtr0tR6v+8VhNcRypu4c4knRB4rWit0cU2VVuo
 X8hckKy6pno250LMzwVECmm2u69ZqKzQG4iBwUP9FWWP6AzdiLfsk0qAbz36TVFaNQLqx7
 0KcyJpbS3ejisOWAoTfLnYVq+v7MqaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676982968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pgoPqE8qjKq95A5sm46bkKbLS7p2SXRySQcXMkKvNAc=;
 b=sP6CFxIskt/xd62CNne7VdgyBd+b/qtBfXpr5j81CWiMAx0bE90Oj59erCRgLkunOqBA22
 KOZLpZZBJ0+oUPAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1370013223;
 Tue, 21 Feb 2023 12:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TenTA7i69GMgFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Feb 2023 12:36:08 +0000
Date: Tue, 21 Feb 2023 13:36:06 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Y/S6tu3gdQ0VizR+@linux-uq9g>
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

here's the final PR for drm-misc-next-fixes for this release cycle.

Best regards
Thomas

drm-misc-next-fixes-2023-02-21:
Short summary of fixes pull:

Fixes GEM SHMEM locking and generic fbdev hotplugging. Constifies
dma_buf kobj type.
The following changes since commit 38b2d8efd03d2e56431b611e3523f0158306451d:

  drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5 (2023-02-15 10:46:05 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-02-21

for you to fetch changes up to 3fb1f62f80a1d249260db5ea9e22c51e52fab9ae:

  drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini() (2023-02-21 13:26:18 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

Fixes GEM SHMEM locking and generic fbdev hotplugging. Constifies
dma_buf kobj type.

----------------------------------------------------------------
Asahi Lina (1):
      drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()

Thomas Weißschuh (1):
      dma-buf: make kobj_type structure constant

Thomas Zimmermann (1):
      drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()

 drivers/dma-buf/dma-buf-sysfs-stats.c      |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c      |  3 ++
 drivers/gpu/drm/drm_fb_helper.c            |  2 --
 drivers/gpu/drm/drm_fbdev_generic.c        |  2 ++
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 54 +++++++++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  3 +-
 drivers/gpu/drm/gma500/framebuffer.c       |  2 ++
 drivers/gpu/drm/i915/display/intel_fbdev.c |  1 +
 drivers/gpu/drm/msm/msm_fbdev.c            |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 ++
 drivers/gpu/drm/radeon/radeon_fb.c         |  2 ++
 drivers/gpu/drm/tegra/fb.c                 |  1 +
 12 files changed, 52 insertions(+), 24 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
