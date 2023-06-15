Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF673172A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B310E4D3;
	Thu, 15 Jun 2023 11:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36F310E4CE;
 Thu, 15 Jun 2023 11:40:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C7681FD98;
 Thu, 15 Jun 2023 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686829211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Et3jOQsnWEEhqn9bjTn9Wq0rgWI8b9aJ7r29PM21EkM=;
 b=WxlF0NPXHAvP7v2Q6uopIwsm+eKCQrYyggYth0bRy8R9D5R06HFtUez5yujeH1JRXPtsNv
 HUikNvRrPb00UxmOgyB8U4jHfaOQ+ACkEt+tCPtyFzd/2SKeYwD6G1SSmVFBTu2oIPCMx1
 ctGLwIqotTS2VVhmgUhTQXQ5T9CFl7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686829211;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Et3jOQsnWEEhqn9bjTn9Wq0rgWI8b9aJ7r29PM21EkM=;
 b=6/f97z6HkOGGcNAVp1VWya9/ErNk6w4csA9q/bImnVOj1UbiZoGp4JASRD2KQlu/L9V1Wj
 E9uCctIc0NWLmKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4F7513467;
 Thu, 15 Jun 2023 11:40:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bBjuNpr4imReGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 11:40:10 +0000
Date: Thu, 15 Jun 2023 13:40:09 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20230615114009.GA27261@linux-uq9g>
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

here's the release cycles first PR from drm-misc-next-fixes. It's just
one fix and a backmerge.

Best regards
Thomas

drm-misc-next-fixes-2023-06-15:
Short summary of fixes pull:

 * Fix fbdev initializer macros
The following changes since commit 901bdf5ea1a836400ee69aa32b04e9c209271ec7:

  Merge tag 'amd-drm-next-6.5-2023-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-06-15 14:11:22 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-06-15

for you to fetch changes up to cf683e8870bd4be0fd6b98639286700a35088660:

  fbdev: Use /* */ comment in initializer macro (2023-06-15 10:45:17 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * Fix fbdev initializer macros

----------------------------------------------------------------
Thomas Zimmermann (2):
      Merge drm/drm-next into drm-misc-next-fixes
      fbdev: Use /* */ comment in initializer macro

 include/linux/fb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
