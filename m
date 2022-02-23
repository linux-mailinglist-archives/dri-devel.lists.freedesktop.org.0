Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC074C1C23
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E1610E3C7;
	Wed, 23 Feb 2022 19:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AEF10E3C7;
 Wed, 23 Feb 2022 19:27:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1D4221121;
 Wed, 23 Feb 2022 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645644432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=upGwuoRgPZVhsPSHYfEeecC8R9ZhI7AKOyFPDap02vc=;
 b=mtwf7FUXip5sY/h4n1luTIUiUaiLqOsZk1RiUd8dOMu9hKja0jj9sxxCLpG2GsL1Ln0g9o
 C3Plob5RpGSQtbn9Z+xa5bcLSi9MKv5/ZJEsEYqxbXb3rwhlTrlW7Cwuu6Bv0Rinwff9/t
 DL/TKh5OWuejMc/jhvpeLAaSu6iI3A0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645644432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=upGwuoRgPZVhsPSHYfEeecC8R9ZhI7AKOyFPDap02vc=;
 b=oW6Yf3jK9drkTf1/S1ekRgEACQw2Y1kVO+GtmzZZ13sacEJfP+iPGNzz9ine055eh0+jK6
 GwThfkkZzL61cjDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AA1B13DA3;
 Wed, 23 Feb 2022 19:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V5YTIJCKFmLVTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:27:12 +0000
Date: Wed, 23 Feb 2022 20:27:11 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YhaKj4zWJ42YWRts@linux-uq9g.fritz.box>
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

here's drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2022-02-23:
 * edid: Always set RGB444
 * imx/dcss: Select GEM CMA helpers
 * radeon: Fix some variables's type
 * vc4: Fix codec cleanup; Fix PM reference counting
The following changes since commit 439cf34c8e0a8a33d8c15a31be1b7423426bc765:

  drm/atomic: Don't pollute crtc_state->mode_blob with error pointers (2022-02-16 12:32:07 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-02-23

for you to fetch changes up to ecbd4912a693b862e25cba0a6990a8c95b00721e:

  drm/edid: Always set RGB444 (2022-02-23 14:12:01 +0100)

----------------------------------------------------------------
 * edid: Always set RGB444
 * imx/dcss: Select GEM CMA helpers
 * radeon: Fix some variables's type
 * vc4: Fix codec cleanup; Fix PM reference counting

----------------------------------------------------------------
Christian König (1):
      drm/radeon: fix variable type

Maxime Ripard (3):
      drm/vc4: hdmi: Unregister codec device on unbind
      drm/vc4: crtc: Fix runtime_pm reference counting
      drm/edid: Always set RGB444

Rudi Heitbaum (1):
      drm/imx/dcss: i.MX8MQ DCSS select DRM_GEM_CMA_HELPER

 drivers/gpu/drm/drm_edid.c          | 2 +-
 drivers/gpu/drm/imx/dcss/Kconfig    | 1 +
 drivers/gpu/drm/radeon/radeon_uvd.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_crtc.c      | 8 +++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 8 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h      | 1 +
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
