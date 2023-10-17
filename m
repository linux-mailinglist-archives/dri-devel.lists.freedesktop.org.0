Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC937CBDC0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CBA10E282;
	Tue, 17 Oct 2023 08:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4F810E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8A6E1FF04;
 Tue, 17 Oct 2023 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pheySroV9NkIOOjiykpwlQyhuinTPAC2cg6MoWxthZI=;
 b=01e+3MUYO7WRl+9jVPUZheofAU5FA6FYNkXP2D2MQz0WqwH196k15dto4bbmuAa094g/2m
 80bIDTO1veWFotqUjEvyDiCaoBLfAcyliGTi1wNWBmINl4MGYqWDcAKN53joVuCFQ4+u0W
 SJzrfve9yg3YE1bVO7UuzL7Jz0F5OMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pheySroV9NkIOOjiykpwlQyhuinTPAC2cg6MoWxthZI=;
 b=a6P+pTh9+zvil5C/OHMrjbnQxKHcV5K8ssOxcoo6e2gThd1CiiAPpTRYrGTTuKyEssiGzF
 fnkv1fsNa6xUqTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B7D213584;
 Tue, 17 Oct 2023 08:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EUctHaZHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 00/12] drm/ast: Align VGA register names with documentation
Date: Tue, 17 Oct 2023 10:31:56 +0200
Message-ID: <20231017083653.10063-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.90
X-Spamd-Result: default: False [0.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the names of ast's VGA registers to follow the documentation
and put all constants into a separate header. The update make the
driver source code more grep-able. No functional changes.

Thomas Zimmermann (12):
  drm/ast: Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W
  drm/ast: Rename AST_IO_MISC_PORT_WRITE to AST_IO_VGAMR_W
  drm/ast: Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER
  drm/ast: Rename AST_IO_SEQ_PORT to AST_IO_VGASRI
  drm/ast: Rename AST_IO_DAC_INDEX_READ to AST_IO_VGADRR
  drm/ast: Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR
  drm/ast: Rename AST_IO_DAC_DATA to AST_IO_VGAPDR
  drm/ast: Rename AST_IO_GR_PORT to AST_IO_VGAGRI
  drm/ast: Rename AST_IO_CRTC_PORT to AST_IO_VGACRI
  drm/ast: Rename AST_IO_INPUT_STATUS1_READ to AST_IO_VGAIR1_R
  drm/ast: Rename AST_IO_MISC_PORT_READ to AST_IO_VGAMR_R
  drm/ast: Move register constants to ast_reg.h

 drivers/gpu/drm/ast/ast_dp.c    |  70 +++++------
 drivers/gpu/drm/ast/ast_dp501.c |  38 +++---
 drivers/gpu/drm/ast/ast_drv.h   |  83 +------------
 drivers/gpu/drm/ast/ast_i2c.c   |  20 ++--
 drivers/gpu/drm/ast/ast_main.c  |  24 ++--
 drivers/gpu/drm/ast/ast_mm.c    |   4 +-
 drivers/gpu/drm/ast/ast_mode.c  | 200 ++++++++++++++++----------------
 drivers/gpu/drm/ast/ast_post.c  |  26 ++---
 drivers/gpu/drm/ast/ast_reg.h   |  99 ++++++++++++++++
 9 files changed, 292 insertions(+), 272 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_reg.h

-- 
2.42.0

