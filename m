Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7216991CB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E439310ED23;
	Thu, 16 Feb 2023 10:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E1F10ED1C;
 Thu, 16 Feb 2023 10:39:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50E202231E;
 Thu, 16 Feb 2023 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676543970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cOJbDqyVM4UkjpAdBQqHri1wUhQAVEtatgbpQX2k24o=;
 b=j0/J/doFQigMYkFcuxrqq4WxVq0MTlFDosIOgEkNtSsUa/s1gWhV8gtNgDW2eYhPkHI0vU
 wA3YKmdUoEOyVQ7XpFMONjjUx2yDjaN8csGioBUq0i2q5K/Eu+6obcslP/eceDSIhJvxlx
 fZXcxrhD6FZjEkRWx4M0AuFHh3SNnW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676543970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cOJbDqyVM4UkjpAdBQqHri1wUhQAVEtatgbpQX2k24o=;
 b=KxdPV9o5cUyK/06KXlJ+yjknJWWKi2GJAxpTOwzR5uaXvGrNxJnLpXYIaWCy8rlYnyqbef
 fiyhVCn4gbPj9SCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 196E3139B5;
 Thu, 16 Feb 2023 10:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V5RJBeIH7mPhSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Feb 2023 10:39:30 +0000
Date: Thu, 16 Feb 2023 11:39:28 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Y+4H4C4E6cZcM9+J@linux-uq9g>
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

here's the PR for drm-misc-next-fixes for this week.

Best regards
Thomas

drm-misc-next-fixes-2023-02-16:
Short summary of fixes pull:

Contains fixes for DP MST and the panel orientation on an Lenovo
IdeaPad model.
The following changes since commit 467fbc77f673ecc9dcf4e58ffc1fa426a22df7fd:

  dt-bindings: display: panel: visionox,vtdr6130: add missing reg property (2023-02-09 09:28:31 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-02-16

for you to fetch changes up to 38b2d8efd03d2e56431b611e3523f0158306451d:

  drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5 (2023-02-15 10:46:05 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

Contains fixes for DP MST and the panel orientation on an Lenovo
IdeaPad model.

----------------------------------------------------------------
Darrell Kavanagh (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5

Imre Deak (4):
      drm/i915/dp_mst: Add the MST topology state for modesetted CRTCs
      drm/display/dp_mst: Handle old/new payload states in drm_dp_remove_payload()
      drm/display/dp_mst: Add drm_atomic_get_old_mst_topology_state()
      drm/i915/dp_mst: Fix payload removal during output disabling

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 59 ++++++++++++-----
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  6 ++
 drivers/gpu/drm/i915/display/intel_display.c       |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 75 ++++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |  4 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
 include/drm/display/drm_dp_mst_helper.h            |  6 +-
 8 files changed, 135 insertions(+), 23 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
