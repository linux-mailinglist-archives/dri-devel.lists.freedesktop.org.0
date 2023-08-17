Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC377F783
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A852A10E481;
	Thu, 17 Aug 2023 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA6410E47D;
 Thu, 17 Aug 2023 13:18:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B55321861;
 Thu, 17 Aug 2023 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692278314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qdkYIc9zOoSqiWAoepaxMNZ/TiG1koylvzzRZW8kd/k=;
 b=bi6HF1EWl9tAIwsVH26Zlptldgb56C0hIbILLuChb364xpjAHn51MJgn5Xk5u4Jq6yGRKu
 wNLDtqeos6oNpMDHbDL4w1Wo4FzWdM0OF0TCskIg8TBw42ZxWeuB5P9nSFFfME+BvJnzMs
 fvhKJ7F8digtEThsh16B8VWJMxdTPBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692278314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=qdkYIc9zOoSqiWAoepaxMNZ/TiG1koylvzzRZW8kd/k=;
 b=dkZIk4Nv+oXU0hfR+nlK1I+PAEdYINgF7xMlKVSZMZYbXmnhS3vU/e18cfZUNjk1wy0ISK
 tRQd8VbCjveLSHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D0891392B;
 Thu, 17 Aug 2023 13:18:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L7uxDSoe3mS+egAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Aug 2023 13:18:34 +0000
Date: Thu, 17 Aug 2023 15:18:32 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230817131832.GA9361@linux-uq9g>
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

this is the PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2023-08-17:
Short summary of fixes pull:

 * Add MMU dependency to TTM unit tests
 * panel: Fix Innolux G156HCE-L01 LVDS clock
The following changes since commit a8b273a8fd9c88cee038ffdae05b7eca063b9622:

  Merge tag 'amd-drm-next-6.6-2023-08-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-08-15 13:37:49 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-08-17

for you to fetch changes up to ff065eaf5502384c0d0a3bd3a9459eb5eb0811e1:

  drm/ttm/tests: Require MMU when testing (2023-08-17 15:05:51 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * Add MMU dependency to TTM unit tests
 * panel: Fix Innolux G156HCE-L01 LVDS clock

----------------------------------------------------------------
Karolina Stolarek (1):
      drm/ttm/tests: Require MMU when testing

Luca Ceresoli (1):
      drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock

 drivers/gpu/drm/Kconfig              | 2 +-
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
