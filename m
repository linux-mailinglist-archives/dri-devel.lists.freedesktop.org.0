Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1D5E64D6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B13810EB35;
	Thu, 22 Sep 2022 14:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9727E10EB36;
 Thu, 22 Sep 2022 14:12:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50E4F2198F;
 Thu, 22 Sep 2022 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663855967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hC3PxwpdItuDJV6bFzcsUnwfPmcVOYxkckrivD1XFQs=;
 b=hg05v3+1FKmdbhiu7RwToQwd70me4A3vJ8krf9fmzdy7fMy58Pfzn2tpjmXfNUYDdB8hz3
 8tMcAlWcd0JO2cWOhL2y4UUCnMqbzyarHcDzj+5CkwC0j5Pv1Ag5LyTbGnFnr76e9ujYxw
 aiX0DVLkQ7vYn+kDH7mUn9aCQ+89feM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663855967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hC3PxwpdItuDJV6bFzcsUnwfPmcVOYxkckrivD1XFQs=;
 b=KnC/+s97qQR9dMOqzGeqvLguWHc8qRKLQcU1YcI9HnwunJEVguzQ9vcWzZPTHB5kpFn9b1
 qa2NRz9eJV1gV8DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A63113AA5;
 Thu, 22 Sep 2022 14:12:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TNOfAV9tLGN0DQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 14:12:47 +0000
Date: Thu, 22 Sep 2022 16:12:45 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YyxtXS588at6S4wg@linux-uq9g>
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

this is the drm-misc-fixes PR for this week.

Best regards
Thomas

drm-misc-fixes-2022-09-22:
Short summary of fixes pull

 * drm/hisilicon: Depend on MMU
 * drm/mgag200: Fix console on G200ER
 * drm/panel: Fix innolux_g121i1_l01 bus format
The following changes since commit b0b9408f132623dc88e78adb5282f74e4b64bb57:

  drm/rockchip: Fix return type of cdn_dp_connector_mode_valid (2022-09-14 10:42:41 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-09-22

for you to fetch changes up to d8a79c03054911c375a2252627a429c9bc4615b6:

  drm/hisilicon: Add depends on MMU (2022-09-20 11:15:09 +0200)

----------------------------------------------------------------
Short summary of fixes pull

 * drm/hisilicon: Depend on MMU
 * drm/mgag200: Fix console on G200ER
 * drm/panel: Fix innolux_g121i1_l01 bus format

----------------------------------------------------------------
Heiko Schocher (1):
      drm/panel: simple: Fix innolux_g121i1_l01 bus_format

Randy Dunlap (1):
      drm/hisilicon: Add depends on MMU

Thomas Zimmermann (1):
      drm/mgag200: Force 32 bpp on the console

 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c   | 6 +++++-
 drivers/gpu/drm/panel/panel-simple.c    | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
