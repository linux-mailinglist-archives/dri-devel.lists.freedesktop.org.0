Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED6F575062
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 16:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB2510E6F5;
	Thu, 14 Jul 2022 14:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 19723 seconds by postgrey-1.36 at gabe;
 Thu, 14 Jul 2022 14:09:08 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061510F80B;
 Thu, 14 Jul 2022 14:09:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40A39339DC;
 Thu, 14 Jul 2022 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657807747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=idBclwFhT9yaZq5DPBuXRuFcNkagk3sEM66QAkYG1Ik=;
 b=P/oEcyLI4H7NCqcpHSTDrfQNw8sj2a6A041StmFjsFwFDwM93EgtitxJxTG2Weesotxo2K
 l9nYAB3nCKc/a4SpRN8A7xi+GR+Nozcd8hOf91pBYblwFI7AZi/e4QhvlHSaLEQ9XkigHm
 0dFjgXLCeYcAdNTddp6ItOE/UPLK6xE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657807747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=idBclwFhT9yaZq5DPBuXRuFcNkagk3sEM66QAkYG1Ik=;
 b=+nCAgRlyPUgadBIZ+MBtRCC7Hb5u0Z/GFchClmzoeMX5dekso0Nv1vslH45AuuyWtpJZac
 p3uYTs5BLex5xaAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B8D133A6;
 Thu, 14 Jul 2022 14:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 340pO4Ij0GLXKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 14:09:06 +0000
Date: Thu, 14 Jul 2022 16:09:05 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YtAjgcWC1zkNOGWa@linux-uq9g>
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

here's the first PR for drm-misc-next-fixes for v5.20.

Best regards
Thomas

drm-misc-next-fixes-2022-07-14:
Short summary of fixes:

 - dma-buf: revert change to fence handling
 - mgag200: fix PCI register initialization
The following changes since commit 0180290abb5ce5c870f84a00ffeda5802f641dce:

  Merge tag 'topic/nouveau-misc-2022-07-13-1' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-13 14:27:12 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-07-14

for you to fetch changes up to 7d09c7606346db9a48b62b4e02454a6b8f323043:

  drm/mgag200: Don't read-back PCI option register before writing (2022-07-14 15:14:45 +0200)

----------------------------------------------------------------
Short summary of fixes:

 - dma-buf: revert change to fence handling
 - mgag200: fix PCI register initialization

----------------------------------------------------------------
Christian König (1):
      dma-buf: revert "return only unsignaled fences in dma_fence_unwrap_for_each v3"

Thomas Zimmermann (2):
      Merge drm/drm-next into drm-misc-next-fixes
      drm/mgag200: Don't read-back PCI option register before writing

 drivers/dma-buf/dma-fence-unwrap.c    | 3 ++-
 drivers/gpu/drm/mgag200/mgag200_drv.c | 6 ------
 include/linux/dma-fence-unwrap.h      | 6 +-----
 3 files changed, 3 insertions(+), 12 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
