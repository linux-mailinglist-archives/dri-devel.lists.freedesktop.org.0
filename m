Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A83AA332
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 20:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B076E7DA;
	Wed, 16 Jun 2021 18:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094366E7D2;
 Wed, 16 Jun 2021 18:31:01 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FDD921A32;
 Wed, 16 Jun 2021 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623868259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SD241883/A8l3q7BUPDTLNeAP4VA2r7X8fyXELkXA/o=;
 b=vy7BYo+8daQBLJfctH7Z8uFkLeSvlGMZUU9ad+GG906cUWn6tPF4XFU678lT9x/pES0qJj
 AsAJ/eegvQbtlo/LUwDlsaEJLak3wSIUIGE5REmPK6SEfdQhWOC9ORj5C/1vD48Fx3AUY4
 qMsFg/Z5z7EmfTMJmJxxjAW/nVe4SJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623868259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SD241883/A8l3q7BUPDTLNeAP4VA2r7X8fyXELkXA/o=;
 b=zRYln5XFip8+oRh2ZjLhgfw9Y4b2yH6bS6DwG2eayeNXMXlcgzpGSIOI1wdM7kgf3ORc1v
 s/2yUHhTXdoq6lCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CC0A5118DD;
 Wed, 16 Jun 2021 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623868259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SD241883/A8l3q7BUPDTLNeAP4VA2r7X8fyXELkXA/o=;
 b=vy7BYo+8daQBLJfctH7Z8uFkLeSvlGMZUU9ad+GG906cUWn6tPF4XFU678lT9x/pES0qJj
 AsAJ/eegvQbtlo/LUwDlsaEJLak3wSIUIGE5REmPK6SEfdQhWOC9ORj5C/1vD48Fx3AUY4
 qMsFg/Z5z7EmfTMJmJxxjAW/nVe4SJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623868259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SD241883/A8l3q7BUPDTLNeAP4VA2r7X8fyXELkXA/o=;
 b=zRYln5XFip8+oRh2ZjLhgfw9Y4b2yH6bS6DwG2eayeNXMXlcgzpGSIOI1wdM7kgf3ORc1v
 s/2yUHhTXdoq6lCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8jWNMGJDymDqVwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Jun 2021 18:30:58 +0000
Date: Wed, 16 Jun 2021 20:30:57 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2021-06-16:
Short summary of fixes pull:

 * hyperv: advertise the correct formatmodifiers for its primary plane
 * dp_mst: VCPI fixes to make it work with StarTech hub

The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:

  Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-06-16

for you to fetch changes up to 3769e4c0af5b82c8ea21d037013cb9564dfaa51f:

  drm/dp_mst: Avoid to mess up payload table by ports in stale topology (2021-06-16 12:57:46 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

 * hyperv: advertise the correct formatmodifiers for its primary plane
 * dp_mst: VCPI fixes to make it work with StarTech hub

----------------------------------------------------------------
Pu Lehui (1):
      drm/hyperv: Fix unused const variable 'hyperv_modifiers'

Wayne Lin (2):
      drm/dp_mst: Do not set proposed vcpi directly
      drm/dp_mst: Avoid to mess up payload table by ports in stale topology

 drivers/gpu/drm/drm_dp_mst_topology.c       | 65 +++++++++++++++++------------
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
 2 files changed, 40 insertions(+), 27 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
