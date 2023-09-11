Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75979A886
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AB610E300;
	Mon, 11 Sep 2023 14:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70A110E301;
 Mon, 11 Sep 2023 14:19:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 553E72183B;
 Mon, 11 Sep 2023 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694441957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q1opA2wGFDnwe3lA96xWUY1eliPsOV8Yh+R3BdzMEXg=;
 b=Zhxj6xW/RSpd+Jdj8B98DdfC6dGnt40WV6Axk3GgCITd5WqDLs24+NxQ8phS1DtR1N5lty
 VeiV+jUYTQD2JQh63CPFz56jmLwBbnmuKhR7OwKHMDKW+Iidx1YMw5bMG47Gvm2gs05ADB
 LnH1XbZsrX0KoSxys19920R4Xgicfho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694441957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q1opA2wGFDnwe3lA96xWUY1eliPsOV8Yh+R3BdzMEXg=;
 b=nTjLtK5HsD/3aJsfw41rmuqaF7wD6En+zp6HgGihFxudOEMu87+VE0cNjvU8IYNR5Feio4
 C/+llTBjcFuHO7Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19CA9139CC;
 Mon, 11 Sep 2023 14:19:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E2RvBeUh/2QNRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Sep 2023 14:19:17 +0000
Date: Mon, 11 Sep 2023 16:19:15 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230911141915.GA983@linux-uq9g>
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

here are two more fixes that got stuck in drm-misc-next-fixes. As
discussed on IRC, they should go directly into drm-fixes.

Best regards
Thomas

drm-misc-next-fixes-2023-09-11:
Short summary of fixes pull:

 * nouveau: Lockdep workaround
 * fbdev/g364fb: Build fix
The following changes since commit 978474dc8278f661930e02e08d292a45a45fa01a:

  drm/nouveau: fence: fix undefined fence state after emit (2023-08-31 00:46:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-09-11

for you to fetch changes up to d20b484c674d2eae816978a98fa38b4054aeca3b:

  drm/drm_exec: Work around a WW mutex lockdep oddity (2023-09-07 10:30:12 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * nouveau: Lockdep workaround
 * fbdev/g364fb: Build fix

----------------------------------------------------------------
Sudip Mukherjee (1):
      fbdev/g364fb: fix build failure with mips

Thomas Hellström (1):
      drm/drm_exec: Work around a WW mutex lockdep oddity

 drivers/gpu/drm/drm_exec.c   |  2 +-
 drivers/video/fbdev/g364fb.c |  2 +-
 include/drm/drm_exec.h       | 35 +++++++++++++++++++++++++++++++----
 3 files changed, 33 insertions(+), 6 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
