Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E25687710
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EBC10E469;
	Thu,  2 Feb 2023 08:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D6D10E469;
 Thu,  2 Feb 2023 08:14:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4962C21B24;
 Thu,  2 Feb 2023 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675325649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i/VjC/bRzvZfT/XXO7wVxuKrPQCSdaohtOkf/xwsmAE=;
 b=0MSrGJ5TeSqPeCYm2h7GDCZpnVaq9JRDyXR9XJYTfifoFt1vWNtWT68Gl5QxaVwVhicyZ7
 FuMKwHLDxD9B/rrobHSyYyBjmmewqm9j8CtvNWqW7fwhjuGdMiEPEfaNY5I5jSqIeQ6fNj
 U6b0mEcmDdw2dLLQLM4BX/zJWtJdn20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675325649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i/VjC/bRzvZfT/XXO7wVxuKrPQCSdaohtOkf/xwsmAE=;
 b=tpIuRXnXlkBJdMI9kz9SFuzzAZa9iQJEAs/6zhE48bJJLiuzYHmx12nCkZWymLMJ6HetEf
 6TXcn03ZTbeommAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13935139D0;
 Thu,  2 Feb 2023 08:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X6PpA9Fw22MeGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Feb 2023 08:14:09 +0000
Date: Thu, 2 Feb 2023 09:14:07 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Y9twz2rqOP2+LjaT@linux-uq9g>
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

here's the first PR for drm-misc-next-fixes for this release cycle.

Best regards
Thomas

drm-misc-next-fixes-2023-02-02:
Short summary of fixes pull:

A number of simple fixes throughout the DRM codebase.
The following changes since commit aebd8f0c6f8280ba35bc989f4a9ea47469d3589a:

  Merge v6.2-rc6 into drm-next (2023-01-31 12:23:23 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-02-02

for you to fetch changes up to 84cc4c7aecc4c6a17ea1030c49199ad7dc0a6b55:

  drm/client: fix kernel-doc warning in drm_client.h (2023-02-01 16:32:35 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

A number of simple fixes throughout the DRM codebase.

----------------------------------------------------------------
Arnd Bergmann (2):
      accel: fix CONFIG_DRM dependencies
      accel/ivpu: avoid duplicate assignment

Dan Carpenter (1):
      drm/simpledrm: Fix an NULL vs IS_ERR() bug

Danilo Krummrich (1):
      dma-buf: actually set signaling bit for private stub fences

Randy Dunlap (1):
      drm/client: fix kernel-doc warning in drm_client.h

Rob Clark (1):
      drm/shmem: Cleanup drm_gem_shmem_create_with_handle()

 drivers/accel/Kconfig                  |  5 ++++-
 drivers/accel/ivpu/ivpu_drv.c          |  1 -
 drivers/dma-buf/dma-fence.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 13 ++++---------
 drivers/gpu/drm/tiny/simpledrm.c       |  4 ++--
 include/drm/drm_client.h               |  2 +-
 6 files changed, 12 insertions(+), 15 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
