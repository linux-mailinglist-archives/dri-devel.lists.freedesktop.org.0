Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CA787785
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C398C10E5A6;
	Thu, 24 Aug 2023 18:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F10A10E5A5;
 Thu, 24 Aug 2023 18:12:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBA601F88D;
 Thu, 24 Aug 2023 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692900763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=3TsU1yntOcLfQEdmbiYR6I1PAJVr0+hAEAzQVuCq110=;
 b=qU243DmJ0YBO43A96oM7G6JRgs/7w8T/V0YQQzAMakZ7Z2YdW9ZKptK3xPKjHpMn/8kXud
 WWAlqGicHaBtNVZYiCZb6vBfLYb/ovi58hjBFrSDQD0COp8btAClXsfoawGQUStXm9/nO1
 Lw35v4yUGRXY4IAxuzVOm97zcodwj/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692900763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=3TsU1yntOcLfQEdmbiYR6I1PAJVr0+hAEAzQVuCq110=;
 b=S7Ekwu92RNwInluegTV9grHsL8ya7gseEv+Ta+bPPLcPP0aQShsuzw1yK1sAbBFfvsSi7Q
 pxvohd3dpFMUZ/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58341132F2;
 Thu, 24 Aug 2023 18:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fELnE5ud52QXDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Aug 2023 18:12:43 +0000
Date: Thu, 24 Aug 2023 20:12:41 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230824181241.GA6386@linux-uq9g.hotspot.internet-for-guests.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

here is this week's PR for drm-misc-next. One of the patches is a
change to nouveau's UAPI.

Best regards
Thomas

drm-misc-next-fixes-2023-08-24:
Short summary of fixes pull:

 * gpuva: Cleanups

 * kunit: Documentation fixes

 * nouveau:
   * UAPI: Avoid implicit NO_PREFETCH flag
   * Scheduler fixes
   * Fix remap

 * ttm: Fix type conversion in tests
The following changes since commit ff065eaf5502384c0d0a3bd3a9459eb5eb0811e1:

  drm/ttm/tests: Require MMU when testing (2023-08-17 15:05:51 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-08-24

for you to fetch changes up to cdf4100eaa1f4107fcf7c95b5eccca96cca6c777:

  drm/gpuva_mgr: remove unused prev pointer in __drm_gpuva_sm_map() (2023-08-24 14:27:14 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * gpuva: Cleanups

 * kunit: Documentation fixes

 * nouveau:
   * UAPI: Avoid implicit NO_PREFETCH flag
   * Scheduler fixes
   * Fix remap

 * ttm: Fix type conversion in tests

----------------------------------------------------------------
Danilo Krummrich (4):
      drm/nouveau: sched: avoid job races between entities
      drm/nouveau: uvmm: fix unset region pointer on remap
      drm/nouveau: uapi: don't pass NO_PREFETCH flag implicitly
      drm/gpuva_mgr: remove unused prev pointer in __drm_gpuva_sm_map()

Karolina Stolarek (1):
      drm/ttm/tests: Fix type conversion in ttm_pool_test

Lee Jones (1):
      drm/tests/drm_kunit_helpers: Place correct function name in the comment header

 drivers/gpu/drm/drm_gpuva_mgr.c           | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_dma.c     |  7 +++++--
 drivers/gpu/drm/nouveau/nouveau_dma.h     |  8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_exec.c    | 19 ++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_gem.c     |  6 ++++--
 drivers/gpu/drm/nouveau/nouveau_sched.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c    |  1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c |  4 ++--
 include/uapi/drm/nouveau_drm.h            |  8 +++++++-
 10 files changed, 68 insertions(+), 19 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
