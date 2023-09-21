Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A435B7A9596
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 17:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA75B10E17D;
	Thu, 21 Sep 2023 15:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE9F10E122;
 Thu, 21 Sep 2023 15:37:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17C5622BF6;
 Thu, 21 Sep 2023 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695310634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6NK3W4Hvr1f7d0S+F7x5hys1NiQQthxLtdk+FWyRWv0=;
 b=L/LQCnXrNWMrFz6cHgDsCfEbkDSiimt/35RN9kDOQV0RZcaUatfhiLqmoD4t1iejNbf43Y
 H4OhUgndH4irDUZfQ0Oq/xWAZxRXRNRtLw9lFgP1BZc8+7Av7vATSBXGfoe+5UT/dvckDS
 YazjymN6Eyeuh57m0Z/BCmxvndzcePI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695310634;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6NK3W4Hvr1f7d0S+F7x5hys1NiQQthxLtdk+FWyRWv0=;
 b=xHVHDsUSK9q2z8aXo/DaXYKb5Yb4fQ1855kWAJRrzd90aTEgS6NeGlPNDFbj25f4r7un45
 gBJfesruOEfQLjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D777D134B0;
 Thu, 21 Sep 2023 15:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MebiMyljDGV5fAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 15:37:13 +0000
Date: Thu, 21 Sep 2023 17:37:12 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230921153712.GA14059@linux-uq9g>
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

this is the PR for drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2023-09-21:
Short summary of fixes pull:

 * DRM MM-test fixes
 * Fbdev Kconfig fixes

 * ivpu:
   * IRQ-handling fixes

 * meson:
   * Fix memory leak in HDMI EDID code

 * nouveau:
   * Correct type casting
   * Fix memory leak in scheduler
   * u_memcpya() fixes

 * virtio:
   * Fence cleanups
The following changes since commit 139a27854bf5ce93ff9805f9f7683b88c13074dc:

  drm/tests: helpers: Avoid a driver uaf (2023-09-14 13:57:58 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-09-21

for you to fetch changes up to f75f71b2c418a27a7c05139bb27a0c83adf88d19:

  fbdev/sh7760fb: Depend on FB=y (2023-09-21 10:33:49 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * DRM MM-test fixes
 * Fbdev Kconfig fixes

 * ivpu:
   * IRQ-handling fixes

 * meson:
   * Fix memory leak in HDMI EDID code

 * nouveau:
   * Correct type casting
   * Fix memory leak in scheduler
   * u_memcpya() fixes

 * virtio:
   * Fence cleanups

----------------------------------------------------------------
Arnd Bergmann (1):
      drm: fix up fbdev Kconfig defaults

Dan Carpenter (1):
      nouveau/u_memcpya: fix NULL vs error pointer bug

Danilo Krummrich (2):
      drm/nouveau: fence: fix type cast warning in nouveau_fence_emit()
      drm/nouveau: sched: fix leaking memory of timedout job

Dave Airlie (1):
      nouveau/u_memcpya: use vmemdup_user

Jani Nikula (1):
      drm/meson: fix memory leak on ->hpd_notify callback

Janusz Krzysztofik (1):
      drm/tests: Fix incorrect argument in drm_test_mm_insert_range

José Pekkarinen (1):
      drm/virtio: clean out_fence on complete_submit

Karol Wachowski (1):
      accel/ivpu/40xx: Fix buttress interrupt handling

Thomas Zimmermann (1):
      fbdev/sh7760fb: Depend on FB=y

 drivers/accel/ivpu/ivpu_hw_40xx.c          |  9 ++++++++-
 drivers/gpu/drm/Kconfig                    |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h      | 19 +++++--------------
 drivers/gpu/drm/nouveau/nouveau_exec.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    | 12 +++++++++---
 drivers/gpu/drm/tests/drm_mm_test.c        |  2 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c    |  1 -
 drivers/video/console/Kconfig              |  1 +
 drivers/video/fbdev/Kconfig                |  2 +-
 drivers/video/fbdev/core/Kconfig           |  2 +-
 12 files changed, 31 insertions(+), 25 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
