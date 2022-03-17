Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644334DC3F6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207910EB6D;
	Thu, 17 Mar 2022 10:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC0110EB6C;
 Thu, 17 Mar 2022 10:29:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D20A1F37F;
 Thu, 17 Mar 2022 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647512948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IMsQ8BSpBkttG8XFSFTOSMZYmITWnGsxDMhPb1IpEE0=;
 b=yUgTtHT9WnRm1SF7f4LCo5hfxZvDkGAR1n9NAmXiXLPnMeEPPpzk9QXUi9PyDb/V/wwmsT
 vSCrhUa1g/q+Y09GqOuSOU0LhRxeM8I8t19idI7Qr6ns3mZVfzSyhbVvQpoeoVT2LAHM1v
 a1nIejgxpxLKEncXC+p4VHenbTY26TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647512948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IMsQ8BSpBkttG8XFSFTOSMZYmITWnGsxDMhPb1IpEE0=;
 b=Dc5CoA883A2kiOVK1fh620e91HxSmpzQwEmKZU7BD8LFG+jjxShjLzFKARsRIVgA9CrGsS
 YijSdqIeqIHYR/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6A3213ACB;
 Thu, 17 Mar 2022 10:29:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n5xdM3MNM2IlPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Mar 2022 10:29:07 +0000
Date: Thu, 17 Mar 2022 11:29:06 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YjMNcqOuDFDoe+EN@linux-uq9g>
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

here's the PR for drm-misc-fixes for this week. Besides the fixes, it
contains a backmerge of drm/drm-fixes to get required Kconfig changes
from upstream.

Best regards
Thomas

drm-misc-fixes-2022-03-17:
 * drm/imx: Don't test bus flags in atomic check
 * drm/mgag200: Fix PLL setup on some models
 * drm/panel: Fix bpp settings on Innolux G070Y2-L01; Fix DRM_PANEL_EDP
   Kconfig dependencies
The following changes since commit 09688c0166e76ce2fb85e86b9d99be8b0084cdf9:

  Linux 5.17-rc8 (2022-03-13 13:23:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-03-17

for you to fetch changes up to 3c3384050d68570f9de0fec9e58824decfefba7a:

  drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS (2022-03-17 11:07:57 +0100)

----------------------------------------------------------------
 * drm/imx: Don't test bus flags in atomic check
 * drm/mgag200: Fix PLL setup on some models
 * drm/panel: Fix bpp settings on Innolux G070Y2-L01; Fix DRM_PANEL_EDP
   Kconfig dependencies

----------------------------------------------------------------
Christoph Niedermaier (1):
      drm/imx: parallel-display: Remove bus flags check in imx_pd_bridge_atomic_check()

Jocelyn Falempe (1):
      drm/mgag200: Fix PLL setup for g200wb and g200ew

Marek Vasut (1):
      drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings

Thomas Zimmermann (2):
      Merge drm/drm-fixes into drm-misc-fixes
      drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS

 drivers/gpu/drm/bridge/Kconfig         | 2 +-
 drivers/gpu/drm/imx/parallel-display.c | 8 --------
 drivers/gpu/drm/mgag200/mgag200_pll.c  | 6 +++---
 drivers/gpu/drm/panel/Kconfig          | 1 +
 drivers/gpu/drm/panel/panel-simple.c   | 2 +-
 5 files changed, 6 insertions(+), 13 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
