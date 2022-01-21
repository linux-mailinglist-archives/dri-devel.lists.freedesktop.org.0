Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A6495BE8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1210E974;
	Fri, 21 Jan 2022 08:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1CE10E974;
 Fri, 21 Jan 2022 08:27:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28C331F39D;
 Fri, 21 Jan 2022 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642753672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IVsNyGDkDZ86Ns2LmmJpLlVX2xtx72RPR3Ptz+iV1bk=;
 b=M1lIxLm+G9pXf68WnpTpJdAADDOB55W6JU28yRjGGaEzNPWxR0l93+Sn3JD42cW+YgumGE
 QLPjuXBsNkIfZIhcw6vnP5/jRIYn6CIO5sBTdgksa75u5HOmAvrHaXNOOymydGVg2rXfwT
 GISdpvVplODTAbZdUQhOGtSMt6ryaDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642753672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IVsNyGDkDZ86Ns2LmmJpLlVX2xtx72RPR3Ptz+iV1bk=;
 b=J39HSYdllEMyf7W1R+yyc3No7MteBBQHjKDPIg5uU1TYHer829wzf5XrYnveRLMoK+vjgn
 W91+RkyAAfkGkvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D57941348D;
 Fri, 21 Jan 2022 08:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yaUoM4du6mGVNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Jan 2022 08:27:51 +0000
Date: Fri, 21 Jan 2022 09:27:50 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Yepuhj+Ks+IyJ9Dp@linux-uq9g>
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

here's this week's PR for drm-misc-next-fixes. Probably the final PR
before the next -rc1.

Best regards
Thomas

drm-misc-next-fixes-2022-01-21:
 * vc4: Fix potential deadlock in DSI code
 * panel: Add orientation quirk for 1Netbook OneXPlayer
The following changes since commit 5d474cc501b90b82c182b5d00439eb6790a82e21:

  drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy (2022-01-14 14:43:02 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-01-21

for you to fetch changes up to d3cbc6e323c9299d10c8d2e4127c77c7d05d07b1:

  drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer (2022-01-19 16:31:29 +0100)

----------------------------------------------------------------
 * vc4: Fix potential deadlock in DSI code
 * panel: Add orientation quirk for 1Netbook OneXPlayer

----------------------------------------------------------------
Padmanabha Srinivasaiah (1):
      drm/vc4: Fix deadlock on DSI device attach error

Raymond Jay Golo (1):
      drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_dsi.c                  | 14 ++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
