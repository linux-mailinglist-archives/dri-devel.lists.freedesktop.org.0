Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863B3B84AF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5976E9D9;
	Wed, 30 Jun 2021 14:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABEC6E9D9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 14:07:02 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE3712273C;
 Wed, 30 Jun 2021 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=cKrdQ0t/cCz9S3FLDLLdUf34pRVoyfOsZ2YE0CMZDjQUrSs8IqVMXUFA85mX40RoXlNEcP
 UbSNTB/hh7LXTySGbbQoG9rzqF0rn22VgCsOxUgOimQZnoH9xh6yvkrmtCCGujE/6kjT+U
 R8o9KO60Jg7Tz+NyQWxcnX2XZh1PePs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=al3lmBcppoBcNjPexB43qGFzKoQkiAjBfoX9UlnZyYQ9vABa0shM91UwDd+K0fbc+jjAHC
 j3z766cG79l5hkBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C3593118DD;
 Wed, 30 Jun 2021 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=cKrdQ0t/cCz9S3FLDLLdUf34pRVoyfOsZ2YE0CMZDjQUrSs8IqVMXUFA85mX40RoXlNEcP
 UbSNTB/hh7LXTySGbbQoG9rzqF0rn22VgCsOxUgOimQZnoH9xh6yvkrmtCCGujE/6kjT+U
 R8o9KO60Jg7Tz+NyQWxcnX2XZh1PePs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=phGrejQ0jDKrDlJ00AqTFtkuLpapOdSDZHKKMH8fqu0=;
 b=al3lmBcppoBcNjPexB43qGFzKoQkiAjBfoX9UlnZyYQ9vABa0shM91UwDd+K0fbc+jjAHC
 j3z766cG79l5hkBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ygLPLoR63GBNDQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 14:07:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/bochs: Move to tiny/ and simplify
Date: Wed, 30 Jun 2021 16:06:56 +0200
Message-Id: <20210630140659.17623-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the bochs driver to tiny/ and simplify the clean-up code. Also
update GEM VRAM helpers accordingly.

Thomas Zimmermann (3):
  drm/bochs: Move to tiny/
  drm/bochs: Use managed initialization for GEM VRAM helpers
  drm/vram-helper: Unexport drm_vram_helper_{alloc,release}_mm()

 MAINTAINERS                           |   2 +-
 drivers/gpu/drm/Kconfig               |   2 -
 drivers/gpu/drm/Makefile              |   1 -
 drivers/gpu/drm/bochs/Kconfig         |  11 -
 drivers/gpu/drm/bochs/Makefile        |   4 -
 drivers/gpu/drm/bochs/bochs.h         |  98 ----
 drivers/gpu/drm/bochs/bochs_drv.c     | 205 -------
 drivers/gpu/drm/bochs/bochs_hw.c      | 323 -----------
 drivers/gpu/drm/bochs/bochs_kms.c     | 178 -------
 drivers/gpu/drm/bochs/bochs_mm.c      |  24 -
 drivers/gpu/drm/drm_gem_vram_helper.c |   9 +-
 drivers/gpu/drm/tiny/Kconfig          |  13 +
 drivers/gpu/drm/tiny/Makefile         |   1 +
 drivers/gpu/drm/tiny/bochs.c          | 735 ++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |   4 -
 15 files changed, 753 insertions(+), 857 deletions(-)
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/tiny/bochs.c

--
2.32.0

