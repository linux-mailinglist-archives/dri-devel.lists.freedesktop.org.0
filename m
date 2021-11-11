Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B744D363
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 09:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8D06E9EE;
	Thu, 11 Nov 2021 08:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451136E9D4;
 Thu, 11 Nov 2021 08:48:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F96A21B2B;
 Thu, 11 Nov 2021 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636620524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=po9C3M3KbuxkTrJ8RdbbNvKns+qCxEzjBqaykTrhByU=;
 b=lLzOuUBy0qPFAcg+ukJsKAMKmpbuRz53hFC4Iw52jdkazu3ZgZLJ2oSA1tRiqU63GdYXbO
 KbPUfrqMct+PGSgbmi4P5gU2zXZoowb2BT/TwJdvf61GZ1cD4V1Lzay/wptATmd2H5Ebsh
 49BgFqumWOi8YnkovZ0GqG64dy+9Sa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636620524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=po9C3M3KbuxkTrJ8RdbbNvKns+qCxEzjBqaykTrhByU=;
 b=frGpslBk4cE511VS5uaiuAmYSr32Y4LfkwHk4LTCohxzz9X0+4Z7a1EJW+tZWvMFheYaUW
 +C8DZIAlEG50qPDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53FEB13D4A;
 Thu, 11 Nov 2021 08:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i6ejE+zYjGFQUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Nov 2021 08:48:44 +0000
Date: Thu, 11 Nov 2021 09:48:42 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YYzY6jeox9EeI15i@linux-uq9g.fritz.box>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-fixes. I'm sending it as Maarten and
Maxime are both on vacation this week.

Best regards
Thomas

drm-misc-fixes-2021-11-11:
 * dma-buf: name_lock fixes
 * prime: Keep object ref during mmap
 * nouveau: Fix a refcount issue; Fix device removal; Protect client
   list with dedicated mutex; Fix address CE0 address calculation
 * ttm: Fix race condition during BO eviction
The following changes since commit 61b1d445f3bfe4c3ba4335ceeb7e8ba688fd31e2:

  drm: panel-orientation-quirks: Add quirk for GPD Win3 (2021-10-26 20:57:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-11-11

for you to fetch changes up to 7120a447c7fe37a123ab7a63afefdbf0787b9002:

  drm/ttm: Double check mem_type of BO while eviction (2021-11-11 09:08:08 +0100)

----------------------------------------------------------------
 * dma-buf: name_lock fixes
 * prime: Keep object ref during mmap
 * nouveau: Fix a refcount issue; Fix device removal; Protect client
   list with dedicated mutex; Fix address CE0 address calculation
 * ttm: Fix race condition during BO eviction

----------------------------------------------------------------
Anand K Mistry (1):
      drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap

Ben Skeggs (1):
      ce/gf100: fix incorrect CE0 address calculation on some GPUs

Chenyuan Mi (1):
      drm/nouveau/svm: Fix refcount leak bug and missing check against null bug

Guangming Cao (1):
      dma-buf: acquire name lock before read/write dma_buf.name

Jeremy Cline (3):
      drm/nouveau: use drm_dev_unplug() during device removal
      drm/nouveau: Add a dedicated mutex for the clients list
      drm/nouveau: clean up all clients on device removal

xinhui pan (1):
      drm/ttm: Double check mem_type of BO while eviction

 drivers/dma-buf/dma-buf.c                         |  3 ++
 drivers/gpu/drm/drm_prime.c                       |  6 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c             | 42 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_drv.h             |  5 +++
 drivers/gpu/drm/nouveau/nouveau_svm.c             |  4 +++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                      |  3 +-
 8 files changed, 57 insertions(+), 11 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev
