Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276D6D1C04
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240410F15F;
	Fri, 31 Mar 2023 09:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EAE10F151
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91FAF219E2;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=THVDIzxfv+axPfaNnFDnYiZYOvM2JA4pGYw+Lk8Hr3k=;
 b=bcPbu9bRnFVQli9TYWvqZ1MpyzGGhN5lIk/59C5/FPxzO8UtsdgdEtHzZvuK6xqRhpRuZy
 Tw8MaOzvaF6ZLvede3kjvNWjIQkmCUFnXmZJkw03qGlJ/vf2LqoYM7FLdfZuIimYsC6kjn
 XTZesz71JKLuDXlDfpOucmDLSZ+rG4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=THVDIzxfv+axPfaNnFDnYiZYOvM2JA4pGYw+Lk8Hr3k=;
 b=iuQEkjaqS89C0ZKcvrR+UQBi6iKQr5XZNamdW+TvIHZbq+acdliD7x34ZGbCKX+9YahhmF
 RemTG79PRMeEGUAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EB49133B6;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lbHPGYSmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 00/15] fbdev: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:22:59 +0200
Message-Id: <20230331092314.2209-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The trailing whitespaces are annoying. So remove them. No
functional changes. Some of the patches has already been
acked by Helge.

Thomas Zimmermann (15):
  fbdev/68328fb: Remove trailing whitespaces
  fbdev/atmel_lcdfb: Remove trailing whitespaces
  fbdev/cg14: Remove trailing whitespaces
  fbdev/controlfb: Remove trailing whitespaces
  fbdev/g364fb: Remove trailing whitespaces
  fbdev/hgafb: Remove trailing whitespaces
  fbdev/hpfb: Remove trailing whitespaces
  fbdev/macfb: Remove trailing whitespaces
  fbdev/maxinefb: Remove trailing whitespaces
  fbdev/p9100: Remove trailing whitespaces
  fbdev/platinumfb: Remove trailing whitespaces
  fbdev/sa1100fb: Remove trailing whitespaces
  fbdev/stifb: Remove trailing whitespaces
  fbdev/valkyriefb: Remove trailing whitespaces
  fbdev/vfb: Remove trailing whitespaces

 drivers/video/fbdev/68328fb.c     |  12 +--
 drivers/video/fbdev/atmel_lcdfb.c |   2 +-
 drivers/video/fbdev/cg14.c        |   2 +-
 drivers/video/fbdev/controlfb.c   |  34 +++----
 drivers/video/fbdev/g364fb.c      |   6 +-
 drivers/video/fbdev/hgafb.c       |  36 +++----
 drivers/video/fbdev/hpfb.c        |   8 +-
 drivers/video/fbdev/macfb.c       |  10 +-
 drivers/video/fbdev/maxinefb.c    |   2 +-
 drivers/video/fbdev/p9100.c       |   4 +-
 drivers/video/fbdev/platinumfb.c  |  30 +++---
 drivers/video/fbdev/sa1100fb.c    |  32 +++---
 drivers/video/fbdev/stifb.c       | 156 +++++++++++++++---------------
 drivers/video/fbdev/valkyriefb.c  |  14 +--
 drivers/video/fbdev/vfb.c         |  10 +-
 15 files changed, 179 insertions(+), 179 deletions(-)

-- 
2.40.0

