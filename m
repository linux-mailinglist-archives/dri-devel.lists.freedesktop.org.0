Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14148852B6E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52D110E0E9;
	Tue, 13 Feb 2024 08:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404410E192;
 Tue, 13 Feb 2024 08:44:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D5B7220BF;
 Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B49771329E;
 Tue, 13 Feb 2024 08:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0A7iKtYry2VOFwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Feb 2024 08:44:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/8] staging/fbtft: Include <linux/backlight.h>
Date: Tue, 13 Feb 2024 09:42:20 +0100
Message-ID: <20240213084403.20995-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213084403.20995-1-tzimmermann@suse.de>
References: <20240213084403.20995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 1D5B7220BF
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolved the proxy include via <linux/fb.h>, which does not require the
backlight header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/fbtft/fb_ssd1351.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index b8d55aa8c5c75..72172e870007e 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-- 
2.43.0

