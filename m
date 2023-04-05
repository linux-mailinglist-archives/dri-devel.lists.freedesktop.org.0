Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E56D85FE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627AD10E35E;
	Wed,  5 Apr 2023 18:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFE310E35E;
 Wed,  5 Apr 2023 18:28:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7186E22704;
 Wed,  5 Apr 2023 18:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680719337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8wDv+yRA6FyGfq9aZg8pabEn71vQtUQ/xXxjhnBw+jk=;
 b=Qgkefk116vpQxypDdmotxblRzB6Mf8ewfIInvU3VbX58uA2E96/KmHbOSJ9pecyOEiROjt
 69gS1zu9Z8XrGX7OKdxpgsfEGOvLVSGtX4oXdfGWgPdYm7Aq5x1zSE/SMP8UCw63VszpDk
 eDr5/oGeocwzc8NR6RNkwBa/liWXPTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680719337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8wDv+yRA6FyGfq9aZg8pabEn71vQtUQ/xXxjhnBw+jk=;
 b=yTOLifE1L6ksbMJGrRrIOpkCUV8eJUsrDRXsSIH2M4+XebGrBhnglAGg54rSMgPnNysgdZ
 V1M49gpxU1RApjCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3228C13A31;
 Wed,  5 Apr 2023 18:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9sEbC+m9LWRzBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 18:28:57 +0000
Date: Wed, 5 Apr 2023 20:28:55 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230405182855.GA1551@linux-uq9g>
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

here's this week's PR for drm-misc-fixes. As requested, it comes
a day earlier than usual due to Easter holidays.

Best regards
Thomas

drm-misc-fixes-2023-04-05:
Short summary of fixes pull:

 * ivpu: DMA fence and suspend fixes
 * nouveau: Color-depth fixes
 * panfrost: Fix mmap error handling
The following changes since commit 25bbe844ef5c4fb4d7d8dcaa0080f922b7cd3a16:

  drm: test: Fix 32-bit issue in drm_buddy_test (2023-03-29 17:14:15 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-04-05

for you to fetch changes up to 0ec8671837a61d841462179686c5819d951d3b10:

  accel/ivpu: Fix S3 system suspend when not idle (2023-04-05 09:07:26 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * ivpu: DMA fence and suspend fixes
 * nouveau: Color-depth fixes
 * panfrost: Fix mmap error handling

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path

Jacek Lawrynowicz (1):
      accel/ivpu: Fix S3 system suspend when not idle

Karol Herbst (1):
      drm/nouveau/disp: Support more modes by checking with lower bpc

Karol Wachowski (1):
      accel/ivpu: Add dma fence to command buffers only

 drivers/accel/ivpu/ivpu_job.c           | 18 +++++++-----------
 drivers/accel/ivpu/ivpu_pm.c            | 26 +++++++++++---------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 +++++---
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  1 +
 5 files changed, 56 insertions(+), 29 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
