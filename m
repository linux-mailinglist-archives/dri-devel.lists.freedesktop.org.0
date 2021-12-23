Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C347E0D4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 10:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190110E2BC;
	Thu, 23 Dec 2021 09:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9869710E2BE;
 Thu, 23 Dec 2021 09:23:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A6F81F389;
 Thu, 23 Dec 2021 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640251425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rRda4wC7PtKx+OxfU4Jyov9t9b3pClJhNncskJ65VH4=;
 b=CziLYkpMm3rRNbNzKxcMYGxtGsZWkK3pAhF072SiKgj9XL+WZnv6FVbIjaASFrYz/AP6vy
 /HpNpuLb+nkK5MbEh0cz+YlSLbhZzzLhle6by0+iQ8OWXp87DxbW3kDlzXfeasGzI1mI9C
 fmXzO5CmY3x3cYc5KjCUHrX7QQ2Ecyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640251425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rRda4wC7PtKx+OxfU4Jyov9t9b3pClJhNncskJ65VH4=;
 b=BidGwZ2O8LzGLgDdrkGcgY8g7EwZ7DQuq/thedSoAHDgFEWgjmyNH/+1H0SnCWEK7uPtvx
 K/b9S3tPvD9ShaAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC9B413E5F;
 Thu, 23 Dec 2021 09:23:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9RD7KCBAxGFfegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Dec 2021 09:23:44 +0000
Date: Thu, 23 Dec 2021 10:23:43 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YcRAH8lYbsoSCeY9@linux-uq9g.fritz.box>
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

here's the PR for drm-misc-next-fixes for what will become Linux 5.17.
There are several fixes for vmwgfx's recent conversion to GEM and a fix
for bridge DT bindinds. Besides the fixes, a backmerge updated
drm-misc-next-fixes to the state of drm-next before the feature freeze.

Best regards
Thomas

drm-misc-next-fixes-2021-12-23:
Short summary of fixes pull:

 * bridge/lvds: Fix DT bindings
 * vmwgfx: Fix several issues with the recent conversion to GEM
The following changes since commit 1c405ca11bf563de1725e5ecfb4a74ee289d2ee9:

  Merge tag 'mediatek-drm-next-5.17' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2021-12-17 16:16:16 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-12-23

for you to fetch changes up to 5da8b49de472c1da8658466d4f63ef8d9251a819:

  dt-bindings: display: bridge: lvds-codec: Fix duplicate key (2021-12-22 14:02:04 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

 * bridge/lvds: Fix DT bindings
 * vmwgfx: Fix several issues with the recent conversion to GEM

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: display: bridge: lvds-codec: Fix duplicate key

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next-fixes

Zack Rusin (4):
      drm/vmwgfx: Fix a size_t/long int format specifier mismatch
      drm/vmwgfx: Remove explicit transparent hugepages support
      drm/vmwgfx: Remove unused compile options
      drm/vmwgfx: Fix possible usage of an uninitialized variable

 .../bindings/display/bridge/lvds-codec.yaml        |  43 ++---
 drivers/gpu/drm/vmwgfx/Makefile                    |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                | 184 ---------------------
 9 files changed, 33 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
