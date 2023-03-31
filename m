Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECC6D1C08
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148A210F16A;
	Fri, 31 Mar 2023 09:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5E10F162
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 594D721B2C;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1JUY7hQ9yooHzfyDwSWt/fVH2cK5biziQnSLuCJhyM=;
 b=hrUvJ2giiDTxjpWoMtOJczQnrFE7Lg4XFcJYjGV+1VdflN3rTunvuuh4l7CrEk8m3bzLc1
 D0h4VgtdQSU4JOXo4gVl0QFm6HocpW6k0Apd1KeNTtmPB2Udh/qKBAQgHx/0nszsqQ8Sa4
 RNSmbTTNRmRQp5vahDqaaVUL4mdDgRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1JUY7hQ9yooHzfyDwSWt/fVH2cK5biziQnSLuCJhyM=;
 b=LApDcHIMetVVGQ2UgdJ+YUNvHkOpToS6aYUcIQCaaA6zXK0pomMp2z+PtSF9rKERLR19Fm
 hSBmrSZylHsdfrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A731133B6;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MK9PDYWmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 05/15] fbdev/g364fb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:04 +0200
Message-Id: <20230331092314.2209-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
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

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/g364fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 05837a3b985c..c5b7673ddc6c 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -6,7 +6,7 @@
  *
  *  This driver is based on tgafb.c
  *
- *	Copyright (C) 1997 Geert Uytterhoeven 
+ *	Copyright (C) 1997 Geert Uytterhoeven
  *	Copyright (C) 1995  Jay Estabrook
  *
  *  This file is subject to the terms and conditions of the GNU General Public
@@ -28,7 +28,7 @@
 #include <asm/io.h>
 #include <asm/jazz.h>
 
-/* 
+/*
  * Various defines for the G364
  */
 #define G364_MEM_BASE   0xe4400000
@@ -125,7 +125,7 @@ static const struct fb_ops g364fb_ops = {
  *
  *  This call looks only at xoffset, yoffset and the FB_VMODE_YWRAP flag
  */
-static int g364fb_pan_display(struct fb_var_screeninfo *var, 
+static int g364fb_pan_display(struct fb_var_screeninfo *var,
 			      struct fb_info *info)
 {
 	if (var->xoffset ||
-- 
2.40.0

