Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B94B09F1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C0110E7BC;
	Thu, 10 Feb 2022 09:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1410E7BA;
 Thu, 10 Feb 2022 09:50:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A43021121;
 Thu, 10 Feb 2022 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644486615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=deZfP06Fv196Bans7w5bnHV0gjqNMn87YoqP0+WHMWo=;
 b=bnheaBPXqOg8WeinPlbqxdiUYqg1lSsqTok3u5/CIbI4yGABbT0Y6VHkap4SzsAULJF7gN
 WbmrtGbMNi7aEXziZZGf95NkluFKBVSGa8R2Leh6yRiucUzap8TR6x07EyvBlFqMoIun7L
 oRyjEC4gQ7/ku3bsbI73TbpP6SC71j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644486615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=deZfP06Fv196Bans7w5bnHV0gjqNMn87YoqP0+WHMWo=;
 b=Wug/c9IDcOs91Cn+xlLcZihmjVYPQG2TjP5Ow5JecfTK/SkPqoGuLDpz+x1sx0sKeRV3Xb
 bcd1N96hJvxURJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B20913B35;
 Thu, 10 Feb 2022 09:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n7qRBdffBGJlVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 09:50:15 +0000
Date: Thu, 10 Feb 2022 10:50:13 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YgTf1Zsflzq3JSFo@linux-uq9g>
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

here's this week's PR for drm-misc-fixes. The most notable thing is the
addition of the new fbdev core module.

Best regards
Thomas

drm-misc-fixes-2022-02-10:
 * drm/panel: simple: Fix assignments from panel_dpi_probe()
 * drm/privacy-screen: Cleanups
 * drm/rockchip: Fix HDMI error cleanup; Fix RK3399 VOP register fields
 * drm/vc4: HDMI fixes; Cleanups
 * fbdev: Add fbdev core module with Daniel as maintainer; Cleanups
The following changes since commit 622c9a3a7868e1eeca39c55305ca3ebec4742b64:

  drm: mxsfb: Fix NULL pointer dereference (2022-02-03 09:31:16 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-02-10

for you to fetch changes up to 9da1e9ab82c92d0e89fe44cad2cd7c2d18d64070:

  drm/rockchip: vop: Correct RK3399 VOP register fields (2022-02-08 18:10:36 +0100)

----------------------------------------------------------------
 * drm/panel: simple: Fix assignments from panel_dpi_probe()
 * drm/privacy-screen: Cleanups
 * drm/rockchip: Fix HDMI error cleanup; Fix RK3399 VOP register fields
 * drm/vc4: HDMI fixes; Cleanups
 * fbdev: Add fbdev core module with Daniel as maintainer; Cleanups

----------------------------------------------------------------
Brian Norris (1):
      drm/rockchip: vop: Correct RK3399 VOP register fields

Christoph Niedermaier (1):
      drm/panel: simple: Assign data from panel_dpi_probe() correctly

Daniel Vetter (1):
      MAINTAINERS: Add entry for fbdev core

Dave Stevenson (3):
      drm/vc4: hdmi: Ensure we don't use 2711 HPD registers on Pi0-3
      drm/vc4: hdmi: Don't try disabling SCDC on Pi0-3.
      drm/vc4: hdmi: Allow DBLCLK modes even if horz timing is odd.

Hans de Goede (1):
      drm/privacy-screen: Fix sphinx warning

Helge Deller (1):
      fbcon: Avoid 'cap' set but not used warning

Maxime Ripard (1):
      drm/vc4: crtc: Fix redundant variable assignment

Sascha Hauer (1):
      drm/rockchip: dw_hdmi: Do not leave clock enabled in error case

Yizhuo Zhai (1):
      fbdev: fbmem: Fix the implicit type casting

 MAINTAINERS                                 |  6 ++++++
 drivers/gpu/drm/drm_privacy_screen.c        |  2 +-
 drivers/gpu/drm/panel/panel-simple.c        |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 14 +++++++-------
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c |  8 +++++---
 drivers/gpu/drm/vc4/vc4_crtc.c              |  1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/vc4/vc4_hdmi.h              |  3 +++
 drivers/video/fbdev/core/fbcon.c            |  7 +++----
 drivers/video/fbdev/core/fbmem.c            |  2 ++
 10 files changed, 48 insertions(+), 25 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
