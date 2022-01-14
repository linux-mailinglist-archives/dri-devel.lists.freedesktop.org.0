Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9148EB9F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FC310E457;
	Fri, 14 Jan 2022 14:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE8F10E457;
 Fri, 14 Jan 2022 14:25:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6542A1F38F;
 Fri, 14 Jan 2022 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642170301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kMa4tcHPdUVoPVHnNH087X7fOo45Y+uaZcfGsJ8XcVA=;
 b=fSxzK0MJPhKjUi7/wOSyyDRs6V04IAzZTdzK9VrCm892aaQGelfeAX5PAtFqBq3cYRScnu
 JIKrMNWYE56Z83oSb0046+8Pl3Acol1UjlFf9PRvK+eiQ0kjP4dqCuwltgT6763qSX87L+
 bjo8YH86eYdlGN2U8GqtsHcUR9vOJ28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642170301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kMa4tcHPdUVoPVHnNH087X7fOo45Y+uaZcfGsJ8XcVA=;
 b=tMB9h39vA0oVW0cDoPTrWodhyo4PVBcnKQZftp1cxeikizPZLV8g6GSqh+j58gel2TmIy3
 bzd7XFoI0KpLDlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1830813B7F;
 Fri, 14 Jan 2022 14:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MeFYBL2H4WEJMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jan 2022 14:25:01 +0000
Date: Fri, 14 Jan 2022 15:24:59 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YeGHu7qU92pjuQOn@linux-uq9g>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here are two more fixes for this week. I cherry-picked both from 
drm-misc-next.

Best regards
Thomas

drm-misc-next-fixes-2022-01-14:
 * atomic helpers: Fix error messages
 * mipi-dbi: Fix buffer mapping
The following changes since commit 5da8b49de472c1da8658466d4f63ef8d9251a819:

  dt-bindings: display: bridge: lvds-codec: Fix duplicate key (2021-12-22 14:02:04 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-01-14

for you to fetch changes up to 5d474cc501b90b82c182b5d00439eb6790a82e21:

  drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy (2022-01-14 14:43:02 +0100)

----------------------------------------------------------------
 * atomic helpers: Fix error messages
 * mipi-dbi: Fix buffer mapping

----------------------------------------------------------------
Claudio Suarez (1):
      drm: fix error found in some cases after the patch d1af5cd86997

Liu Ying (1):
      drm/atomic: Check new_crtc_state->active to determine if CRTC needs disable in self refresh mode

Thomas Zimmermann (1):
      drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy

 drivers/gpu/drm/drm_atomic_helper.c | 14 +++++++-------
 drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
