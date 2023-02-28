Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E86A553D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B2710E4A9;
	Tue, 28 Feb 2023 09:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284710E041;
 Tue, 28 Feb 2023 09:13:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25042219C4;
 Tue, 28 Feb 2023 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677575621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KJGcnMMEVVOjj8AsFsGS0EsSZqdeto3VnFbHDWdU+Fo=;
 b=IIIaT9+8WCJ/MIByKKl87hLnRWLZw2N5TPJHgZ2DdXlnM7yU5nDtcLZ6KxBLSlg4IaVVz4
 4IVks7x1wYZB/z9bvMPgCrFjADne9Sq9MAoKFTHebuiBnvCeMd/hB6F494KeLhwHC3y0L8
 jF80RtfKuBFlzFOXH5hFk8xyHZ4+Z3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677575621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KJGcnMMEVVOjj8AsFsGS0EsSZqdeto3VnFbHDWdU+Fo=;
 b=thc8XSWUFaL9p8Jq8gFqS4W4ezQWqGteTK6JERY/l6oUmEMPs2hhfHOu1Ej07hPSJ4B9TM
 c7Q2McRl/GoeebDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEB3F13440;
 Tue, 28 Feb 2023 09:13:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W11rNcTF/WOmLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 09:13:40 +0000
Date: Tue, 28 Feb 2023 10:13:39 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Y/3Fw1HjgPcplo+j@linux-uq9g>
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

here are 3 more patches from drm-misc-next-fixes. In case there's
no drm-next PR before -rc1, I'll cherrypick these changes into
drm-misc-fixes later.

Best regards
Thomas

drm-misc-next-fixes-2023-02-28:
Short summary of fixes pull:

Fixes uninitialized variables in fbdev error paths and reverts an
SHMEM-helper symbol back to being exported as GPL.
The following changes since commit 3fb1f62f80a1d249260db5ea9e22c51e52fab9ae:

  drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini() (2023-02-21 13:26:18 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-02-28

for you to fetch changes up to 047a754558d640eaa080fce3b22ca9f3d4e04626:

  drm/shmem-helper: Revert accidental non-GPL export (2023-02-28 09:45:56 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

Fixes uninitialized variables in fbdev error paths and reverts an
SHMEM-helper symbol back to being exported as GPL.

----------------------------------------------------------------
Asahi Lina (1):
      drm/shmem-helper: Revert accidental non-GPL export

Nathan Chancellor (1):
      drm: omapdrm: Do not use helper unininitialized in omap_fbdev_init()

Thomas Zimmermann (1):
      drm/msm: Fix possible uninitialized access in fbdev

 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 drivers/gpu/drm/msm/msm_fbdev.c        | 4 ++--
 drivers/gpu/drm/omapdrm/omap_fbdev.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
