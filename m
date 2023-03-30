Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8416D07BD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CB010EE66;
	Thu, 30 Mar 2023 14:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE69E10EE49;
 Thu, 30 Mar 2023 14:10:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4886F1FDFD;
 Thu, 30 Mar 2023 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680185408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vINwv/chQcKzpa66Km4h16M1ttg9P1LpEo4kauIlPR0=;
 b=15ys2ybpL2F7Yk43jr/+AdKJh2WLTQ4+aZazaH4UVH+Rt53151U1ZvITJV8ixZEEzWpSeR
 ma2dVVzmc6bZCOqpNbtOBdF38DALsDdZjhgQfu6k8bqDC/OIq3N3E0P5wgEj4zphDrcW8U
 /cHrz6LiWXIDWvo51ccw4uDn8hQ/Zlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680185408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vINwv/chQcKzpa66Km4h16M1ttg9P1LpEo4kauIlPR0=;
 b=KxyseRRpnQzt8xHGoedy3LgTA5NmG7JftwVZ6W9mAzBvGvKc+g7OyBnIRJYqI1jtwRf4TK
 M/gezMtStAao8EAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8767133E0;
 Thu, 30 Mar 2023 14:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e1+zNz+YJWSoIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 14:10:07 +0000
Date: Thu, 30 Mar 2023 16:10:06 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230330141006.GA22908@linux-uq9g>
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

drm-misc-fixes-2023-03-30:
Short summary of fixes pull:

 * various ivpu fixes
 * fix nouveau backlight registration
 * fix buddy allocator in 32-bit systems
The following changes since commit 1a70ca89d59c7c8af006d29b965a95ede0abb0da:

  drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found (2023-03-22 18:01:57 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-03-30

for you to fetch changes up to 25bbe844ef5c4fb4d7d8dcaa0080f922b7cd3a16:

  drm: test: Fix 32-bit issue in drm_buddy_test (2023-03-29 17:14:15 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * various ivpu fixes
 * fix nouveau backlight registration
 * fix buddy allocator in 32-bit systems

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix IPC buffer header status field value

David Gow (2):
      drm: buddy_allocator: Fix buddy allocator init on 32-bit systems
      drm: test: Fix 32-bit issue in drm_buddy_test

Hans de Goede (1):
      drm/nouveau/kms: Fix backlight registration

Stanislaw Gruszka (7):
      accel/ivpu: Do not access HW registers after unbind
      accel/ivpu: Cancel recovery work
      accel/ivpu: Do not use SSID 1
      accel/ivpu: Fix power down sequence
      accel/ivpu: Disable buttress on device removal
      accel/ivpu: Remove support for 1 tile SKUs
      accel/ivpu: Fix VPU clock calculation

 drivers/accel/ivpu/ivpu_drv.c               |  18 ++++-
 drivers/accel/ivpu/ivpu_drv.h               |   7 +-
 drivers/accel/ivpu/ivpu_hw_mtl.c            | 113 +++++++++-------------------
 drivers/accel/ivpu/ivpu_ipc.h               |   2 +-
 drivers/accel/ivpu/ivpu_job.c               |  11 ++-
 drivers/accel/ivpu/ivpu_pm.c                |  17 ++++-
 drivers/accel/ivpu/ivpu_pm.h                |   1 +
 drivers/gpu/drm/drm_buddy.c                 |   4 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c |   7 +-
 drivers/gpu/drm/tests/drm_buddy_test.c      |   3 +-
 10 files changed, 90 insertions(+), 93 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
