Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552B7A03BA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 14:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691410E56B;
	Thu, 14 Sep 2023 12:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183F10E562;
 Thu, 14 Sep 2023 12:26:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF94F1F74A;
 Thu, 14 Sep 2023 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694694410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZnU86ax0RlzW+jyt/o/Kb4nI7nTVIFu4STxjz/bG6ZE=;
 b=GLGjC4XSzeJUcsPP7cMq1Cnb2W9DZyO9qKkNapxq90XyBS0U2/MldmzVD1t0r2mVZVviL6
 pLH3H7C+BTm0Q5sjhziysONckUureMqHSIXbNE6GDNQEMATRIwOlmeYVhiYFrZ/EQzojgn
 ni1OeJiCd4VrusE9wN8iviGAqyzD9C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694694410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZnU86ax0RlzW+jyt/o/Kb4nI7nTVIFu4STxjz/bG6ZE=;
 b=BuSOfZfFuunDls/k/ZnGZYGe6upsIJKvyy+zlFGTtGxZ6RIuvIiaTCt5a3qwGa+eKh6Ypt
 dQlIoPE4Bw8POjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4CC4139DB;
 Thu, 14 Sep 2023 12:26:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QTsiKwr8AmWlMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Sep 2023 12:26:50 +0000
Date: Thu, 14 Sep 2023 14:26:49 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230914122649.GA28252@linux-uq9g>
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

this is the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-09-14:
Short summary of fixes pull:

 * radeon: Uninterruptible fence waiting
 * tests: Fix use-after-free bug
 * vkms: Revert hrtimer fix
The following changes since commit afaf2b38025ab327c85e218f36d1819e777d4d45:

  Merge tag 'drm-misc-next-fixes-2023-09-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-09-11 16:23:42 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-09-14

for you to fetch changes up to 139a27854bf5ce93ff9805f9f7683b88c13074dc:

  drm/tests: helpers: Avoid a driver uaf (2023-09-14 13:57:58 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * radeon: Uninterruptible fence waiting
 * tests: Fix use-after-free bug
 * vkms: Revert hrtimer fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/radeon: make fence wait in suballocator uninterrruptable

Maíra Canal (1):
      Revert "drm/vkms: Fix race-condition between the hrtimer and the atomic commit"

Thomas Hellström (1):
      drm/tests: helpers: Avoid a driver uaf

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c |  2 +-
 drivers/gpu/drm/drm_connector.c        |  2 ++
 drivers/gpu/drm/radeon/radeon_sa.c     |  2 +-
 drivers/gpu/drm/tiny/gm12u320.c        | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_composer.c   |  9 ++-------
 drivers/gpu/drm/vkms/vkms_crtc.c       |  9 ++++-----
 drivers/gpu/drm/vkms/vkms_drv.h        |  4 +---
 include/drm/drm_kunit_helpers.h        |  4 +++-
 8 files changed, 19 insertions(+), 23 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
