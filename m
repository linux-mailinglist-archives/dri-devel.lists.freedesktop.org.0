Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CF403E6E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F7A6E21D;
	Wed,  8 Sep 2021 17:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0346E21D;
 Wed,  8 Sep 2021 17:44:06 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03D6220172;
 Wed,  8 Sep 2021 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631123045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sCCMRd9tDuFNVUsYVAtVGgAkaAK5OvQwhj+u0zzTCLY=;
 b=1+rmIiAAZFI924lYlYRrIGgG0oxkzCxuwpFfX6bzv4BKS3CA2CEmirNSEa2IdQRNvo9kLW
 fCRezg/sM9XmYjhVnZ2M1DOjsh5qY+35wjSPwN5kiloGEWnESVad30+v82tdC1z3xg+nn1
 rh1tt3ZjyPsqxpKwmbx9w+YEQBe6FiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631123045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sCCMRd9tDuFNVUsYVAtVGgAkaAK5OvQwhj+u0zzTCLY=;
 b=gRuYCe0PVxz0SZ2PghOnwE0OpPlRsEm5TWnXchBzoDzukDpLw+mEo5zZfJdxkM+WKJbICo
 8MKBAicQkTKXrPBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B468813A9F;
 Wed,  8 Sep 2021 17:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id CdC3KmT2OGFpXAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Sep 2021 17:44:04 +0000
Date: Wed, 8 Sep 2021 19:44:03 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <YTj2Y0MKu51CZdbW@linux-uq9g.fritz.box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-fixes. One patch is a potential deadlock
in TTM, the other enables an additional plane in kmb. I'm slightly unhappy
that the latter one ended up in -fixes as it's not a bugfix AFAICT.

Best regards
Thomas

drm-misc-fixes-2021-09-08:
Short summary of fixes pull:

 * kmb: Emable second plane
 * ttm: Fix potential deadlock during swap

The following changes since commit fa0b1ef5f7a694f48e00804a391245f3471aa155:

  drm: Copy drm_wait_vblank to user before returning (2021-08-17 13:56:03 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-09-08

for you to fetch changes up to c8704b7ec182f9293e6a994310c7d4203428cdfb:

  drm/kmb: Enable alpha blended second plane (2021-09-07 10:10:30 -0700)

----------------------------------------------------------------
Short summary of fixes pull:

 * kmb: Emable second plane
 * ttm: Fix potential deadlock during swap

----------------------------------------------------------------
Edmund Dea (1):
      drm/kmb: Enable alpha blended second plane

xinhui pan (1):
      drm/ttm: Fix a deadlock if the target BO is not idle during swap

 drivers/gpu/drm/kmb/kmb_drv.c   |  8 ++--
 drivers/gpu/drm/kmb/kmb_drv.h   |  5 +++
 drivers/gpu/drm/kmb/kmb_plane.c | 81 ++++++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/kmb/kmb_plane.h |  5 ++-
 drivers/gpu/drm/kmb/kmb_regs.h  |  3 ++
 drivers/gpu/drm/ttm/ttm_bo.c    |  6 +--
 6 files changed, 90 insertions(+), 18 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
