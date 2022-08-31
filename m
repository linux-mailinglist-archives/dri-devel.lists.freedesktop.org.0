Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8135A85AF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 20:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098310E4EB;
	Wed, 31 Aug 2022 18:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802F510E4E6;
 Wed, 31 Aug 2022 18:33:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AAF322127;
 Wed, 31 Aug 2022 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661970792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8zhJNbuHBiMdGM8xu5MdwGFNU+wLrVr3NlIf0x71kpw=;
 b=NLYASDNvrnsUdcgdR70yFOkuKhSFLtg9O7UAU1Xk+AWew/MOB9/FXRdu/DAoiqkJ7pQ4Sk
 nHNYzu7F9sW9Il6sRfZQU7NXiHD/Jgm4GdO11hF2ZPZroWZF2XdZrY8F8cLd0hhCX7/+D3
 cO7L62PM9r4/c6L4z3fRage6MlJM4WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661970792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8zhJNbuHBiMdGM8xu5MdwGFNU+wLrVr3NlIf0x71kpw=;
 b=NevTRDV2ckw/yoyJkMsk5+BYmJrxM4wnC9zJshPh3PUKbWZvIDJVNV6JHxCy6gDQlX3dVi
 88SrULiD7BfTh8Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3CD61332D;
 Wed, 31 Aug 2022 18:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H7dhMmepD2NrPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Aug 2022 18:33:11 +0000
Date: Wed, 31 Aug 2022 20:33:10 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <Yw+pZnEbPxkJ1nHa@linux-uq9g.fritz.box>
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

only a single fix from drm-misc this week.

Best regards
Thomas

drm-misc-fixes-2022-08-31:
Short summary of fixes pull:

 * dma-buf/dma-resv: Fence-handling fix
The following changes since commit 6b04ce966a738ecdd9294c9593e48513c0dc90aa:

  nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf (2022-08-23 18:00:12 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-08-31

for you to fetch changes up to a3f7c10a269d5b77dd5822ade822643ced3057f0:

  dma-buf/dma-resv: check if the new fence is really later (2022-08-25 13:10:30 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * dma-buf/dma-resv: Fence-handling fix

----------------------------------------------------------------
Christian König (1):
      dma-buf/dma-resv: check if the new fence is really later

 drivers/dma-buf/dma-resv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
