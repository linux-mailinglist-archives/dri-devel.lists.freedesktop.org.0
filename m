Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC625EF7E8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0DC10EAAA;
	Thu, 29 Sep 2022 14:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8A10EAAD;
 Thu, 29 Sep 2022 14:43:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C80851F855;
 Thu, 29 Sep 2022 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664462623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vNZxJO59vQpf9H0uoOd8/7jNIlIANXDFGLL/tnu+Dns=;
 b=CCayV1Nxx2PLZe8WoHMV4max0gu184rc1tzkkKO10Co6RpD2TnHLl9OmfOjL17hNVvduHr
 EkVIkQthcOPcRS8678OqxFmIkIzfYGDm35v0spp900gRF+snSEdxs0y79xWmWK8OmBZuQo
 AihOshHayoieSYFSRNMueUbE4yXq//Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664462623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vNZxJO59vQpf9H0uoOd8/7jNIlIANXDFGLL/tnu+Dns=;
 b=EjQIycavrL5uNnyijVKPTlk1ujm8QPFITTX5fZGTcFk5ULx6LeNDNQc0bO0vgVOiEhTjAl
 bHXV/HQNBCZklqAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90A2313A71;
 Thu, 29 Sep 2022 14:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yyBxIh+vNWPGSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Sep 2022 14:43:43 +0000
Date: Thu, 29 Sep 2022 16:43:42 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YzWvHhaqHhYirn4L@linux-uq9g>
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

this is the PR for drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2022-09-29:
Short summary of fixes pull:

 * bridge/analogix: Revert earlier suspend fix
 * bridge/lt8912b: Fix corrupt display output
The following changes since commit d8a79c03054911c375a2252627a429c9bc4615b6:

  drm/hisilicon: Add depends on MMU (2022-09-20 11:15:09 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-09-29

for you to fetch changes up to cc62d98bd56d45de4531844ca23913a15136c05b:

  Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time" (2022-09-23 07:15:18 -0700)

----------------------------------------------------------------
Short summary of fixes pull:

 * bridge/analogix: Revert earlier suspend fix
 * bridge/lt8912b: Fix corrupt display output

----------------------------------------------------------------
Brian Norris (1):
      Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"

Francesco Dolcini (1):
      drm/bridge: lt8912b: fix corrupted image output

Philippe Schenker (2):
      drm/bridge: lt8912b: add vsync hsync
      drm/bridge: lt8912b: set hdmi or dvi mode

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 -------------
 drivers/gpu/drm/bridge/lontium-lt8912b.c           | 13 +++++++++++--
 2 files changed, 11 insertions(+), 15 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
