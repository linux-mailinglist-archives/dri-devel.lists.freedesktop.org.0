Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bm7IfGapWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02441DA755
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6569D10E501;
	Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jekOrfp0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xPtWV9TS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jekOrfp0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xPtWV9TS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A6D10E501
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A7335BD59;
 Mon,  2 Mar 2026 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEOAzPcJCoPQ6zF/ZSigtvSgprkS1B4aqek8WMiTgkI=;
 b=jekOrfp0T93DPfJYcJFXYPm0jCI9JhVe/wAHkggmJQwM2P+9QhPQvkdlzHb5WNPY32w5dm
 rd4Xj28eZP/My4SO0IY7L7qHw3fhlXjcRGf1IwOOzGV7Fz4YN9V/imdFiIqnYOcLZ95rXl
 hTUK5ddV+zttqksEFssZ654FPyjen6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEOAzPcJCoPQ6zF/ZSigtvSgprkS1B4aqek8WMiTgkI=;
 b=xPtWV9TScaHHorOr6FL0CuMOAQG1MCfuax7YdMH/Umq7tZYuvhrTpZmc/uzYIvooeSzW8z
 FsvYYDVWkwAYjOCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jekOrfp0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xPtWV9TS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEOAzPcJCoPQ6zF/ZSigtvSgprkS1B4aqek8WMiTgkI=;
 b=jekOrfp0T93DPfJYcJFXYPm0jCI9JhVe/wAHkggmJQwM2P+9QhPQvkdlzHb5WNPY32w5dm
 rd4Xj28eZP/My4SO0IY7L7qHw3fhlXjcRGf1IwOOzGV7Fz4YN9V/imdFiIqnYOcLZ95rXl
 hTUK5ddV+zttqksEFssZ654FPyjen6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEOAzPcJCoPQ6zF/ZSigtvSgprkS1B4aqek8WMiTgkI=;
 b=xPtWV9TScaHHorOr6FL0CuMOAQG1MCfuax7YdMH/Umq7tZYuvhrTpZmc/uzYIvooeSzW8z
 FsvYYDVWkwAYjOCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E77753EA69;
 Mon,  2 Mar 2026 14:12:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MgBRN+uapWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:12:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/13] vc,fbcon,fonts: Proper handling of font data
Date: Mon,  2 Mar 2026 15:08:34 +0100
Message-ID: <20260302141255.518657-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E02441DA755
X-Rspamd-Action: no action

Provide helpers for handling console font data. Update consoles and VT.

VT's vc_state stores font data as a plain byte array of glphys. Fbcon,
newport_con and the kernel's internal fonts store the glyph data as an
array of plain bytes plus a hidden header for reference counting, check
sums and buffer sizes. The reference counting only works for user-space
fonts but not for internal fonts. Font-data handling is duplicated in
several places. Most of the font handling is open-coded and mixed up with
VT's plain glyph arrays.

To address these issues, add proper handling of font data to all involved
components: struct vc_font for font state in VC; a font data type for the
consoles. Then implement interfaces for handling font data one by one.

Patch 1 prepares the fbdev interface.

Patches 2 to 4 prepare VT's font handling.

Patches 5 to 13 refactor fbcon and newport_con to use clean interfaces for
their fonts.

Fbcon has long been a source of problems and bug reports. [1] With its
confusing implementation, it is hard to find the cause of these bugs.
Cleaning up the fbcon code will hopefully help with resolving bug reports
in the future.

The series has been tested with fbcon under DRM's bochs driver by changing
fonts at runtime using the setfont utility. [2] The changes to newport_con
have only been tested to compile.

v2:
- keep declaring the internal fonts in the public header file (Helge)
- rebase and clean up

[1] https://lore.kernel.org/all/6992c84c.a70a0220.2c38d7.00e8.GAE@google.com/
[2] https://www.man7.org/linux/man-pages/man8/setfont.8.html

Thomas Zimmermann (13):
  fbdev: Declare src parameter of fb_pad_ helpers as constant
  vt: Remove trailing whitespaces
  vt: Store font in struct vc_font
  vt: Calculate font-buffer size with vc_font_size()
  lib/fonts: Remove trailing whitespaces
  lib/fonts: Remove FNTCHARCNT()
  lib/fonts: Store font data as font_data_t; update consoles
  lib/fonts: Read font size with font_data_size()
  lib/fonts: Compare font data for equality with font_data_is_equal()
  lib/fonts: Manage font-data lifetime with font_data_get/_put()
  lib/fonts: Create font_data_t from struct console_font with
    font_data_import()
  lib/fonts: Store font data for user space with font_data_export()
  lib/fonts: Remove internal symbols and macros from public header file

 drivers/video/console/newport_con.c |  61 +++----
 drivers/video/fbdev/core/bitblit.c  |  11 +-
 drivers/video/fbdev/core/fbcon.c    | 194 +++++++----------------
 drivers/video/fbdev/core/fbcon.h    |   8 +-
 drivers/video/fbdev/core/fbmem.c    |   6 +-
 include/linux/console_struct.h      |  59 ++++++-
 include/linux/fb.h                  |  10 +-
 include/linux/font.h                | 115 +++++++++-----
 lib/fonts/font.h                    |  38 +++++
 lib/fonts/font_10x18.c              |   2 +-
 lib/fonts/font_6x10.c               |   3 +-
 lib/fonts/font_6x11.c               |   2 +-
 lib/fonts/font_6x8.c                |   3 +-
 lib/fonts/font_7x14.c               |   2 +-
 lib/fonts/font_8x16.c               |   3 +-
 lib/fonts/font_8x8.c                |   2 +-
 lib/fonts/font_acorn_8x8.c          |   4 +-
 lib/fonts/font_mini_4x6.c           |  10 +-
 lib/fonts/font_pearl_8x8.c          |   2 +-
 lib/fonts/font_sun12x22.c           |   3 +-
 lib/fonts/font_sun8x16.c            |   3 +-
 lib/fonts/font_ter10x18.c           |   4 +-
 lib/fonts/font_ter16x32.c           |   4 +-
 lib/fonts/fonts.c                   | 236 +++++++++++++++++++++++++++-
 24 files changed, 518 insertions(+), 267 deletions(-)
 create mode 100644 lib/fonts/font.h


base-commit: e57ac53f3ef90826a0b5b7cdf7f1e742a2aa1e9b
-- 
2.53.0

