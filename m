Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4B6A086B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C8E10EB52;
	Thu, 23 Feb 2023 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002A510EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97FC25D2C0;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0JS/4q/pVACiykOJ0orYWAsvU/uzBB1N8Ewl6t3Cvk=;
 b=B8fIIZQlswqUw4YxAXSqLXGANaJv9tKnCQQSDc9xIXxXpWKiQJQtLD7IAAP/a020hVZPLf
 4qeyJBirkMLcPFd+EG2SYfNOtF4qxNdSHrH8K50qN2ZhtCW6TIG+ddVSRRRErzZM6hCQAV
 LcrZvERrmzwJMB9lK5c1TrMBQEZVgzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0JS/4q/pVACiykOJ0orYWAsvU/uzBB1N8Ewl6t3Cvk=;
 b=+JnbIP0nVyVUfHcbsNVMcjoCiNBOolnauh74RebORSSWyPWp1hCd3AwKfFAXgDVNU45HbO
 W2KJw82u3Lz3moCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77539139C7;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oNUxHGJZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 1/7] drm/gma500: Remove unnecessary include statements
Date: Thu, 23 Feb 2023 13:17:27 +0100
Message-Id: <20230223121733.12549-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223121733.12549-1-tzimmermann@suse.de>
References: <20230223121733.12549-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements from framebuffer.c. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/framebuffer.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index f471e0cb7298..df4dbc509f68 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -5,23 +5,10 @@
  *
  **************************************************************************/
 
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/pfn_t.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/tty.h>
 
-#include <drm/drm.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
@@ -29,8 +16,6 @@
 #include "framebuffer.h"
 #include "gem.h"
 #include "psb_drv.h"
-#include "psb_intel_drv.h"
-#include "psb_intel_reg.h"
 
 static const struct drm_framebuffer_funcs psb_fb_funcs = {
 	.destroy = drm_gem_fb_destroy,
-- 
2.39.2

