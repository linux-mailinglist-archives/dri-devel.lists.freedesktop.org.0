Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9297B9C21
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2310E1CA;
	Thu,  5 Oct 2023 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0205310E1C6;
 Thu,  5 Oct 2023 09:26:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B953F1F8B3;
 Thu,  5 Oct 2023 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696497993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=lOH6BAbIYvDpsAUhkEh7WAIIMF115XOs+4uZkzmnSs0=;
 b=g91j30i0T8kcpWuKw+33QEjiKI94XpRd4KFcPUhMShoIt6T7b9b1zM68We2BbbFiWu/vVF
 841gemAvGx1Qn+zOZEYDtxLoJ0iszaLVICFhG5b2PUCM3DzfswZnZqlmsXkMhoP3nKPrSy
 eG5KvB6OkxugRSO4w1VwyxTL2pvbnhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696497993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=lOH6BAbIYvDpsAUhkEh7WAIIMF115XOs+4uZkzmnSs0=;
 b=sy19SUTGtpzS778N3EqIY7BOrtT+m0tvhLO5j8rL0x5abfItm2G+gIZY2gN5Amrusxd2ua
 w4zLABgfRhXbGCDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D8C2139C2;
 Thu,  5 Oct 2023 09:26:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kxvQHUmBHmVTfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 09:26:33 +0000
Date: Thu, 5 Oct 2023 11:26:32 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20231005092632.GA17332@linux-uq9g>
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

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-10-05:
Short summary of fixes pull:

 * test: Fix kunit release
 * panel-orientation: Add quirk for One Mix 25
 * nouveau:
   * Report IB limit via getparams
   * Replace some magic numbers with constants
   * Clean up
The following changes since commit 645d694559cab36fe6a57c717efcfa27d9321396:

  accel/ivpu: Use cached buffers for FW loading (2023-09-27 07:40:43 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-10-05

for you to fetch changes up to d59e75eef52d89201aaf5342a3ac23ddf3e9b112:

  drm/nouveau: exec: report max pushs through getparam (2023-10-04 00:10:18 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * test: Fix kunit release
 * panel-orientation: Add quirk for One Mix 25
 * nouveau:
   * Report IB limit via getparams
   * Replace some magic numbers with constants
   * Clean up

----------------------------------------------------------------
Arthur Grillo (1):
      drm/tests: Fix kunit_release_action ctx argument

Danilo Krummrich (3):
      drm/nouveau: chan: use struct nvif_mclass
      drm/nouveau: chan: use channel class definitions
      drm/nouveau: exec: report max pushs through getparam

Kai Uwe Broulik (1):
      drm: panel-orientation-quirks: Add quirk for One Mix 2S

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c        | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c         | 15 +++++++--------
 drivers/gpu/drm/nouveau/nouveau_dma.h          |  3 +++
 drivers/gpu/drm/nouveau/nouveau_exec.c         |  7 ++++---
 drivers/gpu/drm/nouveau/nouveau_exec.h         | 10 ++++++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c      |  2 +-
 include/uapi/drm/nouveau_drm.h                 | 10 ++++++++++
 8 files changed, 72 insertions(+), 12 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
