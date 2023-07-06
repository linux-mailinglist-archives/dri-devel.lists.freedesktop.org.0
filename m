Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241B749AA1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 13:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D6810E4E5;
	Thu,  6 Jul 2023 11:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD8F10E4E4;
 Thu,  6 Jul 2023 11:31:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59A0B21EAB;
 Thu,  6 Jul 2023 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688643076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1mm03RUE1dzDQGfclJZ8k25krGorDfnWO9NAoIuigJg=;
 b=JJ7UDKP9YHCl5PrI/4/bRuhG+faWjZLJgkPC6IsP5ZpW0wV/8HFySOuCeFAf9xxOYC58pv
 FBw7sfs6GjBBr9l+t4r1iCP9VPjcdg90ec7Tsbm5rDalTVPCO2ZdcEGyOrJY20uhxGLxZc
 Dy8cBDZI8mkQw8qTDg8JMKB+ROMi1hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688643076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1mm03RUE1dzDQGfclJZ8k25krGorDfnWO9NAoIuigJg=;
 b=6lqiIRt8sPuq6aaCjvWS+l7ud1LUN1wvaEMH6U9afq8D8F3jSKBbEhqLGs9WpQ2Si2de40
 KWZ8LDPeo08vmJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15C3C138EE;
 Thu,  6 Jul 2023 11:31:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mXw0BASmpmQ2GQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 11:31:16 +0000
Date: Thu, 6 Jul 2023 13:31:14 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230706112203.GA30555@linux-uq9g>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the weekly PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2023-07-06:
Short summary of fixes pull:

 * panel: Fix mode on Starry-ili9882t
The following changes since commit 861c249cd782cb9f2d5a881bbb32e8da7f0c1192:

  arch/sparc: Add module license and description for fbdev helpers (2023-06-29 13:30:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-07-06

for you to fetch changes up to 59bba51ec2a50e3dc5c3ee80f0a23207346303ff:

  drm/panel: Fine tune Starry-ili9882t panel HFP and HBP (2023-06-29 17:35:34 -0700)

----------------------------------------------------------------
Short summary of fixes pull:

 * panel: Fix mode on Starry-ili9882t

----------------------------------------------------------------
Cong Yang (1):
      drm/panel: Fine tune Starry-ili9882t panel HFP and HBP

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
