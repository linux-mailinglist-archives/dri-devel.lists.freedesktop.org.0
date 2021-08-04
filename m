Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B743E073C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ED06EB0C;
	Wed,  4 Aug 2021 18:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9C6EB0C;
 Wed,  4 Aug 2021 18:09:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A7F0201BF;
 Wed,  4 Aug 2021 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628100559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zuamIL23GWbt9Sf4LckMV6i82WCt36qITwC6vAIUoTE=;
 b=jA5uOfe10nvhMUL5YU3byG2e4j/wY5qqXGvIOaHXKE4O7VX68lJxOE5Vxxd6P/JjWulU0V
 +dyOBwVSJoSAWoQEwsTwvrtky0WTGaym0F2IU5JCuGOyDbTnZk7vxGB5CI/QIFK7ggujCq
 1X7NJAFa4oVpWjSk/6dvPtjSHr0gjYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628100559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zuamIL23GWbt9Sf4LckMV6i82WCt36qITwC6vAIUoTE=;
 b=bDwkt8DIU4BgugWG/ezuXicLsMOIW2PpWJMgs3i0Yy31DNfe9nSbXRJDN9suzvnLEsSe0B
 rj5qrkAHZJrW4rAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AA8C5139B5;
 Wed,  4 Aug 2021 18:09:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zTW+J87XCmEfDwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Aug 2021 18:09:18 +0000
Date: Wed, 4 Aug 2021 20:09:17 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <YQrXzTmPpiuWsqSA@linux-uq9g.fritz.box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the weekly PR for drm-misc-fixes. I cherry-picked the vmwgfx
fix from drm-misc-next-fixes where it accidentally landed first.

Best regards
Thomas

drm-misc-fixes-2021-08-04:
Short summary of fixes pull:

 * kmb: DMA fix; Add macros for driver date/version
 * vmwgfx: Fix I/O memory access on 64-bit systems
The following changes since commit 8ee18e769dd621104fecad584c84ec3c4c9ef3fa:

  Merge drm/drm-fixes into drm-misc-fixes (2021-07-27 14:08:29 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-08-04

for you to fetch changes up to e89afb51f97ae03ee246c1fd0b47e3e491266aef:

  drm/vmwgfx: Fix a 64bit regression on svga3 (2021-08-02 21:00:37 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * kmb: DMA fix; Add macros for driver date/version
 * vmwgfx: Fix I/O memory access on 64-bit systems

----------------------------------------------------------------
Edmund Dea (2):
      drm/kmb: Enable LCD DMA for low TVDDCV
      drm/kmb: Define driver date and major/minor version

Zack Rusin (1):
      drm/vmwgfx: Fix a 64bit regression on svga3

 drivers/gpu/drm/kmb/kmb_drv.c       | 22 ++++++++++++++++++----
 drivers/gpu/drm/kmb/kmb_drv.h       |  5 +++++
 drivers/gpu/drm/kmb/kmb_plane.c     | 15 +++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 +-
 4 files changed, 37 insertions(+), 7 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
