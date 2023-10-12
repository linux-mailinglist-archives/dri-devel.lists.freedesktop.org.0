Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF527C6C1D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142410E4B1;
	Thu, 12 Oct 2023 11:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B0010E4AD;
 Thu, 12 Oct 2023 11:16:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C0E421860;
 Thu, 12 Oct 2023 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697109400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xLrDOJhqj12zmtZB80LdWbFDlRd0eSXCC1KQO4sl/k8=;
 b=BxcJDfL4e92C3J0Xb5Ye1yElkxrXNTVfHZDRLIP+jHqADi2ei0tFjMaVD4jRSOkk9pAFVo
 LqF+9YMoPLtw/GfScCB+bGkZ6tbunDtJrq2NC2skbEaKUNSqKvQo0KzF9MSn81Mi/A66hV
 U49mN/yy0q1pj0yzfJii0zNynEpkhtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697109400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xLrDOJhqj12zmtZB80LdWbFDlRd0eSXCC1KQO4sl/k8=;
 b=OQC/pC9yoBm/Abm9TeJQhVtD1z87agtcF1dAAM2PT76hvnvqsf1P1z3ZnBNfTC1YmoF4W/
 2wyuMVfSspM2WyCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C33DD139ED;
 Thu, 12 Oct 2023 11:16:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6I7KLpfVJ2VjKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 11:16:39 +0000
Date: Thu, 12 Oct 2023 13:16:38 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20231012111638.GA25037@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.60
X-Spamd-Result: default: False [-6.60 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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

here's the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-10-12:
Short summary of fixes pull:

 * atomic-helper: Relax checks for unregistered connectors
 * dma-buf: Work around race condition when retrieving fence timestamp
 * gem: Avoid OOB access in BO memory range
 * panel:
   * boe-tv101wun-ml6: Fix flickering
 * simpledrm: Fix error output
 * vwmgfx:
   * Fix size calculation in texture-state code
   * Ref GEM BOs in surfaces
The following changes since commit d59e75eef52d89201aaf5342a3ac23ddf3e9b112:

  drm/nouveau: exec: report max pushs through getparam (2023-10-04 00:10:18 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-10-12

for you to fetch changes up to c1165df2be2fffe3adeeaa68f4ee4325108c5e4e:

  drm/tiny: correctly print `struct resource *` on error (2023-10-12 10:57:07 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * atomic-helper: Relax checks for unregistered connectors
 * dma-buf: Work around race condition when retrieving fence timestamp
 * gem: Avoid OOB access in BO memory range
 * panel:
   * boe-tv101wun-ml6: Fix flickering
 * simpledrm: Fix error output
 * vwmgfx:
   * Fix size calculation in texture-state code
   * Ref GEM BOs in surfaces

----------------------------------------------------------------
Christian König (1):
      dma-buf: add dma_fence_timestamp helper

Joey Gouly (1):
      drm/tiny: correctly print `struct resource *` on error

Konstantin Meskhidze (1):
      drm/vmwgfx: fix typo of sizeof argument

Matthew Wilcox (Oracle) (1):
      drm: Do not overrun array in drm_gem_get_pages()

Ruihai Zhou (1):
      drm/panel: boe-tv101wum-nl6: Completely pull GPW to VGL before TP term

Simon Ser (1):
      drm/atomic-helper: relax unregistered connector check

Zack Rusin (1):
      drm/vmwgfx: Keep a gem reference to user bos in surfaces

 drivers/dma-buf/dma-fence-unwrap.c             | 13 ++++-------
 drivers/dma-buf/sync_file.c                    |  9 +++-----
 drivers/gpu/drm/drm_atomic_helper.c            | 17 ++++++++++----
 drivers/gpu/drm/drm_gem.c                      |  6 +++--
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  4 +---
 drivers/gpu/drm/scheduler/sched_main.c         |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c               |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c             |  7 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h             | 17 +++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c        |  6 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h            |  4 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        | 12 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c            | 18 ++++++++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c            |  6 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c       | 12 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c         |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c        | 31 ++++++++++----------------
 include/linux/dma-fence.h                      | 19 ++++++++++++++++
 19 files changed, 115 insertions(+), 76 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
