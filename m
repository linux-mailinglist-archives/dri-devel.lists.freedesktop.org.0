Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C215B9A4B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238510EAF6;
	Thu, 15 Sep 2022 12:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECEC10E198;
 Thu, 15 Sep 2022 12:03:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0391F8A3;
 Thu, 15 Sep 2022 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663243430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gC3k97TwYN1iHBX3ZmBOYwSbFNGOCfE/gnwcYbOKu0M=;
 b=hmJMmV4U5LWizpVZT80+ejSDZftJ8QE/Csf0lco3XruxFObyhBV7RqgTRa502bKjq8+xgq
 1VjyJHFAFCHSXHcdFWh1k1Ih1qMjMAZlIZtEivCKbv8qSKRb4tAJqIC8WeY1rQaGUEjHjo
 7pRmzjRGnWo0c8TGvcuR76bB01TVSlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663243430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gC3k97TwYN1iHBX3ZmBOYwSbFNGOCfE/gnwcYbOKu0M=;
 b=JDVXA08Y6ZU/+zr8OJ1Eli52jU6lCGPfE/BGJKqPAs945fXz048FnNgFnVZTt1qKDO3k4F
 H274XEAwJ2PuUIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5FD9133B6;
 Thu, 15 Sep 2022 12:03:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ysc9L6UUI2PfOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Sep 2022 12:03:49 +0000
Date: Thu, 15 Sep 2022 14:03:48 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YyMUpP1w21CPXq+I@linux-uq9g>
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

drm-misc-fixes-2022-09-15:
Short summary of fixes pull:

 * gma500: Locking and IRQ fixes
 * meson: OSD1 display fixes
 * panel-edp: Fix Innolux timings
 * rockchip: DP/HDMI fixes
The following changes since commit d76034a427a2660b080bc155e4fd8f6393eefb48:

  drm/panfrost: devfreq: set opp to the recommended one to configure regulator (2022-09-08 11:03:52 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-09-15

for you to fetch changes up to b0b9408f132623dc88e78adb5282f74e4b64bb57:

  drm/rockchip: Fix return type of cdn_dp_connector_mode_valid (2022-09-14 10:42:41 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * gma500: Locking and IRQ fixes
 * meson: OSD1 display fixes
 * panel-edp: Fix Innolux timings
 * rockchip: DP/HDMI fixes

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm/panel-edp: Fix delays for Innolux N116BCA-EA1

Hans de Goede (3):
      drm/gma500: Fix BUG: sleeping function called from invalid context errors
      drm/gma500: Fix WARN_ON(lock->magic != lock) error
      drm/gma500: Fix (vblank) IRQs not working after suspend/resume

Nathan Huckleberry (1):
      drm/rockchip: Fix return type of cdn_dp_connector_mode_valid

Sascha Hauer (1):
      drm/rockchip: vop2: Fix eDP/HDMI sync polarities

Stuart Menefy (2):
      drm/meson: Correct OSD1 global alpha value
      drm/meson: Fix OSD1 RGB to YCbCr coefficient

 drivers/gpu/drm/gma500/cdv_device.c          |  4 +---
 drivers/gpu/drm/gma500/gem.c                 |  4 ++--
 drivers/gpu/drm/gma500/gma_display.c         | 11 +++++++----
 drivers/gpu/drm/gma500/oaktrail_device.c     |  5 +----
 drivers/gpu/drm/gma500/power.c               |  8 +-------
 drivers/gpu/drm/gma500/psb_drv.c             |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h             |  5 +----
 drivers/gpu/drm/gma500/psb_irq.c             | 15 ++++++++++++---
 drivers/gpu/drm/gma500/psb_irq.h             |  2 +-
 drivers/gpu/drm/meson/meson_plane.c          |  2 +-
 drivers/gpu/drm/meson/meson_viu.c            |  2 +-
 drivers/gpu/drm/panel/panel-edp.c            |  3 ++-
 drivers/gpu/drm/rockchip/cdn-dp-core.c       |  5 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  4 ++++
 14 files changed, 38 insertions(+), 34 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
