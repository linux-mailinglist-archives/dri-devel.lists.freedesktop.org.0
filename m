Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53A83157C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541E10E726;
	Thu, 18 Jan 2024 09:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F77810E726
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:07:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2955921F27;
 Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
 b=wCRqiS2FT5DlK/XBOZq/Y/aofvjkJ90BvT9JIzxP8Kkt1P/OAurUHHoiWaZGIWm9VwJ9Ws
 /wfeztu4ps8gsGZetQjd4Bgplg5C8Eri31Xm2IHYbHm1Vp35q5CUNS9Ju21P/awo15n9C0
 yL8cRoYEiYoinrZ0Apv8S8dY03pdLMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705568843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
 b=/EsrBqyma2ccwOy0BgftxYHJcJjtEb2RlGwNAmwilboO64yBhfktLBSOkeGePmSJ1kMuXo
 yDfBrhGtUQ1BKYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
 b=wCRqiS2FT5DlK/XBOZq/Y/aofvjkJ90BvT9JIzxP8Kkt1P/OAurUHHoiWaZGIWm9VwJ9Ws
 /wfeztu4ps8gsGZetQjd4Bgplg5C8Eri31Xm2IHYbHm1Vp35q5CUNS9Ju21P/awo15n9C0
 yL8cRoYEiYoinrZ0Apv8S8dY03pdLMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705568843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QnvhJQPs+b8QWsB2oyvuRQ9Rd3DMaDHQ1+xP5TTdklI=;
 b=/EsrBqyma2ccwOy0BgftxYHJcJjtEb2RlGwNAmwilboO64yBhfktLBSOkeGePmSJ1kMuXo
 yDfBrhGtUQ1BKYBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5B5813874;
 Thu, 18 Jan 2024 09:07:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id P0KFNkrqqGWIMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 09:07:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH v2 0/3] video: Simplify Kconfig options
Date: Thu, 18 Jan 2024 10:05:25 +0100
Message-ID: <20240118090721.7995-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace CONFIG_VIDEO_CMDLINE and CONFIG_VIDEO_NOMODESET by the single
option CONFIG_VIDEO. Select the latter for DRM or fbdev. Both original
options used to be selected in most cases, so this change simplifies
the Kconfig rules.

Since commit ca6c080eef42 ("arch/parisc: Detect primary video device
from device instance") architecture helpers for fbdev do not longer
require fbdev in their implementation and could be used for non-fbdev
code as well. Eventually guarding them with CONFIG_VIDEO will make
them available to any subsystem.

v2:
	* support CONFIG_FB_CORE=m via IS_ENABLED() (kernel test robot)

Thomas Zimmermann (3):
  video/cmdline: Introduce CONFIG_VIDEO for video= parameter
  video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
  video/nomodeset: Select nomodeset= parameter with CONFIG_VIDEO

 drivers/gpu/drm/Kconfig           |  3 +--
 drivers/staging/sm750fb/Kconfig   |  1 -
 drivers/video/Kconfig             |  5 +----
 drivers/video/Makefile            |  3 +--
 drivers/video/cmdline.c           |  2 ++
 drivers/video/fbdev/Kconfig       | 37 -------------------------------
 drivers/video/fbdev/core/Kconfig  |  2 +-
 drivers/video/fbdev/core/fbmem.c  |  2 --
 drivers/video/fbdev/geode/Kconfig |  3 ---
 include/linux/fb.h                |  7 ------
 include/video/cmdline.h           |  8 ++-----
 11 files changed, 8 insertions(+), 65 deletions(-)


base-commit: 05b317e8457c8e2bd1a797c9440ec07b7f341584
-- 
2.43.0

