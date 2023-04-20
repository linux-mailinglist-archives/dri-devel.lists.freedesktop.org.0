Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8B6E8CC7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F39E10E067;
	Thu, 20 Apr 2023 08:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0C810E067;
 Thu, 20 Apr 2023 08:31:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3872F219E9;
 Thu, 20 Apr 2023 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681979476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d5LLcZ/ZHNGFxh//MSqK26EWXRNfAu5m+9j4N7ZXrZE=;
 b=GE82LF5Gwigva2S+Q6YVsPBM53vSIc8D0ICIxD3xTZ/hawgUgBPEgvWEZK4Vgbb+aXVNdL
 ZH6Z8YXwPedLxK+LFJw0r62sFCdq47V040Ru5tFMr8yo/KyqkQxTZ2mGC+1yFtdZrcAWVB
 MeZZ6PlpCEaL6Rq9w07ZwDvnqIhqA04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681979476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d5LLcZ/ZHNGFxh//MSqK26EWXRNfAu5m+9j4N7ZXrZE=;
 b=X+tQeHBOz3P7p8CSsIkvu+LDJ4lRYBI4fZyOXtq/Vf6e1L4luCMGpmNA2NbreD9/ervl4U
 bX21xv45B1LLRQAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF2B91333C;
 Thu, 20 Apr 2023 08:31:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZfhuOVP4QGRpcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 08:31:15 +0000
Date: Thu, 20 Apr 2023 10:31:14 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230420083114.GA17651@linux-uq9g>
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

this is this week's PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-04-20-2:
Short summary of fixes pull:

 * nouveau: fix dma-resv timeout
 * rockchip: fix suspend/resume
 * sched: fix timeout handling
The following changes since commit 5603effb8295ada8419408d038a34ca89d658229:

  Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes (2023-04-12 12:01:32 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-04-20-2

for you to fetch changes up to b63a553e8f5aa6574eeb535a551817a93c426d8c:

  drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume (2023-04-17 23:40:40 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * nouveau: fix dma-resv timeout
 * rockchip: fix suspend/resume
 * sched: fix timeout handling

----------------------------------------------------------------
John Ogness (1):
      drm/nouveau: fix incorrect conversion to dma_resv_wait_timeout()

Sascha Hauer (2):
      drm/rockchip: vop2: fix suspend/resume
      drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume

Vitaly Prosyak (1):
      drm/sched: Check scheduler ready before calling timeout handling

 drivers/gpu/drm/nouveau/nouveau_gem.c        | 18 ++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  4 ++++
 drivers/gpu/drm/scheduler/sched_main.c       |  3 ++-
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
